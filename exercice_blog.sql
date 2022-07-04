-- MySQL Script generated by MySQL Workbench
-- Wed Dec  8 14:26:42 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`utilisateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`utilisateur` (
  `idutilisateur` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idutilisateur`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`article` (
  `idarticle` INT NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(45) NOT NULL,
  `contenu` VARCHAR(45) NOT NULL,
  `utilisateur_idutilisateur` INT NOT NULL,
  PRIMARY KEY (`idarticle`),
  INDEX `fk_article_utilisateur1_idx` (`utilisateur_idutilisateur` ASC),
  CONSTRAINT `fk_article_utilisateur1`
    FOREIGN KEY (`utilisateur_idutilisateur`)
    REFERENCES `mydb`.`utilisateur` (`idutilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categorie` (
  `idcategorie` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategorie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`article_categorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`article_categorie` (
  `categorie_idcategorie` INT NOT NULL,
  `article_idarticle` INT NOT NULL,
  PRIMARY KEY (`categorie_idcategorie`, `article_idarticle`),
  INDEX `fk_categorie_has_article_article1_idx` (`article_idarticle` ASC),
  INDEX `fk_categorie_has_article_categorie_idx` (`categorie_idcategorie` ASC),
  CONSTRAINT `fk_categorie_has_article_categorie`
    FOREIGN KEY (`categorie_idcategorie`)
    REFERENCES `mydb`.`categorie` (`idcategorie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categorie_has_article_article1`
    FOREIGN KEY (`article_idarticle`)
    REFERENCES `mydb`.`article` (`idarticle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`commentaire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`commentaire` (
  `idcommentaire` INT NOT NULL AUTO_INCREMENT,
  `pseudo` VARCHAR(45) NOT NULL,
  `contenu` VARCHAR(45) NOT NULL,
  `article_idarticle` INT NOT NULL,
  PRIMARY KEY (`idcommentaire`),
  INDEX `fk_commentaire_article1_idx` (`article_idarticle` ASC),
  CONSTRAINT `fk_commentaire_article1`
    FOREIGN KEY (`article_idarticle`)
    REFERENCES `mydb`.`article` (`idarticle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tag` (
  `idtag` INT NOT NULL,
  `article_idarticle` INT NOT NULL,
  PRIMARY KEY (`idtag`, `article_idarticle`),
  INDEX `fk_tag_article1_idx` (`article_idarticle` ASC),
  CONSTRAINT `fk_tag_article1`
    FOREIGN KEY (`article_idarticle`)
    REFERENCES `mydb`.`article` (`idarticle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
