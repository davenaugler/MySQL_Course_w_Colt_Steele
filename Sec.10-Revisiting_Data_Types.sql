-- SECTION 10 - REVISITING DATA TYPES

CREATE TABLE friends (name VARCHAR(10));

INSERT INTO friends (name)
VALUES ('Tom'), ('Juan Pablo'), ('James');

SELECT * FROM friends;

CREATE TABLE states(abbr CHAR(2));

INSERT INTO states (abbr)
VALUES ('CA'), ('NY'), ('ID');

SELECT * FROM states;

-- CHAR is faster for fixed length text
--   For Example:
--     State Abbreviations: CA, NY
--     Yes/No Flags: Y/N
--     Zip Codes: 59715, 94924
-- Otherwise, use VARCHAR

DESC states;
INSERT INTO states (abbr)
VALUE ('X');

INSERT INTO states (abbr)
VALUE ('XYZ');

SELECT * FROM states;

SELECT CHAR_LENGTH(states.abbr) FROM states;


-- INT, TINYINT, BIGINT, etc
CREATE TABLE parent (children TINYINT);

INSERT INTO parent (children)
VALUES (2), (7), (0);

INSERT INTO parent (children)
VALUES (200);

INSERT INTO parent (children)
VALUE (127);

-- Data truncation: Out of range value for column 'children' at row 1
INSERT INTO parent (children)
VALUE (128);

INSERT INTO parent (children)
VALUE (-128);

SELECT * FROM parent ORDER BY children DESC;

-- Hello Dave this is a git test
-- Laptop says, it worked

DROP TABLE parent;

SELECT * FROM parent;


CREATE TABLE parent (children TINYINT UNSIGNED);

INSERT INTO parent (children) VALUES (3);

SELECT * FROM parent;

INSERT INTO parent (children) VALUE (255);

SELECT * FROM parent;

DESC parent;

INSERT INTO parent (children) VALUE (1.5);

SELECT * FROM parent;

INSERT INTO parent (children) VALUE (90.4);

SELECT * FROM parent;

-- DECIMAL

CREATE TABLE products (price DECIMAL(5,2));

INSERT INTO products (price) VALUE (50.05);

SELECT * FROM products;

INSERT INTO products (price) VALUE (4.50);

SELECT * FROM products;

-- This is a test comment to practice switching from DataGrip to Chrome using keyboard shortcut.

INSERT INTO products (price) VALUE (456.99);
SELECT * FROM products;

INSERT INTO products(price) VALUE (5.026);
SELECT * FROM products;

INSERT INTO products (price) VALUE (5.029);
SELECT * FROM products;

-- FLOAT & DOUBLE
--    FLOAT  ->  4 bytes of memory ->  Precision Issues happen at ~7
--    DOUBLE ->  8 bytes of memory ->  Precision Issues happen at ~15

CREATE TABLE numbers (x FLOAT, y DOUBLE);

INSERT INTO numbers (x,y) VALUES (1.123, 1.123);
SELECT * FROM numbers;

INSERT INTO numbers (x,y) VALUES (2.12345, 2.12345);
SELECT * FROM numbers;

INSERT INTO numbers (x,y) VALUES (1.12345678, 1.12345678);
SELECT * FROM numbers;

INSERT INTO numbers (x,y) VALUES (3.12345678, 3.12345678901234567);
SELECT * FROM numbers;


