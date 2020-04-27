

-- Buenas preguntas
/*

Qué diferencias entre DML, DDL y DCL? - ver podcast (https://emiliopm.com/podcast/38-diferencias-entre-ddl-dml-y-dcl/)
Qué es el modelo de entidad-relación?
Diferencias entre tablas temporales globales (##) y locales (#)
Qué tipo de relaciones puede haber en SQL Server?
¿Como se conecta a una base de datos con VSCode?
¿Qué es la Normalización? - https://guru99.es/database-normalization/



Solucion a pregunta de confinamento:
¿Cómo llevarías a cabo la entrevista, ya que estamos trabajando todos desde casa durante el confinamiento? Aportar soluciones y/o sugerencias.

La entrevista se podría hacer por videollamada (skype, hangouts…). Es la manera más sencilla de realizar una entrevista durante el confinamiento. Ya que mediante estas herramientas se puede mostrar pantalla, ver a la persona entrevistada y ella a ti.
Apps para hacer videollamadas.
Skype:https://www.skype.com/es/ Hasta 25 personas. 10 en pantalla.
HangOuts:  https://chrome.google.com/webstore/detail/google-hangouts/knipolnnllmklapflnccelgolnpehhpl?hl=es
 		Hasta 10 personas en pantalla.
ZOOM: https://zoom.us/ Hasta 12 personas en pantalla.
Appear: https://www.appeartv.com/about-appear/ Hasta 8 personas en pantalla.
		WhatsApp: https://www.whatsapp.com/ Hata 4 personas en pantalla.

*/


-- documento: SQL Tablas y Tipos - https://docs.google.com/document/d/1bc73bu0wG8XpoMk36-r9mjup6iSnwcZPaiNjyeiP878/

SELECT * FROM sales.staffs



SELECT store_name, city 
INTO #Stores
FROM sales.stores

SELECT * FROM #Stores

-- Si abro una nueva conexion y ejecutar esta consulta, me funciona? ¿Por qué?
SELECT * FROM #Stores

-- y al crear una tabla temporal con 2 ##, funciona en otras conexiones? Por que?
SELECT store_name, city 
INTO ##Stores
FROM sales.stores

SELECT * FROM ##Stores

-- ¿Qué hace estas consultas? Ver el resultado antes y despues 
SELECT * FROM sys.databases

SELECT * FROM tempdb.INFORMATION_SCHEMA.TABLES
DROP TABLE #Stores
SELECT * FROM tempdb.INFORMATION_SCHEMA.TABLES

-- tablas avanzadas - rellenar una tabla con datos
CREATE TABLE #tmpDatos (i INT)

DECLARE @i INT = 0

WHILE (@i <= 10)
BEGIN

    INSERT INTO #tmpDatos (i) VALUES (@i)
    
	SET @i=@i+1

END

SELECT * FROM #tmpDatos


-- Actividad:
-- Usando la base de datos BikeStores
-- PASO 1: Crear una tabla temporal (#MisEmpleados) con columnas (staff_id, first_name, last_name) basado en la estructura de tabla sales.staffs
-- PASO 2: agregar tu nombre a la tabla e.g. INSERT ... #MisEmpleados

SELECT staff_id, first_name, last_name 
INTO #MisEmpleados
FROM sales.staffs

SELECT * FROM #MisEmpleados

INSERT INTO #MisEmpleados (first_name, last_name)
VALUES ('Che', 'Kulhan')


-----
SELECT * FROM sales.orders SAMPLE(10) --????

-- basado en páginas, no en filas. O sea, no devuelve 1000 filas
SELECT * FROM sales.orders TABLESAMPLE ( 1000 ROWS )
SELECT * FROM sales.orders TABLESAMPLE ( 10 PERCENT )
-- non -deterministic, si ejecutas otra vez, se devuleve diferentes datos


----------------------------------
SELECT * FROM sys.databases

SELECT * FROM sys.database_files


-- marcas de seguimiento
DBCC TRACESTATUS
DBCC TRACEON(3604)
DBCC TRACEOFF(3604)

-- crear una table e insertar unas filas
CREATE TABLE tblNombre (
Nombre char(100)
)
INSERT INTO tblNombre(Nombre)
VALUES ('Juan')
--m_freeCnt = 7333


SELECT * FROM tblNombre

-- una página 8KB = 8,000 (o 128kb per MB)

-- database console commands
DBCC IND('DevDB1','tblNombre',-1)
DBCC PAGE('DevDB1', 1, 592, 1)
-- DBCC PAGE('BD', IAMFID, PagePID, Nivel de info)

--SYS.DM_DB_DATABASE_PAGE_ALLOCATIONS

