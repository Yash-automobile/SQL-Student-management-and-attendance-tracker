drop database if exists student_tracker;
CREATE DATABASE student_tracker;
USE student_tracker;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO Departments VALUES
(1, 'Automobile Engineering'),
(2, 'Computer Engineering'),
(3, 'Mechanical Engineering'),
(4, 'Electrical Engineering'),
(5, 'Civil Engineering');


CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    gender VARCHAR(10),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    address VARCHAR(255),
    admission_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Students VALUES
(101, 'Rahul Sharma', '2004-05-12', 'Male',
 'rahul@gmail.com', '9876543210', 'Ahmedabad',
 '2023-07-15', 1),

(102, 'Priya Patel', '2004-08-20', 'Female',
 'priya@gmail.com', '9876543211', 'Surat',
 '2023-07-16', 2),

(103, 'Amit Shah', '2003-11-10', 'Male',
 'amit@gmail.com', '9876543212', 'Vadodara',
 '2023-07-17', 1),

(104, 'Neha Desai', '2004-02-25', 'Female',
 'neha@gmail.com', '9876543213', 'Rajkot',
 '2023-07-18', 3),

(105, 'Karan Mehta', '2003-09-14', 'Male',
 'karan@gmail.com', '9876543214', 'Ahmedabad',
 '2023-07-19', 2),
(107, 'Riya Shah', '2004-12-10', 'Female',
 'riya@gmail.com', '9876543216', 'Vadodara',
 '2023-07-26', 3);
 
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Faculty VALUES
(201, 'Dr. Mehta', 'mehta@gmail.com',
 '9876500001', 1),

(202, 'Prof. Shah', 'shah@gmail.com',
 '9876500002', 2),

(203, 'Dr. Patel', 'patel@gmail.com',
 '9876500003', 3),

(204, 'Prof. Joshi', 'joshi@gmail.com',
 '9876500004', 4),

(205, 'Dr. Trivedi', 'trivedi@gmail.com',
 '9876500005', 5),
(207, 'Prof. Raval', 'raval@gmail.com',
 '9876500007', 5);
 
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    faculty_id INT,
    FOREIGN KEY (faculty_id)
        REFERENCES Faculty(faculty_id)
);

INSERT INTO Courses VALUES
(301, 'Automobile Engineering', 201),
(302, 'Database Management', 202),
(303, 'Thermodynamics', 203),
(304, 'Electrical Machines', 204),
(305, 'Structural Engineering', 205),
(307, 'Engineering Mathematics', NULL);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);

INSERT INTO Enrollments VALUES
(401, 101, 301, '2023-07-20'),
(402, 101, 302, '2023-07-21'),
(403, 102, 302, '2023-07-21'),
(404, 102, 304, '2023-07-22'),
(405, 103, 301, '2023-07-22'),
(406, 103, 303, '2023-07-23'),
(407, 104, 303, '2023-07-23'),
(408, 105, 302, '2023-07-24'),
(409, 105, 305, '2023-07-24'),
(410, 104, 305, '2023-07-25');

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    attendance_date DATE,
    status ENUM('Present', 'Absent', 'Late'),
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);

INSERT INTO Attendance VALUES
(501, 101, 301, '2023-08-01', 'Present'),
(502, 101, 301, '2023-08-02', 'Absent'),
(503, 102, 302, '2023-08-01', 'Present'),
(504, 102, 302, '2023-08-02', 'Late'),
(505, 103, 301, '2023-08-01', 'Present'),
(506, 103, 301, '2023-08-02', 'Present'),
(507, 104, 303, '2023-08-01', 'Absent'),
(508, 104, 303, '2023-08-02', 'Present'),
(509, 105, 302, '2023-08-01', 'Late'),
(510, 105, 302, '2023-08-02', 'Present'),
(511, 104, 303, '2023-08-03', 'Absent');

CREATE TABLE Grades (
    grade_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks_obtained DECIMAL(5,2),
    grade VARCHAR(2),
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);

INSERT INTO Grades VALUES
(601, 101, 301, 85.00, 'A'),
(602, 101, 302, 92.00, 'A+'),
(603, 102, 302, 78.00, 'B+'),
(604, 102, 304, 88.00, 'A'),
(605, 103, 301, 95.00, 'A+'),
(606, 103, 303, 72.00, 'B'),
(607, 104, 303, 65.00, 'C'),
(608, 104, 305, 81.00, 'A'),
(609, 105, 302, 55.00, 'D'),
(610, 105, 305, 90.00, 'A+'),
(611, 104, 303, 35.00, 'F');



