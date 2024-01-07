SELECT Population FROM world WHERE Country = 'Germany';
SELECT Country,Population FROM world WHERE Country IN ('Sweden', 'Norway', 'Denmark');
SELECT Country,Population FROM world WHERE `Area (sq. mi.)` BETWEEN 200000 AND 300000;