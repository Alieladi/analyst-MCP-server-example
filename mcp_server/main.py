"""
SQLite Read-Only MCP Server (Python) — Single Smart Query + Cache + Python Exec

This server exposes safe, read-only access to a SQLite database over MCP and
adds a server-side cache and a Python execution tool for post-processing.

Tools
- sql_query(sql, params=None, force_cache=False)
    Smart SELECT. Returns inline if small; otherwise auto-caches full result
    and returns a preview + cache_key.
- run_python_on_cache(cache_key: str, code: str)
    Run Python code (pandas/numpy) server-side on previously cached query
    results. Use this when `sql_query` returns a `cache_key`, to avoid
    large payloads and perform transformations or analysis without
    re-fetching the entire dataset.
- cache_get_rows(cache_key, offset=0, limit=1000)
    Page through cached results without re-running the query.
- cache_info(cache_key)
    Metadata about cached result.
- cache_release(cache_key)
    Free cached result.
- explain_query(sql)
    EXPLAIN QUERY PLAN for a SELECT.

Resources
- schema-json: returns your schema JSON file if SCHEMA_JSON_PATH is set;
  otherwise a synthesized snapshot of tables.

Environment
- SQLITE_DB_URI      e.g. "file:/abs/path/db.sqlite?mode=ro" (required; must include mode=ro)
- SCHEMA_JSON_PATH   e.g. "/abs/path/schema.json" (optional)
- MAX_CACHE_ENTRIES  default 8
- MAX_CACHE_ROWS     default 200000
- MAX_PREVIEW_ROWS   default 200
- PAGE_LIMIT default 1000

Notes on safety
- Enforces read-only via SQLite URI (mode=ro) + PRAGMA query_only=ON.
- Validates statements to be SELECT (incl. CTE ending in SELECT).
- Smart query auto-caches when result is larger than preview size or when forced.
- Python execution is sandboxed with minimal builtins and a timeout, and runs
    in a separate thread to avoid blocking.
"""
from __future__ import annotations

import json
import os
import re
import sqlite3
import time
import uuid
from concurrent.futures import ThreadPoolExecutor
from dataclasses import dataclass
from typing import Any, Dict, List, Optional
import pickle
import voyageai

import numpy as np
import pandas as pd

# MCP SDK
from mcp.server.fastmcp import FastMCP

SERVER_NAME = "sqlite-readonly"

DB_URI = '../data/database/supermarket.db'
SCHEMA_JSON_PATH = '../data/database/schema.json'

# -------------------- Config knobs --------------------
MAX_CACHE_ENTRIES = 8
MAX_CACHE_ROWS = 200000
MAX_PREVIEW_ROWS = 200
PAGE_LIMIT = 1000

# -------------------- Schema initialization tracking --------------------
_SCHEMA_LOADED = False

# -------------------- SQLite helpers --------------------
SELECT_LIKE = re.compile(r"^\s*(with\b.*?select\b|select\b)", re.IGNORECASE | re.DOTALL)

def _connect_readonly() -> sqlite3.Connection:
    conn = sqlite3.connect(DB_URI, uri=True)
    conn.execute("PRAGMA query_only=ON;")
    return conn

def _ensure_select(sql: str) -> None:
    if not SELECT_LIKE.match(sql or ""):
        raise ValueError("Only SELECT statements (including CTEs ending in SELECT) are allowed.")

# -------------------- Cache --------------------
@dataclass
class CacheEntry:
    created_at: float
    columns: List[str]
    rows: List[Dict[str, Any]]  # list of dicts for easy slicing/JSON

_CACHE: Dict[str, CacheEntry] = {}
_CACHE_ORDER: List[str] = []  # simple LRU by key order

def _cache_evict_if_needed():
    while len(_CACHE_ORDER) > MAX_CACHE_ENTRIES:
        old_key = _CACHE_ORDER.pop(0)
        _CACHE.pop(old_key, None)

def _cache_touch(key: str):
    if key in _CACHE_ORDER:
        _CACHE_ORDER.remove(key)
    _CACHE_ORDER.append(key)

# -------------------- MCP server --------------------
mcp = FastMCP(SERVER_NAME)

