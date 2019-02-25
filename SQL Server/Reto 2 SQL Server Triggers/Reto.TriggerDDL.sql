USE [CheDB]
GO

/****** Object:  Table [dbo].[EventosDDL]    Script Date: 25/02/2019 12:44:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EventosDDL](
	[IDEvento] [int] IDENTITY(1,1) NOT NULL,
	[Evento] [xml] NULL,
	[Usuario] [varchar](50) NULL,
	[FechadeEvento] [datetime] NULL,
 CONSTRAINT [PK_EventosDDL] PRIMARY KEY CLUSTERED 
(
	[IDEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO






USE [CheDB]
GO

/****** Object:  Table [dbo].[EventosDDL]    Script Date: 25/02/2019 12:43:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EventosDDL](
	[IDEvento] [int] IDENTITY(1,1) NOT NULL,
	[Evento] [xml] NULL,
	[Usuario] [varchar](50) NULL,
	[FechadeEvento] [datetime] NULL,
 CONSTRAINT [PK_EventosDDL] PRIMARY KEY CLUSTERED 
(
	[IDEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO









-- Usar XQuery value metodo para extraer datos del EVENTDATA XML
SELECT Evento.value('(/EVENT_INSTANCE/EventType)[1]', 'nvarchar(max)'), Evento.value('(/EVENT_INSTANCE/PostTime)[1]', 'datetime')
FROM [dbo].[EventosDDL]