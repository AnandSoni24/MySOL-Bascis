USE ANAND;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    birthdate DATE,
    address VARCHAR(100),
    department VARCHAR(50),
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);
INSERT INTO employees VALUES
(101, 'Smith John', '1990-05-15', '123 Main St, City', 'Research', 2001),
(102, 'Jane Doe', '1985-08-20', '456 Oak St, Town', 'Sales',2002),
(103, 'Bob Johnson', '1992-02-10', '789 Pine St, Village', 'Research',2001),
(104, 'Alice Brown', '1988-11-25', '101 Cedar St, Hamlet', 'IT',2003),
(1055, 'Chris Taylor', '1995-07-03', '202 Elm St, Borough', 'Research',2001);
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50)
);
INSERT INTO projects VALUES
(2001, 'Sora-AI'),
(2002, 'Proj-X'),
(2003, 'GPT');
CREATE TABLE Salesmen (
    SSN INT PRIMARY KEY,
    salesman_name VARCHAR(50) 
);
CREATE TABLE SalesTrips (
    trip_id INT PRIMARY KEY,
    SSN INT,
    destination VARCHAR(50),
    trip_date DATE,
    FOREIGN KEY (SSN) REFERENCES Salesmen(SSN)
);
INSERT INTO Salesmen (SSN, salesman_name) VALUES
(101, 'John Doe'),
(102, 'Alice Smith'),
(103, 'Bob Johnson'),
(104, 'Eva Davis'),
(105, 'Charlie Brown');
SELECT * FROM Salesmen;
INSERT INTO SalesTrips (trip_id, SSN, destination, trip_date) VALUES
(1, 101, 'Delhi', '2024-03-01'),
(2, 101, 'Delhi', '2024-03-02'),
(3, 103, 'Mumbai', '2024-03-03'),
(4, 105, 'Delhi', '2024-03-04'),
(5, 104, 'Chennai', '2024-03-05');
SELECT * FROM SalesTrips;
/* Q1. Retrieve the names and address of all employees who work for the research department? */ 
SELECT name, address FROM employees WHERE department = 'Research';
/* Q2.List the birthdate and the address of the employees whose name is Smith? */ 
SELECT birthdate, address FROM employees WHERE name LIKE 'Smith%';
/* Q3.Print the SSN and the name of the salesman who made trip to Delhi */
SELECT S.SSN, S.salesman_name
FROM Salesmen S
JOIN SalesTrips ST ON S.SSN = ST.SSN
WHERE ST.destination = 'Delhi';