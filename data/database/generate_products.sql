-- Insert Products (1000 products with varied descriptions)

-- Dairy Products
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Whole Milk', 'Organic Valley', 'Fresh organic whole milk from grass-fed cows, rich and creamy texture perfect for drinking or cooking', 1, 4.99, '1 gallon', '074350001001'),
('2% Reduced Fat Milk', 'Horizon', 'Smooth reduced fat milk with essential vitamins and minerals, great for the whole family', 1, 4.49, '1 gallon', '074350001002'),
('Skim Milk', 'Great Value', 'Fat-free milk fortified with vitamins A and D, excellent source of calcium', 1, 3.99, '1 gallon', '074350001003'),
('Chocolate Milk', 'TruMoo', 'Delicious chocolate flavored milk made with real cocoa, no high fructose corn syrup', 1, 3.49, '64 oz', '074350001004'),
('Almond Milk Unsweetened', 'Silk', 'Smooth almond milk with no added sugar, dairy-free and vegan friendly', 1, 3.99, '64 oz', '074350001005'),
('Oat Milk', 'Oatly', 'Creamy oat milk perfect for coffee and cereal, plant-based and sustainable', 1, 4.99, '64 oz', '074350001006'),
('Lactose Free Milk', 'Lactaid', 'Real milk without lactose, easy to digest with all the nutrition of regular milk', 1, 5.49, '64 oz', '074350001007'),
('Buttermilk', 'Darigold', 'Cultured low-fat buttermilk ideal for baking and cooking', 1, 3.29, '32 oz', '074350001008'),

('Cheddar Cheese Block', 'Tillamook', 'Sharp aged cheddar cheese with bold flavor, perfect for snacking or melting', 2, 6.99, '8 oz', '074350002001'),
('Mozzarella Shredded', 'Kraft', 'Pre-shredded mozzarella cheese great for pizza and pasta dishes', 2, 4.49, '8 oz', '074350002002'),
('Swiss Cheese Slices', 'Sargento', 'Deli-style Swiss cheese slices with nutty flavor and distinctive holes', 2, 5.49, '8 oz', '074350002003'),
('Cream Cheese', 'Philadelphia', 'Smooth and creamy cheese spread perfect for bagels and baking', 2, 3.99, '8 oz', '074350002004'),
('Parmesan Grated', 'BelGioioso', 'Authentic Italian parmesan cheese freshly grated for pasta and salads', 2, 7.99, '8 oz', '074350002005'),
('Blue Cheese Crumbles', 'Treasure Cave', 'Bold and tangy blue cheese perfect for salads and dips', 2, 4.99, '5 oz', '074350002006'),
('Pepper Jack Cheese', 'Boar''s Head', 'Monterey Jack cheese with spicy peppers for extra kick', 2, 6.49, '8 oz', '074350002007'),
('Brie Cheese Wheel', 'President', 'Soft-ripened French cheese with mild buttery flavor', 2, 8.99, '8 oz', '074350002008'),

('Greek Yogurt Plain', 'Fage', 'Thick and creamy Greek yogurt with high protein and no added sugar', 3, 5.99, '32 oz', '074350003001'),
('Vanilla Yogurt', 'Yoplait', 'Smooth vanilla yogurt with live and active cultures', 3, 0.79, '6 oz', '074350003002'),
('Strawberry Yogurt', 'Chobani', 'Delicious strawberry Greek yogurt made with real fruit', 3, 1.49, '5.3 oz', '074350003003'),
('Blueberry Yogurt', 'Dannon', 'Creamy blueberry yogurt packed with flavor', 3, 0.89, '6 oz', '074350003004'),
('Peach Yogurt', 'Oikos', 'Greek yogurt with sweet peach flavor and 15g protein', 3, 1.49, '5.3 oz', '074350003005'),
('Coconut Yogurt', 'So Delicious', 'Dairy-free coconut milk yogurt, vegan and delicious', 3, 1.99, '5.3 oz', '074350003006'),
('Yogurt Drink', 'Yakult', 'Probiotic fermented milk drink for digestive health', 3, 3.99, '5 pack', '074350003007'),
('Icelandic Yogurt', 'Siggi''s', 'Thick skyr-style yogurt with simple ingredients and high protein', 3, 1.79, '5.3 oz', '074350003008'),

('Salted Butter', 'Land O Lakes', 'Premium salted butter perfect for cooking and baking', 4, 4.99, '1 lb', '074350004001'),
('Unsalted Butter', 'Kerrygold', 'Irish grass-fed butter with rich golden color and creamy taste', 4, 5.49, '8 oz', '074350004002'),
('Margarine Spread', 'Country Crock', 'Vegetable oil spread perfect for spreading and cooking', 4, 3.49, '15 oz', '074350004007'),
('Whipped Butter', 'Challenge', 'Light and fluffy whipped butter easy to spread', 4, 4.49, '8 oz', '074350004008');

-- Produce
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Bananas', 'Fresh', 'Sweet yellow bananas rich in potassium, perfect healthy snack', 5, 0.59, 'per lb', '074350005001'),
('Apples Gala', 'Fresh', 'Crisp and sweet Gala apples great for eating fresh or baking', 5, 1.99, 'per lb', '074350005002'),
('Oranges Navel', 'Fresh', 'Seedless navel oranges packed with vitamin C and sweet juice', 5, 1.49, 'per lb', '074350005003'),
('Strawberries', 'Driscoll''s', 'Fresh sweet strawberries perfect for snacking or desserts', 5, 4.99, '1 lb', '074350005004'),
('Blueberries', 'Fresh', 'Plump juicy blueberries loaded with antioxidants', 5, 5.99, '6 oz', '074350005005'),
('Grapes Red Seedless', 'Fresh', 'Sweet crispy red grapes without seeds for easy snacking', 5, 2.99, 'per lb', '074350005006'),
('Watermelon', 'Fresh', 'Refreshing seedless watermelon perfect for summer', 5, 0.49, 'per lb', '074350005007'),
('Pineapple', 'Fresh', 'Tropical sweet pineapple with golden flesh', 5, 3.99, 'each', '074350005008'),
('Mango', 'Fresh', 'Ripe sweet mangoes with smooth texture and tropical flavor', 5, 1.99, 'each', '074350005009'),
('Avocado Hass', 'Fresh', 'Creamy Hass avocados perfect for guacamole and toast', 5, 1.49, 'each', '074350005010'),

('Tomatoes Roma', 'Fresh', 'Firm Roma tomatoes ideal for sauces and salads', 6, 1.99, 'per lb', '074350006001'),
('Lettuce Iceberg', 'Fresh', 'Crisp refreshing iceberg lettuce perfect for salads and sandwiches', 6, 2.49, 'each', '074350006002'),
('Spinach Baby', 'Fresh Express', 'Tender baby spinach leaves pre-washed and ready to eat', 6, 3.99, '10 oz', '074350006003'),
('Carrots', 'Fresh', 'Sweet crunchy carrots great for snacking or cooking', 6, 1.49, '2 lb', '074350006004'),
('Broccoli Crowns', 'Fresh', 'Fresh broccoli crowns packed with vitamins and fiber', 6, 2.99, 'per lb', '074350006005'),
('Bell Peppers Red', 'Fresh', 'Sweet red bell peppers rich in vitamin C', 6, 1.99, 'each', '074350006006'),
('Cucumbers', 'Fresh', 'Crisp refreshing cucumbers perfect for salads', 6, 0.99, 'each', '074350006007'),
('Onions Yellow', 'Fresh', 'Versatile yellow onions essential for cooking', 6, 0.99, 'per lb', '074350006008'),
('Potatoes Russet', 'Fresh', 'Starchy russet potatoes ideal for baking and mashing', 6, 0.69, 'per lb', '074350006009'),
('Garlic', 'Fresh', 'Aromatic fresh garlic bulbs for flavoring dishes', 6, 0.79, 'each', '074350006010'),

('Organic Bananas', 'Organic', 'Certified organic bananas grown without pesticides', 7, 0.79, 'per lb', '074350007001'),
('Organic Baby Carrots', 'Organic', 'Sweet organic baby carrots perfect for snacking', 7, 2.99, '1 lb', '074350007002'),
('Organic Mixed Greens', 'Organic', 'Blend of organic lettuce and greens ready to eat', 7, 4.99, '5 oz', '074350007003'),
('Organic Tomatoes', 'Organic', 'Vine-ripened organic tomatoes with rich flavor', 7, 3.99, 'per lb', '074350007004'),
('Organic Strawberries', 'Organic', 'Sweet organic strawberries pesticide-free', 7, 6.99, '1 lb', '074350007005');

