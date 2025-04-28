CREATE DATABASE SalesDB;
GO
USE SalesDB;
GO
drop table orders
CREATE TABLE Orders (
    order_id INT,
    order_date DATE,
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    quantity INT,
    price DECIMAL(18, 2)
);
GO
drop table Customers
CREATE TABLE Customers (
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    customer_address VARCHAR(255)
);
GO
drop table Products
CREATE TABLE Products (
    product_id VARCHAR(50),
    product_name VARCHAR(100)
);
GO
INSERT INTO Customers (customer_id, customer_name, customer_address)
VALUES 
    ('C1', 'Alice', '123 Main St'),
    ('C2', 'Bob', '456 Oak Ave');
GO

INSERT INTO Products (product_id, product_name)
VALUES 
    ('P1', 'Laptop'),
    ('P2', 'Mouse'),
    ('P3', 'Keyboard');
GO

INSERT INTO Orders (order_id, order_date, customer_id, product_id, quantity, price)
VALUES 
    (101, '2023-01-01', 'C1', 'P1', 2, 1000),
    (101, '2023-01-01', 'C1', 'P2', 3, 20),
    (102, '2023-01-02', 'C2', 'P3', 1, 50);
GO
drop table DenormalizedOrders

CREATE TABLE DenormalizedOrders (
    order_id INT,
    order_date DATE,
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    customer_address VARCHAR(255),
    product_id VARCHAR(50),
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(18, 2)
);
GO

INSERT INTO DenormalizedOrders (order_id, order_date, customer_id, customer_name, customer_address, product_id, product_name, quantity, price)
SELECT 
    o.order_id,
    o.order_date,
    o.customer_id,
    c.customer_name,
    c.customer_address,
    o.product_id,
    p.product_name,
    o.quantity,
    o.price
FROM 
    Orders o
JOIN 
    Customers c ON o.customer_id = c.customer_id
JOIN 
    Products p ON o.product_id = p.product_id;
GO
SELECT * FROM DenormalizedOrders;
GO
drop table Orders_1NF
CREATE TABLE Orders_1NF (
    order_id INT,
    order_date DATE,
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    quantity INT,
    price DECIMAL(18, 2),
    PRIMARY KEY (order_id, product_id)  -- Composite primary key
);
INSERT INTO Orders_1NF (order_id, order_date, customer_id, product_id, quantity, price)
VALUES
    (101, '2023-01-01', 'C1', 'P1', 2, 1000),
    (101, '2023-01-01', 'C1', 'P2', 3, 20),
    (102, '2023-01-02', 'C2', 'P3', 1, 50);
SELECT * FROM Orders_1NF;