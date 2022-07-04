-- Afficher tous les noms de la table « Employés ».
SELECT last_name AS Nom FROM employees.employees;

-- Afficher tous les noms et prénoms de la table « Employés ».
SELECT last_name AS Nom, first_name AS Prénom FROM employees.employees;

-- Afficher tout les colonnes de la table « Employés ».
SELECT * FROM employees.employees;

-- Afficher tous les noms de la table « Titles ». 
SELECT title FROM employees.titles;

-- Afficher toutes les colonnes de la table « Titles ».
SELECT * FROM employees.titles;

-- Afficher tous les noms de la table « Employés » ordonnés par nom et par ordre décroissant.
SELECT last_name AS Nom FROM employees.employees ORDER BY last_name DESC;

-- Afficher tous les noms et prénoms de la table « Employés » par nom et par ordre croissant.
SELECT last_name AS Nom, first_name AS Prénom FROM employees.employees ORDER BY last_name;

-- Afficher toutes les colonnes de la table « Employés » par date décroissante.
SELECT * FROM employees.employees ORDER BY hire_date DESC;

-- Afficher tous les noms de la table « Titles » par ordre décroissant.
SELECT title FROM employees.titles ORDER BY title DESC;

-- Afficher toutes les colonnes de la table « Titles », les noms par ordre croissant et les dates par ordre décroissant.
SELECT * FROM employees.titles ORDER BY title, from_date DESC;

-- Afficher les 10 premiers noms de la table « Employés » ordonnés par nom, par ordre décroissant.
SELECT last_name AS Nom FROM employees.employees ORDER BY last_name DESC LIMIT 10;

-- Afficher les 50 premiers noms et prénoms de la table « Employés » par nom par ordre croissant.
SELECT last_name AS Nom, first_name AS Prénom FROM employees.employees ORDER BY last_name LIMIT 50;

-- Afficher de la ligne 10 à 20, les colonnes de la table « Employés » par date décroissante.
SELECT * FROM employees.employees ORDER BY hire_date DESC LIMIT 9, 10;

-- Afficher de la ligne 20 à 30 les nom de la table « titles » par ordre décroissant.
SELECT title AS Titre FROM employees.titles ORDER BY title DESC LIMIT 20, 10;

-- Afficher les 100 premières lignes de la table « Titles », les noms par ordre croissant et les dates par ordre décroissant.
SELECT * FROM employees.titles ORDER BY title, from_date DESC LIMIT 100;

--  Afficher tout les noms et prénoms de la table « Employés ». Les nommer « Nom » et « Prénom ».
SELECT last_name AS Nom, first_name AS Prénom FROM employees.employees;

-- Afficher tout les nom de la table « titles » et les nommer en « Titres ».
SELECT title AS Titres FROM employees.titles;

-- Afficher les salaires multipliés par 1,2 dans une colonne nommée « salaire_brut » pour simuler un salaire brut.-------
SELECT salary*1.2 AS Salaire_brut, salary AS Salaire_net FROM employees.salaries;

-- Afficher tout les noms de la table « Employés » sans doublons.
SELECT DISTINCT last_name AS Nom FROM employees.employees;

-- Afficher tout les titres de la table « title » sans doublons.
SELECT DISTINCT title AS Titres FROM employees.titles;

-- Depuis la table sakila.address, afficher dans une nouvelle colonne nommée « numéro » affichant le numéro d’adresse issu du champ « adress ».
SELECT SUBSTRING_INDEX(address," ", 1) AS Numéro FROM sakila.address;

-- Afficher pour chaque employé le nombre de jours depuis leur recrutement à aujourd’hui par ordre décroissant selon le nombre de jours.
SELECT *, DATEDIFF(NOW(), hire_date) AS Nombre_jours FROM employees.employees ORDER BY Nombre_jours DESC;

-- Afficher tous les champs de la table « Employés » suivi à nouveau du champ « hire_date » nommé « DATE », et affichant uniquement l’année.
SELECT *, DATE_FORMAT(hire_date, "%Y") AS Date FROM employees.employees;

-- Afficher pour chaque employé le nombre de jours depuis leur recrutement à aujourd’hui par ordre décroissant.
SELECT *, DATEDIFF(NOW(), hire_date) AS Nombre_jours FROM employees.employees ORDER BY hire_date DESC;

-- Afficher tous les employés en séparant les sexes en deux colonnes, « Homme » et « Femme ».
SELECT *,
CASE
	WHEN gender="M" THEN "Homme"
    WHEN gender="F" THEN "Femme"
END AS Sexe
FROM employees.employees;