here are the all queries to be perform on those tables are given below;

=======================================================================================

1. implement CRUD operation

i. 
mysql> INSERT INTO Students (
    ->     student_id, name, dob, gender, email,
    ->     phone_number, address, admission_date, department_id
    -> )
    -> VALUES (
    ->     106, 'Jay Patel', '2004-06-15', 'Male',
    ->     'jay@gmail.com', '9876543215', 'Surat',
    ->     '2023-07-25', 1
    -> );
Query OK, 1 row affected (0.065 sec)

mysql> Select * from students;
+------------+--------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
| student_id | name         | dob        | gender | email           | phone_number | address   | admission_date | department_id |
+------------+--------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
|        101 | Rahul Sharma | 2004-05-12 | Male   | rahul@gmail.com | 9876543210   | Ahmedabad | 2023-07-15     |             1 |
|        102 | Priya Patel  | 2004-08-20 | Female | priya@gmail.com | 9876543211   | Surat     | 2023-07-16     |             2 |
|        103 | Amit Shah    | 2003-11-10 | Male   | amit@gmail.com  | 9876543212   | Vadodara  | 2023-07-17     |             1 |
|        104 | Neha Desai   | 2004-02-25 | Female | neha@gmail.com  | 9876543213   | Rajkot    | 2023-07-18     |             3 |
|        105 | Karan Mehta  | 2003-09-14 | Male   | karan@gmail.com | 9876543214   | Ahmedabad | 2023-07-19     |             2 |
|        106 | Jay Patel    | 2004-06-15 | Male   | jay@gmail.com   | 9876543215   | Surat     | 2023-07-25     |             1 |
|        107 | Riya Shah    | 2004-12-10 | Female | riya@gmail.com  | 9876543216   | Vadodara  | 2023-07-26     |             3 |
+------------+--------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
7 rows in set (0.006 sec)

mysql> INSERT INTO Faculty (
    ->     faculty_id, name, email, phone_number, department_id
    -> )
    -> VALUES (
    ->     206, 'Dr. Shah', 'dr.shah@gmail.com',
    ->     '9876500006', 1
    -> );
Query OK, 1 row affected (0.061 sec)

mysql> SELECT * FROM Faculty
    -> WHERE faculty_id = 206;
+------------+----------+-------------------+--------------+---------------+
| faculty_id | name     | email             | phone_number | department_id |
+------------+----------+-------------------+--------------+---------------+
|        206 | Dr. Shah | dr.shah@gmail.com | 9876500006   |             1 |
+------------+----------+-------------------+--------------+---------------+
1 row in set (0.006 sec)

mysql> INSERT INTO Courses (course_id, course_name, faculty_id)
    -> VALUES (306, 'Vehicle Dynamics', 206);
Query OK, 1 row affected (0.059 sec)

mysql> SELECT * FROM Courses
    -> WHERE course_id = 306;
+-----------+------------------+------------+
| course_id | course_name      | faculty_id |
+-----------+------------------+------------+
|       306 | Vehicle Dynamics |        206 |
+-----------+------------------+------------+
1 row in set (0.008 sec)

mysql> INSERT INTO Enrollments (
    ->     enrollment_id, student_id, course_id, enrollment_date
    -> )
    -> VALUES (
    ->     411, 106, 306, '2023-07-26'
    -> );
Query OK, 1 row affected (0.049 sec)

mysql> SELECT * FROM Enrollments
    -> WHERE enrollment_id = 411;
+---------------+------------+-----------+-----------------+
| enrollment_id | student_id | course_id | enrollment_date |
+---------------+------------+-----------+-----------------+
|           411 |        106 |       306 | 2023-07-26      |
+---------------+------------+-----------+-----------------+
1 row in set (0.007 sec)


ii. 

mysql> SELECT *
    -> FROM Students
    -> WHERE student_id = 106;
+------------+-----------+------------+--------+---------------+--------------+-----------+----------------+---------------+
| student_id | name      | dob        | gender | email         | phone_number | address   | admission_date | department_id |
+------------+-----------+------------+--------+---------------+--------------+-----------+----------------+---------------+
|        106 | Jay Patel | 2004-06-15 | Male   | jay@gmail.com | 9998887776   | Ahmedabad | 2023-07-25     |             1 |
+------------+-----------+------------+--------+---------------+--------------+-----------+----------------+---------------+
1 row in set (0.007 sec)


iii. 
mysql> DELETE FROM Attendance WHERE student_id = 106;
Query OK, 0 rows affected (0.010 sec)

mysql> DELETE FROM Grades WHERE student_id = 106;
Query OK, 0 rows affected (0.016 sec)

