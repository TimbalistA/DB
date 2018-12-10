DROP FUNCTION IF EXISTS reusita;
GO
CREATE FUNCTION reusita(@NUME VARCHAR(50))
RETURNS INT
	BEGIN
		DECLARE @NOTA INT;
		SELECT  @NOTA = Nota
		FROM studenti_reusita JOIN studenti ON studenti_reusita.Id_Student = studenti.Id_Student
		WHERE Nume_Student = @NUME
		RETURN @NOTA
	END
GO
SELECT Nume_Student, Prenume_Student, Disciplina, dbo.reusita(Nume_Student) AS Nota, Data_Evaluare
FROM (studenti_reusita JOIN studenti ON studenti_reusita.Id_Student = studenti.Id_Student) JOIN discipline
ON studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
GO