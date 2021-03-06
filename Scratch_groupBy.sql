-- We've got the rental_rate groups. We're dislaying the average rental duration for all the group members.

SELECT rental_rate, AVG(rental_duration), COUNT(rental_rate), 
FROM film
GROUP BY rental_rate;
-- HAVING rental_duration > 5.0 
;

-- just some aggrates. Before moving into GROUP BY
-- THE AGGREGATE of all the values in the rental_duration field
SELECT AVG(rental_duration)
FROM film
;

-- SUM, REQUIRES GROUP BY
-- Groups them by title and shows the total potential rental fees the title can acquire
SELECT title, sum(rental_rate*rental_duration) AS max_rental_charge
FROM film
GROUP BY title;

SELECT last_name, COUNT(last_name) as countOfLastNames
from actor
group by last_name
;


-- Trying to use between on where
SELECT CONCAT(s.first_name,s.last_name) AS full_name, SUM(p.amount) AS totalPayments
FROM staff AS s
	JOIN payment AS p
	ON s.staff_id=p.staff_id
-- WHERE p.payment_date >= CAST('2005-08-01 00:00:01') AND p.payment_date <= CAST('2005-08-31 23:59:59')
GROUP By full_name
HAVING p.payment_date >= '2005-08-01 00:00:01' AND p.payment_date <= '2005-08-31 23:59:59'
;

-- This got each record 
SELECT staff_id, amount
FROM payment
WHERE payment_date >= '2005-05-25 11:30:37' AND payment_date <= '2005-08-31 23:59:59'
;

-- This is the sum of all sales grouped to each employee where the payment date was between the first and last of AUG2006
SELECT staff_id, SUM(amount)
FROM payment
WHERE payment_date >= '2005-08-01 00:00:01' AND payment_date <= '2005-08-31 23:59:59'
GROUP BY staff_id
;

--  Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
SELECT f.title, f.`language_id` AS titleLanguage 
FROM film as f
WHERE f.title IN (
	SELECT f.title
	FROM film as f
	WHERE f.title LIKE 'K%' OR f.title LIKE 'Q%' 	
) AND f.language_id = 1
;

-- build a joined table inside a subquery capsule
SELECT CONCAT(cust.first_name,' ',cust.last_name) AS full_name, co.country AS cusomerCountry
FROM customer AS cust
	JOIN address AS ad
	ON cust.address_id = ad.`address_id`
	JOIN city AS ci
	ON ad.city_id = ci.city_id
	JOIN country AS co
	ON ci.country_id = co.country_id
WHERE co.country = 'Canada'
;

-- Find out how much each store is brining in
SELECT SUM(p.amount), p.staff_id
FROM payment AS p
GROUP BY p.staff_id
;

-- Top five genres in gross revenue sorted desc. 
-- use following tables: category, film_category, inventory, payment, and rental
-- film_category looks to be the prime joining table

-- This selects groups of genres and how many records are in each
SELECT ca.name, COUNT(*)
FROM film_category AS fcat
	JOIN film AS f
	ON fcat.film_id = f.film_id
	JOIN inventory AS inv
	ON inv.film_id = f.film_id
	JOIN category AS ca
	ON ca.category_id = fcat.category_id
	JOIN rental as r
	ON r.`inventory_id` = inv.inventory_id
GROUP BY ca.name
;

-- Lets find revenue first
-- I think summing up each filmTitles by group equates to the amount of revenue each title has acumulated
SELECT  f.title, COUNT(p.rental_id), COUNT(r.inventory_id), COUNT(p.rental_id), SUM(p.amount) AS revenue
FROM payment AS p
	JOIN rental AS r
	ON r.rental_id = p.rental_id
	JOIN inventory AS inv
	ON inv.inventory_id = r.inventory_id
	JOIN film as f
	ON f.film_id = inv.film_id
GROUP BY f.title
;