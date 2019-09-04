-- The extras exercises using the Sakila database

-- Display the first and last names in all lowercase of all the actors.
SELECT LOWER(first_name), LOWER(last_name)
FROM actor
;

-- You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." 
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'Joe'
;


-- Find all actors whose last name contain the letters "gen":
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%gen%'
;

-- Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%li%'
ORDER BY last_name, first_name
;

-- List the last names of all the actors, as well as how many actors have that last name.
-- This one is frustrating. 
SELECT last_name, first_name, COUNT(*)
FROM actor
GROUP BY last_name, first_name
;

-- List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
-- You cannot locate the schema of the address table. Which query would you use to re-create it?