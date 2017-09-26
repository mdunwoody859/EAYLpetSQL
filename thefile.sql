-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pets
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pets
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pets` DEFAULT CHARACTER SET latin1 ;
USE `pets` ;

-- -----------------------------------------------------
-- Table `pets`.`Owner_`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pets`.`Owner_` (
  `OwnerId` INT(11) NOT NULL,
  `FirstName` VARCHAR(15) NULL DEFAULT NULL,
  `Surname` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`OwnerId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `pets`.`pets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pets`.`pets` (
  `PetId` INT(11) NOT NULL,
  `PetName` VARCHAR(15) NULL DEFAULT NULL,
  `sex` CHAR(1) NULL DEFAULT NULL,
  `DoB` DATE NULL DEFAULT NULL,
  `DoD` DATE NULL DEFAULT NULL,
  `OwnerId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`PetId`),
  INDEX `OwnerId` (`OwnerId` ASC),
  CONSTRAINT `pets_ibfk_1`
    FOREIGN KEY (`OwnerId`)
    REFERENCES `pets`.`Owner_` (`OwnerId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `pets`.`Species`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pets`.`Species` (
  `SpeciesID` INT(11) NOT NULL,
  `Species` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`SpeciesID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `pets`.`Pet_Species`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pets`.`Pet_Species` (
  `PetId` INT(11) NULL DEFAULT NULL,
  `SpeciesId` INT(11) NULL DEFAULT NULL,
  INDEX `SpeciesId` (`SpeciesId` ASC),
  INDEX `PetId` (`PetId` ASC),
  CONSTRAINT `Pet_Species_ibfk_1`
    FOREIGN KEY (`PetId`)
    REFERENCES `pets`.`pets` (`PetId`),
  CONSTRAINT `Pet_Species_ibfk_2`
    FOREIGN KEY (`SpeciesId`)
    REFERENCES `pets`.`Species` (`SpeciesID`),
  CONSTRAINT `Pet_Species_ibfk_3`
    FOREIGN KEY (`SpeciesId`)
    REFERENCES `pets`.`Species` (`SpeciesID`),
  CONSTRAINT `Pet_Species_ibfk_4`
    FOREIGN KEY (`PetId`)
    REFERENCES `pets`.`pets` (`PetId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

