CREATE TRIGGER different_hours on database 
FOR ALTER_TABLE
AS SET NOCOUNT ON 
	DECLARE @start_time time ='09:00:00'
	DECLARE @end_time time = '18:00:00'
	DECLARE @current_time time =(select convert(time,CURRENT_TIMESTAMP))
	IF  @current_time NOT BETWEEN  @start_time AND @end_time
	BEGIN
		RAISERROR('Nu se permit modificari in afara orelor de munca',16,1)
		PRINT error_message()
	END
GO
ALTER TABLE studenti ALTER COLUMN Nume_Student VARCHAR(50)