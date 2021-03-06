-- MySQL Script generated by MySQL Workbench
-- 05/19/15 22:08:02
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema orcamento
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema orcamento
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `orcamento` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `orcamento` ;

-- -----------------------------------------------------
-- Table `orcamento`.`destino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orcamento`.`destino` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orcamento`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orcamento`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `destino_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_categoria_destino1_idx` (`destino_id` ASC),
  CONSTRAINT `fk_categoria_destino1`
    FOREIGN KEY (`destino_id`)
    REFERENCES `orcamento`.`destino` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orcamento`.`tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orcamento`.`tipo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tipo_categoria1_idx` (`categoria_id` ASC),
  CONSTRAINT `fk_tipo_categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `orcamento`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orcamento`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orcamento`.`item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `tipo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_item_tipo1_idx` (`tipo_id` ASC),
  CONSTRAINT `fk_item_tipo1`
    FOREIGN KEY (`tipo_id`)
    REFERENCES `orcamento`.`tipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orcamento`.`objeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orcamento`.`objeto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  `valor` DOUBLE(10,2) NULL,
  `data` DATE NULL,
  `item_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_objeto_item_idx` (`item_id` ASC),
  CONSTRAINT `fk_objeto_item`
    FOREIGN KEY (`item_id`)
    REFERENCES `orcamento`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
