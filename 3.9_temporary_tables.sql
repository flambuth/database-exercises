USE bayes_809;

-- Copied this from Kevins github. Ill have to figure out why this dosent give permission errors.
	CREATE TABLE employees_with_departments AS
	SELECT 
		emp_no
		,first_name
		,last_name
		,dept_no
		,dept_name
	FROM 
		employees.employees
	JOIN 
		employees.dept_emp 
		USING(emp_no)
	JOIN 
		employees.departments 
		USING(dept_no)
	;

-- After creating the temptable, it is now in the tables tab to the right

-- A full look at all the records pulled into this temp table
SELECT * FROM employees_with_departments;

-- 1a
-- Add a column