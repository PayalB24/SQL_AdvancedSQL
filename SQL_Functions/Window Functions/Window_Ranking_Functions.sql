/* WINDOW RANKING FUNCTIONS
Integer Based Rankin : Row_Number(), Rank(), Dense_Rank(), Ntile(n)
Percentage based Ranking : Cume_Dist(), Percent_Rank()
**Frame clause is not allowed in Ranking functions

Syntax :
	RANK() OVER (PARTITION BY ProductID ORDER BY Sales)

1) ROW_NUMBER() : Assign a unique number to each row
				  It doesn't handle ties
*/
--Task : Rank the orders based on their sales from highest to lowest
USE Practice
SELECT SaleID, Product, Amount ,
ROW_NUMBER() OVER(ORDER BY Amount DESC) Ranking
FROM Sales

USE Practice
SELECT SaleID, Product, Amount ,
ROW_NUMBER() OVER(PARTITION BY Product ORDER BY Amount DESC) Ranking
FROM Sales

/*
2. RANK() : Assign a rannk to each row
			it handles the ties
			it leaves gaps in ranking
*/

USE Practice
SELECT SaleID, Product, Amount ,
RANK() OVER(ORDER BY Amount DESC)
FROM Sales


SELECT SaleID, Product, Amount ,
RANK() OVER(ORDER BY Amount DESC)
FROM Sales

/*
3. DENSE_RANK() :
		Assign a rank to each row.
		it handles ties.
		it does not leaves gaps in ranking
*/
SELECT SaleID, Product, Amount,
DENSE_RANK() OVER(ORDER BY Amount DESC)
FROM Sales
--------------------------------------------------------------
--USE CASE 
--Task : Find the top highest sales for each product
SELECT * FROM(
SELECT Product, Amount,
ROW_NUMBER() OVER (PARTITION BY Product ORDER BY Amount DESC) ranking
FROM Sales
)Ranking WHERE ranking = 1

--Task : find the lowest 2 customers based on the total sales
SELECT * FROM(
SELECT Product, SUM(Amount) total_sales,
ROW_NUMBER() OVER(ORDER BY SUM(Amount)) ranking
FROM Sales
GROUP BY Product
) t WHERE ranking <=2

/*
4. NTILE(no.of bcukets) : Divides the rows into a specified number of 
						approximately equal groups(Buckets)

			bucket size = number of rows/number of buckets

			SQL Rule : 
			Larges groups come first 
			mhannje if 5/2 = 2.5  round to 3
			so first buckt will bee of 3 and second will be of 2
*/
SELECT Product, Amount, 
NTILE(1) OVER(ORDER BY Amount) onebucket,
NTILE(2) OVER(ORDER BY Amount) twobucket,
NTILE(3) OVER(ORDER BY Amount) threebucket
FROM Sales

--NTILE USECASE :
--Data Segmentation
--Task : segment all orders into 3 categories : high, medium andn low sales
SELECT * , 
CASE WHEN Categories =1 THEN 'High'
	WHEN Categories =2 THEN 'Medium'
WHEN Categories =3 THEN 'Low'
END segmentation
FROM (
SELECT SaleID, Product, Amount,
NTILE(3) OVER(ORDER BY Amount DESC) Categories
FROM Sales) t 

--PERCENT BAsed Ranking
--Task : Find the products that falls within the highest 40% of prices
SELECT *,
CONCAT(DistRank*100 , '%')
FROM(
SELECT SaleID, Product, Amount,
CUME_DIST() OVER(ORDER BY Amount DESC) DistRank
FROM Sales) T WHERE DistRank <=0.4