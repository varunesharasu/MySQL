CREATE DATABASE hotel_management;
USE hotel_management;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    phone VARCHAR(15) UNIQUE,
    city VARCHAR(50)
);