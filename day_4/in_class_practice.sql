-- Explore data on payment table
SELECT *
FROM payment
WHERE customer_id = 341;

-- Stored procedure Example
-- Simulate Late Fee Charge

CREATE OR REPLACE PROCEDURE latefee(
	customer INTEGER,
	lateFeeAmount DECIMAL
)

LANGUAGE plpgsql
AS $$
BEGIN
	-- add late fee to payment amount
	UPDATE payment
	SET amount = amount + lateFeeAmount
	WHERE customer_id = customer;
	
	-- commit statement inside of transaction
	COMMIT;

END;
$$

-- CALLING STORED PROCEDURE
CALL latefee(341,1.01);


SELECT *
FROM payment;
-----------------------
ALTER TABLE payment
ADD tips NUMERIC(5,2)
-----------------------
CREATE OR REPLACE PROCEDURE tipsPercent(
	staff INTEGER,
	tipsPercent DECIMAL
)

LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE payment
	SET tips = amount*(tipsPercent/100)
	WHERE staff = staff_id;
	
	-- commit statement inside of transaction
	COMMIT;

END $$;

-- CALLING STORED PROCEDURE
CALL tipsPercent(1,15);

DROP PROCEDURE latefee;

-- Stored Function Example
-- Insert Actor into actor table

CREATE OR REPLACE FUNCTION add_actor(
	_actor_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR,
	_last_update TIMESTAMP WITHOUT TIME ZONE
)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO actor(actor_id, first_name, last_name, last_update)
	VALUES(_actor_id, _first_name, _last_name, _last_update);
END;
$MAIN$
LANGUAGE plpgsql;

-- Don't say:
-- CALL add_actor(...)
-- Correct:
SELECT add_actor(500, 'Ryan', 'Reynolds', NOW()::timestamp )

SELECT *
FROM actor
WHERE actor_id = 500;
