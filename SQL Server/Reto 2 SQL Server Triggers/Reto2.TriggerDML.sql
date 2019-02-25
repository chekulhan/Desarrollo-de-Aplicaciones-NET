USE [CheDB]
GO

/****** Object:  Table [dbo].[Proveedores]    Script Date: 25/02/2019 13:52:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Proveedores](
	[ProveedorID] [int] IDENTITY(1,1) NOT NULL,
	[Proveedor] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[ProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[Proveedores_Audit]    Script Date: 25/02/2019 13:53:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Proveedores_Audit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[ProveedorID] [int] NOT NULL,
	[Proveedor] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
	[UsuarioID] [varchar](50) NULL,
	[Actualizacion] [char](1) NULL,
	[FechadeActualizacion] [datetime] NULL,
 CONSTRAINT [PK_Proveedores_Audit_1] PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Trigger [trig_ProveedorAudit]    Script Date: 25/02/2019 13:53:23 ******/
DROP TRIGGER [dbo].[trig_ProveedorAudit]
GO

/****** Object:  Trigger [dbo].[trig_ProveedorAudit]    Script Date: 25/02/2019 13:53:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[trig_ProveedorAudit] 
   ON  [dbo].[Proveedores]
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	INSERT INTO Proveedores_Audit (ProveedorID, Proveedor, Pais, UsuarioID, Actualizacion, FechadeActualizacion)
	SELECT ProveedorID, Proveedor, Pais, SUSER_NAME(), 'D', GETDATE()
	FROM deleted;
	 
END
GO

ALTER TABLE [dbo].[Proveedores] ENABLE TRIGGER [trig_ProveedorAudit]
GO



DROP TRIGGER [dbo].[trig_ProveedoresAuditDELETE]
GO

/****** Object:  Trigger [dbo].[trig_ProveedoresAuditDELETE]    Script Date: 25/02/2019 13:59:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[trig_ProveedoresAuditDELETE] 
   ON  [dbo].[Proveedores_Audit]
   INSTEAD OF DELETE, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	PRINT ('No se puede borar filas de esta tabla');
END
GO

ALTER TABLE [dbo].[Proveedores_Audit] ENABLE TRIGGER [trig_ProveedoresAuditDELETE]
GO



