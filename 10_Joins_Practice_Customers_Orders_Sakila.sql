/*
========================================================
JOINS PRACTICE – CUSTOMERS & ORDERS + SAKILA
========================================================

CONCEPTS COVERED:
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- GROUP BY with JOIN
- Real-world example (Customers & Orders)
- Sakila database example (Actor & Films)

========================================================
1. DATABASE & TABLE SETUP
========================================================
*/

-- Create database
CREATE DATABASE REGEX;
USE REGEX;

-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

-- ======================================================
-- INSERT DATA
-- ======================================================

INSERT INTO customers VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');

INSERT INTO orders VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);

-- View data
SELECT * FROM customers;
SELECT * FROM orders;

-- ======================================================
-- NOTE:
-- Orders table contains customer_id (11,12)
-- which do NOT exist in customers table.
-- This helps to understand LEFT & RIGHT JOIN.
-- ======================================================


/*
========================================================
2. INNER JOIN
========================================================

DEFINITION:
INNER JOIN returns only matching records
from both tables.
*/

-- Q1: Display customer name with their orders (INNER JOIN)
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.amount
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id;


-- ======================================================
-- 3. LEFT JOIN
-- ======================================================

/*
DEFINITION:
LEFT JOIN returns:
- All records from LEFT table
- Matching records from RIGHT table
- NULL if no match
*/

-- Q2: Display all customers with their orders (if any)
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.amount
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id;


-- ======================================================
-- 4. RIGHT JOIN
-- ======================================================

/*
DEFINITION:
RIGHT JOIN returns:
- All records from RIGHT table
- Matching records from LEFT table
*/

-- Q3: Display all orders with customer info (if available)
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.amount
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customer_id = o.customer_id;


-- ======================================================
-- 5. COLUMN RENAME (ALTER)
-- ======================================================

-- Rename customer_id to cid
ALTER TABLE customers RENAME COLUMN customer_id TO cid;

DESC customers;


-- ======================================================
-- 6. GROUP BY WITH JOIN
-- ======================================================

/*
Q4: Find total amount spent by each customer
*/

SELECT
    c.customer_name,
    SUM(o.amount) AS total_amount
FROM customers AS c
JOIN orders AS o
ON c.cid = o.customer_id
GROUP BY c.customer_name;


-- ======================================================
-- 7. SAKILA DATABASE PRACTICE
-- ======================================================

USE sakila;

/*
Q5: Find actor id, actor name
and total number of movies
each actor has worked in
*/

SELECT
    a.actor_id,
    CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
    COUNT(fa.film_id) AS total_movies
FROM actor AS a
JOIN film_actor AS fa
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name;


/*
NOTE:
- actor ↔ film_actor
- One actor → many films
- Relationship type: One-to-Many
*/

