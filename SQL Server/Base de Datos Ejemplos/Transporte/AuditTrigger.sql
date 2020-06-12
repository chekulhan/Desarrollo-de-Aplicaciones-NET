

/****** Object:  Trigger [trans].[auditInsertUpdate]    Script Date: 12/06/2020 11:09:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Che Kulhan
-- Create date: 
-- Description:	Insertar todos los cambios en Audit tabla
-- =============================================
CREATE TRIGGER [trans].[auditInsertUpdate] 
   ON  [trans].[Envios] 
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
DECLARE @Accion char(1)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	IF EXISTS (SELECT 1 FROM inserted) 
		IF EXISTS (SELECT 1 FROM deleted)
			BEGIN
				SET @Accion = 'U'
				INSERT INTO audit.Envios (IDEnvio, FechadeEnvio, Origin, Destino,IDPaquete,IDTransporte, Accion)
				SELECT IDEnvio, FechadeEnvio, Origin, Destino,IDPaquete,IDTransporte, @Accion
				FROM deleted
			END
		ELSE
			BEGIN
				SET @Accion = 'I'

				INSERT INTO audit.Envios (IDEnvio, FechadeEnvio, Origin, Destino,IDPaquete,IDTransporte, Accion)
				SELECT IDEnvio, FechadeEnvio, Origin, Destino,IDPaquete,IDTransporte, @Accion
				FROM inserted
			END
	ELSE
		BEGIN
			SET @Accion = 'D'

			INSERT INTO audit.Envios (IDEnvio, FechadeEnvio, Origin, Destino,IDPaquete,IDTransporte, Accion)
			SELECT IDEnvio, FechadeEnvio, Origin, Destino,IDPaquete,IDTransporte, @Accion
			FROM deleted
		END


	





	


END
GO

ALTER TABLE [trans].[Envios] ENABLE TRIGGER [auditInsertUpdate]
GO


