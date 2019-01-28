USE [CheDB]
GO

/****** Object:  Table [dbo].[Fotos]    Script Date: 28/01/2019 17:49:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fotos](
	[FotoID] [smallint] IDENTITY(1,1) NOT NULL,
	[Foto] [varbinary](max) NULL,
	[Nombredearchivo] [varchar](200) NULL,
 CONSTRAINT [PK_Fotos] PRIMARY KEY CLUSTERED 
(
	[FotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


