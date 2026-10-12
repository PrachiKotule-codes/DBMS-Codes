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

