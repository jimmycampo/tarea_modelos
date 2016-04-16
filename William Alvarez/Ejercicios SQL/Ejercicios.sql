#		Realice una consulta SQL que permita obtener :
		
#	1	Los países mas grandes del mundo

SELECT
	  @rownum:= @rownum + 1 AS 'NÚMERO',
      c.`Name` AS 'PAÍS', 
      c.`SurfaceArea` AS 'ÁREA'
FROM
      country c, (SELECT @rownum:=0) r
WHERE
    c.`SurfaceArea`>= (SELECT DISTINCT AVG(country.`SurfaceArea`) FROM	country)
ORDER BY
      c.`SurfaceArea` DESC;
      

#	2	Los 10 países mas grandes del mundo

SELECT
      @rownum:= @rownum + 1 AS 'NÚMERO', 
      c.`Name` AS 'PAÍS', 
      c.`SurfaceArea` AS 'ÁREA'
FROM
      country c, (SELECT @rownum:=0) r
ORDER BY
      c.`SurfaceArea` DESC
LIMIT 10;


#	3	Los 10 países mas ricos del mundo

SELECT
      @rownum:= @rownum + 1 AS 'NÚMERO',
      c.`Name` AS 'PAÍS',
      c.`GNP` AS 'PIB'
FROM
      country c, (SELECT @rownum:=0) r
ORDER BY
      c.`GNP` DESC
LIMIT 10;


#	4	Los 10 países más ricos con el PIB per Cápita

SELECT
      @rownum:= @rownum + 1 AS 'NÚMERO',
      c.`Name` AS 'PAÍS',
      c.`GNP` AS 'PIB',
      c.`Population` AS 'POBLACIÓN',
      (	SELECT c.`GNP`/c.`Population`) AS 'PIB PER CÁPITA'
FROM
	country c, (SELECT @rownum:=0) r

ORDER BY
      5 DESC
LIMIT 10;


#	5	Los 5 países con mayor expectativa de vida

SELECT
      @rownum:= @rownum + 1 AS 'NÚMERO',
      c.`Name` AS 'PAÍS',
      c.`LifeExpectancy` AS 'EXPECTATIVA DE VIDA'
FROM
	country c, (SELECT @rownum:=0) r

ORDER BY
      3 DESC
LIMIT 5;


#	6	El PIB de cada continente

SELECT
      @rownum:= @rownum + 1 AS NÚMERO,
      c.`Continent`AS 'CONTINENTE',
      SUM(c.`GNP`) AS 'PIB'
FROM
    `country` c, (SELECT @rownum:=0) r
GROUP BY
      c.`Continent`
ORDER BY  3 DESC;


#	7	Los 10 países más pequeños del mundo

SELECT
      @rownum:= @rownum + 1 AS 'NÚMERO', 
      c.`Name` AS 'PAÍS', 
      c.`SurfaceArea` AS 'ÁREA'
FROM
      country c, (SELECT @rownum:=0) r
ORDER BY
      c.`SurfaceArea`
LIMIT 10;


#	8	Los países mas grandes del mundo con nombre de 6 letras

SELECT
	  @rownum:= @rownum + 1 AS 'NÚMERO',
      c.`Name` AS 'PAÍS',
      c.`SurfaceArea` AS 'ÁREA'
FROM
      country c, (SELECT @rownum:=0) r
WHERE
      c.`SurfaceArea`>= (SELECT DISTINCT AVG(country.`SurfaceArea`) FROM
	  country)
AND
      c.`Name` LIKE '______'
ORDER BY
      c.`SurfaceArea` DESC;


#	9	El país más rico en cada continente

SELECT  mp.NÚMERO, c.`Name` AS 'PAÍS', c.`Continent` AS 'CONTINENTE', mp.PIB
FROM `country` c RIGHT JOIN
	(SELECT @rownum:= @rownum + 1 AS 'NÚMERO', MAX(co.`GNP`) AS 'PIB'
     FROM
     `country` co, (SELECT @rownum:=0) r
     GROUP BY
     co.`Continent`
     ORDER BY 1 DESC) mp ON (c.`GNP` = mp.PIB)
