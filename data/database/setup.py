import sqlite3
import random
from datetime import datetime, timedelta
# from faker import Faker

# # Initialize Faker for generating realistic data
# fake = Faker()

# Connect to SQLite database
conn = sqlite3.connect('supermarket.db')
cursor = conn.cursor()

# Read and execute the SQL files
sql_files = ['create_schema.sql', 'generate_categories.sql', 'generate_products.sql']

for sql_file in sql_files:
    print(f"Executing {sql_file}...")
    with open(sql_file, 'r') as f:
        sql_script = f.read()
        cursor.executescript(sql_script)

print("Database schema and initial data for categories and products created successfully!")

# ============================================
# GENERATE TRANSACTIONS
# ============================================

def generate_transactions(num_transactions=5000):
    """Generate realistic transactions over the past year"""
    
    # Get all product IDs
    cursor.execute('SELECT product_id, price FROM products')
    products = cursor.fetchall()
    product_ids = [p[0] for p in products]
    product_prices = {p[0]: p[1] for p in products}
    
    # Generate transactions over past year
    end_date = datetime.now()
    start_date = end_date - timedelta(days=365)
    
    transactions_data = []
    transaction_items_data = []
    
    for i in range(num_transactions):
        # Random date/time in the past year
        # Weight towards weekends and evenings
        random_days = random.randint(0, 365)
        trans_date = start_date + timedelta(days=random_days)
        
        # Shopping patterns: more traffic on weekends and 4pm-8pm
        if trans_date.weekday() in [5, 6]:  # Weekend
            hour = random.choices(range(8, 22), weights=[1,1,2,3,4,5,6,6,5,4,3,2,1,1])[0]
        else:  # Weekday
            hour = random.choices(range(8, 22), weights=[1,1,1,1,2,3,5,7,6,5,3,2,1,1])[0]
        
        minute = random.randint(0, 59)
        trans_datetime = trans_date.replace(hour=hour, minute=minute, second=random.randint(0, 59))
        
        # Number of items per transaction (1-8, weighted towards 3-4)
        num_items = random.choices(range(1, 9), weights=[5, 10, 20, 25, 20, 10, 7, 3])[0]
        
        # Select random products
        selected_products = random.sample(product_ids, num_items)
        
        # Calculate total
        total_amount = 0
        for product_id in selected_products:
            quantity = random.choices([1, 2, 3, 4], weights=[60, 25, 10, 5])[0]
            price = product_prices[product_id]
            item_total = price * quantity
            total_amount += item_total
            
            transaction_items_data.append((
                i + 1,  # transaction_id (will be inserted first)
                product_id,
                quantity,
                price
            ))
        
        transactions_data.append((trans_datetime.isoformat(), round(total_amount, 2)))
        
        if (i + 1) % 1000 == 0:
            print(f"Generated {i + 1} transactions...")
    
    # Insert transactions
    cursor.executemany('''
        INSERT INTO transactions (timestamp, total_amount)
        VALUES (?, ?)
    ''', transactions_data)
    
    print(f"Inserted {len(transactions_data)} transactions!")
    
    # Insert transaction items
    cursor.executemany('''
        INSERT INTO transaction_items (transaction_id, product_id, quantity, price_at_purchase)
        VALUES (?, ?, ?, ?)
    ''', transaction_items_data)
    
    print(f"Inserted {len(transaction_items_data)} transaction items!")
    
    conn.commit()

# ============================================
# GENERATE INVENTORY
# ============================================

def generate_inventory():
    """Generate inventory levels for all products"""
    
    cursor.execute('SELECT product_id FROM products')
    product_ids = [row[0] for row in cursor.fetchall()]
    
    inventory_data = []
    for product_id in product_ids:
        # Random stock levels (0-500, weighted towards 50-200)
        stock_level = random.choices(
            range(0, 501, 10),
            weights=[2] + [5]*5 + [10]*15 + [8]*10 + [5]*10 + [2]*10
        )[0]
        
        # Last updated within past 30 days
        days_ago = random.randint(0, 30)
        last_updated = datetime.now() - timedelta(days=days_ago)
        
        inventory_data.append((product_id, stock_level, last_updated.isoformat()))
    
    cursor.executemany('''
        INSERT INTO inventory (product_id, quantity_in_stock, last_updated)
        VALUES (?, ?, ?)
    ''', inventory_data)
    
    conn.commit()
    print(f"Generated inventory for {len(inventory_data)} products!")

# ============================================
# MAIN EXECUTION
# ============================================

if __name__ == '__main__':
    print("Starting data generation...")
    print("=" * 50)
    
    # # Generate additional products
    # print("\n1. Generating products...")
    # num_added = generate_products()
    
    # Check total products
    cursor.execute('SELECT COUNT(*) FROM products')
    total_products = cursor.fetchone()[0]
    print(f"Total products in database: {total_products}")
    
    # Generate transactions
    print("\n2. Generating transactions...")
    generate_transactions(50000)
    
    # Generate inventory
    print("\n3. Generating inventory...")
    generate_inventory()
    
    # Print summary statistics
    print("\n" + "=" * 50)
    print("DATABASE SUMMARY")
    print("=" * 50)
    
    cursor.execute('SELECT COUNT(*) FROM categories')
    print(f"Categories: {cursor.fetchone()[0]}")
    
    cursor.execute('SELECT COUNT(*) FROM products')
    print(f"Products: {cursor.fetchone()[0]}")
    
    cursor.execute('SELECT COUNT(*) FROM transactions')
    print(f"Transactions: {cursor.fetchone()[0]}")
    
    cursor.execute('SELECT COUNT(*) FROM transaction_items')
    print(f"Transaction Items: {cursor.fetchone()[0]}")
    
    cursor.execute('SELECT COUNT(*) FROM inventory')
    print(f"Inventory Records: {cursor.fetchone()[0]}")
    
    cursor.execute('SELECT MIN(timestamp), MAX(timestamp) FROM transactions')
    date_range = cursor.fetchone()
    print(f"Transaction Date Range: {date_range[0][:10]} to {date_range[1][:10]}")
    
    cursor.execute('SELECT AVG(total_amount) FROM transactions')
    print(f"Average Transaction Amount: ${cursor.fetchone()[0]:.2f}")
    
    conn.close()
    print("\nDatabase generation complete!")
    print("Database saved as: supermarket.db")