-- Bakery
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('White Bread', 'Wonder', 'Soft white sandwich bread perfect for everyday meals', 8, 2.49, '20 oz', '074350008001'),
('Whole Wheat Bread', 'Nature''s Own', '100% whole wheat bread with hearty texture and nutty flavor', 8, 3.49, '20 oz', '074350008002'),
('Sourdough Loaf', 'Boudin', 'Authentic San Francisco sourdough with tangy flavor', 8, 4.99, '24 oz', '074350008003'),
('Multigrain Bread', 'Dave''s Killer Bread', 'Organic multigrain bread packed with seeds and grains', 8, 5.49, '27 oz', '074350008004'),
('French Baguette', 'Fresh Baked', 'Crusty French baguette perfect for sandwiches or dipping', 8, 2.99, 'each', '074350008005'),
('Ciabatta Rolls', 'Fresh Baked', 'Italian ciabatta rolls with light airy texture', 8, 3.99, '4 pack', '074350008006'),
('Rye Bread', 'Oroweat', 'Dense rye bread with distinctive flavor', 8, 3.99, '16 oz', '074350008007'),
('Gluten Free Bread', 'Udi''s', 'Soft gluten-free bread that tastes like regular bread', 8, 6.49, '12 oz', '074350008008'),

('Chocolate Croissants', 'Fresh Baked', 'Buttery flaky croissants filled with rich chocolate', 9, 3.99, '2 pack', '074350009001'),
('Plain Croissants', 'Fresh Baked', 'Classic French butter croissants with layers', 9, 2.99, '2 pack', '074350009002'),
('Blueberry Muffins', 'Fresh Baked', 'Moist blueberry muffins bursting with berries', 9, 4.99, '4 pack', '074350009003'),
('Chocolate Chip Muffins', 'Fresh Baked', 'Decadent muffins loaded with chocolate chips', 9, 4.99, '4 pack', '074350009004'),
('Cinnamon Rolls', 'Pillsbury', 'Sweet cinnamon rolls with cream cheese icing', 9, 3.49, '8 count', '074350009005'),
('Danish Pastries', 'Fresh Baked', 'Assorted fruit-filled Danish pastries', 9, 5.99, '4 pack', '074350009006'),
('Donuts Glazed', 'Krispy Kreme', 'Light fluffy glazed donuts melt in your mouth', 9, 7.99, '12 count', '074350009007'),
('Donuts Chocolate', 'Dunkin', 'Classic chocolate frosted donuts', 9, 6.99, '6 count', '074350009008'),

('Birthday Cake Vanilla', 'Fresh Baked', 'Classic vanilla cake with buttercream frosting perfect for celebrations', 10, 19.99, '8 inch', '074350010001'),
('Chocolate Cake', 'Fresh Baked', 'Rich chocolate layer cake with fudge frosting', 10, 19.99, '8 inch', '074350010002'),
('Cheesecake Plain', 'Fresh Baked', 'Creamy New York style cheesecake', 10, 14.99, '8 inch', '074350010003'),
('Carrot Cake', 'Fresh Baked', 'Moist carrot cake with cream cheese frosting and walnuts', 10, 17.99, '8 inch', '074350010004'),
('Cupcakes Assorted', 'Fresh Baked', 'Variety pack of decorated cupcakes', 10, 9.99, '6 pack', '074350010005');

-- Meat Products
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Ground Beef 80/20', 'Fresh', 'Fresh ground beef with 80% lean meat perfect for burgers', 11, 5.99, 'per lb', '074350011001'),
('Ground Beef 93/7', 'Fresh', 'Extra lean ground beef great for healthy cooking', 11, 7.99, 'per lb', '074350011002'),
('Ribeye Steak', 'Certified Angus', 'Premium marbled ribeye steak tender and flavorful', 11, 16.99, 'per lb', '074350011003'),
('Sirloin Steak', 'Fresh', 'Lean sirloin steak perfect for grilling', 11, 12.99, 'per lb', '074350011004'),
('Beef Roast Chuck', 'Fresh', 'Chuck roast ideal for slow cooking and pot roasts', 11, 7.99, 'per lb', '074350011005'),
('Beef Stew Meat', 'Fresh', 'Cubed beef perfect for stews and slow cooker meals', 11, 8.99, 'per lb', '074350011006'),
('T-Bone Steak', 'Fresh', 'Classic T-bone with tenderloin and strip steak', 11, 14.99, 'per lb', '074350011007'),

('Chicken Breasts Boneless', 'Perdue', 'Fresh boneless skinless chicken breasts lean and versatile', 12, 4.99, 'per lb', '074350012001'),
('Chicken Thighs Boneless', 'Tyson', 'Juicy boneless skinless chicken thighs great for grilling', 12, 3.99, 'per lb', '074350012002'),
('Whole Chicken', 'Fresh', 'Whole roasting chicken perfect for family dinner', 12, 2.99, 'per lb', '074350012003'),
('Chicken Wings', 'Fresh', 'Fresh chicken wings ideal for game day', 12, 3.99, 'per lb', '074350012004'),
('Chicken Drumsticks', 'Fresh', 'Meaty chicken drumsticks kids love', 12, 2.49, 'per lb', '074350012005'),
('Ground Chicken', 'Jennie-O', 'Lean ground chicken for healthy burgers and tacos', 12, 4.49, 'per lb', '074350012006'),
('Chicken Tenders', 'Fresh', 'Tender chicken breast strips ready to cook', 12, 5.99, 'per lb', '074350012007'),

('Pork Chops Bone-In', 'Fresh', 'Juicy bone-in pork chops perfect for pan frying', 13, 4.99, 'per lb', '074350013001'),
('Pork Chops Boneless', 'Smithfield', 'Lean boneless pork chops quick and easy to prepare', 13, 5.99, 'per lb', '074350013002'),
('Pork Tenderloin', 'Fresh', 'Tender lean pork tenderloin for elegant meals', 13, 6.99, 'per lb', '074350013003'),
('Ground Pork', 'Fresh', 'Fresh ground pork for sausages and meatballs', 13, 3.99, 'per lb', '074350013004'),
('Pork Ribs Baby Back', 'Fresh', 'Tender baby back ribs perfect for BBQ', 13, 6.99, 'per lb', '074350013005'),
('Bacon Thick Cut', 'Wright', 'Thick cut hickory smoked bacon extra crispy', 13, 7.99, '1 lb', '074350013006'),
('Bacon Regular', 'Oscar Mayer', 'Classic bacon perfect for breakfast', 13, 5.99, '12 oz', '074350013007'),
('Sausage Links Breakfast', 'Jimmy Dean', 'Savory pork breakfast sausage links', 13, 4.99, '12 oz', '074350013008'),

('Turkey Breast Deli', 'Boar''s Head', 'Premium oven roasted turkey breast sliced fresh', 14, 9.99, 'per lb', '074350014001'),
('Ham Deli Honey', 'Boar''s Head', 'Sweet honey ham perfect for sandwiches', 14, 8.99, 'per lb', '074350014002'),
('Roast Beef Deli', 'Boar''s Head', 'Tender roast beef sliced thin', 14, 11.99, 'per lb', '074350014003'),
('Salami Genoa', 'Boar''s Head', 'Italian Genoa salami with bold flavor', 14, 9.99, 'per lb', '074350014004'),
('Bologna', 'Oscar Mayer', 'Classic beef bologna for sandwiches', 14, 3.99, '16 oz', '074350014005'),
('Pastrami', 'Boar''s Head', 'Spiced pastrami with peppery crust', 14, 10.99, 'per lb', '074350014006');

-- Seafood
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Salmon Fillets Atlantic', 'Fresh', 'Fresh Atlantic salmon rich in omega-3 fatty acids', 15, 12.99, 'per lb', '074350015001'),
('Tilapia Fillets', 'Fresh', 'Mild white fish perfect for quick weeknight dinners', 15, 7.99, 'per lb', '074350015002'),
('Cod Fillets', 'Fresh', 'Flaky white cod ideal for fish and chips', 15, 9.99, 'per lb', '074350015003'),
('Tuna Steaks', 'Fresh', 'Thick tuna steaks perfect for searing', 15, 14.99, 'per lb', '074350015004'),
('Mahi Mahi Fillets', 'Fresh', 'Firm sweet mahi mahi great for grilling', 15, 11.99, 'per lb', '074350015005'),

