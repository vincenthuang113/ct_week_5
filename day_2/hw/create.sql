CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	billing_info VARCHAR(150)
);

CREATE TABLE concession(
	food_id SERIAL PRIMARY KEY UNIQUE,
	food_name VARCHAR(100),
	food_cost NUMERIC(5,2)
);

CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY UNIQUE,
	movie_name VARCHAR(100) UNIQUE,
	duration INTEGER,
	release_date DATE
);

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY UNIQUE,
	movie_id INTEGER,
	movie_name VARCHAR(100),
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id),
	FOREIGN KEY(movie_name) REFERENCES movie(movie_name)
);

CREATE TABLE order_(
	order_id SERIAL PRIMARY KEY,
	order_date DATE DEFAULT CURRENT_DATE,
	total_cost NUMERIC(6,2),
	food_id INTEGER,
	ticket_id INTEGER,
	FOREIGN KEY(food_id) REFERENCES concession(food_id),
	FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id)
);





