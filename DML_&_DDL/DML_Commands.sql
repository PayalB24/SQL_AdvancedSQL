/* DML : Data Manipulation Language
How to change the data inside your table */

use Practice;

create table customers(
id int NOT NULL,
first_name varchar(50),
country varchar(20),
score int 
);

--insert : TO insert new data into the table, and new record get appended to the last of the table--
--No. of columns and values must match--
--Columns and values must be in the same order--
--Matching data types, column count and constraints--
-- you can skip the columns if you insert values sfor every column--

insert into customers (id, first_name, country, score) 
values (1, 'Payal','India',98)
insert into customers (id, first_name, country, score) 
values (2, 'Vaishnavi','USA',65),
(2, 'Komal','Shri-lanka',88),
(3, 'Shubhangi','canada',48),
(4, 'Sonali','Dubai',84),
(5, 'Anjali','India',NULL),
(6, 'Gauri','Pakistan',73),
(7, 'Aarti','turkey',59),
(8, 'Payal','Korea',78),
(9, 'Samu','Japan',98),
(10, 'Namo',NULL,100)



-- if you want to insert only mojke columns you can do it like--
insert into customers (id, score) values
(11, 77) -- no need to explicitly use NULL --

--So far we inserted the data MANUALLY inside insert command--
/*Now we are gonna insert the data but not manually 
	we will insert the data using another table 
	let's  say we have a table having data this will be our source table, and we have another table (empty)
	and we want to insert the new data to the target table, using source table
	in order to do that...
		we need to do 2 steps , write an select sql query to select the data from source table, and use insert 
		to insert the data / result too the target table
	*/

-- task : copy data from 'customers' table into 'persons' table
insert into persons(id, person_name, birth_date, phone) 
select 
id, first_name, NULL as birth_date, 'Unknown' as phone
from customers

select *from persons

select *from customers


/*UPDATE :
	i want to change the content of the table record

	syntax :  UPDATE TABLE_NAME SET col1 = val1, col2 = vaL2 WHERE <condition>
	if where clause is not there, all rows will be updated unintentionally
	so the best practive it to use where clause
	*/

--task : Change ethe score of customer with ID 6 to 0 --
SELECT *
FROM customers
WHERE id = 6

--tip : Check with SELECT before running UPDATE to avoid updating the wrong data--
UPDATE customers 
SET score = 0
WHERE id = 6

SELECT * FROM customers

--task2 :  Change the score of customer with ID 10 to 0 and update the country to 'UK'
SELECT * FROM customers WHERE id = 10

UPDATE customers
SET score = 0,
country = 'UK'
WHERE id = 10

SELECT *FROM customers

--task3 : Update all customers with a NULL score, by setting their score to 0 --
SELECT *FROM customers 
WHERE score IS NULL

UPDATE customers 
SET score = 0
WHERE score IS NULL


/* DELETE :
	Remove the rows sfrom the table
	syntax : DELETE FROM table_name WHERE <condition>
*/

--task1 : Delete all the customers with an ID greater than 5--
--risk : Without a WHERE condition , all rows will bee updated.!--

DELETE FROM customers
WHERE id > 5

--task2 : Delete all data from the persons table--
-- TRUNCATE : Clears the whole table at once without checking or logging --
-- TRUNCATE is faster than DELETE, if you have large table DELETE can be slow --
TRUNCATE TABLE persons

SELECT * FROM persons




