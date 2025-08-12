 
--============== SQL Categories =====================
---------- Data Definition Language(DDL) -------------
--Used to define and manage database structures (tables, schemas, indexes).

--CREATE – Creates new database objects (tables, views, indexes, etc.)
--ALTER – Modifies existing objects
--DROP – Deletes objects
--TRUNCATE – Removes all rows from a table but keeps the structure
--RENAME (not in SQL Server, but in some DBs) – Renames objects

-- To Create Database:

Create Database MyCompanyDb

IF NOT EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = N'MyCompanyDb'
)
BEGIN
    CREATE DATABASE MyCompanyDb;
END

-- Select Database:
use MyCompanyDb

-- To Create Table:
Create Table Employees
(
SSN int primary key identity(1, 1),
Fname varchar(15) not null, -- Required
Lname varchar(15), -- Optional
Gender char(1),
Birthdate Date,
Dnum int,
Super_SSN int references Employees(SSN), -- Self Relationship
)

Create Table Departments
(
Dnum int primary key identity(10,10),
Dname varchar(20) not null ,
Manager_SSN int not null unique references Employees(SSN),
Hiring_Date Date 
)

Create Table Department_Locations
(
Deptnum int references Departments(Dnum),
Location varchar(30) default 'cairo',
primary key (DeptNum , Location) -- Composite Primary Key
)

Create Table Projects
(
PNum int primary key identity, 
PName varchar(50) not null,
Location varchar(20),
City varchar(20),
DeptNum int references Departments(Dnum)
)

Create table Dependants
(
Name varchar(40) ,
Birthdate date ,
Gender Char(1),
ESSN int references Employees(SSN),
primary key (Name , ESSN)
)

Create table Employee_Projects
(
ESSN int references EMPLoyees(SSN),
PNum int references Projects(Pnum),
NumOfHours tinyint,
primary key (ESSN , PNum)
)


-- 2. Alter (Update Structure)
--======================
-- Alter Database Name 
Alter Database TestDb
modify name  = MyCompanyDb

-- Alter Database Object 
--==========================
-- Alter Add [Column - Constraint]
--====================================
-- Add New Column 
Alter table Employees
add Test int 
--------------------------------------------------
-- Add Constraint 
alter table Employees 
add constraint UQ_Test unique (Test)
-------------------------------------------------------
alter table Employees 
add unique (Test)
------------------------------------------
-- Alter datatype of an existing Column
Alter Table Employees
Alter column Test bigint
------------------------------------------------------
-- Add (foreign key) references to column 
Alter Table Employees
add constraint FK_Work foreign key (Dnum) references Departments(Dnum)
 
Alter Table Employees
add foreign key (Dnum) references Departments(Dnum)
------------------------------------------------------------------------
-- Drop Column 
Alter Table Employees 
Drop column Test

-- Drop Constraint 
Alter Table Employees 
Drop Constraint UQ_Test

-- Drop (foreign key) references to column 
Alter Table Employees
drop constraint FK_Work 

-- 3. Drop
--=========

-- Drop Table 
Drop Table Employees

-- Drop Database
Drop Database MyCompanyDb