('Shrimp Raw Large', 'Frozen', 'Large raw shrimp peeled and deveined', 16, 12.99, '1 lb', '074350016001'),
('Shrimp Cooked', 'Frozen', 'Fully cooked shrimp ready to eat', 16, 11.99, '1 lb', '074350016002'),
('Fish Sticks', 'Gorton''s', 'Crispy breaded fish sticks kids love', 16, 5.99, '24 oz', '074350016003'),
('Salmon Burgers', 'Trident', 'Wild caught salmon patties quick and healthy', 16, 7.99, '4 pack', '074350016004'),
('Tilapia Frozen', 'Frozen', 'Individually frozen tilapia fillets convenient', 16, 8.99, '2 lb', '074350016005'),

('Lobster Tails', 'Fresh', 'Fresh cold water lobster tails premium quality', 17, 19.99, 'per lb', '074350017001'),
('Crab Legs Snow', 'Frozen', 'Wild caught snow crab legs sweet and tender', 17, 24.99, '2 lb', '074350017002'),
('Scallops Sea', 'Fresh', 'Large sea scallops perfect for searing', 17, 18.99, 'per lb', '074350017003'),
('Mussels', 'Fresh', 'Live mussels in shell ready to steam', 17, 4.99, 'per lb', '074350017004'),
('Oysters Fresh', 'Fresh', 'Fresh shucked oysters on the half shell', 17, 14.99, 'per dozen', '074350017005');

-- Frozen Foods
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Lasagna Frozen', 'Stouffer''s', 'Classic meat lasagna with layers of pasta and cheese', 18, 8.99, '38 oz', '074350018001'),
('Mac and Cheese', 'Stouffer''s', 'Creamy macaroni and cheese comfort food', 18, 5.99, '20 oz', '074350018002'),
('Chicken Pot Pie', 'Marie Callender''s', 'Homestyle chicken pot pie with flaky crust', 18, 4.99, '15 oz', '074350018003'),
('Meatloaf Dinner', 'Boston Market', 'Traditional meatloaf with mashed potatoes', 18, 6.99, '16 oz', '074350018004'),
('Salisbury Steak', 'Hungry Man', 'Hearty Salisbury steak with gravy', 18, 4.49, '16 oz', '074350018005'),
('Chicken Alfredo', 'Lean Cuisine', 'Light chicken fettuccine alfredo', 18, 3.99, '9 oz', '074350018006'),
('Beef Burrito', 'El Monterey', 'Bean and beef burrito ready in minutes', 18, 5.99, '8 pack', '074350018007'),

('Pizza Pepperoni', 'DiGiorno', 'Rising crust pepperoni pizza tastes like delivery', 19, 7.99, '27 oz', '074350019001'),
('Pizza Supreme', 'Red Baron', 'Loaded supreme pizza with all the toppings', 19, 6.99, '22 oz', '074350019002'),
('Pizza Cheese', 'Tombstone', 'Classic cheese pizza simple and delicious', 19, 5.49, '20 oz', '074350019003'),
('Pizza Margherita', 'Newman''s Own', 'Thin crust margherita with fresh mozzarella', 19, 7.49, '15 oz', '074350019004'),
('Pizza Bagels', 'Bagel Bites', 'Mini pizza bagels perfect snack size', 19, 4.99, '9 count', '074350019005'),

('Ice Cream Vanilla', 'Breyers', 'Smooth vanilla ice cream made with real vanilla', 20, 4.99, '48 oz', '074350020001'),
('Ice Cream Chocolate', 'Häagen-Dazs', 'Rich Belgian chocolate ice cream', 20, 5.99, '14 oz', '074350020002'),
('Ice Cream Strawberry', 'Blue Bell', 'Sweet strawberry ice cream with real fruit', 20, 4.49, '48 oz', '074350020003'),
('Ice Cream Cookie Dough', 'Ben & Jerry''s', 'Vanilla ice cream loaded with cookie dough chunks', 20, 5.49, '16 oz', '074350020004'),
('Ice Cream Mint Chip', 'Breyers', 'Cool mint ice cream with chocolate chips', 20, 4.99, '48 oz', '074350020005'),
('Ice Cream Sandwiches', 'Klondike', 'Classic ice cream sandwiches with chocolate wafers', 20, 5.99, '6 pack', '074350020006'),
('Popsicles', 'Outshine', 'Fruit bars made with real fruit no artificial colors', 20, 4.49, '6 pack', '074350020007'),
('Frozen Yogurt', 'Yasso', 'Greek frozen yogurt bars high protein', 20, 5.99, '4 pack', '074350020008'),

('Frozen Broccoli', 'Birds Eye', 'Frozen broccoli florets fresh frozen at peak', 21, 2.49, '12 oz', '074350021001'),
('Frozen Mixed Vegetables', 'Green Giant', 'Blend of corn peas carrots and green beans', 21, 2.99, '16 oz', '074350021002'),
('Frozen Peas', 'Birds Eye', 'Sweet garden peas frozen fresh', 21, 1.99, '10 oz', '074350021003'),
('Frozen Corn', 'Green Giant', 'Sweet whole kernel corn', 21, 2.49, '16 oz', '074350021004'),
('Frozen Green Beans', 'Birds Eye', 'Cut green beans ready to cook', 21, 2.29, '12 oz', '074350021005'),
('Frozen Stir Fry Mix', 'Birds Eye', 'Asian vegetable blend perfect for stir fry', 21, 3.49, '16 oz', '074350021006');

-- Beverages
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Coca Cola', 'Coca-Cola', 'Classic Coke the real thing refreshing cola', 22, 1.99, '2 liter', '074350022001'),
('Pepsi', 'Pepsi', 'Bold and refreshing Pepsi cola', 22, 1.99, '2 liter', '074350022002'),
('Sprite', 'Coca-Cola', 'Crisp lemon-lime soda caffeine free', 22, 1.99, '2 liter', '074350022003'),
('Dr Pepper', 'Dr Pepper', 'Unique blend of 23 flavors', 22, 1.99, '2 liter', '074350022004'),
('Mountain Dew', 'Pepsi', 'Citrus soda with bold flavor and caffeine kick', 22, 1.99, '2 liter', '074350022005'),
('Root Beer', 'A&W', 'Classic creamy root beer made with aged vanilla', 22, 1.99, '2 liter', '074350022006'),
('Ginger Ale', 'Canada Dry', 'Crisp ginger ale perfect for mixing or sipping', 22, 1.99, '2 liter', '074350022007'),
('Diet Coke', 'Coca-Cola', 'Zero calorie cola with great taste', 22, 1.99, '2 liter', '074350022008'),

('Orange Juice', 'Tropicana', 'Not from concentrate 100% pure orange juice', 23, 4.99, '52 oz', '074350023001'),
('Apple Juice', 'Mott''s', '100% apple juice no added sugar', 23, 3.49, '64 oz', '074350023002'),
('Cranberry Juice', 'Ocean Spray', 'Cranberry juice cocktail tart and refreshing', 23, 4.49, '64 oz', '074350023003'),
('Grape Juice', 'Welch''s', '100% grape juice made from Concord grapes', 23, 3.99, '64 oz', '074350023004'),
('Lemonade', 'Simply', 'All natural lemonade made with real lemons', 23, 3.99, '52 oz', '074350023005'),
('Fruit Punch', 'Hawaiian Punch', 'Fruit punch with tropical flavors', 23, 2.99, '1 gallon', '074350023006'),
('Pineapple Juice', 'Dole', '100% pineapple juice tropical and sweet', 23, 3.99, '46 oz', '074350023007'),
('Tomato Juice', 'Campbell''s', 'Rich tomato juice perfect for Bloody Marys', 23, 3.49, '46 oz', '074350023008'),

('Spring Water', 'Aquafina', 'Purified drinking water crisp and clean', 24, 4.99, '24 pack', '074350024001'),
('Sparkling Water', 'Perrier', 'Naturally carbonated mineral water from France', 24, 1.49, '16.9 oz', '074350024002'),
('Flavored Water Lemon', 'Hint', 'Fruit-infused water with no sweeteners', 24, 1.79, '16 oz', '074350024003'),
('Coconut Water', 'Vita Coco', 'Natural hydrating coconut water electrolytes', 24, 2.99, '16.9 oz', '074350024004'),
('Enhanced Water', 'Vitaminwater', 'Nutrient enhanced water with vitamins', 24, 1.99, '20 oz', '074350024005'),
('Sparkling Water Lime', 'LaCroix', 'Lime flavored sparkling water zero calories', 24, 4.99, '12 pack', '074350024006'),

