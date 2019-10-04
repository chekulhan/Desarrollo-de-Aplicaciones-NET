USE [Test4]
GO

/****** Object:  Table [dbo].[TABLE_Changes]    Script Date: 04/10/2019 11:26:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Tabla para guardar cambios en Tablas

CREATE TABLE [dbo].[TABLE_Changes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[event_data] [xml] NULL,
	[changed_by] [varchar](50) NULL,
 CONSTRAINT [PK_TABLE_Changes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



-- Generar Trigger de Base de datos
CREATE TRIGGER [trg_table_changes]
ON DATABASE
FOR 
    CREATE_TABLE,
    ALTER_TABLE, 
    DROP_TABLE
AS
BEGIN
    SET NOCOUNT ON;
 
    INSERT INTO TABLE_Changes (
        event_data,
        changed_by
    )
    VALUES (
        EVENTDATA(),
        USER
    );
END;
GO