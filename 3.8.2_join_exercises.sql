#inner join. I have no guesses, but it will certainly be less than either table.
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

#this will be a left join, so it will be at least 4 joined records since that's the max from the inner join
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

#Next one will have as many records as there are role names. There will be some null values in the user_names. Unless there are only 3 role_name options.
SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

#Lets count some stuff in these joins
#I'll explore later
SELECT  roles.name
FROM users
JOIN roles ON users.role_id = roles.id
#GROUP BY user_name, role_name
;

-- MY SCAFFOLDIN to extrapolate from
SELECT employees.emp_no, dept_manager.emp_no
FROM `employees`
JOIN `dept_manager`ON employees.emp_no = dept_manager.emp_no;

-- This gets DEPT-NAME, Employee number and Full name. But theres a few records per dept-name.
-- So I guess that means they're not the manager.
SELECT departments.dept_name, dept_manager.emp_no, CONCAT(employees.last_name,', ',employees.first_name) AS full_name
FROM `departments`
JOIN `dept_manager`
ON departments.dept_no = dept_manager.dept_no
JOIN `employees`
ON dept_manager.emp_no = employees.emp_no;

# Joins are tough
SELECT departments.`dept_name`, dept_manager.`emp_no`
FROM departments
INNER JOIN `dept_manager` ON departments.`dept_no` = `dept_manager`.`dept_no`
GROUP BY departments.dept_no, dept_manager.`emp_no`;


-- One step at a time. Lets join employees TABLE, dept_emp TABLE, and dept_manager Table
-- EVERY FIELD is selected across joining these 3 tables.
SELECT *
FROM employees as e
INNER JOIN dept_emp as de 
	ON e.emp_no = de.emp_no
INNER JOIN dept_manager as dm
	ON dm.dept_no = de.dept_no 
;

-- query that shows each department along with the name of the current manager for that department
-- Maybe another inner join
SELECT DISTINCT d.dept_name, dm.emp_no, e.last_name
FROM employees as e
INNER JOIN dept_emp as de 
	ON e.emp_no = de.emp_no
INNER JOIN dept_manager as dm
	ON dm.dept_no = de.dept_no 
INNER JOIN departments as d
	ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'	AND de.to_date = '9999-01-01'
;

-- Maybe another inner join
SELECT dm.to_date
FROM employees as e
INNER JOIN dept_emp as de 
	ON e.emp_no = de.emp_no
INNER JOIN dept_manager as dm
	ON dm.dept_no = de.dept_no 
INNER JOIN departments as d
	ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'	AND de.to_date = '9999-01-01'
;


-- I lost myself. Lets try modifying the given query
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
-- Think this might be the problem
WHERE de.to_date = '9999-01-01'
;	

-- Who are these managers?
SELECT CONCAT(e.first_name,' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e 
INNER JOIN dept_manager AS dm
	ON e.emp_no = dm.emp_no
INNER JOIN departments AS d
	ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
;

-- Now just the ladies
SELECT CONCAT(e.first_name,' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e 
INNER JOIN dept_manager AS dm
	ON e.emp_no = dm.emp_no
INNER JOIN departments AS d
	ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F'
;

-- Current titles for people who work at Customer service
SELECT t.title AS CustomerServiceRoles, count(t.title) AS Total
FROM titles AS t
INNER JOIN dept_emp AS de
	ON t.emp_no = de.emp_no
WHERE de.dept_no = 'd009'
GROUP BY title
;

-- What are these managers being paid?
SELECT CONCAT(e.first_name,' ', e.last_name) AS full_name, d.dept_name, s.salary AS currentSalary
FROM employees AS e 
INNER JOIN dept_manager AS dm
	ON e.emp_no = dm.emp_no
INNER JOIN departments AS d
	ON d.dept_no = dm.dept_no
INNER JOIN salaries AS s
	ON dm.emp_no = s.emp_no	
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
;

-- Getint the amount of employees in each department
SELECT d.dept_no, d.dept_name, count(de.emp_no)
FROM departments AS d
INNER JOIN dept_emp AS de
	ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_name
;

-- average salary of all entries in the salaries field. 
-- I bet there is a more efficient way. This one chugs. Is it becasuse the average function? Is it unavoidable.
SELECT d.dept_name, AVG(s.salary) AS averageSalary
FROM salaries AS s
INNER JOIN employees AS e
	ON s.emp_no = e.emp_no
INNER JOIN dept_emp AS de
	ON s.emp_no = de.emp_no
INNER JOIN departments AS d
	ON d.dept_no = de.dept_no
GROUP BY de.dept_no
ORDER BY averageSalary DESC
LIMIT 1
;

-- It feels computationaly cheap, but I just limited the query instead of some sort of CLAUSE to filter. Or was this the efficient way?
SELECT e.first_name, e.last_name, s.salary
FROM employees AS e
INNER JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
INNER JOIN departments AS d
	ON d.dept_no = de.dept_no
INNER JOIN salaries AS s
	ON s.emp_no = e.emp_no
WHERE d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1
;

-- Who is the highest paid manager?
SELECT CONCAT(e.first_name,' ', e.last_name) AS full_name, d.dept_name, s.salary AS currentSalary
FROM employees AS e 
INNER JOIN dept_manager AS dm
	ON e.emp_no = dm.emp_no
INNER JOIN departments AS d
	ON d.dept_no = dm.dept_no
INNER JOIN salaries AS s
	ON dm.emp_no = s.emp_no	
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
LIMIT 1
;

-- BONUS FIND highest paid employee in all the data. 