use hotel_management;

-- 1. CONCAT()
-- Full Customer Name
SELECT CONCAT(first_name,' ',last_name) AS full_name
FROM Customers;

-- 2. UPPER()
-- Converts to uppercase.
SELECT UPPER(first_name) AS upper_name
FROM Customers;

-- 3. LOWER()
-- Converts to lowercase.
SELECT LOWER(city) AS lower_city
FROM Customers;

-- 4. LENGTH()
-- Counts characters.
SELECT first_name,
LENGTH(first_name) AS name_length
FROM Customers;

-- 5. SUBSTRING()
-- Extract part of string.
SELECT first_name,
SUBSTRING(first_name,1,3) AS short_name
FROM Customers;

-- 6. NOW()
-- Shows current date and time.
SELECT NOW();