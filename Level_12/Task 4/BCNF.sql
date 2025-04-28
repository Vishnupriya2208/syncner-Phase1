CREATE TABLE Products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);
CREATE TABLE Product_Warehouses (
    product_id VARCHAR(50),
    warehouse_id VARCHAR(50),
    PRIMARY KEY (product_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Products (product_id, product_name, price)
VALUES
    ('P1', 'Laptop', 1000),
    ('P2', 'Mouse', 20);
INSERT INTO Product_Warehouses (product_id, warehouse_id)
VALUES
    ('P1', 'W1'),
    ('P2', 'W2');
	SELECT * FROM Products;
	SELECT * FROM Product_Warehouses;
	SELECT 
    p.product_id,
    p.product_name,
    p.price,
    w.warehouse_id
FROM 
    Products p
INNER JOIN 
    Product_Warehouses w ON p.product_id = w.product_id;