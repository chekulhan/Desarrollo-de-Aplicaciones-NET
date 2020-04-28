
-- SQL DBA 2
-- https://docs.google.com/document/d/1H2dRCPj-0hLWaxjkdLzs4xsL0zvQ3LwjcgZ9kN7nHJ8/

SELECT * FROM sys.databases

SELECT * FROM sys.database_files


-- marcas de seguimiento = una condicion IF de BD
DBCC TRACESTATUS
DBCC TRACEON(3604) -- enviar output a la consola
DBCC TRACEOFF(3604)
-- más sobre trace flags = https://victorisakov.files.wordpress.com/2011/10/sql_pass_summit_2011-important_trace_flags_that_every_dba_should_know-victor_isakov.pdf

-- crear una table e insertar unas filas
CREATE TABLE tblNombre (
Nombre char(100)
)
INSERT INTO tblNombre(Nombre)
VALUES ('Juan')
--m_freeCnt = 7333


SELECT * FROM tblNombre

-- una página 8KB = 8,192 (o 128kb per MB)

-- database console commands
DBCC IND('DevDB1','tblNombre',-1)
DBCC PAGE('DevDB1', 1, 592, 1)
-- DBCC PAGE('BD', IAMFID, PagePID, Nivel de info)

--SYS.DM_DB_DATABASE_PAGE_ALLOCATIONS

