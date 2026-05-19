CREATE DATABASE hotel_management;
USE hotel_management;

-- 1. Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    phone VARCHAR(15) UNIQUE,
    city VARCHAR(50)
);

-- 2. Rooms Table
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_type VARCHAR(30),
    price_per_day DECIMAL(10,2) CHECK(price_per_day > 0),
    room_status VARCHAR(20)
);

-- 3. Staff Table
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- 4. Bookings Table
-- (Main connecting table)
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    total_days INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

-- 5. Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount DECIMAL(10,2),
    payment_method VARCHAR(30),
    payment_date DATE,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);