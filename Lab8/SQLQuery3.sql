USE universitatea
GO
DROP VIEW IF EXISTS FirstTaskB;
GO
CREATE VIEW FirstTaskB (Nume_Student, Prenume_Student) WITH SCHEMABINDING AS 
	SELECT Nume_Student, Prenume_Student
	FROM dbo.studenti
	WHERE (Nume_Student LIKE '%u')
	WITH CHECK OPTION
GO
--Test viziune
SELECT * FROM FirstTaskB
--Nu se poate sterge coloana din Tabel
ALTER TABLE studenti DROP COLUMN Nume_Student
UPDATE FirstTaskB SET Nume_Student = 'Tim' WHERE Nume_Student = 'Timu'