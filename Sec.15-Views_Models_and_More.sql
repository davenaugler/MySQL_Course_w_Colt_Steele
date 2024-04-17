-- Section 15: Views, Models, & More
-- ------------------------------------

-- Introduction to Views
-- ------------------------------------

SELECT series.title, series.released_year, series.genre, reviews.rating, reviewers.first_name, reviewers.last_name FROM tv_db.reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

-- Create custom table
   -- Creating your own custom tables allows you to write much shorter query's
CREATE VIEW full_reviews AS
SELECT series.title, series.released_year, series.genre, reviews.rating, reviewers.first_name, reviewers.last_name FROM tv_db.reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

-- Ensure it was created
SHOW TABLES;

DESC full_reviews;

-- Display that "custom table" called full_reviews
SELECT * FROM full_reviews;

-- Display full_reviews WHERE genre = 'Animation';
SELECT * FROM full_reviews WHERE genre = 'Animation';

SELECT full_reviews.genre, AVG(rating) AS avg_rating FROM full_reviews GROUP BY genre ORDER BY avg_rating DESC;
-- genre     | avg_rating
-- ----------------------------
-- Comedy    |  8.16250
-- Drama     |  8.04375
-- Animation |  7.86000
-- ----------------------------------------------

-- Updatable Views
   -- Creating a view, adding content to it, and deleting that content
-- ----------------------------------------------
-- Views are not true tables meaning that you can not perform all table operations with a view
SELECT * FROM full_reviews;

-- Error: Can not delete from join view 'tv_db.full_reviews'
   -- Means this is not a real table and because this is a join view, you can't delete
DELETE FROM full_reviews WHERE released_year = 2010;

SELECT * FROM series ORDER BY released_year;

CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

SELECT * FROM ordered_series;

INSERT INTO ordered_series (title, released_year, genre)
VALUES ('The Great', 2020, 'Comedy');

SELECT * FROM ordered_series;

SELECT * FROM series;

DELETE FROM ordered_series WHERE title = 'The Great';

SELECT * FROM ordered_series;
SELECT * FROM series;
-- ----------------------------------------------


-- Replacing/Altering Views
    -- How to change the query itself
-- ----------------------------------------------
SELECT * FROM ordered_series;

-- Error: Table 'ordered_series' already exists
   -- This view is not a real table but it's being treated as a
   --   as a table in this situation
CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;

-- This will because we'll either CREATE or REPLACE the view
CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;

SELECT * FROM ordered_series;

ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

SELECT * FROM ordered_series;

DROP VIEW ordered_series;

SELECT * FROM series;
-- ----------------------------------------------

-- HAVING clause
    -- Group by HAVINB
-- ----------------------------------------------
SELECT * FROM full_reviews;

SELECT full_reviews.title, AVG(rating), COUNT(rating) AS review_count FROM full_reviews GROUP BY title;

SELECT full_reviews.title, AVG(rating) FROM full_reviews GROUP BY title HAVING COUNT(rating) > 1;

SELECT full_reviews.title, AVG(rating), COUNT(rating) AS review_count FROM full_reviews GROUP BY title HAVING COUNT(rating) > 1;
-- ----------------------------------------------


-- WITH ROLLUP
-- ----------------------------------------------
SELECT * FROM full_reviews;

SELECT AVG(rating) AS avg_rating FROM full_reviews;

SELECT title, AVG(rating) AS avg_rating FROM full_reviews GROUP BY title;

SELECT title, AVG(rating) AS avg_rating FROM full_reviews GROUP BY title WITH ROLLUP;

SELECT title, COUNT(rating) AS rating_count FROM full_reviews GROUP BY title WITH ROLLUP;

SELECT full_reviews.released_year, AVG(rating) AS avg_rating FROM full_reviews GROUP BY released_year;

SELECT full_reviews.released_year, AVG(rating) AS avg_rating FROM full_reviews GROUP BY released_year WITH ROLLUP;

SELECT full_reviews.released_year, genre, AVG(rating) AS avg_rating FROM full_reviews GROUP BY released_year, genre;

SELECT full_reviews.released_year, genre, AVG(rating) AS avg_rating FROM full_reviews GROUP BY released_year, genre WITH ROLLUP;
-- ----------------------------------------------

-- SQL Modes Basics
-- ----------------------------------------------
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;

SELECT 3/0;
SHOW WARNINGS;
-- ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,
-- ERROR_FOR_DIVISION_BY_ZERO
-- NO_ENGINE_SUBSTITUTION |


SET SESSION sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
SELECT @@SESSION.sql_mode;

SELECT 3/0;
SHOW WARNINGS;


-- STRICT_TRANS_TABLES
-- ----------------------------------------------
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSON.sql_mode;

DESC reviews;

-- Error: Incorrect decimal value: 'hi' for column 'rating' at row 1
INSERT INTO reviews(rating) VALUE ('hi');

SELECT * FROM reviews;

-- 'hi' was not inserted

-- Example if STRICT_TRANS_TABLES was turned off
-- If STRICT_TRANS_TABLES was turned off then you'd be able to insert
--  a string into a int or decimal. And there would be a 0 or 0.0 in the strings place






-- More Modes
-- ----------------------------------------------