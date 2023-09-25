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
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(50) NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zip` VARCHAR(10) NULL,
  `description` TEXT NULL,
  `enabled` TINYINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


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
  `first_name` VARCHAR(45) NULL,
  `nickname` VARCHAR(45) NULL,
  `photo_url` VARCHAR(2000) NULL,
  `description` TEXT NULL,
  `shared` TINYINT NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `address_id` INT NOT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  UNIQUE INDEX `user_name_UNIQUE` (`username` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `club`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `club` ;

CREATE TABLE IF NOT EXISTS `club` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `name` VARCHAR(200) NOT NULL,
  `photo_url` VARCHAR(2000) NULL,
  `enabled` TINYINT NOT NULL,
  `description` TEXT NULL,
  `shared` TINYINT NOT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_group_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_group_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `skill_level`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `skill_level` ;

CREATE TABLE IF NOT EXISTS `skill_level` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ride`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ride` ;

CREATE TABLE IF NOT EXISTS `ride` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `start_time` TIME NULL,
  `ride_date` DATE NULL,
  `duration` VARCHAR(45) NULL,
  `club_id` INT NULL,
  `start_address_id` INT NOT NULL,
  `end_address_id` INT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `description` TEXT NULL,
  `banner_url` VARCHAR(2000) NULL,
  `skill_level_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `photo_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ride_group1_idx` (`club_id` ASC),
  INDEX `fk_ride_address1_idx` (`start_address_id` ASC),
  INDEX `fk_ride_address2_idx` (`end_address_id` ASC),
  INDEX `fk_ride_skill_level1_idx` (`skill_level_id` ASC),
  INDEX `fk_ride_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_ride_group1`
    FOREIGN KEY (`club_id`)
    REFERENCES `club` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_address1`
    FOREIGN KEY (`start_address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_address2`
    FOREIGN KEY (`end_address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_skill_level1`
    FOREIGN KEY (`skill_level_id`)
    REFERENCES `skill_level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ride_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ride_comment` ;

CREATE TABLE IF NOT EXISTS `ride_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ride_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `comment` TEXT NULL,
  `picture_url` VARCHAR(2000) NULL,
  `enabled` TINYINT NOT NULL,
  `create_date` DATETIME NULL,
  `inreply_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_ride1_idx` (`ride_id` ASC),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_ride_comment_ride_comment1_idx` (`inreply_id` ASC),
  CONSTRAINT `fk_comment_ride1`
    FOREIGN KEY (`ride_id`)
    REFERENCES `ride` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_comment_ride_comment1`
    FOREIGN KEY (`inreply_id`)
    REFERENCES `ride_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `club_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `club_member` ;

