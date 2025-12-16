/*
=====================================
SELECT & WHERE
=====================================

DEFINITION:
SELECT is used to retrieve data from tables.
WHERE is used to filter rows based on condition.

KEY POINTS:
- WHERE works on rows
- AND / OR combine conditions
- != means NOT EQUAL
*/

USE world;

-- Q1: Display all records from country table
SELECT * FROM country;

-- Q2: Display region, name and population
SELECT region, name, population
FROM country;

-- Q3: Reduce population by 100000
SELECT region, name, population - 100000 AS updated_population
FROM country;

-- Q4: Display countries from Asia
SELECT * FROM country
WHERE Continent = 'Asia';

-- Q5: Display countries independent in 1984
SELECT * FROM country
WHERE IndepYear = 1984;

-- Q6: Countries independent in 1991 and from Asia
SELECT *
FROM country
WHERE IndepYear = 1991
AND Continent = 'Asia';

-- Q7: Countries not belonging to Southern Europe
SELECT name, continent
FROM country
WHERE region != 'Southern Europe';
