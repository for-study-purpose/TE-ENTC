show databases;

create database assign;

show databases;

use assign;

create table emp1(
  empno integer,
  ename varchar(15),
  joindate date,
  esal integer,
  primary key(empno)
);

desc emp1;

insert into emp1 values
(1, "Suresh", '2005-12-25', 4000),
(2, "Mahesh", '2020-10-14', 5000),
(3, "Ramesh", '2019-06-20', 3000);

insert into emp1 values
(4, "Shashank", '2015-10-05', 2000),
(5, "Binod", '2015-05-24', 1000),
(6, "Mohit", '2009-04-10', 300);

select * from emp1;

insert into emp1 (empno) values (11);

select * from emp1;

create table emp2(
  empno integer,
  ename varchar(15),
  joindate date,
  esal integer,
  primary key(empno)
);

show tables;

insert into emp2 select * from emp1;

select * from emp2;

select ename, joindate from emp2;

select ename, esal from emp2 where esal > 2000;

select ename, esal from emp2 where esal < 2000;

select ename, esal from emp2 where esal >= 2000;

select ename, esal from emp2 where esal <= 2000;

select distinct(esal) from emp2;

select * from emp2 order by joindate;

update emp2 set esal = 10000 where ename = "Suresh";

select * from emp2;

delete from emp2 where ename = "Suresh";

select * from emp2;

select * from emp1 where esal between 2000 and 5000;

select * from emp1 where esal not in (2000, 5000);
