USE [CheDB]
GO

/****** Object:  StoredProcedure [dbo].[USP_GetEmpleado]    Script Date: 22/02/2019 11:45:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetEmpleado]
	-- Add the parameters for the stored procedure here
	@ID int   = NULL
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @ID IS NULL   
	BEGIN  
       PRINT 'ERROR: You must specify a last name for the sales person.' ;
       RETURN(1);  
	END 

    -- Insert statements for procedure here
	SELECT * FROM Empleados
	WHERE IDEmpleado=@ID 

END
GO


