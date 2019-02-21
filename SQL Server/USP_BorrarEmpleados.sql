-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE USP_BorrarEmpleado
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
		END
	ELSE
		print 'error';
END
GO
