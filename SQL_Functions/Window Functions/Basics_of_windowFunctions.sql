USE Practice

--WINDOW FUNCTIONS
--TASK : Find total sales Across all orders
select * from Sales

SELECT SUM(Amount) TOtal_sales FROM Sales

--TASK : find total sales for each product
SELECT Product, SUM(Amount) TOtal_sales FROM Sales
GROUP BY Product

--TASK : Find the total sales for each product, additionally provide details
--such order id, and order date
SELECT SaleID, SaleDate FROM Sales

SELECT SaleID, SaleDate, Product, SUM(Amount) TOtal_sales FROM Sales
GROUP BY Product -- OMG : Only getting error, SQL is not allowing it

--All columns in SELECT must be included in GROUP BY
SELECT SaleID, SaleDate, Product, SUM(Amount) TOtal_sales FROM Sales
GROUP BY Product, SaleID, SaleDate
--Data to mil gya bt har product ke liye aggregated total sales nahi mil rahe
--GROUP BY LIMITS : Can't do aggregations and provide detail at the same time

--Chalo window function use karte hai

SELECT SUM(Amount)  OVER() FROM Sales
--OVER() after the aggregation or the functiion tell sql that we are usiing window functiion
--Result Granularity : Window functions returns a result for each row

--Our task was : Find the total sales for each product, additionally provide details
--such order id, and order date
--total sales to mil rhe hai, chalo ab for each product karte hai, 
-- for that we will use something like PARTITION BY (NOT GROUP BY)

SELECT Product, SUM(Amount) OVER(PARTITION BY Product) Ttlsales_By_Product
FROM Sales 
--Oh bhaii sahab, har record ke liye agregation result mil rha hai, matlab total
--product sold, by keeping the eachh row woh bh sorted..!
--ab orderID and Date ke bhi details print karte haii
SELECT SaleID, SaleDate, Product, SUM(Amount) 
OVER(PARTITION BY Product) ttl_sales_by_Product
FROM Sales
--Isi ko jannat kehte hai

--------------------------------------------------------------------------------
--WONDOW FUNCTIONS : THE SYNTAX
/* sql window functions are into the two parts 
first is : window functiion
second is : Over clause
	over clause contaiins : 
		Partition cllause
		Order ----||----
		Frame-----||---

--WIndow funtion : Perform calculations within a window
types : Aggregate : COUNT() All datatype , SUM(), AVG(), MIN(), MAX() (rest all should d
have numeric expression
		Rank : ROW_NUMBR(), RANK(), DENSE_RANK(), CUME_DIST(), PERCENT_RANK()
				NTILE() (numeric expression ) rest all empty
		Value : LEAD(), LAG(), FIRST_VALUE(), LAST_VALUE() all dtypes

Function Expression : Argument you pass to a function
we can have empty, column, number, multiple arguments, conditional logic
as an expression

OVER() : define the window of data
OVER(PARTITION BY Category ORDER BY OrderDate ROWS UNBOUND PRECEDING)
1) PARTITION BY :Divides the dataset into windows(Partitions)
	OVER() : partition by is not there, so entire table is 1 window
	OVER(PARTITION BY Product) : Calculation is done individually on each wiindow
	OVER ( Partition by multiple columns)

	*/
--lets' write a simple query to undestand the different scenarios with OVER
SELECT SaleID, SaleDate, Product, Region,
Amount,
SUM(Amount) OVER() total_amount,
SUM(Amount) OVER(PARTITION BY Product) ttl_sales_by_Product,
SUM(Amount) OVER(PARTITION BY Product, Region) ttl_sales_by_ProductandCaterory
FROM Sales

/*
OVER(PARTITION BY Category ORDER BY OrderDate ROWS UNBOUND PRECEDING)
2) ORDER BY : Sort the data winthin a window ( ascending | Descending)
	for aggregation functions these are optional,bt for Rank and Value functions
	these are requqired****
*/
SELECT SaleID, SaleDate, Product,
Amount,
SUM(Amount) OVER() total_amount,
SUM(Amount) OVER(PARTITION BY Product) ttl_sales_by_Product,
SUM(Amount) OVER(PARTITION BY Product ORDER BY Amount DESC) ttl_sales_by_ProductandCaterory
FROM Sales

/*
OVER(PARTITION BY Category ORDER BY OrderDate ROWS UNBOUNDED PRECEDING)
3) ROWS UNBOUNDED PRECEDING:
	Window Frame defines a subset of rows within each wiindow that is 
	relevant for the calculation
*/
SELECT SaleID, SaleDate, Product,
Amount,
SUM(Amount) OVER() total_amount,
SUM(Amount) OVER(PARTITION BY Product ORDER BY Amount DESC) ttl_sales_by_ProductandCaterory,
SUM(Amount) OVER(PARTITION BY Product ORDER BY Amount DESC
ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) ttl_sales_by_Product
FROM Sales

SELECT SaleID, SaleDate, Product,
Amount,
SUM(Amount) OVER() total_amount,
SUM(Amount) OVER(PARTITION BY Product ORDER BY Amount DESC) ttl_sales_by_ProductandCaterory,
SUM(Amount) OVER(PARTITION BY Product ORDER BY Amount DESC
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) ttl_sales_by_Product
FROM Sales

/*
RULES ( Limitations) :
1. Window functions can bee used only in SELECT and ORDER BY Clause
*/
SELECT SaleID, SaleDate, Product,
Amount,
SUM(Amount) OVER() total_amount
FROM Sales
--GROUP BY SUM(Amount) OVER (PARTITION BY Product) : WIll give error

/*
2. Nesting windoe function is not allowed.!
3. SQL execute WINDOW Functions after WHERE clause
*/
--Task : Find the Total sales for each order status, only for two products Laptop and Mobile
SELECT SaleID, SaleDate, Product,
Amount,
SUM(Amount) OVER() total_amount
FROM Sales
WHERE Product IN('Laptop', 'Mobile')
/*
4. Window function can be used together with GROUP BY
in the same query, ONLY if the same columns are used
*/

SELECT Product,
SUM(Amount),
RANK() OVER(ORDER BY SUM(AMOUNT) DESC)
FROM Sales
GROUP BY Product