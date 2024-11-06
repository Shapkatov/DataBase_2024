CREATE Database LAB6;

CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code VARCHAR (30),
    city VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);


Insert into locations(  location_id ,street_address, postal_code, city, state_province) values
( '1', '123 Main St', '12345', 'New York', 'NY'),
( '2','456 Elm St', '54321', 'Los Angeles', 'CA'),
('3','789 Oak St', '98765', 'Chicago','IL'),
('4','101 Pine St', '10101', 'San Francisco', 'CA'),
('5,''222 Maple St', '22222', 'Moscow', 'TX');

Insert into departments ( department_id,  department_name, budget,location_id) values
('1','HR',100000, 1),
('2', 'Finance', 150000,2),
('3','IT', 200000,3),
('4','Sales', 120000, 4),
('5','Marketing', 90000,5);

Insert Into employees(employee_id,first_name,last_name,email,phone_number,salary, department_id) values
( '1','John', 'Doe','john@example.com', '555-1234',60000, 30),
('2','Jane', 'Smith', 'gane@example.com','555-5678',70000,50),
('3','Bob', 'Johnson','bob@example.com', '555-9876',80000, 60),
('4','Alice','Williams','alice@example.com', '555-4321', 75000,70),
('5','David','Brown','david@example.com', '555-8765',90000,80);


#3

SELECT
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
From
    employees e
Join
    departments d ON e.department_id = d.department_id;

#4
SELECT
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
From
    employees e
Join
    departments d ON e.department_id = d.department_id
Where
    e.department_id IN (80,40);


#5
SELECT
    e.first_name,
    e.last_name,
    d.department_name,
    l.city,
    l.state_province
from
    employees e
Join
    departments d ON e.department_id = d.department_id
JOIN
    locations l ON d.location_id = l.location_id;

#6
SELECT
    d.department_id,
    d.department_name,
    e.employee_id,
    e.first_name,
    e.last_name
FROM
    departments d
LEFT JOIN
    employees e ON d.department_id = e.department_id;

#7
 SELECT
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
FROM 
    employees e
LEFT JOIN
    departments d ON e.department_id = d.department_id;