/* Miguel Valdez,Will Lara, Jorge Cantarero
Base de Datos de inmobiliaria
24/07/2019*/

USE tempdb
GO 

IF EXISTS (SELECT * FROM sys.databases WHERE name='WILEN')
BEGIN 
DROP DATABASE WILEN
END
GO

CREATE DATABASE WILEN
GO

USE WILEN
GO

CREATE SCHEMA Mueble
GO

CREATE SCHEMA Usuario
GO

CREATE TABLE Muebles.Inmueble
(
  idProp INT IDENTITY (1,1) CONSTRAINT PK_Muebles_Inmueble_Id PRIMARY KEY CLUSTERED,
  ciudadProp VARCHAR(55) NULL,
  direccionProp VARCHAR(65) NULL,
  descripcion VARCHAR(180) NULL,
  tipoInmueble VARCHAR(45) NULL,
  precioProp INT NULL,
  comisionProp INT NULL,
  medidaCProp INT NULL,
  banos INT NULL,
  dormitorios INT NULL
)
GO

CREATE TABLE Usuario.Cliente
(
 idCliente INT IDENTITY (1,1) CONSTRAINT PK_Usuario_Cliente_Id PRIMARY KEY CLUSTERED,
  nombreCliente VARCHAR(45) NOT NULL,
  telefonoCliente VARCHAR(11) NOT NULL,
  correoCliente VARCHAR(50) NOT NULL,
  oficioCliente VARCHAR(20) NULL,
  direccionCliente VARCHAR(100) NOT NULL
)
GO

CREATE TABLE Usuario.Empleado
(
  idEmpleado INT IDENTITY (1,1) CONSTRAINT PK_Usuario_Cliente_Id PRIMARY KEY CLUSTERED,
  nombreEmpleado VARCHAR(45) NOT NULL,
  telefonoEmpleado VARCHAR(11) NOT NULL,
  correoEmpleado VARCHAR(65) NULL,
  direccionEmpleado VARCHAR(145) NULL
)
GO

CREATE TABLE Mueble.Operacion
(
  idOperacion INT IDENTITY (100,1) CONSTRAINT PK_Usuario_Cliente_Id PRIMARY KEY CLUSTERED ,
  fechaOperacion DATETIME NULL,
  observacionOpeacion VARCHAR(100) NULL,
  Cliente_idCliente VARCHAR(15) NOT NULL,
  Empleado_idEmpleado INT NOT NULL,
  Propiedad_idProp INT NOT NULL,
  FormaPago VARCHAR(45) NOT NULL,
)
GO	

CREATE TABLE Mueble.Saldo
(
  idNumeroPago INT IDENTITY (1000,1) CONSTRAINT PK_Muebles_Saldo_Id PRIMARY KEY CLUSTERED,
  Operacion_idOperacion INT NOT NULL,
  Saldo_pagado INT NULL,
  saldoPendiente INT NULL,
  Descuento INT NULL,
  Mora INT NULL,
  Interes INT NULL,
)
GO

--Llaves foraneas
ALTER TABLE Mueble.Operacion
   ADD CONSTRAINT fk_Operacion_Cliente
    FOREIGN KEY (Cliente_idCliente)
    REFERENCES brproyecto.Cliente (idCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
GO

ALTER TABLE Mueble.Operaion
 ADD CONSTRAINT fk_Operacion_Empleado1
    FOREIGN KEY (Empleado_idEmpleado)
    REFERENCES brproyecto.Empleado (idEmpleado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
GO

ALTER TABLE Mueble.Operacion
    ADD CONSTRAINT fk_Operacion_Inmueble1
    FOREIGN KEY (Propiedad_idProp)
    REFERENCES brproyecto.Inmueble (idProp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
	GO

	ALTER TABLE Mueble.Saldo
	ADD CONSTRAINT fk_Saldo_Operacion1
    FOREIGN KEY (Operacion_idOperacion)
    REFERENCES brproyecto.Operacion (idOperacion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
	GO
