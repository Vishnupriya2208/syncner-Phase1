CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(50)
);
CREATE TABLE Order_Details (
    order_id INT,
    product_id VARCHAR(50),
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);
CREATE TABLE Products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);
CREATE TABLE Customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100)
);
INSERT INTO Customers (customer_id, customer_name)
VALUES 
    ('C1', 'Alice'),
    ('C2', 'Bob');
INSERT INTO Products (product_id, product_name, price)
VALUES 
    ('P1', 'Laptop', 1000),
    ('P2', 'Mouse', 20),
    ('P3', 'Keyboard', 50);
INSERT INTO Orders (order_id, order_date, customer_id)
VALUES 
    (101, '2023-01-01', 'C1'),
    (102, '2023-01-02', 'C2');

INSERT INTO Order_Details (order_id, product_id, quantity)
VALUES 
    (101, 'P1', 2),
    (101, 'P2', 3),
    (102, 'P3', 1);
CREATE VIEW Sales_Reports AS
SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    p.product_name,
    od.quantity,
    p.price,
    (od.quantity * p.price) AS total_price
FROM
    Orders o
INNER JOIN
    Order_Details od ON o.order_id = od.order_id
INNER JOIN
    Products p ON od.product_id = p.product_id
INNER JOIN
    Customers c ON o.customer_id = c.customer_id;

	SELECT * FROM Sales_Reports;