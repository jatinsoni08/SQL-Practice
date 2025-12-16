/*
=====================================
LIKE OPERATOR
=====================================

DEFINITION:
LIKE is used for pattern matching.

PATTERNS:
% → multiple characters
_ → single character
*/

USE world;

-- Q1: Regions starting with 'An'
SELECT * FROM country WHERE region LIKE 'An%';

-- Q2: Continents starting with A and 4 letters
SELECT * FROM country WHERE continent LIKE 'A___';

-- Q3: Continents starting with N
SELECT name, continent FROM country WHERE continent LIKE 'N%';

-- Q4: Continents ending with p_
SELECT name, continent FROM country WHERE continent LIKE '%p_';

-- Q5: Continents having at least 4 characters
SELECT name, continent FROM country WHERE continent LIKE '____%';

-- Q6: Regions matching '_a%a_'
SELECT name, continent FROM country WHERE region LIKE '_a%a_';

-- Q7: Regions ending with 'csia'
SELECT name, continent FROM country WHERE region LIKE '__c%sia';

-- Q8: Countries from North & South America
SELECT name, region
FROM country
WHERE Continent IN ('North America', 'South America');
