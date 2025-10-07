create database pune_bank;
use pune_bank;

create table branch(branch_name varchar(20) primary key, branch_city varchar(20), assets int(20));

insert into branch values('Akurdi','Pune',200000);
insert into branch values('Nigadi','PCMC',300000);
insert into branch values('Wakad','Pune',100000);
insert into branch values('Chinchwad','PCMC',400000);
insert into branch values('Sangavi','Pune',230000);

select * from branch;

create table account(
  acc_no int(10) primary key,
  branch_name varchar(20),
  balance int(20),
  constraint FK_S foreign key(branch_name) references branch(branch_name) on delete cascade
);

insert into account values(1001,'Akurdi',15000);
insert into account values(1002,'Nigadi',11000);
insert into account values(1003,'Chinchwad',20000);
insert into account values(1004,'Wakad',10000);
insert into account values(1005,'Akurdi',14000);
insert into account values(1006,'Nigadi',17000);

select * from account;

create table loan(
  loan_no int(20) primary key,
  branch_name varchar(20),
  amount int(20),
  constraint FK_6 foreign key(branch_name) references branch(branch_name) on delete cascade
);

insert into loan values(2001,'Akurdi',2000);
insert into loan values(2002,'Nigadi',1200);
insert into loan values(2003,'Akurdi',1400);
insert into loan values(2004,'Wakad',1350);
insert into loan values(2005,'Chinchwad',1490);
insert into loan values(2006,'Akurdi',12300);
insert into loan values(2007,'Akurdi',14000);

select * from loan;

create table customer(
  cust_name varchar(20) primary key,
  cust_street varchar(20),
  cust_city varchar(20)
);

insert into customer values('Trupti','MG road','Pune');
insert into customer values('Rutuja','JM road','Pune');
insert into customer values('Alka','Senapati road','Pune');
insert into customer values('Samiksha','Savedi road','PCMC');
insert into customer values('Mahima','Pipeline road','PCMC');
insert into customer values('Ayushi','FC road','Pune');
insert into customer values('Priti','Camp road','PCMC');

select * from customer;

create table depositor(
  cust_name varchar(20),
  acc_no integer(10),
  constraint FK_1 foreign key(cust_name) references customer(cust_name) on delete cascade,
  constraint FK_2 foreign key (acc_no) references account(acc_no) on delete cascade
);

insert into depositor values('Rutuja',1005);
insert into depositor values('Trupti',1002);
insert into depositor values('Samiksha',1004);

select * from depositor;

create table borrower(
  cust_name varchar(20),
  loan_no integer(10),
  constraint FK_3 foreign key (cust_name) references customer(cust_name) on delete cascade,
  constraint FK_4 foreign key (loan_no) references loan(loan_no) on delete cascade
);

insert into borrower values('Mahima',2005);
insert into borrower values('Trupti',2002);
insert into borrower values('Rutuja',2004);
insert into borrower values('Ayushi',2006);
insert into borrower values('Priti',2007);

select * from borrower;

#cross join
select * from borrower b, loan l;
select * from borrower b cross join loan l;

#Natural join
select * from borrower b, loan l where b.loan_no = l.loan_no;
select b.cust_name, l.loan_no, l.amount from borrower b, loan l where b.loan_no = l.loan_no;

#inner join
select b.cust_name, b.loan_no, l.amount from borrower b inner join loan l on b.loan_no = l.loan_no;
select b.cust_name from borrower b inner join loan l on b.loan_no = l.loan_no where l.branch_name = 'Akurdi' order by b.cust_name;
select branch_name, count(branch_name) from account a inner join depositor d on a.acc_no = d.acc_no group by branch_name;

#right outer join
select b.cust_name, l.loan_no, l.amount from borrower b right join loan l on b.loan_no = l.loan_no;

#left outer join
select b.cust_name, l.loan_no, l.amount from borrower b left join loan l on b.loan_no = l.loan_no;

#full join
select * from borrower b left join loan l on b.loan_no = l.loan_no
union
select * from borrower b right join loan l on b.loan_no = l.loan_no;
