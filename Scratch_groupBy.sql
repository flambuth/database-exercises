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