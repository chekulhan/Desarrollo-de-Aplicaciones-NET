-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
ALTER FUNCTION bco.f_ValidarImporte 
(
	-- Add the parameters for the function here
	@IDTitular int,
	@Importe money -- NOTA: Hace falta para los UPDATEs, si no, el CHECK No va...
	-- Usar ([bco].[f_ValidarImporte]([IDTitular],[Importe])=(0)) en CHECK
)
RETURNS  bit
AS
BEGIN

	DECLARE @valido bit
	DECLARE @maximporte money
	DECLARE @importeexiste money
	SET @importeexiste = (SELECT SUM(Importe) FROM bco.Prestamos WHERE IDTitular=@IDTitular)


	SET @maximporte = (SELECT limiteRiesgo FROM bco.titulares WHERE IDTitular=@IDTitular)

	IF (@importeexiste + @Importe) > @maximporte 
		SET @valido = 1
	ELSE SET @valido = 0


	-- Return the result of the function
	RETURN @valido

END
GO

