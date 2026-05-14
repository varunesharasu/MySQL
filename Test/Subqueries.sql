create database test;

use test;

CREATE TABLE IF NOT EXISTS emp (
    empno INT PRIMARY KEY,
    ename VARCHAR(20),
    job VARCHAR(20),
    mgr INT,
    hiredate DATE,
    sal DECIMAL(7, 2),
    comm DECIMAL(7, 2),
    deptno INT
);

INSERT INTO emp VALUES (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20);
INSERT INTO emp VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);
INSERT INTO emp VALUES (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30);
INSERT INTO emp VALUES (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20);
INSERT INTO emp VALUES (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30);
INSERT INTO emp VALUES (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30);
INSERT INTO emp VALUES (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10);
INSERT INTO emp VALUES (7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000, NULL, 20);
INSERT INTO emp VALUES (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10);
INSERT INTO emp VALUES (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30);
INSERT INTO emp VALUES (7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100, NULL, 20);
INSERT INTO emp VALUES (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30);
INSERT INTO emp VALUES (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20);
INSERT INTO emp VALUES (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);


CREATE TABLE IF NOT EXISTS dept (
    deptno INT PRIMARY KEY,
    dname VARCHAR(20),
    loc VARCHAR(20)
);

INSERT INTO dept VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO dept VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO dept VALUES (40, 'OPERATIONS', 'BOSTON');


-- 1. display the details of the employees, who is working in research and sales department.
select * from emp where deptno in (select deptno from dept where dname in ('research','sales'));
-- 2. display the details of the employees who's job is same as john's job.
select * from emp where job in (select job from emp where ename='jones');
-- 3. write a query to fetch the name and the job of the employees who's salary is same as martin's salary.
select ename, job from emp where sal in (select sal from emp where ename='martin');
-- 4. display the department name of the employees who's job ends with the letter 'N'.
select dname from dept where deptno in(select deptno from emp where job like '%N');
-- 5. display the employees details who's salary is greater than miller.
select * from emp where sal>(select sal from emp where ename='miller');
-- 6. display the details of the smith manager number.
select * from emp where empno in (select mgr from emp where ename='smith');
-- 7. display the name, salary of the employees who is not getting the comm
select ename, sal from emp where comm is null;	
-- 8. display the details, who don't have the reporting manager.
select * from emp where mgr is null;