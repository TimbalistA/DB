--QUERY NR3--
USE universitatea
GO
CREATE TABLE orarul (
Id_Disciplina int FOREIGN KEY REFERENCES discipline(Id_Disciplina),
Id_Profesor int  FOREIGN KEY REFERENCES profesori(Id_profesor),
Id_Grupa smallint FOREIGN KEY REFERENCES grupe(Id_Grupa),
Ora TIME,
Auditoriu int,
Bloc char(1),
Zi char(10),
PRIMARY KEY(Id_Grupa, Zi, Ora,Auditoriu)
);