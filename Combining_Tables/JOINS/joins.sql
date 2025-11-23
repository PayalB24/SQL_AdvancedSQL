/* JOINS : 
	let's sa we have talbe A and table B, now the question is how to 
	combine these two tables??
	do we need to combine rows or columns??
	if we want to join columns = means joining the table
		columns and rows of A and columns and rows of B
		joines have 4 types :
			Inner Join, full join left join , right join

		TO join the table we need to definee the key columns between the tables

	for rows = set operations
		set operation types are :
			UNION, UNION ALL, EXCEPT, INTERSECT
		TO join the table we need to definee the same number of columns between the tables

	WHat is SQL join :
		explained in excel

	When to use SQL JOINS :
		1. TO Recombine your data :
			eg. we have customemrs data having different tables, like 
			customers, orders, reviews, address etc..
			when you want the whole data of customeers in one result

		2. Data Enrichment : "Getting Extra Data"
			can get extra info from another table, etc customer takes zip code from address table 

		3. Check for Existence " Filtering "

TYpes of jOins :
1. No join : TO get all the data from both the tables
	Means no joining  / no need to combine them

	SELECT * FROM A;
	SELECT * FROM B;

	*/

use Practice

create table orders(
order_id int NOT NULL,
customer_id int NOT NULL,
order_date date,
sales int 
)

insert into orders values(1001, 1, '2021-01-11', 35)
insert into orders values(1002, 2, '2021-04-05', 15)
insert into orders values(1003, 3, '2021-06-18', 20)
insert into orders values(1004, 6, '2021-08-31', 10)

--Task : Retrieve all data from customers and orders as separate results --
use Practice

SELECT *
FROM customers

SELECT *
FROM orders

-- INNER JOIN : Returns only matching rows from both tables--
--onle the data of B (right side table ) that has match with the table A (left side table)--
--default tye is INNER JOIN
-- we can use INNER JOIN either to combine the data from multiple tables or  to filter the data--
/*
SELECT * FROM A [TYPE] JOIN B  ON <condition>
 : Condition is besically : How to match the data eg. A.key = B.key

 *** The order of the table doesn't matter in INNER JOIN ***
 we can write it as form A join B orr from B join A
*/
-- TIP : Always use type -- 

--Task : Get all customers along with their orders, but only for customers who have placed an order --
SELECT *
FROM customers as c
JOIN orders as o
ON c.id = o.customer_id

--WIthout using ON - bad practice (DOesn't work in sql server) 
/*SELECT * FROM
customers INNER JOIN orders
*/

-- best practice : select only necessary columns--

SELECT 
id,
first_name,
order_id,
sales
FROM customers as c
JOIN orders as o
ON c.id = o.customer_id

--Column Ambiguity : Add the table name before the column to avoid confusion in joins with same-named columns

SELECT 
c.id,
c.first_name,
o.order_id,
o.sales
FROM customers as c
JOIN orders as o
ON c.id = o.customer_id
	

--Left JOIN :
/*
Returns all rows from lelft table and only matching rows from the right table
left table is primary source of data we cannot miss anything it is very important data, 
whereas the right table is secondary source of data, and we are joining it only to get an additional data. 

SELECT * FROM A LEFT JOIN B ON A.key = B.key

order is very imp here, left tablel with FROM clause
*/
--Task : Get all customers along with their orders, including those withour orders--
SELECT c.id, c.first_name, o.order_id, o.sales 
FROM customers AS c 
LEFT JOIN orders AS o 
ON c.id = o.customer_id
	
--Right JOin - exactly opposite to left join
/* 
Returns All rows from right table and only matching rows from left table
Main talbe is Right table it is primary table
lest table is secondary  
*/

--Left JOIN is very famous and mostly preferred join, so use Left JOIN only just change the order (so it will act as right join)

--Task : Get all customers along with their orders, including orders without matching customers
SELECT c.id, c.first_name, o.order_id, o.sales 
FROM customers AS c 
RIGHT JOIN orders AS o 
ON c.id = o.customer_id

/*
FULL JOIN : Returns All Rows from Both Table
order of table not important
SELECT * FROM A FULL JOIN B ON <condition>
*/

--task : Get all customers and all orders, even if there's no match
SELECT * FROM customers FULL JOIN orders ON customer_id = id