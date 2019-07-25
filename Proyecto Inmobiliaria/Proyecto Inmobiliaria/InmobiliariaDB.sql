/* Miguel Valdez,Will Lara, Jorge Cantarero
Base de Datos de inmobiliaria
24/07/2019*/

USE tempdb
GO 

IF EXISTS (SELECT * FROM sys.databases WHERE name='Inmobiliaria')
BEGIN 
DROP DATABASE Inmobiliaria
END
GO

CREATE DATABASE Inmobiliaria
GO

USE Inmobiliaria
GO