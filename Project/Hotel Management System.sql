CREATE DATABASE hotel_management;
USE hotel_management;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    phone VARCHAR(15) UNIQUE,
    city VARCHAR(50)
);

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_type VARCHAR(30),
    price_per_day DECIMAL(10,2) CHECK(price_per_day > 0),
    room_status VARCHAR(20)
);