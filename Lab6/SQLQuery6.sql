--QUERY NR6--
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
PRIMARY KEY(Id_Disciplina, Id_Profesor, Id_Grupa)
);

INSERT INTO orarul (Id_Disciplina, Id_Profesor, Id_Grupa, Ora, Auditoriu, Bloc, Zi)
VALUES(107, 101, (SELECT Id_Grupa FROM grupe WHERE Cod_Grupa = 'CIB171'), '08:00', 202, 'B', 'Luni'),
	  (108, 101, (SELECT Id_Grupa FROM grupe WHERE Cod_Grupa = 'CIB171'), '11:30', 501, 'B', 'Luni'),
      (119, 117, (SELECT Id_Grupa FROM grupe WHERE Cod_Grupa = 'CIB171'), '13:00', 501, 'B', 'Luni');

SELECT *
FROM orarul