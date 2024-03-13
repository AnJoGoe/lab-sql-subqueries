-- ==========================================================
-- Challenge - SQL Subqueries
-- ==========================================================

USE sakila;



-- Display all available tables 
SHOW TABLES;


-- ==========================================================
-- ==========================================================


-- Write SQL queries to perform the following tasks using the Sakila database:

-- 1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT
fil.film_id
FROM sakila.film AS fil
WHERE fil.title = "Hunchback Impossible";


SELECT
	COUNT(*) AS number_of_copies
FROM inventory AS inv
WHERE film_id = (SELECT fil.film_id FROM sakila.film AS fil WHERE fil.title = "Hunchback Impossible");



-- ==========================================================
-- ==========================================================


-- 2. List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT
	AVG(length)
FROM sakila.film;

SELECT *
FROM sakila.film
WHERE length > (SELECT AVG(length) FROM sakila.film)
ORDER BY length;


-- ==========================================================
-- ==========================================================


-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT film_id
FROM sakila.film
WHERE title = "Alone Trip";

SELECT actor_id
FROM sakila.film_actor
WHERE film_id = (SELECT film_id FROM sakila.film WHERE title = "Alone Trip");

SELECT
	first_name,
    last_name
FROM sakila.actor
WHERE actor_id IN (SELECT actor_id FROM sakila.film_actor WHERE film_id = (SELECT film_id FROM sakila.film WHERE title = "Alone Trip"));