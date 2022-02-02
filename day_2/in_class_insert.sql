-- Insert Statements for Mock DB

INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	address,
	billing_info
) VALUES (
	1,
	'Vincent',
	'Huang',
	'123 Main st, Boston MA 02115',
	'4242-4242-4242-4242 623 06/22'
);

-- Check to see New Customer
SELECT *
FROM customer;

-- Second way to insert into customer table
INSERT INTO customer
VALUES(
	2,
	'Ryan',
	'Rhoades',
	'124 Main st, Boston MA 02115',
	'4141-4141-4141-4141 412 07/22'
);

INSERT INTO seller
VALUES(
	1,
	'987-654-4321',
	'Ranger Business',
	'125 Main St, Boston MA 02115'
);

INSERT INTO inventory
VALUES(
	1,
	10
);

INSERT INTO product
VALUES(
	1,
	100.00,
	'PYTHON NOTES',
	1,
	1
);

INSERT INTO brand
VALUES(
	1,
	'CODING TEMPLE BRAND',
	1
);

INSERT INTO order_(
	sub_total,
	total_cost,
	upc
) VALUES(
	200.00,
	220.00,
	1
);

-- Cart Insert
INSERT INTO cart(
	customer_id,
	order_id
) VALUES (
	1,
	1
);

