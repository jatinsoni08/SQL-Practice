/*
=====================================
AGGREGATE FUNCTIONS
=====================================

DEFINITION:
Aggregate functions perform calculation on
multiple rows and return a single value.

FUNCTIONS:
COUNT, SUM, AVG, MIN, MAX
*/

USE sakila;

-- Q1: Count staff members
SELECT COUNT(first_name) FROM staff;

-- Q2: Min, Max and Avg sales
SELECT MIN(total_sales), MAX(total_sales), AVG(total_sales)
FROM sales_by_store;

-- Q3: Total sales
SELECT SUM(total_sales) FROM sales_by_store;

USE world;

-- Q4: Unique continents
SELECT DISTINCT continent FROM country;

-- Q5: Count independence years
SELECT COUNT(indepyear) FROM country;

-- Q6: Countries, regions, avg life expectancy & population
-- (independent between 1947 and 1998)
SELECT
COUNT(name),
COUNT(region),
AVG(LifeExpectancy),
SUM(population)
FROM country
WHERE IndepYear > 1947 AND IndepYear < 1998;
