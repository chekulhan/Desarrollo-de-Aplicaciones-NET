-- script para demostración de transacciones

USE DevDB1;
GO

CREATE SCHEMA trans
GO

USE DevDB1;
GO
CREATE TABLE trans.Productos (
    ProductoID int,
    Nombre varchar(255),
    Precio float,
    Cantidad smallint,
    Disponible bit
);

SELECT * FROM trans.Productos

INSERT INTO trans.Productos (ProductoID, Nombre, Precio, Cantidad, Disponible)
VALUES (100, 'Portatil', 299.99, 100, 1)

INSERT INTO trans.Productos (ProductoID, Nombre, Precio, Cantidad, Disponible)
VALUES (200, 'Reloj', 87.50, 50, 1)

INSERT INTO trans.Productos (ProductoID, Nombre, Precio, Cantidad, Disponible)
VALUES (300, 'iMac', 1299, 20, 1)

INSERT INTO trans.Productos (ProductoID, Nombre, Precio, Cantidad, Disponible)
VALUES (400, 'Windows 95', 49.99, 0, 0)

INSERT INTO trans.Productos (ProductoID, Nombre, Precio, Cantidad, Disponible)
VALUES (400, 'iPad', 149.99, 200, 1)


--  ejecutar una consulta  y abrir otra conexiones para SELECT - no se ve ya que el nivel de asilamiento por defecto es READ COMMITED

BEGIN TRANSACTION

UPDATE trans.Productos
SET Cantidad = 500
WHERE ProductoID = 200

ROLLBACK TRANSACTION  -- COMMIT TRANSACTION


-- abrir otra conexion y hacer una consulta SELECT con READ UNCOMMITED
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED -- OJO: leer datos que no han sido commited = dirty read
SET TRANSACTION ISOLATION LEVEL READ COMMITTED -- por defecto

SELECT * FROM trans.Productos



-- Vamos a ejecutar unas transacciones
-- Ejecutar múltiples comandos, SI hay un error, rollback todos. Si no, commit.
BEGIN TRANSACTION

BEGIN TRY
    UPDATE trans.Productos
    SET Cantidad = 600
    WHERE ProductoID = 200

    PRINT 'Cantidad OK'

    UPDATE trans.Productos
    SET Precio = 40 -- CAMBIAR este valor a 'err' para simular un error
    WHERE ProductoID = 200

    PRINT 'Precio OK'
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    PRINT 'Error'
    ROLLBACK TRANSACTION
END CATCH




-- TO DO 
-- Repasar ACID Propiedades
-- crear proyecto BANCO








SELECT session_id, start_time, status,
total_elapsed_time,
CASE transaction_isolation_level
WHEN 1 THEN 'ReadUncomitted'
WHEN 2 THEN 'ReadCommitted'
WHEN 3 THEN 'Repeatable'
WHEN 4 THEN 'Serializable'
WHEN 5 THEN 'Snapshot'
ELSE 'Unspecified' END AS transaction_isolation_level,
sh.text, ph.query_plan
FROM sys.dm_exec_requests
CROSS APPLY sys.dm_exec_sql_text(sql_handle) sh
CROSS APPLY sys.dm_exec_query_plan(plan_handle) ph