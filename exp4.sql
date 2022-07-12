CREATE DATABASE stufacdb;
USE stufacdb;
CREATE TABLE student(snum int, sname varchar(25), major varchar(25), level varchar(25),age int, primary key(snum));
DESC student;
CREATE TABLE faculty(fid int, fname varchar(25), deptid int, primary key(fid));
DESC faculty;
CREATE TABLE class(name varchar(25), meetsAt time, room varchar(25), fid int,primary key(name),foreign key(fid) references faculty(fid));
DESC class; 
CREATE TABLE enrolled(snum int, cname varchar(25), primary key(snum,cname), foreign key(snum) references student(snum) ,foreign key(cname) references class(name));
DESC enrolled;

INSERT INTO student(snum,sname,major,level,age) VALUES
	(1,'Akash','Science','SR',20),
    (2,'Adarsh','Commerce','SR',20),
    (3,'Anmol','Technology','JR',21),
    (4,'Arjun','MBBS','JR',19),
    (5,'shashvat','Engineering','JR',20);
SELECT * FROM student;

INSERT INTO faculty(fid,fname,deptid) values
	(101,'Prof. Geller',1),
    (102,'Prof. Strange',3),
    (103,'Prof. Stark',5),
    (104,'Prof. Greene',7),
    (105,'Prof. Buffay',9);
SELECT * FROM faculty;
commit;

INSERT INTO class(name,meetsAt,room,fid) VALUES
	('4A','09:30:00','R124',103),
    ('4B','10:30:00','R125',104),
    ('4C','09:00:00','R126',103),
    ('4D','10:00:00','R127',101),
    ('4E','09:00:00','R128',105);
SELECT * FROM class;

INSERT INTO enrolled(snum,cname) VALUES 
	(1,'4A'),
    (3,'4B'),
    (4,'4C'),
    (5,'4D'),
    (2,'4E');
SELECT * FROM enrolled;

SELECT s.sname from student s,faculty f, enrolled e, class c
	where e.snum=s.snum And
		  e.cname=c.name AND
          c.fid=f.fid AND
          s.level='JR' AND
          f.fname='Prof. Geller';


