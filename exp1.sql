show databases;
create database INSURANCE06;
use INSURANCE06;
show tables;
create table PERSON(driverId varchar(40), name varchar(30), address varchar(70));
create table CAR(regNO varchar(10), model varchar(20), year int);
create table ACCIDENT(reportNumber int, date date, location varchar(40));
alter table PERSON add primary key(driverId);
alter table CAR add primary key(regNO);
alter table ACCIDENT add primary key(reportNumber);
create table OWNS(driverId varchar(10),regNO varchar(10),primary key(regNO),
	foreign key(driverId) references PERSON(driverId),
    foreign key(regNO) references CAR(regNO));

alter table OWNS drop foreign key owns_ibfk_2;
alter table OWNS drop primary key;
alter table OWNS add primary key(driverId,regNO);
create table PARTICIPATED(driverId varchar(25),regNO varchar(25),reportNumber int,damageAmount int, primary key(driverId,regNO,reportNumber),
	foreign key(driverId) references PERSON(driverId),
    foreign key(regNO) references CAR(regNO),
    foreign key(reportNumber) references ACCIDENT(reportNumber));

desc participated;


insert into PERSON(driverId,name,address) values
	('100','Monica','New York'),
	('101','Ross','Ohio'),
    ('102','Joey','Italy'),
    ('103','Chandler','Los Angles');
commit;
select * from PERSON; 

insert into CAR(regNO,model,year) values
	('1905','MG Hector',2018),
    ('2627','Suzuki',2019),
    ('2637','bMW',2019),
    ('3127','Suzuki',2019);
commit;
insert into PERSON(driverId,name,address) values ('104','Rachel','New York');
insert into CAR(regNO,model,year) values ('3658','Audi',2017);
select * from CAR;

insert into ACCIDENT(reportNumber,date,location) values
	(23589,'20190115','New York'),
    (24589,'20200215','Moscow'),
    (23609,'20191231','New York'),
    (24489,'20200516','Oslo'),
    (27489,'20190815','Ohio');
select * from ACCIDENT;


insert into OWNS(driverId,regNO) values
	('102','1905'),
    ('103','2627'),
    ('102','3658'),
    ('104','3127'),
    ('103','2637');    
select * from OWNS;

insert into PARTICIPATED(driverId,regNO,reportNumber,damageAmount) values
	('102','1905',23589,26000),
    ('103','2627',24589,20000),
    ('104','3127',24489,30000),
    ('102','3658',27489,25000),
    ('102','1905',23609,27000);
select * from PARTICIPATED;

update PARTICIPATED set damageAmount=25000 where reportNumber=24489;
insert into ACCIDENT(reportNumber,date,location) values
	(26152,'20200229','Georgia');

select count(*) as Total from ACCIDENT where year(date)='2019';








