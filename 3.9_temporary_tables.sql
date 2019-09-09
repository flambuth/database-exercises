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
-- You can run this block everytime you make some changes to the tempTable
SELECT * FROM employees_with_departments;

-- 1a
-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
-- I think theres a way to use the LEN function and add them together instead of me deducing the VARlength of 31
ALTER TABLE `employees_with_departments` 
ADD full_name VARCHAR(31);

-- 1b
-- Update the table so that full name column contains the correct data
UPDATE `employees_with_departments`
SET full_name=CONCAT(first_name, ' ', last_name)
;

-- 1c
-- Remove the first and last name columns
-- I ran this DROP COLUMN twice. Switching out the column name to be dropped. I tried AND or chaining them but one of them stayed.
ALTER TABLE `employees_with_departments`
DROP COLUMN last_name
;

SELECT * FROM `employees_with_departments`;

-- 1d
-- What is another way you could have ended up with this same table?
-- My guess would be to make that full_name field in the CREATE temporary table command. Lets see
-- modifying the original create temp table
	CREATE TABLE employees_with_departmentsGood AS
	SELECT 
		emp_no
		,CONCAT(first_name,' ',last_name) AS full_name
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

-- Maybe I have to update the table name because creating it twice with an alias didnt change anything.
SELECT CONCAT(first_name, ' ', last_name) FROM employees_with_departmentsGood AS full_name;

-- 2
-- Create a temporary table based on the payment table from the sakila database.
-- I dont know if it'd be best to get rid of the temp table i made earlier in this sql file
