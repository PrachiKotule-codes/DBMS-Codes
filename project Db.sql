-- 1
CREATE DATABASE ADBMS;
USE ADBMS;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    City VARCHAR(30),
    bdate DATE
);

CREATE TABLE Investor (
    inv_no INT PRIMARY KEY,
    inv_name VARCHAR(50),
    inv_date DATE,
    inv_amt DECIMAL(10,2),
    emp_id INT
);

SHOW TABLES;

-- 2

INSERT INTO Employee VALUES
(1, 'Amit', 'Pune', '2000-05-10'),
(2, 'Priya', 'Mumbai', '2001-08-15'),
(3, 'Rahul', 'Nashik', '1999-03-20'),
(4, 'Sneha', 'Delhi', '2002-11-25'),
(5, 'Neha', 'Pune', '2000-01-05');

INSERT INTO Investor VALUES
(101, 'Raj', '2025-01-10', 50000, 1),
(102, 'Riya', '2025-02-15', 75000, 2),
(103, 'Aman', '2025-03-20', 60000, 3),
(104, 'Pooja', '2025-04-25', 80000, 4),
(105, 'Kiran', '2025-05-30', 90000, 5);

SELECT * FROM Employee;
SELECT * FROM Investor;

SELECT * FROM Employee;

ALTER TABLE Employee
ADD COLUMN Age INT,
ADD COLUMN Salary DECIMAL(10,2);

ALTER TABLE Employee
ADD CONSTRAINT chk_age CHECK (Age <= 50),
ADD CONSTRAINT chk_salary CHECK (Salary >= 10000);

UPDATE Employee SET Age = 25, Salary = 25000 WHERE emp_id = 1;
UPDATE Employee SET Age = 24, Salary = 30000 WHERE emp_id = 2;
UPDATE Employee SET Age = 27, Salary = 35000 WHERE emp_id = 3;
UPDATE Employee SET Age = 23, Salary = 28000 WHERE emp_id = 4;
UPDATE Employee SET Age = 26, Salary = 40000 WHERE emp_id = 5;

SELECT * FROM Employee;

ALTER TABLE Investor
ADD COLUMN Age INT;

DESCRIBE Investor;

ALTER TABLE Investor
MODIFY COLUMN inv_name TEXT;

DESCRIBE Investor;

ALTER TABLE Employee
RENAME COLUMN emp_id TO E_id;

UPDATE Employee
SET City = 'Nagpur'
WHERE E_id = 4;

SELECT * FROM Employee
WHERE E_id = 4;

DELETE FROM Investor
WHERE inv_no = 105;

SELECT * FROM Investor;

ALTER TABLE Investor
DROP COLUMN Age;

DESCRIBE Investor;

ALTER TABLE Employee
DROP CHECK chk_age;

SHOW CREATE TABLE Employee;

ALTER TABLE Investor
ADD CONSTRAINT fk_investor_employee
FOREIGN KEY (emp_id)
REFERENCES Employee(E_id);

SELECT inv_no, inv_name, inv_date, inv_amt
FROM Investor;

RENAME TABLE Investor TO Investor_Details;

SHOW TABLES;

ALTER TABLE Investor_Details
DROP FOREIGN KEY fk_investor_employee;

TRUNCATE TABLE Investor_Details;
TRUNCATE TABLE Employee;

SELECT * FROM Investor_Details;
SELECT * FROM Employee;

DROP TABLE Investor_Details;
DROP TABLE Employee;

SHOW TABLES;