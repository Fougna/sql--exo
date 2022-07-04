ALTER TABLE annonce
DROP FOREIGN KEY utilisateur_id_utilisateur;
TRUNCATE TABLE utilisateur;

-- SELECT FROM ----------------------------------------------------------------------------------------------

-- Afficher tous les noms de la table « Employés ».
SELECT first_name FROM employees.employees;

-- Afficher tous les noms et prénoms de la table « Employés ».
SELECT first_name, last_name FROM employees.employees;

-- Afficher tout les colonnes de la table « Employés ».
SELECT * FROM employees.employees;

-- Afficher tous les noms de la table « Titles ». 
SELECT title FROM employees.titles;

-- Afficher toutes les colonnes de la table « Titles ».
SELECT * FROM employees.titles;



-- ORDER BY ASC/DESC ----------------------------------------------------------------------------------------

-- Afficher tous les noms de la table « Employés » ordonnés par nom et par ordre décroissant.
SELECT last_name FROM employees.employees ORDER BY last_name DESC;

-- Afficher tous les noms et prénoms de la table « Employés » par nom et par ordre croissant.
SELECT last_name, first_name FROM employees.employees ORDER BY last_name;

-- Afficher toutes les colonnes de la table « Employés » par date décroissante.
SELECT * FROM employees.employees ORDER BY hire_date DESC;

-- Afficher tous les noms de la table « Titles » par ordre décroissant. 
SELECT title FROM employees.titles ORDER BY title DESC;

-- Afficher toutes les colonnes de la table « Titles », les noms par ordre croissant et les dates par ordre décroissant.
SELECT * FROM employees.titles ORDER BY title, hire_date DESC;



-- LIMIT ----------------------------------------------------------------------------------------------------

-- Afficher les 10 premiers noms de la table « Employés » ordonnés par nom, par ordre décroissant.
SELECT last_name FROM employees.employees ORDER BY last_name DESC LIMIT 10 ;

-- Afficher les 50 premiers noms et prénoms de la table « Employés » par nom par ordre croissant.
SELECT last_name, first_name FROM employees.employees ORDER BY last_name ASC LIMIT 50;
 
-- Afficher de la ligne 10 à 20, les colonnes de la table « Employés » par date décroissante.
SELECT * FROM employees.employees ORDER BY hire_date DESC LIMIT 9, 10;
 
-- Afficher de la ligne 20 à 30 les nom de la table « titles » par ordre décroissant
SELECT title FROM employees.titles ORDER BY title DESC LIMIT 19,10;
 
-- Afficher les 100 premières lignes de la table « Titles », les noms par ordre croissant et les dates par ordre décroissant.
SELECT * FROM employees.titles ORDER BY title ASC , FROM_date DESC LIMIT 100;

--  Afficher tout les noms et prénoms de la table « Employés ». Les nommer « Nom » et « Prénom »
SELECT last_name AS nom, first_name AS prenom FROM employees.employees;



-- AS -------------------------------------------------------------------------------------------------------

-- Afficher tout les nom de la table « titles » et les nommer en « Titres ».
SELECT title AS Titres FROM employees.titles;

-- Afficher les salaires multipliés par 1,2 dans une colonne nommée « salaire_brut » pour simuler un salaire brut.
SELECT salary *1.2 AS salaire_brut, salary AS salaire_net FROM employees.salaries;



-- DISTINCT -------------------------------------------------------------------------------------------------

-- Afficher tout les noms de la table « Employés » sans doublons.
SELECT DISTINCT last_name FROM employees.employees ;

-- Afficher tout les titres de la table « title » sans doublons.
SELECT DISTINCT title FROM employees.titles;



-- FONCTIONS CONVERT/SUBSTR/INSTR/SUBSTRING_INDEX -----------------------------------------------------------

-- Depuis la table sakila.address, afficher dans une nouvelle colonne nommée « numéro » affichant le numéro d’adresse issu du champ « adress ».
-- Solution n°1 : CONVERT -> Transformer la chaîne de caractères « adress » en numérique.
SELECT *, CONVERT(address, SIGNED INTEGER) AS numero FROM sakila.address;

-- Solution n°2 : SUBSTR + INSTR -> Récupérer les caractères numériques de la chaîne de caractères « address ».
SELECT *, SUBSTR(address, 1, INSTR(address, " ")) AS numero FROM sakila.address;

-- Solution n°3 : SUBSTRING_INDEX -> Récupérer les caractères numériques de la chaîne de caractères « address ».
SELECT *, SUBSTRING_INDEX(address, " ", 1) AS numero FROM sakila.address;



-- FONCTIONS DATEDIFF/YEAR ----------------------------------------------------------------------------------

-- Afficher pour chaque employé le nombre de jours depuis leur recrutement à aujourd’hui par ordre décroissant selon le nombre de jours.
SELECT *, DATEDIFF(NOW(), hire_date) AS nombre_jours FROM employees.employees;

