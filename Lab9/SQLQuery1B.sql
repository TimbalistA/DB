DROP PROCEDURE IF EXISTS procedure1B;
GO
CREATE PROCEDURE procedure1B
	@Nota DECIMAL(4, 2) = 7.0
AS
	SELECT Disciplina, AVG(Cast(Nota AS DECIMAL(4, 2))) AS Media
	FROM discipline JOIN studenti_reusita 
	ON discipline.Id_Disciplina=studenti_reusita.Id_Disciplina
	GROUP BY Disciplina HAVING AVG(Cast(Nota AS DECIMAL(4, 2))) > @Nota
EXECUTE procedure1B;
