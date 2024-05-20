USE [master]

GO
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'TPS')
	DROP DATABASE TPS
GO
CREATE DATABASE TPS

GO
USE TPS
GO



Create table [Users] (
userID int IDENTITY (1,1) PRIMARY KEY(userID),
lastName nvarchar(50),
firstName nvarchar(50),
password nvarchar(50),
image nvarchar(50),
gender bit,
dob date,
phone nvarchar(12),
email nvarchar(50),
address nvarchar(200),
status int,
createDate date,
role int);

select * from Users

--drop table

insert into Users (lastName,firstName,password,image,gender,dob,phone,email,address,status,createDate,role) Values
('admin','system','202cb962ac59075b964b07152d234b70','none',1,'2024/05/15','123456789','admin@gmail.com','hola',1,'2024/05/15',0);

insert into Users (lastName,firstName,password,image,gender,dob,phone,email,address,status,createDate,role) Values
('admin','system','202cb962ac59075b964b07152d234b70','none',1,'2024/05/15','123456789','nguyenquangbich0@gmail.com','hola',1,'2024/05/15',0);