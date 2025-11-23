/* MULTI-Table JOIN
Task : Using SalesDB, Retrieve a list of all orders, along with the related customer, product, and employee details.
for each order, display : order id, customer's name, product name salese ammont, product price, salesperson's name
*/
-- Create Database
CREATE DATABASE SalesDB;
GO
USE SalesDB;
GO

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Customers VALUES
(101, 'Payal', 'Pune'),
(102, 'Amit', 'Mumbai'),
(103, 'Sneha', 'Nashik'),
(104, 'Rohan', 'Delhi'),
(105, 'Kiran', 'Hyderabad'),
(106, 'Neha', 'Bangalore');

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    UnitPrice DECIMAL(10,2)
);

INSERT INTO Products VALUES
(201, 'Laptop', 55000),
(202, 'Phone', 20000),
(203, 'Tablet', 30000),
(204, 'Headphones', 1500),
(205, 'Keyboard', 800),
(206, 'Monitor', 12000);

-- Create EmployeeDetails Table
CREATE TABLE EmployeeDetails (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Position VARCHAR(50)
);

INSERT INTO EmployeeDetails VALUES
(301, 'Mr. Sharma', 'Manager'),
(302, 'Mrs. Gupta', 'Sales Executive'),
(303, 'Mr. Patil', 'Sales Executive'),
(304, 'Ms. Verma', 'Cashier'),
(305, 'Mr. Khan', 'Inventory Manager'),
(306, 'Ms. Rao', 'Support');

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    EmployeeID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (EmployeeID) REFERENCES EmployeeDetails(EmployeeID)
);

INSERT INTO Orders VALUES
(401, 101, 201, 302, '2024-11-01', 1),
(402, 102, 204, 303, '2024-11-02', 2),
(403, 103, 202, 304, '2024-11-03', 1),
(404, 104, 203, 305, '2024-11-04', 3),
(405, 105, 205, 301, '2024-11-05', 2),
(406, 106, 206, 306, '2024-11-06', 1);


/* MULTI-Table JOIN
Task : Using SalesDB, Retrieve a list of all orders, along with the related customer, product, and employee details.
for each order, display : order id, customer's name, product name salese ammont, product price, salesperson's name
*/

SELECT * FROM Orders
SELECT * FROM EmployeeDetails
SELECT * FROM Customers
SELECT * FROM Products

SELECT *
FROM Orders AS o
INNER JOIN Customers AS c 
ON o.CustomerID = c.CustomerID
INNER JOIN EmployeeDetails AS e
ON o.EmployeeID = e.EmployeeID
INNER JOIN Products AS p
ON o.ProductID = p.ProductID


ALTER TABLE Orders DROP Customers;
ALTER TABLE Orders DROP  Products;
ALTER TABLE Orders DROP EmployeeDetails;

