--INSERT INTO [dbo].[FirstTaskB] (Id_Student,[Nume_Student], [Prenume_Student]) values (99,'Nelu', 'Neluu' )
--UPDATE [dbo].[FirstTaskB] SET [Prenume_Student] = 'CRETU' WHERE [Prenume_Student] = 'Neluu' 
DELETE FROM [dbo].[FirstTaskB] WHERE [Prenume_Student] = 'CRETU' 
SELECT * FROM [dbo].[FirstTaskB]