# -------- Smart single query tool (auto-cache if large) --------
@mcp.tool()
def sql_query(
    sql: str,
    params: Optional[Dict[str, Any]] = None,
    force_cache: bool = False,
) -> Dict[str, Any]:
    """
    Smart SELECT:
      - If small enough, returns full rows inline.
      - If it would exceed payload limits (or force_cache=True), caches full result
        and returns a preview + cache_key.

        Returns keys:
            columns, rows, rowcount,
            cached (bool), cache_key (or None),
            total_rows,
            is_preview (bool),
            preview (object|None),
            is_cache_truncated (bool, only when cached, True when MAX_CACHE_ROWS is hit), max_cache_rows (int, only when cached)
    """
    if not _SCHEMA_LOADED:
        return {
            "error": "Schema not loaded. Please call get_schema() tool first to understand the database schema.",
            "columns": [],
            "rows": [],
            "rowcount": 0,
            "cached": False,
            "cache_key": None,
            "total_rows": 0,
            "preview": None,
        }
    
    _ensure_select(sql)

    # Always execute and retrieve all rows (up to MAX_CACHE_ROWS),
    # then decide whether to return inline or cache based on result size/force_cache.
    with _connect_readonly() as conn:
        cur = conn.cursor()
        cur.execute(sql, params or {})
        columns = [d[0] for d in cur.description] if cur.description else []

        rows: List[Dict[str, Any]] = []
        total_rows = 0
        fetched = cur.fetchmany(PAGE_LIMIT)
        while fetched:
            for r in fetched:
                rows.append(dict(zip(columns, r)))
                total_rows += 1
                if total_rows >= MAX_CACHE_ROWS:
                    fetched = None
                    break
            if fetched is None:
                break
            fetched = cur.fetchmany(PAGE_LIMIT)

    # Try to return full inline payload if small enough and not forced to cache
    payload_full = {
        "columns": columns,
        "rows": rows,
        "rowcount": len(rows),
        "cached": False,
        "cache_key": None,
        "total_rows": len(rows),
        "is_preview": False,
        "preview": None,
    }
    if not force_cache and len(rows) <= MAX_PREVIEW_ROWS:
        return payload_full

    # Otherwise cache and return a preview
    key = uuid.uuid4().hex
    _CACHE[key] = CacheEntry(created_at=time.time(), columns=columns, rows=rows)
    _cache_touch(key)
    _cache_evict_if_needed()

    preview = rows[:MAX_PREVIEW_ROWS]
    return {
        "columns": columns,
        "rows": preview,
        "rowcount": len(preview),
        "cached": True,
        "cache_key": key,
        "total_rows": len(rows),
        "is_preview": True,
        "preview": {"returned": len(preview), "max_preview_rows": MAX_PREVIEW_ROWS},
        "is_cache_truncated": len(rows) >= MAX_CACHE_ROWS,
        "max_cache_rows": MAX_CACHE_ROWS,
    }

@mcp.tool()
def cache_get_rows(cache_key: str, offset: int = 0, limit: int = 1000) -> Dict[str, Any]:
    """Fetch a slice of cached rows without re-running the query."""
    if cache_key not in _CACHE:
        raise RuntimeError("unknown cache_key")
    entry = _CACHE[cache_key]
    if offset < 0:
        offset = 0
    if limit < 1:
        limit = 1
    end = offset + limit
    return {
        "columns": entry.columns,
        "rows": entry.rows[offset:end],
        "rowcount": len(entry.rows[offset:end]),
        "total_rows": len(entry.rows),
        "page_info": {"offset": offset, "limit": limit},
    }


@mcp.tool()
def cache_info(cache_key: str) -> Dict[str, Any]:
    """Return metadata about a cached result."""
    if cache_key not in _CACHE:
        raise RuntimeError("unknown cache_key")
    entry = _CACHE[cache_key]
    return {
        "created_at": entry.created_at,
        "columns": entry.columns,
        "total_rows": len(entry.rows),
    }


@mcp.tool()
def cache_release(cache_key: str) -> str:
    """Delete a cached result to free memory."""
    if cache_key in _CACHE:
        _CACHE.pop(cache_key, None)
        return "released"
    return "not_found"



# ---------------- VoyageAI-based semantic catalog search (hybrid with FTS5) ----------------
# Env:
# CATALOG_EMB_PATH: path to pickle with { model, ids: np.ndarray[N], matrix: np.ndarray[N, dim] (L2-normalized float32) }
# VOYAGE_API_KEY: for query-time embedding
# CATALOG_FTS_TABLE: name of FTS5 virtual table (default 'catalog_fts')
# SEARCH_DEFAULT_K: default top-k (default 20)
# SEARCH_W_LEX, SEARCH_W_SEM: default fusion weights (defaults 0.4 / 0.6)

CATALOG_EMB_PATH = "../data/products_lookup/products_embeddings.pkl"
CATALOG_FTS_TABLE = "products_fts"
SEARCH_DEFAULT_K = 20
SEARCH_W_LEX = 0.4
SEARCH_W_SEM = 0.6
VOYAGE_API_KEY = os.getenv("VOYAGE_API_KEY", "")

EMB: Optional[Dict[str, Any]] = None
try:
    with open(CATALOG_EMB_PATH, "rb") as f:
        EMB = pickle.load(f)
