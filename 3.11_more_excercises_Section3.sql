-- FORGET ABOUT temp tables. Go do some easier stuff
-- What is the average replacement cost of a film? Does this change depending on the rating of the film?
-- Figure out replacement cost

-- Shows the total average replacement cost for all films 
SELECT AVG(f.replacement_cost)
FROM film AS f
;

-- Group them by rating to see if that makes a signifiat difference in average replacement cost
SELECT f.rating, AVG(f.replacement_cost), AVG(favg.replacement_cost)
FROM film AS f
	JOIN film AS favg
	ON f.film_id = favg.film_id
GROUP BY f.rating
;