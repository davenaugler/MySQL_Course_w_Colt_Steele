-- SECTION 9: AGGREGATE FUNCTIONS
USE book_shop;

-- COUNT
--    How many books are in the database?
SELECT COUNT(*) FROM books;

--    How many author_fnames?
SELECT COUNT(books.author_fname) FROM books;

--     How many DISTINCT author_fnames are there?
SELECT COUNT(DISTINCT books.author_fname) FROM books;  -- 12 author_lname's

SELECT books.released_year FROM books;

SELECT DISTINCT books.released_year FROM books ORDER BY released_year DESC;

SELECT COUNT(DISTINCT books.author_lname) FROM books;  -- 12 author_lname's

-- How many titles contain "the"
SELECT books.title FROM book_shop.books WHERE books.title LIKE '%the%'; -- 6 book titles
SELECT COUNT(*) FROM book_shop.books WHERE books.title LIKE '%the%';    -- Count of 6

-- GROUP BY
SELECT books.author_lname FROM books;
SELECT books.author_lname FROM books GROUP BY author_lname;

-- Count how many books each author has written
SELECT COUNT(books.author_lname) AS 'book count', author_lname FROM books GROUP BY author_lname;
SELECT books.author_lname, COUNT(*) AS books_written FROM books GROUP BY author_lname ORDER BY books_written;
SELECT books.author_lname, COUNT(*) AS books_written FROM books GROUP BY author_lname ORDER BY books_written DESC;
SELECT books.title, books.author_lname FROM books;

SELECT books.released_year FROM books;
SELECT books.released_year, COUNT(*) AS num_of_books_released FROM books GROUP BY released_year ORDER BY num_of_books_released;
SELECT books.released_year, COUNT(*) AS num_of_books_released FROM books GROUP BY released_year ORDER BY released_year DESC;

SELECT author_lname FROM books GROUP BY author_lname;

-- MIN & MAX
--  Find the book that has the earliest release date
SELECT MIN(books.released_year) FROM books;

--  Find the book that has the latest release date
SELECT MAX(books.released_year) FROM books;

--   Find book with most amount of pages
SELECT MAX(books.pages) FROM books;

--   Find book with least amount of pages
SELECT MIN(books.pages) FROM books;

--   Find the authors last name closest to the start of the Alphabet
SELECT MIN(books.author_lname) FROM books;

--   Find the authors last name closest to the start of the Alphabet
--   and Find the authors last name furthest from the start of the Alphabet
SELECT MIN(books.author_lname), MAX(author_lname) FROM books;

-- What if I want the title of the longest book?
SELECT MAX(pages), books.title FROM books; -- My guess

SELECT books.title, pages FROM books ORDER BY pages;
SELECT books.title, pages FROM books ORDER BY pages DESC;
SELECT book_id, books.title, pages FROM books ORDER BY pages DESC LIMIT 1; -- Correct Solution
SELECT book_id, books.title, pages FROM books ORDER BY pages DESC LIMIT 2; -- Correct Solution part 2


-- This can also be accomplished using a Sub Query
SELECT * FROM books WHERE pages = (SELECT MIN(pages) FROM books);
SELECT * FROM books WHERE pages = (SELECT MAX(pages) FROM books);

SELECT books.title, books.pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('My Life in Words', 'Dave', 'Naugler', 2024, 65, 634);

SELECT book_id, books.title, books.pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);

-- Select the title of the book that was released the earliest
SELECT books.title, books.released_year FROM books WHERE books.released_year IS NOT NULL ORDER BY released_year LIMIT 1; -- Solution 1
SELECT books.title, books.released_year FROM books WHERE released_year = (SELECT MIN(released_year) FROM books); -- Soluiton 2

-- GROUPING BY MULTIPLE COLUMNS
SELECT books.author_fname, books.author_lname FROM books;
SELECT books.author_fname, books.author_lname FROM books ORDER BY author_lname;
SELECT books.author_fname, books.author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
SELECT CONCAT(author_fname, SPACE(1), books.author_lname) AS author, COUNT(*) AS num_of_books FROM books GROUP BY author;

