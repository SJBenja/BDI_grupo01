---------------------------
--BASE DE DATOS I
--PROYECTO: INVENTARIO DE SOPORTE INFORMATICO - EQUIPO 1
--INTEGRANTES:
--          - Sandoval, Juan Benjamin
--          - Sosa, Gustavo Daniel
--          - Vallejos, Gustavo Oscar
--          - Vargas, Hernán Ezequiel
--DEFINICION MODELO DE DATOS.
---------------------------
use master
/*PREGUNTAMOS SI EXISTE NUESTRA BASE DE DATOS PREVIAMENTE Y LA BORRAMOS PARA VOLVER A CREARLA
IF EXISTS(SELECT NAME FROM SYS.DATABASES WHERE NAME = 'base_inventario;') 
BEGIN
DROP DATABASE base_inventario;
END
GO */

CREATE DATABASE base_inventario;
go
USE base_inventario;
go

-------------------

if object_id('departamento') is not null DROP TABLE departamento
go
---------------------
if object_id('provincia') is not null DROP TABLE provincia
go
---------------------
if object_id('distrito') is not null DROP TABLE distrito
go
---------------------
if object_id('agente') is not null DROP TABLE agente
go
---------------------
if object_id('division') is not null DROP TABLE division
go
---------------------
if object_id('estado') is not null DROP TABLE estado
go
---------------------
if object_id('hardware') is not null DROP TABLE hardware
go
---------------------
if object_id('fabricante') is not null DROP TABLE fabricante
go
---------------------
if object_id('estado') is not null DROP TABLE estado
go
---------------------
if object_id('usuario') is not null DROP TABLE usuario
go
---------------------
if object_id('perfil') is not null DROP TABLE perfil
go
---------------------
if object_id('agente_inventario') is not null DROP TABLE agente_inventario
go
---------------------
if object_id('inventario') is not null DROP TABLE inventario
go
---------------------

--TABLA PROVINCIA --
create table provincia
     (cod_provincia int primary key, 
      descripcion varchar (100) not null,
      )
go

--TABLA DEPARTAMENTO--
Create table departamento 
	(cod_provincia int not null, 
	cod_departamento int not null, 
	descripcion varchar(100) not null,
	Constraint PK_departamento PRIMARY KEY (cod_provincia, cod_departamento),
	Constraint FK_departamento_pcia FOREIGN KEY (cod_provincia)  REFERENCES provincia(cod_provincia),
	)					
go

--TABLA DISTRITO--
Create table distrito 
	(cod_provincia int not null, 
	cod_departamento int not null, 
	nro_distrito int not null ,
	descripcion varchar (100) not null,
	direccion varchar (100) not null,
	telefono varchar(20) not null,
    Constraint PK_distrito PRIMARY KEY (cod_provincia, cod_departamento, nro_distrito),
	Constraint FK_distrito_pcia FOREIGN KEY (cod_provincia,cod_departamento)  REFERENCES departamento(cod_provincia,cod_departamento),						 								 					     					     					     				     					     
	)
go

--TABLA DIVISION--
Create table division (cod_division int primary key, 
					    descripcion varchar(100) not null,
						tel_ip int not null,
						)
go

--TABLA ESTADO--

Create table estado (id_estado varchar(30) primary key, 
					    descripcion varchar(100) not null,
						)
go

--TABLA HARDWARE--
Create table hardware (id_hard int primary key, 
					    rubro varchar(30) not null,
						descripcion varchar (100) not null,
						)
go

--TABLA FABRICANTE--
Create table fabricante (id_fabricante int primary key, 
					    descripcion varchar(100) not null,
						)
go


--TABLA AGENTE--

create table agente
      (cuil bigint not null,
       nombre varchar (50) not null,
	   apellido varchar (50) not null,
	   direccion varchar (100) not null,
	   telefono varchar(20) not null,
       cod_division int not null,
       cod_provincia int not null,
       cod_departamento int not null,
	   nro_distrito int not null,
	   Constraint PK_agente PRIMARY KEY (cuil),
	   Constraint FK_agente_distrito FOREIGN KEY (cod_provincia, cod_departamento, nro_distrito)  REFERENCES distrito(cod_provincia, cod_departamento, nro_distrito),
	   Constraint FK_agente_division FOREIGN KEY (cod_division) REFERENCES division(cod_division),
	   )
  go    
  
-- TABLA INVENTARIO-- 
create table inventario(
	id_inventario int identity(1, 1) primary key,
	id_hard int not null,
	id_estado varchar(30) not null, 
    nro_legajo varchar(20) not null, 
    nro_serie varchar(30) not null,    
    id_fabricante int not null,
    modelo varchar(50) not null,
    observaciones varchar(50) not null,
    CONSTRAINT FK_inventario_hardware FOREIGN KEY (id_hard) REFERENCES hardware (id_hard),
    CONSTRAINT FK_inventario_estado FOREIGN KEY (id_estado) REFERENCES estado (id_estado),
    CONSTRAINT FK_inventario_fabricante FOREIGN KEY (id_fabricante) REFERENCES fabricante (id_fabricante),
	)
  go 

  --TABLA PERFIL--
Create table perfil 
	( id_perfil int primary key, 
	perfil varchar (30) not null,
	)
go

--TABLA USUARIO--
Create table usuario ( id_usuario int IDENTITY(1,1) primary key, 
					   id_perfil int not null,
					   cuil bigint not null,
					   contraseña varchar (32) not null,
					   Constraint FK_usuario_perfil FOREIGN KEY (id_perfil) REFERENCES perfil (id_perfil),
					   Constraint FK_usuario_agente FOREIGN KEY (cuil) REFERENCES agente (cuil),
						)
go
--TABLA AGENTE_INVENTARIO--
create table agente_inventario( id int primary key identity(1, 1),
								id_inventario int,
								cuil bigint not null,
								fecha_alta date not null,
								fecha_baja date,
								observaciones varchar(250),
								CONSTRAINT FK_agenteInventario_inventario FOREIGN KEY (id_inventario)REFERENCES	inventario(id_inventario),
								CONSTRAINT FK_agenteInventario_agente FOREIGN KEY (cuil) REFERENCES agente(cuil),
								)
GO

--RESTRICCIONES DE TABLAS--
/*1 - Un hardware no puede estar relacionado con dos agentes en la misma fecha, debe de tener una fecha de baja para la misma.
ALTER TABLE agente_inventario
	ADD CONSTRAINT CK_agenteInventario_idInventario CHECK (fecha_baja = not null);*/
	
/*4 - el número de legajo de hardware es único */
ALTER TABLE inventario
	ADD CONSTRAINT UQ_inventario_legajo UNIQUE (nro_legajo);

/*3 - El registro de inventario es único*/
ALTER TABLE inventario
	ADD CONSTRAINT UQ_inventario_registro UNIQUE (id_inventario);

/*2 - Cada Cuil de agente es único*/	
ALTER TABLE agente
	ADD CONSTRAINT UQ_agente_cuil UNIQUE (cuil);
	
/*6 - El estado de un hardware debe ser único, no se debe sobreponer  los estados a un hardware
ALTER TABLE inventario
	ADD CONSTRAINT UQ_inventario_cuil UNIQUE (cuil);*/

-- ÍNDICE CLAVE: Un equipo solo puede estar asignado a un agente activo
CREATE UNIQUE INDEX UX_agenteInventario_activo
ON agente_inventario (id_inventario)
WHERE fecha_baja IS NULL;