-- DATES & TIMES
--   DATES are formatted in the `YYYY-MM-DD` Format
--   TIME is formatted in the `HH:MM:SS` Format
--   DATETIME is formatted in the `YYYY-MM-DD HH:MM:SS Format
SHOW TABLES;

CREATE TABLE people (name VARCHAR(100), birth_date DATE, birth_time TIME, birth_date_time DATETIME);
DESC people;

INSERT INTO people (name, birth_date, birth_time, birth_date_time)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');

SELECT * FROM people;

INSERT INTO people (name, birth_date, birth_time, birth_date_time)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');

INSERT INTO people (name, birth_date, birth_time, birth_date_time)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

SELECT * FROM people;

SELECT CURTIME();

SELECT CURDATE();

SELECT CURRENT_TIME;

SELECT CURRENT_TIMESTAMP;

SELECT NOW();

INSERT INTO people (name, birth_date, birth_time, birth_date_time)
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());

SELECT * FROM people;

-- DATE FUNCTIONS

SELECT people.birth_date FROM people;

--   DAY()
SELECT people.birth_date, DAY(people.birth_date) FROM people;

SELECT people.birth_date, DAY(people.birth_date), DAYOFWEEK(birth_date), DAYOFYEAR(birth_date) FROM people;

SELECT birth_date, CONCAT(DAYNAME(birth_date), ',', SPACE(1), MONTHNAME(people.birth_date), SPACE(1), DAY(birth_date)) AS birthdate FROM people;

SELECT people.name, people.birth_date_time, YEAR(people.birth_date_time), MONTHNAME(people.birth_date_time) FROM people;

SELECT name, people.birth_date_time, HOUR(people.birth_date_time) FROM people; -- Hour of birth

SELECT name, people.birth_date_time, MINUTE(people.birth_date_time) FROM people; -- Minute of birth

SELECT name, people.birth_date_time, SECOND(people.birth_date_time) FROM people; -- Second of birth

SELECT people.birth_date_time, DATE(people.birth_date_time) FROM people;

SELECT people.birth_date_time, DATE(people.birth_date_time), TIME(people.birth_date_time) FROM people;

-- Month name, day number, year
SELECT CONCAT(MONTHNAME(people.birth_date), ',', SPACE(1), DAY(people.birth_date), SPACE(1), YEAR(people.birth_date)) AS birthdate FROM people;

SELECT birth_date, DATE_FORMAT(birth_date,'%M, %e %Y') AS birthdate FROM people;

SELECT birth_date, DATE_FORMAT(birth_date,'%M, %D %Y') AS birthdate FROM people;

SELECT people.birth_date_time, DATE_FORMAT(people.birth_date_time, '%r') FROM people; -- Birth time in AM/PM

-- DATE MATH
--    DATEDIFF()
SELECT people.birth_date FROM people;

SELECT CURDATE() FROM people;

SELECT birth_date, DATEDIFF(CURDATE(), people.birth_date) AS 'Days Difference' FROM people;

SELECT people.birth_date, DATEDIFF(CURDATE(), people.birth_date_time) AS 'Days Difference' FROM people;

-- DATE_ADD(date,INTERVAL expr unit), DATE_SUB(date,INTERVAL expr unit)

SELECT CURDATE() AS 'Todays Date', DATE_ADD(CURDATE(), INTERVAL 1 YEAR) AS '1 Year in Future';

SELECT CURDATE() AS 'Current Date', DATE_SUB(CURDATE(), INTERVAL 2 YEAR ) AS '2 Years Ago';

-- Return the date when person is old enough to vote in Unite States (AKA 18 years old)
SELECT people.birth_date FROM people;
SELECT people.birth_date, DATE_ADD(people.birth_date, INTERVAL 18 YEAR) FROM people;

-- TIMEDIFF()
SELECT CURTIME();
SELECT TIMEDIFF(CURTIME(), '5:00:00') AS 'Time awake';

SELECT NOW() - INTERVAL 18 YEAR AS '18 Years Ago';

SELECT name, people.birth_date FROM people;
SELECT name, people.birth_date AS 'Birthdate', DATE_ADD(birth_date, INTERVAL 21 YEAR) 'Legal Date to drink', CURDATE() AS 'Todays Date' FROM people;

-- TIMESTAMP
SELECT NOW();
SELECT TIMESTAMP('2024-03-29 15:18:37');

CREATE TABLE captions (text VARCHAR(140), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

INSERT INTO captions (text)
VALUES ('Hanging out in the sun with the fam!');

INSERT INTO captions (text)
VALUES ('Beautiful SUNSET tonight!');

SELECT * FROM captions;

-- ------------------
-- ADDED ON LAPTOP --
-- ------------------
CREATE TABLE captions2 (text VARCHAR(140), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
DESC captions2;

INSERT INTO captions2 (text) VALUE ('Lovin life');

SELECT * FROM captions2;
UPDATE captions2 SET text='I love life!!!!';

SELECT * FROM captions2;
UPDATE captions2 SET text='I love LIFE!!!!';
CREATE TABLE captions2 (text VARCHAR(140), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
UPDATE captions2 SET text='I love LIFE!!!!';
SELECT * FROM captions2;

-- Challenge Exercises
-- #1 What's a good use case for CHAR?
--   A good use chase for CHAR is when you know exactly how many letters you'll need
--   For example the abbreviated states initials. You'd use this over VARCHAR because CHAR is only 4 bytes
--     and VARCHAR is 8 bytes. It's worth saving the memory if you know that you don't need variable character lengths.

-- #2 Fill in the blanks
CREATE TABLE inventory (item_name VARCHAR(100), price DECIMAL(8,2), quantity INT);

-- #3 What's the difference between DATETIME and TIMESTAMP
--   What I remember is DATETIME covers a much larger amount of time than TIMESTAMP

-- #4 Print out the current Date (but not time)
SELECT CURTIME();

-- #5 Print out the current Date (but not time)
SELECT CURDATE();

-- #6 Print out the current day of the week (the number)
SELECT DATE_FORMAT(CURDATE(),'%e'); -- I misunderstood the questions
SELECT DAYOFWEEK(CURDATE()); -- Get the day of the week as in the number between 1-7
# SELECT birth_date, DATE_FORMAT(birth_date,'%M, %D %Y') AS birthdate FROM people;

-- #7 Print out the current day of the week (the day name)
SELECT DATE_FORMAT(CURDATE(), '%W');
SELECT DAYNAME(CURDATE());
SELECT DAYNAME(NOW());

-- #8 Print out the current day and time using this format
--   mm/dd/yyyy
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');

-- #9 Print out the current day and time using this format
--   January 2nd at 3:15 (example)
SELECT NOW();
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i%p');

-- #10 Create a tweets table that stores:
--    The tweet content
--    A username
--    Time it was created
CREATE TABLE tweets (text VARCHAR(140), username VARCHAR(80), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
# CREATE TABLE captions2 (text VARCHAR(140), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

DESC tweets;
INSERT INTO tweets (text, username)
VALUES ('My first tweet!', 'Dave'),
       ('Did you see the game last night?!', 'Sarah');

SELECT * FROM tweets;




















