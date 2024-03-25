-- CRUD Basics
DROP TABLE cats;

CREATE TABLE cats
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT
);

DESC cats;

INSERT INTO cats (name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Main Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

select * from cats;

-- READ

select * from cats;

SELECT name FROM cats;

SELECT age FROM cats;

SELECT name, age FROM cats;

SELECT name, breed from cats;

-- WHERE

SELECT * FROM cats WHERE age = 4;

SELECT name, age FROM cats WHERE age = 4;

SELECT * FROM cats WHERE name = 'egg';

-- RAPID FIRE EXERCISES
-- #1
SELECT id FROM cats;

-- #2
SELECT name, breed FROM cats;

-- #3
SELECT name, age FROM cats WHERE breed = 'Tabby';

-- #4
SELECT id, age FROM cats WHERE id = age;

-- UPDATE
UPDATE cats SET breed = 'Shorthair'
WHERE breed = 'Tabby';

SELECT * FROM cats;

UPDATE cats SET breed = 'Main Coon'
WHERE breed = 'Maine Coon';

SELECT * FROM cats;

UPDATE cats SET age = 14
WHERE id = 5;

SELECT * FROM cats;

-- SELECT THE ROW BEFORE YOU UPDATE
--   To ensure you're grabbing the correct data
SELECT * FROM cats WHERE name = 'Misty';
UPDATE cats SET age = 14
WHERE name = 'Misty';

-- Update Exercise
SELECT * FROM cats;

-- #1
SELECT * FROM cats WHERE name = 'Jackson';

UPDATE cats SET name = 'Jack'
WHERE name = 'Jackson';

SELECT * FROM cats;


-- #2
SELECT * FROM cats WHERE name = 'Ringo';

UPDATE cats SET breed = 'British Shorthairair'
WHERE name = 'Ringo';

SELECT * FROM cats;

-- #3
SELECT * FROM cats WHERE breed = 'Main Coon';

UPDATE cats SET age = 12
WHERE breed = 'Main Coon';

SELECT * FROM cats;

-- My Update to correct the Maine Coon entries
SELECT * FROM cats WHERE breed = 'Main Coon';

UPDATE cats SET breed = 'Maine Coon'
WHERE breed = 'Main Coon';

SELECT * FROM cats;

-- DELETE
DELETE FROM cats WHERE name = 'Egg';

SELECT * FROM cats;

-- Delete Exercise

-- #1 Delete all 4 year old cats
SELECT * FROM cats WHERE age = 4;
DELETE FROM cats WHERE age = 4;
SELECT * FROM cats;

-- #2 Delete cats whose age is the same as their id
SELECT * FROM cats WHERE age = id;
DELETE FROM cats WHERE age = id;
SELECT * FROM cats;

-- Ooops
CREATE TABLE cats
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT
);

DESC cats;

INSERT INTO cats (name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Main Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

select * from cats;

-- #2 Delete all the cats
SELECT * FROM cats;
TRUNCATE TABLE cats;
-- OR
DELETE FROM cats;
SELECT * FROM cats;
DESC cats;

-- CRUD Challenge
-- #1 Create a new database shirts_db
CREATE DATABASE shirts_db;
USE shirts_db;


-- #2 Create a new table shirts
--     Values shirt_id, article, color, shirt_size, last_worn
CREATE TABLE shirts
(
   shirt_id INT AUTO_INCREMENT PRIMARY KEY,
   article VARCHAR(30),
   color VARCHAR(30),
   shirt_size VARCHAR(5),
   last_worn INT
);
DESC shirts;

-- Insert data
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
       ('t-shirt', 'green', 'S', 200),
       ('polo shirt', 'black', 'M', 10),
       ('tank top', 'blue', 'S', 50),
       ('t-shirt', 'pink', 'S', 0),
       ('polo shirt', 'red', 'M', 5),
       ('tank top', 'white', 'S', 200),
       ('tank top', 'blue', 'M', 15);
SELECT * FROM shirts;


-- #3 Add a new shirt, purple, polo shirt, size M, last worn 50 days ago
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUE ('polo shirt', 'purple', 'M', 50);
SELECT * FROM shirts;


-- #4 Select all shirts but only print out Article and Color
SELECT shirts.article, shirts.color FROM shirts;
SELECT article, color FROM shirts;


-- #5 Select all Medium shirts, print out everything but the shirt_id
SELECT * FROM shirts WHERE shirt_size='M';
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size = 'M';


-- #6 Update all polo shirts, change their size to L
SELECT * FROM shirts WHERE article='polo shirt';
UPDATE shirts SET shirt_size = 'L' WHERE article = 'polo shirt';
SELECT article, shirt_size FROM shirts WHERE article = 'polo shirt';
SELECT * FROM shirts;


-- #7 Update the shirt last worn 15 days ago
--    Change last_worn to 0
SELECT * FROM shirts WHERE last_worn=15;
UPDATE shirts SET last_worn = 0 WHERE last_worn = 15;


-- #8 Update all white shirts
--    Change size to 'XS' and color to 'off white'
SELECT * FROM shirts WHERE color = 'white';
UPDATE shirts SET color = 'off white', shirt_size = 'XS' WHERE color = 'white';
SELECT * FROM shirts;
SELECT * FROM shirts WHERE color = 'off white';


-- #9 Delete all old shirts
--   last worn 200 days ago
SELECT last_worn FROM shirts WHERE last_worn = 200;
DELETE FROM shirts WHERE last_worn = 200;
SELECT * FROM shirts;


-- #10 Delete all tank tops
--    Your tastes have changed
SELECT shirts.article FROM shirts WHERE article = 'tank top';
DELETE FROM shirts WHERE article = 'tank top';
SELECT * FROM shirts;


-- #11 Delete all shirts
DELETE FROM shirts;
DELETE FROM shirts WHERE 1=1;
SELECT * FROM shirts;


-- #12 Drop the entire shirts table
DROP DATABASE shirts_db;













