mysql> DELETE FROM Enrollments WHERE student_id = 106;
Query OK, 1 row affected (0.071 sec)

mysql> DELETE FROM Students WHERE student_id = 106;
Query OK, 1 row affected (0.032 sec)

mysql> SELECT * FROM Students;
+------------+--------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
| student_id | name         | dob        | gender | email           | phone_number | address   | admission_date | department_id |
+------------+--------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
|        101 | Rahul Sharma | 2004-05-12 | Male   | rahul@gmail.com | 9876543210   | Ahmedabad | 2023-07-15     |             1 |
|        102 | Priya Patel  | 2004-08-20 | Female | priya@gmail.com | 9876543211   | Surat     | 2023-07-16     |             2 |
|        103 | Amit Shah    | 2003-11-10 | Male   | amit@gmail.com  | 9876543212   | Vadodara  | 2023-07-17     |             1 |
|        104 | Neha Desai   | 2004-02-25 | Female | neha@gmail.com  | 9876543213   | Rajkot    | 2023-07-18     |             3 |
|        105 | Karan Mehta  | 2003-09-14 | Male   | karan@gmail.com | 9876543214   | Ahmedabad | 2023-07-19     |             2 |
|        107 | Riya Shah    | 2004-12-10 | Female | riya@gmail.com  | 9876543216   | Vadodara  | 2023-07-26     |             3 |
+------------+--------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
6 rows in set (0.007 sec)

mysql>
mysql> SELECT * FROM Students;
+------------+--------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
| student_id | name         | dob        | gender | email           | phone_number | address   | admission_date | department_id |
+------------+--------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
|        101 | Rahul Sharma | 2004-05-12 | Male   | rahul@gmail.com | 9876543210   | Ahmedabad | 2023-07-15     |             1 |
|        102 | Priya Patel  | 2004-08-20 | Female | priya@gmail.com | 9876543211   | Surat     | 2023-07-16     |             2 |
|        103 | Amit Shah    | 2003-11-10 | Male   | amit@gmail.com  | 9876543212   | Vadodara  | 2023-07-17     |             1 |
|        104 | Neha Desai   | 2004-02-25 | Female | neha@gmail.com  | 9876543213   | Rajkot    | 2023-07-18     |             3 |
|        105 | Karan Mehta  | 2003-09-14 | Male   | karan@gmail.com | 9876543214   | Ahmedabad | 2023-07-19     |             2 |
|        107 | Riya Shah    | 2004-12-10 | Female | riya@gmail.com  | 9876543216   | Vadodara  | 2023-07-26     |             3 |
+------------+--------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
6 rows in set (0.005 sec)

mysql> SELECT * FROM Faculty;
+------------+-------------+-------------------+--------------+---------------+
| faculty_id | name        | email             | phone_number | department_id |
+------------+-------------+-------------------+--------------+---------------+
|        201 | Dr. Mehta   | mehta@gmail.com   | 9876500001   |             1 |
|        202 | Prof. Shah  | shah@gmail.com    | 9876500002   |             2 |
|        203 | Dr. Patel   | patel@gmail.com   | 9876500003   |             3 |
|        204 | Prof. Joshi | joshi@gmail.com   | 9876500004   |             4 |
|        205 | Dr. Trivedi | trivedi@gmail.com | 9876500005   |             5 |
|        206 | Dr. Shah    | dr.shah@gmail.com | 9876500006   |             1 |
|        207 | Prof. Raval | raval@gmail.com   | 9876500007   |             5 |
+------------+-------------+-------------------+--------------+---------------+
7 rows in set (0.004 sec)

mysql> SELECT * FROM Courses;
+-----------+-------------------------+------------+
| course_id | course_name             | faculty_id |
+-----------+-------------------------+------------+
|       301 | Automobile Engineering  |        201 |
|       302 | Database Management     |        202 |
|       303 | Thermodynamics          |        203 |
|       304 | Electrical Machines     |        204 |
|       305 | Structural Engineering  |        205 |
|       306 | Vehicle Dynamics        |        206 |
|       307 | Engineering Mathematics |       NULL |
+-----------+-------------------------+------------+
7 rows in set (0.004 sec)

