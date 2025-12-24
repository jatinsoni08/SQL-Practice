/*
========================================================
SELF JOIN – EMPLOYEE & MANAGER HIERARCHY
========================================================

CONCEPTS COVERED:
- Self Join
- Hierarchical data
- Primary Key & Foreign Key
- Employee–Manager relationship
- Real-world organization structure

========================================================
1. WHAT IS SELF JOIN?
========================================================

DEFINITION:
A SELF JOIN is a join where a table is joined with itself.
It is used when data in a table is related to other data
in the same table.

COMMON USE CASE:
- Employee ↔ Manager relationship
- Parent ↔ Child hierarchy

========================================================
2. TABLE STRUCTURE
========================================================
*/

USE regex;

-- Employee table with self-referencing foreign key
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    manager_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (manager_id) REFERENCES employee(emp_id)
);

-- ======================================================
-- INSERT DATA
-- ======================================================

INSERT INTO employee VALUES
(1, 'Alice', 'CEO', NULL, 120000),

(2, 'Bob', 'CTO', 1, 95000),
(3, 'Carol', 'CFO', 1, 90000),
(4, 'David', 'HR Manager', 1, 85000),

(5, 'Eve', 'Tech Lead', 2, 75000),
(6, 'Frank', 'Senior Developer', 2, 72000),
(7, 'Grace', 'Senior Developer', 2, 71000),

(8, 'Heidi', 'Developer', 5, 60000),
(9, 'Ivan', 'Developer', 5, 58000),
(10, 'Judy', 'Developer', 6, 59000),

(11, 'Mallory', 'Accountant', 3, 65000),
(12, 'Niaj', 'Financial Analyst', 3, 62000),

(13, 'Olivia', 'HR Executive', 4, 55000),
(14, 'Peggy', 'HR Executive', 4, 54000),

(15, 'Sybil', 'Intern', 8, 35000);

SELECT * FROM employee;

-- ======================================================
-- 3. SELF JOIN EXAMPLES
-- ======================================================

/*
Q1: Display employee id, employee name and their manager id
*/
SELECT emp.emp_id, emp.emp_name, emp.manager_id
FROM employee AS emp;


/*
Q2: Display manager details only
*/
SELECT manager.emp_id, manager.emp_name
FROM employee AS manager;


/*
Q3: Display employee name along with their manager name
*/
SELECT
    emp.emp_id AS employee_id,
    emp.emp_name AS employee_name,
    emp.salary AS employee_salary,
    manager.emp_id AS manager_id,
    manager.emp_name AS manager_name,
    manager.salary AS manager_salary
FROM employee AS emp
JOIN employee AS manager
ON emp.manager_id = manager.emp_id;


/*
Q4: Display employee name and their manager name
(including CEO with NULL manager)
*/
SELECT
    emp.emp_name AS employee_name,
    manager.emp_name AS manager_name
FROM employee AS emp
LEFT JOIN employee AS manager
ON emp.manager_id = manager.emp_id;


/*
Q5: Find employees who do NOT have any manager (Top level)
*/
SELECT emp_id, emp_name, job_title
FROM employee
WHERE manager_id IS NULL;


/*
Q6: Find employees who are managers
(i.e., employees whose emp_id appears as manager_id)
*/
SELECT DISTINCT manager.emp_id, manager.emp_name
FROM employee AS emp
JOIN employee AS manager
ON emp.manager_id = manager.emp_id;



/*
========================================================
5. INTERVIEW QUESTIONS & ANSWERS
========================================================

Q: Why self join is required?
A: When rows in the same table are related to each other.

Q: Difference between JOIN and SELF JOIN?
A: JOIN connects two different tables,
   SELF JOIN connects a table with itself.
*/