WHERE c.`GNP` > 0
GROUP BY 2
ORDER BY 4 DESC;
      
      
#	10	El país mas pobre de cada continente

SELECT @rownum:= @rownum + 1 AS 'NÚMERO', minp.PAÍS, minp.CONTINENTE, minp.PIB
FROM   (SELECT  c.`Name` AS 'PAÍS', c.`Continent` AS 'CONTINENTE', mp.PIB
    FROM `country` c RIGHT JOIN
	     (SELECT MIN(co.`GNP`) AS 'PIB'
         FROM
         `country` co
         GROUP BY
         co.`Continent`
         ORDER BY 1 DESC) mp ON (c.`GNP` = mp.PIB)
         GROUP BY 2
         ORDER BY 3 DESC) minp, (SELECT @rownum:=0) r;
		 
		 
#	11	El país más chico de cada continente

SELECT @rownum:= @rownum + 1 AS 'NÚMERO', ma.PAÍS, ma.CONTINENTE, ma.ÁREA
FROM    (SELECT  c.`Name` AS 'PAÍS', c.`Continent` AS 'CONTINENTE', mp.ÁREA
    FROM `country` c RIGHT JOIN
	     (SELECT MIN(co.`SurfaceArea`) AS 'ÁREA'
         FROM
         `country` co
         GROUP BY
         co.`Continent`) mp ON (c.`SurfaceArea` = mp.ÁREA)
      ORDER BY 3 DESC) ma, (SELECT @rownum:=0) r;
	  

#	12	El país más grande de cada continente

SELECT @rownum:= @rownum + 1 AS 'NÚMERO', ma.PAÍS, ma.CONTINENTE, ma.ÁREA
FROM    (SELECT  c.`Name` AS 'PAÍS', c.`Continent` AS 'CONTINENTE', mp.ÁREA
    FROM `country` c RIGHT JOIN
	     (SELECT MAX(co.`SurfaceArea`) AS 'ÁREA'
         FROM
         `country` co
         GROUP BY
         co.`Continent`) mp ON (c.`SurfaceArea` = mp.ÁREA)
      ORDER BY 3 DESC) ma, (SELECT @rownum:=0) r;
	  
	  
#	13	Los países con mejor expectativa de vida independizados en el siglo 20

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Name` AS 'PAÍS',
       ex.`LifeExpectancy` AS 'EXPECTATIVA DE VIDA',
       ex.`IndepYear` AS 'AÑO DE INDEPENDENCIA'
FROM   (SELECT  c.`Name`, c.`LifeExpectancy`, c.`IndepYear`
       FROM `country` c
       WHERE c.`LifeExpectancy` >= (SELECT DISTINCT AVG(`country`.`LifeExpectancy`) FROM `country`)
       AND c.`IndepYear` BETWEEN 1901 AND 2000) ex, (SELECT @rownum:=0) r
ORDER BY 4;


#	14	Los países con peor expectativa de vida independizados en el siglo 20

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Name` AS 'PAÍS',
       ex.`LifeExpectancy` AS 'EXPECTATIVA DE VIDA',
       ex.`IndepYear` AS 'AÑO DE INDEPENDENCIA'
FROM   (SELECT  c.`Name`, c.`LifeExpectancy`, c.`IndepYear`
       FROM `country` c
       WHERE c.`LifeExpectancy` < (SELECT DISTINCT AVG(`country`.`LifeExpectancy`) FROM `country`)
       AND c.`IndepYear` BETWEEN 1901 AND 2000) ex, (SELECT @rownum:=0) r
ORDER BY 4;


