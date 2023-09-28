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
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `description`, `enabled`) VALUES (5, NULL, 'Daytona Beach', 'Florida', NULL, NULL, 1);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `description`, `enabled`) VALUES (6, '', 'Myrtle Beach', 'South Carolina', NULL, NULL, 1);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `description`, `enabled`) VALUES (7, 'WestWorld of Scottsdale, N Pima Rd,', 'Scottsdale', 'Arizona', NULL, NULL, 1);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `description`, `enabled`) VALUES (8, '11th Street Cowboy Bar, 11th Street', 'Bandera', 'Texas', NULL, NULL, 1);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `description`, `enabled`) VALUES (9, NULL, 'Townsend', 'Tennessee', NULL, NULL, 1);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `description`, `enabled`) VALUES (10, NULL, 'Leadville', 'Colorado', NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `ridefinderDB`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (1, 'admin', 'password', 1, NULL, 'Bill', 'Big Bill', 'https://patch.com/img/cdn/users/255960/2011/10/raw/83577864d6e261e574365a5ea3a0b65e.jpg', 'MC Vet that loves to ride', 1, 'Sanders', 1, '2023/09/22', '2023/09/22');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (2, 'Smokey', 'password', 1, NULL, 'Frank', 'Smokey', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAuCBOqjfKoC3__48q2xl2ZFSMHGAhlzPZsQ&usqp=CAU', 'MC Vet/LEO that loves to ride', 1, 'Richardson', 2, '2023/01/01', '2023/09/27');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (3, 'Ironclad', 'password', 1, NULL, 'Kurt', 'Ironclad', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDxKcmD7i5W4YZ2aOJHK6FwovpSq21WoVYeA&usqp=CAU', 'The open road is my home.', 1, 'Moller', 3, '2023/04/25', '2023/09/15');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (4, 'Tank', 'password', 1, NULL, 'Sean', 'Tank', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv4zw3B92wGNk4LWpHv9TVubZtMQOtIy4jVw&usqp=CAU', 'Live to ride, ride to live.', 1, 'Bullock', 4, '2023/02/04', '2023/09/18');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (5, 'Mario', 'password', 1, NULL, 'Mario', 'Super Mario', 'https://www.drawinghowtodraw.com/stepbystepdrawinglessons/wp-content/uploads/2011/04/mario-350x350.png', 'Itsa me Mario', 1, NULL, 1, '2023/05/08', '2023/09/01');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (6, 'Luigi', 'password', 1, NULL, 'Luigi', 'Luigi', 'https://i.pinimg.com/1200x/02/0e/f8/020ef8c7b328b6f36a7b32f67303982b.jpg', 'Mama mia!', 1, NULL, 1, '2023/05/09', '2023/09/25');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (7, 'Peach', 'password', 1, NULL, 'Peach', 'Princess Peach', 'https://i.pinimg.com/736x/55/73/5d/55735dfd4e68888c6f7955ccc696b58a.jpg', 'Whoo-hoo!', 1, NULL, 1, '2023/04/25', '2023/05/25');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (8, 'Snake', 'password', 1, NULL, 'Snake', 'Snake', 'https://upload.wikimedia.org/wikipedia/en/e/e8/SnakePlissken.jpeg', 'Hey everybody!', 1, 'Plissken', 2, '2023/02/24', '2023/06/14');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (9, 'Daryl', 'password', 1, NULL, 'Daryl', 'Pookie', 'https://metro.co.uk/wp-content/uploads/2018/08/sei_26361813-1548.jpg?quality=90&strip=all', 'Love the open roade', 1, 'Dixon', 1, '2023/06/27', '2023/09/02');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (10, 'Jax', 'password', 1, NULL, 'Jackson', 'Jax', 'https://sportshub.cbsistatic.com/i/2021/03/18/3baa3b90-452c-4e81-b4ac-d47fcf4e1208/sons-of-anarchy-jax-teller-1216796.jpg', 'No hour is wasted when spent on two wheels', 1, 'Teller', 1, '2023/08/27', '2023/09/01');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (11, 'Johnny', 'password', 1, NULL, 'Johnny', 'Ghost Rider', 'https://flxt.tmsimg.com/assets/p159753_k_v8_ab.jpg', 'I feel like my skull is on fire, but I\'m good.', 1, 'Blaze', 1, '2023/09/08', '2023/09/10');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (12, 'Robert', 'password', 1, NULL, 'Robert', 'Evel Knievel', 'https://images2.minutemediacdn.com/image/upload/c_fill,w_1440,ar_16:9,f_auto,q_auto,g_auto/shape/cover/sport/86829-gettyimages-3064035-fb3851256d52926992aedf1671465ddc.jpg', 'I love the feeling of the fresh air on my face and the wind blowing through my hair', 1, 'Knievel', 1, '2023/01/01', '2023/01/02');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (13, 'Bruce', 'password', 1, NULL, 'Bruce', 'Batman', 'https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2023%2F06%2FHot-Toys-Debuts-Batman-and-Batcycle-Collectible-Set-Ahead-of-The-Flash-Premiere-0.jpg?w=960&cbr=1&q=90&fit=max', 'I Wear A Mask. And That Mask, It’s Not To Hide Who I Am, But To Create What I Am', 1, 'Wayne', 1, '2023/07/21', '2023/08/01');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (14, 'DK', 'password', 1, NULL, 'Donkey', 'DK', 'https://static.wikia.nocookie.net/mariokart/images/6/66/BAFADEE3-A41C-4F1D-86C3-2951FE24017F.png/revision/latest?cb=20181126005614', 'Banana slamma!!', 1, 'Kong', 1, '2023/06/24', '2023/07/21');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `nickname`, `photo_url`, `description`, `shared`, `last_name`, `address_id`, `create_date`, `last_update`) VALUES (15, 'Natasha', 'password', 1, NULL, 'Natasha', 'Black Widow', 'https://i.pinimg.com/originals/56/26/82/56268245daad8238db2336779188694b.jpg', 'It’s Ride O’Clock Somewhere', 1, 'Romanoff', 1, '2023/05/17', '2023/09/09');

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
INSERT INTO `ride` (`id`, `name`, `start_time`, `ride_date`, `duration`, `club_id`, `start_address_id`, `end_address_id`, `create_date`, `last_update`, `description`, `banner_url`, `skill_level_id`, `user_id`, `photo_url`) VALUES (5, 'BIKETOBERFEST DAYTONA BEACH 2023', '09:00:00', '2023/10/19', '5', 1, 5, 5, '2023/09/20', '2023/09/28', 'Biketoberfest® celebrates a full-throttle lifestyle born on two wheels.  Motorcycle enthusiasts come together during the four-day rally each year to enjoy beautiful Florida weather, live music, motorcycle racing at Daytona International Speedway, and miles of scenic rides along famous A1A, historic Main Street or the scenic Loop. Come experience the Southeast’s best motorcycle rally featuring motorcycle shows, custom bike builds and hundreds of the industry’s top vendors throughout Daytona Beach. All roads lead to this rally.\nBiketoberfest® is a collection of activities that take place at venues and businesses in cities throughout Volusia County and beyond. Our local hotels, businesses, parks and beaches are open for visitors to enjoy the area’s beautiful October weather and scenic rides. We ask all our visitors who do decide to travel to please visit responsibly. ', 'https://www.kickstandsup.com/_next/image?url=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fkickstandsup-production.appspot.com%2Fo%2Fevent-banner-images%252Fevent-banner-05b26bc3-f511-4d80-91fe-583e56dc4d13%3Falt%3Dmedia%26token%3D821f7866-cefe-41f0-8194-d6100f59adab&w=2048&q=75', 2, 1, 'https://www.kickstandsup.com/_next/image?url=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fkickstandsup-production.appspot.com%2Fo%2Fevent-banner-images%252Fevent-banner-05b26bc3-f511-4d80-91fe-583e56dc4d13%3Falt%3Dmedia%26token%3D821f7866-cefe-41f0-8194-d6100f59adab&w=2048&q=75');
INSERT INTO `ride` (`id`, `name`, `start_time`, `ride_date`, `duration`, `club_id`, `start_address_id`, `end_address_id`, `create_date`, `last_update`, `description`, `banner_url`, `skill_level_id`, `user_id`, `photo_url`) VALUES (6, 'SCENIC FALL RALLY RIDE 2023', '10:00:00', '2023/10/19', '7', 3, 6, 6, '2023/09/01', '2023/09/15', 'SADDLE UP! Because it’s time for another Scenic Rally Ride! Head on down to the South Strand for registration at The Tuna Shak from 9 a.m. - 11 a.m. with free breakfast, music, and free event t-shirts for the first 150 riders! Cost is $15 for a single rider, $5 for a passenger. Proceeds will benefit our local CVMA chapter, which will also be selling 50/50 raffle tickets and leading the ride! KSU is at 11 a.m. sharp. You’ll take in the gorgeous scenery of Myrtle Beach during a cruise up the coast to Local on the Water for an after party! From 1 p.m. - 4 p.m. we’ll have free food, live music, door prizes, and a guaranteed good time! Let’s kick things into high gear and end the 2023 Hurricane Alley Fall Rally on a high note!', 'https://www.kickstandsup.com/_next/image?url=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fkickstandsup-production.appspot.com%2Fo%2Fevent-feed-images%252Fevent-feed-2869d2f6-6078-4370-99c8-b9d2a34a0b58%3Falt%3Dmedia%26token%3D302c2c1e-609e-4e34-843c-667b6bddf64d&w=2048&q=75', 1, 3, 'https://www.kickstandsup.com/_next/image?url=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fkickstandsup-production.appspot.com%2Fo%2Fevent-feed-images%252Fevent-feed-2869d2f6-6078-4370-99c8-b9d2a34a0b58%3Falt%3Dmedia%26token%3D302c2c1e-609e-4e34-843c-667b6bddf64d&w=2048&q=75');
INSERT INTO `ride` (`id`, `name`, `start_time`, `ride_date`, `duration`, `club_id`, `start_address_id`, `end_address_id`, `create_date`, `last_update`, `description`, `banner_url`, `skill_level_id`, `user_id`, `photo_url`) VALUES (7, 'ARIZONA BIKE WEEK', '13:00:00', '2024/04/03', '120', 1, 7, 7, '2023/04/01', '2023/09/20', 'Arizona Bike Week at WestWorld is a celebration of motorcycles and music. With two stages, featuring live music all day and night, plus vendors, stunt shows, contests and demos, there’s plenty of entertainment options for everyone. Our scenic terrain and amazing spring weather make for some of the best riding in the country but even non-riders will want to take advantage of the unique experience ABW offers. We offer the option of purchasing a single day pass to see your favorite band in concert or a multi day pass, which gives you access to all the nightly concerts and festivities. Our low ticket pricing offers an opportunity to see four incredible concerts at a price you won\'t find anywhere else. Our RockYard stage has proudly featured some of the biggest names in the music world, such as Foreigner, Cheap Trick, Bret Michaels, Heart, George Thorogood, Dierks Bentley, Heart, Puddle of Mudd, REO Speedwagon, Buckcherry, Doobie Brothers, ZZ Top, Lynyrd Skynyrd, Godsmack, Shinedown and Korn, just to name a few. Check out our website for this year’s lineup www.azbikeweek.com. There you’ll find links to purchase tickets, reserve on-site RV and tent camping or nearby hotel rooms at discounted rates.  See you at Arizona Bike Week, the rally and musicfest that gives you more bang for your buck!', 'https://www.kickstandsup.com/_next/image?url=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fkickstandsup-production.appspot.com%2Fo%2Fevent-feed-images%252Fevent-feed-f5c2f71f-2448-43f4-8e4a-b9cffc719bc1%3Falt%3Dmedia%26token%3D68404d18-341d-4e34-ae09-eb51010418b8&w=2048&q=75', 1, 4, 'https://www.kickstandsup.com/_next/image?url=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fkickstandsup-production.appspot.com%2Fo%2Fevent-feed-images%252Fevent-feed-f5c2f71f-2448-43f4-8e4a-b9cffc719bc1%3Falt%3Dmedia%26token%3D68404d18-341d-4e34-ae09-eb51010418b8&w=2048&q=75');
INSERT INTO `ride` (`id`, `name`, `start_time`, `ride_date`, `duration`, `club_id`, `start_address_id`, `end_address_id`, `create_date`, `last_update`, `description`, `banner_url`, `skill_level_id`, `user_id`, `photo_url`) VALUES (8, '13TH ANNUAL FROGS FOR FREEDOM', '09:00:00', '2023/10/07', '9', 2, 8, 8, '2023/08/15', '2023/09/16', '*Live Music * Live *Auction\n50/50 Raffle * BBQ\nHill Country Motorcycle Ride\nThis ride benefits widows and children of members KIA/KIT (killed in action/killed in training) as well as current active SEALs and former SEAL/SWCC members and family\'s in need. Sponsored by the UDT/SEAL Association / SEAL Veterans Foundation.', 'https://www.kickstandsup.com/_next/image?url=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fkickstandsup-production.appspot.com%2Fo%2Fevent-feed-images%252Fevent-feed-cc097f3e-3e9a-44b5-9ac9-290be75046b4%3Falt%3Dmedia%26token%3D64d8ee09-f5c5-4907-a676-7a835195ab87&w=2048&q=75', 1, 2, 'https://www.kickstandsup.com/_next/image?url=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fkickstandsup-production.appspot.com%2Fo%2Fevent-feed-images%252Fevent-feed-cc097f3e-3e9a-44b5-9ac9-290be75046b4%3Falt%3Dmedia%26token%3D64d8ee09-f5c5-4907-a676-7a835195ab87&w=2048&q=75');
INSERT INTO `ride` (`id`, `name`, `start_time`, `ride_date`, `duration`, `club_id`, `start_address_id`, `end_address_id`, `create_date`, `last_update`, `description`, `banner_url`, `skill_level_id`, `user_id`, `photo_url`) VALUES (9, 'Smoky Mountain Small Bore Rally', '10:00:00', '2024/06/06', '48', 4, 9, 9, '2023/02/05', '2023/09/13', ' Hosted annually in June, the Smoky Mountain Small Bore Rally is a must attend event for any small bore enthusiast. The event is a jam-packed weekend of field games, races, stunting, giveaways, riding, food, and contests. The backdrop is the Great Smoky Mountains in Townsend, Tennessee, which is home to some of the best riding roads in North America. You’ll be able to enjoy these scenic views and fun roads with hundreds of other riders from around the country.    Some of the best industry vendors travel from across the country to attend and be part of the festivities.    You\'ll see Honda bikes, such as the Monkey, Grom, Ruckus, Helix and Super Cub. Not excluding the classic Hondas, such as the Trail 50, CT’s, and Metropolitan. This event is obviously not limited to Honda. Kawasaki\'s, Ice Bear\'s, Ohvale\'s, and Yamaha\'s are sure to be in attendance. We’ve even seen several custom 1 off builds such as a 150cc gy6 street-legal Tractor and several street-legal Jetski\'s!    This year\'s Bike Show is hosted by Detroit Ruck Garage, based out of Detroit, Michigan. Lee Juhl, owner, runs this mini-moto bike shop and designs some of the very best custom builds in the world. ', 'https://img1.wsimg.com/isteam/ip/132af934-eea3-4e12-b926-448d8a925cad/Smoky%20Mountain.png/:/rs=w:200,h:200,cg:true,m/cr=w:200,h:200/qt=q:95', 1, 4, 'https://img1.wsimg.com/isteam/ip/132af934-eea3-4e12-b926-448d8a925cad/Smoky%20Mountain.png/:/rs=w:200,h:200,cg:true,m/cr=w:200,h:200/qt=q:95');
INSERT INTO `ride` (`id`, `name`, `start_time`, `ride_date`, `duration`, `club_id`, `start_address_id`, `end_address_id`, `create_date`, `last_update`, `description`, `banner_url`, `skill_level_id`, `user_id`, `photo_url`) VALUES (10, 'HOLIDAY MOTO EXPERIENCE', '12:00:00', '2024/06/14', '10', 1, 10, 10, '2023/04/23', '2023/09/15', 'Set in the Colorado High Country, Leadville Motocross Park is base camp for our event and offers a unique experience for families and individuals alike. The picturesque, loamy, professionally groomed track provides a flowing layout, with grippy yet forgiving riding conditions that has earned it the reputation of being the best damn practice track in the Rockies. \nBut the fun is not limited to the track experience only. Leadville also has something to offer all genres of motorcycling, across all experience levels. Enduro, adventure trails, and miles of some of the most scenic roads Colorado has to offer, make Leadville the perfect location for our Holiday inspired vision.\n The Holiday Moto Experience will has something special to offer to riders both on and off the track including; Jason Raines Yamaha Demo Center, trail rides, adventure rides, street rides, pit bikes, camping, live music, happy hour, vendors, BBQ, a pancake breakfast and a lot of fun. We like fun.\nWe look forward to seeing you there!', 'https://riderjustice.com/wp-content/uploads/2023/04/HolidayMoto.jpg', 2, 1, 'https://riderjustice.com/wp-content/uploads/2023/04/HolidayMoto.jpg');

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
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (1, 1, 1, '2023/09/25', 'Big Bill');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (2, 2, 1, '2023/02/25', 'Smokey');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (3, 3, 1, '2023/09/20', 'Ironclad');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (4, 4, 1, '2023/09/25', 'Tank');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (5, 1, 0, '2023/09/22', 'Mario');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (5, 2, 0, '2023/09/15', 'Mario');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (6, 3, 0, '2023/09/08', 'Luigi');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (6, 4, 0, '2023/09/01', 'Luigi');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (7, 1, 0, '2023/09/28', 'Peach');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (7, 2, 0, '2023/09/10', 'Peach');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (7, 3, 0, '2023/09/11', 'Peach');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (8, 4, 0, '2023/09/17', 'Snake');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (8, 1, 0, '2023/09/01', 'Snake');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (8, 2, 0, '2023/09/20', 'Snake');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (9, 3, 0, '2023/09/15', 'Pookie');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (9, 4, 0, '2023/09/13', 'Pookie');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (9, 1, 0, '2023/09/14', 'Pookie');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (10, 2, 0, '2023/09/07', 'Jax');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (10, 3, 0, '2023/09/01', 'Jax');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (11, 4, 0, '2023/09/07', 'Ghost Rider');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (11, 1, 0, '2023/09/04', 'Ghost Rider');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (11, 2, 0, '2023/09/12', 'Ghost Rider');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (12, 3, 0, '2023/09/18', 'Evel Knievel');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (12, 4, 0, '2023/09/21', 'Evel Knievel');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (13, 1, 0, '2023/09/22', 'Batman');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (13, 2, 0, '2023/09/17', 'Batman');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (13, 3, 0, '2023/09/08', 'Batman');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (14, 4, 0, '2023/09/09', 'DK');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (14, 1, 0, '2023/09/10', 'DK');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (14, 2, 0, '2023/09/18', 'DK');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (15, 3, 0, '2023/09/02', 'Black Widow');
INSERT INTO `club_member` (`user_id`, `club_id`, `administrator`, `date_joined`, `nickname`) VALUES (15, 4, 0, '2023/09/17', 'Black Widow');

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
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (2, 2, 5, 'I love the open road', '2023/09/25', 1);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (3, 3, 5, 'Nothing like windtherapy', '2023/09/23', 1);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (4, 4, 5, 'Lets ride!', '2023/09/24', 1);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (5, 5, 5, NULL, '2023/09/10', 1);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (6, 6, 5, NULL, '2023/09/11', 1);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (7, 7, 5, NULL, '2023/09/12', 1);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (1, 8, 5, NULL, '2023/09/13', 1);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (1, 9, 5, NULL, '2023/09/14', 1);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (2, 10, 5, NULL, '2023/09/15', 1);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (8, 1, 5, NULL, NULL, 0);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (8, 7, 5, NULL, NULL, 0);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (9, 2, 5, NULL, NULL, 0);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (9, 4, 5, NULL, NULL, 0);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (10, 3, 5, NULL, NULL, 0);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (10, 6, 5, NULL, NULL, 0);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (10, 7, 5, NULL, NULL, 0);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (11, 1, 5, NULL, NULL, 0);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (11, 4, 5, NULL, NULL, 0);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (11, 7, 5, NULL, NULL, 0);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (12, 8, 5, NULL, NULL, 0);
INSERT INTO `rider` (`user_id`, `ride_id`, `rating`, `comment`, `create_date`, `administrator`) VALUES (12, 9, 5, NULL, NULL, 0);

COMMIT;

