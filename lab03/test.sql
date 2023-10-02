/* In class exmaple using lab3 database on Oct 2*/
/* Show all movie titles in DB */
USE movie_ratings;
/*
SELECT movie_title
    FROM movies;

SELECT movie_title, number_stars
    FROM movies
        NATURAL JOIN number_stars;

SELECT movie_title, number_stars
    FROM movies
        INNER JOIN number_stars
        USING (movie_id);
SELECT first_name, last_name, movie_title
    FROM Consumers
        LEFT OUTER JOIN Ratings
        ON (Consumers.consumer_id = Ratings.consumer_id)
        LEFT OUTER JOIN Movies
        USING(movie_id);
*/
        SELECT first_name,
            last_name,
            COUNT(number_stars)
        FROM Consumers
            INNER JOIN Ratings
            USING (consumer_id)
        GROUP BY (consumer_id)
        HAVING COUNT(number_stars) DESC
        LIMIT 2;