#	15	Los países con mejor expectativa de vida sin independizarse aun

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Name` AS 'PAÍS',
       ex.`LifeExpectancy` AS 'EXPECTATIVA DE VIDA'
FROM   (SELECT  c.`Name`, c.`LifeExpectancy`
       FROM `country` c
       WHERE c.`LifeExpectancy` >= (SELECT DISTINCT AVG(`country`.`LifeExpectancy`) FROM `country`)
       AND c.`IndepYear` IS NULL) ex, (SELECT @rownum:=0) r
ORDER BY 3 DESC;


#	16	Los países, no americanos, con mejor expectativa de vida

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Name` AS 'PAÍS',
       ex.`LifeExpectancy` AS 'EXPECTATIVA DE VIDA',
       ex.`Continent` AS 'CONTINENTE'
FROM   (SELECT  c.`Name`, c.`LifeExpectancy`, c.`Continent`
       FROM `country` c
       WHERE c.`LifeExpectancy` < (SELECT DISTINCT AVG(`country`.`LifeExpectancy`) FROM `country`)
       AND c.`Continent` NOT IN ('North America', 'South America')) ex, (SELECT @rownum:=0) r
ORDER BY 4,3 DESC;


#	17	Los países que se independizaron en el siglo 20

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Name` AS 'PAÍS',
       ex.`IndepYear` AS 'AÑO DE INDEPENDENCIA'
FROM   (SELECT  c.`Name`, c.`IndepYear`
       FROM `country` c
       WHERE c.`IndepYear` BETWEEN 1901 AND 2000) ex, (SELECT @rownum:=0) r
ORDER BY 3;


#	18	Los países más ricos independizados en el siglo 20

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Name` AS 'PAÍS',
       ex.`GNP` AS 'PIB',
       ex.`IndepYear` AS 'AÑO DE INDEPENDENCIA'
FROM   (SELECT  c.`Name`, c.`GNP`, c.`IndepYear`
       FROM `country` c
       WHERE c.`GNP` < (SELECT DISTINCT AVG(`country`.`GNP`) FROM `country`)
       AND c.`IndepYear` BETWEEN 1901 AND 2000) ex, (SELECT @rownum:=0) r
ORDER BY 4, 3 DESC;


#	19	Los países que se independizaron antes de Cristo

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Name` AS 'PAÍS',
       ex.`IndepYear` AS 'AÑO DE INDEPENDENCIA'
FROM   (SELECT  c.`Name`, c.`IndepYear`
       FROM `country` c
       WHERE c.`IndepYear` < 0 ) ex, (SELECT @rownum:=0) r
ORDER BY 3;


#	20	Los países que se independizaron en un año bisiesto

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Name` AS 'PAÍS',
       ex.`IndepYear` AS 'AÑO DE INDEPENDENCIA'
FROM   (SELECT  c.`Name`, c.`IndepYear`
       FROM `country` c
       WHERE (c.`IndepYear` % 4) = 0
       AND (c.`IndepYear` % 100) != 0
       OR (c.`IndepYear` % 400) = 0 ) ex, (SELECT @rownum:=0) r
ORDER BY 3;


#	21	Todos los países y la cantidad de años que han transcurrido desde que se independizaron

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Name` AS 'PAÍS',
       ex.`IndepYear` AS 'AÑO DE INDEPENDENCIA',
       ex.`cant` AS 'CANTIDAD AÑOS DE INDEPENDENCIA'
FROM   (SELECT  c.`Name`, c.`IndepYear`, (YEAR(NOW()) - C.`IndepYear`) AS 'cant'
       FROM `country` c
       WHERE c.`IndepYear` IS NOT NULL ) ex, (SELECT @rownum:=0) r
ORDER BY 3;


#	22	Los países que se independizaron después de Colombia

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Name` AS 'PAÍS',
       ex.`IndepYear` AS 'AÑO DE INDEPENDENCIA'
FROM   (SELECT  c.`Name`, c.`IndepYear`
       FROM `country` c
       WHERE c.`IndepYear` > (SELECT col.`IndepYear`
                             FROM `country` col
                             WHERE col.`Code` = 'COL')) ex, (SELECT @rownum:=0) r
ORDER BY 3;


