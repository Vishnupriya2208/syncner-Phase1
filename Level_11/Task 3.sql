Create table employees (
id INT PRIMARY KEY,
name VARCHAR (100),
department VARCHAR (100),
salary DECIMAL (10,2)
);
INSERT INTO employees (id, name, department, salary) 
VALUES 
    (6, 'Fiona', 'Sales', 50000),
    (7, 'George', 'Sales', 48000),
	(8, 'Diana' , 'Engineering',75000),
	(9, 'Evan'   ,'Marketing',70000);
SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE department = 'Engineering'
GROUP BY department;
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;
SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE department = 'Engineering'
GROUP BY department;
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;
