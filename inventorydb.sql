-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

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
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zip` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `phone` VARCHAR(10) NULL,
  `email` VARCHAR(100) NOT NULL,
  `address_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_address_id_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item` ;

CREATE TABLE IF NOT EXISTS `item` (
  `id` INT UNSIGNED NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` MEDIUMTEXT NULL,
  `owner_id` INT UNSIGNED NOT NULL,
  `is_supply` TINYINT(1) NOT NULL DEFAULT 0,
  `available` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_user_id_idx` (`owner_id` ASC),
  CONSTRAINT `fk_item_user_id`
    FOREIGN KEY (`owner_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity` ;

CREATE TABLE IF NOT EXISTS `activity` (
  `id` INT UNSIGNED NOT NULL,
  `borrower_id` INT UNSIGNED NOT NULL,
  `item_id` INT UNSIGNED NOT NULL,
  `date_lent` DATE NOT NULL,
  `due_date` DATE NOT NULL,
  `returned` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_user_id_idx` (`borrower_id` ASC),
  INDEX `fk_item_id_idx` (`item_id` ASC),
  CONSTRAINT `fk_activity_user_id`
    FOREIGN KEY (`borrower_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_activity_item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


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
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO inventory@localhost;
 DROP USER inventory@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'inventory'@'localhost' IDENTIFIED BY 'inventory';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'inventory'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (1, '1st', 'Primary', 'One', '11111');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (2, '2nd', 'Secondary', 'Two', '22222');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `phone`, `email`, `address_id`) VALUES (1, 'first', 'first', '1111111111', 'first@first.com', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `phone`, `email`, `address_id`) VALUES (2, 'second', 'second', '2222222222', 'second@second.com', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `item`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `available`) VALUES (1, 'first', 'one', 1, 0, 1);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `available`) VALUES (2, 'second', 'two', 1, 0, 1);
INSERT INTO `item` (`id`, `title`, `description`, `owner_id`, `is_supply`, `available`) VALUES (3, 'third', 'three', 2, 0, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `activity` (`id`, `borrower_id`, `item_id`, `date_lent`, `due_date`, `returned`) VALUES (1, 1, 3, '1/1/18', '1/1/18', 1);
INSERT INTO `activity` (`id`, `borrower_id`, `item_id`, `date_lent`, `due_date`, `returned`) VALUES (2, 2, 1, '2/1/18', '2/1/18', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `login`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `login` (`user_email`, `pwd`) VALUES ('first@first.com', '1');
INSERT INTO `login` (`user_email`, `pwd`) VALUES ('second@second.com', '2');

COMMIT;