#	23	Los países que no se han independizado aun (no reportan fecha de independencia)

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Name` AS 'PAÍS',
       ex.`null` AS 'AÑO DE INDEPENDENCIA'
FROM   (SELECT  c.`Name`, IFNULL(c.`IndepYear`,'No Reporta') AS 'null'
       FROM `country` c
       WHERE c.`IndepYear` IS NULL ) ex, (SELECT @rownum:=0) r
ORDER BY 3;


#	24	El primer país que se independizó

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Name` AS 'PAÍS',
       ex.`IndepYear` AS 'AÑO DE INDEPENDENCIA'
FROM   (SELECT  c.`Name`, c.`IndepYear`
       FROM `country` c
       WHERE c.`IndepYear` = (SELECT MIN(m.`IndepYear`)
                             FROM `country` m )) ex, (SELECT @rownum:=0) r;
							 

#	25	El último país que se independizó

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Name` AS 'PAÍS',
       ex.`IndepYear` AS 'AÑO DE INDEPENDENCIA'
FROM   (SELECT  c.`Name`, c.`IndepYear`
       FROM `country` c
       WHERE c.`IndepYear` = (SELECT MAX(m.`IndepYear`)
                             FROM `country` m )) ex, (SELECT @rownum:=0) r;
							 

#	26	El continente con mas independencias en el siglo 20

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Continent` AS 'CONTINENTE',
       MAX(ex.`cant`) AS 'CANTIDAD DE INDEPENDENCIAS'
FROM   (SELECT  c.`Continent`,
        COUNT(c.`IndepYear`) AS 'cant'
       FROM
           `country` c
       WHERE c.`IndepYear` BETWEEN 1901 AND 2000
       GROUP BY
             c.`Continent`
       ORDER BY  2 DESC) ex, (SELECT @rownum:=0) r;
	   

#	27	El primer país en independizarse en cada continente

SELECT 
  `country`.`Name`,
  `country`.`Continent`,
  `country`.`INDEPYEAR`
FROM
  `country`
WHERE
  `country`.`INDEPYEAR` = (SELECT MIN(`c`.`INDEPYEAR`) AS `FIELD_1` FROM `country` `c` WHERE `c`.`Continent` = `country`.`Continent`)
ORDER BY 3 



#	28	El último país en independizarse en cada continente

SELECT 
  `country`.`Name`,
  `country`.`Continent`,
  `country`.`INDEPYEAR`
FROM
  `country`
WHERE
  `country`.`INDEPYEAR` = (SELECT MAX(`c`.`INDEPYEAR`) AS `FIELD_1` FROM `country` `c` WHERE `c`.`Continent` = `country`.`Continent`)
ORDER BY 3 

#	29	El continente con mas independencias en el siglo 20

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Continent` AS 'CONTINENTE',
       MAX(ex.`cant`) AS 'CANTIDAD DE INDEPENDENCIAS'
FROM   (SELECT  c.`Continent`,
        COUNT(c.`IndepYear`) AS 'cant'
       FROM
           `country` c
       WHERE c.`IndepYear` BETWEEN 1901 AND 2000
       GROUP BY
             c.`Continent`
       ORDER BY  2 DESC) ex, (SELECT @rownum:=0) r;
	   

#	30	El continente con mas países sin independizarse aun

SELECT q.NÚMERO,
       q.`Continent` AS 'CONTINENTE',
	   q.`cant` AS 'CANTIDAD DE INDEPENDENCIAS'
FROM (SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
		   ex.`Continent`,
		   ex.`cant`
	 FROM   (SELECT  c.`Continent`,
			COUNT(c.`Name`) AS 'cant'
		   FROM
			   `country` c
		   WHERE c.`IndepYear` IS NULL
		   GROUP BY
				 c.`Continent`
		   ORDER BY  2 DESC) ex, (SELECT @rownum:=0) r) q
WHERE q.`cant` = (SELECT MAX(w.cant) AS 'max'
                 FROM  (SELECT COUNT(c.`Name`) AS 'cant'
                       FROM
		                     `country` c
                       WHERE c.`IndepYear` IS NULL
                       GROUP BY
			           c.`Continent`) w)
					   

#	31	El mejor país del mundo

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Name` AS 'PAÍS',
       ex.`LifeExpectancy` AS 'EXPECTATIVA DE VIDA',
       ex.`ppc` AS 'PIB PER CÁPITA'
