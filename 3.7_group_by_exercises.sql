#Using DISTINCT to find the unique titles in the titles table.
SELECT DISTINCT title 
FROM titles;

#Finds unique employees who have last names that start and end with E.
SELECT DISTINCT `last_name`
FROM employees
WHERE last_name REGEXP '^E.+e$';

#Unique first name/last name combinations that have last name starting and ending with e. 846 rows of them.
SELECT `first_name`, `last_name`
FROM `employees`
GROUP BY `last_name`, `first_name`
HAVING last_name REGEXP '^E.+e$'; 

#Last names with q but no u after. Like would have been much more elegant.
SELECT DISTINCT last_name
FROM `employees`
WHERE last_name REGEXP 'q[^u].+';

#USERID creator has the count function added to show that a few IDs are not unique. 13,251 not unique user_names by my count
SELECT CONCAT(
LEFT(`first_name`,1),LEFT(`last_name`,4),'-',SUBSTRING(`birth_date`,6,2),LEFT(`birth_date`,4)
)
AS user_name,
COUNT(*)
FROM `employees`
GROUP BY user_name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

#Find the Irena, Vidya and Maya in count them by sex
SELECT gender, COUNT(*)
FROM `employees`
WHERE first_name REGEXP 'Maya' or first_name REGEXP 'Vidya' or first_name REGEXP 'Irena'
GROUP BY gender;