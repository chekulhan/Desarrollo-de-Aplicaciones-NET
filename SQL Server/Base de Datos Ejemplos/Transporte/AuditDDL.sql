--====================================
--  Create database trigger template 
--====================================
USE Test1
GO

IF EXISTS(
  SELECT *
    FROM sys.triggers
   WHERE name = N'trigger_AuditEnvios'
     AND parent_class_desc = N'DATABASE'
)
	DROP TRIGGER trigger_AuditEnvios ON DATABASE
GO

CREATE TRIGGER trigger_AuditEnvios ON DATABASE 
	FOR DROP_TABLE 
AS 

BEGIN
	DECLARE @data XML  
	SET @data = EVENTDATA()

	IF @data.value('(/EVENT_INSTANCE/SchemaName)[1]', 'nvarchar(100)') = 'audit'
	BEGIN
	    PRINT 'No se puede borrar tablas del equema audit' 
		ROLLBACK TRANSACTION
	END
END
GO
