-- ADBMS PRACTICAL ASSIGNMENT

-- 1. Create a database named CompanyDB
CREATE DATABASE CompanyDB;

-- Select the database to work with
USE CompanyDB;


-- 2. Create the Employees table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    JoinDate DATE
);

-- Display the table structure
DESC Employees;


-- 3. Create the Departments table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- Display the table structure
DESC Departments;


-- 4. Add an Email column to Employees
ALTER TABLE Employees
ADD Email VARCHAR(100);

-- Check the newly added column
DESC Employees;


-- 5. Add a dept_location column to Departments
ALTER TABLE Departments
ADD dept_location VARCHAR(100);

-- Check the newly added column
DESC Departments;


-- 6. Add a Phone column with NOT NULL constraint
ALTER TABLE Employees
ADD Phone VARCHAR(15) NOT NULL DEFAULT '';

-- Check the Phone column and its constraint
DESC Employees;


-- 7. Change EmpName size from VARCHAR(50) to VARCHAR(100)
ALTER TABLE Employees
MODIFY EmpName VARCHAR(100);

-- Check the updated column size
DESC Employees;


-- 8. Drop the primary key constraint from Departments
ALTER TABLE Departments
DROP PRIMARY KEY;

-- Check that DeptID no longer has a primary key
DESC Departments;


-- 9. Create a foreign key between Employees and Departments

-- Add DeptID to the Employees table
ALTER TABLE Employees
ADD DeptID INT;

-- Add a UNIQUE constraint because the primary key was removed
ALTER TABLE Departments
ADD UNIQUE (DeptID);

-- Connect the two tables using a foreign key
ALTER TABLE Employees
ADD CONSTRAINT fk_department
FOREIGN KEY (DeptID)
REFERENCES Departments(DeptID);

-- Check the Employees table structure
DESC Employees;

-- Display the foreign key details
SHOW CREATE TABLE Employees;


-- 10. Rename EmpName to EmployeeName
ALTER TABLE Employees
RENAME COLUMN EmpName TO EmployeeName;

-- Check the renamed column
DESC Employees;


-- 11. Apply CHECK constraints on Age and Salary

-- Add an Age column because it is not present in the original table
ALTER TABLE Employees
ADD Age INT;

-- Ensure that the employee's age is at least 18
ALTER TABLE Employees
ADD CONSTRAINT chk_age CHECK (Age >= 18);

-- Ensure that the salary is greater than zero
ALTER TABLE Employees
ADD CONSTRAINT chk_salary CHECK (Salary > 0);

-- Display the CHECK constraints
SHOW CREATE TABLE Employees;


-- 12. Remove the Phone column from Employees
ALTER TABLE Employees
DROP COLUMN Phone;

-- Check that the Phone column has been removed
DESC Employees;


-- 13. Rename Employees to EmployeeDetails
RENAME TABLE Employees TO EmployeeDetails;

-- Check the renamed table
DESC EmployeeDetails;

-- Display all tables in the database
SHOW TABLES;


-- 14. Drop the CHECK constraints

-- Remove the Age CHECK constraint
ALTER TABLE EmployeeDetails
DROP CHECK chk_age;

-- Remove the Salary CHECK constraint
ALTER TABLE EmployeeDetails
DROP CHECK chk_salary;

-- Check that both CHECK constraints are removed
SHOW CREATE TABLE EmployeeDetails;


-- 15. Delete the Departments table permanently

-- Remove the foreign key before deleting the referenced table
ALTER TABLE EmployeeDetails
DROP FOREIGN KEY fk_department;

-- Delete the Departments table
DROP TABLE Departments;

-- Check which tables remain
SHOW TABLES;


-- 16. Drop the database permanently
DROP DATABASE CompanyDB;

-- Display the databases to verify deletion
SHOW DATABASES;