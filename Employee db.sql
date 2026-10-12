-- CREATE DATABASE EMPLOYEE;
-- USE EMPLOYEE;
-- CREATE TABLE EMPLOYEE(
-- ID INT,
-- NAME VARCHAR(50),
-- SALARY INT);
-- INSERT INTO EMPLOYEE 
-- VALUES 
-- (1,"PRACHI", 10000),
-- (1,"SRUSHTI", 10000);

-- SELECT * FROM EMPLOYEE;
CREATE TABLE DEPARTMENT(
DEPT_ID INT,
DEPT_NAME VARCHAR(50),
FLOOR INT
);

INSERT INTO DEPARTMENT 
VALUES 
(101, "HR", 5),
(102, "SDT", 2),
(103, "ACCOUNTS",3),
(104, "CAFETERIA",0);

SELECT * FROM DEPARTMENT;


create database TCL;
use  TCL;

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    Status VARCHAR (50)
);

desc orders;

set autocommit = 0;


BEGIN;

INSERT INTO orders VALUES (101, 'Geet', 'Pending');
INSERT INTO orders VALUES (102, 'Bob', 'Pending');

TRUNCATE TABLE orders;
SELECT * FROM orders;

Rollback;
commit;

INSERT INTO orders VALUES (103, 'Prachi', 'Pending');
INSERT INTO orders VALUES (104, 'Teju', 'Pending');
SELECT * FROM orders;
commit;



update orders set customer_name ='Raj' where order_id=1

