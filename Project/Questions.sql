use hotel_management;

-- 1. Write a query to create a Rooms table using suitable data types for room_id, room_type, price_per_day, and room_status. Implement primary key and check constraint so price must be greater than 0.
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_type VARCHAR(30) NOT NULL,
    price_per_day DECIMAL(10,2) CHECK(price_per_day > 0),
    room_status VARCHAR(20)
);

-- Write a query to display customers who booked rooms between room IDs 1 and 5 using Customers and Bookings tables.
SELECT c.first_name,
       c.last_name,
       b.room_id
FROM Customers c
INNER JOIN Bookings b
ON c.customer_id = b.customer_id
WHERE b.room_id BETWEEN 1 AND 5;

-- 3. Write a query to identify total payments and total revenue from the Payments table.
SELECT COUNT(payment_id) AS total_payments,
       SUM(amount) AS total_revenue
FROM Payments;

-- 4. Write a query to display the full name of customers using CONCAT function.
SELECT CONCAT(first_name,' ',last_name) AS full_name
FROM Customers;

-- 5. Write a query to display customers who have booked rooms using Customers and Bookings tables.
SELECT DISTINCT c.customer_id,
       c.first_name,
       c.last_name
FROM Customers c
INNER JOIN Bookings b
ON c.customer_id=b.customer_id
ORDER BY c.customer_id;

-- 6. Write a query to identify customer first name and last name who paid using UPI.
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       p.payment_method
FROM Customers c
JOIN Bookings b
ON c.customer_id=b.customer_id
JOIN Payments p
ON b.booking_id=p.booking_id
WHERE p.payment_method='UPI';

-- 7. Write a query to identify customers who booked Deluxe rooms using GROUP BY and HAVING clause.
SELECT c.customer_id,
       c.first_name,
       r.room_type
FROM Customers c
JOIN Bookings b
ON c.customer_id=b.customer_id
JOIN Rooms r
ON b.room_id=r.room_id
GROUP BY c.customer_id,c.first_name,r.room_type
HAVING r.room_type='Deluxe';

-- 8. Write a query to identify whether hotel revenue crossed 100000 using IF clause.
SELECT SUM(amount) AS total_revenue,
IF(SUM(amount)>100000,
'Revenue Crossed 100000',
'Revenue Below 100000') AS revenue_status
FROM Payments;

-- 9. Write a query to create and grant access to a new database user.
CREATE USER 'hoteladmin'@'localhost'
IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES
ON *.* TO 'hoteladmin'@'localhost'
WITH GRANT OPTION;

-- 10. Write a query to find maximum room price for each room type.
SELECT room_type,
MAX(price_per_day) AS max_price
FROM Rooms
GROUP BY room_type;

-- 11. Write a query to improve search speed for Bookings table using INDEX.
CREATE INDEX idx_room_id
ON Bookings(room_id);

SELECT * FROM Bookings
WHERE room_id=4;

-- 12. Write a query to display execution plan for Bookings table.
EXPLAIN
SELECT * FROM Bookings
WHERE room_id=4;

-- 13. Write a query to calculate total payment by payment method using ROLLUP.
SELECT payment_method,
SUM(amount) AS total_payment
FROM Payments
GROUP BY payment_method WITH ROLLUP;

-- 14. Write a query to create a view containing only luxury rooms.
CREATE VIEW luxury_rooms AS
SELECT room_id,
       room_type,
       price_per_day
FROM Rooms
WHERE price_per_day > 5000;

SELECT * FROM luxury_rooms;

-- 15. Write a query to create a stored procedure that displays bookings between customer ID ranges.
DELIMITER //

CREATE PROCEDURE booking_range(
IN start_id INT,
IN end_id INT
)
BEGIN

SELECT c.first_name,
       b.booking_id,
       r.room_type
FROM Customers c
JOIN Bookings b
ON c.customer_id=b.customer_id
JOIN Rooms r
ON b.room_id=r.room_id
WHERE c.customer_id BETWEEN start_id AND end_id;

END //

DELIMITER ;

CALL booking_range(1,10);

-- 16. Write a stored procedure to display rooms whose price is greater than 3000.
DELIMITER //

CREATE PROCEDURE premium_rooms()
BEGIN

SELECT *
FROM Rooms
WHERE price_per_day > 3000;

END //

DELIMITER ;

CALL premium_rooms();

-- 17. Write a query to categorize rooms into Budget, Standard, and Luxury categories.
SELECT room_id,
       room_type,
       price_per_day,

CASE
WHEN price_per_day <= 2000
THEN 'Budget Room'

WHEN price_per_day > 5000
THEN 'Luxury Room'

ELSE 'Standard Room'

END AS room_category

FROM Rooms;

-- 18. Write a query to extract customers whose last name ends with 'a'.
SELECT *
FROM Customers
WHERE last_name LIKE '%a';

-- 19. Write a query to display top 5 highest payments. 
SELECT *
FROM Payments
ORDER BY amount DESC
LIMIT 5;

-- 20. Write a query to display customer records using LIMIT and OFFSET.
SELECT *
FROM Customers
LIMIT 5 OFFSET 5;
