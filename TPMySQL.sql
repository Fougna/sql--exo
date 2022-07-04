-- MySQL Script generated by MySQL Workbench
-- Thu Dec 16 12:16:01 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TPMySQL
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TPMySQL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TPMySQL` DEFAULT CHARACTER SET utf8 ;
USE `TPMySQL` ;

-- -----------------------------------------------------
-- Table `TPMySQL`.`utilisateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPMySQL`.`utilisateur` (
  `id_utilisateur` INT NOT NULL AUTO_INCREMENT,
  `utilisateur_nom` VARCHAR(255) NOT NULL,
  `utilisateur_prenom` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_utilisateur`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPMySQL`.`annonce`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPMySQL`.`annonce` (
  `id_annonce` INT NOT NULL AUTO_INCREMENT,
  `annonce_nom` VARCHAR(255) NOT NULL,
  `utilisateur_id_utilisateur` INT NOT NULL,
  PRIMARY KEY (`id_annonce`),
  INDEX `fk_annonce_utilisateur_idx` (`utilisateur_id_utilisateur` ASC),
  CONSTRAINT `fk_annonce_utilisateur`
    FOREIGN KEY (`utilisateur_id_utilisateur`)
    REFERENCES `TPMySQL`.`utilisateur` (`id_utilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPMySQL`.`categorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPMySQL`.`categorie` (
  `id_categorie` INT NOT NULL AUTO_INCREMENT,
  `categorie_nom` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_categorie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPMySQL`.`categorie_annonce`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPMySQL`.`categorie_annonce` (
  `categorie_id_categorie` INT NOT NULL,
  `annonce_id_annonce` INT NOT NULL,
  PRIMARY KEY (`categorie_id_categorie`, `annonce_id_annonce`),
  INDEX `fk_categorie_has_annonce_annonce1_idx` (`annonce_id_annonce` ASC),
  INDEX `fk_categorie_has_annonce_categorie1_idx` (`categorie_id_categorie` ASC),
  CONSTRAINT `fk_categorie_has_annonce_categorie1`
    FOREIGN KEY (`categorie_id_categorie`)
    REFERENCES `TPMySQL`.`categorie` (`id_categorie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categorie_has_annonce_annonce1`
    FOREIGN KEY (`annonce_id_annonce`)
    REFERENCES `TPMySQL`.`annonce` (`id_annonce`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
