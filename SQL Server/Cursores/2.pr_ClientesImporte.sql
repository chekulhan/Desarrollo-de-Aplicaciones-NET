EXEC pr_ClientesImporte
GO
--Código del Procedimiento
ALTER PROCEDURE pr_ClientesImporte
AS
BEGIN
	DECLARE @v_CodCliente as SMALLINT--Declarar Variables para insertar y para el cursor
	DECLARE @v_NombreCliente AS VARCHAR(20)
	DECLARE @v_Ciudad AS VARCHAR(30)
	DECLARE @v_NumPedidos AS SMALLINT
	DECLARE @v_ImporteTotal AS DECIMAL(10,2)
	DECLARE @v_Media AS DECIMAL(10,2)
	--Cojo la media de los importes de esos años
	SET @v_Media = (SELECT AVG(ORDER_TOTAL) FROM oe.orders WHERE YEAR(ORDER_DATE) = 2008 OR YEAR(ORDER_DATE) = 2007)
	--Declaro el cursor con su SELECT
	DECLARE C CURSOR FOR
	SELECT ORDERS.CUSTOMER_ID, CUST_FIRST_NAME, City, COUNT(ORDERS.CUSTOMER_ID), SUM(ORDER_TOTAL)
	FROM oe.ORDERS JOIN oe.CUSTOMERS ON ORDERS.CUSTOMER_ID = CUSTOMERS.CUSTOMER_ID 
	WHERE YEAR(ORDER_DATE) = 2008 OR YEAR(ORDER_DATE) = 2007
	GROUP BY ORDERS.CUSTOMER_ID, CUST_FIRST_NAME, City
	--Abro el cursor
	OPEN C
	FETCH NEXT FROM C --Guardaré los datos en estas variables
	INTO @v_CodCliente, @v_NombreCliente, @v_Ciudad, @v_NumPedidos, @v_ImporteTotal
	WHILE @@FETCH_STATUS = 0
	 BEGIN
		IF(@v_ImporteTotal > @v_Media) --Si el importe total es mayor a la media
		 BEGIN
		 --Inserto en la tabla
			INSERT INTO oe.clientesImportantes(codCliente, nombre, ciudad,numeroDePedidos ,importeTotal)
			VALUES(@v_CodCliente, @v_NombreCliente, @v_Ciudad, @v_NumPedidos, @v_ImporteTotal)
		 END
		FETCH NEXT FROM C 
		INTO @v_CodCliente, @v_NombreCliente, @v_Ciudad, @v_NumPedidos, @v_ImporteTotal
	 END
	 CLOSE C
	 DEALLOCATE C
END