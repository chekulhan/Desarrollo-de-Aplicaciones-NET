

/****** Object:  Schema [Colegio]    Script Date: 25/10/2019 10:32:34 ******/
CREATE SCHEMA [Colegio]
GO


/****** Object:  Table [Colegio].[Alumnos]    Script Date: 25/10/2019 10:30:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Colegio].[Alumnos](
	[IDAlumno] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[DNI] [char](9) NULL,
 CONSTRAINT [PK_Alumnos] PRIMARY KEY CLUSTERED 
(
	[IDAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [Colegio].[Asignaturas]    Script Date: 25/10/2019 10:30:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Colegio].[Asignaturas](
	[IDAsignatura] [char](3) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Asignaturas] PRIMARY KEY CLUSTERED 
(
	[IDAsignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [Colegio].[Matriculas]    Script Date: 25/10/2019 10:30:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Colegio].[Matriculas](
	[IDAlumno] [int] NOT NULL,
	[IDAsignatura] [char](3) NOT NULL,
	[CursoEscolar] [char](9) NOT NULL,
 CONSTRAINT [PK_AlumnosAsignaturas] PRIMARY KEY CLUSTERED 
(
	[IDAlumno] ASC,
	[IDAsignatura] ASC,
	[CursoEscolar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