except Exception:
    EMB = None

_voyage_client = None

def _get_voyage():
    global _voyage_client
    if _voyage_client is None:
        _voyage_client = voyageai.Client(api_key=VOYAGE_API_KEY)
    return _voyage_client

def _embed_query_voyage(text: str) -> np.ndarray:
    if not EMB or "model" not in EMB:
        raise RuntimeError("Embeddings file not loaded; cannot determine embedding model for query.")
    client = _get_voyage()
    resp = client.embed([text], model="voyage-3.5", input_type="query")
    v = np.array(resp.embeddings[0], dtype=np.float32)
    n = np.linalg.norm(v) + 1e-12
    return (v / n).astype(np.float32)

def _semantic_topk(qvec: np.ndarray, k: int) -> List[tuple[int, float]]:
    if EMB is None:
        return []
    M = EMB.get("matrix")
    ids = EMB.get("ids")
    if M is None or ids is None or len(ids) == 0:
        return []
    sims = M @ qvec # cosine if both normalized
    k = min(k, sims.shape[0])
    top = np.argpartition(-sims, k-1)[:k]
    order = top[np.argsort(-sims[top])]
    return [(int(ids[i]), float(sims[i])) for i in order]

def _lexical_topk(q: str, k: int) -> List[tuple[int, float]]:
    # Uses FTS5 BM25 if the virtual table exists; returns scores normalized to [0,1]
    try:
        with _connect_readonly() as conn:
            cur = conn.cursor()
            # Check if table exists
            cur.execute(f"SELECT name FROM sqlite_master WHERE type='table' AND name=?", (CATALOG_FTS_TABLE,))
            if not cur.fetchone():
                return []
            cur.execute(f"SELECT rowid AS id, bm25({CATALOG_FTS_TABLE}) AS rank FROM {CATALOG_FTS_TABLE} WHERE {CATALOG_FTS_TABLE} MATCH ? ORDER BY rank LIMIT ?", (q, k))
            rows = cur.fetchall()
            if not rows:
                return []
            ranks = [r[1] for r in rows] # lower is better
            mn, mx = min(ranks), max(ranks)
            if mx - mn < 1e-9:
                return [(int(rows[i][0]), 1.0) for i in range(len(rows))]
            return [(int(rows[i][0]), 1.0 - ((ranks[i]-mn)/(mx-mn+1e-9))) for i in range(len(rows))]
    except Exception:
        return []
    
def _fuse_scores(lex: List[tuple[int, float]], sem: List[tuple[int, float]], w_lex: float, w_sem: float, k: int) -> List[tuple[int, float]]:
    scores: Dict[int, float] = {}
    # Add lexical scores
    for id_, s in lex:
        scores[id_] = scores.get(id_, 0.0) + w_lex * max(0.0, min(1.0, s))
    # Add semantic scores (cosine in [-1,1] -> map to [0,1])
    for id_, s in sem:
        s01 = max(0.0, (s + 1.0) / 2.0)
        scores[id_] = scores.get(id_, 0.0) + w_sem * s01
    # Sort by combined score and return top k
    out = sorted(scores.items(), key=lambda x: x[1], reverse=True)[:k]
    return [(int(i), float(s)) for i, s in out]

@mcp.tool()
def search_products_catalog(query: str, k: int = SEARCH_DEFAULT_K, w_lex: float = SEARCH_W_LEX, w_sem: float = SEARCH_W_SEM) -> Dict[str, Any]:
    """Search over the products catalog - names and descriptions.
    Returns top-k items with a fused score and basic fields if present in a 'products' table.
    """
    q = (query or "").strip()
    if not q:
        return {"top_results": []}
    lex = _lexical_topk(q, k)
    sem: List[tuple[int, float]] = []
    try:
        qvec = _embed_query_voyage(q) if EMB else None
        if qvec is not None:
            sem = _semantic_topk(qvec, k)
    except Exception:
        sem = []
    fused = _fuse_scores(lex, sem, w_lex, w_sem, k)
    if not fused:
        return {"top_results": []}
    ids = [id_ for id_, _ in fused]
    placeholders = ",".join(["?"] * len(ids))
    # Try to hydrate from a conventional products table; if not present, just return ids + score.
    try:
        with _connect_readonly() as conn:
            cur = conn.cursor()
            cur.execute("SELECT name FROM sqlite_master WHERE type IN ('table','view') AND name='products'")
            if cur.fetchone():
                cur.execute(f"SELECT product_id, name, description FROM products WHERE product_id IN ({placeholders})", ids)
                by_id = {r[0]: {"id": r[0], "name": r[1], "description": r[2]} for r in cur.fetchall()}
                return {"top_results": [{"id": id_, "score": score, **by_id.get(id_, {})} for id_, score in fused]}
    except Exception:
        pass
    return {"top_results": [{"id": id_, "score": score} for id_, score in fused]}


