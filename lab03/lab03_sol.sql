/* 
Stella Ullman
CSC 362: Database Systems F23
Lab 03: Tables and Fields in SQL
This lab creates a database movie_ratings to store consumer contact information
and data on what movies consumers have seen. The database is then revised
to be more usable and practical.
*/

DROP DATABASE IF EXISTS movie_ratings; -- checks for pre-existing database to avoid conflict
CREATE DATABASE movie_ratings;
USE movie_ratings;

CREATE TABLE Movies(
    Primary Key (movie_id),
    movie_id INT AUTO_INCREMENT, -- a number to uniquely identify each movie
    movie_title  VARCHAR(64),
    release_date VARCHAR(16),
    genre   VARCHAR(64)
);
CREATE TABLE Consumers(
    PRIMARY KEY (consumer_id),
    consumer_id  INT AUTO_INCREMENT, --  a number to uniquely identify each consumer
    first_name VARCHAR(64),
    last_name  VARCHAR(64),
    address  VARCHAR(64), -- street address eg. "600 W Walnut St"
    city    VARCHAR(64),
    state   VARCHAR(8), -- two letter abbreviation eg. "KY"
    zipcode VARCHAR(8)
);
CREATE TABLE Ratings(
    movie_id INT,
    consumer_id INT,
    when_rated   VARCHAR(32),
    number_stars INT,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id), 
    FOREIGN KEY (consumer_id) REFERENCES Consumers(consumer_id),
    --  establish that movie_id and consumer_id come from other tables
    PRIMARY KEY (movie_id, consumer_id) --   creates composite primary key
);

INSERT INTO Movies(movie_title, release_date, genre)
VALUES
('The Hunt For Red October', '1990-03-02', 'Action, Adventure, Thriller'),
('Lady Bird', '2017-12-01', 'Comedy, Drama'),
('Inception', '2010-08-16', 'Action, Adventure, Science Fiction'),
('Monty Python and the Holy Grail', '1975-04-03', 'Comedy');

INSERT INTO Consumers(first_name, last_name, address, city, state, zipcode)
VALUES
('Toru', 'Okada', '800 Glenridge Ave', 'Hobart', 'IN', '46343'),
('Kumiko', 'Okada', '864 NW Bohemia St', 'Vincentown', 'NJ', '08088'),
('Noboru', 'Wataya', '342 Joy Ridge St', 'Hermitage', 'TN', '37076'),
('May', 'Kashara', '5 Kent Rd', 'East Haven', 'CT', '06512');

INSERT INTO Ratings(movie_id, consumer_id, when_rated, number_stars)
VALUES
(1, 1, '2010-09-02 10:54:19', 4),
(1, 3, '2012-08-05 15:00:01', 3),
(1, 4, '2016-10-02 23:58:12', 1),
(2, 3, '2017-03-27 00:12:48', 2),
(2, 4, '2018-08-02 00:54:42', 4);

 SELECT first_name, last_name, movie_title, number_stars -- values we want to see displayed
    FROM Movies --  use Movies as base table
        NATURAL JOIN Ratings -- append specified information from Ratings to Movies
        NATURAL JOIN Consumers; -- append specified information from Consumers to Movies

/* A major flaw in our database is the Movies table. The field for Genre
is multivalued, and this is creating overly complicated and unhelpful data.
The way we can fix this is by creating a seperate Genres table and
a linking table between Genres and Movies */

/* NEW DATABASE */
DROP DATABASE IF EXISTS movie_ratings; -- drops previous database created above
CREATE DATABASE movie_ratings;
USE movie_ratings;

CREATE TABLE Movies(
    Primary Key (movie_id),
    movie_id INT AUTO_INCREMENT,
    movie_title  VARCHAR(64),
    release_date VARCHAR(16)
);

CREATE TABLE Genres( -- create new table Genres
    Primary Key (genre_id),
    genre_id INT Auto_INCREMENT,
    genre_name VARCHAR(64) -- genre values previously stored in Movies, eg. "Adventure"
);

CREATE TABLE MovieGenre( -- linking table for Genres and Movies
    movie_id INT,
    genre_id INT,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id),
    PRIMARY KEY (movie_id, genre_id) -- composite primary key
);

CREATE TABLE Consumers(
    PRIMARY KEY (consumer_id),
    consumer_id  INT AUTO_INCREMENT,
    first_name VARCHAR(64),
    last_name  VARCHAR(64),
    address  VARCHAR(64),
    city    VARCHAR(64),
    state   VARCHAR(32),
    zipcode VARCHAR(8)
);
CREATE TABLE Ratings(
    movie_id INT,
    consumer_id INT,
    when_rated   VARCHAR(32),
    number_stars INT,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (consumer_id) REFERENCES Consumers(consumer_id),
    PRIMARY KEY (movie_id, consumer_id)
);

INSERT INTO Movies(movie_title, release_date)
VALUES
('The Hunt For Red October', '1990-03-02'),
('Lady Bird', '2017-12-01'),
('Inception', '2010-08-16'),
('Monty Python and the Holy Grail', '1975-04-03');

INSERT INTO Genres(genre_name)
VALUES
('Adventure'),
('Action'),
('Thriller'),
('Comedy'),
('Drama'),
('Science Fiction');

INSERT INTO MovieGenre(movie_id, genre_id)
VALUES
(1,1),
(1,2),
(1,3),
(2,4),
(2,5),
(3,1),
(3,2),
(3,6),
(4,4);

INSERT INTO Consumers(first_name, last_name, address, city, state, zipcode)
VALUES
('Toru', 'Okada', '800 Glenridge Ave', 'Hobart', 'IN', '46343'),
('Kumiko', 'Okada', '864 NW Bohemia St', 'Vincentown', 'NJ', '08088'),
('Noboru', 'Wataya', '342 Joy Ridge St', 'Hermitage', 'TN', '37076'),
('May', 'Kashara', '5 Kent Rd', 'East Haven', 'CT', '06512');

INSERT INTO Ratings(movie_id, consumer_id, when_rated, number_stars)
VALUES
(1, 1, '2010-09-02 10:54:19', 4),
(1, 3, '2012-08-05 15:00:01', 3),
(1, 4, '2016-10-02 23:58:12', 1),
(2, 3, '2017-03-27 00:12:48', 2),
(2, 4, '2018-08-02 00:54:42', 4);

