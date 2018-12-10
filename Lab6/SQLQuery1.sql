--QUERY NR1--
use universitatea
go
SELECT *
FROM profesori
WHERE Adresa_Postala_Profesor IS NULL;
UPDATE profesori SET Adresa_Postala_Profesor='mun.Chisinau' WHERE Adresa_Postala_Profesor IS NULL;
SELECT *
FROM profesori
WHERE Adresa_Postala_Profesor='mun.Chisinau'

