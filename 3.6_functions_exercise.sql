#Finds employees who have names that start and end with E.
SELECT first_name
FROM employees
WHERE first_name REGEXP '^E.+e$';

#Concatenates first and last name into a new field. 
SELECT
	first_name, 
	last_name,
	CONCAT(first_name,' ',last_name) as full_name
From `employees`;

#Now the full_name field is in all upper case.
SELECT
	first_name, 
	last_name,
	CONCAT(UPPER(first_name),' ',UPPER(last_name)) as full_name
From `employees`;

#Selects all fields for employees hired in the 90's. I don't know how to filter out a day of the year from a date field to include all years. Meaning I don't know how to select just XXXX-12-25.
SELECT *
FROM `employees`
WHERE `hire_date` >= '1990-01-01' AND `hire_date` <= '2000-01-01';


#Selects the employees hired in the 90s and displays the time since they have been hired.
SELECT `first_name`,`last_name`,TIMEDIFF(hire_date, CURRENT_DATE)
From `employees`
WHERE `hire_date` >= '1990-01-01' AND `hire_date` <= '2000-01-01';

#Finds the minimum value in the salaries table.
SELECT min(salary)
FROM `salaries`;

#Finds the maximum value in the salaries table.
SELECT max(salary)
FROM `salaries`;

#The Complex USER-ID CAT affair
SELECT CONCAT(
LEFT(`first_name`,1),LEFT(`last_name`,4),'-',SUBSTRING(`birth_date`,6,2),LEFT(`birth_date`,4)
)
AS user_name
FROM `employees`;