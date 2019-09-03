SELECT *
FROM actor
WHERE `last_name` REGEXP 'son$';

-- This will select the first and last name from the actors table and the title from the film table
-- It is selecting from 3 joined tables. actor JOINED film_actor ON actor_id, which they share
-- The film table is then joined to give the SELECT funciton in the beginning 3 joined tables to SELECT from
-- SELECT function does not even SELECT anything from the film_actor table. It just joined them so it could find the movies made by each actor
SELECT actor.first_name, actor.last_name, film.title
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film_actor.film_id = film.film_id
;

-- Lets see if I can WHERE-filter out based on some fields in the film table
-- The WHERE at the bottom is filtering down the SELECT results
-- This one will show matches that have end with the word dinosaur in film.title
SELECT actor.first_name, actor.last_name, film.title, film.release_year
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film_actor.film_id = film.film_id
WHERE film.title REGEXP 'dinosaur$'
;