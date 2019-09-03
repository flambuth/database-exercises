-- woops forgot one


-- start from here
SELECT first_name, last_name
FROM employees
ORDER BY first_name ASC; 

-- sortin firt and last name
SELECT first_name, last_name
FROM employees
ORDER BY first_name ASC, last_name DESC;

-- sortin firt and last name. Last name is now the first sorting method.
SELECT first_name, last_name
FROM employees
ORDER BY last_name DESC, first_name ASC;

-- Sortin by emp_no, even though its not selected. using one hell of a regex pattern to filter out lastnames that have an e
SELECT first_name, last_name
FROM employees
WHERE employees.last_name REGEXP '[a-zA-Z]*e[a-zA-Z]*'
ORDER BY emp_no
;

-- Same as last, but now the employee numbers start from the highest number
SELECT first_name, last_name
FROM employees
WHERE employees.last_name REGEXP '[a-zA-Z]*e[a-zA-Z]*'
ORDER BY emp_no DESC
;

-- reference to the employees hired in the 90s and born on christmas.
-- i can do it without the christmas 12-25-XXXX stipulation
-- They're now sorted by first birthdate then by earliest hire date
SELECT `first_name`,`last_name`,TIMEDIFF(hire_date, CURRENT_DATE)
From `employees`
WHERE `hire_date` >= '1990-01-01' AND `hire_date` <= '2000-01-01'
ORDER BY `birth_date` ASC, `hire_date` DESC
;
