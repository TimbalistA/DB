DROP TRIGGER IF EXISTS inregistrare_noua 
GO
CREATE TRIGGER inregistrare_noua ON orarul
	AFTER UPDATE
	AS SET NOCOUNT ON
		IF UPDATE(Auditoriu)
			SELECT 'Lectia la disciplina ' + UPPER(discipline.Disciplina) + 
			'; Grupa: ' + grupe.Cod_Grupa +
			'; Ziua: ' + CAST(inserted.Zi as VARCHAR(5)) + 
			'; Ora: ' + CAST(inserted.Ora as VARCHAR(5)) + 
			'; Blocul ' + CAST(inserted.Bloc as VARCHAR(5)) + 
			'; Auditoriu Vechi: ' + CAST(deleted.Auditoriu as VARCHAR(5))+
			', Auditoriul Nou: ' + CAST(inserted.Auditoriu as VARCHAR(5))
FROM inserted, deleted, discipline, grupe
WHERE inserted.Id_Disciplina = discipline.Id_Disciplina
AND inserted.Id_Grupa = grupe.Id_Grupa
GO
UPDATE orarul set Auditoriu = 510
WHERE zi='Luni'
GO