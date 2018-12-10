DROP PROCEDURE IF EXISTS procedure1;
GO
	CREATE PROCEDURE procedure1
		@Litera VARCHAR(255) = '%u'
	AS
		SELECT Nume_Student, Prenume_Student
		FROM studenti
		WHERE Nume_Student like @Litera
EXECUTE procedure1;