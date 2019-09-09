-- We've got the rental_rate groups. We're dislaying the average rental duration for all the group members.

SELECT rental_rate, AVG(rental_duration)
FROM film
GROUP BY rental_rate;
-- HAVING COUNT(*) > ;