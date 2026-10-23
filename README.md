# Student Performance and Attendance Tracker

## Project Overview

The Student Performance and Attendance Tracker is a MySQL-based database management project designed to manage student records, academic departments, faculty information, course enrollments, attendance records, and examination results.

The project demonstrates how SQL can be used to organize academic data, maintain relationships between tables, retrieve meaningful information, and analyze student performance and attendance.

## Objectives

- Manage student and faculty records.
- Organize academic departments and courses.
- Maintain student course enrollment details.
- Track attendance statuses, including Present, Absent, and Late.
- Store examination marks and grades.
- Analyze attendance percentages and academic performance.
- Identify students with high or low marks.
- Generate reports using SQL queries.

## Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Concepts:** Database Design, CRUD Operations, Data Analysis, Joins, Subqueries, Aggregate Functions, Window Functions, and Conditional Expressions

## Database Structure

The project consists of the following seven tables:

| Table Name | Description |
|---|---|
| Departments | Stores department details. |
| Students | Stores student personal and admission information. |
| Faculty | Stores faculty details and department assignments. |
| Courses | Stores course information and faculty assignments. |
| Enrollments | Records student course enrollments. |
| Attendance | Maintains attendance records for students and courses. |
| Grades | Stores student marks and grades for individual courses. |

## SQL Concepts Implemented

### 1. CRUD Operations
- INSERT: Add new student, faculty, course, and enrollment records.
- SELECT: Retrieve and display records.
- UPDATE: Modify existing student information.
- DELETE: Remove records while respecting foreign key relationships.

### 2. SQL Clauses
- WHERE
- HAVING
- LIMIT
- ORDER BY
- GROUP BY

### 3. SQL Operators
- AND
- OR
- NOT
- IN

### 4. Sorting and Grouping
- Sort student records alphabetically.
- Count students by department.
- Calculate average marks by course.

### 5. Aggregate Functions
- COUNT()
- AVG()
- MAX()
- MIN()
- SUM()

### 6. Keys and Constraints
- Primary keys
- Foreign keys
- Unique constraints
- NOT NULL constraints
- Referential integrity

### 7. Joins
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN

### 8. Subqueries
- Identify students scoring above the overall average.
- Retrieve courses assigned to experienced faculty.
- Filter students based on attendance and academic conditions.

### 9. Date and Time Functions
- MONTH()
- CURDATE()
- TIMESTAMPDIFF()
- DATE_FORMAT()

### 10. String Functions
- UPPER()
- TRIM()
- COALESCE()

### 11. Window Functions
- RANK()
- SUM() OVER()
- COUNT() OVER()
- PARTITION BY

### 12. CASE Expressions
- Categorize academic performance based on marks.
- Classify attendance records as Regular, Irregular, or Defaulter.

## Key Analysis Features

The SQL queries demonstrate how to:

- Calculate student attendance percentages.
- Identify students with attendance below a specified threshold.
- Find the highest and lowest marks in each course.
- Calculate total marks and rank students.
- Compare individual marks against the overall average.
- Identify students who have not enrolled in any course.
- Find courses without an assigned faculty member.
- Categorize academic performance using conditional logic.

## How to Run the Project

1. Install MySQL Server and open MySQL Workbench or a MySQL command-line client.
2. Open the `Student performance and attendance tracker.sql` file.
3. Execute the SQL script to create the database, tables, and sample records.
4. Run the queries provided in the script to explore the database and analyze the academic data.

The script creates the database named `student_tracker`.

**Note:** The script includes a `DROP DATABASE IF EXISTS` statement. Executing it again will delete the existing `student_tracker` database and recreate it. Back up any data you want to preserve before running the script again.

## Sample SQL Analysis

Calculate average marks for each course:

```sql
SELECT
    course_id,
    AVG(marks_obtained) AS average_marks
FROM Grades
GROUP BY course_id;
```

Calculate attendance percentage for each student:

```sql
SELECT
    student_id,
    AVG(status = 'Present') * 100 AS attendance_percentage
FROM Attendance
GROUP BY student_id;
```

Rank students according to their total marks:

```sql
SELECT
    student_id,
    SUM(marks_obtained) AS total_marks,
    RANK() OVER (
        ORDER BY SUM(marks_obtained) DESC
    ) AS student_rank
FROM Grades
GROUP BY student_id;
```

## Learning Outcomes

This project provides practical experience in relational database design, data manipulation, complex querying, data aggregation, and academic data analysis using MySQL.

It also demonstrates the application of SQL concepts to a real-world educational database scenario.

## Conclusion

The Student Performance and Attendance Tracker demonstrates the use of MySQL to manage and analyze academic records efficiently. By combining relational tables with SQL queries, the project supports student record management, attendance analysis, and performance evaluation while strengthening fundamental and intermediate SQL skills.
