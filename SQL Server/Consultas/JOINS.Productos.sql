USE [Che_Dev]
GO
/****** Object:  Schema [JOINS]    Script Date: 28/11/2019 10:33:38 ******/
CREATE SCHEMA [JOINS]
GO
/****** Object:  Table [JOINS].[Categorias]    Script Date: 28/11/2019 10:33:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JOINS].[Categorias](
	[IDCategoria] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [JOINS].[Productos]    Script Date: 28/11/2019 10:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JOINS].[Productos](
	[IDProducto] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[IDCategoria] [int] NULL,
	[IDProveedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [JOINS].[Proveedores]    Script Date: 28/11/2019 10:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JOINS].[Proveedores](
	[IDProveedor] [int] NOT NULL,
	[Compania] [varchar](50) NULL,
	[Ciudad] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [JOINS].[Categorias] ([IDCategoria], [Descripcion]) VALUES (1, N'Deportes')
INSERT [JOINS].[Categorias] ([IDCategoria], [Descripcion]) VALUES (2, N'Libros')
INSERT [JOINS].[Categorias] ([IDCategoria], [Descripcion]) VALUES (3, N'Comida y Bebida')
INSERT [JOINS].[Categorias] ([IDCategoria], [Descripcion]) VALUES (4, N'Informática')
INSERT [JOINS].[Productos] ([IDProducto], [Nombre], [IDCategoria], [IDProveedor]) VALUES (100, N'Bicicleta', 1, NULL)
INSERT [JOINS].[Productos] ([IDProducto], [Nombre], [IDCategoria], [IDProveedor]) VALUES (200, N'Jamon', NULL, 40)
INSERT [JOINS].[Productos] ([IDProducto], [Nombre], [IDCategoria], [IDProveedor]) VALUES (300, N'Gmail', 4, 30)
INSERT [JOINS].[Productos] ([IDProducto], [Nombre], [IDCategoria], [IDProveedor]) VALUES (400, N'Base de datos NOSQL', 4, 20)
INSERT [JOINS].[Productos] ([IDProducto], [Nombre], [IDCategoria], [IDProveedor]) VALUES (500, N'Boligrafo', NULL, NULL)
INSERT [JOINS].[Proveedores] ([IDProveedor], [Compania], [Ciudad]) VALUES (10, N'Decatlon', N'Donostia')
INSERT [JOINS].[Proveedores] ([IDProveedor], [Compania], [Ciudad]) VALUES (20, N'Amazon', N'Nueva York')
INSERT [JOINS].[Proveedores] ([IDProveedor], [Compania], [Ciudad]) VALUES (30, N'Google', N'San Francisco')
INSERT [JOINS].[Proveedores] ([IDProveedor], [Compania], [Ciudad]) VALUES (40, N'Eroski', N'Bilbao')
ALTER TABLE [JOINS].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([IDCategoria])
REFERENCES [JOINS].[Categorias] ([IDCategoria])
GO
ALTER TABLE [JOINS].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [JOINS].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proveedores] FOREIGN KEY([IDProveedor])
REFERENCES [JOINS].[Proveedores] ([IDProveedor])
GO
ALTER TABLE [JOINS].[Productos] CHECK CONSTRAINT [FK_Productos_Proveedores]
GO
