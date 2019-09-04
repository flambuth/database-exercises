-- SUBQUERIES, OUTER LOOP selecting from an INNER LOOP

-- Find all employees with same hire date as empNO 101010. Ought to result to 69 rows
SELECT count(emp_no)
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
	WHERE hire_date = '1990-10-22'
)
;

-- Find all the titles held by all employees with the first name Aamod
SELECT title AS TitlesWithAamod
FROM titles
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod'
)
GROUP BY title
;

-- How many people in the employees table are no longer working for the company?
SELECT count(emp_no) AS ExEmployees
FROM employees
WHERE emp_no NOT IN (
	SELECT emp_no
	FROM dept_emp
	WHERE to_date = '9999-01-01'
)
;

-- Find all the current department managers that are female.
SELECT CONCAT(first_name,' ',last_name) AS FemaleManagers
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_manager
	WHERE to_date = '9999-01-01'
) AND gender = 'F'
;

-- scratch. AVG salary is 63810.7448.
SELECT count(salary)
FROM salaries
WHERE salary > 63810.7448 AND to_date = '9999-01-01'
;

-- Find all the employees that currently have a higher than average salary. 154543 rows
SELECT COUNT(emp_no) AS EmployeesMakingMoreThanAverage
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM salaries
	WHERE salary > 63810.7448 AND to_date = '9999-01-01'
)
;
