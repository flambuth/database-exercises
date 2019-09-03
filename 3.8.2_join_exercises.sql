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