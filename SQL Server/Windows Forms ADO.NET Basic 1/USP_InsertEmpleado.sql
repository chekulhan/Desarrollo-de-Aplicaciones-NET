USE [CheDB]
GO

/****** Object:  StoredProcedure [dbo].[USP_InsertEmpleado]    Script Date: 22/02/2019 11:43:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_InsertEmpleado]

	-- Add the parameters for the stored procedure here
	@NombredeEmpleado varchar(50),
	@Apellido varchar(50), 
	@Email varchar(50), 
	@ID int output 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Empleados(Nombre, Apellido, Email)
	VALUES (@NombredeEmpleado, @Apellido, @Email)

	SET @ID =SCOPE_IDENTITY()
	IF @@ERROR = 0
		RETURN 0 -- Return ALL OK
	ELSE 
		RETURN @@ERROR -- Return Error
	 
END
GO