mysql> SELECT * FROM Enrollments;
+---------------+------------+-----------+-----------------+
| enrollment_id | student_id | course_id | enrollment_date |
+---------------+------------+-----------+-----------------+
|           401 |        101 |       301 | 2023-07-20      |
|           402 |        101 |       302 | 2023-07-21      |
|           403 |        102 |       302 | 2023-07-21      |
|           404 |        102 |       304 | 2023-07-22      |
|           405 |        103 |       301 | 2023-07-22      |
|           406 |        103 |       303 | 2023-07-23      |
|           407 |        104 |       303 | 2023-07-23      |
|           408 |        105 |       302 | 2023-07-24      |
|           409 |        105 |       305 | 2023-07-24      |
|           410 |        104 |       305 | 2023-07-25      |
+---------------+------------+-----------+-----------------+
10 rows in set (0.032 sec)

=======================================================================================

2. CLAUSES Like WHERE, HAVING, LIMIT

i. 

mysql> SELECT *
    -> FROM Students
    -> WHERE department_id = (
    -> SELECT department_id
    -> FROM Departments
    -> WHERE department_name = 'Computer Engineering'
    -> );
+------------+-------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
| student_id | name        | dob        | gender | email           | phone_number | address   | admission_date | department_id |
+------------+-------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
|        102 | Priya Patel | 2004-08-20 | Female | priya@gmail.com | 9876543211   | Surat     | 2023-07-16     |             2 |
|        105 | Karan Mehta | 2003-09-14 | Male   | karan@gmail.com | 9876543214   | Ahmedabad | 2023-07-19     |             2 |
+------------+-------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
2 rows in set (0.010 sec)


ii. 
mysql> SELECT student_id, marks_obtained
    -> FROM Grades
    -> ORDER BY marks_obtained DESC
    -> LIMIT 10;
+------------+----------------+
| student_id | marks_obtained |
+------------+----------------+
|        103 |          95.00 |
|        101 |          92.00 |
|        105 |          90.00 |
|        102 |          88.00 |
|        101 |          85.00 |
|        104 |          81.00 |
|        102 |          78.00 |
|        103 |          72.00 |
|        104 |          65.00 |
|        105 |          55.00 |
+------------+----------------+
10 rows in set (0.007 sec)


iii.
mysql> SELECT
    ->     student_id,
    ->     AVG(status = 'Present') * 100 AS attendance_percentage
    -> FROM
    ->     Attendance
    -> GROUP BY student_id
    -> HAVING AVG(status = 'Present') < 0.75;
+------------+-----------------------+
| student_id | attendance_percentage |
+------------+-----------------------+
|        101 |               50.0000 |
|        102 |               50.0000 |
|        104 |               33.3333 |
|        105 |               50.0000 |
+------------+-----------------------+
4 rows in set (0.008 sec)

=======================================================================================

3. SQL operators AND, OR, NOT

i. 
mysql> SELECT student_id
    -> FROM Attendance
    -> GROUP BY student_id
    -> HAVING SUM(status = 'Present') * 100.0 / COUNT(*) < 50
    -> AND student_id IN (
    ->     SELECT student_id
    ->     FROM Grades
    ->     WHERE marks_obtained < 40
    -> );
+------------+
| student_id |
+------------+
|        104 |
+------------+
1 row in set (0.016 sec)


ii. 
mysql> SELECT student_id
    -> FROM Grades
    -> WHERE marks_obtained > 90
    -> OR student_id IN (
    ->     SELECT student_id
    ->     FROM Attendance
    ->     WHERE status = 'Present'
    -> );
+------------+
| student_id |
+------------+
|        101 |
|        101 |
|        102 |
|        102 |
|        103 |
|        103 |
|        104 |
|        104 |
|        105 |
|        105 |
|        104 |
+------------+
11 rows in set (0.008 sec)

iii.
mysql> SELECT *
    -> FROM Faculty
    -> WHERE faculty_id NOT IN (
    ->     SELECT faculty_id
    ->     FROM Courses
    -> );
Empty set (0.009 sec)

=======================================================================================

4. Sorting and grouping data

i.

mysql> SELECT *
    -> FROM Students
    -> ORDER BY name ASC;
+------------+--------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
| student_id | name         | dob        | gender | email           | phone_number | address   | admission_date | department_id |
+------------+--------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
|        103 | Amit Shah    | 2003-11-10 | Male   | amit@gmail.com  | 9876543212   | Vadodara  | 2023-07-17     |             1 |
|        105 | Karan Mehta  | 2003-09-14 | Male   | karan@gmail.com | 9876543214   | Ahmedabad | 2023-07-19     |             2 |
|        104 | Neha Desai   | 2004-02-25 | Female | neha@gmail.com  | 9876543213   | Rajkot    | 2023-07-18     |             3 |
|        102 | Priya Patel  | 2004-08-20 | Female | priya@gmail.com | 9876543211   | Surat     | 2023-07-16     |             2 |
|        101 | Rahul Sharma | 2004-05-12 | Male   | rahul@gmail.com | 9876543210   | Ahmedabad | 2023-07-15     |             1 |
|        107 | Riya Shah    | 2004-12-10 | Female | riya@gmail.com  | 9876543216   | Vadodara  | 2023-07-26     |             3 |
+------------+--------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
6 rows in set (0.010 sec)


