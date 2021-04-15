-- MySQL Script generated by MySQL Workbench
-- Sat Mar 20 18:28:29 2021
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
-- Table `mydb`.`people`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`people` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(7) NOT NULL,
  `date` DATE NOT NULL,
  `citizenship` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employee` (
  `workId` INT NOT NULL AUTO_INCREMENT,
  `workExperience` INT NOT NULL,
  `position` VARCHAR(45) NOT NULL,
  `specialId` INT NOT NULL,
  PRIMARY KEY (`workId`),
  UNIQUE INDEX `specialId_UNIQUE` (`specialId` ASC) VISIBLE,
  CONSTRAINT `employee`
    FOREIGN KEY (`specialId`)
    REFERENCES `mydb`.`people` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`contract`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`contract` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `employeeId` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `employeeId_UNIQUE` (`employeeId` ASC) VISIBLE,
  CONSTRAINT `employeeId`
    FOREIGN KEY (`employeeId`)
    REFERENCES `mydb`.`employee` (`workId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mother`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mother` (
  `motherId` INT NOT NULL,
  UNIQUE INDEX `motherId_UNIQUE` (`motherId` ASC),
  CONSTRAINT `momId`
    FOREIGN KEY (`motherId`)
    REFERENCES `mydb`.`people` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`father`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`father` (
  `fatherId` INT NOT NULL,
  UNIQUE INDEX `fatherId_UNIQUE` (`fatherId` ASC),
  CONSTRAINT `father`
    FOREIGN KEY (`fatherId`)
    REFERENCES `mydb`.`people` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`born`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`born` (
  `fatherId` INT NOT NULL,
  `motherId` INT NOT NULL,
  `date` DATE NOT NULL,
  `PoB` VARCHAR(45) NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `nation` VARCHAR(45) NOT NULL,
  `contract` INT NOT NULL,
  `childId` INT NOT NULL,
  UNIQUE INDEX `fatherId_UNIQUE` (`fatherId` ASC) VISIBLE,
  UNIQUE INDEX `motherId_UNIQUE` (`motherId` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `contract_UNIQUE` (`contract` ASC) VISIBLE,
  UNIQUE INDEX `childId_UNIQUE` (`childId` ASC) VISIBLE,
  CONSTRAINT `qqq`
    FOREIGN KEY (`childId`)
    REFERENCES `mydb`.`people` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `contract`
    FOREIGN KEY (`contract`)
    REFERENCES `mydb`.`contract` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `mother`
    FOREIGN KEY (`motherId`)
    REFERENCES `mydb`.`mother` (`motherId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `father`
    FOREIGN KEY (`fatherId`)
    REFERENCES `mydb`.`father` (`fatherId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`husband`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`husband` (
  `husbandId` INT NOT NULL,
  UNIQUE INDEX `husbandId_UNIQUE` (`husbandId` ASC),
  CONSTRAINT `husband`
    FOREIGN KEY (`husbandId`)
    REFERENCES `mydb`.`people` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`marriage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`marriage` (
  `husbandId` INT NOT NULL,
  `wifeId` INT NOT NULL,
  `marriageId` INT NOT NULL AUTO_INCREMENT,
  `contract` INT NOT NULL,
  UNIQUE INDEX `husbandId_UNIQUE` (`husbandId` ASC) VISIBLE,
  UNIQUE INDEX `wifeId_UNIQUE` (`wifeId` ASC) VISIBLE,
  PRIMARY KEY (`marriageId`),
  UNIQUE INDEX `contact_UNIQUE` (`contract` ASC) VISIBLE,
  CONSTRAINT `wifeId`
    FOREIGN KEY (`wifeId`)
    REFERENCES `mydb`.`people` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `contract`
    FOREIGN KEY (`contract`)
    REFERENCES `mydb`.`contract` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `husbandId`
    FOREIGN KEY (`husbandId`)
    REFERENCES `mydb`.`husband` (`husbandId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`death`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`death` (
  `date` DATE NOT NULL,
  `reason` VARCHAR(45) NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `deathId` INT NOT NULL,
  `contract` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `deathId_UNIQUE` (`deathId` ASC) VISIBLE,
  INDEX `contract_idx` (`contract` ASC) VISIBLE,
  CONSTRAINT `deathId`
    FOREIGN KEY (`deathId`)
    REFERENCES `mydb`.`people` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `contract`
    FOREIGN KEY (`contract`)
    REFERENCES `mydb`.`contract` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ceremony`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ceremony` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ceremonyId` INT NOT NULL,
  `date` DATE NOT NULL,
  `employeId` INT NOT NULL,
  `place` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `employeId_idx` (`employeId` ASC) VISIBLE,
  CONSTRAINT `ceremonyId`
    FOREIGN KEY (`ceremonyId`)
    REFERENCES `mydb`.`marriage` (`marriageId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `employeId`
    FOREIGN KEY (`employeId`)
    REFERENCES `mydb`.`employee` (`workId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


ALTER USER 'root' @'localhost' IDENTIFIED WITH mysql_native_password BY 'Bmstu1830';