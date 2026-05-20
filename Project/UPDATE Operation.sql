use hotel_management;

-- Update Customer City
UPDATE Customers
SET city='Mangalore'
WHERE customer_id=3;

-- Update Room Status
UPDATE Rooms
SET room_status='Booked'
WHERE room_id=1;

-- Update Room Price
UPDATE Rooms
SET price_per_day=3500
WHERE room_id=3;

-- Update Payment Method
UPDATE Payments
SET payment_method='UPI'
WHERE payment_id=2;