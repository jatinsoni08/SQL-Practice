/*
========================================================
DATA MODEL, KEYS, RELATIONSHIPS & JOINS
========================================================

This file contains:
- Theory (definitions & notes)
- Conceptual questions with answers
- Practical SQL examples using WORLD database

========================================================
1. DATA MODEL
========================================================

DEFINITION:
A Data Model defines how data is structured, stored,
organized and related inside a database.

TYPES OF DATA MODEL:

1) Conceptual Data Model
- High level design
- Focuses on ENTITIES & ATTRIBUTES
- No tables, no SQL

Example:
Entity: Country
Attributes: code, name, population

--------------------------------------------------------

2) Logical Data Model
- Defines relationships between entities
- Decides primary key & foreign key
- DBMS independent

Example:
Country (code)  <--->  City (countryCode)

--------------------------------------------------------

3) Physical Data Model
- Actual implementation
- Tables, rows, columns
- SQL is written here

========================================================
2. WHY DO WE NEED TWO TABLES?
========================================================

QUESTION:
Why do we need two tables when we can store all data
in a single table?

ANSWER:
Using a single table causes:
- Data redundancy (same data repeated)
- Storage wastage
- Update & delete anomalies

Example (WRONG):
City table storing country name repeatedly
for every city.

SOLUTION:
Split data into multiple tables and connect
them using relationships.

========================================================
3. WHY DO WE NEED RELATIONSHIP?
========================================================

QUESTION:
Why do we need relationships between tables?

ANSWER:
Relationships are needed to:
- Avoid data duplication
- Maintain data consistency
- Retrieve related data easily
- Apply normalization

Example:
One country can have many cities.
So country and city must be related.

========================================================
4. TYPES OF RELATIONSHIP
========================================================

1) One-to-One
Example:
Person ↔ Passport

2) One-to-Many (MOST COMMON)
Example:
Country → Many Cities

3) Many-to-Many
Example:
Student ↔ Course
(Handled using a third table)

========================================================
5. KEYS
========================================================

PRIMARY KEY:
- Uniquely identifies a record
- No duplicate values
- Cannot be NULL

Example:
country.code
city.id

--------------------------------------------------------

FOREIGN KEY:
- Refers to primary key of another table
- Creates relationship
- Duplicate values allowed

Example:
city.countryCode → country.code

========================================================
6. PRACTICAL SQL EXAMPLES (WORLD DATABASE)
========================================================
*/

USE world;

-- Q1: Display structure of city table
DESCRIBE city;

-- Q2: Display all records from city table
SELECT * FROM city;

-- Q3: Count total country codes and unique country codes
SELECT
    COUNT(code) AS total_codes,
    COUNT(DISTINCT code) AS unique_codes
FROM country;

/*
Explanation:
COUNT(code) → total rows
COUNT(DISTINCT code) → unique countries
*/

-- ======================================================
-- JOINS
-- ======================================================
/*
DEFINITION:
JOIN is used to combine rows from two or more tables
based on a related column (Primary Key & Foreign Key).
*/

-- Q4: Display city details along with country name and continent
SELECT
    cy.id,
    cy.name AS city_name,
    cy.countrycode,
    cnt.name AS country_name,
    cnt.continent
FROM city AS cy
JOIN country AS cnt
ON cy.countrycode = cnt.code;

/*
Explanation:
city.countryCode → Foreign Key
country.code     → Primary Key
*/

-- Q5: Find city name, population, country name
-- and government form for each city
SELECT
    ct.name AS city_name,
    ct.population,
    c.name AS country_name,
    c.GovernmentForm
FROM city AS ct
JOIN country AS c
ON ct.countrycode = c.code;

-- ======================================================
-- COUNTRY & LANGUAGE RELATIONSHIP
-- ======================================================

-- Q6: Get country name, population and
-- language spoken with percentage
SELECT
    c.name AS country_name,
    c.population,
    cl.language,
    cl.percentage
FROM country AS c
JOIN countrylanguage AS cl
ON c.code = cl.countrycode;

/*
RELATIONSHIP TYPE:
One-to-Many
One country → Many languages
*/

/*
========================================================
7. INTERVIEW / VIVA QUICK ANSWERS
========================================================

Q: Why foreign key is used?
A: To create relationship between two tables.

Q: Why join is required?
A: To retrieve data from multiple related tables.

Q: Which relationship is used in world database?
A: One-to-Many relationship.

Q: Example of Primary Key in world DB?
A: country.code, city.id
*/

