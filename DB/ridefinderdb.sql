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
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `nickname` VARCHAR(45) NULL,
  `photo_url` VARCHAR(2000) NULL,
  `description` TEXT NULL,
  `shared` TINYINT NOT NULL DEFAULT 1,
  `last_name` VARCHAR(45) NULL,
  `address_id` INT NULL,
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
  `administrator` TINYINT NOT NULL DEFAULT 0,
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
  `rating` INT NULL DEFAULT 5,
  `comment` TEXT NULL,
  `create_date` DATETIME NULL,
  `administrator` TINYINT NOT NULL DEFAULT 0,
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
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `description`, `enabled`) VALUES (1, 'Harley shop', 'Denver', 'Colorado', NULL, NULL, 1);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `description`, `enabled`) VALUES (2, 'Harley-Davidson of Greenville,Chrome Drive', 'Greenville', 'South Carolina', NULL, NULL, 1);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `description`, `enabled`) VALUES (3, NULL, 'Galena', 'Illinois', NULL, NULL, 1);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `description`, `enabled`) VALUES (4, 'West Dickson Street', 'Fayetteville', 'Arkansas', NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `ridefinderDB`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (1, 'admin', 'password', 1, NULL, 'Bill', 'Big Bill', 'https://patch.com/img/cdn/users/255960/2011/10/raw/83577864d6e261e574365a5ea3a0b65e.jpg', 'MC Vet that loves to ride', 1, 'Sanders', 1, '2023/09/22', '2023/09/22');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (2, 'Smokey', 'password', 1, NULL, 'Frank', 'Smokey', NULL, 'MC Vet/LEO that loves to ride', 1, 'Richardson', 2, '2023/01/01', '2023/09/27');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (3, 'Ironclad', 'password', 1, NULL, 'Kurt', 'Ironclad', NULL, 'The open road is my home.', 1, 'Moller', 3, '2023/04/25', '2023/09/15');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (4, 'Tank', 'password', 1, NULL, 'Sean', 'Tank', NULL, 'Live to ride, ride to live.', 1, 'Bullock', 4, '2023/02/04', '2023/09/18');

COMMIT;


-- -----------------------------------------------------
-- Data for table `club`
-- -----------------------------------------------------
START TRANSACTION;
USE `ridefinderDB`;
INSERT INTO `club` (`id`, `user_id`, `name`, `photo_url`, `enabled`, `description`, `shared`, `create_date`, `last_update`) VALUES (1, 1, 'Brotherhood of Marine Corps Riders', 'https://static.wixstatic.com/media/bd7998_570baecc8624463b9e45d2757615fa51~mv2.jpg/v1/fill/w_938,h_672,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/IMG_6211_JPG.jpg', 1, 'The Brotherhood of Marine Corps Riders (BMCR) is an independent organization and is not affiliated nor sponsored by the United States Marine Corps, any motorcycle manufacturer, or any other organization.​ The BMCR was formed to offer motorcycling camaraderie to active duty, retired, and honorably discharged Marines and Navy “Fleet Marine Forces” (FMF) Corpsmen. The BMCR is not associated with the Confederation of Clubs (COC). We are a motorcycle riding club that share a common love of riding American motorcycles. ', 1, '2023/01/01', '2023/09/22');
INSERT INTO `club` (`id`, `user_id`, `name`, `photo_url`, `enabled`, `description`, `shared`, `create_date`, `last_update`) VALUES (2, 2, 'U.S. Military Vets MC', 'https://usmvmc.org/wp-content/uploads/2022/07/SmallEagle.png', 1, 'The U.S. Military Vets MC was established in 1987 , in Fort Lauderdale, Florida and is incorporated as a non-profit organization. The club is a national organization. We Welcome all Veterans, active duty and honorably discharged. This includes all branches of service and all eras, peacetime and wartime.', 1, '1987/01/01', '2023/09/27');
INSERT INTO `club` (`id`, `user_id`, `name`, `photo_url`, `enabled`, `description`, `shared`, `create_date`, `last_update`) VALUES (3, 3, 'U.S. Veterans Motorcycle Club', 'https://images.squarespace-cdn.com/content/v1/5e9e54a8ecc46e1c5a3d8b5c/ab6d0816-3c86-4dba-9e5c-8a6f3332ed89/f2d32bc2-c9c2-494a-a9b0-3fb64147977e.JPG?format=2500w', 1, 'The U.S. VETERANS MOTORCYCLE CLUB (USVMC), NATION was established in March 2007 and incorporated as a non-profit organization in 2008. The USVMC is a Motorcycle Club comprised of Veterans from all branches of Service. Our main tenets are:\n 1) To support and defend the Constitution of the United States against all enemies foreign and domestic… our Military Oath NEVER expires!\n2) To support Veterans and Veteran causes.\n  3) To improve and enhance the image of Veterans and Bikers to the general public.\nWe abide by a set of by-laws and truly live by a code of Brotherhood, a code we do not hold lightly. The USVMC Eagle is the sole property of the USVMC Nation and is not affiliated with any other Motorcycle Club. We are a traditional MC and require a very high level of commitment.', 1, '2008/01/01', '2023/09/27');
INSERT INTO `club` (`id`, `user_id`, `name`, `photo_url`, `enabled`, `description`, `shared`, `create_date`, `last_update`) VALUES (4, 4, 'Punishers Motorcycle Club', 'https://img1.wsimg.com/isteam/ip/14eaca9c-4cee-480e-bb4f-f61953d7e5db/blob-0f08aaf.png/:/cr=t:0%25,l:0%25,w:100%25,h:100%25', 1, 'The Punishers Law Enforcement Motorcycle Club\n(PLEMC) is a brotherhood of law enforcement officers,\ncourt officers, correctional officers, and other justice\nsystem professionals, emergency medical services\n(EMS), firefighters, military, and likeminded individuals.\nOur blended population is by design and is partially a\nsource of our strength and distinction.', 1, '1999/07/04', '2023/09/27');

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
INSERT INTO `ride` (`id`, `name`, `start_time`, `ride_date`, `duration`, `club_id`, `start_address_id`, `end_address_id`, `create_date`, `last_update`, `description`, `banner_url`, `skill_level_id`, `user_id`, `photo_url`) VALUES (2, 'RIDE TO FT MYERS 4 KEY WEST RIDE', '11:00:00', '2023/10/20', '7', 2, 2, 2, '2023/09/25', '2023/09/25', 'Ride to Ft Myers 4 Key West Ride\nHarley-Davidson of Greenville\nEvent by Independent Motorcyclist Association\nMeeting at 8am KSU @ 8:30am to Ride to Ft Myers FL for the 5th Annual Invasion of Key West Ride.We will ride all back roads to Starke,FL. Stay overnight at the Best Western. Continue the trip on Thursday morning on down to Ft Myers. We will spend Thursday and Friday in Ft Myers. The ride to Key West will be Saturday morning. The return trip will be Sunday and Monday back to Greenville SC. Any questions feel free to ask!\nWe will be making stops in Saluda, SC @(7-11). around 10:30am. South August at Circle K @Tobacco Rd. and Hwy 25. around 12 noon. From there on to Statesboro,Ga. We will take US Hwy 301 the rest of the ride. No interstate!!', 'https://usmvmc.org/wp-content/uploads/2022/07/SmallEagle.png', 3, 2, 'https://www.kickstandsup.com/_next/image?url=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fkickstandsup-production.appspot.com%2Fo%2Fevent-banner-images%252Fevent-banner-1362af2d-619d-4b40-a061-20d79e511e85%3Falt%3Dmedia%26token%3D6e8e0dee-d9d8-4a35-b59a-74c3402685db&w=2048&q=75');
INSERT INTO `ride` (`id`, `name`, `start_time`, `ride_date`, `duration`, `club_id`, `start_address_id`, `end_address_id`, `create_date`, `last_update`, `description`, `banner_url`, `skill_level_id`, `user_id`, `photo_url`) VALUES (3, 'CAMP WISCONSIN ADVENTURE RIDE FALL', '12:00:00', '2023/10/15', '6', 3, 3, 3, '2023/09/23', '2023/09/23', 'The Trans Wisconsin Adventure Trail is a 650 mile route starting in Galena, IL, and ending at Lake Superior, near the town of Cornucopia, WI. The route is a patchwork of paved roads, forest roads, deep gravel and sandy roads, taking you through the Northern Woods.', 'https://www.kickstandsup.com/_next/image?url=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fkickstandsup-production.appspot.com%2Fo%2Fevent-feed-images%252Fevent-feed-b5f69d12-bded-4f01-841a-1f4987c8f99a%3Falt%3Dmedia%26token%3D87bbecba-c6ed-49d4-a9ed-645471c13585&w=2048&q=75', 2, 3, 'https://www.kickstandsup.com/_next/image?url=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fkickstandsup-production.appspot.com%2Fo%2Fevent-banner-images%252Fevent-banner-b5f69d12-bded-4f01-841a-1f4987c8f99a%3Falt%3Dmedia%26token%3De48c6d25-7d87-4b6b-8d2d-e7874e82eb77&w=2048&q=75');
INSERT INTO `ride` (`id`, `name`, `start_time`, `ride_date`, `duration`, `club_id`, `start_address_id`, `end_address_id`, `create_date`, `last_update`, `description`, `banner_url`, `skill_level_id`, `user_id`, `photo_url`) VALUES (4, 'EAGLE RIDER AT BIKES, BLUES, & BBQ', '10:30:00', '2023/10/25', '5', 4, 4, 4, '2023/09/24', '2023/09/24', 'The BBB rally has raised $3 million for some 40 different local charities since its inception at the turn of the millennium, according to organizers. The giving continues for the 18th edition, held in the northern Arkansas college party town of Fayetteville, but known for its rides into the scenic Ozark Mountains. Activities include factory demos, countless vendors, H.O.G. registration, beer gardens, live music, lawn mower pulls, Firefighters’ Poker Run, Miss BBB Contest, bike parade, classic car show, the Monster Energy Experience, the Battle of the Bikes custom bike show and, of course, the People’s Choice Arkansas State BBQ Championship. Chow down, ride up to the mountains.', 'https://www.kickstandsup.com/_next/image?url=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fkickstandsup-production.appspot.com%2Fo%2Fevent-feed-images%252Fevent-feed-ccc14bdc-ccd4-4166-b480-b16980d3ddd8%3Falt%3Dmedia%26token%3D50fd7173-2646-4c95-9e57-9dc07d9ad446&w=2048&q=75', 1, 4, 'https://www.kickstandsup.com/_next/image?url=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fkickstandsup-production.appspot.com%2Fo%2Fevent-banner-images%252Fevent-banner-ccc14bdc-ccd4-4166-b480-b16980d3ddd8%3Falt%3Dmedia%26token%3D058a70c8-c9d7-475a-9550-f47d76ca2a7e&w=2048&q=75');

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
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (2, 2, 0, '2023/02/25', 'Smokey');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (3, 3, 0, '2023/09/20', 'Ironclad');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (4, 4, 0, '2023/09/25', 'Tank');

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
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (1, 1, 5, 'Was great, would do it again!', '2023/09/22', 1);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (2, 2, 5, NULL, '2023/09/25', 1);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (3, 3, 5, NULL, '2023/09/23', 1);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (4, 4, 5, NULL, '2023/09/24', 1);

COMMIT;

