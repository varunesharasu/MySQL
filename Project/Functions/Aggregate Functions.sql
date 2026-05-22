use hotel_management;

-- 1. COUNT()
-- Total Customers
SELECT COUNT(*) AS total_customers
FROM Customers;

-- Total Rooms
SELECT COUNT(*) AS total_rooms
FROM Rooms;

-- 2. SUM()
-- Total Revenue
SELECT SUM(amount) AS total_revenue
FROM Payments;

-- Total Salary Paid to Staff
SELECT SUM(salary) AS total_salary
FROM Staff;

-- 3. AVG()
-- Average Room Price
SELECT AVG(price_per_day) AS average_room_price
FROM Rooms;

-- Average Staff Salary
SELECT AVG(salary) AS average_salary
FROM Staff;

-- 4. MAX()
-- Highest Room Price
SELECT MAX(price_per_day) AS highest_room_price
FROM Rooms;

-- Highest Payment
SELECT MAX(amount) AS highest_payment
FROM Payments;

-- 5. MIN()
-- Lowest Room Price
SELECT MIN(price_per_day) AS lowest_room_price
FROM Rooms;

-- Lowest Salary
SELECT MIN(salary) AS lowest_salary
FROM Staff;

-- 6. GROUP BY
-- Revenue by Payment Method
SELECT payment_method,
SUM(amount) AS total_revenue
FROM Payments
GROUP BY payment_method;

-- Number of Rooms by Status
SELECT room_status,
COUNT(*) AS total_rooms
FROM Rooms
GROUP BY room_status;

-- 7. HAVING
-- Payment Methods with Revenue > 20000
SELECT payment_method,
SUM(amount) AS total_amount
FROM Payments
GROUP BY payment_method
HAVING SUM(amount) > 20000;