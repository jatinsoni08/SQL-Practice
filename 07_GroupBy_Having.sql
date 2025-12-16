/*
=====================================
GROUP BY & HAVING
=====================================

DEFINITION:
GROUP BY → groups similar values
HAVING → filters grouped data

NOTE:
WHERE → before grouping
HAVING → after grouping
*/

USE world;

-- Q1: Count countries per continent
SELECT continent, COUNT(name)
FROM country
GROUP BY continent;

-- Q2: Countries & population per independence year
SELECT IndepYear, COUNT(name), SUM(population)
FROM country
GROUP BY IndepYear;

-- Q3: Continents having more than 30 countries
SELECT continent, COUNT(name)
FROM country
GROUP BY continent
HAVING COUNT(name) > 30;

-- Q4: Continents with population > 40 million
SELECT continent, SUM(population)
FROM country
GROUP BY continent
HAVING SUM(population) > 40000000;

-- Q5: Countries per continent where IndepYear > 1950
SELECT continent, COUNT(name)
FROM country
WHERE IndepYear > 1950
GROUP BY continent;

-- Q6: Independence years having more than 2 countries
SELECT IndepYear, COUNT(name)
FROM country
GROUP BY IndepYear
HAVING COUNT(name) > 2;

-- Q7: Government forms having more than 20 countries
SELECT GovernmentForm, COUNT(name)
FROM country
GROUP BY GovernmentForm
HAVING COUNT(name) > 20;

-- Q8: Continent-wise population where
-- life expectancy > 38 and population > 300000
SELECT continent, COUNT(name), COUNT(region), SUM(population)
FROM country
WHERE LifeExpectancy > 38
GROUP BY continent
HAVING SUM(population) > 300000;
