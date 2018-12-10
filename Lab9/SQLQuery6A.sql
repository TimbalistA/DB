DROP FUNCTION IF EXISTS nume_st_u;
GO
CREATE FUNCTION [dbo].[nume_st_u](@LITERA VARCHAR(255))
RETURNS TABLE
WITH ENCRYPTION
AS
RETURN
	(SELECT Nume_Student, Prenume_Student
	FROM studenti
	WHERE Nume_Student like @LITERA);
SELECT * FROM [dbo].[nume_st_u]('%u')
GO