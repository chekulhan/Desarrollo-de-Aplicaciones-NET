USE [CheDB]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 28/02/2019 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PedidoID] [int] NULL,
	[PreciodeUnidad] [money] NULL,
	[Cantidad] [int] NULL,
	[ProductoID] [int] NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 28/02/2019 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ProductoID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Productos_1] PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Pedidos] ON 
GO
INSERT [dbo].[Pedidos] ([ID], [PedidoID], [PreciodeUnidad], [Cantidad], [ProductoID]) VALUES (1, 532, 300.0000, 1, 1)
GO
INSERT [dbo].[Pedidos] ([ID], [PedidoID], [PreciodeUnidad], [Cantidad], [ProductoID]) VALUES (2, 532, 2.0000, 2, 3)
GO
INSERT [dbo].[Pedidos] ([ID], [PedidoID], [PreciodeUnidad], [Cantidad], [ProductoID]) VALUES (3, 276, 300.0000, 2, 1)
GO
INSERT [dbo].[Pedidos] ([ID], [PedidoID], [PreciodeUnidad], [Cantidad], [ProductoID]) VALUES (4, 956, 30.0000, 200, 3)
GO
SET IDENTITY_INSERT [dbo].[Pedidos] OFF
GO
INSERT [dbo].[Productos] ([ProductoID], [Nombre]) VALUES (1, N'Bicicleta')
GO
INSERT [dbo].[Productos] ([ProductoID], [Nombre]) VALUES (2, N'Camiseta')
GO
INSERT [dbo].[Productos] ([ProductoID], [Nombre]) VALUES (3, N'Botella de agua')
GO
INSERT [dbo].[Productos] ([ProductoID], [Nombre]) VALUES (4, N'Paella')
GO


-- Encuentra los productos con muchas ventas
SELECT * FROM Productos 
 WHERE ProductoID IN (SELECT ProductoId 
                FROM Pedidos
               WHERE Cantidad > 100)

-- Encuentra los productos sin ventas
SELECT * FROM Productos 
 WHERE ProductoID NOT IN (SELECT ProductoId 
                FROM Pedidos)

			-- Es lo mismo que un OUTER JOIN
			SELECT * FROM Productos pr
				LEFT OUTER JOIN Pedidos pe ON pr.ProductoID = pe.ProductoID
				WHERE pe.ID IS NULL