-- Afficher tous les champs de la table « Employés » suivi à nouveau du champ « hire_date » nommé « DATE », et affichant uniquement l’année.
SELECT *, YEAR(hire_date) AS date FROM employees.employees;

-- Afficher pour chaque employé le nombre de jours depuis leur recrutement à aujourd’hui par ordre décroissant.
SELECT *, DATEDIFF(NOW(), hire_date) AS nombre_jours FROM employees.employees ORDER BY nombre_jours DESC;



-- CONDITION CASE WHEN THEN END -----------------------------------------------------------------------------

-- Afficher tous les employés en séparant les sexes en deux colonnes, « Homme » et « Femme ».
SELECT *,
CASE
    WHEN gender="M" THEN "Homme"
    WHEN gender="F" THEN "Femme"
END AS Sexe
FROM employees.employees;



-- CONDITION CASE WHEN THEN END + FONCTION AVG --------------------------------------------------------------

-- Afficher les salaires des employés en séparant les salaires haut et les bAS salaires.
-- Étape n°1 : Afficher la moyenne des salaires de tous les employés (résultat attendu = 63761.2043).
SELECT *, AVG(salary) AS salaire_moyen FROM employees.salaries;
-- Étape n°2 : Séparer les salaires haut et les bas salaires.
SELECT *,
CASE
    WHEN salary > 63761.2043 THEN "Salaire_haut"
    WHEN salary < 63761.2043 THEN "Salaire_bas"
END AS salaires,
"63761.2043" AS Salaire_moyen
FROM employees.salaries;

-- Afficher tous les employés en séparant les anciens employés et les nouveaux.
-- Étape n°1 : Afficher la moyenne des jours de tous les employés (résultat attendu = 11642.2646).
SELECT *, AVG(DATEDIFF(NOW(), hire_date)) AS nombre_jours FROM employees.employees;
-- Étape n°2 : Séparer les anciens et les nouveaux employés.
SELECT *,
CASE
    WHEN DATEDIFF(NOW(), hire_date) > 11642.2646 THEN "Ancien"
    WHEN DATEDIFF(NOW(), hire_date) < 11642.2646 THEN "Nouveau"
END AS info,
"11642.2646" AS seuil
FROM employees.employees;



-- WHERE/WHERE AND/WHERE OR ---------------------------------------------------------------------------------

-- Afficher toutes les colonnes de la table « Employés » : Uniquement les hommes.
SELECT * FROM employees.employees WHERE gender="M";

-- Afficher toutes les colonnes de la table « Employés » : Uniquement les femmes.
SELECT * FROM employees.employees WHERE gender="F";

-- Afficher toutes les colonnes de la table « Employés » : Uniquement les hommes ayant le prénom « Adel ».
SELECT * FROM employees.employees WHERE gender="M" AND first_name="Adel";

-- Afficher toutes les colonnes de la table « Employés » : Uniquement les femmes ayant le prénom « Adel ».
SELECT * FROM employees.employees WHERE gender="F" AND first_name="Adel";

-- Afficher toutes les colonnes de la table « Employés » ayant le nom « Alencar » et « Akazan ».
SELECT * FROM employees.employees WHERE last_name="Alencar" OR last_name="Akazan";



-- WHERE + STR_TO_DATE --------------------------------------------------------------------------------------

-- Afficher toutes les colonnes de la table « Employés » ayant été recrutés après le 01/01/1990.
SELECT * FROM employees.employees WHERE hire_date > STR_TO_DATE("01 01 90", "%d %m %y");



-- WHERE BETWEEN AND ----------------------------------------------------------------------------------------

-- Afficher toutes les colonnes de la table « Employés » ayant été recrutés entre le 01/01/1990 et le 01/01/1991.
SELECT * FROM employees.employees WHERE hire_date BETWEEN STR_TO_DATE("01 01 90", "%d %m %y") AND STR_TO_DATE("01 01 91", "%d %m %y");
SELECT * FROM employees.employees WHERE hire_date > STR_TO_DATE("01 01 90", "%d %m %y") AND hire_date < STR_TO_DATE("01 01 91", "%d %m %y");



-- FONCTION COUNT -------------------------------------------------------------------------------------------

-- Afficher le nombre de lignes de la table « Employés ».
SELECT COUNT(*) FROM employees.employees;

-- Afficher le nombre de lignes de la table « Département ».
SELECT COUNT(*) FROM employees.departments;

-- Afficher le nombre d’hommes et de femmes avec deux requêtes à l’aide de la clause WHERE.
SELECT COUNT(*) FROM employees.employees WHERE gender="M";
SELECT COUNT(*) FROM employees.employees WHERE gender="F";

-- Afficher le nombre de lignes de la table « Employés » ayant été recrutés entre le 01/01/1990 et le 01/01/1991.
SELECT COUNT(*) FROM employees.employees WHERE hire_date BETWEEN STR_TO_DATE("01 01 90", "%d %m %y") AND STR_TO_DATE("01 01 91", "%d %m %y");

