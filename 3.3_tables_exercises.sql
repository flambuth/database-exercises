SHOW TABLES;
#There are 2 variable sized string character types, 2 date types on the salaries table, 1 integer type, and one ENUM type that is a string that can only be a member of a given list of strings.
#I bet the salaries table has lots of numerical types.
#Titles would have lots of strings.
#dept_emp_latest_date would definitely have lots of date types.
#I do not see any related fields between the departments table and the employees table.
SHOW CREATE TABLE `dept_manager`;