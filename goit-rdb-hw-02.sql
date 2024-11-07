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
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `id` INT NOT NULL,
  `address_of_client` VARCHAR(45) NULL,
  `Name_of_client` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Receipt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Receipt` (
  `Number_of_order` INT NOT NULL,
  `id_client` INT NULL,
  `date_of_order` DATE NULL,
  PRIMARY KEY (`Number_of_order`),
  INDEX `receipt-client_idx` (`id_client` ASC) VISIBLE,
  CONSTRAINT `receipt-client`
    FOREIGN KEY (`id_client`)
    REFERENCES `mydb`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Goods` (
  `id` INT NOT NULL,
  `name_of_goods` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `number_of_order` INT NULL,
  `id_of_goods` INT NULL,
  `quantity_of_goods` INT NULL,
  INDEX `order-receipt_idx` (`number_of_order` ASC) VISIBLE,
  INDEX `order-goods_idx` (`id_of_goods` ASC) VISIBLE,
  CONSTRAINT `order-receipt`
    FOREIGN KEY (`number_of_order`)
    REFERENCES `mydb`.`Receipt` (`Number_of_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order-goods`
    FOREIGN KEY (`id_of_goods`)
    REFERENCES `mydb`.`Goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
