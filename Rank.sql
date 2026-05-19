use demo;

-- 1. Find 7th highest salary
-- Limit offset
select * from emp order by sal limit 1 offset 6;
-- Rank
select * from(select ename, empno,sal, rank() over (order by sal desc) as rank1 from emp) x where rank1=7;
-- 2. Find top 3 salaries of each department
select * from(select ename, empno, sal, job, dense_rank() over (partition by deptno order by sal desc) as rank1 from emp ) x where rank1<=3;
-- 3. Find top 2 salaries of emp table
SELECT * FROM ( SELECT empno,ename,sal,DENSE_RANK() OVER (ORDER BY sal DESC) AS rnk FROM emp) x WHERE rnk <= 2;
-- 4. Find department-wise highest salary
SELECT *
FROM (ELECT empno,ename,deptno,sal,RANK() OVER (ORDER BY sal DESC) AS rnk FROM emp) x WHERE rnk = 1;