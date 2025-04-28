 CREATE TABLE Product(
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(18, 2)
);

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
    customer_id VARCHAR(50) PRIMARY KEY,  -- Define customer_id as primary key
    customer_name VARCHAR(100),
    customer_address VARCHAR(200)
);
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,   -- Primary key on order_id
    order_date DATE,
    customer_id VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)  -- Foreign key to Customers
);
CREATE TABLE Order_Detail (
    order_id INT,
    product_id VARCHAR(50),
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),  
    FOREIGN KEY (product_id) REFERENCES Product(product_id)  
);
INSERT INTO Customers (customer_id, customer_name, customer_address)
VALUES
    ('C1', 'Alice', '123 Main St'),
    ('C2', 'Bob', '456 Oak Ave');
INSERT INTO Orders (order_id, order_date, customer_id)
VALUES
    (101, '2023-01-01', 'C1'),
    (102, '2023-01-02', 'C2');

INSERT INTO Product (product_id, product_name, price)
VALUES
    ('P1', 'Laptop', 1000),
    ('P2', 'Mouse', 20),
    ('P3', 'Keyboard', 50);
INSERT INTO Order_Detail (order_id, product_id, quantity)
VALUES
    (101, 'P1', 2),
    (101, 'P2', 3),
    (102, 'P3', 1);
	select*from Order_Detail
	select*from Product