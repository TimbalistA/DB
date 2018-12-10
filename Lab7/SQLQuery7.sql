use universitatea
go
--QUERY NR5--
select Nume_Student, Prenume_Student
from studenti.studenti
where Nume_Student like '%u'
--QUERY NR26--
(select Nume_Student as Surname, Prenume_Student as [Name], Adresa_Postala_Student as [Address] 
from studenti.studenti
where Adresa_Postala_Student like '%31 August%') 
UNION
(select Nume_Profesor as Surname, Prenume_Profesor as [Name], Adresa_Postala_Profesor as [Address] 
from [cadre_didactice].[profesori]
where Adresa_Postala_Profesor like '%31 August%')
--QUERY NR35--
select Disciplina, AVG(Cast(Nota as decimal(4, 2)))as media
from [plan_studii].[discipline]
join studenti.studenti_reusita on [plan_studii].[discipline].Id_Disciplina=studenti.studenti_reusita.Id_Disciplina
GROUP BY Disciplina HAVING AVG(Cast(Nota as decimal(4, 2))) > 7.0
