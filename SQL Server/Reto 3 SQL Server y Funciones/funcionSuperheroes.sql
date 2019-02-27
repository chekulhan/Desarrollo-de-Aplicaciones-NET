USE [CheDB]
GO

/****** Object:  UserDefinedFunction [dbo].[fnc_MostrarSuperHeroes]    Script Date: 27/02/2019 12:20:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[fnc_MostrarSuperHeroes] 
(	
	-- Add the parameters for the function here
	@Genero varchar(50) 
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT * FROM Marvels
	WHERE Genero = @Genero
)
GO


