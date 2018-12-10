DROP FUNCTION IF EXISTS varsta;
GO
CREATE FUNCTION varsta(@Data DATE)
RETURNS INT
	BEGIN
		DECLARE @Varsta INT;
		SELECT  @Varsta = DATEDIFF(YEAR,@Data,GETDATE())
		FROM studenti
		WHERE Data_Nastere_Student = @Data
		RETURN @Varsta
	END
GO
SELECT Nume_Student, Prenume_Student, dbo.varsta(Data_Nastere_Student) AS VARSTA
FROM studenti
GO