DROP PROCEDURE IF EXISTS procedure4;
GO
CREATE PROCEDURE procedure4
	@Nume_Vechi VARCHAR(50) = 'Avram',
	@Prenume_Vechi VARCHAR(50) = 'Sanda',
	@Nume_Nou VARCHAR(50) = 'Popescu',
	@Prenume_Nou VARCHAR(50) = 'Gabriel',
	@DISCIPLINA VARCHAR(255) = 'Proiectarea sistemelor informatice',
	@Id_ProfesVECHI INT = NULL,
	@Id_ProfesNOU INT = NULL,
	@Id_Dis INT = NULL
AS
	DECLARE @err_message nvarchar(255)
	SET @Id_ProfesVECHI = (SELECT Id_Profesor 
							FROM profesori
							WHERE Nume_Profesor = @Nume_Vechi 
							AND Prenume_Profesor = @Prenume_Vechi)
	SET @Id_Dis = (SELECT Id_Disciplina
					FROM discipline
					WHERE Disciplina = @DISCIPLINA)
	SET @Id_ProfesNOU = (SELECT Id_Profesor 
							FROM profesori
							WHERE Nume_Profesor = @Nume_Nou
							AND Prenume_Profesor = @Prenume_Nou)
	IF @Id_ProfesNOU IS NULL OR @Id_ProfesVECHI IS NULL OR @Id_Dis IS NULL
		BEGIN
			SET @err_message = 'Id_ProfesorNou is NULL'
			RAISERROR (@err_message,10, 1) 
		END
	ELSE
		BEGIN
			UPDATE studenti_reusita SET Id_Profesor = @Id_ProfesNOU WHERE Id_Profesor = @Id_ProfesVECHI AND Id_Disciplina = @Id_Dis;
			SELECT * FROM studenti_reusita WHERE Id_Profesor = @Id_ProfesVECHI
			SELECT * FROM studenti_reusita WHERE Id_Profesor = @Id_ProfesNOU
		END
GO
EXECUTE procedure4;