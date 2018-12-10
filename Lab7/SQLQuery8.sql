use universitatea
go
CREATE SYNONYM Stud FOR [studenti].[studenti]
CREATE SYNONYM Pro FOR [cadre_didactice].[profesori]
CREATE SYNONYM Dis FOR  [plan_studii].[discipline]
CREATE SYNONYM StudR FOR  [studenti].[studenti_reusita]
--QUERY NR5--
select Nume_Student, Prenume_Student
from Stud
where Nume_Student like '%u'
--QUERY NR26--
(select Nume_Student as Surname, Prenume_Student as [Name], Adresa_Postala_Student as [Address] 
from Stud
where Adresa_Postala_Student like '%31 August%') 
UNION
(select Nume_Profesor as Surname, Prenume_Profesor as [Name], Adresa_Postala_Profesor as [Address] 
from Pro
where Adresa_Postala_Profesor like '%31 August%')
--QUERY NR35--
select Disciplina, AVG(Cast(Nota as decimal(4, 2)))as media
from Dis
join StudR on Dis.Id_Disciplina=StudR.Id_Disciplina
GROUP BY Disciplina HAVING AVG(Cast(Nota as decimal(4, 2))) > 7.0