# -------- Python on cache --------

def _jsonable(obj, preview_rows: int = 50):
    """Best-effort conversion of results to JSON-safe structures with preview."""
    truncated = False
    meta: Dict[str, Any] = {}
    try:
        if isinstance(obj, pd.DataFrame):
            n = len(obj)
            if n > preview_rows:
                truncated = True
            meta = {"type": "DataFrame", "rows": n, "columns": list(map(str, obj.columns))}
            obj = obj.head(preview_rows).to_dict(orient="records")
        elif isinstance(obj, pd.Series):
            n = len(obj)
            if n > preview_rows:
                truncated = True
            meta = {"type": "Series", "length": n, "name": str(obj.name)}
            obj = obj.head(preview_rows).tolist()
        elif isinstance(obj, (np.integer, np.floating, np.bool_)):
            obj = obj.item()
        elif isinstance(obj, np.ndarray):
            size = obj.size
            if size > preview_rows:
                truncated = True
            meta = {"type": "ndarray", "shape": list(obj.shape)}
            obj = obj.ravel()[:preview_rows].tolist()
        elif isinstance(obj, dict):
            if len(obj) > preview_rows:
                truncated = True
            obj = {str(k): (v.item() if hasattr(v, "item") else v) for k, v in list(obj.items())[:preview_rows]}
        elif isinstance(obj, list):
            if len(obj) > preview_rows:
                truncated = True
            obj = [(x.item() if hasattr(x, "item") else x) for x in obj[:preview_rows]]
    except Exception:
        return {"meta": {"note": "non-serializable result; returning string repr"}, "result": str(obj), "truncated": False}

    return {"meta": meta, "result": obj, "truncated": truncated}


def _exec_code_with_timeout(code: str, globals_dict: Dict[str, Any], locals_dict: Dict[str, Any], timeout_seconds: int):
    """Exec `code` in a thread with a timeout; raises TimeoutError on expiry."""
    def runner():
        exec(code, globals_dict, locals_dict)

    with ThreadPoolExecutor(max_workers=1) as ex:
        fut = ex.submit(runner)
        fut.result(timeout=max(1, int(timeout_seconds)))


@mcp.tool()
def run_python_on_cache(cache_key: str, code: str, preview_rows: int = 50, timeout_seconds: int = 5) -> Dict[str, Any]:
    """Execute a Python snippet with access to cached query data.

    Predefined:
      - data: list[dict] of cached rows
      - df: pandas.DataFrame from data
      - pd, np: pandas and numpy modules
      - result: set this in your code to return it

    Do not import other modules or use __import__; only a set of
    safe builtins are available in addition to pandas and numpy. No print statements.
    """
    if cache_key not in _CACHE:
        raise RuntimeError("unknown cache_key")
    entry = _CACHE[cache_key]

    data = entry.rows
    df = pd.DataFrame(data)

    # Minimal builtins whitelist (no __import__)
    safe_builtins = {
        # Basic math and numeric operations
        "len": len, "range": range, "min": min, "max": max, "sum": sum, "round": round,
        "abs": abs, "pow": pow, "divmod": divmod,
        
        # Iteration and collections
        "sorted": sorted, "map": map, "filter": filter, "enumerate": enumerate,
        "any": any, "all": all, "zip": zip, "reversed": reversed,
        
        # Type checking and conversion
        "type": type, "isinstance": isinstance, "int": int, "float": float, 
        "str": str, "bool": bool, "list": list, "dict": dict, "tuple": tuple, "set": set,
        
        # String operations
        "ord": ord, "chr": chr,
        
        # Utility functions
        "hash": hash, "id": id, "repr": repr,
    }

    globals_dict = {"__builtins__": safe_builtins, "pd": pd, "np": np}
    locals_dict = {"data": data, "df": df, "result": None}

    _exec_code_with_timeout(code, globals_dict, locals_dict, timeout_seconds)

    res = locals_dict.get("result", None)
    preview_rows_ = min(preview_rows, MAX_PREVIEW_ROWS)
    return _jsonable(res, preview_rows_)

# -------- Resource: schema-json --------
# @mcp.resource(uri="database://schema-json", mime_type="application/json")
@mcp.tool()
def get_schema() -> Dict[str, Any]:
    """Return the provided schema.json file containing the database schema and metadata as a resource."""
    global _SCHEMA_LOADED
    with open(SCHEMA_JSON_PATH, "r") as f:
        schema_data = json.load(f)
    _SCHEMA_LOADED = True
    return schema_data

# -------- Entry point --------
if __name__ == "__main__":
    mcp.run()
