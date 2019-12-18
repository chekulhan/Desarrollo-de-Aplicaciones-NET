USE [XXXXXXXX]
GO
CREATE SCHEMA [JOINS]
GO
/****** Object:  Table [JOINS].[Departamentos]    Script Date: 04/12/2019 11:30:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JOINS].[Departamentos](
	[DeptID] [char](3) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [JOINS].[Empleados]    Script Date: 04/12/2019 11:30:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JOINS].[Empleados](
	[EmpleadoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[GeneroID] [char](1) NULL,
	[DeptID] [char](3) NULL,
 CONSTRAINT [PK_Empleados_1] PRIMARY KEY CLUSTERED 
(
	[EmpleadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [JOINS].[Genero]    Script Date: 04/12/2019 11:30:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JOINS].[Genero](
	[GeneroID] [char](1) NOT NULL,
	[Descripcion] [char](10) NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[GeneroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [JOINS].[Departamentos] ([DeptID], [Nombre]) VALUES (N'ADM', N'Administración')
INSERT [JOINS].[Departamentos] ([DeptID], [Nombre]) VALUES (N'FIN', N'Finanzas')
INSERT [JOINS].[Departamentos] ([DeptID], [Nombre]) VALUES (N'INF', N'Informática')
INSERT [JOINS].[Departamentos] ([DeptID], [Nombre]) VALUES (N'MAR', N'Marketing')
INSERT [JOINS].[Departamentos] ([DeptID], [Nombre]) VALUES (N'RH ', N'Recursos Humanos')
SET IDENTITY_INSERT [JOINS].[Empleados] ON 

INSERT [JOINS].[Empleados] ([EmpleadoID], [Nombre], [Apellido], [GeneroID], [DeptID]) VALUES (1, N'Jon', N'Smith', N'M', N'MAR')
INSERT [JOINS].[Empleados] ([EmpleadoID], [Nombre], [Apellido], [GeneroID], [DeptID]) VALUES (2, N'Axl', N'Rose', N'M', N'FIN')
INSERT [JOINS].[Empleados] ([EmpleadoID], [Nombre], [Apellido], [GeneroID], [DeptID]) VALUES (3, N'Freddy', N'Mercury', N'O', NULL)
INSERT [JOINS].[Empleados] ([EmpleadoID], [Nombre], [Apellido], [GeneroID], [DeptID]) VALUES (4, N'Leo', N'Messi', NULL, N'ADM')
INSERT [JOINS].[Empleados] ([EmpleadoID], [Nombre], [Apellido], [GeneroID], [DeptID]) VALUES (5, N'Cristiano', N'Ronaldo', NULL, N'ADM')
INSERT [JOINS].[Empleados] ([EmpleadoID], [Nombre], [Apellido], [GeneroID], [DeptID]) VALUES (6, N'Maria', N'Fernandez', N'F', N'FIN')
SET IDENTITY_INSERT [JOINS].[Empleados] OFF
INSERT [JOINS].[Genero] ([GeneroID], [Descripcion]) VALUES (N'F', N'Femenino  ')
INSERT [JOINS].[Genero] ([GeneroID], [Descripcion]) VALUES (N'M', N'Masculino ')
INSERT [JOINS].[Genero] ([GeneroID], [Descripcion]) VALUES (N'O', N'Otro      ')
ALTER TABLE [JOINS].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Departamentos] FOREIGN KEY([DeptID])
REFERENCES [JOINS].[Departamentos] ([DeptID])
GO
ALTER TABLE [JOINS].[Empleados] CHECK CONSTRAINT [FK_Empleados_Departamentos]
GO
ALTER TABLE [JOINS].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Genero] FOREIGN KEY([GeneroID])
REFERENCES [JOINS].[Genero] ([GeneroID])
GO
ALTER TABLE [JOINS].[Empleados] CHECK CONSTRAINT [FK_Empleados_Genero]
GO
