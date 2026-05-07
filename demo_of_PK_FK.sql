create database demo;
use demo;
create table dept(
	did int primary key,
    dname varchar(20)
);
desc dept;

create table student(
	sid int auto_increment primary key,
    sname varchar(25),
    did int,
    foreign key(did) references dept(did)
);
desc student;

insert into dept values(2,'cse');

select * from dept;

insert into student(sname,did) values('varunesh',1),
('pranesh',1),
('yukesh',2);

select * from student;
insert into dept values(3,'ece');
insert into student(sname,did) values('siva',3);