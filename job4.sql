SELECT * FROM nobel WHERE yr = 1986;
SELECT * FROM nobel WHERE yr = 1967 AND subject = 'Literature';
SELECT yr,subject FROM nobel WHERE winner = 'Albert Einstein';
SELECT * FROM nobel WHERE yr between 1980 and 1989;
SELECT * From nobel WHERE subject = 'Matematics';
SELECT COUNT(*) From nobel WHERE subject = 'Matematics'; #Il n'y a jamais eu de prix nobel de mathématiques il me semble dans tout les cas ?