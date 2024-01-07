SELECT SUM(Population) FROM world;
SELECT Region,SUM(Population) FROM world GROUP BY Region;
SELECT Region,SUM(`GDP ($ per capita)` * population) AS `PIB par continent` from world GROUP BY Region;
SELECT SUM(`GDP ($ per capita)` * population) AS `PIB de l'Afrique` from world where Region like '%AFRICA';
SELECT Count(Country) from world where `Area (sq. mi.)` > 1000000;
SELECT SUM(Population) FROM world WHERE Country = 'Estonia' or Country = 'Latvia' or Country = 'Lithuania';
SELECT Region,Count(Country) FROM world Group by Region;
SELECT Region,SUM(Population) FROM world GROUP BY Region Having Sum(population) > 100000000;