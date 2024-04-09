-- Section 13: One to Many & Joins
-- ---------------------------------

USE customers;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

ALTER TABLE customers
MODIFY COLUMN email VARCHAR(100) NOT NULL;

DESC customers;
DESC orders;

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');


INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

SELECT * FROM customers;
SELECT * FROM orders;

-- Get all orders Boy George made
--   Way #1 - Klunky at best
SELECT id FROM customers WHERE last_name = 'George';
SELECT * FROM orders WHERE orders.customer_id = 1;

SELECT * FROM orders WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George');

-- This is a cross join. Technically a join but not one that's very clear.
SELECT * FROM customers, orders;

-- INNER JOIN --> using Foreign Key in orders (customer_id) to join with customers id
--    We only take the
-- -----------------------

SELECT * FROM orders;
    -- This gives all the data from both tables
SELECT * FROM customers
JOIN orders ON orders.customer_id = customers.id;


-- Let's only grab first_name, last_name, order_date, and amount FROM customers
SELECT customers.first_name, customers.last_name, orders.order_date, amount FROM customers
JOIN orders ON customers.id = orders.customer_id;

-- This gives all the data from both tables
SELECT * FROM orders
JOIN customers ON customers.id = orders.customer_id;

-- INNER JOIN and GROUP BY
-- --------------------------
DROP TABLE customers;
DROP TABLE orders;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

USE customers;
-- WORKING
SELECT * FROM customers;
SELECT * FROM orders;

-- Review from previous lesson
SELECT customers.first_name, customers.last_name, orders.order_date, orders.amount FROM customers
JOIN orders ON orders.customer_id = customers.id;

-- Display the total amount each customer has spent
--    GROUP BY first_name and last_name then display total amount spent
SELECT customers.first_name, customers.last_name, SUM(orders.amount) AS total FROM customers
JOIN orders ON orders.customer_id = customers.id
GROUP BY first_name, last_name;
-- first_name | last_name | total_spent
-- -------------------------------------
--    Boy     |  George   |  135.49
--    George  |  Michael  |  813.17
--    Bette   |  Davis    |  450.25

-- This will allow us to order via total spent from greatest to least
SELECT customers.first_name, customers.last_name, SUM(orders.amount) AS total FROM customers
JOIN orders ON orders.customer_id = customers.id
GROUP BY first_name, last_name
ORDER BY total DESC;
-- first_name | last_name | total_spent
-- -------------------------------------
--    George  |  Michael  |  813.17
--    Bette   |  Davis    |  450.25
--    Boy     |  George   |  135.49

-- LEFT JOIN
    -- In LEFT JOIN we take all information from customers table regardless if there's data in there or not.
    -- If there's not data then we get null
    -- LEFT JOINS will tell us if there are any customers that haven't placed any orders
-- ------------

SELECT customers.first_name, customers.last_name, orders.order_date, orders.amount FROM customers
LEFT JOIN orders ON orders.customer_id = customers.id;

SELECT customers.first_name, customers.last_name, orders.order_date, orders.amount FROM customers
LEFT JOIN orders ON orders.customer_id = customers.id;

SELECT orders.order_date, orders.amount, customers.first_name, customers.last_name FROM orders
LEFT JOIN customers ON orders.customer_id = customers.id;


-- LEFT JOIN w/ GROUP BY
-- ---------------------
SELECT customers.first_name, customers.last_name, orders.amount FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;

SELECT customers.first_name, customers.last_name, IFNULL(SUM(orders.amount), 0) AS money_spent FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name;


-- RIGHT JOINS
-- ---------------
--  Inner Join
SELECT customers.first_name, customers.last_name, orders.order_date, orders.amount FROM customers
JOIN orders ON customers.id = orders.customer_id;

 --  Right Join
SELECT customers.first_name, customers.last_name, orders.order_date, orders.amount FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id;

SELECT * FROM orders;

