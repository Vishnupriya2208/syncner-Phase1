 CREATE DATABASE RetailShop;
GO
USE RetailShop
GO
drop table Customers
CREATE TABLE Customers (
    [customer_id] INT PRIMARY KEY,
    [name] VARCHAR(100),
    [gender] VARCHAR(10) 
	);
GO
CREATE TABLE Orders (
    [order_id] INT PRIMARY KEY,
    [customer_id] INT,
    [amount] DECIMAL(10, 2),  -- Order amount
    [order_date] DATE,
    FOREIGN KEY ([customer_id]) REFERENCES Customers([customer_id])
);
GO
INSERT INTO Customers ([customer_id], [name], [gender])
VALUES
    (101, 'John Doe', 'male'),
    (102, 'Jane Smith', 'female'),
    (103, 'James Bond', 'male'),
    (104, 'Emily Clark', 'female');
GO

INSERT INTO Orders ([order_id], [customer_id], [amount], [order_date])
VALUES
    (1, 101, 100.00, '2025-04-01'),
    (2, 102, 150.00, '2025-04-02'),
    (3, 103, 200.00, '2025-04-01'),
    (4, 101, 250.00, '2025-04-03'),
    (5, 103, 300.00, '2025-04-01'),
    (6, 102, 50.00, '2025-04-04'),
    (7, 101, 120.00, '2025-04-05'),
    (8, 104, 400.00, '2025-04-01'),
    (9, 102, 180.00, '2025-04-02'),
    (10, 103, 90.00, '2025-04-06');
GO
SELECT 
    c.gender,
    AVG(o.amount) AS avg_spend, 
	SUM(o.amount) AS total_spend, 
    MAX(o.amount) AS max_spend,
    MIN(o.amount) AS min_spend 
FROM 
    Orders o
JOIN 
    Customers c ON o.customer_id = c.customer_id
GROUP BY 
    c.gender;
GO