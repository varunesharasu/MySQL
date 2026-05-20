use hotel_management;

-- Read All Customers
SELECT * FROM Customers;

-- Read All Rooms
SELECT * FROM Rooms;

-- Read Specific Customer
SELECT * FROM Customers
WHERE customer_id = 5;

-- Read Available Rooms
SELECT * FROM Rooms
WHERE room_status='Available';

-- Read Booking Details using JOIN
SELECT c.first_name,
       c.last_name,
       r.room_type,
       b.check_in,
       b.check_out
FROM Customers c
JOIN Bookings b
ON c.customer_id=b.customer_id
JOIN Rooms r
ON b.room_id=r.room_id;
