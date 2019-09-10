-- The extras

-- How much do the current managers of each department get paid, relative to the average salary for the department? 
-- Is there any department where the department manager gets paid less than the average salary?

-- What languages are spoken in Santa Monica?
SELECT cl.Language, cl.Percentage
FROM city as ci
INNER JOIN countrylanguage AS cl
	ON ci.CountryCode = cl.CountryCode
WHERE ci.name = 'Santa Monica'
ORDER By cl.Percentage DESC 
; 

-- How many different countries are in each region?
SELECT count(c.region), c.region
FROM country AS c
GROUP BY c.region
;

-- What is the population for each region?
SELECT co.region, SUM(co.population)
FROM country AS co
GROUP BY co.region
;

-- Next one will be pushed to git with a bash script
-- With the right escape character. 

-- What is the population for each continent?
SELECT continent, SUM(population) AS population
FROM country
GROUP BY continent
ORDER By SUM(population) DESC 
;

-- What is the average life expectancy globally?
SELECT AVG(lifeExpectancy)
FROM country 
;

-- What is the average life expectancy for each region, each continent? Sort the results from shortest to longestA
SELECT region, AVG(lifeExpectancy)
FROM country 
GROUP BY region
ORDER BY AVG(lifeExpectancy)
;

SELECT continent, AVG(lifeExpectancy)
FROM country 
GROUP BY continent
ORDER BY AVG(lifeExpectancy)
;-- The extras exercises using the Sakila database

-- Display the first and last names in all lowercase of all the actors.
SELECT LOWER(first_name), LOWER(last_name)
FROM actor
;

-- You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." 
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'Joe'
;


-- Find all actors whose last name contain the letters "gen":
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%gen%'
;

-- Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%li%'
ORDER BY last_name, first_name
;

-- List the last names of all the actors, as well as how many actors have that last name.
-- This one is frustrating. 
SELECT last_name, first_name
FROM actor
ORDER BY last_name
;
-- Gonna try that using self join
SELECT a.last_name, b.first_name, COUNT(b.last_name)
FROM actor a, actor b
WHERE a.actor_id = b.actor_id
GROUP BY a.last_name, b.first_name
;

-- 6
SELECT last_name, COUNT(last_name) as countOfLastNames
from actor
group by last_name
;

-- 7
-- List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
SELECT last_name, COUNT(last_name) AS countOfLastNames
FROM actor
	GROUP BY last_name
	HAVING countOfLastNames > 1
	ORDER BY last_name
;

-- You cannot locate the schema of the address table. Which query would you use to re-create it?
-- My answer would be a very complex join of all the foreign key fields. I think that might be too cumbersome to be the right answer.
SELECT
FROM
-- 8 

-- Use JOIN to display the first and last names, as well as the address, of each staff member.
-- 9
SELECT CONCAT(s.first_name,s.last_name) AS full_name, a.address
FROM staff AS s
	JOIN address AS a 
	ON a.address_id=s.address_id
;

-- Use JOIN to display the total amount rung up by each staff member in August of 2005.
-- 10
SELECT CONCAT(s.first_name, s.last_name) AS full_name, SUM(amount) AS SalesInAUG2005
FROM payment AS p
	JOIN staff as s
	ON p.staff_id = s.staff_id
WHERE payment_date >= '2005-08-01 00:00:01' AND payment_date <= '2005-08-31 23:59:59'
GROUP BY s.staff_id
;

-- 11
-- List each film and the number of actors who are listed for that film.

-- SELECT the title and the count of all the actor_id rows grouped into the film titles
SELECT f.title, COUNT(fa.actor_id)
FROM film AS f
JOIN film_actor AS fa
	ON f.film_id=fa.film_id 
GROUP BY f.title
;

-- 12
-- How many copies of the film Hunchback Impossible exist in the inventory system?

SELECT f.title, COUNT(i.film_id) AS copiesInInventory
FROM film AS f
	JOIN inventory as i
	ON f.film_id = i.film_id
WHERE f.title = 'Hunchback Impossible'
GROUP BY f.title
;

-- 13
--  Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
SELECT f.title, f.`language_id` AS titleLanguage 
FROM film as f
WHERE f.title IN (
	SELECT f.title
	FROM film as f
	WHERE f.title LIKE 'K%' OR f.title LIKE 'Q%' 	
) AND f.language_id = 1
;

-- NOTE: Apple^tab brings up a ribbon of open applications
-- 14
-- Use subqueries to display all actors who appear in the film Alone Trip.
SELECT CONCAT(a.first_name,' ', a.last_name) AS full_name
FROM actor AS a
WHERE actor_id IN (
	SELECT actor_id
	FROM film
	WHERE title = 'Alone Trip' 
)
;

