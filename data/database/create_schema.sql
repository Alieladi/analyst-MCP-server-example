-- Supermarket Database Schema
-- SQLite Database with Products (long lookup table), Categories, Transactions, Transaction_Items, and Inventory

-- Categories Table (flat structure)
CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name TEXT NOT NULL UNIQUE
);

-- Products Table (long lookup table with ~1000 items)
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    brand TEXT,
    description TEXT,
    category_id INTEGER NOT NULL,
    price REAL NOT NULL,
    unit_size TEXT,
    barcode TEXT UNIQUE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Create full-text search index for products (for lexical search)
CREATE VIRTUAL TABLE products_fts USING fts5(
    name, 
    brand, 
    description,
    content=products,
    content_rowid=product_id
);

-- Transactions Table 
CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
    timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_amount REAL NOT NULL
);

-- Transaction Items Table (line items - many products per transaction)
CREATE TABLE transaction_items (
    transaction_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    transaction_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    price_at_purchase REAL NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Inventory Table (current stock levels)
CREATE TABLE inventory (
    inventory_id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_id INTEGER NOT NULL UNIQUE,
    quantity_in_stock INTEGER NOT NULL DEFAULT 0,
    last_updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Indexes for better query performance
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_products_price ON products(price);
CREATE INDEX idx_transactions_timestamp ON transactions(timestamp);
CREATE INDEX idx_transaction_items_transaction ON transaction_items(transaction_id);
CREATE INDEX idx_transaction_items_product ON transaction_items(product_id);
CREATE INDEX idx_inventory_product ON inventory(product_id);

-- Trigger to keep FTS index in sync with products table
CREATE TRIGGER products_fts_insert AFTER INSERT ON products BEGIN
    INSERT INTO products_fts(rowid, name, brand, description)
    VALUES (new.product_id, new.name, new.brand, new.description);
END;

CREATE TRIGGER products_fts_update AFTER UPDATE ON products BEGIN
    UPDATE products_fts 
    SET name = new.name, brand = new.brand, description = new.description
    WHERE rowid = new.product_id;
END;

CREATE TRIGGER products_fts_delete AFTER DELETE ON products BEGIN
    DELETE FROM products_fts WHERE rowid = old.product_id;
END;