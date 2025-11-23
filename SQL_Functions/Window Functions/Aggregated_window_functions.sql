/*WINDOW AGGREGATE FUNCTIONS
1. Aggregate Functions : AVG() OVER()
2. Count(*) : count the number of items
			Count all the rows in a table regardless of whether any value is NULL
			bt, in some scenarios we should be ignoring the NULLs
			*****use COUNT(col_name) instead...
			COUNT(1) works same as COUNT(*)
*/
--Task : Findd the total number of orders
USE Practice
SELECT * FROM Sales

SELECT COUNT(*) FROM Sales

--Task : Findd the total number of orders
--Additiionally provide details such as ID and details
SELECT SaleID, SaleDate,
COUNT(*)  OVER()
FROM Sales
--Task : Findd the total number of orders for each product
--Additiionally provide details such as ID and details
SELECT SaleID, SaleDate,Product,
COUNT(*)  OVER(PARTITION BY Product)
FROM Sales

--2. SUM() : Returns the sum of values within a window
SELECT SaleID, SaleDate,Product,
SUM(Amount) OVER(),
SUM(Amount) OVER(PARTITION BY Product) sum_of_Product
FROM Sales

--Comparison
--Task : Find the percentage contribution of each product's sales to the total sales
SELECT SaleID, SaleDate, Amount,
SUM(Amount) OVER() total_sale,
ROUND((CAST(Amount AS Float) / SUM(Amount) OVER()) * 100,2 ) total_percentage
FROM Sales

--3. AVG()
--Task : Find the average sales across all orders
--And find the average sales for each product
--Additionally provide details such order id, order date
SELECT 
	SaleID, 
	SaleDate, 
	Amount,
	AVG(CAST(Amount AS Int)) OVER() avg_amount,
	AVG(Amount) OVER(PARTITION BY Product) avg_amount_by_product 
FROM Sales

--Min()/Max()
/* Find the highest and lowest sales across all orders 
and the Highest and lowest sales for each product
Additionally, provide details such as order ID and order Date
*/
SELECT 
SaleID, 
SaleDate,
Product,
Amount, 
MIN(Amount) OVER() lowest_sales,
MIN(Amount) OVER(PARTITION BY Product) lowest_sales_by_Product,
MAX(Amount) OVER() highest_sales,
MAX(Amount) OVER(PARTITION BY Product) highest_sales_by_Product
FROM Sales

--Task : Show the Employees with Highest Salaries
select * From Employees

SELECT 
	FirstName, 
	LastName, 
	Salary 
FROM(SELECT 
	FirstName, 
	LastName, 
	Salary,
	MAX(Salary) OVER() HighestSalary
FROM Employees
) t WHERE Salary = HighestSalary

--Task : Calculate the deviation of each sale from both the minimum and maximunm 
--sales amount

SELECT 
SaleID, 
SaleDate,
Product,
Amount, 
MIN(Amount) OVER() lowest_sales,
MAX(Amount) OVER() highest_sales,
Amount - MIN(Amount) OVER() Deviation
FROM Sales

/*
RUNNING TOTAL :
Aggregate all values from the beginning up to the current point without dropping
off older data

SUM(Sales) OVER(ORDER BY month)
*/
