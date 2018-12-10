DROP TRIGGER IF EXISTS inregistrare_incorecta 
GO
CREATE TRIGGER inregistrare_incorecta ON studenti_reusita
	AFTER UPDATE
	AS SET NOCOUNT ON
		IF UPDATE(nota)
			DECLARE @ID_Grupa int = (select Id_Grupa from grupe where Cod_Grupa = 'CIB171')
			DECLARE @count int = (select count(*) from deleted, inserted where inserted.Nota < deleted.Nota
			AND inserted.Id_Grupa = @ID_Grupa)
			BEGIN
				IF(@count > 0)
				PRINT 'You do not have the permission to modify'
			END

		IF UPDATE(Data_Evaluare)
			DECLARE @Date int
			SET @Date = (select count(*) from deleted where Data_Evaluare != NULL and Id_Grupa = @ID_Grupa)
			IF @Date > 0
			BEGIN
				PRINT 'You do not have the permission to modify'
			end
GO
update studenti_reusita
set Nota = 7
where Nota =8  AND Id_Grupa = 1 
GO
update studenti_reusita
set Data_Evaluare = '2018-01-01'
where Id_Grupa = 1 
AND Data_Evaluare = NULL
GO