use Practice

--Conditional Operators

SELECT *
FROM customers
WHERE country <> 'india'

SELECT *
FROM customers
WHERE country != 'india'

SELECT *
FROM customers
WHERE score > 50

-- Logical Operators
-- Retrieve all customers who are from India and have score greatr than 50

SELECT *
FROM customers
WHERE country = 'India' OR
score > 50

SELECT * 
FROM customers
WHERE NOT score >=50

--Range operator
--BETWEEN operator
SELECT * 
FROM customers
WHERE score BETWEEN 10 AND 50

SELECT * 
FROM customers
WHERE score >=10 AND score <= 50

SELECT * 
FROM customers
WHERE country IN ('India', 'USA')

--LIKE
SELECT *
FROM customers
WHERE first_name LIKE '_____'
