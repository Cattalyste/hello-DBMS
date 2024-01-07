SELECT Country FROM world WHERE population > (SELECT population FROM world where country ='Russia');
SELECT Country FROM world WHERE `GDP ($ per capita)` > (SELECT `GDP ($ per capita)` FROM world where country ='Italy') and Region LIKE '%EUROPE';
SELECT Country FROM world WHERE population between (SELECT population FROM world where country ='United Kingdom') and (SELECT population FROM world where country ='Germany');
SELECT Country, ROUND(population * 100.0 / (select population from world where country = 'Germany'),1) from world WHERE Region LIKE '%EUROPE';
SELECT Region,Country,MAX(`Area (sq. mi.)`) FROM world GROUP BY Region;
SELECT Region,SUM(Population) AS Population FROM world  GROUP BY Region Having Sum(population) <= 25000000;