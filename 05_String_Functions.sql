/*
=====================================
STRING FUNCTIONS
=====================================

DEFINITION:
String functions manipulate text data.

FUNCTIONS:
UPPER, LOWER, CONCAT, CONCAT_WS,
SUBSTR, INSTR, LENGTH, TRIM, LPAD
*/

USE world;

-- Q1: Convert country name to upper & lower case
SELECT name, UPPER(name), LOWER(name)
FROM country;

-- Q2: Concatenate name and code
SELECT name, code, CONCAT(name,' ',code)
FROM country;

-- Q3: Concatenate using CONCAT_WS
SELECT name, code, CONCAT_WS(' @ ', name, code)
FROM country;

-- Q4: Find country where concatenation is 'Afghanistan AFG'
SELECT name, code
FROM country
WHERE CONCAT(name,' ',code) = 'Afghanistan AFG';

-- Q5: First 4 and last 2 characters of country name
SELECT name,
SUBSTR(name,1,4),
SUBSTR(name,-2,2)
FROM country;

-- Q6: Countries starting with 'alg'
SELECT name, population
FROM country
WHERE SUBSTR(name,1,3) = 'alg';

-- Q7: Position of 'as' in name
SELECT name, INSTR(name,'as')
FROM country;

-- Q8: Length of country names
SELECT name, CHAR_LENGTH(name)
FROM country;

-- Q9: Trim characters
SELECT TRIM(BOTH 'i' FROM 'iiiiijatinsoni iii');

-- Q10: Pad population
SELECT name, LPAD(population,9,'@')
FROM country;
