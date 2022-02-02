-- Inner Join on actor and film actor tables

SELECT actor.actor_id, first_name, last_name, film_id
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id;

-- give us the count of films that each actor is in... please
SELECT actor.actor_id, first_name, last_name, count(film_id)
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY actor.actor_id;

-- Left Join on actor and film actor tables
SELECT actor.actor_id, first_name, last_name, film_id
FROM film_actor
LEFT JOIN actor
ON actor.actor_id = film_actor.actor_id;

-- What customers do we have in ANGOLA
SELECT customer.first_name, customer.last_name, customer.email, country, city.city
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola';

-- re-answer any questions where a join or multi-join would help
-- explore the tables and ask a question of you own / answered with a join or multi-join
SELECT film.film_id, film.title, count(film_actor.actor_id) as actors_count
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP BY film.film_id, film.title
ORDER BY actors_count desc;


-- SubQueries
-- Two queries split apart

-- customer_ids that have greater total amounts than 175 in the payment table
SELECT customer_id, sum(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;

-- find customer info on customer table
SELECT *
FROM customer;

-- Subquery example
SELECT store_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);

-- Find films with language = 'English'
SELECT *
FROM film
WHERE language_id IN (
	SELECT language_id
	FROM language
	WHERE name <> 'English'
);

-- And what rating has the most movies total?
SELECT max(y.movie_count)
FROM(
    select rating, count(distinct(title)) as movie_count
    from film 
    group by rating
    order by movie_count desc) as y;

-- How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT amount, count(amount)
FROM payment
WHERE customer_id IN (
	SELECT customer_id
	FROM customer
	WHERE customer_id Between 380 and 430)
GROUP BY amount
ORDER BY amount DESC;
