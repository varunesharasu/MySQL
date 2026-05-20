use hotel_management;

-- Insert New Customer
INSERT INTO Customers(first_name,last_name,phone,city)
VALUES
('Mahesh','Naik','9871234567','Udupi');

-- Insert New Room
INSERT INTO Rooms(room_type,price_per_day,room_status)
VALUES
('Premium',6000,'Available');

-- Insert New Booking
INSERT INTO Bookings(customer_id,room_id,check_in,check_out,total_days)
VALUES
(1,3,'2026-06-01','2026-06-05',4);

-- Insert Payment
INSERT INTO Payments(booking_id,amount,payment_method,payment_date)
VALUES
(1,12000,'Card','2026-06-01');