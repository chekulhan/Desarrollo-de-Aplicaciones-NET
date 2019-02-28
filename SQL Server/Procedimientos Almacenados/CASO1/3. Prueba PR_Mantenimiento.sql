-- CÓDIGO DE PRUEBA
DECLARE @valor int
EXEC @valor=mantenimiento.pr_altaProducto 'PR0001','Procesador Pentium V',
                                    230.50,'CPU'
PRINT @valor