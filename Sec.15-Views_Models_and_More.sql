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

-- save to laptop








-- HAVING clause
-- ----------------------------------------------











-- WITH ROLLUP
-- ----------------------------------------------












-- SQL Modes Basics
-- ----------------------------------------------









-- STRICT_TRANS_TABLES
-- ----------------------------------------------










-- More Modes
-- ----------------------------------------------