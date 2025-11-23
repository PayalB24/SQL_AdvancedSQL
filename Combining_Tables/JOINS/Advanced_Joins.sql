--#Advanced SQL JOINS
--Left anti join
--Returns Rows from left that has NO Match in right
--SELECT * FROM A LEFT JOIN B ON A.key = B.key WHERE B.key IS NULL
USE Practice

--Task :  Get all customers who haven't place any order

SELECT *FROM 
customers
/*
1	Payal	India	98
2	Vaishnavi	USA	65
3	Shubhangi	canada	48
4	Sonali	Dubai	84
5	Anjali	India	0
*/

SELECT * FROM orders
/*
1001	1	2021-01-11	35
1002	2	2021-04-05	15
1003	3	2021-06-18	20
1004	6	2021-08-31	10
*/

SELECT * FROM 
customers AS c LEFT JOIN 
orders AS o
ON c.id = o.customer_id
/*
1	Payal	India	98	1001	1	2021-01-11	35
2	Vaishnavi	USA	65	1002	2	2021-04-05	15
3	Shubhangi	canada	48	1003	3	2021-06-18	20
4	Sonali	Dubai	84	NULL	NULL	NULL	NULL
5	Anjali	India	0	NULL	NULL	NULL	NULL
*/


SELECT * FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id 
WHERE orders.customer_id IS NULL
/*
4	Sonali	Dubai	84	NULL	NULL	NULL	NULL
5	Anjali	India	0	NULL	NULL	NULL	NULL
*/
-- Means these customers are in the recorde bt haven't ordered anything

--RIGHT ANTI JOIN : Exact opposite to the left anti join
--Returns Rows from right that has NO Match in left

SELECT * FROM 
customers AS c RIGHT JOIN 
orders AS o
ON c.id = o.customer_id

--GEt the order who don't have any customer. or for which the customer is deleted

SELECT * FROM 
customers AS c RIGHT JOIN
orders AS o
ON c.id = o.customer_id 
WHERE c.id IS NULL

--NULL	NULL	NULL	NULL	1004	6	2021-08-31	10

--Task; DO the same without using the Right anti join bt the result should be th same
SELECT * FROM 
orders AS o LEFT JOIN
customers AS c
ON c.id = o.customer_id 
WHERE c.id IS NULL

--Full Anti Join : Returns only rows that don't match in either tables
SELECT * FROM
customers AS c FULL JOIN 
orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL OR o.customer_id IS NULL

/*
Challeng : Get all customers along with their orders, but only for customers who have placed an order 
bt bt bt Without using Inner join*/
SELECT * FROM
customers AS c FULL JOIN 
orders AS o
ON c.id = o.customer_id
WHERE c.id IS NOT NULL AND o.customer_id IS NOT NULL

--Using INNER JOIN
SELECT * FROM
customers AS c INNER JOIN 
orders AS o
ON c.id = o.customer_id

/* CROSS JOIN : Combines every row from the left with every row from right
All possible combinations - cartersian join
*/

-- Generate all possible combintnations of customers and orders

SELECT *FROM 
customers CROSS JOIN 
orders