-- Afficher les salaires des employés en séparant les salaires haut et les bas salaires.
SELECT AVG(salary) AS Moyenne_salaire FROM employees.salaries;
SELECT *,
CASE
	WHEN salary < '63761.2043' THEN "Bas_salaire"
    WHEN salary > '63761.2043' THEN "Haut_salaire"
END AS Salaires
FROM employees.salaries;

-- Afficher tous les employés en séparant les anciens employés et les nouveaux.
SELECT AVG(DATEDIFF(NOW(), hire_date)) FROM employees.employees;
SELECT *,
CASE
	WHEN (DATEDIFF(NOW(), hire_date)) < '11642.2646' THEN "Nouveau"
    WHEN (DATEDIFF(NOW(), hire_date)) > '11642.2646' THEN "Ancien"
END AS Ancienneté
FROM employees.employees;

-- Afficher toutes les colonnes de la table « Employés » : Uniquement les hommes.
SELECT * FROM employees.employees WHERE gender='M';

-- Afficher toutes les colonnes de la table « Employés » : Uniquement les femmes.
SELECT * FROM employees.employees WHERE gender='F';

-- Afficher toutes les colonnes de la table « Employés » : Uniquement les hommes ayant le prénom « Adel ».
SELECT * FROM employees.employees WHERE gender='M' AND first_name='Adel';

-- Afficher toutes les colonnes de la table « Employés » : Uniquement les femmes ayant le prénom « Adel ».
SELECT * FROM employees.employees WHERE gender='F' AND first_name='Adel';

-- Afficher toutes les colonnes de la table « Employés » ayant le nom « Alencar » et « Akazan ».
SELECT * FROM employees.employees WHERE last_name='Alencar' OR last_name='Akazan';

-- Afficher toutes les colonnes de la table « Employés » ayant été recrutés après le 01/01/1990.
SELECT * FROM employees.employees WHERE hire_date > STR_TO_DATE("01/01/1990", "%d/%m/%Y") ORDER BY hire_date;

-- Afficher toutes les colonnes de la table « Employés » ayant été recrutés entre le 01/01/1990 et le 01/01/1991.
SELECT * FROM employees.employees WHERE hire_date > STR_TO_DATE("01/01/1990", "%d/%m/%Y") AND hire_date < STR_TO_DATE("01/01/1991", "%d/%m/%Y") ORDER BY hire_date DESC;
SELECT * FROM employees.employees WHERE hire_date BETWEEN STR_TO_DATE("01/01/1990", "%d/%m/%Y") AND STR_TO_DATE("01/01/1991", "%d/%m/%Y") ORDER BY hire_date DESC;

-- Afficher le nombre de lignes de la table « Employés ».
SELECT COUNT(*) FROM employees.employees;

-- Afficher le nombre de lignes de la table « Département ».
SELECT COUNT(*) FROM employees.departments;

-- Afficher le nombre d’hommes et de femmes avec deux requêtes à l’aide de la clause WHERE.
SELECT COUNT(*) FROM employees.employees WHERE gender="M";
SELECT COUNT(*) FROM employees.employees WHERE gender="F";

-- Afficher le nombre de lignes de la table « Employés » ayant été recrutés entre le 01/01/1990 et le 01/01/1991.
SELECT COUNT(*) AS Total_jours FROM employees.employees WHERE hire_date > STR_TO_DATE("01/01/1990", "%d/%m/%Y") AND hire_date < STR_TO_DATE("01/01/1991", "%d/%m/%Y");

-- Afficher le nombre de types de poste général.
SELECT COUNT(*) FROM employees.titles;

-- Afficher le nombre d’hommes et de femmes avec une seule requête à l’aide de la clause GROUP BY.
SELECT COUNT(*) AS Nombre, gender FROM employees.employees GROUP BY gender;

-- Afficher le nombre de type de poste pris par employé.
SELECT COUNT(*) AS Nombre, title AS type_poste FROM employees.titles GROUP BY title;

-- Afficher le nombre d’évolutions de salaire pour chaque employé, ordonné par ordre décroissant.
SELECT COUNT(*) AS Nombre, emp_no FROM employees.salaries GROUP BY emp_no ORDER BY Nombre;

-- Afficher le salaire le plus élevé, le plus petit, et le salaire moyen des employés dans une colonne nommée « salaire_max », « salaire_min » et « salaire_avg ».
SELECT MAX(salary) AS Salaire_Max, AVG(salary) AS Salaire_Moyen, MIN(salary) AS Salaire_Min FROM employees.salaries;

-- Afficher le salaire le plus élevé le plus petit et le salaire moyen de chaque employé dans une colonne nommée « salaire_max » et une colonne nommée « salaire_deb ».
SELECT MAX(salary) AS Salaire_Max, AVG(salary) AS Salaire_Moyen, MIN(salary) AS Salaire_Min, emp_no AS Employé FROM employees.salaries GROUP BY Employé;

