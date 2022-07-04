


/*1 STRUCTURE DE LA TABLE*/
/*CREER UNE BASE : */
CREATE SCHEMA IF NOT EXISTS `annonce` DEFAULT CHARACTER SET utf8 ;
USE `annonce` ;

/*CREER UNE TABLE : COLONNE */
CREATE TABLE IF NOT EXISTS `annonce`.`categorie` (
  `idcategorie` INT NOT NULL AUTO_INCREMENT,  -- Définit les champs
  `nom` VARCHAR(45) NOT NULL, -- nom_du_champ type contrainte 
  )  
ENGINE = InnoDB; -- Définit le type de moteur

/*Code possible dans une table
/ INDEX / CLE : PRIMAIRE / ETRANGERE */
--index
  INDEX `fk_annonces_utilisateur1_idx` (`utilisateur_idutilisateur` ASC) ,
 --création d'un index Index suivi du nom suivi du champs concerné
 -- asc ou desc
 --cle etrangere 
CONSTRAINT `fk_annonces_utilisateur1` 
--nom de la contrainte
    FOREIGN KEY (`utilisateur_idutilisateur`) 
	-- cle etrangere sur la table receptive
    REFERENCES `annonce`.`utilisateur` (`idutilisateur`)
	--specifique sur quelle table on est relatif
--cle primaire
	PRIMARY KEY (`idcategorie`)-- Définit la clé primaire

/*MODIFIER TABLE*/

-- Ajouter quelque chose
ALTER TABLE `annonce`.`utilisateur` ADD 
 `commentaire` VARCHAR(255) NOT NULL AFTER `id_uti`; -- une colonne
 INDEX `fk_annonces_utilisateur1_idx` (`utilisateur_idutilisateur` ASC) --un index
 PRIMARY KEY (`idcategorie`)--  clé primaire

-- Modifier quelque chose
ALTER TABLE `annonces` CHANGE `description` `descriptions` --change description par autre chose
 --options de modifications possible
 VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL;
 INDEX `fk_annonces_utilisateur1_idx` (`utilisateur_idutilisateur` ASC) --un index
 PRIMARY KEY (`idcategorie`)--  clé primaire


/*SUPPRIMER UNE TABLE*/
DROP TABLE `annonces` ;

/*VIDER UNE TABLE*/
TRUNCATE TABLE `annonces` ;


/*2 CRUD*/

/*CREATE DONNEES 
Commencer les tables sans clé etrangère
*/
--INSERT INTO LE_NOM_DE_LA_BASE.LE_NOM_DE_LA_TABLE
-- (les champs concerné) VALUES (LES DONNEES)

INSERT INTO `utilisateurs` (`id`, `nom`) VALUES (NULL, 'Axel');
INSERT INTO `utilisateurs` (`id`, `nom`) VALUES (NULL, 'Robert');
INSERT INTO `utilisateurs` (`id`, `nom`) VALUES (NULL, 'Fred');
INSERT INTO `utilisateurs` (`id`, `nom`) VALUES (NULL, 'Jean');
INSERT INTO `utilisateurs` (`id`, `nom`) VALUES (NULL, 'Pierre');


/*READ DONNES*/
--Afficher l'ensemble des colonnes de la table utilisateurs
--SELECT (AFFICHER) * (Toutes les colonnes) FROM (de quelle table)
SELECT * FROM `utilisateurs`;
SELECT * FROM `annonces`;

