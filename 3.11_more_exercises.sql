-- The extras

-- How much do the current managers of each department get paid, relative to the average salary for the department? 
-- Is there any department where the department manager gets paid less than the average salary?

-- What languages are spoken in Santa Monica?
SELECT ci.name, co.name
FROM city as ci
INNER JOIN country AS co
	ON ci.countrycode = co.code
; 