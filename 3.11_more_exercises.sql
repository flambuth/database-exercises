-- The extras

-- How much do the current managers of each department get paid, relative to the average salary for the department? 
-- Is there any department where the department manager gets paid less than the average salary?

-- What languages are spoken in Santa Monica?
SELECT cl.Language, cl.Percentage
FROM city as ci
INNER JOIN countrylanguage AS cl
	ON ci.CountryCode = cl.CountryCode
WHERE ci.name = 'Santa Monica'
ORDER By cl.Percentage DESC 
; 

-- How many different countries are in each region?
SELECT count(c.region), c.region
FROM country AS c
GROUP BY c.region
;

-- What is the population for each region?
SELECT co.region, SUM(co.population)
FROM country AS co
GROUP BY co.region
;

-- Next one will be pushed to git with a bash script
-- With the right escape character. 