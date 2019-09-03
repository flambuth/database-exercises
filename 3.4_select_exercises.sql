SELECT name
FROM `albums`
WHERE artist = 'Pink Floyd';
#Find name of all Floyd albums.

SELECT release_date
FROM `albums`
WHERE name='Sgt. Pepper\'s Lonely Hearts Club Band';
#Find release year of the Sgt. Pepper album

SELECT genre
FROM `albums`
WHERE name='Nevermind';
#Find genre for the album Nevermind

SELECT name
FROM `albums`
WHERE release_date BETWEEN 1990 AND 1999;
#Find the 90's albums

SELECT name 
FROM `albums`
WHERE sales < 20;
#Find albums that had sales less than 20 millions

SELECT name
FROM `albums`
WHERE genre = "Rock";
#This query explicitly selects albums that have 'Rock' in their genres field. The string "Hard rock" is not selected. Maybe add an OR statement to accept a range of answers.