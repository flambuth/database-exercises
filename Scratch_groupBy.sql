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