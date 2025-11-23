/*
VALUE FUNCNTIONS : (Data Analytical Functions)
	Access a value from other row
	*/

USE Practice

SELECT
SaleID,
SaleDate,
Amount,
LEAD(Amount,1,10) OVER(ORDER BY SaleDate) nextMonthSale
FROM Sales




--Task : Analyze the mont-over-month performance by finding the percentnage change
-- in sales between the current month and previous month ( Tu day consider kr)

SELECT *,
((currentMonthSales - previousmonthsales)/previousmonthsales) * 100 AS mom_change
FROM(
SELECT 
Day(SaleDate) OrderDAY,
SUM(Amount) currentMonthSales,
LAG (SUM(Amount)) OVER(ORDER BY DAY(SaleDate)) previousmonthsales
FROM Sales
GROUP BY
DAY(SaleDate)
) t

--Task : In order to analyze customer loyalty,
--rank customers based on the average days between their orders

SELECT
SaleID,
Amount,
Day(SaleDate) OrderDAY,
LEAD(DAY(SaleDate)) OVER(ORDER BY Day(SaleDate)) next_order
FROM Sales
ORDER BY SaleID, Day(SaleDate)

--Last_value() and First_Value()
--Task : Find the lowest and highest sales for each product
SELECT 
	SaleID, 
	Product,
	Amount,
	FIRST_VALUE(Amount) OVER(PARTITION BY Product ORDER BY Amount) lowestSales,
	LAST_VALUE(Amount) OVER(PARTITION BY Product ORDER BY Amount
	ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) highestSales,
	FIRST_VALUE(Amount) OVER(PARTITION BY Product ORDER BY Amount DESC) highestSales2
FROM Sales

--We cann solve this task using MIN() MAX() FUNCTIONS
--Now find the difference in sales between the current and lowest sales
SELECT 
	SaleID, 
	Product,
	Amount,
	FIRST_VALUE(Amount) OVER(PARTITION BY Product ORDER BY Amount) lowestSales,
	LAST_VALUE(Amount) OVER(PARTITION BY Product ORDER BY Amount
	ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) highestSales,
	FIRST_VALUE(Amount) OVER(PARTITION BY Product ORDER BY Amount DESC) highestSales2,
	Amount - FIRST_VALUE(Amount) OVER(PARTITION BY Product ORDER BY Amount) SalesDifference
FROM Sales