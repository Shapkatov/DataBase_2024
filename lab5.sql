
CREATE DATABASE lab5;


DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade VARCHAR(50),
    salesman_id VARCHAR(50)
);

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date VARCHAR(100),
    customer_id INT,
    salesman_id VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);


create table salesman (
    salesman_id VARCHAR(50),
    name VARCHAR(100),
    city VARCHAR (50),
    commission DECIMAL(3,2)

);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
('3002', 'Nick Rimando', 'New York', '100', '5001'),
('3007', 'Brad Davis', 'London', '200', '5005'),
('3005', 'Graham Zusi', 'California', '200', '5002'),
('3008', 'Julian Green', 'London', '300', '5002'),
('3004', 'Fabian John', 'Paris', '300', '5006'),
('3009', 'Geoff Cameron', 'Berlin', '100', '5003'),
('3003', 'Brad Guzan', 'London', '200', '5001'),
('3006', 'David Junior', 'New York', '300', '5007');

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', '3005', '5002'),
(70009, 270.65, '2012-09-10', '3001', '5005'),
(70002, 65.26, '2012-10-05', '3002', '5001'),
(70004, 110.5, '2012-08-17', '3009', '5003'),
(70007, 948.5, '2012-09-10', '3005', '5002'),
(70005, 2400.6, '2012-07-27', '3007', '5001'),
(70008, 5760, '2012-09-10', '3002', '5001');



INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'San Jose', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);


SELECT SUM (purch_amt) AS total_purchase_amount
From orders;

SELECT AVG(purch_amt) AS total_purchase_amount
From orders;


SELECT COUNT(*) AS customer_count
FROM customers
WHERE cust_name IS NOT NULL;

SELECT min (purch_amt)
from orders;

select *
from customers
where cust_name like '%b';


SELECT o.*
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.city = 'New York';

SELECT c.*
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.purch_amt > 10;


SELECT *
From customers
WHERE cust_name IS NOT NULL;

SELECT max(grade) max_grade from customers;

