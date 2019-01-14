USE [CheDB]
GO

/****** Object:  StoredProcedure [dbo].[usp_AddUsuario]    Script Date: 14/01/2019 17:21:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AddUsuario]
	-- Add the parameters for the stored procedure here
	@NombredeUsuario varchar(50),
	@Direccion varchar(50), 
	@Movil varchar(50), 
	@Email varchar(50), 
	@ID int output 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Usuarios ([NombredeUsuario], [Direccion], [Movil], [Email])
	VALUES (@NombredeUsuario, @Direccion, @Movil, @Email)

	SET @ID =SCOPE_IDENTITY()
	RETURN @ID

	 
END
GO


