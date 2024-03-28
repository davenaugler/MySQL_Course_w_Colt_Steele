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




















