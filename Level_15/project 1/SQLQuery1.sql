IF OBJECT_ID('Orders', 'U') IS NOT NULL
    DROP TABLE Orders;
GO
CREATE TABLE Orders (
    Invoice_no VARCHAR(50) NOT NULL,
    Order_id VARCHAR(50) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Invoice_no, Order_id)
);
GO
INSERT INTO Orders (Invoice_no, Order_id, Amount)
VALUES
    ('1001', '001', 50.00),
    ('1002', '002', 30.00),
    ('1003', '003', 20.00),
    ('1004', '004', 60.00);
GO
SELECT * FROM Orders;
GO
SELECT
    SUM(Amount) / COUNT(DISTINCT Invoice_no) AS AOV
FROM
    Orders;
GO