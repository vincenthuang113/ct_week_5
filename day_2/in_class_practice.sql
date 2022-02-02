-- Primary Keys Can't be Empty or Duplicates
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY, 
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	billing_info VARCHAR(150)
);

-- Seller table
CREATE TABLE seller(
	seller_id SERIAL PRIMARY KEY,
	contact_number VARCHAR(15),
	business_name VARCHAR(100),
	address VARCHAR(150)
);

-- Inventory
CREATE TABLE inventory(
	upc SERIAL PRIMARY KEY,
	quantity INTEGER
);

-- Order
CREATE TABLE order_(
	order_id SERIAL PRIMARY KEY,
	order_date DATE DEFAULT CURRENT_DATE,
	sub_total NUMERIC(8,2),
	total_cost NUMERIC(8,2),
	upc INTEGER NOT NULL, -- NOT NULL CONSTRAINT means value cannot be empty
	FOREIGN KEY(upc) REFERENCES inventory(upc)
);

-- Cart
CREATE TABLE cart(
	cart_id SERIAL PRIMARY KEY,
	customer_id INTEGER,
	order_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(order_id) REFERENCES order_(order_id)
);

-- Product
CREATE TABLE product(
	product_id SERIAL PRIMARY KEY,
	cost_of_prod NUMERIC(5,2),
	prod_name VARCHAR(100),
	upc INTEGER,
	seller_id INTEGER NOT NULL,
	FOREIGN KEY(upc) REFERENCES inventory(upc),
	FOREIGN KEY(seller_id) REFERENCES seller(seller_id)
);

-- Brand
CREATE TABLE brand(
	brand_id SERIAL PRIMARY KEY,
	brand_name VARCHAR(100),
	product_id INTEGER,
	FOREIGN KEY(product_id) REFERENCES product(product_id)
);