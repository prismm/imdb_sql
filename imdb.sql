SELECT name, year FROM movies WHERE year=1987;
SELECT COUNT(name) FROM movies WHERE year=1982;
SELECT id, first_name, last_name, gender FROM actors WHERE last_name LIKE '%stack%';

SELECT COUNT(*) AS num, first_name, gender 
FROM actors 
WHERE gender='F' 
GROUP BY(first_name) 
ORDER BY num desc 
LIMIT 10;

SELECT COUNT(*) AS num, first_name, last_name
FROM actors
INNER JOIN roles ON actors.id = roles.actor_id
GROUP BY actors.id
ORDER BY num desc
LIMIT 100;

SELECT COUNT(*) AS num, genre
FROM movies_genres
INNER JOIN movies ON movies_genres.movie_id = movies.id
GROUP BY genre
ORDER BY num asc;

SELECT last_name, first_name
FROM actors
INNER JOIN roles ON actors.id = roles.actor_id
INNER JOIN movies ON roles.movie_id = movies.id
WHERE movies.name = "Braveheart" AND movies.year = 1995
ORDER BY last_name;

SELECT directors.first_name, directors.last_name, movies.name, movies.year
FROM directors
INNER JOIN movies_directors ON directors.id = movies_directors.director_id
INNER JOIN movies ON movies.id = movies_directors.movie_id
INNER JOIN movies_genres ON movies_genres.movie_id = movies.id
WHERE movies.year % 4 = 0 AND movies_genres.genre = "Film-Noir";



SELECT movies.name, actors.first_name, actors.last_name
FROM roles
INNER JOIN movies ON roles.movie_id = movies.id
INNER JOIN actors ON roles.actor_id = actors.id
WHERE roles.actor_id = 22591;

SELECT sub.name, actors.first_name, actors.last_name
   FROM(
       SELECT movies.name, movies.id
       FROM movies
       INNER JOIN roles ON roles.movie_id = movies.id
       WHERE roles.actor_id = 22591
       GROUP BY movies.name
    ) sub
INNER JOIN roles ON roles.movie_id = sub.id
INNER JOIN actors ON actors.id = roles.actor_id
WHERE actors.first_name != 'Kevin' AND actors.last_name != 'Bacon';

SELECT first_name, last_name, actors.id
FROM actors 
INNER JOIN roles ON actors.id = roles.actor_id 
INNER JOIN movies ON roles.movie_id = movies.id
WHERE movies.year < 1900
GROUP BY actors.id
INTERSECT
SELECT first_name, last_name, actors.id
FROM  actors 
INNER JOIN roles ON actors.id = roles.actor_id 
INNER JOIN movies ON roles.movie_id = movies.id
WHERE movies.year > 2000
GROUP BY actors.id ORDER BY actors.id asc;

//Find actors that played five or more roles in the same 
movie after the year 1990. Notice that ROLES may have 
occasional duplicates, but we are not interested in these: 
we want actors that had five or more distinct (cough cough)
roles in the same movie. Write a query that returns the 
actors names, the movie name, and the number of distinct 
roles that they played in that movie (which will be ≥ 5).

SELECT COUNT(DISTINCT roles.role) AS num, actors.first_name, actors.last_name, movies.name, movies.year 
FROM actors
INNER JOIN roles ON actors.id = roles.actor_id
INNER JOIN movies ON roles.movie_id = movies.id
WHERE movies.year > 1990
GROUP BY movies.id, actors.id
HAVING num >= 5;

SELECT COUNT(DISTINCT movies.id) AS num, movies.year
FROM movies
INNER JOIN roles ON roles.movie_id = movies.id
INNER JOIN actors ON actors.id = roles.actor_id
WHERE actors.gender != "M"
GROUP BY movies.year
ORDER BY movies.year desc;



SELECT COUNT(DISTINCT movies.id) AS num, movies.year
FROM movies

 FROM  (
    SELECT actors.id
    FROM actors 
    WHERE actors.gender = "F"
 ) sub
 INNER JOIN roles ON roles.movie_id = movies.id
 INNER JOIN actors ON roles.actor_id = sub.id
GROUP BY movies.year
ORDER BY movies.year desc;



//syntax
SELECT sub.*
    FROM (
        SELECT *
        FROM movies
        WHERE 
    ) 
    
    JOIN (
        SELECT first_name, last_name 
        FROM actors
        WHERE
    ) sub
WHERE 