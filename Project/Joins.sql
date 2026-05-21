use hotel_management;

-- 1. INNER JOIN
-- Customer Booking Details
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       r.room_type,
       b.check_in,
       b.check_out
FROM Customers c
INNER JOIN Bookings b
ON c.customer_id = b.customer_id
INNER JOIN Rooms r
ON b.room_id = r.room_id;

-- 2. LEFT JOIN
-- Displays all customers even if they don't have bookings.
SELECT c.customer_id,
       c.first_name,
       b.booking_id
FROM Customers c
LEFT JOIN Bookings b
ON c.customer_id = b.customer_id;

-- 3. RIGHT JOIN
-- Displays all bookings even if customer data is missing.
SELECT c.first_name,
       b.booking_id
FROM Customers c
RIGHT JOIN Bookings b
ON c.customer_id = b.customer_id;

-- 4. JOIN with Payments
-- Display payment details of customers.
SELECT c.first_name,
       c.last_name,
       p.amount,
       p.payment_method
FROM Customers c
JOIN Bookings b
ON c.customer_id=b.customer_id
JOIN Payments p
ON b.booking_id=p.booking_id;

-- 5. Multiple Table JOIN
-- (Customer + Booking + Room + Payment)
SELECT c.first_name,
       c.last_name,
       r.room_type,
       r.price_per_day,
       p.amount,
       p.payment_method
FROM Customers c
JOIN Bookings b
ON c.customer_id=b.customer_id
JOIN Rooms r
ON b.room_id=r.room_id
JOIN Payments p
ON b.booking_id=p.booking_id;

-- 6. SELF JOIN
-- Compare customers from same city.
SELECT A.first_name AS Customer1,
       B.first_name AS Customer2,
       A.city
FROM Customers A
JOIN Customers B
ON A.city = B.city
AND A.customer_id <> B.customer_id;

-- 7. CROSS JOIN
-- Combines every customer with every room.
SELECT c.first_name,
       r.room_type
FROM Customers c
CROSS JOIN Rooms r;

-- 8. JOIN with WHERE Clause
-- Customers who booked Luxury rooms.
SELECT c.first_name,
       r.room_type
FROM Customers c
JOIN Bookings b
ON c.customer_id=b.customer_id
JOIN Rooms r
ON b.room_id=r.room_id
WHERE r.room_type='Luxury';

-- 9. JOIN with ORDER BY
SELECT c.first_name,
       r.room_type,
       p.amount
FROM Customers c
JOIN Bookings b
ON c.customer_id=b.customer_id
JOIN Rooms r
ON b.room_id=r.room_id
JOIN Payments p
ON b.booking_id=p.booking_id
ORDER BY p.amount DESC;

-- 10. JOIN with GROUP BY
-- Total payment by each customer.
SELECT c.first_name,
       SUM(p.amount) AS total_payment
FROM Customers c
JOIN Bookings b
ON c.customer_id=b.customer_id
JOIN Payments p
ON b.booking_id=p.booking_id
GROUP BY c.first_name;

-- 11. JOIN with HAVING
-- Customers whose payment exceeds 15000.
SELECT c.first_name,
       SUM(p.amount) AS total_payment
FROM Customers c
JOIN Bookings b
ON c.customer_id=b.customer_id
JOIN Payments p
ON b.booking_id=p.booking_id
GROUP BY c.first_name
HAVING SUM(p.amount) > 15000;

-- 12. JOIN with LIMIT
-- Top 5 highest payments.
SELECT c.first_name,
       p.amount
FROM Customers c
JOIN Bookings b
ON c.customer_id=b.customer_id
JOIN Payments p
ON b.booking_id=p.booking_id
ORDER BY p.amount DESC
LIMIT 5;

-- 13. JOIN with OFFSET
SELECT c.first_name,
       p.amount
FROM Customers c
JOIN Bookings b
ON c.customer_id=b.customer_id
JOIN Payments p
ON b.booking_id=p.booking_id
LIMIT 5 OFFSET 5;

