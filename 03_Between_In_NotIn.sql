/*
=====================================
BETWEEN, IN, NOT IN
=====================================

DEFINITION:
- BETWEEN → range of values
- IN → multiple values
- NOT IN → exclude values
*/

USE world;

-- Q1: Countries independent between 1912 and 1919
SELECT *
FROM country
WHERE IndepYear BETWEEN 1912 AND 1919;

-- Q2: Countries independent in 1991 or 1975 from Asia or Africa
SELECT name, region
FROM country
WHERE IndepYear IN (1991, 1975)
AND Continent IN ('Asia', 'Africa');

-- Q3: Countries not from Asia and Africa
SELECT *
FROM country
WHERE Continent NOT IN ('Asia', 'Africa');

-- Q4: Population not between 5000 and 300000
SELECT name, population, region
FROM country
WHERE population NOT BETWEEN 5000 AND 300000;
