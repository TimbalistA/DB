--QUERY NR2--
use universitatea
go
ALTER TABLE grupe ALTER COLUMN Cod_Grupa char(6) NOT NULL;
ALTER TABLE grupe
ADD CONSTRAINT Cod UNIQUE(Cod_Grupa);