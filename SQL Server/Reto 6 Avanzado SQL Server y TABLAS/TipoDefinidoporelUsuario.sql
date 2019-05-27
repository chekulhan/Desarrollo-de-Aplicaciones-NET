USE [CheDB]
GO

/****** Object:  UserDefinedTableType [oe].[T_LineasPedido]    Script Date: 22/05/2019 13:22:50 ******/
CREATE TYPE [oe].[T_LineasPedido] AS TABLE(
	[codigoPedido] [smallint] NULL,
	[numLinea] [tinyint] NULL,
	[codProducto] [smallint] NULL,
	[precio] [decimal](8, 2) NULL,
	[cantidad] [smallint] NULL,
	[total]  AS ([precio]*[cantidad])
)
GO


// NOTA: Columna Calculada NO funciona con ASP.NET y ADO, pasando como paramétro a un procedimiento almacenado

