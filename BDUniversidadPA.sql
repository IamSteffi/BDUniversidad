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
if OBJECT_ID('spEliminarEscuela') is not null
	drop proc spEliminarEscuela
go
--
create proc spEliminarEscuela
@CodEscuela char(3)
as
begin
	--No puede Eliminar escuela no existente
	if exists (select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		begin
			delete from TEscuela WHERE CodEscuela=@CodEscuela
			select CodError = 0, Mensaje = 'Se elimino la Escuela seleccionada'
		end
	else select CodError = 1, Mensaje = 'Error: CodEscuela no existe '
end
go
--
exec spEliminarEscuela 'E05'
go
DROP PROCEDURE spEliminarEscuela
------------------------
-------Actualizar Escuela
------------------------
if OBJECT_ID('spActualizarEscuela') is not null
	drop proc spActualizarEscuela
go
--
create proc spActualizarEscuela
@CodEscuela char(3), @Escuela varchar(50), @Facultad varchar(50)
as
begin
	--No puede Actualizar escuela si no existente
	if exists (select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		begin
			update TEscuela set Escuela=@Escuela, Facultad=@Facultad where CodEscuela=@CodEscuela
			select CodError = 0, Mensaje = 'Se modifico la escuela '
		end
	else select CodError = 1, Mensaje = 'Error: CodEscuela no existe '
	

end
go
--
exec spActualizarEscuela 'E05','Arquitectura','Ingenieria'
go
DROP PROCEDURE spActualizarEscuela
------------------------
-------Buscar Escuela
------------------------
if OBJECT_ID('spBuscarEscuela') is not null
	drop proc spBuscarEscuela
go
--
create proc spBuscarEscuela
@CodEscuela char(3)
as
begin
	if exists (select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		begin
			select CodEscuela, Escuela, Facultad from TEscuela WHERE CodEscuela=@CodEscuela
		end
	
	else select CodError = 1, Mensaje = 'Error: CodEscuela no existe '
end
go
--
exec spBuscarEscuela 'E09'
go
DROP PROCEDURE spBuscarEscuela
------------------------------------------------------------------------------

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
if OBJECT_ID('spEliminarAlumno') is not null
	drop proc spEliminarAlumno
go
--
create proc spEliminarAlumno
@CodAlumno char(5)
as
begin
	--No puede Eliminar alumno si no existente
	if exists (select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		begin
			delete from TAlumno WHERE CodAlumno=@CodAlumno
			select CodError = 0, Mensaje = 'Se elimino al alumno seleccionado'
		end
	else select CodError = 1, Mensaje = 'Error: CodAlumno no existe '
end
go
--
exec spEliminarAlumno 'A0001'
go
DROP PROCEDURE spEliminarAlumno
------------------------
-------Actualizar Alumno
------------------------
if OBJECT_ID('spActualizarAlumno') is not null
	drop proc spActualizaAlumno
go
--
create proc spActualizarAlumno
	@CodAlumno char(5),
	@Apellidos varchar(50),
	@Nombres varchar(50),
	@LugarNac varchar(50),
	@FechaNac datetime,
	@CodEscuela char(3)
as
begin
	--No puede Actualizar alumno si no existente
	if exists (select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		begin
			update TAlumno set Apellidos=@Apellidos, Nombres=@Nombres, LugarNac=@LugarNac,FechaNac=@FechaNac, CodEscuela=@CodEscuela where CodAlumno=@CodAlumno
			select CodError = 0, Mensaje = 'Se modifico el alumno seleccionado'
		end
	else select CodError = 1, Mensaje = 'Error: CodAlumno no existe'
	

end
go
--
exec spActualizarAlumno'A0001','Guevara Martinez','Jose Benjamin','Cusco','2021-01-05 00:00:00','E01'
go
DROP PROCEDURE spActualizarAlumno
------------------------
-------Buscar Alumno
------------------------
if OBJECT_ID('spBuscarAlumno') is not null
	drop proc spBuscarAlumno
go
--
create proc spBuscarAlumno
@CodAlumno char(3)
as
begin
	if exists (select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		begin
			select Apellidos, Nombres, LugarNac,FechaNac, CodEscuela from TAlumno WHERE CodAlumno=@CodAlumno
		end
	
	else select CodError = 1, Mensaje = 'Error: CodAlumno no existe '
end
go
--
exec spBuscarAlumno 'E09'
go
DROP PROCEDURE spBuscarAlumno
