-- Section 12: Constraints & ALTER TABLE
--   UNIQUE constraint
-- --------------------
--   Unique means that this piece of data can not be duplicated.

CREATE TABLE contacts (
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    PRIMARY KEY(id)
);

DESC contacts;

INSERT INTO contacts (name, phone)
VALUES ('John Smith', 3071542585);

SELECT * FROM contacts;

INSERT INTO contacts (name, phone)
VALUES ('Jane Smith', 3071542584);

SELECT * FROM contacts;


-- CHECK Constraints
-- ------------------

CREATE TABLE users (
    id INT AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    age INT CHECK (age > 18),
    PRIMARY KEY(id)
);

DESC users;

-- [HY000][3819] Check constraint 'users_chk_1' is violated.
INSERT INTO users (username, age)
VALUES ('JohnSmith', 16);

INSERT INTO users (username, age)
VALUES ('JohnSmith', 19);

ALTER TABLE users
MODIFY COLUMN age INT CHECK (age >= 18);

INSERT INTO users (username, age)
VALUES ('JaneSmith', 18);

SELECT * FROM users;

DESC users;

-- Needed to drop previous checks to allow ...
-- ALTER TABLE users
-- MODIFY COLUMN age INT CHECK (age >= 18);
-- ...to work

INSERT INTO users (username, age)
VALUE ('Blue the cat', 60);

SELECT * FROM users;

CREATE TABLE palindromes (
    id INT AUTO_INCREMENT,
    word VARCHAR(100) CHECK(REVERSE(word) = word),
    PRIMARY KEY(id)
);

DESC palindromes;

INSERT INTO palindromes (word)
VALUES ('racecar');

SELECT * FROM palindromes;

INSERT INTO palindromes (word)
VALUES ('mom'),
       ('dad');

SELECT * FROM palindromes;

INSERT INTO palindromes (word)
VALUES ('Randy');

SELECT * FROM palindromes;

INSERT INTO palindromes (word)
VALUES ('Dod');

SELECT * FROM palindromes;

-- NAMED Constraints
-- ------------------

-- (From main Dev1 above to Dev2 below. See if this will run and work on Dev2 w/o creating it's own separate query files.)

CREATE TABLE users2 (
    id INT AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    age INT,
    CONSTRAINT age_18_or_over CHECK (age >= 18),
    PRIMARY KEY(id)
);

INSERT INTO users2 (username, age)
    VALUE ('Chicken Lady', 18);

INSERT INTO users2 (username, age)
    VALUE ('Not Chicken Lady', 17);

-- NAMED Constraints are important because when you have a CHECK that's being ran against your SQL code
--   and a error comes back, you want a clearly understood name (variable name) for that CHECK.


SELECT * FROM users2;

DESC users2;

CREATE TABLE palindrome2 (
    id INT AUTO_INCREMENT,
    word VARCHAR(100),
    CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word),
    PRIMARY KEY(id)
);

DESC palindrome2;

INSERT INTO palindrome2 (word)
    VALUE ('mom');

SELECT * FROM palindrome2;

-- Error: Check constraint 'word_is_palindrome' is violated.
--   This is a good thing
INSERT INTO palindrome2 (word)
    VALUE ('momma');

-- Multi-Column Checks
-- --------------------

-- The combination of name and address must be unique. Individually they can be the same.
CREATE TABLE companies (
    id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT name_address UNIQUE (name, address)
);

INSERT INTO companies (name, address)
    VALUE ('Top Company Inc.', '135 Spruce Ln.');

SELECT * FROM companies;

INSERT INTO companies (name, address)
    VALUE ('Mary\'s Pies', '135 Spruce Ln.');

SELECT * FROM companies;

-- Error: Duplicate entry 'Top Company Inc.-135 Spruce Ln.' for key 'companies.name_address'
--   This is a good thing
INSERT INTO companies (name, address)
    VALUE ('Top Company Inc.', '135 Spruce Ln.');

-- Pretend we flip houses
CREATE TABLE houses (
    id INT AUTO_INCREMENT,
    purchase_price INT NOT NULL,
    sale_price INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT salePrice_gt_purchasePrice CHECK(sale_price >= purchase_price)
);

DESC houses;

INSERT INTO houses (purchase_price, sale_price)
VALUE (100, 200);

SELECT * FROM houses;

-- Error: Check constraint 'salePrice_gt_purchasePrice' is violated.
--   This is a good thing
INSERT INTO houses (purchase_price, sale_price)
VALUE (300, 250);

INSERT INTO houses (purchase_price, sale_price)
VALUE (300, 300);

SELECT * FROM houses;

-- Alter Table
-- --------------------