DROP FUNCTION IF EXISTS good;
GO
CREATE FUNCTION good(@Cod_grupa INT, @is_good VARCHAR(50))
	RETURNS @tab TABLE
		(Nume VARCHAR(50), Prenume VARCHAR(50), Nota_Media DECIMAL(10, 2), is_good VARCHAR(50))
	AS
	BEGIN
		IF (@is_good = 'sarguincios')
		BEGIN
			INSERT INTO @tab
			SELECT TOP 1 Nume_Student, Prenume_Student, AVG(Cast(Nota AS DECIMAL(10, 2))) AS Nota_Media, @is_good AS is_good
			FROM studenti_reusita JOIN studenti 
			ON studenti_reusita.Id_Student = studenti.Id_Student
			WHERE Id_Grupa = @Cod_grupa
			GROUP BY studenti_reusita.Id_Student,studenti.Nume_Student, studenti.Prenume_Student
			ORDER BY AVG(Cast(Nota AS numeric(4, 2))) DESC
		END
		ELSE IF (@is_good = 'slab')
		BEGIN
			INSERT INTO @tab
			SELECT TOP 1 Nume_Student, Prenume_Student, AVG(Cast(Nota AS DECIMAL(10, 2))) AS Nota_Media, @is_good AS is_good
			FROM studenti_reusita JOIN studenti 
			ON studenti_reusita.Id_Student = studenti.Id_Student
			WHERE Id_Grupa = @Cod_grupa
			GROUP BY studenti_reusita.Id_Student,studenti.Nume_Student, studenti.Prenume_Student
			ORDER BY AVG(Cast(Nota AS numeric(4, 2))) ASC
		END
		RETURN
	END
GO
SELECT * FROM dbo.good(2, 'sarguincios')
GO
