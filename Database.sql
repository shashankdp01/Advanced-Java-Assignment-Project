CREATE DATABASE IF NOT EXISTS product_db;
USE product_db;


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL DEFAULT 0
);