FROM   (SELECT  c.`Name`,
                c.`LifeExpectancy`,
                (c.`GNP`/c.`Population`) AS 'ppc'
       FROM `country` c
       WHERE c.`LifeExpectancy` >= (SELECT DISTINCT AVG(`country`.`LifeExpectancy`) FROM `country`)) ex, (SELECT @rownum:=0) r
ORDER BY 4 DESC, 3 DESC;


#	32	La expectativa de vida promedio de África

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Continent` AS 'CONTINENTE',
       ex.`exp` AS 'PROMEDIO EXPECTATIVA DE VIDA'
FROM   (SELECT q.`Continent`, AVG(q.`LifeExpectancy`) AS 'exp'
       FROM `country` q
       WHERE q.`Continent` = 'Africa') ex, (SELECT @rownum:=0) r
	   

#	33	La fecha promedio de la independencia de los países en América del Sur

SELECT @rownum:= @rownum + 1 AS 'NÚMERO',
       ex.`Continent` AS 'CONTINENTE',
       ex.`ind` AS 'PROMEDIO AÑO DE INDEPENDENCIA'
FROM   (SELECT q.`Continent`, AVG(q.`IndepYear`) AS 'ind'
       FROM `country` q
       WHERE q.`Continent` = 'South America') ex, (SELECT @rownum:=0) r

#	34	Los primeros 10 países en independizarse

SELECT
      @rownum:= @rownum + 1 AS 'NÚMERO',
      c.`Name` AS 'PAÍS',
      c.`IndepYear` AS 'AÑO DE INDEPENDENCIA'
FROM
      country c, (SELECT @rownum:=0) r
WHERE c.`IndepYear` IS NOT NULL
ORDER BY
      c.`IndepYear`
LIMIT 10;


#	35	La expectativa de vida promedio de cada continente


SELECT	 @rownum:= @rownum + 1 AS 'NÚMERO',
         q.`Continent` AS 'CONTINENTE',
         q.`exp` AS 'PROMEDIO EXPECTATIVA DE VIDA'
FROM(SELECT  co.`Continent` , AVG(co.`LifeExpectancy`) AS 'exp'
     FROM
     `country` co
     GROUP BY  co.`Continent`) q, (SELECT @rownum:=0) r
WHERE q.`exp` IS NOT NULL
ORDER BY 3 DESC;

#	36	La expectativa de vida promedio de cada continente con la diferencia en años respecto a la mayor expectativa

SELECT	 @rownum:= @rownum + 1 AS 'NÚMERO',
         q.`Continent` AS 'CONTINENTE',
         q.`exp` AS 'PROMEDIO EXPECTATIVA DE VIDA',
         ((SELECT  MAX(c.`LifeExpectancy`) FROM   `country` c) - q.exp) AS 'DIFERENCIA CON LA MAYOR EXPECTATIVA'
FROM(SELECT  co.`Continent` , AVG(co.`LifeExpectancy`) AS 'exp'
FROM `country` co
GROUP BY  co.`Continent`) q, (SELECT @rownum:=0) r
WHERE q.`exp` IS NOT NULL
ORDER BY 3 DESC;


#	37	Cada continente con la cantidad de países que posee ordenados de mayor a menor
     
SELECT	 @rownum:= @rownum + 1 AS 'NÚMERO',
         q.`Continent` AS 'CONTINENTE',
         q.`sum` AS 'CANTIDAD PAISES'
FROM(SELECT  co.`Continent` ,COUNT(co.`Code`) AS 'sum'
     FROM
     `country` co
     GROUP BY  co.`Continent`) q, (SELECT @rownum:=0) r
ORDER BY 3 DESC;


#	38	Cada continente con el porcentaje de población del mundo que le corresponde

SELECT	 @rownum:= @rownum + 1 AS 'NÚMERO',
         q.`Continent` AS 'CONTINENTE',
         CONCAT(q.`sum`,"%") AS 'PORCENTAJE DE POBLACIÓN'
FROM(SELECT  co.`Continent` , ROUND((SUM(co.`Population`)/(SELECT SUM(c.`Population`)
                                                            FROM `country` c) *100 ),2) AS 'sum'
     FROM
     `country` co
     GROUP BY  co.`Continent`) q, (SELECT @rownum:=0) r
ORDER BY 2;


#	39	El tamaño de cada continente ordenados de mayor a menor

SELECT	 @rownum:= @rownum + 1 AS 'NÚMERO',
         q.`Continent` AS 'CONTINENTE',
         q.`sa` AS 'ÁREA'
FROM(SELECT c.`Continent`, SUM(c.`SurfaceArea`) AS 'sa'
     FROM `country` c
     GROUP BY 1
) q, (SELECT @rownum:=0) r
ORDER BY 3 desc


#	40	Todos los países con sus capitales (si no tiene mostrar "no registra")

SELECT
	  @rownum:= @rownum + 1 AS 'NÚMERO',
      c.`Name` AS 'PAÍS',
      IFNULL(ci.`Name`,'No Registra') AS 'CAPITAL'
FROM
      country c LEFT JOIN `city` ci ON (c.`Capital` = ci.`ID`), (SELECT @rownum:=0) r
ORDER BY 2;


#	41	Los países cuya capital tenga una población de mas de 1 millón de habitantes

SELECT
	  @rownum:= @rownum + 1 AS 'NÚMERO',
      c.`Name` AS 'PAÍS',
      IFNULL(ci.`Name`,'No Registra') AS 'CAPITAL',
      c.`Population` AS 'POBLACIÓN CAPITAL'
FROM
      country c LEFT JOIN `city` ci ON (c.`Capital` = ci.`ID`), (SELECT @rownum:=0) r
WHERE ci.`Population` > 1000000
ORDER BY 4 DESC;


#	42	Los países donde se hable más de 2 idiomas oficiales

SELECT	 @rownum:= @rownum + 1 AS 'NÚMERO',
         c.`Name` AS 'PÁIS',
         q.`ci` AS 'CANTIDAD DE IDIOMAS OFICIALES'
FROM(SELECT cl.`CountryCode`, COUNT(cl.`IsOfficial`) AS 'ci'
            FROM `countrylanguage` cl
            WHERE cl.`IsOfficial`= 'T'
            GROUP BY cl.`CountryCode`) q JOIN `country` c ON (q.`CountryCode` = c.`Code`),  (SELECT @rownum:=0) r
WHERE q.ci > 2
ORDER BY 3 DESC;


#	43	Los 5 idiomas más hablados en el mundo

#POR CANTIDAD DE PAISES

SELECT	 @rownum:= @rownum + 1 AS 'NÚMERO',
         q.`Language` AS 'PÁIS',
         q.`cp` AS 'CANTIDAD DE PAISES QUE LO HABLAN'
FROM(SELECT cl.`Language`, COUNT(cl.`Language`) AS 'cp'
            FROM `countrylanguage` cl
            GROUP BY cl.`Language`
            ORDER BY 2 DESC
            LIMIT 5) q,  (SELECT @rownum:=0) r
ORDER BY 3 DESC;


#	44	Las ciudades sin capital ??



#	45	Las ciudades capitales donde se hablen mas de 2 idiomas




#	46	Las ciudades mas pobladas de África y Europa

SELECT	  @rownum:= @rownum + 1 AS 'NÚMERO',
         q.`Continent` AS 'CONTINENTE',
         q.`Name`AS 'CIUDAD',
         q.`Population` AS 'POBLACIÓN'
FROM((SELECT c.`Continent`, ci.`Name`, ci.`Population`
FROM  `country`c LEFT JOIN `city` ci ON (c.`Code` = ci.`CountryCode`)
WHERE c.`Continent` = 'Africa'
ORDER BY 3 DESC
LIMIT 1)

UNION

((SELECT c.`Continent`, ci.`Name`, ci.`Population`
FROM  `country`c LEFT JOIN `city` ci ON (c.`Code` = ci.`CountryCode`)
WHERE c.`Continent` = 'Europe'
ORDER BY 3 DESC
LIMIT 1)

)) q, (SELECT @rownum:=0) r


#	47	La ciudad más poblada del mundo y la menos poblada del mundo

SELECT	  @rownum:= @rownum + 1 AS 'NÚMERO',
         q.`Name`AS 'CIUDAD',  
         q.`Population` AS 'POBLACIÓN'
FROM((SELECT ci.`Name`, ci.`Population`
FROM `city` ci
WHERE ci.`Population` = (SELECT MIN(c.`Population`) FROM city c)
)
UNION
(SELECT ci.`Name`, ci.`Population`
FROM `city` ci
WHERE ci.`Population` = (SELECT MAX(c.`Population`) FROM city c)
)) q, (SELECT @rownum:=0) r
ORDER BY 2 DESC;


#	48	La población sumada de toda sur-américa excepto brasil y además, la población de brasil

SELECT	 @rownum:= @rownum + 1 AS 'NÚMERO',
         q.`ct` AS 'POR REGIÓN',
         q.`sp` AS 'POBLACIÓN'
FROM((SELECT CONCAT(c.`Continent` , " sin Brazil" ) AS 'ct', SUM(c.`Population`) AS 'sp'
FROM `country` c
WHERE c.`Continent` = 'South America'
AND c.`Code` <> 'BRA'
)
UNION
(SELECT c.`Name`, c.`Population`
FROM `country` c
WHERE c.`Code` = 'BRA'
)) q, (SELECT @rownum:=0) r
ORDER BY 2 DESC;


#	49	Todos los países con sus capitales y los idiomas que hablan ordenados alfabéticamente

SELECT
		  @rownum:= @rownum + 1 AS 'NÚMERO',
		  id.`Name` AS 'PAÍS',
		  id.`CAPITAL`,
		  id.`Language` AS 'IDIOMAS'
FROM	(SELECT
		  c.`Name`,
		  IFNULL(ci.`Name`,'No Registra') AS 'CAPITAL',
		  cl.`Language`
	FROM
		  country c LEFT JOIN `city` ci ON (c.`Capital` = ci.`ID`)
		  JOIN `countrylanguage` cl ON (cl.`CountryCode` = c.`Code`)) id, (SELECT @rownum:=0) r
ORDER BY 2,4;


#	50	Todos los países con sus capitales y la cantidad de idiomas que hablan

SELECT
	  @rownum:= @rownum + 1 AS 'NÚMERO',
      c.`Name` AS 'PAÍS',
      IFNULL(ci.`Name`,'No Registra') AS 'CAPITAL',
      (SELECT COUNT(cl.`Language`) FROM `countrylanguage` cl WHERE cl.`CountryCode` = c.`Code`) AS 'CANTIDAD DE IDIOMAS'
FROM
      country c LEFT JOIN `city` ci ON (c.`Capital` = ci.`ID`), (SELECT @rownum:=0) r
ORDER BY 2;


#	51	Todos los países donde el ingles es el idioma oficial 

SELECT    @rownum:= @rownum + 1 AS 'NÚMERO',
          id.`Name` AS 'PAÍS',
          id.`Language` AS 'IDIOMA OFICIAL'
FROM (SELECT	
      c.`Name`,
      cl.`Language`
      FROM
      country c LEFT JOIN `countrylanguage` cl ON (c.`Code` = cl.`CountryCode`)
      WHERE cl.`IsOfficial` = 'T'
      AND cl.`Language` = 'English') id, (SELECT @rownum:=0) r
ORDER BY 2;