-- Afficher le nombre de types de poste général.
SELECT COUNT(*)
FROM employees.titles;



-- GROUP BY -------------------------------------------------------------------------------------------------

-- Afficher le nombre d’hommes et de femmes avec une seule requête à l’aide de la clause GROUP BY.
SELECT COUNT(*) AS nb, gender
FROM employees.employees
GROUP BY gender;

-- Afficher le nombre de type de poste pris par employé.
SELECT COUNT(*) AS nb, title
FROM employees.titles
GROUP BY title;

-- Afficher le nombre d’évolutions de salaire pour chaque employé, ordonné par ordre décroissant.
SELECT COUNT(*) AS nb, emp_no
FROM employees.salaries
GROUP BY emp_no
ORDER BY nb DESC;



-- FONCTIONS MAX/MIN ----------------------------------------------------------------------------------------

-- Afficher le salaire le plus élevé, le plus petit, et le salaire moyen des employés dans une colonne nommée « salaire_max », « salaire_min » et « salaire_avg ».
SELECT MAX(salary) AS salaire_max, MIN(salary) AS salaire_min, AVG(salary) AS salaire_avg
FROM employees.salaries;

-- Afficher le salaire le plus élevé le plus petit et le salaire moyen de chaque employé dans une colonne nommée « salaire_max » et une colonne nommée « salaire_deb ».
SELECT MIN(salary) AS salaire_min, MAX(salary) AS salaire_max, AVG(salary) AS salaire_deb, emp_no
FROM employees.salaries
GROUP BY emp_no;



-- HAVING ---------------------------------------------------------------------------------------------------

-- Afficher le nombre de types de poste pris par employé supérieur à 1800.
SELECT COUNT(*) AS nb, title
FROM employees.titles
GROUP BY title
HAVING nb > 1800;

-- Afficher le nombre d’évolutions de salaire pour chaque employé ordonnée par ordre décroissant, inférieur à 5.
SELECT COUNT(*) AS nb, emp_no
FROM employees.salaries
GROUP BY emp_no
HAVING nb < 5
ORDER BY nb DESC;

-- Afficher le salaire le plus élevé, le plus petit et le salaire moyen par employé dans une colonne nommée « salaire_max », « salaire_min » et « salaire_avg » avec un salaire moyen supérieur à 70 000.
SELECT MAX(salary) AS salaire_max, MIN(salary) AS salaire_min, AVG(salary) AS salaire_avg, emp_no
FROM employees.salaries
GROUP BY emp_no
HAVING salaire_avg > 70000;



-- LES JOINTURES : INNER JOIN -------------------------------------------------------------------------------
-- Jointure interne : 1ère méthode, simple mais pas idéale.
SELECT S.*, E.first_name, E.Last_name
FROM employees.salaries AS S,
employees.employees AS E
WHERE S.emp_no = E.emp_no;

-- Jointure interne : 2ème méthode, plus complexe mais idéale.
SELECT S.*, E.first_name, E.Last_name
FROM employees.salaries AS S
INNER JOIN employees.employees AS E
ON S.emp_no = E.emp_no;

-- Afficher le nom, prénom et salaire.
SELECT S.salary, E.last_name, E.first_name
FROM employees.salaries AS S
INNER JOIN employees.employees AS E
ON S.emp_no = E.emp_no;

-- Afficher le nom, prénom et titre.
SELECT T.title, E.last_name, E.first_name
FROM employees.titles AS T
INNER JOIN employees.employees AS E
ON T.emp_no = E.emp_no;

-- Afficher le nom, prénom et département.
SELECT *
FROM employees.employees AS E
INNER JOIN employees.dept_emp AS D_E ON D_E.emp_no=E.emp_no
INNER JOIN employees.departments AS D ON D_E.dept_no=D.dept_no;

-- Afficher uniquement le prénom et le salaire max.
SELECT E.first_name AS Prénom, MAX(salary) AS Salaire_max
FROM employees.salaries AS S
INNER JOIN employees.employees AS E
ON S.emp_no = E.emp_no;

-- Afficher dans une même table le nom des employés, leur département et leur salaire.
SELECT E.last_name AS Nom, D.dept_name AS Département, S.salary AS Salaire
FROM employees.employees AS E
INNER JOIN employees.dept_emp AS D_E ON D_E.emp_no=E.emp_no
INNER JOIN employees.departments AS D ON D_E.dept_no=D.dept_no
INNER JOIN employees.salaries AS S ON S.emp_no=E.emp_no;

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

-- Afficher les films avec les clients et les adresses.
SELECT F.title AS Film,
C.last_name AS Nom_client,
C.first_name AS Prénom_client,
A.address AS Adresse
FROM sakila.film AS F
LEFT JOIN sakila.customer AS C ON F.film_id=C.customer_id
LEFT JOIN sakila.address AS A ON A.address_id=C.customer_id;