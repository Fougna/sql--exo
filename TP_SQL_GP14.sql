-- Affichage de la table employé 
/* Affichage de la table */
select * from employees.employees;

-- afficher uniquement le nom
select last_name , hire_date from employees.employees;

/**

SELECT nom_du_champ FROM nom_du_tableau
*/

/*1 Affichez tout les nom de la table « Employé ».*/
select first_name from employees.employees;

-- Affichez tout les nom et prénom de la table « Employé ».
select first_name, last_name from employees.employees;

-- Affichez tout les colonnes de la table « Employé ».
select * from employees.employees;

-- Affichez tout les nom de la table « titles ». 
select title from employees.titles;
-- select colonne_correspondante_a_la_table  from base.table;

-- Affichez tout les colonnes de la table « titles ».
select * from employees.titles;

select * from employees.employees order by last_name desc  ;

-- Affichez tout les nom de la table « Employé » ordonné par nom par ordre décroissant.
select distinct last_name from employees.employees order by last_name desc;

-- Affichez tout les nom et prénom de la table « Employé » par nom par ordre croissant .
select last_name , first_name from employees.employees order by last_name;

-- Affichez tout les colonnes de la table « Employé ». Ordonnez par date décroissant.
select * from employees.employees order by hire_date desc;

-- Affichez tout les nom de la table « titles » par ordre décroissant. 
select title from employees.titles order by title desc;

-- Affichez tout les colonnes de la table « titles ». Les nom
--  par ordre croissant et les dates par ordre décroissante
select * from employees.titles  order by title , from_date desc;

 select * from employees.employees limit 0, 10;

--  Affichez les 10 premiers nom de la table « Employé » ordonné par nom par ordre décroissant.
select last_name from employees.employees order by last_name desc limit 10 ;

-- Affichez les 50 premiers nom et prénom de la table « Employé » par nom par ordre croissant .
select last_name, first_name from employees.employees order by last_name asc limit 50;
 
-- Affichez de la ligne 10 à 20, les colonnes de la table « Employé ». Ordonnez par date décroissant.
select * from employees.employees order by hire_date desc limit 9, 10;
 
 -- Affichez de la ligne 20 à 30 les nom de la table « titles » par ordre décroissant
 select title from employees.titles order by title desc limit 19,10;
 
 -- Affichez les 100 premières lignes de la table « titles ».
 -- Les nom par ordre croissant et les dates par ordre décroissante
select * from employees.titles  order by  title asc , from_date desc limit 100;

select last_name as nom from employees.employees as e1;

--  Affichez tout les nom et prénom de la table « Employé ». Nommez les « Nom » et « Prénom »
select last_name as nom , first_name as prenom from employees.employees;

-- Affichez tout les nom de la table « titles ». Nommez les « Titre».
select title as titre from employees.titles;

-- Affichez les salaires *1,2 dans une colonne nommé salaire_brut pour simuler un salaire brut.
select salary *1.2 as salaire_brut, salary as salaire_net from employees.salaries;


-- Affichez tout les nom de la table « Employé » sans doublons
select distinct last_name from employees.employees ;

-- Affichez tout les titres  de la table « title » sans doublons  
select   distinct last_name from employees.employees;


-- group by 

-- fonction upper
select upper("text en majuscule"  ) as texte;

select upper(last_name) from employees.employees;

-- Affichez tout les nom de la table « Employé » en majuscule.
select upper(last_name) as nom from employees.employees;

-- Affichez tout les nom et prénom de la table « Employé » en majuscule.
select upper(last_name) as nom, upper(first_name) as prenom from employees.employees;

-- Affichez tout les nom de la table « Employé » suivi du prénom en minuscule.
select upper(last_name) as nom, lower(first_name)  as prenom from employees.employees;

-- Affichez tout les nom et prénom dans une nouvelle colonne nommé NOM_PRENOM de la table « Employé  »
select concat(last_name," ", first_name) as nom_prenom from employees.employees;

-- Affichez dans une colonne uniquement l’année de date de recrutement des employés.
select year(hire_date) from employees.employees;

