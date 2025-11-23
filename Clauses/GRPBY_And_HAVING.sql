use Practice

SELECT *
FROM Employees

--HAVING with GROPU BY

SELECT Department, SUM(Salary) AS Total_Salary
FROM Employees 
GROUP BY Department
HAVING SUM(Salary) > 120000

--Having clause without group by
SELECT SUM(Salary) AS Total_Salary
FROM Employees 
HAVING SUM(Salary) > 120000