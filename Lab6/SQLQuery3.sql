--QUERY NR3--
use universitatea
go
ALTER TABLE[dbo].[grupe]
ADD [Sef_grupa] int not null;

ALTER TABLE [dbo].[grupe]
ADD Prof_Indrumator int;
ALTER TABLE grupe ADD CONSTRAINT UniqueName UNIQUE(Prof_Indrumator);

UPDATE grupe
SET Sef_grupa = (SELECT TOP 1 Id_Student
				FROM studenti_reusita studreus
				WHERE grupe.Id_Grupa = studreus.Id_Grupa
				GROUP BY  Id_Student
				ORDER BY AVG(Cast(Nota AS DECIMAL(4, 2))) DESC)

UPDATE grupe
SET Prof_Indrumator = (SELECT TOP 1 Id_Profesor
						FROM studenti_reusita studreus
						WHERE grupe.Id_Grupa = studreus.Id_Grupa
						GROUP BY Id_Profesor
						ORDER BY Count(Id_Disciplina) DESC, Id_Profesor ASC)
SELECT *
FROM grupe