--C�DIGO DE PRUEBA
DECLARE
   @salida SMALLINT
BEGIN
   EXECUTE TRANSPORTES.PR_MOD_VEHICULO 11,5,
            'MAN',600,NULL,'NO','13/02/2016',60000,600000, 
			@salida OUTPUT

   PRINT @salida          
END