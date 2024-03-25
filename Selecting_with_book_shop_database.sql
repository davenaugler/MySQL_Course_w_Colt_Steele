-- book_shop unit
USE book_shop;

DESC books;

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
       ('fake_book', 'Freida', 'Harris', 2001, 287,428),
       ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

SELECT * FROM books;


SELECT books.author_lname FROM books;

SELECT DISTINCT books.author_lname AS 'DISTINCT Author Last Names' FROM books;

SELECT books.author_lname FROM books, DISTINCT books.author_lname AS 'DISTINCT Author Last Names' FROM books;

SELECT DISTINCT books.author_lname FROM books;

SELECT books.released_year FROM books;

SELECT DISTINCT books.released_year FROM books;

SELECT DISTINCT CONCAT(books.author_fname, SPACE(1), books.author_lname) AS `Author Full Name` FROM books;

SELECT DISTINCT books.author_fname, books.author_lname FROM books;

-- ORDER BY

INSERT INTO books (title, author_fname, author_lname)
VALUE ('My Life', 'Dave', 'Naugler');

SELECT * FROM books;

SELECT books.book_id, books.title, books.author_lname FROM books;
SELECT books.book_id, author_fname, books.author_lname FROM books ORDER BY author_lname;
SELECT books.book_id, author_fname, books.author_lname FROM books ORDER BY author_fname;

SELECT DISTINCT author_fname, books.author_lname FROM books ORDER BY author_lname;

SELECT books.author_lname FROM books ORDER BY author_lname DESC;
SELECT DISTINCT books.author_lname FROM books ORDER BY author_lname DESC;
SELECT DISTINCT books.author_lname FROM books ORDER BY author_lname;

DESC books;

SELECT title, pages FROM books;

SELECT title, pages FROM books ORDER BY pages;
SELECT title, pages FROM books ORDER BY pages DESC;

SELECT books.title, books.pages FROM books ORDER BY released_year;
SELECT books.title, books.pages, released_year FROM books ORDER BY released_year;

SELECT books.title, books.author_fname, books.author_lname FROM books ORDER BY 3;
SELECT books.author_fname, books.author_lname, books.title FROM books ORDER BY author_lname, author_fname;

SELECT books.author_lname, books.released_year, books.title FROM books;
SELECT books.author_lname, books.released_year, books.title FROM books ORDER BY author_lname, released_year;
SELECT books.author_lname, books.released_year, books.title FROM books ORDER BY author_lname, released_year DESC;

SELECT CONCAT(books.author_fname, SPACE(1), books.author_lname) AS `author` FROM books;
SELECT CONCAT(books.author_fname, SPACE(1), books.author_lname) AS `author` FROM books ORDER BY author;

-- LIMIT
SELECT books.title, books.released_year FROM books ORDER BY released_year DESC LIMIT 5;
SELECT books.book_id, books.title, books.released_year FROM books;
SELECT books.book_id, books.title, books.released_year FROM books LIMIT 5;
SELECT books.book_id, books.title, books.released_year FROM books ORDER BY books.released_year;
SELECT books.book_id, books.title, books.released_year FROM books ORDER BY books.released_year LIMIT 5;
SELECT books.book_id, books.title, books.released_year FROM books ORDER BY books.released_year DESC LIMIT 10;

-- LIMIT start_at_this_number, go_for_this_many
--    This allows us to gather specific groupings of data
SELECT books.title, books.released_year FROM books ORDER BY released_year DESC LIMIT 3, 5;
SELECT books.title, books.released_year FROM books ORDER BY released_year DESC LIMIT 5, 7;

SELECT books.title FROM books ORDER BY title;
SELECT books.title FROM books ORDER BY title LIMIT 40;
SELECT books.title, books.released_year FROM books ORDER BY released_year DESC LIMIT 15, 2;

-- LIKE
SELECT books.title, books.author_fname, books.author_lname FROM books WHERE author_fname='David';
SELECT books.title, books.author_fname, books.author_lname FROM books WHERE author_fname LIKE '%da%';

-- Returns us a book title with a column in the title
SELECT * FROM books WHERE title LIKE '%:%';

-- Returns us all books info from authors first names that have 4 characters for their first name
SELECT * FROM books WHERE author_fname LIKE '____';

-- Returns us all the book info from authors first names that have any character, an a, then any character, within their firs name.
SELECT * FROM books WHERE author_fname LIKE '_a_';

SELECT * FROM books WHERE author_fname LIKE '_a%';

-- Find all authors that have a first name that ends with n. (I also did last name)
SELECT * FROM books;
SELECT * FROM books WHERE author_fname LIKE '%n';
SELECT * FROM books WHERE author_lname LIKE '%n';

-- LIKE - Escaping Wild Cards
--   Returns us all books where the title has a % sign
SELECT * FROM book_shop.books WHERE title LIKE '%\%%';
SELECT * FROM book_shop.books WHERE title LIKE '%\_%';

-- CHALLENGE SECTION

-- #1 Select all story collections, Titles that contain 'stories'
SELECT * FROM books;
SELECT books.title FROM book_shop.books WHERE title LIKE '%stories%';

-- #2 Find the longest book, Print out the title and page count
SELECT * FROM books;
SELECT books.title, books.pages FROM books ORDER BY pages DESC LIMIT 1;

-- #3 Print a summary containing the title and year, for the 3 most recent books
SELECT * FROM books;
SELECT CONCAT(books.title, ' - ', books.released_year) AS summary FROM book_shop.books ORDER BY released_year DESC LIMIT 3;

-- #4 Find all books with an author_lname that contains a space("")
SELECT * FROM books;
SELECT books.title, books.author_lname FROM books WHERE author_lname LIKE '% %';

-- #5 Find the 3 books with the lowest stock. Select title, year, and stock
SELECT * FROM books;
-- Had to use 4 because we have a null value for 1 book for quantity and that is considered the least in stock
SELECT books.title, books.released_year, books.stock_quantity FROM books ORDER BY stock_quantity LIMIT 4;

-- #6 Print title and author_lname, sorted first by author_lname and then by title
SELECT * FROM books;
SELECT books.title, books.author_lname FROM books ORDER BY author_lname, title;

-- #7 Make this happen.... Sorted alphabetically By Last Name
SELECT UPPER(CONCAT('my favorite author is', SPACE(1), books.author_lname, '!')) AS yell FROM book_shop.books ORDER BY author_lname;















