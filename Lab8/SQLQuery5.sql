WITH numeU (Nume_Student,Prenume_Student) AS
(SELECT Nume_Student, Prenume_Student FROM dbo.studenti)
SELECT Nume_Student, Prenume_Student
	FROM numeU u
	WHERE (u.Nume_Student LIKE '%u')
WITH allgrupe (Id_Grupa,Cod_Grupa,Specialitate,Nume_Facultate) AS
(SELECT Id_Grupa,Cod_Grupa,Specialitate,Nume_Facultate FROM grupe)
SELECT allg.Id_Grupa,allg.Cod_Grupa,allg.Specialitate,allg.Nume_Facultate 
	FROM allgrupe allg
	ORDER BY allg.Nume_Facultate ASC