USE [CheDB]
GO

/****** Object:  StoredProcedure [dbo].[USP_BorrarEmpleado]    Script Date: 22/02/2019 11:44:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_BorrarEmpleado]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @rows int;

	SET @rows = (SELECT Count(IDEmpleado) FROM Empleados
		WHERE IDEmpleado = @ID);
	PRINT  @rows
    -- Insert statements for procedure here
	IF @rows = 1
		BEGIN
			DELETE FROM Empleados
			WHERE IDEmpleado = @ID;

			RETURN 0;
		END
	ELSE
		RETURN 1; -- Empleado no existe
END
GO


