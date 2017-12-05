-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema inventorydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `inventorydb` ;

-- -----------------------------------------------------
-- Schema inventorydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inventorydb` DEFAULT CHARACTER SET utf8 ;
USE `inventorydb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zip` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(10) NULL DEFAULT NULL,
  `email` VARCHAR(100) NOT NULL,
  `address_id` INT(10) UNSIGNED NOT NULL,
  `permission_level` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_address_id_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item` ;

CREATE TABLE IF NOT EXISTS `item` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` MEDIUMTEXT NULL DEFAULT NULL,
  `owner_id` INT(10) UNSIGNED NOT NULL,
  `is_supply` TINYINT(1) NOT NULL DEFAULT '0',
  `is_available` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_user_id_idx` (`owner_id` ASC),
  CONSTRAINT `fk_item_user_id`
    FOREIGN KEY (`owner_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity` ;

CREATE TABLE IF NOT EXISTS `activity` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `borrower_id` INT(10) UNSIGNED NOT NULL,
  `item_id` INT(10) UNSIGNED NOT NULL,
  `date_lent` DATE NULL DEFAULT NULL,
  `due_date` DATE NULL DEFAULT NULL,
  `is_returned` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`, `item_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_user_id_idx` (`borrower_id` ASC),
  INDEX `fk_item_id_idx` (`item_id` ASC),
  CONSTRAINT `fk_activity_item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_activity_user_id`
    FOREIGN KEY (`borrower_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `login` ;

CREATE TABLE IF NOT EXISTS `login` (
  `user_email` VARCHAR(100) NOT NULL,
  `pwd` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`user_email`),
  UNIQUE INDEX `user_email_UNIQUE` (`user_email` ASC),
  CONSTRAINT `fk_login_user_email`
    FOREIGN KEY (`user_email`)
    REFERENCES `user` (`email`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (1, '18904 E Berry Dr', ' Aurora', ' Colorado', ' 80015');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (2, '225 S Newton St', ' Denver', ' Colorado', ' 80219');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (3, '22340 E Princeton Dr', ' Aurora', ' Colorado', ' 80018');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (4, '7400 E Orchard Rd', ' Greenwood Village', ' Colorado', ' 80111');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (5, '2370 W Alameda Ave', ' Denver', ' Colorado', ' 80223');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `phone`, `email`, `address_id`, `permission_level`) VALUES (1, 'Vivian', ' Caethe', '5551234567', ' vivian.caethe@gmail.com',  1,  1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `phone`, `email`, `address_id`, `permission_level`) VALUES (2, 'Greg', ' Norwood', '5551234567', ' greg.norwood@gmail.com',  2,  1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `phone`, `email`, `address_id`, `permission_level`) VALUES (3, 'Jason', ' Caldwell', '5551234567', ' jason.caldwell@gmail.com',  3,  1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `phone`, `email`, `address_id`, `permission_level`) VALUES (4, 'Chris', ' Gehrke', '5551234567', ' chris.gehrke@gmail.com',  4,  1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `phone`, `email`, `address_id`, `permission_level`) VALUES (5, 'Alexis', ' Low', '5551234567', ' alexis.low@gmail.com',  5,  1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `item`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `is_available`) VALUES (1, 'kennel', ' it is a kennel',  1,  0,  1);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `is_available`) VALUES (2, 'towel', ' a magical towel that absorbs liquid',  1,  0,  1);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `is_available`) VALUES (3, 'seeds', ' delicious plants',  1,  1,  1);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `is_available`) VALUES (4, 'kennel', ' wow a kennel',  2,  0,  1);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `is_available`) VALUES (5, 'hat', ' put it on yr head',  2,  0,  1);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `is_available`) VALUES (6, 'dremel', ' grinds beaks',  2,  0,  0);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `is_available`) VALUES (7, 'towel', ' like a sponge but not',  3,  0,  1);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `is_available`) VALUES (8, 'kennel', ' put human men in it',  3,  0,  1);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `is_available`) VALUES (9, 'seeds', ' yummy seeds',  3,  1,  1);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `is_available`) VALUES (10, 'book', ' has words in',  4,  0,  1);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `is_available`) VALUES (11, 'kennel', ' holds alive people',  4,  0,  1);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `is_available`) VALUES (12, 'seeds', ' omnomnom',  4,  1,  1);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `is_available`) VALUES (13, 'kennel', ' get in i promise i wont lock it',  5,  0,  1);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `is_available`) VALUES (14, 'book', ' meny werds',  5,  0,  1);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `is_available`) VALUES (15, 'towel', ' wins against liquids',  5,  0,  1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `activity` (`id`, `borrower_id`, `item_id`, `date_lent`, `due_date`, `is_returned`) VALUES (1,  1,  4, NULL, NULL, DEFAULT);
INSERT INTO `activity` (`id`, `borrower_id`, `item_id`, `date_lent`, `due_date`, `is_returned`) VALUES (2, 1,  10, NULL, NULL, DEFAULT);
INSERT INTO `activity` (`id`, `borrower_id`, `item_id`, `date_lent`, `due_date`, `is_returned`) VALUES (3, 2,  1, NULL, NULL, DEFAULT);
INSERT INTO `activity` (`id`, `borrower_id`, `item_id`, `date_lent`, `due_date`, `is_returned`) VALUES (4, 2,  2, NULL, NULL, DEFAULT);
INSERT INTO `activity` (`id`, `borrower_id`, `item_id`, `date_lent`, `due_date`, `is_returned`) VALUES (5, 3,  11, NULL, NULL, DEFAULT);
INSERT INTO `activity` (`id`, `borrower_id`, `item_id`, `date_lent`, `due_date`, `is_returned`) VALUES (6, 3,  13, NULL, NULL, DEFAULT);
INSERT INTO `activity` (`id`, `borrower_id`, `item_id`, `date_lent`, `due_date`, `is_returned`) VALUES (7, 4,  15, NULL, NULL, DEFAULT);
INSERT INTO `activity` (`id`, `borrower_id`, `item_id`, `date_lent`, `due_date`, `is_returned`) VALUES (8, 4,  14, NULL, NULL, DEFAULT);
INSERT INTO `activity` (`id`, `borrower_id`, `item_id`, `date_lent`, `due_date`, `is_returned`) VALUES (9, 5,  7, NULL, NULL, DEFAULT);
INSERT INTO `activity` (`id`, `borrower_id`, `item_id`, `date_lent`, `due_date`, `is_returned`) VALUES (10, 5,  5, NULL, NULL, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `login`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `login` (`user_email`, `pwd`) VALUES ('vivian.caethe@gmail.com', ' vivian');
INSERT INTO `login` (`user_email`, `pwd`) VALUES ('greg.norwood@gmail.com', ' greg');
INSERT INTO `login` (`user_email`, `pwd`) VALUES ('jason.caldwell@gmail.com', ' jason');
INSERT INTO `login` (`user_email`, `pwd`) VALUES ('chris.gehrke@gmail.com', ' chris');
INSERT INTO `login` (`user_email`, `pwd`) VALUES ('alexis.low@gmail.com', ' alexis');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
