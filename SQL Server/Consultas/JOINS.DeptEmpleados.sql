USE [CheDB]
GO
/****** Object:  Schema [JOINS]    Script Date: 28/02/2019 10:12:28 ******/
CREATE SCHEMA [JOINS]
GO
/****** Object:  Table [JOINS].[Departamentos]    Script Date: 28/02/2019 10:12:28 ******/
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
/****** Object:  Table [JOINS].[Empleados]    Script Date: 28/02/2019 10:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JOINS].[Empleados](
	[EmpleadoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[DeptID] [char](3) NULL,
 CONSTRAINT [PK_Empleados_1] PRIMARY KEY CLUSTERED 
(
	[EmpleadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [JOINS].[Departamentos] ([DeptID], [Nombre]) VALUES (N'ADM', N'Administración')
GO
INSERT [JOINS].[Departamentos] ([DeptID], [Nombre]) VALUES (N'FIN', N'Finanzas')
GO
INSERT [JOINS].[Departamentos] ([DeptID], [Nombre]) VALUES (N'INF', N'Informática')
GO
INSERT [JOINS].[Departamentos] ([DeptID], [Nombre]) VALUES (N'MAR', N'Marketing')
GO
INSERT [JOINS].[Departamentos] ([DeptID], [Nombre]) VALUES (N'RH ', N'Recursos Humanos')
GO
SET IDENTITY_INSERT [JOINS].[Empleados] ON 
GO
INSERT [JOINS].[Empleados] ([EmpleadoID], [Nombre], [Apellido], [DeptID]) VALUES (1, N'Jon', N'Smith', N'MAR')
GO
INSERT [JOINS].[Empleados] ([EmpleadoID], [Nombre], [Apellido], [DeptID]) VALUES (2, N'Axl', N'Rose', N'FIN')
GO
INSERT [JOINS].[Empleados] ([EmpleadoID], [Nombre], [Apellido], [DeptID]) VALUES (3, N'Freddy', N'Mercury', NULL)
GO
INSERT [JOINS].[Empleados] ([EmpleadoID], [Nombre], [Apellido], [DeptID]) VALUES (4, N'Leo', N'Messi', N'ADM')
GO
INSERT [JOINS].[Empleados] ([EmpleadoID], [Nombre], [Apellido], [DeptID]) VALUES (5, N'Cristiano', N'Ronaldo', N'ADM')
GO
SET IDENTITY_INSERT [JOINS].[Empleados] OFF
GO
