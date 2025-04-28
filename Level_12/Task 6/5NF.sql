CREATE TABLE Product_Suppliers (
    product_id VARCHAR(50),
    supplier_id VARCHAR(50),
    PRIMARY KEY (product_id, supplier_id)
);

CREATE TABLE Supplier_Orders (
    supplier_id VARCHAR(50),
    order_id INT,
    PRIMARY KEY (supplier_id, order_id)
);
CREATE TABLE Product_Orders (
    product_id VARCHAR(50),
    order_id INT,
    PRIMARY KEY (product_id, order_id)
);
INSERT INTO Product_Suppliers (product_id, supplier_id)
VALUES 
    ('P1', 'S1'),
    ('P2', 'S2');
INSERT INTO Supplier_Orders (supplier_id, order_id)
VALUES
    ('S1', 101),
    ('S2', 101);
INSERT INTO Product_Orders (product_id, order_id)
VALUES
    ('P1', 101),
    ('P2', 101);
	SELECT 
    p.product_id, 
    s.supplier_id, 
    o.order_id
FROM 
    Product_Suppliers p
INNER JOIN 
    Supplier_Orders s ON p.supplier_id = s.supplier_id
INNER JOIN 
    Product_Orders o ON p.product_id = o.product_id
WHERE 
    s.order_id = o.order_id;