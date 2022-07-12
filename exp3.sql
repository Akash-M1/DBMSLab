create database supplier;
use supplier;
create table SUPPLIERS(sid int,sname varchar(35),address varchar(50));
desc SUPPLIERS;
alter table SUPPLIERS add primary key(sid);
create table PARTS(pid int,pname varchar(25),color varchar(25),primary key(pid));
create table CATALOG(sid int,pid int,cost real,primary key(sid,pid),
	foreign key(sid) references SUPPLIERS(sid),
    foreign key(pid) references PARTS(pid)); 
desc CATALOG;

insert into SUPPLIERS(sid,sname,address) values
	(100,'Nestle','Delhi'),
	(101,'ITC','Bangalore'),
    (102,'Britanica','Hydrabad'),
    (103,'Wildcraft','Mumbai'),
    (104,'Milton','Jaipur');
    
select * from SUPPLIERS;

insert into PARTS(pid,pname,color) values 
	(200,'Noodles','White'),
    (201,'ToothPaste','Red'),
    (202,'Biscuts','Chocolate'),
    (203,'Bags','Black'),
    (204,'Bottles','Steel');
    
select * from PARTS;

insert into CATALOG(sid,pid,cost) values
	(100,200,500.3),
    (100,201,123.4),
    (102,202,900),
    (103,203,700.12),
    (104,204,950.23);
insert into CATALOG values(100,201,123.56); 
commit;   
select * from CATALOG;

select sname from SUPPLIERS where SUPPLIERS.sid=(select sid from catalog group by sid Having count(sid)=(select count(*) from PARTS));

select sid,count(*) from catalog group by sid;
