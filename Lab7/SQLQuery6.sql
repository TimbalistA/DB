--QUERY NR6--
USE universitatea
GO
CREATE SCHEMA cadre_didactice
GO
CREATE SCHEMA plan_studii
GO
CREATE SCHEMA studenti
GO
ALTER SCHEMA cadre_didactice TRANSFER [dbo].[profesori]
GO
ALTER SCHEMA plan_studii TRANSFER [dbo].[orarul]
GO
ALTER SCHEMA plan_studii TRANSFER [dbo].[discipline]
GO
ALTER SCHEMA studenti TRANSFER [dbo].[studenti]
GO
ALTER SCHEMA studenti TRANSFER [dbo].[studenti]
GO
ALTER SCHEMA studenti TRANSFER [dbo].[studenti_reusita]
GO
