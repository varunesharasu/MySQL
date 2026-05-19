-- 1. Customers Table Data
INSERT INTO Customers(first_name,last_name,phone,city)
VALUES
('Rahul','Sharma','9876543210','Bangalore'),
('Anita','Reddy','9123456780','Hyderabad'),
('Kiran','Das','9988776655','Chennai'),
('Arun','Kumar','9876501234','Mysore'),
('Sneha','Patil','9012345678','Pune'),
('Vikram','Singh','9090909090','Delhi'),
('Pooja','Nair','9345678901','Kochi'),
('Ajay','Verma','9456123789','Mumbai'),
('Divya','Iyer','9887766554','Coimbatore'),
('Rohit','Jain','9123987654','Jaipur'),
('Meena','Kapoor','9871112233','Delhi'),
('Tarun','Yadav','9000011111','Lucknow'),
('Kavya','Shetty','9988123456','Mangalore'),
('Nikhil','Gupta','9765432109','Noida'),
('Harsha','Rao','9345612789','Vijayawada'),
('Deepak','Mishra','9011223344','Bhopal'),
('Asha','Menon','9898989898','Trivandrum'),
('Varun','Joshi','9888777666','Surat'),
('Neha','Agarwal','9876549876','Kanpur'),
('Sanjay','Kulkarni','9098765432','Nagpur'),
('Priya','Bose','9123451111','Kolkata'),
('Akash','Pillai','9000099999','Kochi'),
('Ritu','Saxena','9870001111','Indore'),
('Manoj','Patel','9988771122','Ahmedabad'),
('Swathi','Krishna','9345001122','Bangalore');

-- 2. Rooms Table Data
INSERT INTO Rooms(room_type,price_per_day,room_status)
VALUES
('Standard',2000,'Available'),
('Standard',2200,'Booked'),
('Deluxe',3000,'Available'),
('Deluxe',3200,'Booked'),
('Suite',5000,'Available'),
('Suite',5500,'Booked'),
('Single',1800,'Available'),
('Double',2500,'Booked'),
('Luxury',7000,'Available'),
('Luxury',7500,'Booked');

-- 3. Staff Table Data
INSERT INTO Staff(staff_name,department,salary)
VALUES
('Ramesh','Reception',25000),
('Suresh','Cleaning',18000),
('Priya','Management',45000),
('Karthik','Security',20000),
('Lavanya','Reception',26000),
('Mohan','Kitchen',22000),
('Anjali','Management',50000),
('Ravi','Maintenance',24000);

-- 4. Bookings Table Data
INSERT INTO Bookings(customer_id,room_id,check_in,check_out,total_days)
VALUES
(1,2,'2026-05-01','2026-05-05',4),
(2,1,'2026-05-03','2026-05-06',3),
(3,3,'2026-05-04','2026-05-08',4),
(4,4,'2026-05-02','2026-05-07',5),
(5,5,'2026-05-01','2026-05-03',2),
(6,6,'2026-05-06','2026-05-09',3),
(7,7,'2026-05-08','2026-05-10',2),
(8,8,'2026-05-05','2026-05-11',6),
(9,9,'2026-05-03','2026-05-06',3),
(10,10,'2026-05-02','2026-05-04',2),
(11,1,'2026-05-07','2026-05-10',3),
(12,2,'2026-05-09','2026-05-12',3),
(13,3,'2026-05-10','2026-05-13',3),
(14,4,'2026-05-11','2026-05-15',4),
(15,5,'2026-05-12','2026-05-14',2),
(16,6,'2026-05-13','2026-05-18',5),
(17,7,'2026-05-14','2026-05-16',2),
(18,8,'2026-05-15','2026-05-20',5),
(19,9,'2026-05-16','2026-05-18',2),
(20,10,'2026-05-17','2026-05-22',5),
(21,1,'2026-05-18','2026-05-21',3),
(22,2,'2026-05-19','2026-05-23',4),
(23,3,'2026-05-20','2026-05-25',5),
(24,4,'2026-05-21','2026-05-24',3),
(25,5,'2026-05-22','2026-05-26',4);

-- 5. Payments Table Data
INSERT INTO Payments(booking_id,amount,payment_method,payment_date)
VALUES
(1,12000,'Card','2026-05-01'),
(2,6000,'UPI','2026-05-03'),
(3,12000,'Cash','2026-05-04'),
(4,16000,'Card','2026-05-02'),
(5,10000,'UPI','2026-05-01'),
(6,16500,'Card','2026-05-06'),
(7,3600,'Cash','2026-05-08'),
(8,15000,'UPI','2026-05-05'),
(9,21000,'Card','2026-05-03'),
(10,15000,'Cash','2026-05-02'),
(11,6000,'UPI','2026-05-07'),
(12,8800,'Card','2026-05-09'),
(13,9000,'Cash','2026-05-10'),
(14,12800,'UPI','2026-05-11'),
(15,10000,'Card','2026-05-12'),
(16,27500,'Cash','2026-05-13'),
(17,3600,'UPI','2026-05-14'),
(18,12500,'Card','2026-05-15'),
(19,14000,'Cash','2026-05-16'),
(20,37500,'UPI','2026-05-17'),
(21,6000,'Card','2026-05-18'),
(22,8800,'Cash','2026-05-19'),
(23,15000,'UPI','2026-05-20'),
(24,9600,'Card','2026-05-21'),
(25,20000,'Cash','2026-05-22');

-- Bookings
select * from bookings;
-- Deleted dublicate values
WITH cte AS (
    SELECT 
        booking_id,
        ROW_NUMBER() OVER (
            PARTITION BY 
                customer_id,
                room_id,
                check_in,
                check_out,
                total_days
            ORDER BY booking_id
        ) AS rn
    FROM bookings
)

DELETE FROM bookings
WHERE booking_id IN (
    SELECT booking_id
    FROM cte
    WHERE rn > 1
);

-- 