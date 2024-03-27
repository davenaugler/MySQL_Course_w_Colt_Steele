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

