CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employe (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10, 2)
);
INSERT INTO departments (department_id, department_name) 
VALUES 
    (1, 'Engineering'),
    (2, 'HR'),
    (3, 'Sales');
INSERT INTO employe (id, name, department, salary) 
VALUES 
    (4, 'Diana', 'HR', 60000),
    (5, 'Evan', NULL, 55000);
SELECT e.name, e.department 
FROM employe e
INNER JOIN departments d ON e.department = d.department_name;
SELECT e.name, e.department, d.department_name
FROM employe e
LEFT JOIN departments d ON e.department = d.department_name;
SELECT e.name, e.department, d.department_name
FROM employe e
RIGHT JOIN departments d ON e.department = d.department_name;
SELECT e.name, e.department, d.department_name
FROM employe e
LEFT JOIN departments d ON e.department = d.department_name
UNION
SELECT e.name, e.department, d.department_name
FROM employe e
RIGHT JOIN departments d ON e.department = d.department_name;