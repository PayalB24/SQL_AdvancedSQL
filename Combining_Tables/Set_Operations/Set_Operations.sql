/*
What are SET Operators??
Set operators in SQL combines the results of multiple queries into a single result set.

#SYntax and RUles :
Phone
 RUle 1: Set operator can be used almost in all clauses
	- where, join, group by, haviing
	-ORDERS BY is allowed only once at the end of the query

Rule 2 :  The number of columns in each query must be the same

*/
use Practice

EXEC sp_rename 'customers.first_name', 'customers.FirstName', 'COLUMN'

SELECT *FROM customers

EXEC sp_rename 'Customers.[customers.FirstName]', 'FirstName', 'COLUMN';

ALTER TABLE Customers
ADD LastName VARCHAR(50);

UPDATE Employees
SET LastName = 'Borde'
WHERE FirstName = 'Payal'



select * from Customers
SELECT * from Employees
--Let's Perform the UNION
SELECT FirstName, LastName FROM customers
UNION 
SELECT FirstName, LastName FROM Employees

SELECT FirstName, LastName FROM customers
UNION ALL
SELECT FirstName, LastName FROM Employees

--Task : Find the emplyees who are not customers at the same time
SELECT FirstName, LastName FROM Employees
EXCEPT
SELECT FirstName, LastName FROM customers

--Task : find the emplyees who are also customers
SELECT FirstName, LastName FROM customers
INTERSECT
SELECT FirstName, LastName FROM Employees