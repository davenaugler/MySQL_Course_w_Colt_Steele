-- Section 14: Many to Many
    -- TV Series Challenges
-- ---------------------------
-- Creating the database
CREATE DATABASE tv_db;
SHOW DATABASES;
USE tv_db;

-- Creating the tables for the database
CREATE TABLE reviewers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE series (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    released_year YEAR NOT NULL,
    genre VARCHAR(100) NOT NULL
);

CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rating DECIMAL(3,1) NOT NULL,
    series_id INT NOT NULL,
    reviewer_id INT NOT NULL,
    FOREIGN KEY (series_id) REFERENCES series(id),
    FOREIGN KEY (reviewer_id) REFERENCES reviewers(id)
);

SHOW TABLES;

-- Adding the data to our tables
INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');

SELECT * FROM series;

INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');

SELECT * FROM reviewers;

INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);

SELECT * FROM reviews;
-- ---------------------------------------------------
-- TV Series Challenge #1
   -- Display title | rating
SELECT title, rating FROM series
JOIN reviews ON series.id = reviews.series_id;
-- ---------------------------------------------------

-- TV Series Challenge #2
   -- Display title | avg_rating
SELECT title, AVG(rating) AS avg_rating FROM series
JOIN reviews on series.id = reviews.series_id
GROUP BY title ORDER BY avg_rating;

   -- Display title | avg_rating
      -- Same thing but ROUNDING the AVG rating
      -- Displaying in DESC order of rating
SELECT title, ROUND(AVG(rating), 1) AS avg_rating FROM series
JOIN reviews on series.id = reviews.series_id
GROUP BY title ORDER BY avg_rating DESC;
-- ---------------------------------------------------

-- TV Series Challenge #3
   -- Display first_name | last_name | rating
SELECT id, reviewers.first_name, reviewers.last_name FROM reviewers;
SELECT * FROM reviews;

SELECT * FROM reviewers
JOIN reviews ON reviews.reviewer_id = reviewers.id;

SELECT first_name, last_name, rating FROM reviewers
JOIN reviews ON reviews.reviewer_id = reviewers.id;
-- ---------------------------------------------------

-- TV Series Challenge #4a
   -- Display unreviewed_series (find the ones without reviews)
   -- As LEFT JOIN
SELECT title AS unreviewed_series FROM series
LEFT JOIN reviews ON series.id = reviews.series_id
WHERE rating IS NULL;
--   unreviewed_series
-- --------------------------
--   Malcolm In The Middle
--   Pushing Daisies

-- TV Series Challenge #4b
   -- Display unreviewed_series (find the ones without reviews)
   -- As RIGHT JOIN
SELECT title AS unreviewed_series FROM reviews
RIGHT JOIN series ON series.id = reviews.series_id
WHERE rating IS NULL;
--   unreviewed_series
-- --------------------------
--   Malcolm In The Middle
--   Pushing Daisies
-- ---------------------------------------------------

-- TV Series Challenge #5
   -- Display genre | avg_rating
SELECT series.genre FROM series;
SELECT AVG(reviews.rating) FROM reviews;

SELECT series.genre, ROUND(AVG(reviews.rating), 2) AS avg_rating FROM series
JOIN reviews ON series.id = reviews.series_id
GROUP BY genre;
--  genre      |  avg_rating
--  ---------------------------
--   Animation |   7.86
--   Comedy    |   8.16
--   Drama     |   8.04
-- ---------------------------------------------------

-- TV Series Challenge #6
   -- Display first_name | last_name | COUNT | MIN | MAX | AVG | STATUS
SELECT reviewers.first_name, reviewers.last_name FROM reviewers;

-- Step 1:Inner Join essential content
SELECT * FROM reviewers
JOIN reviews ON reviewers.id = reviews.reviewer_id;

-- Step 2: Left Join, to grab everyone
SELECT * FROM reviewers
JOIN reviews ON reviewers.id = reviews.reviewer_id;

