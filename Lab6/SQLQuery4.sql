--QUERY NR4--
USE universitatea
GO
UPDATE studenti_reusita 
SET Nota = Nota + 1 
WHERE Id_Student in (SELECT Sef_grupa 
					FROM grupe) 
					and Nota < 10
SELECT *
FROM studenti_reusita
WHERE Id_Student in (SELECT Sef_grupa 
					FROM grupe) 