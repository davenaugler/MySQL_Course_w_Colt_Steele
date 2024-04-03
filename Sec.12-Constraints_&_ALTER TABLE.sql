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


