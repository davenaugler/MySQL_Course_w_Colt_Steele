-- SECTION 11 - Comparison & Logical Operators

-- Logical Operators
--   Helps us write more complex queries and more complicated logic
--      Example: Select all books NOT published in 2017
--      Example: Select all birthdays between 1990 and 1992
--      Example: Select all items that are in stock AND priced below $19.99

-- Things covered are NOT, BETWEEN, as well as AND
-- NOT EQUAL is !=
-- --------------------

USE book_shop;
SELECT * FROM books where released_year != 2017;
SELECT * FROM books where released_year != 2017 ORDER BY released_year DESC; -- Used this to verify 2017 was left out

SELECT title, books.author_lname FROM books WHERE author_lname != 'Gaiman';
SELECT title, books.author_lname FROM books WHERE author_lname != 'Gaiman' ORDER BY author_lname; -- Used this to verify 'Gaiman' was left out

-- NOT LIKE Operator
-- --------------------

SELECT books.title FROM books WHERE title LIKE '% %'; -- SELECT all book titles with spaces
SELECT books.title FROM books WHERE title NOT LIKE '% %'; -- SELECT all book titles with NO spaces

-- SELECT all book titles that contain authors first name that start with 'da'
SELECT books.title, books.author_fname, books.author_lname FROM books WHERE author_fname LIKE 'da%';
-- SELECT all book titles that contain authors first name that DON'T start with 'da'
SELECT books.title, books.author_fname, books.author_lname FROM books WHERE author_fname NOT LIKE 'da%';

-- SELECT all book titles that don't contain the letter 'e'
SELECT books.title FROM books WHERE title NOT LIKE '%e%';

-- SELECT all book titles that don't contain the letter 'a'
SELECT books.title FROM books WHERE title NOT LIKE '%a%';


-- GREATER THAN OPERATOR
-- --------------------

-- SELECT all books that were released after the year 2000
SELECT * FROM books WHERE released_year > 2000 ORDER BY released_year DESC;

-- SELECT all books that were released in the year 2000
SELECT * FROM books WHERE released_year = 2000;

-- SELECT all books that were released before the year 2000
SELECT * FROM books WHERE released_year < 2000 ORDER BY released_year DESC;

-- SELECT all books where pages are greater than 500
SELECT * FROM books WHERE pages > 500 ORDER BY pages DESC;

-- This results in 1 as in True
SELECT 99 > 1;

-- This results in 0 as in False
SELECT 5 > 9;

SELECT books.title, books.pages, books.released_year FROM books WHERE pages > 500 ORDER BY books.pages DESC;

-- SELECT 1 > NULL; returns null
--   null is the lack of a value
SELECT 1 > NULL;


-- LESS THAN OPERATOR
-- --------------------

-- Returns books having a released year less than the year 2000
SELECT books.title, books.released_year FROM books WHERE released_year < 2000 ORDER BY released_year DESC;

-- SELECT books with pages less than 200 pages
SELECT books.title, books.pages FROM books WHERE pages < 200;

SELECT * FROM books;

-- SELECT all books released after 2010 as well as including 2010
SELECT books.released_year FROM books WHERE released_year >= 2010 ORDER BY released_year;

-- SELECT all books released before 1985 as well as including 1985
SELECT books.released_year FROM books WHERE released_year <= 1985 ORDER BY released_year;

-- && (AND) OPERATOR (Comparison operator)
-- ----------------------------------------

-- SELECT books written by Dave Eggers, published after the year 2010
SELECT * FROM books WHERE author_lname = 'Eggers' AND books.released_year > 2010;

-- SELECT books written by Dave Eggers, published after the year 2010 and Title has 'novel' in it
SELECT * FROM books WHERE author_lname = 'Eggers' AND books.released_year > 2010 AND title LIKE '%novel%';

-- SELECT all books with titles greater than 30 characters and have more than 500 pages
SELECT * FROM books WHERE title > 15;
SELECT title, pages FROM books WHERE CHAR_LENGTH(books.title) > 30 AND pages > 500;


-- || (OR) OPERATOR (Comparison operator)
-- ----------------------------------------

-- SELECT books written by Dave Eggers, published after the year 2010
SELECT * FROM books WHERE author_lname = 'Eggers' OR books.released_year > 2010;
SELECT books.title, books.author_lname, books.released_year FROM books WHERE author_lname = 'Eggers' OR released_year > 2010 ORDER BY released_year;

-- SELECT all books with less than 200 pages or have 'stories' in the title.
SELECT title, books.pages FROM books WHERE pages < 200 OR title LIKE '%stories%';


-- BETWEEN Operator
-- --------------
-- SELECT all books published between 2004 and 2015 (not using BETWEEN operator)
SELECT * FROM books WHERE released_year > 2004 AND books.released_year < 2015 ORDER BY released_year;

-- SELECT all book published between 2004 and 2015 (using BETWEEN operator)
--  BETWEEN is an inclusive operator, means that includes the parameters given
SELECT * FROM books WHERE released_year BETWEEN 2004 AND 2015 ORDER BY released_year DESC;

-- ADD CONTENT BELOW TO OTHER "Sec.11" file
-- April 2nd 2024 - Morning laptop session
USE book_shop;
-- SELECT all books BETWEEN 200-300 pages
SELECT books.title, books.pages FROM books WHERE pages BETWEEN 200 AND 300;

