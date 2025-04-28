Create database CRUDOperations;
Use CRUDOperations;
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10, 2)
);
INSERT INTO employee (id, name, department, salary) 
VALUES 
    (1, 'Alice', 'Engineering', 75000),
    (2, 'Bob', 'Marketing', 65000),
    (3, 'Charlie', 'Engineering', 80000);
UPDATE employee
SET salary = 70000
WHERE id = 2;
SELECT * FROM employee
WHERE department = 'Engineering';
DELETE FROM employee
WHERE id = 3;
ALTER TABLE employee
ADD appraisal_percentage DECIMAL(5, 2);