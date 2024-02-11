-- Crear la base de datos Quetzal
CREATE DATABASE Quetzal
COLLATE Latin1_General_CS_AS;
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

/*
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

--Crear la vista top
CREATE VIEW Top_Major AS
SELECT TOP 10 l.Nombre, SUM(p.Conteo) AS Total_Conteo
FROM Posicion p
INNER JOIN Lenguaje l ON p.Id_Lenguaje = l.Id_Lenguaje
INNER JOIN AnnioTrimestre att ON p.Id_AnioTrimestre = att.Id_AnioTrimestre
WHERE att.Annio BETWEEN 2011 AND 2022
GROUP BY l.Nombre
ORDER BY Total_Conteo DESC;
GO

-- Crear la vista top con los datos por año
CREATE VIEW Vista_Trimestral AS
SELECT 
    l.Nombre AS Lenguaje,
    att.Annio As 'Año',
    SUM(p.Conteo) AS 'Total_Conteo_Trimestral'
FROM 
    Posicion p
JOIN 
    Lenguaje l ON p.Id_Lenguaje = l.Id_Lenguaje
JOIN 
    AnnioTrimestre att ON p.Id_AnioTrimestre = att.Id_AnioTrimestre
WHERE 
    l.Nombre IN (
        SELECT TOP 10 l2.Nombre
        FROM Posicion p2
        JOIN Lenguaje l2 ON p2.Id_Lenguaje = l2.Id_Lenguaje
        WHERE att.Annio BETWEEN 2011 AND 2022
        GROUP BY l2.Nombre
        ORDER BY SUM(p2.Conteo) DESC
    )
GROUP BY 
    l.Nombre, att.Annio;
GO

SELECT TOP 10 l.Nombre, SUM(p.Conteo) AS TotalConteo
FROM Posicion p
INNER JOIN Lenguaje l ON p.Id_Lenguaje = l.Id_Lenguaje
INNER JOIN AnnioTrimestre att ON p.Id_AnioTrimestre = att.Id_AnioTrimestre
WHERE att.Annio BETWEEN 2011 AND 2022
GROUP BY l.Nombre
ORDER BY TotalConteo ASC;

SELECT TOP 5 l.Nombre AS Lenguaje, p.Conteo as TotalActividades
FROM Posicion p
INNER JOIN Lenguaje l ON p.Id_Lenguaje = l.Id_Lenguaje
INNER JOIN AnnioTrimestre att ON p.Id_AnioTrimestre = att.Id_AnioTrimestre
WHERE att.Annio = 2021 AND att.Trimestre = 4
ORDER BY TotalActividades DESC;

SELECT TOP 5 l.Nombre AS Lenguaje, SUM(p.Conteo) AS TotalActividades
FROM Posicion p
INNER JOIN Lenguaje l ON p.Id_Lenguaje = l.Id_Lenguaje
INNER JOIN AnnioTrimestre att ON p.Id_AnioTrimestre = att.Id_AnioTrimestre
WHERE att.Annio = 2021 AND att.Trimestre = 4
GROUP BY l.Nombre
ORDER BY TotalActividades DESC;

*/