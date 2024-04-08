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
-- ------------