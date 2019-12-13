-- SCAN

SELECT * FROM [Indices].[Empleados]
WHERE IDEmpleado = 40

SELECT * FROM [Indices].[Empleados]
WHERE IDEmpleado BETWEEN 200 AND 300
-- agregamos CLUSTER -- SEEK


-- SCAN
SELECT Nombre, Apellido, TipoEmpleado 
FROM [Indices].[Empleados]
WHERE TipoEmpleado = 'y'
-- mejoramos con ...NON clustered por tipoEmpleado = PERO...columnas incluidas


-- INSERTAmos más datos REPETIR insert
-- Actualizamos estadisticas = mirar base de datos opciones (no va con la herramienta gráfica)
Update STATISTICS [Indices].[Empleados]

-- Actividad:
-- Aplicar indices para estas consultas 

SELECT Salario
FROM [Indices].[Empleados]
WHERE Salario BETWEEN 100 AND 200

SELECT *
FROM [Indices].[Empleados]
WHERE Pais = 'Commodo, dictum lorem sit amet, imperdiet ex. Etiam cursus porttitor tincidunt. Vestibulum ante ipsu'


SELECT Nombre, Apellido, Pais
FROM [Indices].[Empleados]
WHERE Pais = 'Commodo, dictum lorem sit amet, imperdiet ex. Etiam cursus porttitor tincidunt. Vestibulum ante ipsu'
