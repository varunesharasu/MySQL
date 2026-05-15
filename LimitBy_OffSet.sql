use joins;
select * from emp;
select * from dept;

-- 1. Fetch top 5 highest salaries of employees
select * from emp order by sal desc limit 5;
-- 2. Fetch the 3rd highest salary
select distinct sal from emp order by sal desc limit 3 offset 2;
-- 3. Fetch the first 3 lowest salaries
select distinct sal from emp order by sal asc limit 3 offset 2;
-- 4. Find the nth highest salary
select * from emp limit 10 offset 8;