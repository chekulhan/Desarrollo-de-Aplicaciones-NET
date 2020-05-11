---------------------
-- ACTIVIDADES

CREATE TABLE [dbo].[Estudiantes](  
    [Estudiante_ID] [int] NOT NULL,  
    [Nombre] [nvarchar](50) NOT NULL,  
    [Saldo] [int] NOT NULL,  
    [Ciudad] [nvarchar](50) NOT NULL
)

  
GO  

Insert into Estudiantes  
Select 1,'Pankaj',25000,'Donostia' Union All  
Select 2,'Raul',21000,'Bilbao' Union All  
Select 3,'Sandeep',25000,'Valencia' Union All  
Select 4,'Sanjeev',24000,'Madrid' Union All  
Select 5,'Neeraj',28000,'Bilbao' Union All  
Select 6,'Naru',20000,'Valencia' Union All  
Select 7,'Omi',23000,'Donostia'   


SELECT * FROM Estudiantes

-- Usando CURSORes, llevar a cabo las actividades:
-- Actividad 1: Imprimir los alumnos de Bilbao en formato CSV e.g 2,Rahul,Bilboa 
-- Actividad 2: Cambiar la actividad 2 para IMPRIMIR el Saldo mas 10%, solo en el caso  que
-- el Saldo es mayor a 23,000. e.g. 1,Pankaj,Donostia,27500


-- Actividad 1: Respuesta
declare @Estudiante_ID int
declare @Nombre varchar(50)
declare @Ciudad varchar(50)

DECLARE cursor_Alumnos CURSOR FOR
SELECT Estudiante_ID, Nombre, Ciudad 
FROM Estudiantes
WHERE Ciudad = 'Bilbao'

OPEN cursor_Alumnos

-- rellenar las variables con datos del cursor
FETCH NEXT FROM cursor_Alumnos into @Estudiante_ID, @Nombre, @Ciudad

WHILE @@FETCH_STATUS = 0
	BEGIN

		print CAST(@Estudiante_ID AS VARCHAR(10)) + ',' + @Nombre + ',' + @Ciudad
        print '------------------------------'
		FETCH NEXT FROM cursor_Alumnos  into @Estudiante_ID, @Nombre, @Ciudad
	END 



CLOSE cursor_Alumnos
DEALLOCATE cursor_Alumnos

-- Actividad 2: Respuesta

declare @Estudiante_ID int
declare @Nombre varchar(50)
declare @Ciudad varchar(50)
declare @Saldo int

DECLARE cursor_Alumnos CURSOR FOR
SELECT Estudiante_ID, Nombre, Ciudad, Saldo
FROM Estudiantes

OPEN cursor_Alumnos

-- rellenar las variables con datos del cursor
FETCH NEXT FROM cursor_Alumnos into @Estudiante_ID, @Nombre, @Ciudad, @Saldo

WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @Saldo > 23000
		BEGIN
			print CAST(@Estudiante_ID AS VARCHAR(10)) + ',' + @Nombre + ',' + @Ciudad + ',' + CAST(@Saldo * 1.1 AS VARCHAR(10))
        	print '------------------------------'
		END 

		FETCH NEXT FROM cursor_Alumnos  into @Estudiante_ID, @Nombre, @Ciudad, @Saldo
	END 

CLOSE cursor_Alumnos
DEALLOCATE cursor_Alumnos
