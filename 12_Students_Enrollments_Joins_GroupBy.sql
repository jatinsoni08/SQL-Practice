/*
========================================================
STUDENTS & ENROLLMENTS – JOINS + GROUP BY PRACTICE
========================================================

CONCEPTS COVERED:
- INNER JOIN
- LEFT JOIN
- Handling NULL values
- GROUP BY with JOIN
- Aggregate functions
- Real-world academic example

========================================================
1. TABLE CREATION
========================================================
*/

USE regex;

-- Students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    major VARCHAR(50)
);

-- Enrollments table
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    credits INT
);

-- ======================================================
-- INSERT DATA
-- ======================================================

INSERT INTO students VALUES
(1, 'Aarav', 'Computer Science'),
(2, 'Bhavya', 'Mathematics'),
(3, 'Chetan', 'Physics'),
(4, 'Diya', 'Computer Science'),
(5, 'Esha', 'Mathematics'),
(6, 'Farhan', 'Physics'),
(7, 'Gauri', 'Computer Science'),
(8, 'Harsh', 'Mathematics'),
(9, 'Isha', 'Physics'),
(10, 'Jay', 'Computer Science'),
(11, 'Kiran', 'Mathematics'),
(12, 'Leena', 'Physics'),
(13, 'Manav', 'Computer Science'),
(14, 'Neha', 'Mathematics'),
(15, 'Om', 'Physics'),
(16, 'Pooja', 'Computer Science'),
(17, 'Qadir', 'Mathematics'),
(18, 'Riya', 'Physics'),
(19, 'Sahil', 'Computer Science'),
(20, 'Tina', 'Mathematics');

INSERT INTO enrollments VALUES
(101, 1, 'Data Structures', 4),
(102, 1, 'Algorithms', 4),
(103, 2, 'Linear Algebra', 3),
(104, 3, 'Quantum Mechanics', 4),
(105, 4, 'Operating Systems', 4),
(106, 5, 'Statistics', 3),
(107, 6, 'Electromagnetism', 4),
(108, 7, 'Databases', 4),
(109, 8, 'Probability', 3),
(110, 9, 'Thermodynamics', 4),
(111, 10, 'Computer Networks', 4),
(112, 11, 'Calculus II', 3),
(113, 12, 'Optics', 4),
(114, 13, 'Machine Learning', 4),
(115, 14, 'Discrete Math', 3),
(116, 15, 'Nuclear Physics', 4),
(117, 16, 'Software Engineering', 4),
(118, 17, 'Numerical Methods', 3),
(119, 18, 'Solid State Physics', 4),
(120, 1, 'Artificial Intelligence', 4);

SELECT * FROM students;
SELECT * FROM enrollments;

-- ======================================================
-- 2. JOIN PRACTICE
-- ======================================================

/*
Q1: Display student name with enrolled courses
(Only students who enrolled in at least one course)
*/
SELECT
    s.student_id,
    s.student_name,
    e.enrollment_id,
    e.course_name
FROM students AS s
JOIN enrollments AS e
ON s.student_id = e.student_id;


/*
Q2: Display all students with their courses
(Including students who have NOT enrolled)
*/
SELECT
    s.student_id,
    s.student_name,
    s.major,
    e.enrollment_id,
    e.course_name,
    e.credits
FROM students AS s
LEFT JOIN enrollments AS e
ON s.student_id = e.student_id;


/*
Q3: Find students who have NOT enrolled in any course
*/
SELECT
    s.student_id,
    s.student_name
FROM students AS s
LEFT JOIN enrollments AS e
ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;


-- ======================================================
-- 3. GROUP BY WITH JOIN
-- ======================================================

/*
Q4: Count number of courses enrolled by each student
*/
SELECT
    s.student_id,
    s.student_name,
    COUNT(e.enrollment_id) AS total_courses
FROM students AS s
JOIN enrollments AS e
ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name;


/*
Q5: Calculate total credits earned by each student
(Including students with no enrollments)
*/
SELECT
    s.student_name,
    COALESCE(SUM(e.credits), 0) AS total_credits
FROM students AS s
LEFT JOIN enrollments AS e
ON s.student_id = e.student_id
GROUP BY s.student_name;


-- ======================================================
-- 4. MAJOR-WISE ANALYSIS
-- ======================================================

/*
Q6: Find number of students in each major
*/
SELECT
    major,
    COUNT(student_id) AS total_students
FROM students
GROUP BY major;


/*
Q7: Find total credits for each major
*/
SELECT
    s.major,
    SUM(e.credits) AS total_credits
FROM students AS s
LEFT JOIN enrollments AS e
ON s.student_id = e.student_id
GROUP BY s.major;


-- ======================================================
-- 5. STRING + GROUP BY PRACTICE
-- ======================================================

/*
Q8: Group students by length of their names
and count students in each group
*/
SELECT
    CHAR_LENGTH(student_name) AS name_length,
    COUNT(student_id) AS total_students
FROM students
GROUP BY CHAR_LENGTH(student_name);


/*
Q9: Find number of enrolled students
grouped by length of their names
*/
SELECT
    CHAR_LENGTH(s.student_name) AS name_length,
    COUNT(e.student_id) AS enrolled_students
FROM students AS s
JOIN enrollments AS e
ON s.student_id = e.student_id
GROUP BY CHAR_LENGTH(s.student_name);


/*
Q10: Find name-length group with
maximum enrollments
*/
SELECT
    CHAR_LENGTH(s.student_name) AS name_length,
    COUNT(e.enrollment_id) AS total_enrollments
FROM students AS s
JOIN enrollments AS e
ON s.student_id = e.student_id
GROUP BY CHAR_LENGTH(s.student_name)
ORDER BY total_enrollments DESC
LIMIT 1;

========================================================
END OF FILE
========================================================
