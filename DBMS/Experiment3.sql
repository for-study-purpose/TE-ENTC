create database bank; 
use bank;
create table account(acc_no int(10) primary key ,branch_name varchar(20), balance int(20)); 
insert into account values( 1001,'Akurdi', 15000+1000);
insert into account values( 1002,'Nigdi', 11000-500); 
insert into account values( 1003,'Chinchwad',20000*2); 
insert into account values( 1004,'Wakad', 10000/100); 
insert into account values( 1005,'Akurdi', 14000*2); 
insert into account values( 1006,'Nigdi', 17000);
select * from account;

select acc_no, balance+1000 from account;

select acc_no, balance-1000 from account;

select acc_no, balance*1000 from account;

select acc_no, balance/1000 from account;

select * from account where balance<20000 ;

select * from account where balance>15000;

select * from account where balance <= 20000;

select * from account where balance>= 20000;

select * from account where balance != 20000;

select * from account where balance<20000 AND branch_name = 'Akurdi';

select * from account where balance<20000 OR branch_name = 'Akurdi';

select * from account where balance<20000 OR NOT branch_name = 'Akurdi';

select * from account where NOT branch_name = 'Akurdi';

#Find the branches where average account balance >12000.
select branch_name from account group by branch_name having avg(balance)>12000;

select Avg(balance) from account;

select count(balance) from account;

select MAX(balance) from account;

select MIN(balance) from account;

select SUM(balance) from account;

SELECT UCASE(branch_name) FROM account;

SELECT LCASE(branch_name) FROM account;

SELECT MID(branch_name,1,2) FROM account;

SELECT LENGTH(branch_name) FROM account;

SELECT ROUND(balance) FROM account;

select round(5.4);

select round(5.611,2);

SELECT * FROM account WHERE branch_name LIKE 'ak%';

SELECT * FROM account WHERE branch_name LIKE '%d%';

SELECT * FROM account WHERE branch_name LIKE '%di';

#Q.Display the accounts from Akrudi and Nigdi branch
select * from account where branch_name in('Akrudi','Nigdi');

#Q.Display the account details having balance between 15000 and 20000 select * from account where balance between 15000 and 20000;
create index id1 on account (acc_no); 
show indexes from account;

#update
SET SQL_SAFE_UPDATES=0;
update account set balance ='20000';
update account set balance='30000' where acc_no=1001; 
select * from account;
alter table account add(loan varchar(10));
update account set loan =10000 where acc_no=1001; 
update account set loan =20000 where acc_no=1002; 
update account set loan =30000 where acc_no=1003; 
update account set loan =40000 where acc_no=1004; 
update account set loan =25000 where acc_no=1005; 
update account set loan =60000 where acc_no=1006; 
select * from account;

#Q14. DELETE all loans with loan amount between 10000 and 40000.
delete from account where loan>10000 and loan<40000; 
select * from account;

#Q15. DELETE all loans at every branch located in Nigdi. delete from account where branch_name='Nigdi';
select * from account;