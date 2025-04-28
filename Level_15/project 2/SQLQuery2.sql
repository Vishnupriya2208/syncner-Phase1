CREATE DATABASE Sales;
GO
USE Sales;
GO
DROP TABLE IF EXISTS Orders;
GO
CREATE TABLE Orders (
    [order_id] INT PRIMARY KEY,  
    [customer_id] INT,
    [amount] DECIMAL(10, 2),
    [order_date] DATE
);
GO
INSERT INTO Orders ([order_id], [customer_id], [amount], [order_date])
VALUES
    (1, 101, 100.00, '2025-04-01'),
    (2, 101, 150.00, '2025-04-02'),
    (3, 102, 200.00, '2025-04-01'),
    (4, 101, 250.00, '2025-04-03'),
    (5, 103, 300.00, '2025-04-01'),
    (6, 101, 50.00, '2025-04-04'),
    (7, 104, 400.00, '2025-04-01'),
    (8, 101, 120.00, '2025-04-05'),
    (9, 102, 180.00, '2025-04-02'),
    (10, 101, 90.00, '2025-04-06');
GO
SELECT TOP 1
    [customer_id],  
    SUM([amount]) AS total_spent  
FROM 
    Orders
GROUP BY 
    [customer_id] 
HAVING 
    COUNT(DISTINCT [order_id]) >= 5  
ORDER BY 
    total_spent DESC;  
GO
