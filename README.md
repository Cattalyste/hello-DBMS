# Hello DBMS

## Introduction

Bienvenue dans le référentiel de Hello DBMS, un projet d'introduction sur les bases de données. Ce document vise à fournir une introduction générale aux concepts fondamentaux des bases de données, ainsi que des informations détaillées sur des sujets spécifiques.

## Veille technologique

### 1. Qu’est ce qu’une donnée ? Sous quelle forme peut-elle se présenter ?

Une donnée est une information brute qui a bien évolué au fil des période de notre histoire. Aujourd'hui elle peut être textuelle, numérique, graphique, audio, vidéo, géospatiale, temporelle, structurée ou non structurée. Les données sont la base de l'analyse et de la prise de décision, et peuvent revêtir différentes formes en fonction du contexte.

### 2. Quelles sont les critères de mesure de qualité des données ?

Les critères de mesure de qualité des données comprennent l'exactitude, la complétude, la cohérence, l'actualité, l'uniformité, la fidélité, l'accessibilité, la clarté, la pertinence et l'évolutivité. Ces critères évaluent la précision, la pertinence temporelle, la fiabilité, la lisibilité et la pertinence des données. Une gestion efficace de ces critères garantit des données fiables pour des analyses précises et des prises de décision éclairées. Cette liste de qualité est exhaustive et suivant le contexte d'un projet seul certains critères sont principalement retenus.

### 3. Qu'est ce qu'un Data Lake, Data Warehouse et Lake House ?

Un Data Lake est un référentiel de stockage pour des données brutes et diverses. Les schémas peuvent être très variés. De plus les type de données ne sont pas non plus homogène.
Un Data Warehouse est une base de données pour l'analyse structurée. Sont cadre est bien plus rigide.
Enfin un Lake House est une approche hybride entre un Data Lake et un Data Warehouse qui permet de combiné la flexibilité de l'un et la possibilité d'analyse de l'autre.
Afin de les comparer voici un résumé bref :
•	Données : Lake (brutes), Warehouse (transformées).
•	Flexibilité : Lake (élevée), Warehouse (structurée).
•	Analyse : Lake (stockage), Warehouse (analyse complexe).
•	Hybride : Lake House combine flexibilité et analyse.


### 4. Qu'est ce qu'un Système de Gestion de Bases de Données (SGBD) ?

Il s'agit d'un logiciel permettant de stocker, organiser et gérer efficacement des données dans une base de données.
Voici une liste de différent SGBD : MySQL,Oracle Database,Microsoft SQL Server,PostgreSQL,MongoDB ....

### 5. Qu’est ce qu’une base de données relationnelle ?

Il s'agit d'un système de gestion de base de données structuré où les données sont organisées en tables reliées par des clés.
Il existe aussi des base de données non relationelle : il s'agit alors d'un système de gestion de base de données qui stocke les données de manière plus flexible que les bases de données relationnelles, souvent sans schéma prédéfini.

Les base de données relationnelle possèdent des structure tabulaire, schéma fixe, utilisation de SQL, adaptée aux données interconnectées. Elles peuvent être utilisées pour des systèmes de gestion d'inventaire, systèmes financiers.
Les base de données non relationnelle possèdent des structure flexible, pas de schéma fixe, divers modèles de données (document, clé-valeur, graphe), adaptée à l'évolutivité et à la variété des données. Elles peuvent être utilisées pour des applications web à fort trafic, systèmes de gestion de contenu, analyse de données non structurées.


### 6. Qu'est ce qu'une clé étrangère et une clé primaire ?

Une clé primaire est un identifiant unique pour chaque enregistrement dans une table de base de données.
Une clé étrangère est une colonne d'une table qui fait référence à la clé primaire d'une autre table, établissant ainsi une relation entre les deux tables.

### 7. Quelles sont les propriétés ACID ?

Les propriétés ACID sont des caractéristiques fondamentales garantissant la fiabilité des transactions dans les bases de données. ACID signifie :
•	Atomicité (Atomicity) : Une transaction est traitée comme une unité indivisible, soit toutes ses opérations sont exécutées avec succès, soit aucune ne l'est.
•	Cohérence (Consistency) : Une transaction amène la base de données d'un état valide à un autre, préservant l'intégrité de la base de données.
•	Isolation (Isolation) : Les transactions en cours sont isolées les unes des autres, garantissant que l'exécution simultanée de plusieurs transactions n'interfère pas avec la cohérence des données.
•	Durabilité (Durability) : Une fois qu'une transaction est confirmée, ses modifications sont permanentes et survivent à tout incident, assurant la persistance des données modifiées.
Ces propriétés garantissent la fiabilité des transactions dans un environnement de base de données.

### 8. Méthodes Merise et UML

La méthode Merise est une méthode de modélisation en informatique, notamment pour la conception de systèmes d'information. Elle utilise des diagrammes comme le MCD (Modèle Conceptuel de Données) pour représenter les concepts, entités et relations d'un système.
La méthode UML est un langage de modélisation visuelle utilisé dans le domaine du génie logiciel. Il offre des diagrammes pour représenter les aspects structurels et comportementaux des systèmes logiciels.

Par exemple on va utiliser Merise pour modéliser les entités et leurs relations dans un système d'achat en ligne, on peut utiliser un MCD. Par exemple, un diagramme entité-relation (ERD) représentant les entités telles que "Client", "Produit" et "Commande", ainsi que leurs relations.

Par exemple on va utiliser UML pour modéliser le flux d'un processus de réservation de billets en ligne, on peut utiliser un diagramme de séquence UML. Il montrera comment les objets (comme "Utilisateur", "Système de Réservation") interagissent au fil du temps pour accomplir une tâche spécifique.

### 9. Le language SQL

SQL (Structured Query Language) :
•	Définition : Langage de programmation spécialement conçu pour la gestion et la manipulation des bases de données relationnelles. Il permet d'effectuer diverses opérations telles que l'insertion, la mise à jour, la suppression et la récupération de données.
Commandes SQL couramment utilisées :
1.	SELECT : Récupère des données depuis une ou plusieurs tables.
2.	INSERT : Insère de nouvelles lignes de données dans une table.
3.	UPDATE : Modifie les données existantes dans une table.
4.	DELETE : Supprime des lignes de données d'une table.
5.	CREATE : Crée une nouvelle table, une vue ou une base de données.
6.	ALTER : Modifie la structure d'une table existante.
7.	DROP : Supprime une table, une vue ou une base de données.
Différentes jointures en SQL :
1.	INNER JOIN : Retourne les lignes lorsque des correspondances sont trouvées dans les deux tables.
2.	LEFT (OUTER) JOIN : Retourne toutes les lignes de la table de gauche et les lignes correspondantes de la table de droite.
3.	RIGHT (OUTER) JOIN : Retourne toutes les lignes de la table de droite et les lignes correspondantes de la table de gauche.
4.	FULL (OUTER) JOIN : Retourne toutes les lignes lorsqu'il y a une correspondance dans l'une des tables.
5.	CROSS JOIN : Retourne le produit cartésien de deux tables, toutes les combinaisons possibles.
Ces commandes et jointures constituent les bases pour interagir avec les bases de données relationnelles à l'aide du langage SQL.