('Coffee Grounds', 'Folgers', 'Classic roast ground coffee smooth and rich', 25, 9.99, '30.5 oz', '074350025001'),
('Coffee Beans', 'Starbucks', 'Pike Place whole bean coffee medium roast', 25, 11.99, '12 oz', '074350025002'),
('Instant Coffee', 'Nescafe', 'Classic instant coffee quick and convenient', 25, 7.99, '7 oz', '074350025003'),
('Decaf Coffee', 'Maxwell House', 'Decaffeinated ground coffee full flavor', 25, 8.99, '29 oz', '074350025004'),
('Black Tea Bags', 'Lipton', 'Classic black tea perfect hot or iced', 25, 4.99, '100 count', '074350025005'),
('Green Tea Bags', 'Bigelow', 'Antioxidant-rich green tea smooth taste', 25, 5.49, '40 count', '074350025006'),
('Herbal Tea Chamomile', 'Celestial Seasonings', 'Soothing chamomile herbal tea caffeine free', 25, 4.49, '20 count', '074350025007'),
('Iced Tea Mix', 'Lipton', 'Sweetened iced tea mix makes 10 quarts', 25, 3.99, '28 oz', '074350025008');

-- Snacks
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Potato Chips Classic', 'Lay''s', 'Crispy potato chips with perfect salt classic taste', 26, 3.99, '10 oz', '074350026001'),
('Potato Chips BBQ', 'Lay''s', 'Barbecue flavored potato chips smoky and sweet', 26, 3.99, '10 oz', '074350026002'),
('Tortilla Chips', 'Tostitos', 'Restaurant style tortilla chips perfect for dipping', 26, 4.49, '13 oz', '074350026003'),
('Doritos Nacho', 'Doritos', 'Nacho cheese tortilla chips bold and cheesy', 26, 4.49, '11 oz', '074350026004'),
('Pretzels', 'Snyder''s', 'Crunchy pretzels perfectly salted', 26, 3.49, '16 oz', '074350026005'),
('Popcorn Microwave', 'Orville Redenbacher', 'Movie theater butter microwave popcorn', 26, 4.99, '6 pack', '074350026006'),
('Cheese Puffs', 'Cheetos', 'Crunchy cheese flavored puffs dangerously cheesy', 26, 3.99, '8 oz', '074350026007'),
('Veggie Chips', 'Terra', 'Root vegetable chips colorful and crunchy', 26, 4.99, '6 oz', '074350026008'),

('Chocolate Chip Cookies', 'Chips Ahoy', 'Classic chocolate chip cookies crunchy and sweet', 27, 3.99, '13 oz', '074350027001'),
('Oreos', 'Oreo', 'America''s favorite cookie chocolate with cream filling', 27, 4.49, '14 oz', '074350027002'),
('Graham Crackers', 'Honey Maid', 'Wholesome honey graham crackers for snacking', 27, 3.49, '14 oz', '074350027003'),
('Vanilla Wafers', 'Nilla', 'Light crispy vanilla wafers perfect for banana pudding', 27, 3.99, '11 oz', '074350027004'),
('Fig Newtons', 'Nabisco', 'Soft cookies filled with real fig', 27, 3.99, '10 oz', '074350027005'),
('Shortbread Cookies', 'Walkers', 'Pure butter shortbread from Scotland', 27, 4.99, '5.3 oz', '074350027006'),
('Ginger Snaps', 'Nabisco', 'Spicy ginger cookies with molasses', 27, 3.49, '16 oz', '074350027007'),

('M&Ms Milk Chocolate', 'Mars', 'Colorful milk chocolate candies with candy shell', 28, 1.49, '1.69 oz', '074350028001'),
('Snickers Bar', 'Mars', 'Chocolate bar with peanuts caramel and nougat satisfies', 28, 1.29, '1.86 oz', '074350028002'),
('Reese''s Cups', 'Hershey', 'Peanut butter cups milk chocolate perfection', 28, 1.49, '1.5 oz', '074350028003'),
('Skittles', 'Mars', 'Fruity chewy candies taste the rainbow', 28, 1.29, '2.17 oz', '074350028004'),
('Starburst', 'Mars', 'Fruit chews bursting with juicy flavor', 28, 1.29, '2.07 oz', '074350028005'),
('Twix', 'Mars', 'Cookie bars with caramel covered in chocolate', 28, 1.29, '1.79 oz', '074350028006'),
('KitKat', 'Hershey', 'Crispy wafers covered in chocolate break apart', 28, 1.29, '1.5 oz', '074350028007'),
('Hershey Bar', 'Hershey', 'Classic milk chocolate bar simple and delicious', 28, 1.29, '1.55 oz', '074350028008'),
('Sour Patch Kids', 'Mondelez', 'Sour then sweet chewy candy', 28, 1.99, '3.5 oz', '074350028009'),
('Swedish Fish', 'Mondelez', 'Soft and chewy fish-shaped candy', 28, 1.99, '3.5 oz', '074350028010'),

('Mixed Nuts', 'Planters', 'Deluxe mixed nuts with cashews almonds and pecans', 29, 8.99, '15 oz', '074350029001'),
('Peanuts Roasted', 'Planters', 'Dry roasted peanuts lightly salted', 29, 5.99, '16 oz', '074350029002'),
('Almonds', 'Blue Diamond', 'Roasted salted almonds crunchy and nutritious', 29, 7.99, '16 oz', '074350029003'),
('Cashews', 'Planters', 'Whole roasted cashews buttery and delicious', 29, 9.99, '12 oz', '074350029004'),
('Pistachios', 'Wonderful', 'Roasted and salted pistachios in shell', 29, 8.99, '16 oz', '074350029005'),
('Walnuts', 'Diamond', 'Shelled walnut halves great for baking', 29, 7.99, '16 oz', '074350029006'),
('Pecans', 'Fisher', 'Halved pecans perfect for pies and snacking', 29, 9.99, '8 oz', '074350029007'),
('Trail Mix', 'Nature Valley', 'Nuts dried fruit and chocolate chips energy boost', 29, 6.99, '26 oz', '074350029008');

-- Pantry Items
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Spaghetti', 'Barilla', 'Classic Italian spaghetti pasta cooks in 11 minutes', 30, 1.99, '16 oz', '074350030001'),
('Penne Pasta', 'Barilla', 'Penne rigate tube pasta holds sauce perfectly', 30, 1.99, '16 oz', '074350030002'),
('Fettuccine', 'Barilla', 'Wide flat fettuccine pasta for alfredo', 30, 1.99, '16 oz', '074350030003'),
('Macaroni Elbows', 'Barilla', 'Elbow macaroni perfect for mac and cheese', 30, 1.99, '16 oz', '074350030004'),
('Lasagna Noodles', 'Barilla', 'Wide lasagna sheets for layered pasta dishes', 30, 2.49, '16 oz', '074350030005'),
('Angel Hair', 'Barilla', 'Thin delicate angel hair pasta cooks quickly', 30, 1.99, '16 oz', '074350030006'),
('Rotini', 'Barilla', 'Spiral pasta great for pasta salads', 30, 1.99, '16 oz', '074350030007'),
('Ravioli Cheese', 'Buitoni', 'Fresh cheese ravioli refrigerated pasta', 30, 4.99, '9 oz', '074350030008'),

('White Rice Long Grain', 'Uncle Ben''s', 'Enriched long grain white rice fluffy texture', 31, 3.99, '2 lb', '074350031001'),
('Brown Rice', 'Uncle Ben''s', 'Whole grain brown rice nutty flavor and chewy', 31, 4.49, '2 lb', '074350031002'),
('Jasmine Rice', 'Dynasty', 'Aromatic jasmine rice from Thailand', 31, 5.99, '5 lb', '074350031003'),
('Basmati Rice', 'Royal', 'Long grain basmati rice fragrant and fluffy', 31, 6.99, '4 lb', '074350031004'),
('Instant Rice', 'Minute Rice', 'Instant white rice ready in 5 minutes', 31, 3.49, '28 oz', '074350031005'),
('Quinoa', 'Ancient Harvest', 'Organic quinoa superfood high in protein', 31, 7.99, '16 oz', '074350031006'),
('Couscous', 'Near East', 'Pearl couscous quick cooking side dish', 31, 3.99, '8.8 oz', '074350031007'),
('Oatmeal Steel Cut', 'Bob''s Red Mill', 'Hearty steel cut oats for breakfast', 31, 5.99, '24 oz', '074350031008'),

