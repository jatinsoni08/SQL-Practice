/*
========================================================
CASE EXPRESSION – CONDITIONAL LOGIC IN SQL
========================================================

CONCEPT:
The CASE expression in SQL works like IF–ELSE logic
used in programming languages.

WHY CASE?
- Writing nested IF() functions makes queries complex
- CASE is more readable, flexible, and powerful
- CASE evaluates every row (it does NOT filter rows)

SYNTAX:
CASE
    WHEN condition THEN result
    WHEN condition THEN result
    ELSE result
END

========================================================
*/

USE world;

SELECT * FROM country;

-- ======================================================
-- BASIC CASE EXAMPLES
-- ======================================================

/*
Q1: Categorize countries based on population
*/
SELECT
    name,
    population,
    CASE
        WHEN population = 0 THEN 'No Population'
        WHEN population BETWEEN 80000 AND 100000 THEN 'Medium Population'
        ELSE 'Other Population'
    END AS population_status
FROM country;


/*
Q2: Count the number of countries in each population category
*/
SELECT
    COUNT(*) AS total_countries,
    CASE
        WHEN population = 0 THEN 'No Population'
        WHEN population BETWEEN 80000 AND 100000 THEN 'Medium Population'
        ELSE 'Other Population'
    END AS status
FROM country
GROUP BY status;


-- ======================================================
-- CASE WITH CONTINENT
-- ======================================================

/*
Q3: Check which countries fall between population 8000–70000
*/
SELECT
    continent,
    population,
    CASE
        WHEN population BETWEEN 8000 AND 70000 THEN 'TRUE'
        ELSE 'FALSE'
    END AS study
FROM country;


/*
IMPORTANT NOTE:
The WHERE clause filters data (removes rows).
The CASE expression evaluates every row.

For classification or categorization,
CASE is used instead of WHERE.
*/


-- ======================================================
-- CASE WITH AGGREGATE FUNCTIONS
-- ======================================================

/*
Q4: Count the number of countries per continent
that have population between 8000–70000
*/
SELECT
    continent,
    SUM(
        CASE
            WHEN population BETWEEN 8000 AND 70000 THEN 1
            ELSE 0
        END
    ) AS countries_in_range
FROM country
GROUP BY continent;


-- ======================================================
-- ADDITIONAL PRACTICE QUESTIONS
-- ======================================================

/*
Q5: Categorize countries based on population size
*/
SELECT
    name,
    population,
    CASE
        WHEN population < 100000 THEN 'Low'
        WHEN population BETWEEN 100000 AND 1000000 THEN 'Medium'
        ELSE 'High'
    END AS population_category
FROM country;


/*
Q6: Count the number of high-population countries
for each continent
*/
SELECT
    continent,
    SUM(
        CASE
            WHEN population > 1000000 THEN 1
            ELSE 0
        END
    ) AS high_population_countries
FROM country
GROUP BY continent;


/*
Q7: Show continent-wise total population
and classify continents as Large or Small
*/
SELECT
    continent,
    SUM(population) AS total_population,
    CASE
        WHEN SUM(population) > 100000000 THEN 'Large Continent'
        ELSE 'Small Continent'
    END AS continent_type
FROM country
GROUP BY continent;
