#1
CREATE DATABASE IF NOT EXISTS SomeCompany;

#2
CREATE TABLE Employees (
    employee_id int NOT NULL AUTO_INCREMENT,
    first_name char(128)  NOT NULL,
    last_name char(128)  NOT NULL,
    birthdate date  NOT NULL,
    position char(128)  NOT NULL,
    department_id int NOT NULL,
    PRIMARY KEY (employee_id)
);

#3
CREATE TABLE Departments (
    department_id int NOT NULL AUTO_INCREMENT,
    department_name char(128) NOT NULL,
    department_head int NOT NULL,
    location char(128) NOT NULL,
    PRIMARY KEY (department_id)
);

#4
INSERT INTO Employees (employee_id, first_name, last_name, birthdate, position, department_id)
 VALUES
 (1, 'John', 'Doe', '1990-05-15','Software Engineer',1),
 (2, 'Jane', 'Smith', '1985-08-20','Project Manager',2),
 (3, 'Mike', 'Johnson', '1992-03-10','Data Analyst',1),
 (4, 'Emily', 'Brown', '1988-12-03','UX Designer',1),
 (5, 'Alex', 'Williams', '1995-06-28','Software Developer',1),
 (6, 'Sarah', 'Miller', '1987-09-18','HR Specialist',3),
 (7, 'Ethan', 'Clark', '1991-02-14','Database Administrator',1),
 (8, 'Olivia', 'Garcia', '1984-07-22','Marketing Manager',1),
 (9, 'Emilia', 'Clark', '1986-01-12','HR Manager',3),
 (10, 'Daniel', 'Taylor', '1993-11-05','Systems Analyst',1),
 (11, 'William', 'Lee', '1994-08-15','Software Engineer',1),
 (12, 'Sophia', 'Baker', '1990-06-25','IT Manager',2);

INSERT INTO Departments (department_id, department_name, department_head, location)
 VALUES
 (1, 'IT', 11, 'Headquarters'),
 (2, 'Project Management', 2, 'Branch Office West'),
 (3, 'Human Resources', 6, 'Branch Office East');
 
ALTER TABLE Departments
ADD FOREIGN KEY (department_head) REFERENCES Employees(employee_id);
ALTER TABLE Employees
ADD FOREIGN KEY (department_id) REFERENCES Departments(department_id);
 
#5
SELECT first_name,last_name,position FROM Employees;

#6
UPDATE Employees SET position = 'Data Scientist' WHERE employee_id = 3;
#SELECT first_name,last_name,position FROM Employees;  #Le data analyst est devenu Data Scientist

#7
DELETE FROM Employees WHERE employee_id=3;
#SELECT first_name,last_name,position FROM Employees; #Le data Scientist a disparu ! #trop de pression

#8
SELECT last_name,department_name,location from employees JOIN departments ON (employees.department_id = departments.department_id);

#9
SELECT last_name,department_name from employees JOIN departments ON (employees.department_id = departments.department_id) order by
    case department_name
        when 'IT' then 1
        when 'Project Management'  then 2
        when 'Human Resources' then 3
        else 99     
    end ASC;

#10
SELECT department_name,first_name,last_name from departments JOIN employees ON (departments.department_head = employees.employee_id) ORDER BY department_name;

#11
INSERT INTO Departments (department_id, department_name, department_head, location) VALUES (4, 'Performance Department', 12, 'Europe West');

INSERT INTO Employees (first_name, last_name, birthdate, position, department_id)
 VALUES
 ('Lewis', 'Hamilton', '1990-05-15','Performance Cofee/Printer Assistant',4),
 ('Max', 'Verstappen', '1985-08-20','Performance Manager',4),
 ('Lando', 'Norris', '1992-03-10','Designer',4);

UPDATE Departments SET department_head = (SELECT employee_id FROM employees WHERE position='Performance Manager') WHERE department_head = 12;

#12
 CREATE TABLE Project (
    project_id int NOT NULL AUTO_INCREMENT,
    project_name char(128)  NOT NULL,
    start_date date  NOT NULL,
    end_date date,
    department_id int NOT NULL,
    PRIMARY KEY (project_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Project (project_id, project_name, start_date, end_date, department_id)
 VALUES
 (1, 'El Manifico Group By', '2022-01-01','2022-03-15',1),
 (2, 'El Plan', '2022-01-01','2023-01-02',1),
 (3, 'The Final Dream', '2022-01-01','2023-02-23',4),
 (4, 'Getting World Champion', '2021-03-26','2021-12-12',4),
 (5, 'Le Pouvoir De Maya et sa ruche', '2023-11-01','2023-12-01',1);
 
SELECT project_id,project_name,DATEDIFF(end_date,start_date) AS 'Durée du projet (j)',department_name FROM project JOIN Departments ON (project.department_id = Departments.department_id);
#Permet d'obtenir la durée de chaque projet


SELECT project_id,project_name, (DATEDIFF(end_date,start_date)*COUNT(employee_id)) AS 'Quantité de travail (j)',department_name  
FROM employees JOIN Departments ON (employees.department_id = departments.department_id) JOIN Project ON (departments.department_id = project.department_id) GROUP BY project_id;
#J'ai choisi de multiplier le temps d'un projet par le nombre d'employés pour obtenir la quantité de travail demandée par le projet indépendamment du nombre de ressources attribué à ce dernier
#Il nous manque une colonne avec une durée estimé ou prévu initialement pour observer la différence entre le réel et le budgétisé