ii.
mysql> SELECT
    ->     department_id,
    ->     COUNT(*) AS total_students
    -> FROM Students
    -> GROUP BY department_id;
+---------------+----------------+
| department_id | total_students |
+---------------+----------------+
|             1 |              2 |
|             2 |              2 |
|             3 |              2 |
+---------------+----------------+
3 rows in set (0.014 sec)


iii.
mysql> SELECT
    ->     course_id,
    ->     AVG(marks_obtained) AS average_marks
    -> FROM Grades
    -> GROUP BY course_id;
+-----------+---------------+
| course_id | average_marks |
+-----------+---------------+
|       301 |     90.000000 |
|       302 |     75.000000 |
|       303 |     57.333333 |
|       304 |     88.000000 |
|       305 |     85.500000 |
+-----------+---------------+
5 rows in set (0.016 sec)

=======================================================================================

5. Use aggregate function

i.
mysql> SELECT
    ->     student_id,
    ->     AVG(status = 'Present') * 100 AS attendance_percentage
    -> FROM
    ->     Attendance
    -> GROUP BY student_id;
+------------+-----------------------+
| student_id | attendance_percentage |
+------------+-----------------------+
|        101 |               50.0000 |
|        102 |               50.0000 |
|        103 |              100.0000 |
|        104 |               33.3333 |
|        105 |               50.0000 |
+------------+-----------------------+
5 rows in set (0.003 sec)


ii.
Query OK, 0 rows affected (0.002 sec)

mysql> SELECT
    ->     course_id,
    ->     MAX(marks_obtained) AS highest_marks,
    ->     MIN(marks_obtained) AS lowest_marks
    -> FROM Grades
    -> GROUP BY course_id;
+-----------+---------------+--------------+
| course_id | highest_marks | lowest_marks |
+-----------+---------------+--------------+
|       301 |         95.00 |        85.00 |
|       302 |         92.00 |        55.00 |
|       303 |         72.00 |        35.00 |
|       304 |         88.00 |        88.00 |
|       305 |         90.00 |        81.00 |
+-----------+---------------+--------------+
5 rows in set (0.004 sec)

mysql>
Query OK, 0 rows affected (0.002 sec)

iii.
mysql>
mysql> SELECT
    ->     department_id,
    ->     COUNT(*) AS total_students
    -> FROM Students
    -> GROUP BY department_id;
+---------------+----------------+
| department_id | total_students |
+---------------+----------------+
|             1 |              2 |
|             2 |              2 |
|             3 |              2 |
+---------------+----------------+
3 rows in set (0.006 sec)

=======================================================================================

6. Primary key and foreign key establishment

i.
mysql> ALTER TABLE Enrollments
    -> ADD UNIQUE (student_id, course_id);
