use joins;
select * from emp;
select * from dept;

-- 1. Display the employee name, department name, and annual salary of employee SMITH who is working in department 20
select e.ename,d.dname,(e.sal*12) from emp e , dept d where d.deptno=e.deptno and e.ename='smith' and e.deptno=20;
-- 2. Fetch employee name, half of their salary, along with department information of all employees
select e.ename, (e.sal/2), d.deptno, d.dname,d.loc from emp e, dept d where e.deptno=d.deptno;
-- 3. Fetch employee details along with department name and location of employees who are getting salary more than 1500
select e.ename,e.empno,e.job,e.mgr,e.hiredate,e.sal,e.comm,e.deptno, d.dname, d.loc from emp e, dept d where d.deptno=e.deptno and e.sal>1500;