-- MIN/MAX
--    Find the year each author published their first book
SELECT books.author_fname, books.author_lname, MIN(books.released_year) FROM books GROUP BY author_lname, author_fname;
--    Find the year each author published their latest book
SELECT books.author_fname, books.author_lname, MIN(books.released_year) FROM books GROUP BY author_lname, author_fname;

--    Find the year each author published their first and latest book
SELECT CONCAT(books.author_fname, SPACE(1), books.author_lname) AS author, COUNT(*) AS books_written, MAX(released_year) AS latest_release, MIN(books.released_year) AS earliest_release, MAX(pages) AS longest_page_count FROM books GROUP BY author;

-- SUM
SELECT SUM(pages) AS total_pages FROM books;

-- Sum all pages each author has written (not worrying about the two Harris's)
SELECT books.author_lname, SUM(pages) FROM books GROUP BY author_lname;

-- AVG (AVERAGE)
--   Calculate the average released_year across all books
SELECT AVG(books.released_year) FROM books;

--   Calculate the average pages across all books
SELECT AVG(books.pages) FROM books;

--   Calculate the average stock_quantity across all books
SELECT AVG(books.stock_quantity) FROM books;

-- Calculate the average stock quantity for books released in the same year
SELECT AVG(books.stock_quantity) FROM books GROUP BY released_year;
SELECT released_year, AVG(books.stock_quantity), COUNT(*) FROM books GROUP BY released_year;

-- CHALLENGE

--   #1 Print the number of books in the database
SELECT * FROM books;
SELECT COUNT(*) FROM books;

--   #2 Print out how many books were released in each year | Left side will be YEAR, right side will be the count of that year
SELECT * FROM books ORDER BY released_year DESC;
SELECT books.released_year, COUNT(*) FROM books GROUP BY released_year ORDER BY released_year DESC;

--   #3 Print out the total number of books in stock
SELECT SUM(books.stock_quantity) FROM books;

--   #4 Find the average released_year for each author (Round 1)
SELECT CONCAT(books.author_fname, SPACE(1), books.author_lname) AS author, books.released_year FROM books ORDER BY released_year DESC;
SELECT CONCAT(books.author_fname, SPACE(1), books.author_lname) AS author, AVG(books.released_year) AS avg_released_year FROM books ORDER BY avg_released_year DESC;
SELECT CONCAT(books.author_fname, SPACE(1), books.author_lname) AS author, books.released_year FROM books WHERE released_year = (SELECT AVG(books.released_year) FROM books);


--   #4 Find the average released_year for each author (Round 2)
SELECT * FROM books;
SELECT books.author_fname, books.author_lname, books.released_year FROM books;
SELECT CONCAT(books.author_fname, SPACE(1), books.author_lname) AS author, books.released_year AS avg_released_year FROM books WHERE released_year = (SELECT AVG(released_year) AS avg_released_year) ORDER BY avg_released_year DESC;
-- Assistance with Claude (very close)
SELECT CONCAT(books.author_fname, SPACE(1), books.author_lname) AS author, AVG(books.released_year) AS avg_released_year FROM books GROUP BY author ORDER BY avg_released_year DESC;
SELECT CONCAT(books.author_fname, SPACE(1), books.author_lname) AS author, AVG(books.released_year) AS avg_released_year FROM books GROUP BY author;


--    #5 Find the full name of the author who wrote the longest book
SELECT * FROM books;
SELECT CONCAT(books.author_fname, SPACE(1), books.author_lname) AS author, MAX(books.pages) FROM books ORDER BY books.pages;
SELECT CONCAT(books.author_fname, SPACE(1), books.author_lname) AS author, books.pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);
--    #5 Another way of doing  this
SELECT CONCAT(books.author_fname, SPACE(1), books.author_lname) AS author, pages FROM books ORDER BY pages DESC LIMIT 1;

--     #6 - Make this happen  | year_book_was_written | num of books | avg pages
SELECT * FROM books;
SELECT books.released_year AS `year`, COUNT(*) AS `# books`, AVG(pages) AS `avg pages` FROM books WHERE books.released_year IS NOT NULL GROUP BY `year` ORDER BY `year`;


























