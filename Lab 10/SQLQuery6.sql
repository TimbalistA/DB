CREATE TRIGGER modificare ON DATABASE
FOR ALTER_TABLE
AS SET NOCOUNT ON
	DECLARE @command varchar(50)
	DECLARE @new_command varchar(50)
	DECLARE @Id_Profesor varchar (20)
	DECLARE @table varchar (50)
	SELECT @Id_Profesor = EVENTDATA().value('(/EVENT_INSTANCE/AlterTableActionList/*/Columns/Name)[1]', 'nvarchar(max)')
	IF @Id_Profesor = 'Id_Profesor'
	BEGIN
		SELECT @command = EVENTDATA().value ('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'nvarchar(max)')
		SELECT @table = EVENTDATA().value ('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(max)')
		SELECT @new_command = REPLACE(@ID_Profesor, @table, 'profesori');
		EXECUTE (@new_command)
		SELECT @new_command = REPLACE(@Id_Profesor, @table, 'studenti_reusita');
		EXECUTE (@new_command)
		SELECT @new_command = REPLACE(@Id_Profesor, @table, 'orarul');	
		EXECUTE (@new_command);
		RAISERROR ('Data was modified',16,1)
		PRINT error_message();
	END
GO
ALTER TABLE profesori alter column Id_Profesor varchar(10)