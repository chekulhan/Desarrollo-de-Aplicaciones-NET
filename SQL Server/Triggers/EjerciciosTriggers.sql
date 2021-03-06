USE [CheDB]
GO





/****** Object:  Table [dbo].[Proveedores]    Script Date: 26/02/2019 11:56:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Proveedores](
	[ProveedorID] [int] IDENTITY(1,1) NOT NULL,
	[Proveedor] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
	[Saldo] [money] NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[ProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO







SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProveedoresSaldo](
	[ProveedorID] [int] NOT NULL,
	[MaxSaldo] [money] NULL,
 CONSTRAINT [PK_ProveedoresSaldo] PRIMARY KEY CLUSTERED 
(
	[ProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO





/****** Object:  Table [dbo].[Proveedores_Audit]    Script Date: 26/02/2019 11:56:34 ******/
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








/****** Object:  Trigger [dbo].[trigDiaSemana]    Script Date: 26/02/2019 10:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[trigDiaSemana]
   ON  [dbo].[Proveedores]
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	  DECLARE @DiaSemana varchar(100)
	  SET @DiaSemana = DATENAME(dw, GetDate()) 

	  IF (@DiaSemana IN ('Sabado', 'Domingo') )
	  BEGIN
		PRINT 'No se puede hacer cambios durante el fin de semana'
		ROLLBACK TRANSACTION
	  END 
END






SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER trigMensaje 
   ON  [dbo].[Proveedores]
   AFTER DELETE -- Crear 2 triggers, uno para INSERT/UPDATE y otro, este, para DELETE. No olvides cambiar la tabla virtual
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @ID int
	DECLARE @RowsAffected int

	SELECT @RowsAffected = Count(*) FROM deleted -- Cambiar este tabla para TRIGGER INSERT y UPDATE

	IF @RowsAffected = 0
		PRINT 'No filas afectadas con este comando';
	ELSE
		PRINT CAST(@RowsAffected AS varchar(10)) + ' filas afectadas'
END
GO




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[trigProveedorName]
   ON  [dbo].[Proveedores]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF ( UPDATE (Proveedor) )  
	BEGIN  
		PRINT('Error - no se puede actualizar')
		RAISERROR ('No se puede modificar el nombre del proveedor', 16, 10)  
	END; 
END




---NOTA: Solo funciona si insertamos o actuualizamos una fila a la vez

GO
/****** Object:  Trigger [dbo].[trigProveedorSaldo]    Script Date: 26/02/2019 11:44:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[trigProveedorSaldo]
   ON  [dbo].[Proveedores]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @Saldo  money
	DECLARE @MaxSaldo money

	IF UPDATE(Saldo)
	BEGIN

		SELECT @MaxSaldo = ps.MaxSaldo, @Saldo = i.Saldo FROM ProveedoresSaldo ps
			INNER JOIN inserted i ON i.ProveedorID = ps.ProveedorID

		IF @Saldo > @MaxSaldo
			RAISERROR('Fuera del maximo disponible', 16, 10)
			--PRINT 'Max' + CAST(@MaxSaldo as varchar(100))
			--PRINT 'Saldo' + CAST(@Saldo as varchar(100))
	END
	ELSE
		Print 'column not updated'
END

