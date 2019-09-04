SELECT replacement_cost, count(replacement_cost)
FROM film
WHERE RATING LIKE 'PG%' AND replacement_cost BETWEEN 18.99 and 20.99
GROUP BY replacement_cost
;

SELECT *
FROM 
WHERE
;