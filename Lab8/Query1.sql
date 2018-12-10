USE universitatea
GO
DROP VIEW IF EXISTS dbo.firsttask;
GO
CREATE VIEW firsttask AS 
	SELECT Disciplina, AVG(CAST(Nota AS DECIMAL(4, 2))) AS media
	FROM discipline
	JOIN studenti_reusita ON discipline.Id_Disciplina=studenti_reusita.Id_Disciplina
	GROUP BY Disciplina HAVING AVG(CAST(Nota AS DECIMAL(4, 2))) > 7.0
GO
--Test viziune
SELECT * FROM firsttask