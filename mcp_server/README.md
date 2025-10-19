# Supermarket MCP Server (uv)

This folder contains the MCP server that exposes a read‑only SQLite database with a few tools:

- sql_query(sql, params=None, force_cache=False)
- cache_get_rows(cache_key, offset=0, limit=1000)
- run_python_on_cache(cache_key, code, preview_rows=50)
- get_schema()
- search_products_catalog(query, k=20)

## Requirements
- uv installed (https://docs.astral.sh/uv/)
- Python 3.13 (uv will auto-manage)

## Install dependencies

Option A: single command, no virtualenv activation needed

```bash
uv sync --directory .
```

Option B: create and activate a venv explicitly

```bash
uv venv --python 3.13
source .venv/bin/activate
uv sync
```

## Data paths
The server expects the SQLite DB and schema at:
- ../data/database/supermarket.db
- ../data/database/schema.json

If you move files, update `DB_URI` and `SCHEMA_JSON_PATH` in `main.py` accordingly.

## Optional environment variables
- VOYAGE_API_KEY — required for semantic search in `search_products_catalog`.

## Run the server locally (dev)

```bash
uv run main.py
```

The server runs under MCP and is intended to be launched by an MCP client.

## Configure Claude Desktop
Add an entry to your `mcpServers` config (adjust absolute path):

```json
{
  "mcpServers": {
    "supermarket": {
      "command": "uv",
      "args": [
        "--directory",
        "/absolute/path/to/your/checkout/supermarket/mcp_server",
        "run",
        "main.py"
      ],
      "env": {
        "VOYAGE_API_KEY": "YOUR_VOYAGE_API_KEY"
      }
    }
  }
}
```

Notes
- Use the full path to `uv` if it’s not on your PATH.
- No need to activate a venv when using `uv --directory ... run`.

## Troubleshooting
- Module not found: ensure you ran `uv sync` in this `mcp_server` folder.
- Python version: `uv` can install 3.13 automatically; pin with `uv venv --python 3.13` if needed.
- Database not found: confirm the relative paths from this folder to `../data/database` exist.
- Semantic search empty: ensure `VOYAGE_API_KEY` is set and `products_embeddings.pkl` exists at `../data/products_lookup/`.
