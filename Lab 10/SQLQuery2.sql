DROP TRIGGER IF EXISTS inregistrare_corecta 
GO
CREATE TRIGGER inregistrare_corecta ON studenti_reusita
	INSTEAD OF INSERT
	AS SET NOCOUNT ON 
		IF EXISTS (SELECT * FROM inserted
		WHERE Id_Student in (SELECT Id_Student FROM studenti))
		BEGIN
			INSERT INTO studenti_reusita
			SELECT * FROM inserted
			WHERE Id_Student in (SELECT Id_Student FROM studenti)
		END
		ELSE
		BEGIN
			PRINT 'This ID does not exist!'
		END
go
INSERT studenti_reusita (Id_Student, Id_Disciplina, Id_Profesor, Id_Grupa, Tip_Evaluare, Nota, Data_Evaluare) 
VALUES (175, 118, 118, 1, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO