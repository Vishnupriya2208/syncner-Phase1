CREATE TABLE Customer_Dimension (
    customer_key INT IDENTITY(1,1) PRIMARY KEY,  -- Use IDENTITY for auto-increment
    customer_id VARCHAR(20),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    loyalty_tier VARCHAR(50),
    start_date DATE,
    end_date DATE,
    is_current_flag INT
);
INSERT INTO Customer_Dimension (
    customer_id, first_name, last_name, email, loyalty_tier, start_date, end_date, is_current_flag
) VALUES (
    'CUST001', 'Jane', 'Smith', 'jane.smith@email.com', 'Bronze', '2022-01-15', '2023-06-30', 0
);
UPDATE Customer_Dimension
SET end_date = '2023-06-30', is_current_flag = 0
WHERE customer_id = 'CUST001' AND is_current_flag = 1;

INSERT INTO Customer_Dimension (
    customer_id, first_name, last_name, email, loyalty_tier, start_date, end_date, is_current_flag
) VALUES (
    'CUST001', 'Jane', 'Smith', 'jane.smith@email.com', 'Gold', '2023-07-01', '9999-12-31', 1
);
SELECT * FROM Customer_Dimension;
SELECT customer_id, first_name, loyalty_tier
FROM Customer_Dimension
WHERE is_current_flag = 1;