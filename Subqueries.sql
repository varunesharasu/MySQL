CREATE DATABASE company_db;

USE company_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT,
    hire_date DATE
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    emp_id INT,
    budget DECIMAL(12,2),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO employees VALUES
(1, 'Amit', 'HR', 50000, NULL, '2021-01-15'),
(2, 'Sneha', 'IT', 75000, 1, '2020-03-10'),
(3, 'Rahul', 'Finance', 65000, 1, '2019-07-22'),
(4, 'Priya', 'IT', 85000, 2, '2018-11-05'),
(5, 'Karan', 'Sales', 45000, 1, '2022-06-18'),
(6, 'Neha', 'Finance', 70000, 3, '2020-09-30'),
(7, 'Arjun', 'IT', 95000, 2, '2017-04-12'),
(8, 'Meera', 'Sales', 55000, 5, '2021-12-01');

INSERT INTO projects VALUES
(101, 'Payroll System', 2, 200000),
(102, 'Website Redesign', 4, 150000),
(103, 'Sales Dashboard', 5, 120000),
(104, 'Audit Automation', 6, 180000),
(105, 'Cloud Migration', 7, 300000),
(106, 'Recruitment Portal', 1, 100000),
(107, 'Finance Tracker', 3, 170000);

SELECT * FROM employees;

SELECT * FROM projects;
-- 1. Employees earning more than average salary
select * from employees where salary > (select avg(salary) from employees);
-- 2. Employee with highest salary
select * from employees where salary = (select max(salary) from employees);
-- 3. Employees working on projects with budget > 150000
select * from employees where emp_id in (select emp_id from projects where budget>150000);
-- 4. Employees earning more than all Sales department employees
select * from employees where salary > all (select salary from employees where department='sales');
-- 5. Find employees who are managers
select * from employees where emp_id in(select distinct(manager_id) from employees where manager_id is not null);
-- 6. Departments having average salary greater than overall average salary
select * from employees where department > (select avg(salary) from employees);
-- 7. Second highest salary
select max(salary) from employees where salary < (select max(salary) from employees);
-- 8. Employees who work on the project with highest budget
select * from employees where emp_id = (select emp_id from projects where budget=(select max(budget) from projects));
-- 9. Employees not assigned to any project
select * from employees where emp_id in (select emp_id from projects);