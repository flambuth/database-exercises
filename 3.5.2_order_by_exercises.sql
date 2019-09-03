-- woops forgot one


-- start from here
SELECT first_name, last_name
FROM employees
ORDER BY first_name ASC; 

-- sortin firt and last name
SELECT first_name, last_name
FROM employees
ORDER BY first_name ASC, last_name DESC;

-- sortin firt and last name. Last name now has primacy of sorting. 
SELECT first_name, last_name
FROM employees
ORDER BY last_name DESC, first_name ASC;
WHERE last_name REGEXP ''

-- how do you REGEXP to accept any string that contains one string char?