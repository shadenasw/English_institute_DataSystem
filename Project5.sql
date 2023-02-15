--creation

--Aryam table 
DROP TABLE Teacher CASCADE CONSTRAINTS;
--create table and write the properties
CREATE TABLE Teacher (
SSN NUMBER(9),
FName VARCHAR2(15),
LName VARCHAR2(15),
Phone_num NUMBER(10),
Email VARCHAR2 (20),
CONSTRAINTS Teacher_pk PRIMARY KEY (SSN));

--Shaden table
DROP TABLE Student CASCADE CONSTRAINTS;
create table Student(
ID NUMBER(10),
Phone_num NUMBER(10),
Email CHAR(30),
Name CHAR(10),
DOB DATE,
CONSTRAINTS SPK PRIMARY KEY(ID));

--Abrar table
Drop table Program CASCADE CONSTRAINTS;
CREATE TABLE Program (
Program_ID CHAR	(4),
Program_name VARCHAR2(50),
Fees NUMBER(4),
Duration NUMBER(3),
Start_date DATE,
Leveel NUMBER(2),
CONSTRAINTS program_pk PRIMARY KEY(Program_ID));

--Sara table
Drop TABLE Exam CASCADE CONSTRAINTS;
CREATE TABLE Exam(
Exam_name VARCHAR2 (15),
Score NUMBER (3) NOT NULL,
Time_Exam TIMESTAMP,
Date_Exam DATE,
CONSTRAINTS name_pk PRIMARY KEY (Exam_name));

--Bashayer table
DROP TABLE Course CASCADE CONSTRAINTS;
CREATE TABLE Course(
Course_id CHAR(5),
Typee VARCHAR2(15),
Course_name VARCHAR2(15),
program_id CHAR (4),
CONSTRAINTS Course_pk PRIMARY KEY(Course_id),
CONSTRAINTS CFK FOREIGN KEY(program_id) REFERENCES Program(Program_ID));

--Bashayer table2
DROP TABLE CourseT CASCADE CONSTRAINTS;
CREATE TABLE CourseT(
Day_Timee DATE,
Course_id CHAR(5),
CONSTRAINTS CourseT_PK PRIMARY KEY(Day_Timee,Course_id),
CONSTRAINTS CourseT_fk FOREIGN KEY(Course_id) REFERENCES Course(Course_id));

--Aryam table2
DROP TABLE Teach CASCADE CONSTRAINTS;
--create table and write the properties
CREATE TABLE Teach(
SSN NUMBER(9),
Course_id CHAR(5),
CONSTRAINTS Teach_pk PRIMARY KEY(SSN,Course_id),
CONSTRAINTS Teach_fk1 FOREIGN KEY(SSN) REFERENCES Teacher (SSN),
CONSTRAINTS Teach_fk2 FOREIGN KEY(Course_id) REFERENCES Course(Course_id));

--Sara table2
DROP TABLE Taking_Exam CASCADE CONSTRAINTS;
CREATE TABLE Taking_Exam(
Exam_name VARCHAR2(15),
ID NUMBER(10),
Result NUMBER(3) NOT NULL,
CONSTRAINTS ID_PK PRIMARY KEY(Exam_name,ID),
CONSTRAINTS Taking_FK FOREIGN KEY(Exam_name)REFERENCES Exam(Exam_name),
CONSTRAINTS Taking_FK2 FOREIGN KEY(ID)REFERENCES Student(ID));

--Shaden table2
DROP TABLE Register CASCADE CONSTRAINTS;
create table  Register(
ID NUMBER(10),
Program_id CHAR(4),
CONSTRAINTS RPK PRIMARY KEY(ID,Program_ID),
CONSTRAINTS RFk1 FOREIGN KEY(ID) REFERENCES Student(ID),
CONSTRAINTS RFk2 FOREIGN KEY(Program_id) REFERENCES Program(Program_id));

--insertion

INSERT INTO Teacher VALUES (443007248,'Aryam','Alanazi',0553000000,'aryam@gmail.com');
INSERT INTO Teacher VALUES (443001111,'sara','Alqahtani',0503000000,'sara@gmail.com');
INSERT INTO Teacher VALUES (443001112,'Abrar','Aldayel',0508000000,'abrar@gmail.com');


INSERT INTO Student VALUES(443006333,0534882805,'shaden.wasaidi@gmail.com','Shaden','08/8/2003');
INSERT INTO Student VALUES(443006111,0534222805,'layan.wasaidi@gmail.com','Layan','08/8/2004');
INSERT INTO Student VALUES(443006555,0505216669,'fatmah.ahmad@gmail.com','Fatmah','01/12/1999');

Insert into program values('P111','English for beginners',700,90 ,'26/10/2022',1);
Insert into program values ('P211','English for intermediate',600,90,'16/9/2022',2);
Insert into program values ('P311','English for advanced',300,30 ,'20/7/2022',3);

INSERT INTO Exam VALUES('APTIS',100,TO_TIMESTAMP('04:25','HH24;MI'),'01/12/2021');
INSERT INTO Exam VALUES('IELITS',9,TO_TIMESTAMP('10:30','HH24;MI'),'23/11/2021');
INSERT INTO Exam VALUES('TOFEL',12,TO_TIMESTAMP('05:18','HH24;MI'),'12/9/2021');

INSERT INTO Course VALUES('12Q4','Beginner','LEVEL1','P111');
INSERT INTO Course VALUES('12Q5','Intermediate','LEVEL2','P211');
INSERT INTO Course VALUES('12Q6','High','LEVEL3','P311');

INSERT INTO CourseT VALUES('24/11/2021','12Q4');
INSERT INTO CourseT VALUES('29/11/2021','12Q5');
INSERT INTO CourseT VALUES('01/12/2021','12Q6');

INSERT INTO Taking_Exam VALUES('APTIS',443006333,99);
INSERT INTO Taking_Exam VALUES('IELITS',443006111,8);
INSERT INTO Taking_Exam VALUES('APTIS',443006555,85);


INSERT INTO Register VALUES(443006333,'P111');
INSERT INTO Register VALUES(443006111,'P211');
INSERT INTO Register VALUES(443006555,'P311');

--Q1 PART1 by Bashayer
SELECT ID FROM Taking_Exam
WHERE Result=8 AND Exam_name ='IELITS';

--Q2 PART1 by Aryam
SELECT * FROM Teacher 
WHERE FName LIKE '___a';

--Q3 PART1 BY Aryam
 SELECT Exam_name, Score FROM Exam 
 WHERE Exam_name IN ('IELITS','APTIS');
 
--Q4 PART2 by sara
SELECT DOB ,COUNT (*) FROM Student 
GROUP BY DOB; 

--Q5 PART2 by Abrar (list the sum of fees for each duration having more than 1000 fees.)
SELECT Duration, SUM(Fees) 
FROM Program
GROUP BY Duration
HAVING SUM(Fees)>1000;

--Q6 PART2 by Shaden 
SELECT MIN(Result),MAX(Result),AVG(Result) FROM Taking_Exam
WHERE Exam_name ='APTIS';