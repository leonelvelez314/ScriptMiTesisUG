go
IF NOT (EXISTS(SELECT * FROM sys.databases WHERE name = 'mitesisug'))
begin
CREATE DATABASE mitesisug;
end;
go

USE mitesisug;

go
IF NOT (EXISTS(SELECT * FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbo].[USUARIOS]') AND [type]='U'))
begin
CREATE TABLE Usuarios 
(
	Id int identity(1,1),
	Usuario varchar(10) not null,
	Clave varchar(10) not null,
	Nombre varchar(max) not null,
	Correo varchar(max) not null
);


ALTER TABLE Usuarios
ADD CONSTRAINT pk_usuario primary key(Id);

ALTER TABLE Usuarios
ADD CONSTRAINT uk_usuario unique(Usuario);
end
go





