DECLARE @id int
DECLARE @nombre varchar(200)
DECLARE @descripcion varchar(150)
DECLARE @product_status varchar(100)
DECLARE @listprice money


DECLARE cursorProductos CURSOR FOR
SELECT Product_ID, PRODUCT_NAME, PRODUCT_DESCRIPTION, PRODUCT_STATUS, LIST_PRICE FROM [oe].[PRODUCT_INFORMATION]
WHERE PRODUCT_STATUS = 'under development'


OPEN cursorProductos
FETCH cursorProductos INTO @id, @nombre, @descripcion,@product_status,@listprice

WHILE (@@fetch_status=0)
	BEGIN

		IF @listprice >500
			print  'Datos de productos aqui... ' + @nombre 
	
		FETCH cursorProductos INTO @id, @nombre, @descripcion,@product_status,@listprice
	END

CLOSE cursorProductos
DEALLOCATE cursorProductos
