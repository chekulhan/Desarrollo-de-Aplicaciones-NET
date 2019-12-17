
/* TABLAS temporales

Usar la tabla Artist y sus datos:
https://github.com/chekulhanseim/Desarrollo-de-Aplicaciones-NET/blob/master/SQL%20Server/Avanzado/SQLTablaVariable.sql
http://www.rtve.es/noticias/20191118/ine-comienza-hoy-rastrear-millones-moviles-para-conocer-movilidad-espanoles/1991280.shtml
  
*/ 


SELECT ArtistID, Name 
INTO #ArtistTemp
FROM Artist

SELECT * FROM #ArtistTemp

-- Si abro una nueva conexion y ejecutar esta consulta, me funciona? ¿Por qué?
SELECT * FROM #ArtistTemp

-- y al crear una tabla temporal con 2 ##, funciona en otras conexiones? Por que?
SELECT ArtistID, Name 
INTO ##ArtistTemp
FROM Artist

SELECT * FROM ##ArtistTemp

-- ¿Qué hace estas consultas? Ver el resultado antes y despues 
SELECT * FROM tempdb.INFORMATION_SCHEMA.TABLES
DROP TABLE #ArtistTemp
SELECT * FROM tempdb.INFORMATION_SCHEMA.TABLES

-- Actvidad avanzado
-- Crear una tabla temporal (#tt1) y mandar unas filas (ID 10, 20, 30, por ejemplo) a una TABLA VARIABLE (@tv1)




