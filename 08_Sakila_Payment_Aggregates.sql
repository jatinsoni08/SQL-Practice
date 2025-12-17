/*
=========================================
SAKILA DATABASE – PAYMENT TABLE PRACTICE
=========================================

TABLE USED:
payment

IMPORTANT COLUMNS:
- payment_id
- customer_id
- staff_id
- amount
- payment_date

CONCEPTS COVERED:
- COUNT, SUM, AVG, MAX
- GROUP BY
- HAVING
- WHERE
- MONTH(), YEAR(), EXTRACT()
- ORDER BY
*/

USE sakila;

-- Q1: Show all tables in sakila database
SHOW TABLES;

-- Q2: Display all records from payment table
SELECT * FROM payment;


-- =========================================
-- BASIC AGGREGATE QUESTIONS
-- =========================================

-- Q3: Count total number of payments where amount is exactly 2.99
SELECT COUNT(*) AS total_payments
FROM payment
WHERE amount = 2.99;


-- Q4: Find total number of transactions for each amount
SELECT amount, COUNT(*) AS total_transactions
FROM payment
GROUP BY amount;


-- Q5: Find total amount spent by each customer
-- (only for transactions where amount > 3)
SELECT customer_id, SUM(amount) AS total_amount_spent
FROM payment
WHERE amount > 3
GROUP BY customer_id;


-- =========================================
-- DATE-BASED QUESTIONS
-- =========================================

-- Q6: Count number of transactions done by each customer in May
SELECT customer_id, COUNT(amount) AS total_transactions
FROM payment
WHERE MONTH(payment_date) = 5
GROUP BY customer_id;


-- =========================================
-- STAFF-BASED AGGREGATION
-- =========================================

-- Q7: Find maximum, average and total transaction amount
-- done through each staff
SELECT
    staff_id,
    MAX(amount) AS max_transaction,
    AVG(amount) AS avg_transaction,
    SUM(amount) AS total_transaction
FROM payment
GROUP BY staff_id;


-- Q8: Find maximum, average and total transaction amount
-- done through each staff where customer_id is EVEN
SELECT
    staff_id,
    MAX(amount) AS max_transaction,
    AVG(amount) AS avg_transaction,
    SUM(amount) AS total_transaction
FROM payment
WHERE customer_id % 2 = 0
GROUP BY staff_id;


-- =========================================
-- HAVING CLAUSE QUESTIONS
-- =========================================

-- Q9: Get amount and total transactions for each amount
-- only for payments done through staff_id = 1
-- where total transactions are greater than 30
SELECT amount, COUNT(amount) AS total_transactions
FROM payment
WHERE staff_id = 1
GROUP BY amount
HAVING COUNT(amount) > 30;


-- =========================================
-- MONTH & YEAR WISE ANALYSIS
-- =========================================

-- Q10: Find number of customers served, average amount
-- and total amount spent in each month
-- for staff_id 1 or 2
SELECT
    MONTH(payment_date) AS month,
    COUNT(customer_id) AS total_customers,
    AVG(amount) AS avg_amount,
    SUM(amount) AS total_amount
FROM payment
WHERE staff_id IN (1, 2)
GROUP BY MONTH(payment_date);


-- Q11: Find number of customers served, average amount
-- and total amount spent for each month of each year
-- for staff_id 1 or 2
SELECT
    EXTRACT(YEAR FROM payment_date) AS year,
    EXTRACT(MONTH FROM payment_date) AS month,
    COUNT(customer_id) AS total_customers,
    AVG(amount) AS avg_amount,
    SUM(amount) AS total_amount
FROM payment
WHERE staff_id IN (1, 2)
GROUP BY
    EXTRACT(YEAR FROM payment_date),
    EXTRACT(MONTH FROM payment_date);


-- =========================================
-- ORDER BY
-- =========================================

/*
NOTE:
ORDER BY is used to sort the result set.
ASC  → ascending (default)
DESC → descending
*/

-- Q12: Display payment records ordered by customer_id (ascending)
SELECT *
FROM payment
ORDER BY customer_id;

-- Q13: Display payment records ordered by customer_id (descending)
SELECT *
FROM payment
ORDER BY customer_id DESC;
