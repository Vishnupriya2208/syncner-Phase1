CREATE TABLE Customer (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_address VARCHAR(255)
);
drop table Orders
CREATE TABLE Orders_2NF (
    order_id INT,
    order_date DATE,
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    quantity INT,
    price DECIMAL(18, 2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
INSERT INTO Customer (customer_id, customer_name, customer_address)
VALUES 
    ('C1', 'Alice', '123 Main St'),
    ('C2', 'Bob', '456 Oak Ave');
	INSERT INTO [Order] (order_id, order_date, customer_id, product_id, quantity, price)
VALUES
    (101, '2023-01-01', 'C1', 'P1', 2, 1000),
    (101, '2023-01-01', 'C1', 'P2', 3, 20),
    (102, '2023-01-02', 'C2', 'P3', 1, 50);
	SELECT * FROM Customers;
	SELECT * FROM Orders_2NF;