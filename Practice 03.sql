USE ANAND;
CREATE TABLE emp (
    eno INT PRIMARY KEY,
    ename VARCHAR(255),
    bdate DATE,
    title VARCHAR(255),
    salary DECIMAL(10, 2),
    Dno VARCHAR(255)
);
INSERT INTO emp VALUES (101, 'Anand Soni', '2001-08-11', 'SA', 100000.00, "d1"),
(102, 'Aryan Jain', '2002-05-15', 'EE', 40000.00, "D2"),
(103, 'Amit Jain', '2002-06-10', 'SA', 35000.00, "D1"),
(104, 'Arjun Rawate', '2001-07-09', 'SA', 45000.00, "D3"),
(105, 'Anuj Argwal', '2002-03-06', 'Developer', 50000.00, "D3"),
(106, 'Aman Gupta', '2001-12-18', 'CA', 70000.00, "D1"),
(107, 'Anupum Mittal', '2001-08-23', 'EE', 45000.00, "D2"),
(108, 'John Doe', '1990-01-15', 'Manager', 50000,"D3"),
(109, 'Jane Smith', '1988-05-22', 'Developer', 45000,"D1");
UPDATE EMP SET Dno = "D1" WHERE eno = 101;
SELECT * FROM emp;
CREATE TABLE proj (
    pno INT PRIMARY KEY,
    pname VARCHAR(255),
    budget DECIMAL(10, 2),
    Dno VARCHAR(255)
);
INSERT INTO proj VALUES (1001, 'Proj-Facebook', 120000.00, "D1"),
(1002, 'Proj-Meta', 100000.00, "D2"),
(1003, 'Proj-Crypto', 80000.00, "D3"),
(1004, 'Proj-BlockChain', 6500.00, "D1"),
(1005, 'Proj-Kargil', 200000.00, "D2");
INSERT INTO proj VALUES (1006, 'Proj-X', 45000.00, "D3");
SELECT * FROM PROJ;
CREATE TABLE dept (
    Dno VARCHAR(255),
    dname VARCHAR(255),
    mgreno INT
);
INSERT INTO dept VALUES ("D1", 'Technical', 101),
("D2", 'Consulting', 103),
("D3", 'Marketing', 108),
("D4", 'Finance', 107);
SELECT * FROM DEPT;
CREATE TABLE workson (
    eno INT,
    pno INT,
    resp VARCHAR(255),
    hours INT,
    PRIMARY KEY (eno, pno),
    FOREIGN KEY (eno) REFERENCES emp(eno),
    FOREIGN KEY (pno) REFERENCES proj(pno)
);
INSERT INTO workson VALUES (101, 1001, 'Manager', 9),
(102, 1002, 'Developer', 8),
(103, 1003, 'Assistant', 10),
(104, 1004, 'Senior Developer', 6),
(105, 1003, 'Tester', 15),
(107, 1005, 'Manager',8);
SELECT * FROM WORKSON;
/* Query 1) Write an SQL query that returns the project number and name for projects with a
budget greater than $100,000.*/
SELECT pno, pname FROM proj WHERE budget > 100000;
/* Query 2) Write an SQL query that returns all works on records where hours worked is less than
10 and the responsibility is 'Manager'?*/
SELECT * FROM workson WHERE hours < 10 AND resp = 'Manager';
/* Query 3)Write an SQL query that returns the employees (number and name only) who have a
title of 'EE' or 'SA' and make more than $35,000? */
SELECT eno, ename FROM emp WHERE (title = 'EE' OR title = 'SA') AND salary > 35000;
/* Query 4)Write an SQL query that returns the employees (name only) in department 'D1'
ordered by decreasing salary? */
SELECT ename FROM emp WHERE dno = 'D1' ORDER BY salary DESC;
/* Query 5) Write an SQL query that returns the departments (all fields) ordered by ascending
department name? */
SELECT * FROM dept ORDER BY dname ASC;
/* Query 6) Write an SQL query that returns the employee name, department name, and employee
title? */
SELECT ename, dname, title FROM emp, dept WHERE emp.dno = dept.dno;
/* Query 7) Write an SQL query that returns the project name, hours worked, and project number
for all works on records where hours > 10? */
SELECT pname, hours, proj.pno FROM workson, proj 
WHERE hours > 10 AND proj.pno = workson.pno;
/* Query 8) Write an SQL query that returns the project name, department name, and budget for
all projects with a budget < $50,000? */
SELECT pname, dname, budget FROM proj, dept
WHERE budget < 50000 AND proj.dno = dept.dno;
/* Query 9) Write an SQL query that returns the employee numbers and salaries of all employees
in the 'Consulting' department ordered by descending salary? */
SELECT emp.eno, emp.salary FROM emp
JOIN dept ON emp.dno = dept.dno
WHERE dept.dname = 'Consulting'
ORDER BY emp.salary DESC;
/* Query 10) Write an SQL query that returns the employee name, project name, employee title,
and hours for all works on records? */
SELECT ename, pname, title,hours
FROM emp, proj, workson
WHERE emp.eno = workson.eno and proj.pno = workson.pno;