('Tomato Sauce', 'Hunt''s', 'Rich tomato sauce perfect base for pasta', 32, 1.49, '15 oz', '074350032001'),
('Diced Tomatoes', 'Hunt''s', 'Diced tomatoes in juice for soups and sauces', 32, 1.29, '14.5 oz', '074350032002'),
('Black Beans', 'Bush''s', 'Black beans ready to use in burritos and salads', 32, 1.19, '15 oz', '074350032003'),
('Kidney Beans', 'Bush''s', 'Dark red kidney beans great for chili', 32, 1.19, '15 oz', '074350032004'),
('Chickpeas', 'Bush''s', 'Garbanzo beans perfect for hummus', 32, 1.19, '15 oz', '074350032005'),
('Corn Whole Kernel', 'Green Giant', 'Sweet corn kernels packed at peak freshness', 32, 0.99, '15 oz', '074350032006'),
('Green Beans Cut', 'Del Monte', 'Tender cut green beans ready to heat', 32, 0.99, '14.5 oz', '074350032007'),
('Chicken Broth', 'Swanson', 'Rich chicken broth for soups and cooking', 32, 1.99, '32 oz', '074350032008'),
('Beef Broth', 'Swanson', 'Savory beef broth adds depth to recipes', 32, 1.99, '32 oz', '074350032009'),
('Vegetable Broth', 'Swanson', 'Vegetable broth for vegetarian cooking', 32, 1.99, '32 oz', '074350032010'),
('Tuna Chunk Light', 'StarKist', 'Chunk light tuna in water high protein', 32, 1.49, '5 oz', '074350032011'),
('Salmon Canned', 'Bumble Bee', 'Wild caught pink salmon bones removed', 32, 3.99, '5 oz', '074350032012'),
('Soup Chicken Noodle', 'Campbell''s', 'Classic chicken noodle soup comfort in a can', 32, 1.79, '10.75 oz', '074350032013'),
('Soup Tomato', 'Campbell''s', 'Creamy tomato soup perfect with grilled cheese', 32, 1.79, '10.75 oz', '074350032014'),

('Marinara Sauce', 'Prego', 'Traditional Italian marinara sauce with herbs', 33, 2.99, '24 oz', '074350033001'),
('Alfredo Sauce', 'Classico', 'Creamy parmesan alfredo sauce rich and indulgent', 33, 3.99, '15 oz', '074350033002'),
('Pesto Sauce', 'Classico', 'Basil pesto with pine nuts and parmesan', 33, 4.99, '8 oz', '074350033003'),
('Salsa Mild', 'Pace', 'Chunky salsa with tomatoes and peppers', 33, 3.49, '16 oz', '074350033004'),
('Salsa Medium', 'Tostitos', 'Medium heat restaurant style salsa', 33, 3.49, '15.5 oz', '074350033005'),
('BBQ Sauce', 'Sweet Baby Ray''s', 'Sweet and tangy barbecue sauce award winning', 33, 2.99, '18 oz', '074350033006'),
('Ketchup', 'Heinz', 'Tomato ketchup thick and rich America''s favorite', 33, 3.49, '32 oz', '074350033007'),
('Mustard Yellow', 'French''s', 'Classic yellow mustard for hot dogs and burgers', 33, 2.49, '20 oz', '074350033008'),
('Mayonnaise', 'Hellmann''s', 'Real mayonnaise made with cage-free eggs', 33, 4.99, '30 oz', '074350033009'),
('Ranch Dressing', 'Hidden Valley', 'Original ranch dressing creamy and tangy', 33, 3.99, '16 oz', '074350033010'),
('Italian Dressing', 'Wish-Bone', 'Zesty Italian dressing with herbs', 33, 3.49, '16 oz', '074350033011'),
('Soy Sauce', 'Kikkoman', 'Naturally brewed soy sauce essential for Asian cooking', 33, 3.99, '10 oz', '074350033012'),
('Hot Sauce', 'Tabasco', 'Original red hot sauce adds spicy kick', 33, 2.99, '5 oz', '074350033013'),
('Worcestershire Sauce', 'Lea & Perrins', 'Original Worcestershire sauce savory umami flavor', 33, 4.49, '10 oz', '074350033014');

-- Breakfast Items
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Corn Flakes', 'Kellogg''s', 'Classic crispy corn flakes toasted golden', 34, 4.49, '18 oz', '074350034001'),
('Frosted Flakes', 'Kellogg''s', 'Sugar frosted flakes they''re grrreat', 34, 4.99, '18 oz', '074350034002'),
('Cheerios', 'General Mills', 'Heart healthy whole grain oat cereal', 34, 4.99, '18 oz', '074350034003'),
('Honey Nut Cheerios', 'General Mills', 'Cheerios with real honey and almond flavor', 34, 4.99, '18 oz', '074350034004'),
('Raisin Bran', 'Kellogg''s', 'Crispy bran flakes with raisins high fiber', 34, 4.49, '18 oz', '074350034005'),
('Lucky Charms', 'General Mills', 'Frosted oat cereal with colorful marshmallows', 34, 4.99, '18 oz', '074350034006'),
('Fruit Loops', 'Kellogg''s', 'Sweetened multi-grain cereal fruit flavored loops', 34, 4.99, '18 oz', '074350034007'),
('Cinnamon Toast Crunch', 'General Mills', 'Crispy cereal squares coated with cinnamon sugar', 34, 4.99, '16 oz', '074350034008'),
('Granola', 'Nature Valley', 'Crunchy oats and honey granola', 34, 5.49, '16 oz', '074350034009'),
('Special K', 'Kellogg''s', 'Lightly sweetened rice and wheat flakes', 34, 4.49, '18 oz', '074350034010'),

('Oatmeal Instant Maple', 'Quaker', 'Instant oatmeal packets with maple brown sugar flavor', 35, 4.99, '10 count', '074350035001'),
('Oatmeal Old Fashioned', 'Quaker', 'Old fashioned rolled oats hearty and wholesome', 35, 4.49, '42 oz', '074350035002'),
('Oatmeal Quick', 'Quaker', 'Quick cooking oats ready in 1 minute', 35, 4.49, '42 oz', '074350035003'),
('Cream of Wheat', 'Cream of Wheat', 'Hot wheat cereal smooth and creamy', 35, 4.99, '28 oz', '074350035004'),
('Grits Instant', 'Quaker', 'Quick grits ready in minutes Southern style', 35, 3.99, '22 oz', '074350035005'),

('Pancake Mix', 'Aunt Jemima', 'Original pancake and waffle mix just add water', 36, 3.99, '32 oz', '074350036001'),
('Buttermilk Pancake Mix', 'Bisquick', 'Buttermilk baking mix for fluffy pancakes', 36, 4.49, '40 oz', '074350036002'),
('Maple Syrup', 'Aunt Jemima', 'Rich maple flavored syrup for pancakes and waffles', 36, 4.99, '24 oz', '074350036003'),
('Pure Maple Syrup', 'Log Cabin', '100% pure maple syrup from Vermont', 36, 12.99, '12 oz', '074350036004'),
('Waffle Mix', 'Krusteaz', 'Belgian waffle mix makes light crispy waffles', 36, 4.49, '28 oz', '074350036005'),
('French Toast Sticks', 'Eggo', 'Cinnamon French toast sticks ready to heat', 36, 3.99, '12 count', '074350036006'),
('Frozen Waffles', 'Eggo', 'Homestyle waffles crispy and golden', 36, 3.49, '10 count', '074350036007'),
('Frozen Pancakes', 'Eggo', 'Buttermilk pancakes heat and eat', 36, 3.49, '12 count', '074350036008');

-- Health Products
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Multivitamin', 'Centrum', 'Daily multivitamin with essential nutrients for adults', 37, 14.99, '100 count', '074350037001'),
('Vitamin C', 'Nature Made', 'Vitamin C 1000mg immune support', 37, 11.99, '100 count', '074350037002'),
('Vitamin D3', 'Nature Made', 'Vitamin D3 2000 IU bone and immune health', 37, 12.99, '100 count', '074350037003'),
('Calcium', 'Citracal', 'Calcium with vitamin D for strong bones', 37, 13.99, '120 count', '074350037004'),
('B Complex', 'Nature''s Bounty', 'B-complex vitamins for energy metabolism', 37, 10.99, '100 count', '074350037005'),
('Fish Oil', 'Nature Made', 'Omega-3 fish oil for heart health', 37, 16.99, '90 count', '074350037006'),
('Prenatal Vitamins', 'One A Day', 'Prenatal multivitamin with DHA and folic acid', 37, 17.99, '70 count', '074350037007'),