-- Afficher le nombre de types de poste pris par employé supérieur à 1800.
SELECT COUNT(*) AS Nombre, title AS type_poste FROM employees.titles GROUP BY title HAVING Nombre > 1800;

-- Afficher le nombre d’évolutions de salaire pour chaque employé ordonnée par ordre décroissant, inférieur à 5.
SELECT COUNT(*) AS Nombre, emp_no FROM employees.salaries GROUP BY emp_no HAVING Nombre < 5 ORDER BY Nombre DESC;

-- Afficher le salaire le plus élevé, le plus petit et le salaire moyen par employé dans une colonne nommée « salaire_max », « salaire_min » et « salaire_avg » avec un salaire moyen supérieur à 70 000.
SELECT MAX(salary) AS Salaire_Max, AVG(salary) AS Salaire_Moyen, MIN(salary) AS Salaire_Min, emp_no AS Employé FROM employees.salaries GROUP BY Employé HAVING Salaire_Moyen > 70000;

-- Jointure interne (1ère méthode, simple mais pas idéale)
SELECT S.*, E.first_name, E.Last_name
FROM employees.salaries AS S,
employees.employees AS E
WHERE S.emp_no=E.emp_no;

-- Jointure interne (2ème méthode, plus complexe mais idéale)
SELECT S.*, E.first_name, E.Last_name
FROM employees.salaries AS S INNER JOIN employees.employees AS E
ON S.emp_no=E.emp_no;
 
-- Affichez le nom prenom salaire
SELECT S.salary, E.last_name, E.first_name
FROM employees.salaries AS S INNER JOIN employees.employees AS E
ON S.emp_no = E.emp_no;

-- Affichez le nom prenom titre
SELECT T.title, E.last_name, E.first_name
FROM employees.titles AS T INNER JOIN employees.employees AS E
ON T.emp_no = E.emp_no;

-- Affichez le nom prenom departement
SELECT *
FROM employees.employees AS E
INNER JOIN employees.dept_emp AS D_E ON D_E.emp_no=E.emp_no
INNER JOIN employees.departments AS D ON D_E.dept_no=D.dept_no;

-- Affichez uniquement LePrenom et le Salaire max
SELECT E.first_name AS Prénom, MAX(salary) AS Salaire_max
FROM employees.salaries AS S
INNER JOIN employees.employees AS E
ON S.emp_no = E.emp_no;

-- Afficher dans une meme table le nom des employés
SELECT E.last_name AS Nom, D.dept_name AS Département, S.salary AS Salaire
FROM employees.employees AS E

-- leur departement
INNER JOIN employees.dept_emp AS D_E ON D_E.emp_no=E.emp_no
INNER JOIN employees.departments AS D ON D_E.dept_no=D.dept_no

-- leur salaire
INNER JOIN employees.salaries AS S ON S.emp_no=E.emp_no;

-- Depuis la base sakila
-- Afficher les nom des clients et leurs adresses
-- Depuis la base Sakila, afficher les noms des clients et leurs adresses.
SELECT C.last_name AS Nom, A.address AS Adresse
FROM sakila.customer AS C
INNER JOIN sakila.address AS A ON C.address_id=A.address_id;

-- Afficher les films avec leurs catégories et leurs langues.
SELECT F.title AS Film, C.name AS Catégorie, L.name AS Langue
FROM sakila.film AS F
INNER JOIN sakila.film_category AS FC ON FC.film_id = F.film_id
INNER JOIN sakila.category AS C ON C.category_id = FC.category_id
INNER JOIN sakila.language AS L ON L.language_id = F.language_id;

-- Afficher les films avec leurs catégories.
SELECT F.title AS Film, C.name AS Catégorie
FROM sakila.film AS F
INNER JOIN sakila.film_category AS FC ON FC.film_id = F.film_id
INNER JOIN sakila.category AS C ON C.category_id = FC.category_id;

-- Afficher les films avec leurs langues.
SELECT F.title AS Film, L.name AS Langue
FROM sakila.film AS F
INNER JOIN sakila.language AS L ON L.language_id = F.language_id;

-- Afficher les films avec les clients et les adresses.
  SELECT F.title AS Film,
 C.last_name AS Nom_client,
 C.first_name AS Prénom_client,
 A.address AS Adresse
 FROM sakila.film AS F
 LEFT JOIN sakila.customer AS C ON F.film_id=C.customer_id
 LEFT JOIN sakila.address AS A ON A.address_id=C.customer_id;