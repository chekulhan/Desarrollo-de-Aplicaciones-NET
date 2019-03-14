
declare @StudentID int
declare @LastName varchar(50)

DECLARE C CURSOR FOR
SELECT StudentID, lastName FROM Students

OPEN C

FETCH NEXT FROM C into @StudentID, @LastName

WHILE @@FETCH_STATUS = 0
	BEGIN
		-- Hacer algo aqui con las variables de la fila
		print @StudentID 
		print @LastName
		FETCH NEXT FROM C into @StudentID, @LastName
	END 


CLOSE C
DEALLOCATE C



-- 2. Usando tipos de CURSORES

declare @StudentID int
declare @LastName varchar(50)

-- FORWARD_ONLY, SCROLL
DECLARE C CURSOR SCROLL FOR
SELECT StudentID, lastName FROM Students

OPEN C

FETCH NEXT FROM C into @StudentID, @LastName

--Con SCROLL, puedo ir a diferentes filas usando FIRST, LAST, PRIOR, NEXT, RELATIVE, ABSOLUTE
FETCH FIRST FROM C INTO @StudentID, @LastName 
print 'primera fila'
print @StudentID
print @LastName

FETCH LAST FROM C INTO @StudentID, @LastName 
print 'ultima fila'
print @StudentID
print @LastName 



CLOSE C
DEALLOCATE C


--3. STATIC, KEYSET, DYNAMIC, FAST_FORWARD
declare @StudentID int
declare @LastName varchar(50)


DECLARE C CURSOR STATIC FOR
SELECT StudentID, lastName FROM Students

OPEN C

FETCH NEXT FROM C into @StudentID, @LastName

WHILE @@FETCH_STATUS = 0
	BEGIN
		-- Hacer algo aqui con las variables de la fila
		print @StudentID 
		print @LastName
		FETCH NEXT FROM C INTO @StudentID, @LastName
	END 

	--Con SCROLL, puedo ir a diferentes filas usando FIRST, LAST, PRIOR, NEXT, RELATIVE, ABSOLUTE
	FETCH PRIOR FROM C INTO @StudentID, @LastName 
	print 'fila anterior'
	print @StudentID
	print @LastName 

	FETCH FIRST FROM C INTO @StudentID, @LastName 
	print 'primera fila'
	print @StudentID
	print @LastName

CLOSE C
DEALLOCATE C