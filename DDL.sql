create database ddl;

use ddl;

create table employee(
	id int primary key,
    e_name varchar(20) not null,
    salary decimal(6,2)
);

alter table employee add email varchar(25);
alter table employee modify salary int;
alter table employee rename column e_name to F_name;

alter table employee rename to staff;
drop table staff;

desc staff;