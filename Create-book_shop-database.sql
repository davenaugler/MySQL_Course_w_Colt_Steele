CREATE DATABASE book_shop;
USE book_shop;
CREATE TABLE books
	(
		book_id INT AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

DESC books;

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT * FROM books;

-- CONCAT() and CONCAT_WS()
SELECT CONCAT(books.author_fname, '!!!') FROM books;
SELECT CONCAT(books.author_fname, ' ', books.author_lname) AS author_name FROM books;
SELECT CONCAT_WS('!', 'hi', 'bye', 'lol');
SELECT CONCAT_WS('-', 'dave', 'naugler', 'v1') AS dnFile;

SELECT books.title, books.author_fname, books.author_lname FROM books;
SELECT CONCAT_WS('-', books.title, books.author_fname, books.author_lname) FROM books;

-- SUBSTRING()
SELECT SUBSTRING('Hello Universe', 1, 4);

-- SUBSTRING() w/ 2 numbers
SELECT SUBSTRING('Hello Dave Naugler', 7, 4) as first_name;
SELECT SUBSTRING('Hello Dave Naugler', 2, 4) as british_hello;

-- SUBSTRING() w/ 1 number
SELECT SUBSTRING('Hello Universe', 6);
SELECT SUBSTRING('Hello Universe', 5);

-- SUBSTRING() w/ negative number
SELECT SUBSTRING('Hello Dave Naugler', -7) as user_last_name;
SELECT SUBSTRING('Hello Universe Raaaa!!!', -8, 6) as user_last_name;

SELECT books.title FROM books;
use book_shop;
SELECT SUBSTRING(books.title, 1, 15) FROM books;
SELECT * FROM books;

SELECT SUBSTR(books.author_lname, 1, 1) as last_name_initial, author_lname FROM books;

-- Challenge
SELECT SUBSTR(title, 1, 10) FROM books;
SELECT CONCAT(SUBSTR(books.title, 1, 10), '...') AS 'short title' FROM books;

SELECT * FROM books;

-- Get the first name initial and last name initial
SELECT CONCAT(SUBSTR(books.author_fname, 1, 1), '.', SUBSTR(books.author_lname, 1, 1), '.') AS author_initials FROM books;


-- REPLACE()
--  REPLACE(str, from_str, to_str)
--  REPLACE(initial_string, the_thing_you're_trying_to_replace, the_thing_you_want_to_replace_it_with)
--    Example: SELECT REPLACE('www.mysql.com', 'w', 'Ww');
-- >   'WwWwWw.mysql.com'
SELECT REPLACE('Hello Universe', 'Hell', '%$#@');
SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');
SELECT REPLACE('I am dave!', 'dave', 'Mr. Naugler');
SELECT * FROM books;

-- Replace spaces in book titles with dashes
SELECT REPLACE(books.title, ' ', '-') FROM books;

-- REVERSE()
SELECT REVERSE('Hello Universe!');
SELECT REVERSE(books.author_fname) FROM books;

-- Turn each name into a palindrome
SELECT books.author_fname FROM books;
SELECT CONCAT(books.author_fname, REVERSE(books.author_fname)) AS palindrome FROM books;


-- CHAR_LENGTH()
SELECT CHAR_LENGTH('Hello Universe');
SELECT LENGTH('Hello Universe');

SELECT CHAR_LENGTH(books.title) AS length, title FROM books;

-- UPPER() and LOWER()
SELECT UPPER('Hello Universe!');
SELECT LOWER('Hello Universe!');

SELECT UCASE('My name is dave');
SELECT LCASE('My name is John');

SELECT UPPER(books.title) FROM books;

-- Challenge
--   Output all the titles in uppercase saying I LOVE TITLE_OF_BOOK!!!
SELECT UPPER(CONCAT(REPLACE('I love', 'e', 'e '), books.title, REPLACE('!!!', ' !!!'))) FROM books;

SELECT UPPER(CONCAT('I love', REPLACE(books.title, 'e', 'e '), '!!!')) FROM books;

-- Solution
SELECT CONCAT('I LOVE ', UPPER(books.title), ' !!!') FROM books;

-- INSERT()
SELECT INSERT('Quadratic', 3, 4, 'What');
SELECT INSERT('My name is Sir Dave Naugler', 12, 8, 'Yep');

SELECT INSERT('Hello Bobby', 6, 0, 'there');
SELECT INSERT('Hello Bobby', 1, 0, 'there ');

-- LEFT(str, len)
-- Gets the left most letters
SELECT LEFT('foobarbar', 5);

-- RIGHT(str, len)
-- Gets the right most letters
SELECT RIGHT('foobarbar', 5);

SELECT CONCAT(LEFT(books.author_fname, 1), '.', LEFT(author_lname, 1), '.') FROM books;

-- REPEAT()
SELECT REPEAT('ha', 4);

-- TRIM()
--   Removes leading and trailing spaces
SELECT TRIM('      boston    ');
SELECT CHAR_LENGTH(TRIM('      boston    '));

SELECT TRIM('.......san antonio..');
SELECT TRIM(LEADING '.' FROM '.......san antonio..');
SELECT TRIM(TRAILING '.' FROM '.......san antonio..');
SELECT TRIM(BOTH '.' FROM '.......san antonio..');

-- STRING EXERCISE CHALLENGE

-- #1
-- Reverse and Uppercase the following sentence
-- "Why does my cat look at me with such hatred?"
SELECT UPPER(REVERSE('Why does my cat look at me with such hatred?'));

-- #2
-- What does this print out
SELECT REPLACE(CONCAT('I', ' ', 'like', ' ', 'cats'), ' ', '-');
-- 'I-like-cats

-- #3
--  In books table, replace spaces in titles with '->' and assign 'title' to the outputted column.
SELECT books.title FROM books;
SELECT REPLACE(books.title, ' ', '->') AS title FROM books;

-- #4
--   Print out table on screen
--   On screen we see authors last name (forwards) and authors last name (backwards)
SELECT * FROM books;
SELECT books.author_lname AS forwards, REVERSE(books.author_lname) as backwards FROM books;

-- #5
--  Print out table titled 'full name in caps' and it is authors first name and last name in caps with space in the middle
SELECT UPPER(CONCAT(books.author_fname, SPACE(1), books.author_lname)) AS 'full name in caps' FROM books;

-- #6
-- Print out a table titled 'blurb' where we take the books title + was released in + released_year
SELECT * FROM books;
-- Solution 1 with hard coding the space
SELECT CONCAT(books.title, ' was released in ', books.released_year) AS blurb FROM books;
-- Solution 2 with hard coding the space
SELECT CONCAT(books.title, SPACE(1), 'was released in', SPACE(1), books.released_year) AS blurb FROM books;

-- #7
--  Print book titles and the length of each of those book titles.
--    Column names are 'title' and 'character count'
SELECT * FROM books;
SELECT books.title AS title, CHAR_LENGTH(books.title) AS 'character count' FROM books;

-- #8
--  Generate the screenshot
SELECT * FROM books;
SELECT * FROM books WHERE released_year = 2001;
SELECT * FROM books WHERE released_year = 2001;

-- Assistance from above
SELECT CONCAT(SUBSTR(books.title, 1, 10), '...') AS 'short title' FROM books;
-- FINAL SOLUTION
SELECT CONCAT(SUBSTR(books.title, 1, 10), '...') AS 'short title', CONCAT(books.author_lname, ',', books.author_fname) AS author, CONCAT(books.stock_quantity, ' in stock') AS quatity FROM books where released_year = 2001;
SELECT CONCAT(SUBSTR(books.title, 1, 10), '...') AS 'short title', CONCAT(books.author_lname, ',', books.author_fname) AS author, CONCAT(books.stock_quantity, ' in stock') AS quatity FROM books;























