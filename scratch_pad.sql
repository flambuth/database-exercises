SHOW DATABASES;

-- same as the following query, but more explicit
select * from mysql.user;

-- all fields from the user table in the mysql DB
select * from user;

-- selects 3 fields form the mysql DB/help_topic Table
SELECT help_topic_id, help_category_id, url FROM mysql.help_topic;

select user.`File_priv` from user;

use fruits_db;

use albums_db;

show tables;

describe albums;

SELECT name AS record, genre AS style
FROM albums;

-- Trying to break into using AS or subqueries
SELECT release_date,CONCAT(name,' by ',artist) AS record
FROM albums
WHERE sales>20 AND release_date<2000
;