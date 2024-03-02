CREATE DATABASE ANAND;
USE ANAND;
CREATE TABLE salesman (
    salesman_id int PRIMARY KEY,
    name varchar(50),
    city varchar(50),
    commission DOUBLE
);
INSERT INTO salesman (salesman_id,name,city,commission) VALUES (5001,"James Hoog","New York", 0.15);
INSERT INTO salesman VALUES (5002,"Nail Knite","Paris", 0.13),(5005,"Pit Alex","London", 0.11),(5006,"MC Lyon","Paris", 0.14),(5003,"Lauson Hen",null, 0.12),(5007,"Paul Adam","Rome", 0.13);
UPDATE salesman SET city = "San Jose" WHERE salesman_id = 5003;
SELECT * FROM salesman;
CREATE TABLE customer (
    customer_id int PRIMARY KEY,
    customer_name varchar(50),
    city varchar(50),
    grade int,
    salesman_id INT REFERENCES salesman(salesman_id)
);
INSERT INTO customer (customer_id,customer_name,city,grade,salesman_id) 
VALUES (3002,"Nick Romando","New York",100,5001);
INSERT INTO customer VALUES 
(3005,"Graham Zusi","California",200,5002),
(3001,"Brad Guzan","London",null,null),
(3004,"Fabian Johns","Paris",300,5006),
(3007,"Brad Davis","New York",200,5001),
(3009,"Geoff Camero","Berlin",100,null),
(3008,"Julian Green","London",300,5002),
(3003,"Jozy Altidor","Moncow",200,5007);
UPDATE customer SET salesman_id = 5003 WHERE customer_id = 3009;
UPDATE customer SET salesman_id = 5005 WHERE customer_id = 3001;
UPDATE customer SET customer_name = "Fabian Johnson" WHERE customer_id = 3004;
UPDATE customer SET customer_name = "Geoff Cameron" WHERE customer_id = 3009;
UPDATE customer SET city = "Moscow" WHERE customer_id = 3003;
select * FROM CUSTOMER;
CREATE TABLE `ORDER` (
    ORDER_NO INT PRIMARY KEY,
    PURCH_AMT INT,
    ORDER_DATE DATE,
    customer_id INT REFERENCES customer(customer_id),
    salesman_id INT REFERENCES salesman(salesman_id)
);
ALTER TABLE `ORDER` MODIFY COLUMN PURCH_AMT DOUBLE;
INSERT INTO `ORDER` (ORDER_NO, PURCH_AMT, ORDER_DATE, customer_id, salesman_id)
VALUES (70001, 150.5, '2016-10-05', 3005, 5002);
INSERT INTO `ORDER` VALUES (70009, 270.65, '2016-09-10', 3001, NULL),
(70002, 65.26, '2016-10-05', 3002, 5001),
(70004, 110.5, '2016-08-17', 3009, NULL),
(70007, 948.5, '2016-09-10', 3005, 5002),
(70005, 2400.6, '2016-07-27', 3007, 5001),
(70008, 5760.00, '2016-09-10', 3002, 5001),
(70010, 1983.43, '2016-10-10', 3004, 5006),
(70003, 2480.4, '2016-10-10', 3009, NULL),
(70012, 250.45, '2016-06-27', 3008, 5002),
(70011, 75.29, '2016-08-17', 3003, 5007);
SELECT * FROM `ORDER`;
-- Query 1 Display name and commission of all the salesmen?
SELECT NAME,COMMISSION FROM salesman;
UPDATE `ORDER` SET salesman_id = 5005 WHERE ORDER_NO = 70009;
UPDATE `ORDER` SET salesman_id = 5003 WHERE ORDER_NO = 70004;
UPDATE `ORDER` SET salesman_id = 5003 WHERE ORDER_NO = 70003;
-- Query 2 Retrieve salesman id of all salesmen from orders table without any repeats?
SELECT distinct salesman_ID FROM `ORDER` ;
-- Query 3 Display names and city of salesman, who belongs to the city of Paris?
SELECT NAME,CITY FROM salesman WHERE CITY = "PARIS";
-- Query 4 Display all the information for those customers with a grade of 200?
select * FROM CUSTOMER WHERE GRADE = 200;
INSERT INTO `ORDER` VALUES (70013, 3045.60, '2016-04-25', 3002, 5001);
-- Query 5 Display the order number, order date and the purchase amount for order(s) which will be delivered by the salesman with ID 5001.?
SELECT ORDER_NO,ORDER_DATE,PURCH_AMT FROM `ORDER` WHERE salesman_id = 5001;
-- Nobel win table
CREATE TABLE nobel_win (
    year INT,
    subject VARCHAR(50),
    winner VARCHAR(50),
    country VARCHAR(50),
    category VARCHAR(20)
);
INSERT INTO nobel_win (YEAR, SUBJECT, winner, country, category) VALUES (1970,"Physics","Hannes Alfven","Sweden","Scientist");
INSERT INTO nobel_win VALUES (1970,"Physics","Louis Neel","France","Scientist"),
(1970,"Chemistry","Luis Federico Leloir","France","Scientist"),
(1970,"Physiology","Ulf von Euler","Sweden","Scientist"),
(1970,"Physiology","Bernard Katz","Germany","Scientist"),
(1970,"Literature","Aleksandr Solzhenitsyn","Russia","Linguist"),
(1970,"Economics","Paul Samuelson","USA","Economist"),
(1970,"Physiology","Julius Axelrod","USA","Scientist"),
(1971,"Physics","Dennis Gabor","Hungary","Scientist"),
(1971,"Chemistry","Gerhard Herzberg","Germany","Scientist"),
(1971,"Peace","Willy Brandt", "Germany ", "Chancellor"),
(1971,"Literature","Pablo Neruda","Chile","Linguist"),
(1971,"Economics","Simon Kuznets","Russia","Economist"),
(1978,"Peace","Anwar al-Sadat","Egypt","President"),
(1978,"Peace","Menachem Begin","Israel","Prime Minister"),
(1987,"Chemistry","Donald J. Cram","USA","Scientist"),
(1987,"Chemistry","Jean-Marie Lehn","France","Scientist"),
(1987,"Physiology","Susumu Tonegawa","Japan","Scientist"),
(1994 ,"Economics","Reinhard Selten","Germany","Economist"),
(1994,"Peace","Yitzhak Rabin","Israel", "Prime Minister"),
(1987,"Physics","Johannes Georg Bednorz","Germany","Scientist"),
(1987,"Literature","Joseph Brodsky","Russia","Linguist"),
(1987,"Economics","Robert Solow","USA", "Economist"),
(1994,"Literature","Kenzaburo Oe","Japan","Linguist");
SELECT * FROM NOBEL_WIN;
-- Query 6 Show the winner of the 1971 prize for Literature?
SELECT winner FROM nobel_win WHERE year = 1971 AND subject = 'Literature';
-- Query 7 Show all the details of the winners with first name Louis?
SELECT * FROM nobel_win WHERE winner LIKE 'Louis%';
-- Query 8 Show all the winners in Physics for 1970 together with the winner of Economics for 1971.?
SELECT * FROM nobel_win WHERE (subject = 'Physics' AND year = 1970) UNION
(SELECT * FROM nobel_win WHERE (subject = 'Economics' AND year = 1971));
-- Query 9 Show all the winners of Nobel prize in the year 1970 except the subject Physiology and Economics.?
SELECT * FROM nobel_win WHERE year = 1970 AND subject NOT IN ('Physiology','Economics');
/* Query 10 Find all the details of the Nobel winners for the subject 
not started with the letter 'P' and arranged the list as the most 
recent comes first, then by name in order? */
SELECT * FROM nobel_win WHERE subject NOT LIKE 'P%' ORDER BY year DESC, winner;
CREATE TABLE item_mast (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(255),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM VARCHAR(255)
);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM)
VALUES
(101, 'Mother Board', 3200.00, 15),
(102, 'Key Board', 450.00, 16),
(103, 'ZIP drive', 250.00, 14),
(104, 'Speaker', 550.00, 16),
(105, 'Monitor', 5000.00, 11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer', 2600.00, 13),
(109, 'Refill cartridge', 350.00, 13),
(110, 'Mouse', 250.00, 12);
SELECT * FROM item_mast;
-- Query 11 Find the name and price of the cheapest item(s)?
SELECT pro_name, pro_price FROM item_mast WHERE pro_price = 
(SELECT MIN(pro_price) FROM item_mast);
-- Query 12 Display all the customers, who are either belongs to the city New York or not had a grade above 100?
SELECT * FROM customer WHERE city = 'New York' OR NOT grade > 100;
-- Query 13 From the following table, write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 (begin and end values are included). Return salesman_id, name, city, and commission?
SELECT * FROM salesman WHERE commission BETWEEN 0.12 AND 0.14;
-- Query 14 Find all those customers with all information whose names are ending with the letter 'n'?
SELECT * FROM customer WHERE customer_name LIKE '%n';
/* Query 15 Find those salesmen with all information whose name containing the 1st character is 'N' and the 4th
character is 'l' and rests may be any character? */
SELECT * FROM salesman WHERE name LIKE "N__l%";
/* Query 16 Find that customer with all information who does not get any grade except NULL? */
SELECT * FROM customer WHERE grade IS NULL;
/* Query 17 Find the total purchase amount of all orders? */
SELECT SUM(purch_amt) FROM `ORDER`;
/* Query 18 Find the number of salesman currently listing for all of their customers? */
SELECT COUNT(DISTINCT salesman_id) FROM `ORDER`;
/* Query 19 Find the highest grade for each of the cities of the customers?*/
SELECT city, MAX(grade) FROM customer GROUP BY city;
/* Query 20 Find the highest purchase amount ordered by the each customer
with their ID and highest purchase amount.?*/
SELECT customer_id, MAX(purch_amt) FROM `ORDER` GROUP BY customer_id;
/* Query 21 Find the highest purchase amount ordered by the each
customer on a particular date with their ID, order date
and highest purchase amount?*/
SELECT customer_id, ORDER_DATE, MAX(purch_amt) FROM `ORDER` GROUP BY customer_id, ORDER_DATE;
/* Query 22 Find the highest purchase amount on a date '2012-08-17'
for each salesman with their ID.?*/
SELECT salesman_id, MAX(purch_amt) FROM `ORDER` WHERE ORDER_DATE = '2016-08-17' GROUP BY salesman_id;
/* Query 23 Find the highest purchase amount with their customer ID
and order date, for only those customers who have the 
highest purchase amount in a day is more than 2000? */
SELECT customer_id, ORDER_DATE, MAX(purch_amt) FROM `ORDER` GROUP BY customer_id, ORDER_DATE HAVING MAX(purch_amt) > 2000.00;
/* Query 24 Write a SQL statement that counts all orders for a
date August 17th, 2012.? */
SELECT COUNT(*) FROM `ORDER` WHERE ORDER_DATE = '2016-08-17';