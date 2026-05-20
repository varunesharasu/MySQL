use hotel_management;

-- Delete Customer
DELETE FROM Customers
WHERE customer_id=26;

-- Delete Booking
DELETE FROM Payments
WHERE booking_id = 5;

-- Delete Payment Record
DELETE FROM Payments
WHERE payment_id=3;