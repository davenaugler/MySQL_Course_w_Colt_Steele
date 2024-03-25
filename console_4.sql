-- Creating Databases & Tables

show databases;

CREATE DATABASE chicken_coop;

DROP DATABASE pet_shop;

show databases;

CREATE DATABASE chicken_coop;

USE chicken_coop;

select database();

CREATE DATABASE tea_shop; -- Create a database

select database();

USE tea_shop; -- What you type to select the database that you want to use

select database(); -- displays the database that is being used

create database pet_shop;

create table cats
 (
     name varchar(50),
     age int
);

select * from cats;

DROP TABLE cats;

USE pet_shop;

select database();

create table cats
 (
     name varchar(50),
     age int
);

use pet_shop;

create table dogs
(
    name varchar(50),
    breed varchar(50),
    age int
);

select * from dogs;

desc dogs;
desc cats;

select * from dogs;

create table pastries
(
    name varchar(50),
    quantity int
);

desc pastries;

drop table pastries;

