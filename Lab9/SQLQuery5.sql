DROP PROCEDURE IF EXISTS procedure5;
GO
CREATE PROCEDURE procedure5
	@DISCIPLINA VARCHAR(255) = 'Proiectarea sistemelor informatice',
	@Nota_Veche INT = NULL,
	@Id_Dis INT = NULL
AS
	SET @Id_Dis = (SELECT Id_Disciplina
					FROM discipline
					WHERE Disciplina = @DISCIPLINA)
BEGIN
	UPDATE studenti_reusita SET Nota = Nota + 1 
	WHERE Nota < 10 
	AND Tip_Evaluare = 'Examen' 
	AND Id_Student IN (SELECT TOP 3 Id_Student FROM studenti_reusita
						WHERE Id_Disciplina = @Id_Dis GROUP BY Id_Student
						ORDER BY AVG(Cast(Nota as decimal(4, 2))) DESC)
	SELECT Id_Grupa AS Cod_Grupa, Nume_Student, Prenume_Student , Disciplina, (Nota - 1) AS NOTA_VECHE, Nota AS NOTA_NOUA
	FROM (studenti_reusita ST_R JOIN studenti ST ON ST_R.Id_Student = ST.Id_Student)
	JOIN discipline DIS ON ST_R.Id_Disciplina = DIS.Id_Disciplina
	WHERE ST_R.Id_Disciplina = 116 AND Tip_Evaluare = 'Examen' AND ST_R.Id_Student IN (SELECT TOP 3 Id_Student
																FROM studenti_reusita
																WHERE Id_Disciplina =116-- @Id_Dis
																GROUP BY Id_Student
																ORDER BY AVG(Cast(Nota as decimal(4, 2))) DESC)
	GROUP BY ST_R.Nota, ST_R.Id_Grupa, ST.Nume_Student, ST.Prenume_Student, DIS.Disciplina
	ORDER BY ST.Nume_Student
END
GO
EXECUTE procedure5;

