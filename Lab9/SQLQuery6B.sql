DROP FUNCTION IF EXISTS tab_nota;
GO
CREATE FUNCTION tab_nota(@Nota DECIMAL(4, 2))
RETURNS TABLE
WITH ENCRYPTION
AS
RETURN
	(SELECT Disciplina, AVG(Cast(Nota AS DECIMAL(4, 2))) AS Media
	FROM discipline JOIN studenti_reusita 
	ON discipline.Id_Disciplina=studenti_reusita.Id_Disciplina
	GROUP BY Disciplina HAVING AVG(Cast(Nota as decimal(4, 2))) > @Nota)
SELECT * FROM tab_nota(7.0)
GO