-- Affichez tout les champs de la table employé suivi à nouveau 
-- du champs « hire_date » nommé « DATE ».
-- Ce champs contiendra la date au format dd/mm/yyyy (Ex: 26/06/1986)
select * , date_format(hire_date,"%d %m %y") as date from employees.employees;

-- Affichez la date 30/01/2020 au format date dd/mm/yyyy (Ex: 26/06/1986)
select STR_TO_DATE('30,01,2020','%d,%m,%Y');

/*

Affichez tout les champs de la table employé suivi à nouveau du champs « hire_date » nommé « DATE ».
Ce champs contiendra la date au format dd/mm/yyyy (Ex: 26/06/1986)
Affichez la date 30/01/2020 au format date dd/mm/yyyy (Ex: 26/06/1986)
*/


-- Depuis la table sakila.address, affichez dans une nouvelle colonne
--  nommé numéro affichant le numéro d’adresse issue du champ adresse

-- solution n°1 : transformer la chaine de caractere adresse en numérique
select *, convert(address, SIGNED INTEGER) as numero from sakila.address;
-- solution n°2 : récupérer les caractère numériques de la chaine
select *, substr(address, 1,4) as numero from sakila.address;

select *, substr(address, 1,instr(address," ")) as numero from sakila.address;
-- solution n°3 : récupérer les caractère numériques de la chaine
select *, SUBSTRING_INDEX(address, " ", 1 ) as numero from sakila.address;

select * from employees.employees;
SELECT DATEDIFF('1986/06/26', NOW()) AS DateDiff ;
select * ,  DATEDIFF(hire_date, NOW()) AS  nb from employees.employees;

-- Affichez tout les champs de la table employé suivi 
-- à nouveau du champs « hire_date » nommé « DATE » affichant uniquement l’année.
select * , year(hire_date) as date from employees.employees;

-- Affichez pour chaque employé le nombre de jours 
-- depuis leur recrutement à aujourd’hui par ordre décroissant
--  selon le nombre de jour. / Période d’essaie ? . Age de recrutement ?
select *, datediff(now(),hire_date) as nb from employees.employees order by nb desc;
  
  
select * ,
case 
 when gender="M" then "Homme"
 when gender="F" then "Femme"
 end as sexe
from 
employees.employees;

-- Salaire moyen : 63761.2043
SELECT AVG(salary) as moyenne FROM employees.salaries;

-- select 
SELECT *,
case 
 when salary> 63761.2043 then "Salaire Haut"
 when salary< 63761.2043 then "Salaire Bas"
 end as niveau_salaire
 FROM employees.salaries
 where salary> 63761.2043
 and emp_no=10002;
 ;
 
 /* where exemple */ 
select * from employees.employees where emp_no=10001;


select * from employees.employees;


-- la moyenne du nombre de jours dans l'entreprise
select  *, datediff(now() , hire_date) as nb_jour from employees.employees;

select avg(datediff(now() , hire_date)  ) as moyenne_nb_jour from employees.employees;

-- 11642.2646
select *,
case 
when datediff(now() , hire_date) >  11642.2646 then 'Ancien'
when datediff(now() , hire_date) <  11642.2646 then 'Nouveau'
end as info,
 datediff(now() , hire_date), 
 '11642.2646' as seuil
 from employees.employees;
 
 
-- Affichez toute les colonnes de la table « Employé » : Uniquement les hommes.
select * from employees.employees where gender="M";

-- Affichez toute les colonnes de la table « Employé » : Uniquement les femmes.
select * from employees.employees where gender="F";

-- Affichez toute les colonnes de la table « Employé » : Uniquement les hommes ayant le prénom = Adel.
select * from employees.employees where gender="M" and first_name="Adel";

-- Affichez toute les colonnes de la table « Employé » : Uniquement les femmes ayant le prénom = Adel.
 select * from employees.employees where gender="F" and first_name="Adel";

 
  -- Affichez toute les colonnes de la table « Employé » : ayant le nom = Alencar et Akazan.
select * from employees.employees where last_name="Alencar" or last_name="Akazan";
   
   -- Affichez toute les colonnes de la table « Employé » : ayant été recruté après le 01/01/1990
