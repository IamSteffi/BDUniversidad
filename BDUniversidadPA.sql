-- Procedimientos Almacenados
-- Steffi Becerra Tapia
-- 08/08/2022

-- PA para TEscuela
use BDUniversidad
go
------------------------
-------Listar Escuela
------------------------
if OBJECT_ID('spListarEscuela') is not null
	drop proc spListarEscuela
go
--
create proc spListarEscuela
as
begin
	select CodEscuela, Escuela, Facultad from TEscuela

end
go
--
exec spListarEscuela
go
------------------------
-------Agregar Escuela
------------------------
if OBJECT_ID('spAgregarEscuela') is not null
	drop proc spAgregarEscuela
go
--
create proc spAgregarEscuela
@CodEscuela char(3), @Escuela varchar(50), @Facultad varchar(50)
as
begin
	--CodEscuela no puede ser duplicado
	if not exists (select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
	--Escuela no puede ser duplicado
		if not exists (select Escuela from TEscuela where Escuela=@Escuela)
			begin
				insert into TEscuela values (@CodEscuela, @Escuela, @Facultad)
				select CodError = 0, Mensaje = 'Se inserto correctamente Escuela'
			end
		else select CodError = 1, Mensaje = 'Error: Escuela duplicada'
	else select CodError = 1, Mensaje = 'Error: CodEscuela duplicado'

end
go
--
exec spAgregarEscuela'E05','Electrica','Ingenieria'
go
------------------------
-------Eliminar Escuela
------------------------

------------------------
-------Actualizar Escuela
------------------------

------------------------
-------Buscar Escuela
------------------------

---------------------------------------------------------

------------------------
-------Listar Alumno
------------------------
if OBJECT_ID('spListarAlumno') is not null
	drop proc spListarAlumno
go
--
create proc spListarAlumno
as
begin
	select CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela from TAlumno

end
go
--
exec spListarAlumno
go
------------------------
-------Agregar Alumno(x)
------------------------
if OBJECT_ID('spAgregarAlumno') is not null
	drop proc spAgregarAlumno
go
--
create proc spAgregarAlumno
@CodAlumno char(5),@Apellidos varchar(50),@Nombres varchar(50),@LugarNac varchar(50),@FechaNac datetime,@CodEscuela char(3)
as
begin
	--CodAlumno no puede ser duplicado
	if not exists (select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
	--Escuela no puede ser duplicado
		if not exists (select CodEscuela from TAlumno where CodEscuela=@CodEscuela)
			begin
				insert into TEscuela values (@CodEscuela, @Escuela, @Facultad)
				select CodError = 0, Mensaje = 'Se inserto correctamente Escuela'
			end
		else select CodError = 1, Mensaje = 'Error: Escuela duplicada'
	else select CodError = 1, Mensaje = 'Error: CodAlumno duplicado'

end
go
--
exec spAgregarEscuela'E05','Electrica','Ingenieria'
go
------------------------
-------Eliminar Alumno
------------------------

------------------------
-------Actualizar Alumno
------------------------

------------------------
-------Buscar Alumno
------------------------