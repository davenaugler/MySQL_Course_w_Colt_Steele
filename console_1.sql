-- Inserting Data

-- use pet_shop;

desc cats;
desc dogs;

-- Insert
insert into cats (name, age)
values ("Blue Steele", 5);

insert into cats (name, age)
values ("Johhy B", 12);

-- Show table
select * from cats;

insert into cats (age, name)
values (4, "Ben Mark");

select * from cats;

-- Group Insert
insert into cats (name, age)
values ("Charlie", 10),
       ("Sadie", 3),
       ("Lazy Bear", 1);

select * from cats;

use pet_shop;
create table people
(
    first_name varchar(20),
    last_name varchar(20),
    age int
);

select * from people;
desc people;

insert into people (first_name, last_name, age)
values ("Tina", "Belcher", 13),
       ("Linda", "Belcher", 45),
       ("Phillip", "Frond", 38),
       ("Calvin", "Fischoeder", 70);

select * from people;

insert into people (first_name, last_name, age)
values ("Bob", "Belcher", 42);

drop table people;

select * from people;

use pet_shop;

create table cats2
(
    name varchar(50) not null,
    age int not null
);

select * from cats2;
desc cats2;

insert into cats2 (name)
values ('Perywinkle');

insert into cats2 (name, age)
values ('Perywinkle', 2);

desc cats;
desc cats2;
select * from cats2;

CREATE TABLE shops (name varchar(100));

INSERT INTO shops (name)
VALUES ('shoe_emporium');

INSERT INTO shops (name)
VALUES ('mario\'s pizza');

select * from shops;

CREATE TABLE cats3
(
    name varchar(100) DEFAULT 'unnamed',
    age int DEFAULT 99
)

desc cats3;
desc cats2;

INSERT INTO cats3(age)
VALUES (3);

select * from cats3;

INSERT INTO cats3 ()
VALUE ();

SELECT * FROM cats3;

CREATE TABLE cats4 (name varchar(50), age int, color varchar(50));

DESC cats4;

ALTER TABLE cats4 ALTER COLUMN name SET DEFAULT 'Unknown';
ALTER TABLE cats4 ALTER COLUMN age SET DEFAULT 0;
ALTER TABLE cats4 ALTER COLUMN color SET DEFAULT 'Not specified';

INSERT INTO cats4 (name, age, color)
VALUES ('Whisckers', 4, 'Brown');

INSERT INTO cats4 (name, color)
VALUES ('Renae', 'Black');

INSERT INTO cats4 (name)
VALUES ('Oreo');

select * from cats4;
desc cats4;

DELETE FROM cats4 WHERE name = 'Whisckers';

select * from cats4;

CREATE TABLE cats5
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

DESC cats5;

INSERT INTO cats5 (name, age)
VALUE ('John', 3);

select * from cats5;

INSERT INTO cats5 (name, age)
VALUE ('Boro', 1),
    ('Dangles', 4),
    ('JumpSter', 5),
    ('Fred', 3),
    ('Ron', 2),
    ('Abby', 8);

select * from cats5;

CREATE TABLE employees
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    age INT NOT NULL,
    current_status VARCHAR(50) NOT NULL DEFAULT 'employed'
);

DESC employees;

INSERT INTO employees (last_name, first_name, middle_name, age)
VALUE ('Naugler', 'Dave', NULL, 38),
('Smith', 'Katy', 'South', 25),
('Eldridge', 'Karen', 'North', 43),
('Evans', 'Zach', 'West', 25),
('Gallows', 'Pete', 'East', 43);

select * from employees;

INSERT INTO employees (last_name, first_name, middle_name, age, current_status)
VALUE ('Slider', 'Jane', NULL, 38, DEFAULT),
('MyArm', 'Katy', 'Jordan', 25, 'contractor'),
('BeNiggles', 'Borris', 'North', 43, DEFAULT),
('MeQuick', 'Sean', 'West', 25, 'let go'),
('MeNimble', 'Jack', 'East', 43, 'let go');

select * from employees;

INSERT INTO employees (last_name, first_name, middle_name, current_status)
VALUE ('Jangles', 'Boe', 'Serin', DEFAULT);











