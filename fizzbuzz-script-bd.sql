-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema fizzbuzz
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fizzbuzz
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fizzbuzz` DEFAULT CHARACTER SET utf8 ;
USE `fizzbuzz` ;

-- -----------------------------------------------------
-- Table `fizzbuzz`.`invocations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fizzbuzz`.`invocations` (
  `id_invocation` INT NOT NULL AUTO_INCREMENT,
  `created_time` TIMESTAMP NOT NULL,
  `path` VARCHAR(45) NOT NULL,
  `state` SMALLINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_invocation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fizzbuzz`.`ok_invocations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fizzbuzz`.`ok_invocations` (
  `id_ok` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  `fk_id_invocation` INT NOT NULL,
  PRIMARY KEY (`id_ok`),
  INDEX `fk_ok_invocations_invocations_idx` (`fk_id_invocation` ASC) VISIBLE,
  CONSTRAINT `fk_ok_invocations_invocations`
    FOREIGN KEY (`fk_id_invocation`)
    REFERENCES `fizzbuzz`.`invocations` (`id_invocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fizzbuzz`.`results`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fizzbuzz`.`results` (
  `id_result` INT NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(8) NOT NULL,
  `fk_id_ok_invocation` INT NOT NULL,
  PRIMARY KEY (`id_result`),
  INDEX `fk_results_ok_invocations1_idx` (`fk_id_ok_invocation` ASC) VISIBLE,
  CONSTRAINT `fk_results_ok_invocations1`
    FOREIGN KEY (`fk_id_ok_invocation`)
    REFERENCES `fizzbuzz`.`ok_invocations` (`id_ok`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
