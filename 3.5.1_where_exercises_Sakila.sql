-- The extras exercises using the Sakila database

-- Display the first and last names in all lowercase of all the actors.
SELECT LOWER(first_name), LOWER(last_name)
FROM actor
;

-- You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." 


-- What is one query would you could use to obtain this information?

-- Find all actors whose last name contain the letters "gen":

-- Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.