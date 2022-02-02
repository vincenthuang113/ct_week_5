-- 1. List all customers who live in Texas (use JOINs)
SELECT customer_id, first_name, last_name, address.address_id, address.district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district like 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT customer.customer_id, first_name, last_name, payment.amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING sum(amount) > 175
	);

-- 4. List all customers that live in Nepal (use the city table)
SELECT customer_id, first_name, last_name, customer.address_id, city.city_id, country.country_id, country.country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country like 'Nepal';

-- 5. Which staff member had the most transactions?
SELECT staff.staff_id, first_name, last_name, count(payment.rental_id) as count_of_transaction
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY count(payment.rental_id) DESC
LIMIT 1;

-- 6. How many movies of each rating are there?
SELECT rating, COUNT(DISTINCT(title)) as count_of_movies
FROM film
GROUP BY rating;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT customer.customer_id, first_name, last_name
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99
GROUP BY customer.customer_id;


-- 8. How many free rentals did our stores give away?
SELECT count(rental_id) as no_of_free_rental_given
FROM payment
WHERE amount = 0.00;
