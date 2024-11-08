CREATE DATABASE Lab7;

 1
SElECT * FROM countries where name ='string';

CREATE INDEX idx_countries ON countries(name);


2
SELECT * FROM employees where name = 'string' AND surname = 'string';

CREATE INDEX idx_employees_name_surname ON employees (name,surname);

3
SELECT * FROM employees WHERE salary < value1
AND salary > value2;

CREATE UNIQUE INDEX idx_unique_employees_salary ON employees(salary);

4
SELECT * FROM employees WHERE substring(name from 1 for 4) = ‘abcd’;

CREATE INDEX idx_employees_name_substring ON employees((substring(name FROM 1 for 4)));

5
SELECT * FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE d.budget > value2 AND e.salary < value2;

CREATE INDEX idx_departments_budget_department_id ON departments(department_id, budget);

CREATE INDEX idx_employees_salary_department_id ON employees(department_id, salary);


