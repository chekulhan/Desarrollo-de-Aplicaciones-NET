USE XXXXX
GO

/****** Object:  StoredProcedure [dbo].[usp_ActualizaPuesto]    Script Date: 25/03/2019 13:13:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
Para este caso, utilizaremos las tablas contenidas en el esquema HR.
En este caso, debemos implantar una lógica de negocio 
que permita la inserción automática en la tabla HR.JobHistory de los datos de un trabajador 
que se corresponden al puesto que ocupaba antes de cambiar de puesto de trabajo. 
Esta inserción se produce una vez actualizados los datos en la tabla HR.employees.
La implantación la llevaremos a cabo mediante un Procedimiento almacenado denominado PR_ActualizaPuesto.
*/

CREATE PROCEDURE [dbo].[usp_ActualizaPuesto]
	--Parameters
	@p_EmployeeID TINYINT,
	@p_NewJobID CHAR(10),
	@p_NewDepartmentID SMALLINT,
	@p_NewSalary DECIMAL(8,2),
	@p_NewHireDate DATE,
	--Error handle
	@p_ERROR SMALLINT OUTPUT

AS
--Nothing here
BEGIN
	--Main code
	BEGIN TRY
		--Que el trabajador, el puesto y el departamento Existan (los 3)
		IF NOT EXISTS (
			SELECT * FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = @p_EmployeeID
		) AND NOT EXISTS (
			SELECT * FROM HR.DEPARTMENTS WHERE DEPARTMENT_ID = @p_NewDepartmentID
		) AND NOT EXISTS (
			SELECT * FROM HR.JOBS WHERE JOB_ID = @p_NewJobID
		)
		BEGIN
			--Error -1
			SET @p_ERROR = -1
			RETURN
		END
		ELSE
		BEGIN
			--Que el nuevo salario este entro los margenes permitidos
			IF NOT EXISTS (
				SELECT *
				FROM HR.JOBS
				WHERE JOB_ID = @p_NewJobID AND @p_NewSalary BETWEEN MIN_SALARY AND MAX_SALARY
			) 
			BEGIN
				--Error -2
				SET @p_ERROR = -2
				RETURN							
			END
			ELSE
			BEGIN
				--Que el nuevo puesto no sea el mismo que ocupaba anteriormente
				IF @p_NewJobID = (SELECT JOB_ID
   								  FROM HR.EMPLOYEES
								  WHERE EMPLOYEE_ID = @p_EmployeeID)
				BEGIN
					--Error -3
					SET @p_ERROR = -3
					RETURN						
				END
				ELSE
				BEGIN
					IF @p_NewHireDate < (SELECT HIRE_DATE
										 FROM HR.EMPLOYEES
										 WHERE EMPLOYEE_ID = @p_EmployeeID)
					BEGIN
						--Error -4
						SET @p_ERROR = -4
						RETURN
					END
					ELSE
					--Si llegamos aqui significará que todo esta correcto 
					BEGIN
						BEGIN TRAN
						--Insertarmos la informacion del Empleado antes de la actualizacion de puesto
						INSERT INTO HR.JOB_HISTORY (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
						VALUES (@p_EmployeeID, (SELECT HIRE_DATE
												FROM HR.EMPLOYEES
												WHERE EMPLOYEE_ID = @p_EmployeeID),
												(GETDATE()-1),
												(SELECT JOB_ID
												FROM HR.EMPLOYEES
												WHERE EMPLOYEE_ID = @p_EmployeeID),
												(SELECT DEPARTMENT_ID
												FROM HR.EMPLOYEES
												WHERE EMPLOYEE_ID = @p_EmployeeID))
						UPDATE HR.EMPLOYEES
						SET HIRE_DATE = @p_NewHireDate, 
						    JOB_ID = @p_NewJobID,
							SALARY = @p_NewSalary,
							DEPARTMENT_ID = @p_NewDepartmentID
						WHERE EMPLOYEE_ID = @p_EmployeeID
					--Commit
					COMMIT TRAN
					END
				END
			END
		END
	END TRY
	BEGIN CATCH
		SET @p_ERROR = @@ERROR
		ROLLBACK TRAN
	END CATCH
END
GO