-- Step 3: Left Join, to grab everyone
SELECT first_name, last_name,
       COUNT(rating) AS COUNT,
       IFNULL(MIN(rating), 0) AS MIN,
       IFNULL(MAX(rating), 0) AS MAX,
       IFNULL(ROUND(AVG(rating), 2), 0) AS AVG,
       IF(COUNT(rating) > 0, 'ACTIVE', 'INACTIVE') AS STATUS FROM reviewers
LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY first_name, last_name;

--  first_name    |  last_name    | COUNT  | MIN   | MAX   | AVG    | STATUS
-- -----------------------------------------------------------------------------------
--    Thomas      |   Stoneman    |   5    |  7.0  |  9.5  |  8.02  |  ACTIVE
--    Wyatt       |   Skaggs      |   9    |  5.5  |  9.3  |  7.80  |  ACTIVE
--    Kimbra      |   Masters     |   9    |  6.8  |  9.0  |  7.99  |  ACTIVE
--    Domingo     |   Cortes      |   10   |  5.8  |  9.1  |  7.83  |  ACTIVE
--    Colt        |   Steele      |   10   |  4.5  |  9.9  |  8.77  |  ACTIVE
--    Pinkie      |   Petit       |   4    |  4.3  |  8.8  |  7.25  |  ACTIVE
--    Marlon      |   Crafford    |   0    |  0.0  |  0.0  |  0.00  |  INACTIVE

-- Example of using CASE statements rather than IF when adding multiple options for STATUS
SELECT first_name, last_name,
       COUNT(rating) AS COUNT,
       IFNULL(MIN(rating), 0) AS MIN,
       IFNULL(MAX(rating), 0) AS MAX,
       IFNULL(ROUND(AVG(rating), 2), 0) AS AVG,
       CASE
           WHEN COUNT(rating) >= 10 THEN 'POWER-USER'
           WHEN COUNT(rating) > 0 THEN 'ACTIVE'
           ELSE 'INACTIVE'
      END AS STATUS
FROM reviewers
LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY first_name, last_name;

--  first_name    |  last_name    | COUNT  | MIN   | MAX   | AVG    | STATUS
-- -----------------------------------------------------------------------------------
--    Thomas      |   Stoneman    |   5    |  7.0  |  9.5  |  8.02  |  ACTIVE
--    Wyatt       |   Skaggs      |   9    |  5.5  |  9.3  |  7.80  |  ACTIVE
--    Kimbra      |   Masters     |   9    |  6.8  |  9.0  |  7.99  |  ACTIVE
--    Domingo     |   Cortes      |   10   |  5.8  |  9.1  |  7.83  |  ACTIVE
--    Colt        |   Steele      |   10   |  4.5  |  9.9  |  8.77  |  ACTIVE
--    Pinkie      |   Petit       |   4    |  4.3  |  8.8  |  7.25  |  ACTIVE
--    Marlon      |   Crafford    |   0    |  0.0  |  0.0  |  0.00  |  INACTIVE
-- -----------------------------------------------------------------------------------


-- TV Series Challenge #7
   --  title | rating | reviewer

-- Way #1
SELECT series.title, reviews.rating, CONCAT(reviewers.first_name, SPACE(1), reviewers.last_name) AS reviewer FROM series
JOIN reviews ON reviews.series_id = series.id
JOIN reviewers ON reviews.reviewer_id = reviewers.id;

-- Step 1
SELECT series.title, rating FROM reviews
JOIN series ON reviews.series_id = series.id;

-- Step 2
SELECT * FROM reviews
JOIN series ON reviews.series_id = series.id
JOIN reviewers ON  reviews.reviewer_id = reviewers.id;

-- Step 3
   -- Way #2
SELECT title, rating, CONCAT(first_name, SPACE(1), last_name) AS reviewer FROM reviews
JOIN series ON reviews.series_id = series.id
JOIN reviewers ON reviews.reviewer_id = reviewers.id;


-- Way #3
SELECT title, rating, CONCAT(first_name, SPACE(1), last_name) AS reviewer FROM reviewers
JOIN reviews ON reviews.reviewer_id = reviewers.id
JOIN series ON  reviews.series_id = series.id;


SELECT * FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

SELECT  FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;