/*UPDATE DONNEES*/
--Modifier (Update) la table `utilisateurs`
--SET (quelle colonne est concerné 'Nom' = Quelle valeur
--Where (sur quelle ligne on fait nos modifications id=6
UPDATE `utilisateurs` SET `nom` = 'Marc' WHERE `utilisateurs`.`id` = 6;

/*DELETE DONNEES*/
--DELETE(Supprime) FROM La table 
--Where (sur quelle ligne on fait nos modifications id=6
DELETE FROM `utilisateurs` WHERE `utilisateurs`.`id` = 6 ;


/*
Insérer 3 à 5 lignes dans chaque table en codant (SQL)
Recherche dans PHPMYADMIN
Modifier 3 à 5 lignes dans chaque table en codant (SQL)
Supprimer 3 à 5 lignes dans chaque table en codant (SQL)
Lire les données d'une table

CREEZ UNE TABLE en codant (SQL) avec des clé 
puis la modifier (ALTER TABLE)
*/



/*EXO 
Insérer 3 à 5 lignes dans chaque table en codant (SQL)
*/
/*Table utilisateur*/
INSERT INTO `utilisateurs` (`id`, `nom`) VALUES (NULL, 'Axel');
INSERT INTO `utilisateurs` (`id`, `nom`) VALUES (NULL, 'Robert');
INSERT INTO `utilisateurs` (`id`, `nom`) VALUES (NULL, 'Fred');
INSERT INTO `utilisateurs` (`id`, `nom`) VALUES (NULL, 'Jean');
INSERT INTO `utilisateurs` (`id`, `nom`) VALUES (NULL, 'Pierre');

/*Table annonces*/
INSERT INTO `annonces` (`description`,`id`, `id_uti`, `titre`) VALUES ('desc 1', NULL, 4, 'Annonce 1');
INSERT INTO `annonces` (`description`,`id`, `id_uti`, `titre`) VALUES ('desc 2',NULL, 4, 'Annonce 2');
INSERT INTO `annonces` (`description`,`id`, `id_uti`, `titre`) VALUES ('desc 3',NULL, 2, 'Annonce 3');
INSERT INTO `annonces` (`description`,`id`, `id_uti`, `titre`) VALUES ('desc 4',NULL, 1, 'Annonce 4');
INSERT INTO `annonces` (`description`,`id`, `id_uti`, `titre`) VALUES ('desc 5',NULL, 3, 'Annonce 5');

/*Table categorie*/
INSERT INTO `categorie` (`id`, `nom`) VALUES (NULL, 'cat 1');
INSERT INTO `categorie` (`id`, `nom`) VALUES (NULL, 'cat 2');
INSERT INTO `categorie` (`id`, `nom`) VALUES (NULL, 'cat 3');
INSERT INTO `categorie` (`id`, `nom`) VALUES (NULL, 'cat 4');
INSERT INTO `categorie` (`id`, `nom`) VALUES (NULL, 'cat 5');

-- Table categorie_annonce
INSERT INTO `categorie_annonce` (`id_ads`, `id_cat`) VALUES (1,3);
INSERT INTO `categorie_annonce` (`id_ads`, `id_cat`) VALUES (2,4);
INSERT INTO `categorie_annonce` (`id_ads`, `id_cat`) VALUES (1,2);
INSERT INTO `categorie_annonce` (`id_ads`, `id_cat`) VALUES (4,3);
INSERT INTO `categorie_annonce` (`id_ads`, `id_cat`) VALUES (1,5);


/*Recherche dans PHPMYADMIN*/
SELECT * FROM `utilisateurs` WHERE `nom` LIKE 'Axel';
SELECT * FROM `utilisateurs` WHERE `nom` LIKE 'A%';
SELECT * FROM `utilisateurs` WHERE `nom` LIKE '%d';
SELECT * FROM `utilisateurs` WHERE `nom` = 'Fred';

/*Fonction LIKE de faire des recherches
avec des caractère inconnue en debut de chaine
et / ou en fin de chaine
a%b%c
*/

/*
Modifier 3 à 5 lignes dans chaque table en codant (SQL)
Supprimer 3 à 5 lignes dans chaque table en codant (SQL)
*/
-- utilisateur

UPDATE `utilisateurs` 
SET `nom` = 'Marc' WHERE `utilisateurs`.`id` = 6;

UPDATE `utilisateurs` 
SET `nom` = 'Raphael' WHERE `utilisateurs`.`id` = 3;

UPDATE `utilisateurs` 
SET `nom` = 'Perla' WHERE `utilisateurs`.`id` = 1;

-- annonce
UPDATE `annonces` 
SET `description` = 'desc _new_ 3' WHERE `id` = 3;

UPDATE `annonces` 
SET `description` = 'desc _new_ 4' WHERE `id` = 4;

UPDATE `annonces` 
SET `description` = 'desc _new_ 1' WHERE `id` = 1;

-- categorie
UPDATE `categorie` 
SET `nom` = 'nom _new_ 3' WHERE `id` = 3;

UPDATE `categorie` 
SET `nom` = 'nom _new_ 1' WHERE `id` = 1;

UPDATE `categorie` 
SET `nom` = 'nom _new_ 5' WHERE `id` = 5;

/*Lire les données d'une table*/

SELECT * FROM `utilisateurs`


/*
supprimer des données
*/
DELETE FROM `utilisateurs` WHERE `utilisateurs`.`id` > 15;

/*CREEZ UNE TABLE en codant (SQL) avec des clé 
puis la modifier (ALTER TABLE)
*/

/*CREER UNE BASE : */
CREATE SCHEMA IF NOT EXISTS `vente_cars` DEFAULT CHARACTER SET utf8 ;
USE `vente_cars` ;

/*CREER UNE TABLE : COLONNE */
CREATE TABLE IF NOT EXISTS `voiture` (
  `id` INT NOT NULL AUTO_INCREMENT,  -- Définit les champs
  `marque` VARCHAR(45) NOT NULL, -- nom_du_champ type contrainte 
  PRIMARY KEY (`id`)-- Définit la clé primaire
  )  

/*Modifier le moteur de la table*/
ALTER TABLE `voiture` ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` INT NOT NULL AUTO_INCREMENT,  -- Définit les champs
  `nom` VARCHAR(45) NOT NULL, -- nom_du_champ type contrainte 
  `id_voiture` INT  NOT NULL,
  
  CONSTRAINT `fk_uti_voiture` 
-- nom de la contrainte
    FOREIGN KEY (`id_voiture`) 
	-- cle etrangere sur la table receptive
    REFERENCES  `voiture` (`id`),
  
  PRIMARY KEY (`id`)-- Définit la clé primaire
  )  
 ENGINE = InnoDB;
 
 /*On démarre par tout ce qui n'est pas clé étranger pour 
 insérer des données*/
