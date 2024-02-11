# [G1]Practica1_14

---
---

Acontinuacion se tendra el desarrollo de la practica No. 1

## Creacion de BD :movie_camera:

Tenemos como primer objetivo la creacion de nuestra BD en SQL Server 2022 Express edition, para la cual se baso en el siguiente ER:

### ER Logico

![ER_Logico](https://github.com/HenrryBran-Hub/-G1-Practica1_14/blob/feature-script/Archivos/ER_Logico.png)

### ER Relacional

![ER_Relacional](https://github.com/HenrryBran-Hub/-G1-Practica1_14/blob/feature-script/Archivos/ER_Relacional.png)

### otros-Links :link:

1. [Enunciado de la Practica](https://github.com/HenrryBran-Hub/-G1-Practica1_14/blob/feature-script/Archivos/%5BG1%5DPractica1_1S.pdf)

1. [Archviso CSV](https://github.com/HenrryBran-Hub/-G1-Practica1_14/blob/feature-script/Archivos/issues.csv)


---
---

## Script utilizado en SQL Server

```javascript
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
```
___

### Creacion de la BD

![Creacion BD](https://github.com/HenrryBran-Hub/-G1-Practica1_14/blob/feature-script/Img/1.gif)

___

### Carga de Archivo CSV

![Carga BD](https://github.com/HenrryBran-Hub/-G1-Practica1_14/blob/feature-script/Img/2.gif)

___

### Verificacion de carga

![Verificacion BD](https://github.com/HenrryBran-Hub/-G1-Practica1_14/blob/feature-script/Img/3.gif)

___

# CONSULTAS

## Mostramos primera consulta

![1ra consutla](https://github.com/HenrryBran-Hub/-G1-Practica1_14/blob/feature-script/Img/4.gif)

___

___

## Mostramos primera consulta

![2da consulta](https://github.com/HenrryBran-Hub/-G1-Practica1_14/blob/feature-script/Img/5.gif)

___

___

## Mostramos primera consulta

![3ra consulta](https://github.com/HenrryBran-Hub/-G1-Practica1_14/blob/feature-script/Img/6.gif)

___


___

## GRUPO No.14 SISTEMAS ORGANIZACIONALES Y GERENCIALES 1
___

| Nombre | Carnet | Usuario Git |
|----------|----------|----------|
| Henrry David Bran Velasquez | 201314439 | [Henrry Bran](https://github.com/HenrryBran-Hub) |
| Angel Geovany Aragón Pérez  | 201901055 | [Angel Aragón](https://github.com/Angelgt3) |
| Eduardo Tomás Ixén Rucuch   | 201800524 | [Eduardo Ixén](https://github.com/EduardoIxen) |
___
___
