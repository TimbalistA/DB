use master
go
use universitatea
go
--Interogarea nr --
select Nume_Student, Prenume_Student
from studenti
where Nume_Student like '%u'
--Interogarea nr 26--
(select Nume_Student as Surname, Prenume_Student as [Name], Adresa_Postala_Student as [Address] 
from studenti
where Adresa_Postala_Student like '%31 August%') 
UNION
(select Nume_Profesor as Surname, Prenume_Profesor as [Name], Adresa_Postala_Profesor as [Address] 
from profesori
where Adresa_Postala_Profesor like '%31 August%')
--Interogarea nr 35--
select Disciplina, AVG(Cast(Nota as decimal(4, 2)))as media
from discipline
join studenti_reusita on discipline.Id_Disciplina=studenti_reusita.Id_Disciplina
GROUP BY Disciplina HAVING AVG(Cast(Nota as decimal(4, 2))) > 7.0
