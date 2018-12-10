DROP PROCEDURE IF EXISTS procedure3;
GO
CREATE PROCEDURE procedure3
	@Id_St INT = 175,
	@Nume_St VARCHAR(50) = 'Sorinu',
	@Prenume_St VARCHAR(50) = 'Eva',
	@Data_Nastere_St DATE = '1990-11-26',
	@Adresa_Postala_St VARCHAR(500) = 'mun. Chisinau, str. V. Alecsandri, 78',
	@Cod_G INT = 2,
	@Id_Dis INT = 108,
	@Id_Pro INT = 101,
	@Tip_E VARCHAR(60) = 'Examen'
AS
BEGIN
	INSERT INTO [dbo].[studenti] ([Id_Student],[Nume_Student],[Prenume_Student],[Data_Nastere_Student],[Adresa_Postala_Student])
	VALUES (@Id_St , @Nume_St, @Prenume_St, @Data_Nastere_St, @Adresa_Postala_St)
	INSERT INTO [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina],[Id_Profesor],[Id_Grupa],[Tip_Evaluare], [Nota],[Data_Evaluare])
	VALUES (@Id_St, @Id_Dis, @Id_Pro, @Cod_G, @Tip_E, NULL, NULL)
	SELECT * FROM studenti WHERE Id_Student = @Id_St
	SELECT * FROM studenti_reusita WHERE Id_Student = @Id_St
END
GO
EXECUTE procedure3;
