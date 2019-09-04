-- I lost this one. It's a re-do. For 3.5.1_where_exercises.sql

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Maya' OR first_name = 'Vidya'
ORDER BY first_name ASC
;

-- Find all employees whose last name starts with 'E' — 7,330 rows.
SELECT first_name, last_name
FROM employees
WHERE first_name REGEXP '^E.+'
;

-- Find all employees hired in the 90s — 135,214 rows.
-- Find all employees born on Christmas — 842 rows.
-- Find all employees with a 'q' in their last name — 1,873 rows.