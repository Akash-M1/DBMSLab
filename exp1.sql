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
create table OWNS(driverId varchar(10),regNO varchar(10),primary key(regNO),foreign key(driverId) references PERSON(driverId),foreign key(regNO) references CAR(regNO));
alter table OWNS drop foreign key owns_ibfk_2;
alter table OWNS drop primary key;
alter table OWNS add primary key(driverId,regNO);
create table PARTICIPATED(driverId varchar(25),regNO varchar(25),reportNumber int,damageAmount int, primary key(driverId,regNO,reportNumber),
	foreign key(driverId) references PERSON(driverId),
    foreign key(regNO) references CAR(regNO),
    foreign key(reportNumber) references ACCIDENT(reportNumber));

desc participated;