CREATE TABLE IF NOT EXISTS `club_member` (
  `user_id` INT NOT NULL,
  `club_id` INT NOT NULL,
  `administrator` TINYINT NOT NULL,
  `date_joined` DATETIME NULL,
  `nickname` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`, `club_id`),
  INDEX `fk_user_has_club_club1_idx` (`club_id` ASC),
  INDEX `fk_user_has_club_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_club_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_club_club1`
    FOREIGN KEY (`club_id`)
    REFERENCES `club` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ride_photo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ride_photo` ;

CREATE TABLE IF NOT EXISTS `ride_photo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `photo_url` VARCHAR(2000) NULL,
  `create_date` DATETIME NULL,
  `caption` TEXT NULL,
  `ride_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `enabled` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ride_photo_ride1_idx` (`ride_id` ASC),
  INDEX `fk_ride_photo_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_ride_photo_ride1`
    FOREIGN KEY (`ride_id`)
    REFERENCES `ride` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_photo_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `club_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `club_comment` ;

CREATE TABLE IF NOT EXISTS `club_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `comment` TEXT NULL,
  `picture_url` VARCHAR(2000) NULL,
  `enabled` TINYINT NOT NULL,
  `create_date` DATETIME NULL,
  `inreply_id` INT NULL,
  `club_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_ride_comment_ride_comment1_idx` (`inreply_id` ASC),
  INDEX `fk_club_comment_club1_idx` (`club_id` ASC),
  CONSTRAINT `fk_comment_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_comment_ride_comment10`
    FOREIGN KEY (`inreply_id`)
    REFERENCES `club_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_club_comment_club1`
    FOREIGN KEY (`club_id`)
    REFERENCES `club` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_comment` ;

CREATE TABLE IF NOT EXISTS `user_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `comment` TEXT NULL,
  `picture_url` VARCHAR(2000) NULL,
  `enabled` TINYINT NOT NULL,
  `create_date` DATETIME NULL,
  `inreply_id` INT NULL,
  `recipient_id` INT NOT NULL,
  `shared` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_ride_comment_ride_comment1_idx` (`inreply_id` ASC),
  INDEX `fk_user_comment__user1_idx` (`recipient_id` ASC),
  CONSTRAINT `fk_comment_user100`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_comment_ride_comment100`
    FOREIGN KEY (`inreply_id`)
    REFERENCES `user_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_comment__user1`
    FOREIGN KEY (`recipient_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rider`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rider` ;

CREATE TABLE IF NOT EXISTS `rider` (
  `user_id` INT NOT NULL,
  `ride_id` INT NOT NULL,
  `rating` INT NULL,
  `comment` TEXT NULL,
  `create_date` DATETIME NULL,
  PRIMARY KEY (`user_id`, `ride_id`),
  INDEX `fk_user_has_ride_ride1_idx` (`ride_id` ASC),
  INDEX `fk_user_has_ride_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_ride_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_ride_ride1`
    FOREIGN KEY (`ride_id`)
    REFERENCES `ride` (`id`)
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
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `ridefinderDB`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `description`, `enabled`) VALUES (1, NULL, 'Denver', 'Colorado', NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `ridefinderDB`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (1, 'admin', 'password', 1, NULL, 'Bill', 'Big Bill', 'https://patch.com/img/cdn/users/255960/2011/10/raw/83577864d6e261e574365a5ea3a0b65e.jpg', 'MC Vet that loves to ride', 1, 'Sanders', 1, '2023/09/22', '2023/09/22');

COMMIT;


-- -----------------------------------------------------
-- Data for table `club`
-- -----------------------------------------------------
START TRANSACTION;
USE `ridefinderDB`;
INSERT INTO `club` (`id`, `user_id`, `name`, `photo_url`, `enabled`, `description`, `shared`, `create_date`, `last_update`) VALUES (1, 1, 'Brotherhood of Marine Corps Riders', 'https://static.wixstatic.com/media/bd7998_570baecc8624463b9e45d2757615fa51~mv2.jpg/v1/fill/w_938,h_672,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/IMG_6211_JPG.jpg', 1, 'The Brotherhood of Marine Corps Riders (BMCR) is an independent organization and is not affiliated nor sponsored by the United States Marine Corps, any motorcycle manufacturer, or any other organization.​ The BMCR was formed to offer motorcycling camaraderie to active duty, retired, and honorably discharged Marines and Navy “Fleet Marine Forces” (FMF) Corpsmen. The BMCR is not associated with the Confederation of Clubs (COC). We are a motorcycle riding club that share a common love of riding American motorcycles. ', 1, '2023/01/01', '2023/09/22');

COMMIT;


-- -----------------------------------------------------
-- Data for table `skill_level`
-- -----------------------------------------------------
START TRANSACTION;
USE `ridefinderDB`;
INSERT INTO `skill_level` (`id`, `name`, `description`) VALUES (1, 'Beginner', NULL);
INSERT INTO `skill_level` (`id`, `name`, `description`) VALUES (2, 'Intermediate', NULL);
INSERT INTO `skill_level` (`id`, `name`, `description`) VALUES (3, 'Advanced', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ride`
-- -----------------------------------------------------
START TRANSACTION;
USE `ridefinderDB`;
INSERT INTO `ride` (`id`, `name`, `start_time`, `ride_date`, `duration`, `club_id`, `start_address_id`, `end_address_id`, `create_date`, `last_update`, `description`, `banner_url`, `skill_level_id`, `user_id`, `photo_url`) VALUES (1, 'STREET VIBRATIONS FALL MOTORCYCLE RALLY', '10:00:00', '2023/09/24', '8', 1, 1, 1, '2023/09/22', '2023/09/22', 'STREET VIBRATIONS FALL MOTORCYCLE RALLY', 'https://www.kickstandsup.com/_next/image?url=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fkickstandsup-production.appspot.com%2Fo%2Fevent-feed-images%252Fevent-feed-f917a210-6dfc-4e4d-86ee-94ee1801a970%3Falt%3Dmedia%26token%3Da0c68e47-e4a0-4e67-8496-5c1554b02a1d&w=1920&q=75', 1, 1, 'https://www.kickstandsup.com/_next/image?url=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fkickstandsup-production.appspot.com%2Fo%2Fevent-feed-images%252Fevent-feed-f917a210-6dfc-4e4d-86ee-94ee1801a970%3Falt%3Dmedia%26token%3Da0c68e47-e4a0-4e67-8496-5c1554b02a1d&w=1920&q=75');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ride_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `ridefinderDB`;
INSERT INTO `ride_comment` (`id`, `ride_id`, `user_id`, `comment`, `picture_url`, `enabled`, `create_date`, `inreply_id`) VALUES (1, 1, 1, 'What a blast', 'https://riderjustice.com/wp-content/uploads/2023/04/EventHeader.jpg', 1, '2023/09/22', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `club_member`
-- -----------------------------------------------------
START TRANSACTION;
USE `ridefinderDB`;
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (1, 1, 0, '2023/09/25', 'Big Bill');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ride_photo`
-- -----------------------------------------------------
START TRANSACTION;
USE `ridefinderDB`;
INSERT INTO `ride_photo` (`id`, `photo_url`, `create_date`, `caption`, `ride_id`, `user_id`, `enabled`) VALUES (1, 'https://d56b293rhv8dp.cloudfront.net/events/3/images/medium_w/er-events_0016_Bikes__Blues__and_BBQ.jpg?1570040611', '2023/09/22', 'Lets Ride', 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `club_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `ridefinderDB`;
INSERT INTO `club_comment` (`id`, `user_id`, `comment`, `picture_url`, `enabled`, `create_date`, `inreply_id`, `club_id`) VALUES (1, 1, 'Lets go for a ride', 'https://cloudfront-us-east-1.images.arcpublishing.com/archetype/3UIW3CSEJZDFPPPRMPJSS4KRFM.jpg', 1, '2023/09/22', NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `ridefinderDB`;
INSERT INTO `user_comment` (`id`, `user_id`, `comment`, `picture_url`, `enabled`, `create_date`, `inreply_id`, `recipient_id`, `shared`) VALUES (1, 1, 'Check this out!', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpatch.com%2Fcalifornia%2Fbanning-beaumont%2Fvietnam-vet-bikers-disrespected-at-casino-tribal-rep-3021b82015&psig=AOvVaw1Oa5ceQMaaEK3IiP5A3x_G&ust=1695515810419000&source=images&cd=vfe&opi=89978449&ved=0CA8QjRxqFwoTCLiivt6-v4EDFQAAAAAdAAAAABAJ', 1, '2023/09/22', NULL, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rider`
-- -----------------------------------------------------
START TRANSACTION;
USE `ridefinderDB`;
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`) VALUES (1, 1, 5, 'Was great, would do it again!', '2023/09/22');

COMMIT;

