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


/****** Object:  Table [dbo].[Proveedores]    Script Date: 26/02/2019 14:06:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Proveedores](
	[ProveedorID] [int] IDENTITY(1,1) NOT NULL,
	[Proveedor] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
	[Saldo] [money] NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[ProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION fct_Sumar
(

)
RETURNS money
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result money

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = SUM(Saldo) FROM Proveedores

	-- Return the result of the function
	RETURN @Result

END
GO




CREATE FUNCTION [dbo].[fct_FormatearProveedor]
(
@Proveedor varchar(100)
)
RETURNS varchar(100)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result varchar(100)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = 'Nombre del Proveedor: ' + @Proveedor  FROM Proveedores

	-- Return the result of the function
	RETURN @Result

END




CREATE FUNCTION [dbo].[fct_MaximoSaldo]
(

)
RETURNS money
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result money

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = 99

	-- Return the result of the function
	RETURN @Result

END
GO





SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fct_CalcularDescuento]
(
	-- Add the parameters for the function here
	@Precio money
)
RETURNS money
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result money

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = @Precio -1

	-- Return the result of the function
	RETURN @Result

END
GO

