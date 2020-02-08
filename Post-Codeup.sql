SELECT country.Name, COUNT(ID)
FROM city
JOIN country ON city.CountryCode = country.Code
GROUP BY country.Name
HAVING COUNT(ID) < 5 
;

SELECT city.Name, city.population
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE country.Name = 'Brazil'
;