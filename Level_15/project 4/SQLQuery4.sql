USE RetailStore;
GO
drop table customers
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
    (104, 'Emily Clark', 'female'),
    (105, 'Michael Johnson', 'male');
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
    (10, 103, 90.00, '2025-04-06'),
    (11, 105, 300.00, '2025-04-02'),
    (12, 105, 500.00, '2025-04-03');
GO
WITH RankedCustomers AS (
    SELECT 
        c.customer_id,
        c.name,
        SUM(o.amount) AS total_spend,  
        RANK() OVER (ORDER BY SUM(o.amount) DESC) AS spend_rank  
    FROM 
        Orders o
    JOIN 
        Customers c ON o.customer_id = c.customer_id
    GROUP BY 
        c.customer_id, c.name
)
SELECT 
    customer_id,
    name,
    total_spend,
    spend_rank
FROM 
    RankedCustomers
WHERE 
    spend_rank <= 5
ORDER BY 
    spend_rank;
GO