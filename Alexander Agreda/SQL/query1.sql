--Los pa�ses mas grandes del mundo
SELECT 
c.Name AS "Pais",
c.SurfaceArea as "Area de superficie"
FROM `country` c
ORDER BY c.SurfaceArea DESC;

--Los 10 pa�ses mas grandes del mundo
SELECT 
c.Name AS "Pais", 
c.SurfaceArea AS "Area de superficie"
FROM `country` c
ORDER BY c.SurfaceArea DESC LIMIT 10;

--Los 10 pa�ses mas ricos del mundo
SELECT c.Name AS "Pais",
c.GNP AS "PIB (Producto Interno Bruto)"
FROM `country` c
ORDER BY c.GNP DESC LIMIT 10;

--Los 10 pa�ses m�s ricos con el PIB per C�pita
SELECT 
c.Name AS "Pais",
c.GNP AS "PIB (Producto Interno Bruto)",
(c.GNP / c.Population) as "PIB per capita"
FROM `country` c 
ORDER BY c.GNP DESC LIMIT 10;

--Los 5 pa�ses con mayor expectativa de vida
SELECT 
c.Name AS "Pais",
c.LifeExpectancy AS "Espectativa de vida"
FROM `country` c
ORDER BY c.LifeExpectancy DESC LIMIT 5;

--El PIB de cada continente
SELECT
c.Continent AS "Continente",
SUM(c.GNP) AS "Producto Interno Bruto"
FROM country c
GROUP BY c.Continent
ORDER BY 2 DESC

--Los 10 pa�ses m�s peque�os del mundo
SELECT 
c.Name AS "Pais", 
c.SurfaceArea AS "Area de superficie"
FROM `country` c
ORDER BY c.SurfaceArea ASC LIMIT 5