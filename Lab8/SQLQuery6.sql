WITH nod (Nod) AS
( SELECT 3
UNION ALL
SELECT Nod-1 FROM nod WHERE Nod > 0
)
SELECT * FROM nod;