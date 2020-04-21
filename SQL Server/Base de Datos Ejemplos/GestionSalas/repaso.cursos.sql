USE DevDB1;
GO
-- crear esquema
--CREATE SCHEMA cursos
--GO

SELECT * FROM sys.tables

CREATE TABLE cursos.Maquinas( 
 id int identity(1,1) constraint pk_maquinas primary key, 
 etiqueta nvarchar(50) not null, 
 procesador nvarchar(50) not null, 
 memoria smallint not null, 
 disco smallint not null, 
 pantalla tinyint not null, 
 constraint ck_memoria check (memoria>0), 
 constraint ck_disco check (disco>0), 
 constraint ck_pantalla check (pantalla>0) 
); 
GO 
CREATE TABLE cursos.Cursos( 
 id int identity(1,1) constraint pk_cursos primary key, 
 codigo nvarchar(10), 
 titulo nvarchar(50), 
 duracion tinyint, 
 programa xml 
); 
GO 
CREATE TABLE cursos.CursosMaquinas( 
 id int identity(1,1) constraint pk_cursosMaquinas primary key, 
 curso int constraint fk_cursosMaquinas_curso references cursos.Cursos(id), 
 maquina int constraint fk_cursosMaquinas_maquina references cursos.Maquinas(id) 
)  
GO  
CREATE TABLE cursos.Salas( 
 id int identity(1,1) constraint pk_salas primary key, 
 etiqueta nvarchar(20), 
 numeroSitios smallint constraint ck_salas_numeroSitios check  
(numeroSitios>0), 
  maquina int constraint fk_salas_maquinas references cursos.Maquinas(id) 
); 
GO 
CREATE TABLE cursos.Formaciones( 
 id int identity(1,1) constraint 
 pk_formaciones primary key, 
 cursos int constraint fk_formaciones_cursos references cursos.Cursos(id), 
 sala int constraint fk_formaciones_salas references cursos.Salas(id), 
 fechaInicio date, 
 fechaFin date 
);

-- borrar tablas inecesarias
DROP TABLE cursos.CursosMaquinas

-- metadatos
SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'cursos'

SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='Salas'

-- insertar datos

SELECT * FROM cursos.Salas

INSERT INTO cursos.Salas (etiqueta, numeroSitios)
VALUES ('Auditorio', 200)
INSERT INTO cursos.Salas (etiqueta, numeroSitios)
VALUES ('Aula Informática 1', 20)
INSERT INTO cursos.Salas (etiqueta, numeroSitios)
VALUES ('Aula Informática 2', 18)
INSERT INTO cursos.Salas (etiqueta, numeroSitios)
VALUES ('Sala de reuniones', 10)

SELECT * FROM cursos.Cursos

INSERT INTO cursos.Cursos (codigo, titulo, duracion)
VALUES ('DN1', 'Introducción a dotnet', 80)

INSERT INTO cursos.Cursos (codigo, titulo, duracion)
VALUES ('P1', 'Primeros pasos con Python', 40)

INSERT INTO cursos.Cursos (codigo, titulo, duracion)
VALUES ('P2', 'Python avanzado', 60)

INSERT INTO cursos.Cursos (codigo, titulo, duracion)
VALUES ('DN2', 'Dotnet Core', 100)


SELECT * FROM cursos.Formaciones

-- OJO con las fechas, los meses y dias son al reves - americano
-- Fijaos, posiblemente los cursos y sala no son iguales
INSERT INTO cursos.Formaciones (cursos, sala, fechaInicio, fechaFin)
VALUES (1, 1, '01/18/2020', '03/05/2020')

INSERT INTO cursos.Formaciones (cursos, sala, fechaInicio, fechaFin)
VALUES (1, 1, '3/7/2020', '6/9/2020')

INSERT INTO cursos.Formaciones (cursos, sala, fechaInicio, fechaFin)
VALUES (2, 3, '01/1/2020', '03/05/2020')

INSERT INTO cursos.Formaciones (cursos, sala, fechaInicio, fechaFin)
VALUES (3, 3, '3/7/2020', '8/7/2020')


-- Stored Procedures

/*
Nombre: usp_GetAllSalas
Autor: CK
Fecha: 20/4/2020
Mostrar todas las filas y los datos de la tabla Salas, excluye datos de maquinas
*/

CREATE PROCEDURE cursos.usp_GetAllSalas 
AS  
    SET NOCOUNT ON;  
    
    SELECT id, etiqueta, numeroSitios  
    FROM cursos.Salas

GO  

EXEC cursos.usp_GetAllSalas

/*
Nombre: usp_GetSala
Autor: CK
Fecha: 20/4/2020
Mostrar todos los datos de la tabla Salas, excluye datos de maquinas, con un parametro de ID
*/

CREATE PROCEDURE cursos.usp_GetSala 
    @id int
AS  
    SET NOCOUNT ON;  
    
    SELECT id, etiqueta, numeroSitios  
    FROM cursos.Salas
    WHERE ID = @id

GO  


DECLARE @idSala INT
SET @idSala = 3
EXEC cursos.usp_GetSala @idSala



-- metadatos sobre los SPs
EXEC sp_helptext 'cursos.usp_GetSala'
SELECT OBJECT_DEFINITION (OBJECT_ID(N'cursos.usp_GetSala'));



/*
Nombre: usp_GetCursosLargoDuracion
Autor: CK
Fecha: 20/4/2020
Seleccionar los cursos con más de 80 horas 
*/


CREATE PROCEDURE cursos.usp_GetCursosLargoDuracion 
AS  
    SET NOCOUNT ON;  
    
    SELECT id, codigo, titulo, duracion   
    FROM cursos.Cursos
    WHERE duracion >= 80

GO  

EXEC cursos.usp_GetCursosLargoDuracion

/*
Nombre: usp_GetCursosCortoDuracion
Autor: CK
Fecha: 20/4/2020
Seleccionar los cursos con menos de 80 horas, mostrando mas informacion si la duracion es corto o super corto
*/
CREATE PROCEDURE cursos.usp_GetCursosCortoDuracion 
AS  
    SET NOCOUNT ON;  
    

    SELECT id, codigo, titulo, duracion, IIF(duracion <= 40, 'Super Corto', 'Corto') AS DuracionDescripcion  
    FROM cursos.Cursos
    WHERE duracion < 80

GO  

EXEC cursos.usp_GetCursosCortoDuracion