Query OK, 0 rows affected (0.618 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT *
    -> FROM Enrollments;
+---------------+------------+-----------+-----------------+
| enrollment_id | student_id | course_id | enrollment_date |
+---------------+------------+-----------+-----------------+
|           401 |        101 |       301 | 2023-07-20      |
|           402 |        101 |       302 | 2023-07-21      |
|           403 |        102 |       302 | 2023-07-21      |
|           404 |        102 |       304 | 2023-07-22      |
|           405 |        103 |       301 | 2023-07-22      |
|           406 |        103 |       303 | 2023-07-23      |
|           407 |        104 |       303 | 2023-07-23      |
|           408 |        105 |       302 | 2023-07-24      |
|           409 |        105 |       305 | 2023-07-24      |
|           410 |        104 |       305 | 2023-07-25      |
+---------------+------------+-----------+-----------------+
10 rows in set (0.004 sec)

Query OK, 0 rows affected (0.002 sec)

ii.
mysql> ALTER TABLE Courses
    -> ADD FOREIGN KEY (faculty_id)
    -> REFERENCES Faculty(faculty_id);
Query OK, 7 rows affected (0.491 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT *
    -> FROM Courses;
+-----------+-------------------------+------------+
| course_id | course_name             | faculty_id |
+-----------+-------------------------+------------+
|       301 | Automobile Engineering  |        201 |
|       302 | Database Management     |        202 |
|       303 | Thermodynamics          |        203 |
|       304 | Electrical Machines     |        204 |
|       305 | Structural Engineering  |        205 |
|       306 | Vehicle Dynamics        |        206 |
|       307 | Engineering Mathematics |       NULL |
+-----------+-------------------------+------------+
7 rows in set (0.002 sec)

=======================================================================================

7. Implement joins

i.

mysql> SELECT s.student_id, s.name, s.phone_number, d.department_name
    -> FROM Students AS s
    -> INNER JOIN Departments AS d
    -> ON s.department_id = d.department_id;
+------------+--------------+--------------+------------------------+
| student_id | name         | phone_number | department_name        |
+------------+--------------+--------------+------------------------+
|        101 | Rahul Sharma | 9876543210   | Automobile Engineering |
|        102 | Priya Patel  | 9876543211   | Computer Engineering   |
|        103 | Amit Shah    | 9876543212   | Automobile Engineering |
|        104 | Neha Desai   | 9876543213   | Mechanical Engineering |
|        105 | Karan Mehta  | 9876543214   | Computer Engineering   |
|        107 | Riya Shah    | 9876543216   | Mechanical Engineering |
+------------+--------------+--------------+------------------------+
6 rows in set (0.018 sec)

ii.
mysql> SELECT s.*
    -> FROM Students AS s
    -> LEFT JOIN Enrollments AS e
    -> ON s.student_id = e.student_id
    -> WHERE e.enrollment_id IS NULL;
+------------+-----------+------------+--------+----------------+--------------+----------+----------------+---------------+
| student_id | name      | dob        | gender | email          | phone_number | address  | admission_date | department_id |
+------------+-----------+------------+--------+----------------+--------------+----------+----------------+---------------+
|        107 | Riya Shah | 2004-12-10 | Female | riya@gmail.com | 9876543216   | Vadodara | 2023-07-26     |             3 |
+------------+-----------+------------+--------+----------------+--------------+----------+----------------+---------------+
1 row in set (0.011 sec)


iii.
mysql> SELECT c.*
    -> FROM Faculty f
    -> RIGHT JOIN Courses c
    -> ON f.faculty_id = c.faculty_id
    -> WHERE f.faculty_id IS NULL;
+-----------+-------------------------+------------+
| course_id | course_name             | faculty_id |
+-----------+-------------------------+------------+
|       307 | Engineering Mathematics |       NULL |
+-----------+-------------------------+------------+
1 row in set (0.011 sec)



=======================================================================================

8. use subqueries


i.
mysql> SELECT *
    -> FROM Students
    -> WHERE student_id IN (
    ->     SELECT student_id
    ->     FROM Grades
    ->     WHERE marks_obtained > (
    ->         SELECT AVG(marks_obtained)
    ->         FROM Grades
    ->     )
    -> );
+------------+--------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
| student_id | name         | dob        | gender | email           | phone_number | address   | admission_date | department_id |
+------------+--------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
|        101 | Rahul Sharma | 2004-05-12 | Male   | rahul@gmail.com | 9876543210   | Ahmedabad | 2023-07-15     |             1 |
|        102 | Priya Patel  | 2004-08-20 | Female | priya@gmail.com | 9876543211   | Surat     | 2023-07-16     |             2 |
|        103 | Amit Shah    | 2003-11-10 | Male   | amit@gmail.com  | 9876543212   | Vadodara  | 2023-07-17     |             1 |
|        104 | Neha Desai   | 2004-02-25 | Female | neha@gmail.com  | 9876543213   | Rajkot    | 2023-07-18     |             3 |
|        105 | Karan Mehta  | 2003-09-14 | Male   | karan@gmail.com | 9876543214   | Ahmedabad | 2023-07-19     |             2 |
+------------+--------------+------------+--------+-----------------+--------------+-----------+----------------+---------------+
5 rows in set (0.052 sec)


ii.
mysql> ALTER TABLE Faculty
    -> ADD experience_years INT DEFAULT 0;
Query OK, 0 rows affected (0.106 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE Faculty
    -> SET experience_years = 6
    -> WHERE faculty_id = 201;
Query OK, 1 row affected (0.026 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Faculty
    -> SET experience_years = 3
    -> WHERE faculty_id = 202;
Query OK, 1 row affected (0.021 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> -- becoz theres no experince column in anyy table
Query OK, 0 rows affected (0.001 sec)

mysql> SELECT *
    -> FROM Courses
    -> WHERE faculty_id IN (
    ->     SELECT faculty_id
    ->     FROM Faculty
    ->     WHERE experience_years >= 5
    -> );
+-----------+------------------------+------------+
| course_id | course_name            | faculty_id |
+-----------+------------------------+------------+
|       301 | Automobile Engineering |        201 |
+-----------+------------------------+------------+
1 row in set (0.003 sec)


iii.
mysql> SELECT *
    -> FROM Students
    -> WHERE student_id IN (
    ->     SELECT student_id
    ->     FROM Attendance
    ->     WHERE status = 'Absent'
    ->     GROUP BY student_id
    ->     HAVING COUNT(*) > 10
    -> );
Empty set (0.011 sec)


=======================================================================================

9. implement  date and time function

i.
mysql> SELECT
    ->     attendance_date,
    ->     MONTH(attendance_date) AS attendance_month
    -> FROM Attendance;
+-----------------+------------------+
| attendance_date | attendance_month |
+-----------------+------------------+
| 2023-08-01      |                8 |
| 2023-08-02      |                8 |
| 2023-08-01      |                8 |
| 2023-08-02      |                8 |
| 2023-08-01      |                8 |
| 2023-08-02      |                8 |
| 2023-08-01      |                8 |
| 2023-08-02      |                8 |
| 2023-08-01      |                8 |
| 2023-08-02      |                8 |
| 2023-08-03      |                8 |
+-----------------+------------------+
11 rows in set (0.014 sec)


ii.
mysql> SELECT
    ->     student_id,
    ->     name,
    ->     admission_date,
    ->     TIMESTAMPDIFF(YEAR, admission_date, CURDATE()) AS years_since_admission
    -> FROM Students;
+------------+--------------+----------------+-----------------------+
| student_id | name         | admission_date | years_since_admission |
+------------+--------------+----------------+-----------------------+
|        101 | Rahul Sharma | 2023-07-15     |                     3 |
|        102 | Priya Patel  | 2023-07-16     |                     3 |
|        103 | Amit Shah    | 2023-07-17     |                     3 |
|        104 | Neha Desai   | 2023-07-18     |                     3 |
|        105 | Karan Mehta  | 2023-07-19     |                     3 |
|        107 | Riya Shah    | 2023-07-26     |                     3 |
+------------+--------------+----------------+-----------------------+
6 rows in set (0.003 sec)


iii.
mysql> SELECT
    ->     attendance_id,
    ->     DATE_FORMAT(attendance_date, '%d-%m-%Y') AS formatted_date
    -> FROM Attendance;
+---------------+----------------+
| attendance_id | formatted_date |
+---------------+----------------+
|           501 | 01-08-2023     |
|           502 | 02-08-2023     |
|           503 | 01-08-2023     |
|           504 | 02-08-2023     |
|           505 | 01-08-2023     |
|           506 | 02-08-2023     |
|           507 | 01-08-2023     |
|           508 | 02-08-2023     |
|           509 | 01-08-2023     |
|           510 | 02-08-2023     |
|           511 | 03-08-2023     |
+---------------+----------------+
11 rows in set (0.006 sec)


=======================================================================================

10. use string manipulation function

i.
mysql> SELECT
    ->     faculty_id,
    ->     UPPER(name) AS faculty_name
    -> FROM Faculty;
+------------+--------------+
| faculty_id | faculty_name |
+------------+--------------+
|        201 | DR. MEHTA    |
|        202 | PROF. SHAH   |
|        203 | DR. PATEL    |
|        204 | PROF. JOSHI  |
|        205 | DR. TRIVEDI  |
|        206 | DR. SHAH     |
|        207 | PROF. RAVAL  |
+------------+--------------+
7 rows in set (0.004 sec)


ii.
mysql> SELECT
    ->     student_id,
    ->     TRIM(name) AS student_name
    -> FROM Students;
+------------+--------------+
| student_id | student_name |
+------------+--------------+
|        101 | Rahul Sharma |
|        102 | Priya Patel  |
|        103 | Amit Shah    |
|        104 | Neha Desai   |
|        105 | Karan Mehta  |
|        107 | Riya Shah    |
+------------+--------------+
6 rows in set (0.002 sec)


iii.
mysql> SELECT
    ->     faculty_id,
    ->     name,
    ->     COALESCE(email, 'Email Not Provided') AS email
    -> FROM Faculty;
+------------+-------------+-------------------+
| faculty_id | name        | email             |
+------------+-------------+-------------------+
|        201 | Dr. Mehta   | mehta@gmail.com   |
|        202 | Prof. Shah  | shah@gmail.com    |
|        203 | Dr. Patel   | patel@gmail.com   |
|        204 | Prof. Joshi | joshi@gmail.com   |
|        205 | Dr. Trivedi | trivedi@gmail.com |
|        206 | Dr. Shah    | dr.shah@gmail.com |
|        207 | Prof. Raval | raval@gmail.com   |
+------------+-------------+-------------------+
7 rows in set (0.005 sec)


=======================================================================================

11. Implement window function

i.
mysql> SELECT
    ->     student_id,
    ->     SUM(marks_obtained) AS total_marks,
    ->     RANK() OVER (ORDER BY SUM(marks_obtained) DESC) AS student_rank
    -> FROM Grades
    -> GROUP BY student_id;
+------------+-------------+--------------+
| student_id | total_marks | student_rank |
+------------+-------------+--------------+
|        104 |      181.00 |            1 |
|        101 |      177.00 |            2 |
|        103 |      167.00 |            3 |
|        102 |      166.00 |            4 |
|        105 |      145.00 |            5 |
+------------+-------------+--------------+
5 rows in set (0.008 sec)


ii.
mysql> SELECT
    ->     course_id,
    ->     attendance_date,
    ->     SUM(status = 'Present') OVER (
    ->         PARTITION BY course_id ORDER BY attendance_date
    ->     ) * 100.0 /
    ->     COUNT(*) OVER (
    ->         PARTITION BY course_id ORDER BY attendance_date
    ->     ) AS attendance_percentage
    -> FROM Attendance;
+-----------+-----------------+-----------------------+
| course_id | attendance_date | attendance_percentage |
+-----------+-----------------+-----------------------+
|       301 | 2023-08-01      |             100.00000 |
|       301 | 2023-08-01      |             100.00000 |
|       301 | 2023-08-02      |              75.00000 |
|       301 | 2023-08-02      |              75.00000 |
|       302 | 2023-08-01      |              50.00000 |
|       302 | 2023-08-01      |              50.00000 |
|       302 | 2023-08-02      |              50.00000 |
|       302 | 2023-08-02      |              50.00000 |
|       303 | 2023-08-01      |               0.00000 |
|       303 | 2023-08-02      |              50.00000 |
|       303 | 2023-08-03      |              33.33333 |
+-----------+-----------------+-----------------------+
11 rows in set (0.009 sec)


=======================================================================================

12. use sql case expression

i.
mysql> SELECT
    ->     student_id,
    ->     marks_obtained,
    ->     CASE
    ->         WHEN marks_obtained > 90 THEN 'Excellent'
    ->         WHEN marks_obtained BETWEEN 75 AND 90 THEN 'Good'
    ->         ELSE 'Needs Improvement'
    ->     END AS performance_level
    -> FROM Grades;
+------------+----------------+-------------------+
| student_id | marks_obtained | performance_level |
+------------+----------------+-------------------+
|        101 |          85.00 | Good              |
|        101 |          92.00 | Excellent         |
|        102 |          78.00 | Good              |
|        102 |          88.00 | Good              |
|        103 |          95.00 | Excellent         |
|        103 |          72.00 | Needs Improvement |
|        104 |          65.00 | Needs Improvement |
|        104 |          81.00 | Good              |
|        105 |          55.00 | Needs Improvement |
|        105 |          90.00 | Good              |
|        104 |          35.00 | Needs Improvement |
+------------+----------------+-------------------+
11 rows in set (0.004 sec)



ii.
mysql> SELECT
    ->     student_id,
    ->     course_id,
    ->     attendance_date,
    ->     CASE
    ->         WHEN status = 'Present' THEN 'Regular'
    ->         WHEN status = 'Late' THEN 'Irregular'
    ->         ELSE 'Defaulter'
    ->     END AS attendance_category
    -> FROM Attendance;
+------------+-----------+-----------------+---------------------+
| student_id | course_id | attendance_date | attendance_category |
+------------+-----------+-----------------+---------------------+
|        101 |       301 | 2023-08-01      | Regular             |
|        101 |       301 | 2023-08-02      | Defaulter           |
|        102 |       302 | 2023-08-01      | Regular             |
|        102 |       302 | 2023-08-02      | Irregular           |
|        103 |       301 | 2023-08-01      | Regular             |
|        103 |       301 | 2023-08-02      | Regular             |
|        104 |       303 | 2023-08-01      | Defaulter           |
|        104 |       303 | 2023-08-02      | Regular             |
|        105 |       302 | 2023-08-01      | Irregular           |
|        105 |       302 | 2023-08-02      | Regular             |
|        104 |       303 | 2023-08-03      | Defaulter           |
+------------+-----------+-----------------+---------------------+
11 rows in set (0.006 sec)







