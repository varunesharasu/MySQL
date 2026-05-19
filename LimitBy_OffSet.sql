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



-- Practice Question
-- 1. Display first 5 employees
select * from emp limit 5;
-- 2. Display top 3 highest paid employees
select * from emp order by sal desc limit 3;
-- 3. Display lowest 2 salary employees
select distinct sal from emp order by sal asc limit 2;
-- 4. Display the 3rd highest distinct salary from the emp table using LIMIT and OFFSET
select distinct sal from emp order by sal desc limit 1 offset 2;
-- 5. Find the 5th Highest Distinct Salary
select distinct sal from emp order by sal desc limit 1 offset 4;