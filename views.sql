use joins;

select * from emp;
select * from dept;

-- 1. Create a view with empno, ename, job, salary column
create view emp_view as select empno,ename,job,sal from emp;
-- 2. Display all the records from the view
select * from emp_view;
-- 3. Display employees whose salary is greater than 1000
select * from emp_view where sal>1000;
-- 4. Create a view with department details
create view  dept_view as select deptno,dname,loc from dept;
-- 5. Create a view only for managers
create view manager_view as select * from emp where job='manager';