select * from employees.employees where hire_date > str_to_date("01 01 90", "%d %m %y");

-- Affichez toute les colonnes de la table « Employé » : 
-- ayant été recruté entre le 01/01/1990 et
--  le 01/01/1991.
select * from employees.employees where hire_date 
between str_to_date("01 01 90", "%d %m %y") and   str_to_date("01 01 91", "%d %m %y");
select * from employees.employees
 where hire_date > str_to_date("01 01 90", "%d %m %y") and hire_date <  str_to_date("01 01 91", "%d %m %y");

-- Affichez le nombre de ligne de la table employe : 300 024
select count(*) from employees.employees;

-- correspondant à cette requête. 25 673
select count(*) from employees.employees where hire_date 
between str_to_date("01 01 90", "%d %m %y") and   str_to_date("01 01 91", "%d %m %y");
;

-- Fonction d'agregation avg me renvoie une seule valeur => la moyenne des salaire
select avg(salary) from employees.salaries;

-- Fonction d'agregation max me renvoie une seule valeur => la max des salaire 158220
select max(salary) from employees.salaries;

-- Fonction d'agregation min me renvoie une seule valeur => la min des salaire 38735
select min(salary) from employees.salaries;

-- Fonction d'agregation sum me renvoie une seule valeur => la sum des salaire 61678125784
select sum(salary) from employees.salaries;
 
 
 -- fonction d'agregation count => Compte le nombre de ligne
-- group by ce compte par rapport à une colonne : genre
-- having filtre sur la fonction d'agregation

SELECT count(*) as nb,
gender FROM employees.employees 
group by gender
having nb >120051;


-- SELECT colonne1, fonction(colonne2) FROM table GROUP BY colonne1

-- Affichez le nombre de ligne de la table « employé » : 300024
select count(*) from employees.employees;

-- Affichez le nombre de ligne de la table « Département  » : 9 
select count(*) from employees.departments;

-- Affichez le nombre d’homme et de femme avec deux requêtes à l’aide de la clause where
select count(*) from employees.employees where gender="M";  -- 179973
select count(*) from employees.employees where gender="F";  -- 120051

-- Affichez le nombre d’homme et de femme avec une seul requête à l’aide de la clause group by
select count(*) as nb, gender from employees.employees group by gender;

-- Affichez le nombre de type de poste général : 443308
select count(*) as nb from employees.titles;

-- Affichez le nombre de type de poste général pris par employé
select count(*) , title from employees.titles group by title;
select count(*) from employees.titles; -- 443308

-- Affichez le nombre d’évolution de salaire pour chaque employé ordonnée par ordre décroissant.
select emp_no, count(salary) as nb_s from employees.salaries group by emp_no order by nb_s desc;

-- Affichez le salaire le plus élevé le plus petit et le salaire moyen des employés 
-- dans une colonne nommé salaire_max , salaire_min et salaire_avg
select max(salary) as salaire_max, min(salary) as salaire_min, avg(salary) as salaire_avg from employees.salaries;

-- Affichez le salaire le plus élevé le plus petit et le salaire moyen de chaque employés 
-- dans une colonne nommé salaire_max dans une colonne nommé salaire_deb
select max(salary) as salaire_max, min(salary) as salaire_min, avg(salary) as salaire_avg, emp_no
 from employees.salaries group by emp_no;
 
-- Affichez le nombre de type de poste pris par employé supérieur à 1800.
select count(*)  as nb, title from titles 
group by title
having nb > 1800;

-- Affichez le nombre d’évolution de salaire pour chaque employé ordonnée par ordre décroissant < 5.
select emp_no, count(salary) as nb_s from employees.salaries
 group by emp_no 
 having nb_s<5
order by nb_s desc;

-- Affichez le salaire le plus élevé 
-- le plus petit et le salaire moyen par employé dans une colonne nommé salaire_max , 
-- salaire_min et salaire_avg avec un salaire moyen > 70 000
select max(salary) as salaire_max, min(salary) as salaire_min, avg(salary) as salaire_avg, emp_no
 from employees.salaries
 group by emp_no
  having salaire_avg > 70000
 ;