('Probiotics', 'Culturelle', 'Daily probiotic for digestive health 10 billion CFU', 38, 24.99, '30 count', '074350038001'),
('Fiber Supplement', 'Metamucil', 'Psyllium fiber supplement for regularity', 38, 19.99, '72 servings', '074350038002'),
('Glucosamine', 'Osteo Bi-Flex', 'Joint health supplement with glucosamine', 38, 29.99, '80 count', '074350038003'),
('Melatonin', 'Nature Made', 'Melatonin 5mg sleep support supplement', 38, 9.99, '90 count', '074350038004'),
('Turmeric', 'Nature''s Bounty', 'Turmeric with curcumin antioxidant support', 38, 14.99, '60 count', '074350038005'),
('Collagen', 'Vital Proteins', 'Collagen peptides powder for skin and joints', 38, 39.99, '20 oz', '074350038006'),

('Protein Powder Vanilla', 'Optimum Nutrition', 'Gold Standard whey protein 24g protein per serving', 39, 49.99, '2 lb', '074350039001'),
('Protein Powder Chocolate', 'Optimum Nutrition', 'Chocolate whey protein delicious and effective', 39, 49.99, '2 lb', '074350039002'),
('Protein Bars', 'Quest', 'High protein low carb bars 20g protein', 39, 24.99, '12 pack', '074350039003'),
('Protein Shake Ready', 'Premier Protein', 'Ready to drink protein shake 30g protein', 39, 19.99, '12 pack', '074350039004'),
('Plant Protein Powder', 'Vega', 'Plant-based protein powder vegan friendly', 39, 44.99, '18 oz', '074350039005'),
('Mass Gainer', 'Optimum Nutrition', 'Serious mass weight gainer high calorie', 39, 59.99, '6 lb', '074350039006');

-- Personal Care
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Shampoo Moisturizing', 'Pantene', 'Pro-V moisturizing shampoo for dry hair', 40, 6.99, '25.4 oz', '074350040001'),
('Shampoo Volumizing', 'Herbal Essences', 'Volumizing shampoo adds body and bounce', 40, 5.99, '13.5 oz', '074350040002'),
('Conditioner Smooth', 'Pantene', 'Smoothing conditioner for silky hair', 40, 6.99, '24 oz', '074350040003'),
('2-in-1 Shampoo', 'Head & Shoulders', 'Dandruff shampoo plus conditioner', 40, 7.99, '23.7 oz', '074350040004'),
('Hair Gel', 'Got2b', 'Ultra glued styling gel extreme hold', 40, 5.99, '6 oz', '074350040005'),
('Hairspray', 'Tresemme', 'Freeze hold hairspray all-day control', 40, 5.49, '11 oz', '074350040006'),
('Hair Dye Brown', 'L''Oreal', 'Excellence permanent hair color natural brown', 40, 8.99, '1 kit', '074350040007'),

('Body Wash Men', 'Old Spice', 'High endurance body wash for men fresh scent', 41, 5.99, '18 oz', '074350041001'),
('Body Wash Women', 'Dove', 'Deep moisture body wash gentle and nourishing', 41, 6.99, '22 oz', '074350041002'),
('Bar Soap', 'Dove', 'Beauty bar gentle cleanser moisturizes while cleansing', 41, 5.99, '8 pack', '074350041003'),
('Hand Soap Liquid', 'Softsoap', 'Antibacterial liquid hand soap kills 99.9% germs', 41, 3.49, '11.25 oz', '074350041004'),
('Body Lotion', 'Aveeno', 'Daily moisturizing lotion with colloidal oatmeal', 41, 8.99, '18 oz', '074350041005'),
('Deodorant Men', 'Old Spice', 'High endurance antiperspirant stick', 41, 4.99, '3 oz', '074350041006'),
('Deodorant Women', 'Secret', 'Clinical strength antiperspirant 48hr protection', 41, 7.99, '2.6 oz', '074350041007'),
('Body Spray', 'Axe', 'Body spray for men long lasting fragrance', 41, 5.99, '4 oz', '074350041008'),

('Toothpaste Whitening', 'Crest', '3D White toothpaste removes stains', 42, 4.99, '4.1 oz', '074350042001'),
('Toothpaste Sensitive', 'Sensodyne', 'Sensitivity protection toothpaste builds protection', 42, 5.99, '4 oz', '074350042002'),
('Toothbrush Manual', 'Colgate', 'Extra clean toothbrush medium bristles', 42, 2.99, '1 count', '074350042003'),
('Toothbrush Electric', 'Oral-B', 'Pro 1000 electric toothbrush rechargeable', 42, 49.99, '1 count', '074350042004'),
('Mouthwash', 'Listerine', 'Cool mint antiseptic mouthwash kills germs', 42, 6.99, '1 liter', '074350042005'),
('Dental Floss', 'Oral-B', 'Glide pro-health floss slides easily', 42, 3.99, '43.7 yd', '074350042006'),
('Whitening Strips', 'Crest', '3D White professional effects whitening strips', 42, 44.99, '20 strips', '074350042007');

-- Household Items
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('All Purpose Cleaner', 'Lysol', 'Multi-surface cleaner kills 99.9% of viruses', 43, 4.99, '32 oz', '074350043001'),
('Bleach', 'Clorox', 'Regular bleach disinfects and whitens', 43, 3.99, '64 oz', '074350043002'),
('Glass Cleaner', 'Windex', 'Original glass cleaner streak-free shine', 43, 4.49, '32 oz', '074350043003'),
('Disinfecting Wipes', 'Clorox', 'Disinfecting wipes kills cold and flu viruses', 43, 5.99, '75 count', '074350043004'),
('Floor Cleaner', 'Pine-Sol', 'Multi-surface floor cleaner fresh pine scent', 43, 4.99, '48 oz', '074350043005'),
('Dish Soap', 'Dawn', 'Ultra dishwashing liquid cuts grease', 43, 3.49, '19.4 oz', '074350043006'),
('Laundry Detergent', 'Tide', 'Original liquid laundry detergent powerful clean', 43, 12.99, '92 oz', '074350043007'),
('Fabric Softener', 'Downy', 'Liquid fabric softener fresh scent', 43, 7.99, '51 oz', '074350043008'),

('Toilet Paper', 'Charmin', 'Soft and strong toilet paper 12 mega rolls', 44, 14.99, '12 mega rolls', '074350044001'),
('Paper Towels', 'Bounty', 'Quick-absorbing paper towels 6 big rolls', 44, 9.99, '6 big rolls', '074350044002'),
('Facial Tissues', 'Kleenex', 'Soft facial tissues gentle on skin 4 pack', 44, 5.49, '4 pack', '074350044003'),
('Trash Bags', 'Hefty', 'Strong trash bags with drawstring 30 count', 44, 7.99, '30 count', '074350044004'),
('Aluminum Foil', 'Reynolds Wrap', 'Heavy duty aluminum foil for cooking and storage', 44, 5.49, '75 sq ft', '074350044005'),
('Plastic Wrap', 'Glad ClingWrap', 'Cling wrap seals in freshness for food storage', 44, 4.49, '200 sq ft', '074350044006'),
('Sandwich Bags', 'Ziploc', 'Resealable sandwich bags easy open and close 50 count', 44, 4.99, '50 count', '074350044007'),
('Freezer Bags', 'Ziploc', 'Resealable freezer bags keep food fresh longer 20 count', 44, 5.49, '20 count', '074350044008'),

('Laundry Detergent Pods', 'Tide', 'Tide PODS original scent convenient single dose', 45, 18.99, '81 count', '074350045001'),
('Laundry Detergent HE', 'Arm & Hammer', 'Clean burst HE liquid detergent for high efficiency washers', 45, 9.99, '100 oz', '074350045002'),
('Stain Remover Spray', 'OxiClean', 'Max force stain remover spray tackles tough stains', 45, 6.99, '16 oz', '074350045003'),
('Bleach Alternative', 'OxiClean', 'Versatile stain remover powder color safe bleach alternative', 45, 8.99, '3 lb', '074350045004'),
('Dryer Sheets', 'Bounce', 'Fabric softener dryer sheets outdoor fresh scent 240 count', 45, 8.99, '240 count', '074350045005'),
('Fabric Softener Beads', 'Downy', 'Unstopables in-wash scent booster beads fresh scent', 45, 11.99, '20 oz', '074350045006'),
('Wool Dryer Balls', 'Smart Sheep', 'Organic wool dryer balls reusable natural fabric softener 6 pack', 45, 16.99, '6 pack', '074350045007'),
('Color Catcher Sheets', 'Shout', 'Color catcher sheets prevent color runs in wash 24 count', 45, 5.49, '24 count', '074350045008');

