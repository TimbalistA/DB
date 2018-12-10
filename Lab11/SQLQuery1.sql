EXEC sp_addumpdevice 'DISK','device02','C:\Users\Ana\Documents\DataBase\exercitiul1.bak'
GO
BACKUP DATABASE universitatea 
TO device02  WITH FORMAT, NAME = 'Backup complet al bazei de date universitatea';
GO  
