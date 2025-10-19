import os
import pickle
import numpy as np
import sqlite3

EMB_PATH = os.getenv("PRODUCTS_EMB_PATH", "products_embeddings.pkl")
DB_PATH = os.getenv("DB_PATH", "../database/supermarket.db")

def verify_embeddings():
    """Verify the products embeddings file is valid and matches the database"""
    
    print(f"🔍 Verifying embeddings file: {EMB_PATH}")
    print("=" * 60)
    
    # 1. Load the pickle file
    try:
        with open(EMB_PATH, "rb") as f:
            data = pickle.load(f)
        print("✓ Successfully loaded pickle file")
    except Exception as e:
        print(f"✗ Failed to load pickle file: {e}")
        return False
    
    # 2. Check structure
    required_keys = ["model", "ids", "matrix"]
    for key in required_keys:
        if key not in data:
            print(f"✗ Missing required key: {key}")
            return False
    print(f"✓ Contains all required keys: {required_keys}")
    
    # 3. Check model info
    model = data["model"]
    print(f"✓ Model: {model}")
    
    # 4. Check IDs
    ids = data["ids"]
    if not isinstance(ids, np.ndarray):
        print(f"✗ IDs should be numpy array, got {type(ids)}")
        return False
    print(f"✓ IDs array shape: {ids.shape}, dtype: {ids.dtype}")
    print(f"  - ID range: {ids.min()} to {ids.max()}")
    print(f"  - Number of products: {len(ids)}")
    
    # 5. Check matrix
    matrix = data["matrix"]
    if not isinstance(matrix, np.ndarray):
        print(f"✗ Matrix should be numpy array, got {type(matrix)}")
        return False
    print(f"✓ Embeddings matrix shape: {matrix.shape}, dtype: {matrix.dtype}")
    print(f"  - Embedding dimension: {matrix.shape[1]}")
    
    # 6. Check dimensions match
    if len(ids) != matrix.shape[0]:
        print(f"✗ IDs count ({len(ids)}) doesn't match matrix rows ({matrix.shape[0]})")
        return False
    print(f"✓ IDs count matches matrix rows: {len(ids)}")
    
    # 7. Check L2 normalization
    norms = np.linalg.norm(matrix, axis=1)
    if not np.allclose(norms, 1.0, atol=1e-5):
        print(f"⚠ Vectors may not be L2-normalized (norms range: {norms.min():.6f} to {norms.max():.6f})")
    else:
        print(f"✓ All vectors are L2-normalized (norms ≈ 1.0)")
    
    # 8. Check for NaN or Inf values
    if np.any(np.isnan(matrix)) or np.any(np.isinf(matrix)):
        print(f"✗ Matrix contains NaN or Inf values")
        return False
    print(f"✓ No NaN or Inf values in matrix")
    
    # 9. Compare with database if available
    try:
        con = sqlite3.connect(DB_PATH)
        cur = con.cursor()
        cur.execute("SELECT COUNT(*) FROM products")
        db_count = cur.fetchone()[0]
        con.close()
        
        print(f"✓ Database has {db_count} products")
        if db_count != len(ids):
            print(f"⚠ WARNING: Database count ({db_count}) doesn't match embeddings count ({len(ids)})")
            print(f"  You may need to regenerate embeddings")
        else:
            print(f"✓ Database count matches embeddings count")
    except Exception as e:
        print(f"⚠ Could not verify against database: {e}")
    
    # 10. Sample similarity check
    if len(matrix) >= 2:
        print("\n📊 Sample similarity check:")
        # Compute cosine similarity between first product and all others
        similarities = matrix @ matrix[0]
        top_5_indices = np.argsort(similarities)[::-1][:5]
        
        print(f"  Most similar to product ID {ids[0]}:")
        for idx in top_5_indices:
            print(f"    - Product ID {ids[idx]}: similarity = {similarities[idx]:.4f}")
    
    print("\n" + "=" * 60)
    print("✅ All checks passed! Embeddings file looks good.")
    return True

if __name__ == "__main__":
    verify_embeddings()
