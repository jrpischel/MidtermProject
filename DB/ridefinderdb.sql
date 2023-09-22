-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ridefinderDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ridefinderDB` ;

-- -----------------------------------------------------
-- Schema ridefinderDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ridefinderDB` DEFAULT CHARACTER SET utf8 ;
USE `ridefinderDB` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NOT NULL,
  `role` VARCHAR(45) NULL,
  UNIQUE INDEX `user_name_UNIQUE` (`username` ASC),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ride`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ride` ;

CREATE TABLE IF NOT EXISTS `ride` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `start_point` VARCHAR(45) NULL,
  `end_point` VARCHAR(45) NULL,
  `time` DATETIME NULL,
  `skill` VARCHAR(45) NULL,
  `private` TINYINT NULL,
  `user` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ride_user_idx` (`user` ASC),
  CONSTRAINT `fk_ride_user`
    FOREIGN KEY (`user`)
    REFERENCES `user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS bikeuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'bikeuser'@'localhost' IDENTIFIED BY 'bikeuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'bikeuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `ridefinderDB`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`) VALUES (1, 'admin', 'password', 1, NULL);

COMMIT;

