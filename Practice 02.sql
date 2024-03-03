USE ANAND;
/*  Query 1 Find the name and city of those customers
and salesmen who lives in the same city. ?*/
SELECT customer.customer_name, salesman.name, salesman.city
FROM salesman, customer
WHERE salesman.city = customer.city;
/*  Query 2 Find the names of all customers along
with the salesmen who works for them. ?*/
SELECT customer.customer_name, salesman.name
FROM customer, salesman
WHERE salesman.salesman_id = customer.salesman_id;
/*  Query 3 Display all those orders by the customers not located
in the same cities where their salesmen live?*/
SELECT ORDER_NO, customer_name, `ORDER`.customer_id, `ORDER`.salesman_id
FROM salesman, customer, `ORDER`
WHERE customer.city <> salesman.city
AND `ORDER`.customer_id = customer.customer_id
AND `ORDER`.salesman_id = salesman.salesman_id;
/*  Query 4 Display all the orders issued by the salesman 'Paul
Adam' from the orders table.?*/
SELECT * FROM `ORDER` WHERE salesman_id =
(SELECT salesman_id FROM salesman WHERE name = 'Paul Adam');
/*  Query 5 Display all the orders which values are greater than
the average order value for 10th October 2016?*/
SELECT * FROM `ORDER` WHERE purch_amt >
    (SELECT AVG(purch_amt) 
     FROM `ORDER` 
     WHERE ORDER_DATE = '2016-10-10');
/*  Query 6 Find all orders attributed to salesmen in Paris? */
SELECT * FROM `ORDER` WHERE salesman_id IN
(SELECT salesman_id FROM salesman WHERE city ='Paris');
/*  Query 7 Extract the data from the orders table for the
salesman who earned the maximum commission. ? */
SELECT ORDER_NO,PURCH_AMT, ORDER_DATE, salesman_id FROM `ORDER` WHERE salesman_id IN 
( SELECT salesman_id FROM salesman WHERE commission = ( SELECT MAX(commission) FROM salesman));
/*  Query 8  Find the name and ids of all salesmen who
had more than one customer? */
SELECT salesman_id, name FROM salesman a 
WHERE 1 < (SELECT COUNT(*) FROM customer WHERE salesman_id = a.salesman_id);
/*  Query 9 (using subquery) Write a query to find all the salesmen who
worked for only one customer? */
SELECT *  FROM salesman WHERE salesman_id IN 
(SELECT DISTINCT salesman_id FROM customer a WHERE NOT EXISTS 
(SELECT * FROM customer b WHERE a.salesman_id = b.salesman_id AND a.customer_name <> b.customer_name));
/*  Query 9 (Equivalent Queries) Write a query to find all the salesmen who
worked for only one customer? */
SELECT c.salesman_id, s.name, s.city, s.commission
FROM salesman s, customer c
where s.salesman_id = c.salesman_id
group by c.salesman_id, s.name
Having count(c.salesman_id) = 1;
/*  Query 10 (using subquery) Display all the orders that had amounts that were greater than at
least one of the orders from September 10th 2016? */
SELECT * FROM `ORDER` WHERE PURCH_AMT > ANY
(SELECT PURCH_AMT FROM `ORDER` WHERE  ORDER_DATE='2016/09/10');
/*  Query 11 (using subquery) display only those customers whose grade are, in
fact, higher than every customer in New York? */
SELECT * FROM customer WHERE grade > ALL
(SELECT grade FROM customer WHERE city='New York');
