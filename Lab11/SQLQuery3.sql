EXEC sp_addumpdevice 'DISK','LOG_BACKUP','C:\Users\Ana\Documents\DataBase\Lab11\exercitiul2.bak'
GO
BACKUP LOG universitatea 
TO LOG_BACKUP  WITH FORMAT, NAME = 'LOG BACKUP'
GO  
