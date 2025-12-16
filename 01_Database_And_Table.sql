/*
=====================================
DATABASE & TABLE
=====================================

DEFINITION:
Database is an organized collection of data
that can be easily accessed, managed and updated.

KEY POINTS:
- CREATE DATABASE → create new database
- USE → select database
- SHOW TABLES → view tables
- CREATE TABLE → create table
*/

-- Q1: Show all databases
SHOW DATABASES;

-- Q2: Create a database named tata
CREATE DATABASE tata;

-- Q3: Use tata database
USE tata;

-- Q4: Show tables
SHOW TABLES;

-- Q5: Create a table CAR1 with price and color
CREATE TABLE car1 (
    price INT,
    color CHAR(20)
);

-- Q6: Show tables after creation
SHOW TABLES;
