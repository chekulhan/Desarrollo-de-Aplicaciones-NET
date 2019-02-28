ALTER PROCEDURE TRANSPORTES.USP_MOD_VEHICULO
   @p_codigo smallint,
   @p_capacidadTrans int,
   @p_marca varchar(20),
   @p_capacidadDepo smallint,
   @p_itv date,
   @p_disponible char(2),
   @p_fechaCompra date,
   @p_coste money,
   @p_vidaUtil int,
   @p_salida smallint OUTPUT
AS
   DECLARE @v_fechaCompra DATE
BEGIN
   -- Control de existencia del vehículo a modificar
   IF NOT EXISTS(SELECT * FROM transportes.vehiculos 
             WHERE idvehiculo=@p_codigo)
   BEGIN
      SET @p_salida=-1
	  RETURN 1
   END

   -- Control de la fecha de la ITV
   SELECT @v_fechaCompra=fechacompra FROM transportes.vehiculos 
   WHERE idvehiculo=@p_codigo   
   IF @p_itv <= @v_fechaCompra OR 
      @p_itv <= @p_fechaCompra
   BEGIN
      SET @p_salida=-2
	  RETURN 1
   END

   -- Control de la fecha de compra
   IF @p_fechaCompra >= getdate()
   BEGIN
      SET @p_salida=-3
	  RETURN 1
   END

   -- Control de disponible
   IF @p_disponible NOT IN ('SI','NO')
   BEGIN
      SET @p_salida=-4
	  RETURN 1
   END

   -- Control de vida útil
   IF @p_vidaUtil not between 500000 and 2000000
   BEGIN
      SET @p_salida=-5
	  RETURN 1
   END

   -- Control de coste de compra
   IF @p_coste <= 0
   BEGIN
      SET @p_salida=-6
	  RETURN 1
   END

   -- Control de la capacidad del deposito
   IF @p_capacidadDepo <= 0
   BEGIN
      SET @p_salida=-7
	  RETURN 1
   END

   -- Control de la capacidad de transporte
   IF @p_capacidadTrans <= 0
   BEGIN
      SET @p_salida=-8
	  RETURN 1
   END

   -- Procedemos a la actualización de los datos
   UPDATE TRANSPORTES.Vehiculos
   SET capacidaTransporteT=@p_capacidadTrans,
	   Marca= @p_marca,
	   CapacidadDepositoL=  @p_capacidadDepo,
	   itv= @p_itv,
	   Disponible= @p_disponible,
	   FechaCompra= @p_fechaCompra,
	   CosteVehiculo= @p_coste,
	   VidaUtilKm= @p_vidaUtil
   WHERE idVehiculo=@p_codigo

   SET @p_salida=0
   RETURN 0
END