-- SELECT all books NOT BETWEEN 200-300 pages
SELECT books.title, books.pages FROM books WHERE pages NOT BETWEEN 200 AND 300 ORDER BY pages DESC;


-- COMPARING DATES, TIMES, and TIMESTAMPS
-- --------------

SELECT * FROM people;
DESC people;
-- SELECT all people born before 2005
SELECT * FROM people;
-- The date below is actually a String. Most times SQL can convert a properly format String to a date.
-- SELECT all people with a birthdate before '2005-01-01'
SELECT * FROM people WHERE birth_date < '2005-01-01';

-- SELECT all people with a birthdate before the YEAR '2005'
SELECT * FROM people WHERE YEAR(birth_date) < '2005';

-- SELECT all people with a birth time after 12pm
SELECT * FROM people WHERE birth_time > '12:00:00';

-- SELECT all people born after 9pm
SELECT * FROM people WHERE HOUR(birth_time) > 21;

-- Best practice to CAST String time to TIME when using the BETWEEN comparison operator
SELECT CAST('09:00:00' AS TIME);

-- How to search for someones birth time using String time
SELECT * FROM people WHERE birth_time BETWEEN '19:00:00' AND '21:00:00';

-- Correct way of doing it using CAST in SQL CASING the String time to an actual time format
-- Use this format if you need to narrow down the time via minutes and/or seconds
SELECT * FROM people WHERE birth_time BETWEEN CAST('19:00:00' AS TIME) AND CAST('21:00:00' AS TIME);

-- Use this approach if you only need to grab the time for someone between the hour blocks of time
SELECT * FROM people WHERE HOUR(birth_time) BETWEEN 19 AND 21;

-- IN and NOT IN Operator
-- SELECT books WHERE author_lname is Carver, Lahiri, or Smith (long way)
SELECT books.title, books.author_lname FROM books
    WHERE author_lname = 'Carver'
    OR author_lname = 'Lahiri'
    OR author_lname = 'Smith';

-- SELECT books WHERE author_lname is IN Carver, Lahiri, or Smith (short way)
SELECT books.title, books.author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

-- SELECT books WHERE author_lname is NOT IN Carver, Lahiri, or Smith (short way)
SELECT books.title, books.author_lname FROM books WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');

-- SELECT all books not published in even years between 2000-2016
SELECT * FROM books WHERE released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016) ORDER BY released_year DESC;

-- SELECT all books not published in even years between 2000-2016 and released after 2000
SELECT * FROM books WHERE released_year >= 2000 AND released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016) ORDER BY released_year DESC;

-- MODULO Operator to future proof SQL query for further even years in the future
--    SELECT all books released after the year 2000 and not published in and even year
SELECT * FROM books WHERE released_year >= 2000 AND released_year % 2 != 0 ORDER BY released_year DESC; -- Using not equal to zero

SELECT * FROM books WHERE released_year >= 2000 AND released_year % 2 = 1 ORDER BY released_year DESC; -- Using equal to 1


-- CASE statements
-- --------------

-- Books released after 2000 are Modern Lit and the others are 20th Century Lit
SELECT books.title, books.released_year,
    CASE
        WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th Century Lit'
END AS 'Genre'
FROM books;

-- Stock rating based on number of books left in quantity
SELECT books.title, books.stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 180 THEN '****'
        ELSE '*****'
    END AS STOCK
FROM books ORDER BY stock_quantity;

-- This next example works just the same and doesn't need the BETWEEN operator
--     Stock rating based on number of books left in quantity
SELECT books.title, books.stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 180 THEN '****'
        ELSE '*****'
    END AS STOCK
FROM books ORDER BY stock_quantity;

-- NULL
SELECT * FROM books;

-- Grabbing all null values based on author_lname
SELECT * FROM books WHERE author_lname IS NULL;

-- DELETING books based on null value for title
DELETE FROM books WHERE title IS NULL;

-- CHALLENGE EXERCISE

-- #1 Evaluate the following
SELECT 10 != 10; -- 0 (false)
SELECT 15 > 14 AND 99 - 5 <= 94; -- 1 (true)
SELECT 1 IN (5,3) OR 9 BETWEEN 8 AND 10; -- 1 (true)

-- #2: Select all books written before 1980 (non inclusive)
SELECT * FROM books WHERE released_year < 1980;

-- #3:Select all books written by Eggers or Chabon
SELECT * FROM books WHERE author_lname IN ('Eggers', 'Chabon'); -- cleaner
-- OR
SELECT * FROM books WHERE author_lname = 'Eggers' OR author_lname = 'Chabon';

-- #4:Select all books written by Lahiri, Published after 2000
SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;

-- #5: Select all books with page counts between 100 and 200
SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

-- #6: Select all books where author_lname starts with a 'C' or an 'S'
SELECT * FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';
--    Another example
SELECT title, books.author_lname
FROM books WHERE SUBSTR(books.author_lname, 1, 1) IN ('C', 'S');

-- #7: Return title, author_lname, and TYPE (Novel, Short Stories)
SELECT books.title, books.author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title = 'Just Kids' OR title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memior'
        ELSE 'Novel'
END AS TYPE
FROM books;

-- #8: Bonus: Make this happen
--  Select author_fname, author_lname, COUNT (based on how many books that author wrote)
SELECT author_fname, author_lname,
    CONCAT(COUNT(*), SPACE(1),
    CASE
        WHEN COUNT(*) = 1 THEN 'book'
        ELSE 'books'
    END) AS COUNT
FROM books
GROUP BY author_fname, author_lname;