-- 15
-- email marketing campaign in Canada, SO you will need the names and email addresses of all Canadian customers.
-- build a joined table inside a subquery capsule was the goal
-- instead I joined enough tables to link the address_id filed to the country name
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

-- 16
-- Target all family movies for a promotion. Identify all movies categorized as famiy films.
SELECT f.title, ca.name AS film_genre
FROM film AS f
JOIN film_category AS fcat 
ON f.film_id = fcat.film_id
JOIN category AS ca 
ON fcat.category_id = ca.category_id
WHERE ca.name = 'Family'
;

-- 17
-- Write a query to display how much business, in dollars, each store brought in.
-- There are only two stores and there are only two employees. Their staff_id is mapped symetrically to store_id
-- SO I just used an alias staff_id
SELECT SUM(p.amount), p.staff_id
FROM payment AS p
GROUP BY p.staff_id
;

-- 18
-- Write a query to display for each store its store ID, city, and country.
-- Once again, store_id is mapped perfectly to the address_id, so I just aliased it 
SELECT ad.address_id AS store_ID, ci.city, co.country
FROM address AS ad
	JOIN city AS ci
	ON ci.city_id = ad.city_id
	JOIN country AS co
	ON co.country_id = ci.country_id
GROUP BY ad.address_id
HAVING ad.address_id = 1 OR ad.address_id = 2
;

-- 19
-- Top five genres in gross revenue sorted desc. use following tables: category, film_category, inventory, payment, and rental
-- film_category looks to be the prime joining table
SELECT fcat.category_id, COUNT(*)
FROM film_category AS fcat
	JOIN film AS f
	ON fcat.film_id = f.film_id
	JOIN inventory AS inv
	ON inv.film_id = f.film_id
GROUP BY fcat.category_id
;-- FORGET ABOUT temp tables. Go do some easier stuff

-- 1
-- What is the average replacement cost of a film? Does this change depending on the rating of the film?
-- Figure out replacement cost

-- Shows the total average replacement cost for all films 
SELECT AVG(f.replacement_cost)
FROM film AS f
;

-- Group them by rating to see if that makes a signifiat difference in average replacement cost
-- I put them in order, but Id like to select a column that shows either the total average or the each groups difference from total average 
SELECT f.rating, AVG(f.replacement_cost)
FROM film AS f
	RIGHT JOIN film AS favg
	ON f.film_id = favg.film_id
GROUP BY f.rating
ORDER By AVG(f.replacement_cost)
;

-- 2
-- How many different films of each genre are in the database?
SELECT c.name AS genre_name, COUNT(fc.film_id) AS filmsInGenre
FROM film_category AS fc
	JOIN category AS c
	USING (category_id)
GROUP BY fc.category_id
;

-- 3
-- What are the 5 most frequently rented films?
-- Each f.film_id has several inventory_ids

-- This groups each filmTitle by the amount of rental IDs, sorted desc and limited to 5 entries
SELECT f.title, COUNT(r.rental_id) AS timesTitleWasRented
FROM film AS f
	JOIN inventory AS inv 
	USING (film_id)
	JOIN rental AS r
	ON inv.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY timesTitleWasRented DESC
LIMIT 5
;

-- 4
-- What are the most most profitable films (in terms of gross revenue)?
-- I will likely have to subtract a revenue value with a cost value

-- This groups the SUM of payment.amount for each film.title
SELECT f.title, SUM(p.amount)
FROM film as f
	JOIN inventory AS inv
	USING (film_id)
	JOIN rental AS r
	ON  r.inventory_id = inv.inventory_id
	JOIN payment as p
	ON p.rental_id = r.rental_id
GROUP BY f.title
ORDER BY SUM(p.amount) DESC
;

-- Try to get a profit that is the diffrence betwen the SUM(p.amount) and subtract inventory_id*f.replacement_cost

-- This shows the replacement cost for each f.title
-- RealCost is the cost to replace each title * the inventory-ids grouped to each title

-- Why does amountInInventory come out as 23 for film_id1
SELECT f.film_id, SUM(p.amount), COUNT(inv.inventory_id) AS amountInInventory
FROM film as f
	JOIN inventory AS inv
	USING (film_id)
	JOIN rental AS r
	ON  r.inventory_id = inv.inventory_id
	JOIN payment as p
	ON p.rental_id = r.rental_id
GROUP BY f.film_id
ORDER BY SUM(p.amount) DESC
;