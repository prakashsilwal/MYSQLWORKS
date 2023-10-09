CREATE DATABASE DatabaseRetrieval;  #creating database 

use DatabaseRetrieval; #working in created database

# creating table with required datatype
CREATE TABLE films (
    film_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    budget INT,
    gross_income INT,
    imdb_score DECIMAL(3, 1)
);
# inserting given data in films table
INSERT INTO films (title, release_year, budget, gross_income, imdb_score)
VALUES
    ('The Godfather', 1972, 6000000, 134821952, 9.2),
    ('The Dark Knight', 2008, 185000000, 533316061, 9),
    ('The Godfather Part II', 1974, 13000000, 57300000, 9),
    ('Schindler’s List', 1993, 22000000, 96067179, 8.9),
    ('Star Wars: Episode V - The Empire Strikes Back', 1980, 18000000, 290158751, 8.8),
    ('The Lord of the Rings: The Return of the King', 2003, 94000000, 377019252, 8.9),
    ('Inception', 2010, 160000000, 292568851, 8.8),
    ('Pulp Fiction', 1994, 8000000, 107930000, 8.9),
    ('The Godfather: Part III', 1990, 54000000, 136900000, 7.6),
    ('The Shawshank Redemption', 1994, 25000000, 28341469, 9.3);



#displaying the table
SELECT * FROM films;



#1 . What are the movies released between 2003 – 2010 ?

SELECT title, release_year
FROM films
WHERE release_year BETWEEN 2003 AND 2010;


#2 2. Calculate the profit made by each movie in the ‘films’ table.

SELECT
    title,gross_income,budget,
gross_income - budget AS profit
FROM films;


#3. 3. What are the movies to be released in 2010 and have a rating higher than 9?

SELECT title, release_year, imdb_score
FROM films
WHERE release_year = '2010' AND imdb_score > '9';

#4  What is the total gross_income from the Godfather? (Godfather, Godfather Part II,Godfather Part III)

SELECT SUM(gross_income) AS total_gross_income
FROM films
WHERE title IN ('The Godfather', 'The Godfather Part II', 'The Godfather Part III');

#5 Correct the for ‘The Godfather: Part III’ to be 1990 instead of 1970.
SET SQL_SAFE_UPDATES = 0;

UPDATE films
SET release_year = 1990
WHERE title = 'The Godfather: Part III';

#6 Delete the entry for ‘The Godfather: Part III’ from the ‘films’ table.
DELETE FROM films
WHERE title = 'The Godfather: Part III';

#7 Retrieve all the names of the movie starting with ‘The’
SELECT title
FROM films
WHERE title LIKE 'The%';


#8  What is the latest movie stored in the table?
SELECT title, release_year
FROM films
ORDER BY release_year DESC
LIMIT 1;

#9 Delete the entry for ‘The Godfather: Part III’ from the ‘films’ table.
DELETE FROM films
WHERE title = 'The Godfather: Part III';
