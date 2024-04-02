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
s

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

