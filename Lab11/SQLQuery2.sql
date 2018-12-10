EXEC sp_addumpdevice 'DISK','device02','C:\Users\Ana\Documents\DataBase\Lab11\exercitiul2.bak'
GO
BACKUP DATABASE universitatea 
TO device02  WITH DIFFERENTIAL;
GO  
