-- it begins
SELECT DISTINCT title FROM titles
limit 10
;

-- First ten names starting with Z
SELECT first_name
FROM employees
WHERE first_name LIKE 'Z%'
LIMIT 10;

