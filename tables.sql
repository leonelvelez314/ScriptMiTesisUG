/*
	ESTOS SCRIPTS SON DE USO OPEN SOURCE, CREADO POR ESTUDIANTES DE LA CARREA ING. EN SISTEMA DE 
	LA UNIVERSIDAD DE GUAYAQUIL. LA UNIVERSIDAD NO SE HACE CARGO DE SU FUNCIONALIDAD Y SU DISTRIBUCIÓN.
	
	PUEDE CONTACTAR A ALGUIEN DEL TEAM DEVELOPMENT DEL PROYECTO Y ESTUDIANTE DE LA UNIVERSIDAD A ESTA INFORMACIÓN:
	Nombre: Leonel Velez
	Correo Institucional UG: jefferson.velezl@ug.edu.ec
	correo Personal: leonel-14-velez@hotmail.com
	GitHub: github.com/leonelvelez314


	*****************************************************************
	FUNCION SCRIPT: Creando tablas para el el app movil MiTesisUG
	AUTOR: Leonel Velez	
	****************************************************************
*/


go
IF NOT (EXISTS(SELECT * FROM sys.databases WHERE name = 'mitesisug'))
begin
CREATE DATABASE mitesisug;
end;
go

USE mitesisug;



--USUARIOS
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

--ROLES
go
IF NOT (EXISTS(SELECT * FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbo].[ROLES]') AND [type]='U'))
begin
CREATE TABLE Roles
(
	Id int identity(1,1),
	Usuario int not null,
	Descripcion varchar(10) not null	
);


ALTER TABLE Roles
ADD CONSTRAINT pk_roles primary key(Id);

ALTER TABLE Roles
ADD CONSTRAINT fk_roles_Usuario foreign key(Usuario) references Usuarios(Id);
end
go





