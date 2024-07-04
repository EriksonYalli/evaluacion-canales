CREATE DATABASE IF NOT EXISTS registro;
USE registro;



-- Tabla customers
CREATE TABLE customers (
    dni VARCHAR(8) PRIMARY KEY,
    name VARCHAR(100),
    street_address VARCHAR(100),
    district_address VARCHAR(100),
    province_address VARCHAR(100)
);

-- Tabla customer_phone
CREATE TABLE customer_phone (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_dni VARCHAR(8),
    phone VARCHAR(15),
    FOREIGN KEY (client_dni) REFERENCES customers(dni)
);

-- Tabla category
CREATE TABLE category (
    code INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

-- Tabla products
CREATE TABLE products (
    code VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100),
    actual_price DECIMAL(10, 2),
    stock_price INT,
    category INT,
    FOREIGN KEY (category) REFERENCES category(code)
);

-- Tabla sales
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    customer_dni VARCHAR(8),
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_dni) REFERENCES customers(dni)
);

-- Tabla sale_detail
CREATE TABLE sale_detail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT,
    product_id VARCHAR(10),
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (sale_id) REFERENCES sales(id),
    FOREIGN KEY (product_id) REFERENCES products(code)
);



INSERT INTO customers (dni, name, street_address, district_address, province_address) VALUES
('12345678', 'John Doe', '123 Main St', 'Downtown', 'Lima'),
('87654321', 'Jane Smith', '456 Elm St', 'Midtown', 'Cusco'),
('23456789', 'Alice Johnson', '789 Oak St', 'Uptown', 'Arequipa'),
('98765432', 'Bob Brown', '321 Pine St', 'Oldtown', 'Trujillo'),
('34567890', 'Carol White', '654 Maple St', 'Newtown', 'Chiclayo');


INSERT INTO customer_phone (client_dni, phone) VALUES
('12345678', '555-1234'),
('12345678', '555-5678'),
('87654321', '555-8765'),
('23456789', '555-2345'),
('98765432', '555-9876');


INSERT INTO suppliers (ruc, name, address, phone, website) VALUES
('20123456789', 'Supplier A', '123 Supplier St', '555-1001', 'www.suppliera.com'),
('20987654321', 'Supplier B', '456 Supplier Ave', '555-2002', 'www.supplierb.com'),
('20234567890', 'Supplier C', '789 Supplier Blvd', '555-3003', 'www.supplierc.com'),
('20876543210', 'Supplier D', '321 Supplier Rd', '555-4004', 'www.supplierd.com'),
('20345678901', 'Supplier E', '654 Supplier Ln', '555-5005', 'www.suppliere.com');



INSERT INTO products (code, name, current_price, stock, category_id) VALUES
('P001', 'T-Shirt', 19.99, 100, 1),
('P002', 'Jeans', 39.99, 50, 2),
('P003', 'Jacket', 59.99, 30, 3),
('P004', 'Sneakers', 79.99, 25, 4),
('P005', 'Hat', 14.99, 75, 5);

INSERT INTO categories (id, name, description) VALUES
(1, 'Clothing', 'Apparel items including shirts, pants, and jackets'),
(2, 'Footwear', 'Various types of shoes and boots'),
(3, 'Accessories', 'Items such as hats, belts, and bags'),
(4, 'Sportswear', 'Clothing designed for sports and physical activities'),
(5, 'Outerwear', 'Jackets, coats, and other outer garments');