--QUERY NR5--
USE universitatea
GO
CREATE TABLE profesori_new
(Id_profesor int primary key Clustered
,Nume_Profesor char (20)
,Prenume_Profesor char (20)
,Localitate char (120) DEFAULT('mun. Chisinau')
,Adresa_1 char (120)
,Adresa_2 char (120)
)
go
INSERT INTO profesori_new(Id_Profesor, Nume_Profesor, Prenume_Profesor, Localitate, Adresa_1, Adresa_2)
SELECT Id_Profesor, Nume_Profesor, Prenume_Profesor,
(SUBSTRING(Adresa_Postala_Profesor,1,IIF(CHARINDEX('bd',Adresa_Postala_Profesor,1)>0,
										CHARINDEX('bd',Adresa_Postala_Profesor,1)-3,
									IIF(CHARINDEX('str',Adresa_Postala_Profesor,1)>0,
									CHARINDEX('str',Adresa_Postala_Profesor,1)-3,LEN(Adresa_Postala_Profesor))))), 
(SUBSTRING(Adresa_Postala_Profesor,IIF(CHARINDEX('bd', Adresa_Postala_Profesor,1)>0,
									   CHARINDEX('bd', Adresa_Postala_Profesor,1),
									IIF(CHARINDEX('str', Adresa_Postala_Profesor,1)>0,
									CHARINDEX('str', Adresa_Postala_Profesor,1),0)),
									IIF(CHARINDEX('bd', Adresa_Postala_Profesor,1)>0,	
									CHARINDEX(',', Adresa_Postala_Profesor, 
									CHARINDEX('bd', Adresa_Postala_Profesor,1)+1) - CHARINDEX('bd', Adresa_Postala_Profesor,1),
									IIF(CHARINDEX('str', Adresa_Postala_Profesor,1)>0,	
									CHARINDEX(',', Adresa_Postala_Profesor, 
									CHARINDEX('str', Adresa_Postala_Profesor,1)+1) - CHARINDEX('str', Adresa_Postala_Profesor,1),0)))),
(substring(Adresa_Postala_Profesor,PATINDEX( '%[0-9]%',Adresa_Postala_Profesor),
									IIF(charindex(',', Adresa_Postala_Profesor,1)>0,5,0)))
FROM profesori

SELECT *
FROM profesori_new