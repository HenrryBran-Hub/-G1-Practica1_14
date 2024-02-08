-- Crear la base de datos Quetzal
CREATE DATABASE Quetzal;
GO

-- Usar la base de datos Quetzal
USE Quetzal;
GO

-- Crear la entidad Carga de datos
CREATE TABLE CargaDeDatos (
    Lenguaje NVARCHAR(100),
    Annio INT,
    Trimestre INT,
    Conteo INT
);
GO

-- Mostramos los datos despues de cargar la informacion
SELECT * FROM CargaDeDatos;

--CREACION DE ER
-- Crear la tabla Lenguaje
CREATE TABLE Lenguaje (
    Id_Lenguaje INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100)
);
GO

-- Crear la tabla AnnioTrimestre
CREATE TABLE AnnioTrimestre (
    Id_AnioTrimestre INT PRIMARY KEY IDENTITY(1,1),
    Annio INT,
    Trimestre INT
);
GO

-- Crear la tabla Conteo
CREATE TABLE Posicion (
	Id_Posicion INT IDENTITY(1,1),
    Id_Lenguaje INT,
    Id_AnioTrimestre INT,
    Conteo INT,
    PRIMARY KEY (Id_Lenguaje, Id_AnioTrimestre),
    FOREIGN KEY (Id_Lenguaje) REFERENCES Lenguaje(Id_Lenguaje),
    FOREIGN KEY (Id_AnioTrimestre) REFERENCES AnnioTrimestre(Id_AnioTrimestre)
);
GO

-- Ingreso de datos a las tablas del ER
--Insercion de datos en Lenguaje
INSERT INTO Lenguaje (Nombre)
SELECT DISTINCT Lenguaje
FROM CargaDeDatos
ORDER BY Lenguaje ASC;
GO

--Insercion de datos en Año trimestral
-- Inserción de datos en AnnioTrimestre
INSERT INTO AnnioTrimestre (Annio, Trimestre)
SELECT DISTINCT Annio, Trimestre
FROM CargaDeDatos
ORDER BY Annio ASC, Trimestre ASC;


-- Inserción en la tabla Posicion
INSERT INTO Posicion (Id_Lenguaje, Id_AnioTrimestre, Conteo)
SELECT l.Id_Lenguaje, att.Id_AnioTrimestre, cd.Conteo
FROM CargaDeDatos cd
JOIN Lenguaje l 
ON cd.Lenguaje = l.Nombre
JOIN AnnioTrimestre att 
ON cd.Annio = att.Annio 
AND cd.Trimestre = att.Trimestre;
GO


SELECT * FROM Lenguaje;

SELECT DISTINCT cd.Lenguaje,cd.Annio,cd.Trimestre
FROM CargaDeDatos cd;
GO

SELECT COUNT(*) FROM CargaDeDatos;
GO

SELECT Lenguaje, Annio, Trimestre, COUNT(*) AS Repeticiones
FROM CargaDeDatos
GROUP BY Lenguaje, Annio, Trimestre
HAVING COUNT(*) > 1;

SELECT *
FROM CargaDeDatos
WHERE Lenguaje = 'MATLAB'
ORDER BY Annio, Trimestre ASC;
GO

SELECT *
FROM CargaDeDatos
WHERE Lenguaje = 'matlab';
GO

--Insercion de datos en Posicion



