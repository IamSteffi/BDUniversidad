-- Base de datos Universidad
-- Steffi Becerra Tapia
-- 08/08/2022

use master 
go
-----------------------
if DB_ID('BDUniversidad') is not null
	drop database BDUniversidad
go
create database BDUniversidad
go
------------------------
use  BDUniversidad
go 

-- crear tablas
------------------------
if OBJECT_ID('TEscuela') is not null
	drop table TEscuela
go
create table TEscuela
(
	CodEscuela char(3) primary key,
	Escuela varchar(50),
	Facultad varchar(50)
)
go
------------------------
if OBJECT_ID('TAlumno') is not null
	drop table TAlumno
go
create table TAlumno
(
	CodAlumno char(5) primary key,
	Apellidos varchar(50),
	Nombres varchar(50),
	LugarNac varchar(50),
	FechaNac datetime,
	CodEscuela char(3),
	foreign key (CodEscuela) references TEscuela
)
go
------------------------
--Insercion de datos
insert into TEscuela values('E01','Sistemas','Ingenieria')
insert into TEscuela values('E02','Civil','Ingenieria')
insert into TEscuela values('E03','Industrial','Ingenieria')
insert into TEscuela values('E04','Ambiental','Ingenieria')
insert into TEscuela values('E05','Arquitectura','Ingenieria')
go

------------------------
select * from TEscuela
go
------------------------

------------------------
--Insercion de datos
insert into TAlumno values('A0001','Guevara Martinez','Benjamin','Cusco','2021-01-05 00:00:00','E01')

go

------------------------
select * from TEscuela
go
------------------------