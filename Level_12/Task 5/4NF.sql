CREATE TABLE Customer (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100)
);
CREATE TABLE Customer_Addresses (
    customer_id VARCHAR(50),
    customer_address VARCHAR(200),
    PRIMARY KEY (customer_id, customer_address),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
CREATE TABLE Customer_Phones (
    customer_id VARCHAR(50),
    phone_number VARCHAR(20),
    PRIMARY KEY (customer_id, phone_number),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
INSERT INTO Customer (customer_id, customer_name)
VALUES 
    ('C1', 'Alice');
INSERT INTO Customer_Addresses (customer_id, customer_address)
VALUES
    ('C1', '123 Main St'),
    ('C1', '456 Park Ave');
INSERT INTO Customer_Phones (customer_id, phone_number)
VALUES
    ('C1', '555-1234'),
    ('C1', '555-5678');
	SELECT * FROM Customer;
	SELECT * FROM Customer_Addresses;
	SELECT * FROM Customer_Phones;
SELECT 
    c.customer_name,
    a.customer_address,
    p.phone_number
FROM 
    Customer c
LEFT JOIN 
    Customer_Addresses a ON c.customer_id = a.customer_id
LEFT JOIN 
    Customer_Phones p ON c.customer_id = p.customer_id
WHERE 
    c.customer_id = 'C1';