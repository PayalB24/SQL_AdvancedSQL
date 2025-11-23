CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(101, 'HR'),
(102, 'Sales'),
(103, 'IT'),
(104, 'Marketing');

INSERT INTO Departments (dept_id, dept_name) VALUES
(105, 'Support');


select * from Departments;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary INT,
    joining_date DATE,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert sample data
INSERT INTO Employees (emp_id, name, dept_id, salary, joining_date) VALUES
(1, 'Alice', 101, 50000, '2023-01-15'),
(2, 'Bob', 102, 60000, '2022-05-20'),
(3, 'Carol', 103, 55000, '2021-03-10'),
(4, 'David', 102, 45000, '2023-06-01'),
(5, 'Eve', 104, 70000, '2020-11-11'),
(6, 'Frank', 105, 40000, '2023-08-05');  -- dept_id 105 does not exist

select * from Employees

Alter table Departments ADD dep_color varchar(10)
Alter table Departments Drop column dep_color 

select * from Departments

update Departments set dept_name = 'Market' where dept_id = 104

Truncate table Employees

Drop table Employees

CREATE VIEW Highest_Salary1 AS
SELECT name, dept_id, salary
FROM Employees
WHERE salary > 60000;

select * from Highest_Salary1