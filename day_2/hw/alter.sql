SELECT order_date
FROM order_;

ALTER TABLE customer
ADD email VARCHAR(150);

UPDATE customer
SET email = 'vincenthuang@gmail.com'
WHERE customer_id = 1;

SELECT *
FROM customer;