-- Pet Items
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Dry Dog Food Chicken', 'Purina ONE', 'SmartBlend chicken and rice formula for adult dogs', 46, 34.99, '31.1 lb', '074350046001'),
('Dry Dog Food Beef', 'Pedigree', 'Complete nutrition beef flavor dry dog food', 46, 24.99, '30 lb', '074350046002'),
('Dry Dog Food Large Breed', 'Blue Buffalo', 'Life protection formula for large breed dogs with real chicken', 46, 49.99, '30 lb', '074350046003'),
('Dry Dog Food Small Breed', 'Royal Canin', 'Small breed adult dry dog food optimal digestion', 46, 44.99, '13 lb', '074350046004'),
('Wet Dog Food Chicken', 'Cesar', 'Gourmet wet dog food with chicken in sauce', 46, 18.99, '12 pack', '074350046005'),
('Wet Dog Food Beef', 'Pedigree', 'Choice cuts beef flavor in gravy', 46, 14.99, '12 pack', '074350046006'),
('Grain Free Dog Food', 'Taste of the Wild', 'High protein grain-free formula with roasted bison', 46, 54.99, '28 lb', '074350046007'),
('Puppy Food', 'Purina Pro Plan', 'Puppy chicken and rice formula for growing dogs', 46, 39.99, '18 lb', '074350046008'),

('Dry Cat Food Chicken', 'Purina ONE', 'Indoor advantage chicken flavor for adult cats', 47, 24.99, '16 lb', '074350047001'),
('Dry Cat Food Salmon', 'Blue Buffalo', 'Indoor health chicken and brown rice recipe', 47, 29.99, '15 lb', '074350047002'),
('Wet Cat Food Variety', 'Fancy Feast', 'Grilled seafood feast variety pack', 47, 16.99, '24 pack', '074350047003'),
('Wet Cat Food Pate', 'Friskies', 'Classic pate variety pack', 47, 12.99, '24 pack', '074350047004'),
('Kitten Food', 'Royal Canin', 'Kitten dry food for healthy growth', 47, 32.99, '7 lb', '074350047005'),
('Grain Free Cat Food', 'Wellness CORE', 'Grain-free turkey and chicken recipe', 47, 34.99, '12 lb', '074350047006'),
('Senior Cat Food', 'Hill''s Science Diet', 'Adult 7+ senior cat food chicken recipe', 47, 39.99, '15.5 lb', '074350047007'),
('Hairball Control', 'Iams', 'Hairball care with chicken dry cat food', 47, 26.99, '16 lb', '074350047008'),

('Dog Treats Biscuits', 'Milk-Bone', 'Original dog biscuits for medium dogs', 48, 7.99, '24 oz', '074350048001'),
('Dog Treats Jerky', 'Pup-Peroni', 'Original beef flavor dog treats', 48, 5.99, '10 oz', '074350048002'),
('Dog Dental Chews', 'Greenies', 'Dental treats for fresh breath and clean teeth', 48, 24.99, '36 oz', '074350048003'),
('Dog Rawhide Bones', 'Purina Busy', 'Rollhide chew treats for dogs', 48, 8.99, '10 count', '074350048004'),
('Dog Training Treats', 'Zuke''s Mini Naturals', 'Healthy moist training treats for dogs', 48, 9.99, '16 oz', '074350048005'),
('Cat Treats Temptations', 'Temptations', 'Tasty chicken flavor cat treats', 48, 4.99, '6.3 oz', '074350048006'),
('Cat Treats Greenies', 'Greenies', 'Feline dental treats for cats', 48, 7.99, '9.75 oz', '074350048007'),
('Catnip Toys', 'Yeowww!', 'Organic catnip toys for cats', 48, 5.99, '3 pack', '074350048008');

-- Baby Items
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Baby Formula Infant', 'Similac', 'Pro-Advance infant formula with OptiGRO', 49, 34.99, '30.8 oz', '074350049001'),
('Baby Formula Sensitive', 'Enfamil', 'Gentlease formula for fussiness and gas', 49, 36.99, '29.4 oz', '074350049002'),
('Baby Formula Organic', 'Earth''s Best', 'Organic infant formula with iron', 49, 32.99, '23.2 oz', '074350049003'),

('Diapers Size 1', 'Pampers', 'Swaddlers newborn diapers super soft', 50, 44.99, '128 count', '074350050001'),
('Diapers Size 2', 'Huggies', 'Little snugglers size 2 gentle on skin', 50, 49.99, '136 count', '074350050002'),
('Diapers Size 3', 'Pampers', 'Baby dry size 3 overnight protection', 50, 54.99, '140 count', '074350050003'),
('Diapers Size 4', 'Huggies', 'Little movers size 4 active fit', 50, 54.99, '120 count', '074350050004'),
('Baby Wipes', 'Pampers', 'Sensitive baby wipes hypoallergenic', 50, 19.99, '9 packs', '074350050005'),
('Pull-Ups Training', 'Huggies', 'Pull-ups training pants for potty training', 50, 29.99, '66 count', '074350050006'),

('Baby Food Puree Apple', 'Gerber', 'Organic apple puree stage 1', 51, 5.99, '8 pack', '074350051001'),
('Baby Food Puree Banana', 'Earth''s Best', 'Organic banana baby food', 51, 6.49, '10 pack', '074350051002'),
('Baby Food Mixed Veggies', 'Gerber', 'Garden vegetables stage 2', 51, 6.99, '8 pack', '074350051003'),
('Baby Food Chicken', 'Beech-Nut', 'Chicken and vegetables stage 3', 51, 7.99, '10 pack', '074350051004'),
('Baby Cereal Rice', 'Gerber', 'Single grain rice baby cereal', 51, 4.99, '16 oz', '074350051005'),
('Baby Cereal Oatmeal', 'Earth''s Best', 'Organic whole grain oatmeal cereal', 51, 5.49, '8 oz', '074350051006'),
('Baby Snacks Puffs', 'Gerber', 'Graduates puffs strawberry apple flavor', 51, 3.99, '1.48 oz', '074350051007'),
('Baby Snacks Yogurt Melts', 'Gerber', 'Yogurt melts freeze-dried snacks', 51, 4.49, '1 oz', '074350051008');

-- Alcoholic Beverages
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Beer Budweiser', 'Budweiser', 'Classic American lager crisp and refreshing', 52, 18.99, '24 pack', '074350052001'),
('Beer Coors Light', 'Coors', 'Light beer smooth and easy drinking', 52, 17.99, '24 pack', '074350052002'),
('Beer Corona Extra', 'Corona', 'Mexican lager light and crisp perfect with lime', 52, 21.99, '12 pack', '074350052003'),
('Beer Heineken', 'Heineken', 'Premium Dutch lager with distinctive flavor', 52, 19.99, '12 pack', '074350052004'),
('Beer Miller Lite', 'Miller', 'Light beer great pilsner taste', 52, 17.99, '24 pack', '074350052005'),
('Beer Stella Artois', 'Stella Artois', 'Belgian pilsner premium quality', 52, 22.99, '12 pack', '074350052006'),
('Beer IPA Craft', 'Sierra Nevada', 'Torpedo extra IPA hoppy and bold', 52, 15.99, '6 pack', '074350052007'),
('Beer Guinness Stout', 'Guinness', 'Irish dry stout rich and creamy', 52, 14.99, '6 pack', '074350052008'),

