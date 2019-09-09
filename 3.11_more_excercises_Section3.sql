-- FORGET ABOUT temp tables. Go do some easier stuff

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
--