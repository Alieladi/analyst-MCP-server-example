import os, sqlite3, numpy as np, pickle
import voyageai

DB = os.getenv("DB_PATH", "../database/supermarket.db")
OUT = os.getenv("PRODUCTS_EMB_PATH", "products_embeddings.pkl")
MODEL = os.getenv("EMB_MODEL", "voyage-3.5")

client = voyageai.Client(api_key=os.getenv("VOYAGE_API_KEY"))

def fetch():
    con = sqlite3.connect(DB)
    cur = con.cursor()
    cur.execute("""SELECT product_id, name, brand, description FROM products ORDER BY product_id""")
    rows = cur.fetchall()
    con.close()
    return rows

def format_text(name, brand, desc):
    parts = [name, brand, desc or ""]
    return "\n".join(p for p in parts if p).strip()

def embed_batch(texts):
    res = client.embed(
            texts, model=MODEL, input_type="document"
        ).embeddings
    M = np.array(res, dtype=np.float32)
    # L2-normalize so cosine = dot product
    M /= (np.linalg.norm(M, axis=1, keepdims=True) + 1e-12)
    return M

def main():
    rows = fetch()
    ids = np.array([int(r[0]) for r in rows], dtype=np.int64)
    texts = [format_text(r[1], r[2], r[3]) for r in rows]
    # small dataset => single batch
    matrix = embed_batch(texts)
    payload = {"model": MODEL, "ids": ids, "matrix": matrix}
    with open(OUT, "wb") as f:
        pickle.dump(payload, f)
    print(f"Saved embeddings for {len(ids)} items to {OUT}")

if __name__ == "__main__":
    main()
