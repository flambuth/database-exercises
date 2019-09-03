-- it begins
SELECT DISTINCT title FROM titles
limit 10
;

-- First ten names starting with Z
SELECT first_name
FROM employees
WHERE first_name LIKE 'Z%'
LIMIT 10;

SELECT `first_name`,`last_name`,TIMEDIFF(hire_date, CURRENT_DATE)
From `employees`
WHERE `hire_date` >= '1990-01-01' AND `hire_date` <= '2000-01-01'
ORDER BY `birth_date` ASC, `hire_date` DESC
LIMIT 5
;

-- This pages over to the 10th page, at 5 records a page
SELECT `first_name`,`last_name`,TIMEDIFF(hire_date, CURRENT_DATE)
From `employees`
WHERE `hire_date` >= '1990-01-01' AND `hire_date` <= '2000-01-01'
ORDER BY `birth_date` ASC, `hire_date` DESC
LIMIT 5 OFFSET 50
;