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

-- What is the population for each continent?
SELECT continent, SUM(population) AS population
FROM country
GROUP BY continent
ORDER By SUM(population) DESC 
;

-- What is the average life expectancy globally?
SELECT AVG(lifeExpectancy)
FROM country 
;

-- What is the average life expectancy for each region, each continent? Sort the results from shortest to longestA
SELECT region, AVG(lifeExpectancy)
FROM country 
GROUP BY region
ORDER BY AVG(lifeExpectancy)
;

SELECT continent, AVG(lifeExpectancy)
FROM country 
GROUP BY continent
ORDER BY AVG(lifeExpectancy)
;