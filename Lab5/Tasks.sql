--QUERY NR1--
DECLARE @N1 INT, @N2 INT, @N3 INT;
DECLARE @MAI_MARE INT;
SET @N1 = 60 * RAND();
SET @N2 = 60 * RAND();
SET @N3 = 60 * RAND();
IF (@N1 > @N2 AND @N1>@N3)SET @MAI_MARE = @N1
ELSE IF (@N2 > @N3) SET @MAI_MARE = @N2
ELSE SET @MAI_MARE = @N3
PRINT @N1;
PRINT @N2;
pRINT @N3;
PRINT 'MAI MARE = ' + CAST(@MAI_MARE AS VARCHAR(2));
--QUERY NR2--
use universitatea
go
select TOP 10 Nume_Student,Prenume_Student,Nota,Tip_Evaluare,Disciplina
from studenti join studenti_reusita
on studenti.Id_Student=studenti_reusita.Id_Student
join discipline
on studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
where Disciplina='Baze de date' and Tip_Evaluare like 'Testul 1' AND (Nota <> 6 or Nota <> 8);

--QUERY NR3--
DECLARE @N1 INT, @N2 INT, @N3 INT;
DECLARE @MAI_MARE INT;
SET @N1 = 60 * RAND();
SET @N2 = 60 * RAND();
SET @N3 = 60 * RAND();
SET @MAI_MARE = @N1;
SET @MAI_MARE = CASE 
	WHEN @MAI_MARE < @N2 THEN @N2
	WHEN @MAI_MARE < @N3 THEN @N3
END;
PRINT @N1;
PRINT @N2;
PRINT @N3;
PRINT 'MAI MARE = ' + CAST(@MAI_MARE AS VARCHAR(2));
--QUERY NR4--
BEGIN TRY
DECLARE @N1 INT, @N2 INT, @N3 INT;
DECLARE @MAI_MARE INT;
SET @N1 = 60 * RAND();
SET @N2 = 60 * RAND();
SET @N3 = 60 / 0;
IF (@N1 > @N2 AND @N1>@N3)SET @MAI_MARE = @N1
ELSE IF (@N2 > @N3) SET @MAI_MARE = @N2
ELSE IF (@N2 <= @N3) SET @MAI_MARE = @N3
ELSE  RAISERROR('ERROR', 16,1);
END TRY

BEGIN CATCH
PRINT 'ERROR LINE: ' + CAST(ERROR_LINE() AS VARCHAR(20));
PRINT 'ERROR SEVERITY: ' + CAST(ERROR_SEVERITY() AS VARCHAR(20));
END CATCH;