-- ERROR: Cannot add or update a child row: a foreign key constraint fails
--   (`customers`.`orders`, CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`))
INSERT INTO orders (amount, order_date, customer_id) VALUES (100, CURDATE(), 99);

DESC orders;

INSERT INTO orders (amount, order_date) VALUES (100, CURDATE());

SELECT * FROM orders;

-- In real world we'll need to be required to have customer_id

-- RIGHT JOIN
SELECT customers.first_name, customers.last_name, orders.order_date, orders.amount FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id;

-- ON DELETE CASCADE
    -- ...has a cascading affect on the corresponding rows in the child table
    -- that references the parent row.
        -- This allows all orders to be deleted when a customer is deleted as well.
-- --------------------

DROP TABLE orders;
DROP TABLE customers;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);


SELECT * FROM customers;

DELETE FROM customers WHERE last_name = 'George';

SELECT * FROM customers;
SELECT * FROM orders;

-- CHALLENGE EXERCISE
-- --------------------

-- #1 Write this Schema
-- Students: id, first_na,me
-- Papers: title, grade, student_id (fk to students.id)

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL
);

CREATE TABLE papers (
    title VARCHAR(120) NOT NULL,
    grade TINYINT NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

ALTER TABLE papers
MODIFY COLUMN grade INT NOT NULL;

INSERT INTO students (first_name) VALUES
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT * FROM students;
SELECT * FROM papers;

-- #2: Print this
   -- first_name | title | grade
SELECT students.first_name, papers.title, papers.grade FROM students
JOIN papers ON students.id = papers.student_id
ORDER BY grade DESC;

-- first_name | title                                     | grade
-- ------------------------------------------------------------------
--  Samantha  |   De Montaigne and The Art of The Essay   |  98
--  Samantha  |   Russian Lit Through The Ages            |  94
--  Carlos    |   Borges and Magical Realism              |  89
--  Caleb     |   My Second Book Report                   |  75
--  Caleb     |   My First Book Report                    |  60


-- #3: Print this
   -- first_name | title | grade but with the null values as well.
SELECT students.first_name, papers.title, papers.grade FROM students
LEFT JOIN papers ON students.id = papers.student_id;

-- first_name | title                                     | grade
-- ------------------------------------------------------------------
--  Caleb     |  My First Book Report                     |  60
--  Caleb     |  My Second Book Report                    |  75
--  Samantha  |  Russian Lit Through The Ages             |  94
--  Samantha  |  De Montaigne and The Art of The Essay    |  98
--  Raj       |  NULL                                     |  NULL
--  Carlos    |  Borges and Magical Realism               |  89
--  Lisa      |  NULL                                     |  NULL

-- #4: Print this
   -- first_name | title | grade
   -- Null title values are replaced with MISSING
   -- Null grade is replaced with 0's
SELECT students.first_name, IFNULL(papers.title, 'MISSING'), IFNULL(papers.grade, 0) FROM students
LEFT JOIN papers ON students.id = papers.student_id;

-- first_name | title                                     | grade
-- ------------------------------------------------------------------
--  Caleb     |   My First Book Report                    |  60
--  Caleb     |   My Second Book Report                   |  75
--  Samantha  |   Russian Lit Through The Ages            |  94
--  Samantha  |   De Montaigne and The Art of The Essay   |  98
--  Raj       |   MISSING                                 |  0
--  Carlos    |   Borges and Magical Realism              |  89
--  Lisa      |   MISSING                                 |  0

-- #5: Print this
-- first_name | average
SELECT students.first_name, IFNULL(AVG(papers.grade), 0) AS average FROM students
LEFT JOIN papers ON students.id = papers.student_id
GROUP BY first_name ORDER BY average DESC;

-- first_name   | average
-- --------------------------
--   Samantha   |  96.0000
--   Carlos     |  89.0000
--   Caleb      |  67.5000
--   Raj        |  0.0000
--   Lisa       |  0.0000


-- #6: Print this
    -- first_name  | average  | passing_status
USE customers;

-- IF(AVG(papers.grade >= 75) AS 'passing_status'
SELECT students.first_name, IFNULL(AVG(papers.grade), 0) AS average, IF(AVG(papers.grade) > 75, 'PASSING', 'FAILING') AS 'passing_status' FROM students
LEFT JOIN papers ON students.id = papers.student_id
GROUP BY first_name ORDER BY average DESC;


-- OR THIS
SELECT first_name, IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN IFNULL(AVG(grade), 0) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
FROM students
    LEFT JOIN papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;


--   first_name   | average    | passing_status
-- -------------------------------------------------
-- Samantha       |  96.0000   |  PASSING
-- Carlos         |  89.0000   |  PASSING
-- Caleb          |  67.5000   |  FAILING
-- Raj            |  0.0000    |  FAILING
-- Lisa           |  0.0000    |  FAILING












-- first_name | title                                     | grade
--  Samantha  |   De Montaigne and The Art of The Essay   |  98
--  Samantha  |   Russian Lit Through The Ages            |  94
--  Carlos    |   Borges and Magical Realism              |  89
--  Caleb     |   My Second Book Report                   |  75
--  Caleb     |   My First Book Report                    |  60