('Wine Cabernet Sauvignon', 'Kendall-Jackson', 'Full-bodied red wine with dark fruit notes', 53, 14.99, '750 ml', '074350053001'),
('Wine Chardonnay', 'Kendall-Jackson', 'Buttery white wine with oak notes', 53, 14.99, '750 ml', '074350053002'),
('Wine Pinot Noir', 'La Crema', 'Smooth red wine with cherry and spice', 53, 18.99, '750 ml', '074350053003'),
('Wine Sauvignon Blanc', 'Kim Crawford', 'Crisp white wine from New Zealand', 53, 12.99, '750 ml', '074350053004'),
('Wine Merlot', 'Beringer', 'Medium-bodied red wine smooth finish', 53, 11.99, '750 ml', '074350053005'),
('Wine Moscato', 'Barefoot', 'Sweet white wine with peach and apricot', 53, 8.99, '750 ml', '074350053006'),
('Wine Prosecco', 'La Marca', 'Italian sparkling wine light and bubbly', 53, 13.99, '750 ml', '074350053007'),
('Wine Champagne', 'Veuve Clicquot', 'Premium French champagne celebration worthy', 53, 54.99, '750 ml', '074350053008'),

('Vodka Smirnoff', 'Smirnoff', 'Triple distilled vodka smooth and versatile', 54, 19.99, '750 ml', '074350054001'),
('Vodka Grey Goose', 'Grey Goose', 'Premium French vodka ultra smooth', 54, 34.99, '750 ml', '074350054002'),
('Rum Bacardi', 'Bacardi', 'White rum perfect for mojitos and cocktails', 54, 17.99, '750 ml', '074350054003'),
('Rum Captain Morgan', 'Captain Morgan', 'Spiced rum with vanilla and caramel notes', 54, 19.99, '750 ml', '074350054004'),
('Whiskey Jack Daniels', 'Jack Daniel''s', 'Tennessee whiskey charcoal mellowed', 54, 27.99, '750 ml', '074350054005'),
('Whiskey Jameson', 'Jameson', 'Irish whiskey smooth and balanced', 54, 29.99, '750 ml', '074350054006'),
('Tequila Patron Silver', 'Patron', 'Premium silver tequila handcrafted', 54, 44.99, '750 ml', '074350054007'),
('Gin Tanqueray', 'Tanqueray', 'London dry gin perfect for martinis', 54, 24.99, '750 ml', '074350054008');

-- Spices Herbs and Condiments
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Black Pepper Ground', 'McCormick', 'Pure ground black pepper adds bold flavor', 55, 5.99, '3 oz', '074350055001'),
('Garlic Powder', 'McCormick', 'Granulated garlic powder convenient seasoning', 55, 4.99, '3.12 oz', '074350055002'),
('Onion Powder', 'McCormick', 'Ground onion powder savory flavor', 55, 4.99, '2.62 oz', '074350055003'),
('Cinnamon Ground', 'McCormick', 'Ground cinnamon sweet and warm spice', 55, 5.49, '2.37 oz', '074350055004'),
('Paprika', 'McCormick', 'Sweet paprika adds color and mild flavor', 55, 4.49, '2.12 oz', '074350055005'),
('Italian Seasoning', 'McCormick', 'Blend of herbs for Italian dishes', 55, 4.99, '0.75 oz', '074350055006'),
('Oregano', 'McCormick', 'Dried oregano leaves Mediterranean flavor', 55, 3.99, '0.75 oz', '074350055007'),
('Basil Dried', 'McCormick', 'Sweet basil perfect for pasta and pizza', 55, 3.99, '0.62 oz', '074350055008'),

('Salad Dressing Ranch', 'Hidden Valley', 'Original ranch salad dressing creamy', 56, 3.99, '16 oz', '074350056001'),
('Salad Dressing Caesar', 'Ken''s', 'Creamy Caesar dressing with parmesan', 56, 4.49, '16 oz', '074350056002'),
('Salad Dressing Balsamic', 'Newman''s Own', 'Balsamic vinaigrette with olive oil', 56, 4.99, '16 oz', '074350056003'),
('Vinegar Balsamic', 'Pompeian', 'Balsamic vinegar of Modena aged', 56, 5.99, '16 oz', '074350056004'),
('Vinegar Apple Cider', 'Bragg', 'Organic raw unfiltered apple cider vinegar', 56, 4.99, '16 oz', '074350056005'),
('Honey', 'Nature Nate''s', '100% pure raw and unfiltered honey', 56, 8.99, '32 oz', '074350056006'),
('Maple Syrup Pure', 'Log Cabin', '100% pure maple syrup Grade A', 56, 12.99, '12 oz', '074350056007'),
('Jam Strawberry', 'Smucker''s', 'Strawberry preserves with real fruit', 56, 4.49, '18 oz', '074350056008');

-- Baking and Cooking
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('All Purpose Flour', 'King Arthur', 'Unbleached all-purpose flour for baking', 57, 5.99, '5 lb', '074350057001'),
('Sugar Granulated', 'Domino', 'Pure cane granulated sugar', 57, 3.99, '4 lb', '074350057002'),
('Brown Sugar', 'Domino', 'Light brown sugar adds moisture to baked goods', 57, 4.49, '2 lb', '074350057003'),
('Baking Soda', 'Arm & Hammer', 'Pure baking soda for baking and cleaning', 57, 1.99, '1 lb', '074350057004'),
('Baking Powder', 'Clabber Girl', 'Double acting baking powder for fluffy baked goods', 57, 2.99, '8.1 oz', '074350057005'),
('Vanilla Extract', 'McCormick', 'Pure vanilla extract premium quality', 57, 8.99, '2 oz', '074350057006'),
('Chocolate Chips', 'Nestle Toll House', 'Semi-sweet chocolate morsels for cookies', 57, 3.99, '12 oz', '074350057007'),
('Cocoa Powder', 'Hershey''s', 'Unsweetened cocoa powder rich chocolate flavor', 57, 5.49, '8 oz', '074350057008'),

('Olive Oil Extra Virgin', 'Bertolli', 'Extra virgin olive oil first cold pressed', 58, 9.99, '25.5 oz', '074350058001'),
('Vegetable Oil', 'Wesson', 'Pure vegetable oil for cooking and baking', 58, 5.99, '48 oz', '074350058002'),
('Canola Oil', 'Crisco', 'Pure canola oil light taste', 58, 6.99, '48 oz', '074350058003'),
('Coconut Oil', 'Nutiva', 'Organic virgin coconut oil for cooking', 58, 12.99, '29 oz', '074350058004'),
('Sesame Oil', 'Kadoya', 'Pure sesame oil for Asian cooking', 58, 7.99, '11 oz', '074350058005'),
('Cooking Spray', 'Pam', 'Original cooking spray prevents sticking', 58, 4.49, '6 oz', '074350058006'),
('Red Wine Vinegar', 'Pompeian', 'Red wine vinegar for cooking and dressings', 58, 3.99, '16 oz', '074350058007'),
('White Vinegar', 'Heinz', 'Distilled white vinegar for cleaning and cooking', 58, 2.99, '32 oz', '074350058008');

-- Grains and Legumes
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Lentils Green', 'Bob''s Red Mill', 'Whole green lentils high in protein', 59, 4.99, '27 oz', '074350059001'),
('Black Beans Dry', 'Goya', 'Dried black beans for soups and sides', 59, 2.99, '1 lb', '074350059002'),
('Kidney Beans Dry', 'Goya', 'Dried red kidney beans for chili', 59, 2.99, '1 lb', '074350059003'),
('Chickpeas Dry', 'Bob''s Red Mill', 'Dried garbanzo beans for hummus', 59, 3.99, '27 oz', '074350059004'),
('Split Peas', 'Goya', 'Green split peas for soups', 59, 2.49, '1 lb', '074350059005'),
('Barley Pearl', 'Bob''s Red Mill', 'Pearl barley great for soups and stews', 59, 3.99, '28 oz', '074350059006'),
('Farro', 'Bob''s Red Mill', 'Ancient grain farro nutty flavor', 59, 5.99, '24 oz', '074350059007'),
('Wild Rice', 'Lundberg', 'Organic wild rice blend', 59, 7.99, '1 lb', '074350059008');

-- Eggs
INSERT INTO products (name, brand, description, category_id, price, unit_size, barcode) VALUES
('Large Eggs', 'Eggland''s Best', 'Farm fresh large eggs with superior taste and nutrition', 60, 4.49, '1 dozen', '074350060001'),
('Organic Eggs', 'Vital Farms', 'Pasture-raised organic eggs from happy hens', 60, 6.99, '1 dozen', '074350060002'),
('Cage Free Eggs', 'Happy Egg', 'Free-range eggs from cage-free hens with bright orange yolks', 60, 5.99, '1 dozen', '074350060003'),
('Egg Whites', 'AllWhites', 'Pure liquid egg whites for healthy cooking and baking', 60, 3.99, '16 oz', '074350060004');
