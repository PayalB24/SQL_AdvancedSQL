create database Practice

use Practice

/*SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'*/

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

select *from Departments;

INSERT INTO Departments (dept_id, dept_name) VALUES
(101, 'HR'),
(102, 'Sales'),
(103, 'IT'),
(104, 'Marketing');

insert into Departments (dept_id, dept_name) values (105, 'Support');

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);


INSERT INTO Employees (FirstName, LastName,Gender, Department, Salary) VALUES
('Payal', 'Borde', 'F', 'HR', 70000.00),
('Vidya', 'Borde', 'F', 'Marketing', 50000.00);

INSERT INTO Employees (FirstName, LastName,Gender, Department, Salary) VALUES
('Anjali', 'Pawar', 'F', 'Support', 55000.00),
('Vandana', 'Shejwal', 'F', 'Designing', 65000.00);

INSERT INTO Employees (FirstName, LastName,Gender, Department, Salary) VALUES
('Payal', 'Dubey', 'F', 'Support', 38000.00),
('Amit', 'Shejwal', 'M', 'HR', 58000.00),
('Rishi', 'Khurana', 'M', 'Support', 55000.00),
('Mahesh', 'Dalle', 'M', 'HR', 75000.00),
('Vedant', 'Shetty', 'M', 'Designing', 68000.00)

INSERT INTO Employees(FirstName, LastName, Gender, Department, Salary ) VALUES ('Aadi', 'Kapoor', 'M', 'Designing', 45000.00);

select *from Employees

select *from Departments;

--TASKS--
--Select FirstName , Department and Salary from the tablee emp--
select FirstName, Department, Salary from Employees;

--Select FirstName , Last Name where Salary is not 55000--
select FirstName , LastName from Employees where Salary <> 55000;

--Retrive Employee from HR--
Select FirstName, LastName from Employees where Department = 'HR'

--Retrive all employees and sort by salary highest at top--
Select *From Employees order by Salary desc;

--Retrive all employees and sort by department and then by highest salary--
select *from Employees order by Department desc, Salary desc

--find total salary for each department--
select Department, SUM(Salary) from Employees Group by Department;

--find total salary and total number of Employees for each department--
select Department, SUM(Salary) , Count(FirstName) from Employees Group by Department

--find average salary for each Department considering only salary not equal to 50000--
select Department, AVG(Salary) from Employees where Salary <> 50000 Group by Department

--find average salary for each Department considering only average salary > 50000--
select Department, AVG(Salary) avg_salary from Employees group by Department Having AVG(Salary) > 50000

--Return unique list of each country--
select DISTINCT Department From Employees

--Rtrive only top 3 employees--
select TOP 4 FirstName, LastName from Employees;


--Rtrive only top 3 employees with highest salary--
select TOP 2 EmployeeID, FirstName, LastName, Salary from Employees order by EmployeeID desc;


