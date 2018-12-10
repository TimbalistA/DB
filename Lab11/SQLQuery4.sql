USE master
GO
RESTORE DATABASE universitatea_lab11
from device01
with norecovery,
move 'universitatea' to 'C:\Users\Ana\Documents\DataBase\Lab11\BD_lab11\universitatea_lab11.mdf',
move 'universitatea_log' to 'C:\Users\Ana\Documents\DataBase\Lab11\BD_lab11\universitatea_lab11.ldf'
go

restore database universitatea_lab11
from device02
with norecovery,
move 'universitatea' to 'C:\Users\Ana\Documents\DataBase\Lab11\BD_lab11\universitatea_lab11.mdf'

restore log universitatea_lab11 from BACKUP_LOG with recovery