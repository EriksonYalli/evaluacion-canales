-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-07-04 14:36:11.699

-- tables
-- Table: category
CREATE TABLE category (
    code int  NOT NULL,
    name varchar(100)  NOT NULL,
    description text  NOT NULL,
    CONSTRAINT category_pk PRIMARY KEY (code)
);

-- Table: customer_phone
CREATE TABLE customer_phone (
    id int  NOT NULL,
    client_dni varchar(8)  NOT NULL,
    phone varchar(15)  NOT NULL,
    CONSTRAINT customer_phone_pk PRIMARY KEY (id)
);

-- Table: customers
CREATE TABLE customers (
    dni varchar(8)  NOT NULL,
    name varchar(100)  NOT NULL,
    street_address varchar(100)  NOT NULL,
    district_address varchar(100)  NOT NULL,
    province_address varchar(100)  NOT NULL,
    CONSTRAINT customers_pk PRIMARY KEY (dni)
);

-- Table: products
CREATE TABLE products (
    code varchar(10)  NOT NULL,
    name varchar(100)  NOT NULL,
    actual_price decimal(10,2)  NOT NULL,
    stock_price int  NOT NULL,
    category int  NOT NULL,
    CONSTRAINT products_pk PRIMARY KEY (code)
);

-- Table: sale_detail
CREATE TABLE sale_detail (
    clue int  NOT NULL,
    sales_id int  NOT NULL,
    product_id varchar(10)  NOT NULL,
    amount int  NOT NULL,
    price decimal(10,2)  NOT NULL,
    CONSTRAINT sale_detail_pk PRIMARY KEY (clue)
);

-- Table: sales
CREATE TABLE sales (
    sale_id int  NOT NULL,
    date date  NOT NULL,
    client_dni Varchar(8)  NOT NULL,
    final amount decimal(10,2)  NOT NULL,
    CONSTRAINT sales_pk PRIMARY KEY (sale_id)
);

-- Table: supplier
CREATE TABLE supplier (
    ruc varchar(11)  NOT NULL,
    name varchar(100)  NOT NULL,
    address varchar(100)  NOT NULL,
    phone varchar(100)  NOT NULL,
    web_page varchar(100)  NOT NULL,
    CONSTRAINT supplier_pk PRIMARY KEY (ruc)
);

-- foreign keys
-- Reference: customer_phone_customers (table: customer_phone)
ALTER TABLE customer_phone ADD CONSTRAINT customer_phone_customers FOREIGN KEY customer_phone_customers ()
    REFERENCES customers ();

-- Reference: products_category (table: products)
ALTER TABLE products ADD CONSTRAINT products_category FOREIGN KEY products_category ()
    REFERENCES category ();

-- Reference: sale_detail_products (table: sale_detail)
ALTER TABLE sale_detail ADD CONSTRAINT sale_detail_products FOREIGN KEY sale_detail_products ()
    REFERENCES products ();

-- Reference: sale_detail_sales (table: sale_detail)
ALTER TABLE sale_detail ADD CONSTRAINT sale_detail_sales FOREIGN KEY sale_detail_sales ()
    REFERENCES sales ();

-- Reference: sales_customers (table: sales)
ALTER TABLE sales ADD CONSTRAINT sales_customers FOREIGN KEY sales_customers ()
    REFERENCES customers ();

-- End of file.

