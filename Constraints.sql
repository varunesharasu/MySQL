create database new;
use new;
create table if not exists one(
	id int primary key auto_increment,
    one_name varchar(10) not null,
    age int check(age>=18),
    email varchar(25) unique,
    dob date
);
alter table one rename student;
alter table student rename column one_name to stu_name;
desc student;
create table if not exists dept(
	dept_id int primary key auto_increment,
    dept_name varchar(10) not null,
    id int,
    foreign key (id) references student(id)
);