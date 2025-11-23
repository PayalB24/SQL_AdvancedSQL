--FUNCTIONS :
--		Row LVL Funtions
--			Concate() : combines multiple strings into one column

-- Task : Concatenate firstname and country into one column
use Practice

SELECT * FROM customers

SELECT FirstName, country FROM customers;

SELECT CONCAT(FirstName,' ', country) AS Person_with_country FROM customers

--LOWER and UPPER
SELECT UPPER(FirstName) FROM customers

SELECT LOWER(FirstName) FROM customers

--TRIM
--Task : Find the customers whose first name contins leading or tailing spaces


SELECT FirstName,
LEN(FirstName) AS Length_before_Trim,
LEN(TRIM(FirstName)) AS Length_after_Trim,
LEN(FirstName) - LEN(TRIM(FirstName)) flag
FROM customers

--REPLACE ()
--TAsk = Remove dashes(-) from a phone number

SELECT '123-456-7890' AS Phone,
REPLACE ('123-456-7890', '-', ' ') AS Clean_Phone
