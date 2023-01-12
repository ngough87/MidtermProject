-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema biomedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `biomedb` ;

-- -----------------------------------------------------
-- Schema biomedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biomedb` DEFAULT CHARACTER SET utf8 ;
USE `biomedb` ;

-- -----------------------------------------------------
-- Table `profile_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profile_image` ;

CREATE TABLE IF NOT EXISTS `profile_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(2500) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `zone` ;

CREATE TABLE IF NOT EXISTS `zone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `average_low` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `zone_id` INT NOT NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip` VARCHAR(5) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_address_zone1_idx` (`zone_id` ASC),
  CONSTRAINT `fk_address_zone1`
    FOREIGN KEY (`zone_id`)
    REFERENCES `zone` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `hidden` TINYINT NOT NULL DEFAULT 0,
  `profile_image_id` INT NULL,
  `address_id` INT NULL,
  `create_date` DATETIME NULL,
  `about_me` TEXT NULL,
  `salt` VARBINARY(1000) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_profile_image1_idx` (`profile_image_id` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_profile_image1`
    FOREIGN KEY (`profile_image_id`)
    REFERENCES `profile_image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `habitat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `habitat` ;

CREATE TABLE IF NOT EXISTS `habitat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `endangered_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `endangered_status` ;

CREATE TABLE IF NOT EXISTS `endangered_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `plant_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plant_type` ;

CREATE TABLE IF NOT EXISTS `plant_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `season`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `season` ;

CREATE TABLE IF NOT EXISTS `season` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `plant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plant` ;

CREATE TABLE IF NOT EXISTS `plant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `common_name` VARCHAR(100) NOT NULL,
  `scientific_name` VARCHAR(100) NULL,
  `last_updated` DATETIME NULL,
  `environmental_notes` VARCHAR(250) NULL,
  `edible` TINYINT NULL,
  `medicinal_properties` TEXT NULL,
  `image_url` TEXT NULL,
  `habitat_id` INT NOT NULL,
  `endangered_status_id` INT NOT NULL,
  `plant_type_id` INT NOT NULL,
  `season_id` INT NOT NULL,
  `created_by_id` INT NULL,
  `create_date` DATE NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_plant_habitat1_idx` (`habitat_id` ASC),
  INDEX `fk_plant_endangered_status1_idx` (`endangered_status_id` ASC),
  INDEX `fk_plant_plant_type1_idx` (`plant_type_id` ASC),
  INDEX `fk_plant_season1_idx` (`season_id` ASC),
  INDEX `fk_plant_user1_idx` (`created_by_id` ASC),
  CONSTRAINT `fk_plant_habitat1`
    FOREIGN KEY (`habitat_id`)
    REFERENCES `habitat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plant_endangered_status1`
    FOREIGN KEY (`endangered_status_id`)
    REFERENCES `endangered_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plant_plant_type1`
    FOREIGN KEY (`plant_type_id`)
    REFERENCES `plant_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plant_season1`
    FOREIGN KEY (`season_id`)
    REFERENCES `season` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plant_user1`
    FOREIGN KEY (`created_by_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sighting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sighting` ;

CREATE TABLE IF NOT EXISTS `sighting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_posted` DATETIME NOT NULL,
  `description` TEXT NULL,
  `location` VARCHAR(100) NULL,
  `image` TEXT NULL,
  `user_id` INT NULL,
  `plant_id` INT NOT NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  INDEX `fk_sighting_plant1_idx` (`plant_id` ASC),
  INDEX `fk_sighting_user1_idx` (`user_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_sighting_plant1`
    FOREIGN KEY (`plant_id`)
    REFERENCES `plant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sighting_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contents` TEXT NOT NULL,
  `in_reply_to` INT NULL,
  `date_posted` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `sighting_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_user_idx` (`user_id` ASC),
  INDEX `fk_comments_comments1_idx` (`in_reply_to` ASC),
  INDEX `fk_comment_sighting1_idx` (`sighting_id` ASC),
  CONSTRAINT `fk_comments_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_comments1`
    FOREIGN KEY (`in_reply_to`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_sighting1`
    FOREIGN KEY (`sighting_id`)
    REFERENCES `sighting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `followed_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `followed_user` ;

CREATE TABLE IF NOT EXISTS `followed_user` (
  `user_id` INT NOT NULL,
  `followed_user_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `followed_user_id`),
  INDEX `fk_user_has_user_user2_idx` (`followed_user_id` ASC),
  INDEX `fk_user_has_user_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_user_user2`
    FOREIGN KEY (`followed_user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sighting_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sighting_rating` ;

CREATE TABLE IF NOT EXISTS `sighting_rating` (
  `value` INT NOT NULL,
  `user_id` INT NOT NULL,
  `sighting_id` INT NOT NULL,
  `rating_reason` VARCHAR(45) NULL,
  INDEX `fk_rating_user1_idx` (`user_id` ASC),
  INDEX `fk_sighting_rating_sighting1_idx` (`sighting_id` ASC),
  PRIMARY KEY (`user_id`, `sighting_id`),
  CONSTRAINT `fk_rating_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sighting_rating_sighting1`
    FOREIGN KEY (`sighting_id`)
    REFERENCES `sighting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `plant_has_zone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plant_has_zone` ;

CREATE TABLE IF NOT EXISTS `plant_has_zone` (
  `plant_id` INT NOT NULL,
  `zone_id` INT NOT NULL,
  PRIMARY KEY (`plant_id`, `zone_id`),
  INDEX `fk_plant_has_zone_zone1_idx` (`zone_id` ASC),
  INDEX `fk_plant_has_zone_plant1_idx` (`plant_id` ASC),
  CONSTRAINT `fk_plant_has_zone_plant1`
    FOREIGN KEY (`plant_id`)
    REFERENCES `plant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plant_has_zone_zone1`
    FOREIGN KEY (`zone_id`)
    REFERENCES `zone` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_plant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_plant` ;

CREATE TABLE IF NOT EXISTS `user_has_plant` (
  `user_id` INT NOT NULL,
  `plant_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `plant_id`),
  INDEX `fk_user_has_plant_plant1_idx` (`plant_id` ASC),
  INDEX `fk_user_has_plant_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_plant_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_plant_plant1`
    FOREIGN KEY (`plant_id`)
    REFERENCES `plant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment_rating` ;

CREATE TABLE IF NOT EXISTS `comment_rating` (
  `value` INT NOT NULL,
  `user_id` INT NOT NULL,
  `rating_reason` VARCHAR(45) NULL,
  `comment_id` INT NOT NULL,
  INDEX `fk_rating_user1_idx` (`user_id` ASC),
  PRIMARY KEY (`user_id`, `comment_id`),
  INDEX `fk_comment_rating_comment1_idx` (`comment_id` ASC),
  CONSTRAINT `fk_rating_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_rating_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sighting_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sighting_image` ;

CREATE TABLE IF NOT EXISTS `sighting_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sighting_id` INT NOT NULL,
  `image_url` VARCHAR(2500) NULL,
  INDEX `fk_sighting_image_sighting1_idx` (`sighting_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_sighting_image_sighting1`
    FOREIGN KEY (`sighting_id`)
    REFERENCES `sighting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sun_exposure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sun_exposure` ;

CREATE TABLE IF NOT EXISTS `sun_exposure` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `plant_has_sun_exposure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plant_has_sun_exposure` ;

CREATE TABLE IF NOT EXISTS `plant_has_sun_exposure` (
  `plant_id` INT NOT NULL,
  `sun_exposure_id` INT NOT NULL,
  PRIMARY KEY (`plant_id`, `sun_exposure_id`),
  INDEX `fk_plant_has_sun_exposure_sun_exposure1_idx` (`sun_exposure_id` ASC),
  INDEX `fk_plant_has_sun_exposure_plant1_idx` (`plant_id` ASC),
  CONSTRAINT `fk_plant_has_sun_exposure_plant1`
    FOREIGN KEY (`plant_id`)
    REFERENCES `plant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plant_has_sun_exposure_sun_exposure1`
    FOREIGN KEY (`sun_exposure_id`)
    REFERENCES `sun_exposure` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS biome@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'biome'@'localhost' IDENTIFIED BY 'biome';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'biome'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `profile_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `profile_image` (`id`, `image_url`) VALUES (1, 'https://static.vecteezy.com/system/resources/previews/003/426/274/non_2x/happy-baby-leaf-cartoon-character-free-vector.jpg');
INSERT INTO `profile_image` (`id`, `image_url`) VALUES (2, 'https://media.istockphoto.com/id/1298338829/vector/print.jpg?s=612x612&w=0&k=20&c=5md-EbBeSPaEPC2w2CT8GLMqy8FHrgSdCUnkRMVP0Zc=');
INSERT INTO `profile_image` (`id`, `image_url`) VALUES (3, 'https://cdn.dribbble.com/users/1810157/screenshots/14012338/media/a3f8eb7682029ff464542d79fe126717.png?compress=1&resize=800x600&vertical=top');
INSERT INTO `profile_image` (`id`, `image_url`) VALUES (4, 'https://cdn0.iconfinder.com/data/icons/good-morning-1/128/flower_plant_nature_happy_cute_eco-1024.png');

COMMIT;


-- -----------------------------------------------------
-- Data for table `zone`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `zone` (`id`, `average_low`) VALUES (1, '-50');
INSERT INTO `zone` (`id`, `average_low`) VALUES (2, '-40 to -50');
INSERT INTO `zone` (`id`, `average_low`) VALUES (3, '-30 to -40');
INSERT INTO `zone` (`id`, `average_low`) VALUES (4, '-20 to -30');
INSERT INTO `zone` (`id`, `average_low`) VALUES (5, '-10 to -20');
INSERT INTO `zone` (`id`, `average_low`) VALUES (6, '0 to -10');
INSERT INTO `zone` (`id`, `average_low`) VALUES (7, '0 to 10');
INSERT INTO `zone` (`id`, `average_low`) VALUES (8, '10 to 20');
INSERT INTO `zone` (`id`, `average_low`) VALUES (9, '20 to 30');
INSERT INTO `zone` (`id`, `average_low`) VALUES (10, '30 to 40');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `address` (`id`, `zone_id`, `street`, `city`, `state`, `zip`) VALUES (1, 2, '888 This is test data St', 'Nowheresville', 'Kansas', '11111');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `hidden`, `profile_image_id`, `address_id`, `create_date`, `about_me`, `salt`) VALUES (1, 'admin', 'admin', 1, 'ADMIN', NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `habitat`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `habitat` (`id`, `name`, `description`) VALUES (1, 'Woodland', NULL);
INSERT INTO `habitat` (`id`, `name`, `description`) VALUES (2, 'Prairie', NULL);
INSERT INTO `habitat` (`id`, `name`, `description`) VALUES (3, 'Wetland', NULL);
INSERT INTO `habitat` (`id`, `name`, `description`) VALUES (4, 'Savannah', NULL);
INSERT INTO `habitat` (`id`, `name`, `description`) VALUES (5, 'High Desert', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `endangered_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `endangered_status` (`id`, `name`, `description`) VALUES (1, 'GX', 'Presumed Extinct');
INSERT INTO `endangered_status` (`id`, `name`, `description`) VALUES (2, 'GH', 'Possible Extinct');
INSERT INTO `endangered_status` (`id`, `name`, `description`) VALUES (3, 'G1', 'Critically Imperiled');
INSERT INTO `endangered_status` (`id`, `name`, `description`) VALUES (4, 'G2', 'Imperiled');
INSERT INTO `endangered_status` (`id`, `name`, `description`) VALUES (5, 'G3', 'Vulnerable');
INSERT INTO `endangered_status` (`id`, `name`, `description`) VALUES (6, 'G4', 'Apparently secure');
INSERT INTO `endangered_status` (`id`, `name`, `description`) VALUES (7, 'G5', 'Secure');
INSERT INTO `endangered_status` (`id`, `name`, `description`) VALUES (8, 'NSR', 'No Status Rank');

COMMIT;


-- -----------------------------------------------------
-- Data for table `plant_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `plant_type` (`id`, `name`, `description`) VALUES (1, 'Herbaceous', NULL);
INSERT INTO `plant_type` (`id`, `name`, `description`) VALUES (2, 'Tree', NULL);
INSERT INTO `plant_type` (`id`, `name`, `description`) VALUES (3, 'Shrub', NULL);
INSERT INTO `plant_type` (`id`, `name`, `description`) VALUES (4, 'Grass', NULL);
INSERT INTO `plant_type` (`id`, `name`, `description`) VALUES (5, 'Rush', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `season`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `season` (`id`, `name`, `description`) VALUES (1, 'Perrenial', NULL);
INSERT INTO `season` (`id`, `name`, `description`) VALUES (2, 'Annual', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `plant`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (1, 'Spreading Dogbane', 'Apocynum androsaemifolium', '2022-12-21', 'Drought Tolerant', 0, '', 'https://cf.ltkcdn.net/garden/images/orig/278667-1600x1066-spreading-dogbane.jpg', 1, 7, 1, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (2, 'Indian Hemp Clasping-leaved Dogbane', 'Apocynum cannabinum', '2022-12-21', 'Drought Tolerant, Attracts Butterflies', 0, '', 'https://www.gardenia.net/storage/app/public/uploads/images/detail/g6nDPmdaQca2XOd30VthlUPr949P3NhNN9yM8hSc.webp', 2, 7, 1, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (3, 'Grayleaf Willow ', 'Artemisia campestris', '2022-12-21', 'Supports native bee populations', 0, '', 'https://www.honey-plants.com/img/picforcontent/salix-glauca_649_large.jpg', 1, 6, 2, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (4, 'Canada Blue Joint', 'Calamagrostis canadensis', '2022-12-21', 'Forage grass for moose, bison, deer, elk and caribou', 0, '', 'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcTg4dUbGirv-ldWUpvXhh9Snlpdsx2VYvjVc3whC25FTCAeriB0kDex8a6zdzGecs_oNPIn3BOvSnk7bBY', 1, 7, 4, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (5, 'Broadleaf Sedge', 'Carex platyphylla', '2022-12-21', 'Attracts Butterflies', 0, '', 'https://plantfinder.nativeplanttrust.org/_ccLib/image/plants/DETA-796.jpg', 1, 7, 4, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (6, 'White Wood Aster', 'Eurybia divaricata', '2022-12-21', 'Masses of small white flowers. Self sows readily, Attracts butterflies', 0, '', 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Eurybia_divaricata--Anita-Gould--CC-BY-NC-2-0.jpg', 1, 7, 1, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (7, 'Biennial Gaura', 'Gaura biennis', '2022-12-21', '', 0, '', 'http://t2.gstatic.com/licensed-image?q=tbn:ANd9GcTkgd0uyLhOBEXMoDq94PKEgTvgsa_ydTg-ayu8Joz8Z9kwygTuzR7QRzroctDJBPRy3X6oVodKzP0YZPg', 4, 7, 1, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (8, 'St Johns Wort', '\nHypericum prolificum', '2022-12-21', 'Good for difficult situations, Penetrates clay. Drought tolerant.', 0, '', 'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQYE1mIgJbLvrbK5b45l77qtCfaYo-2OS4gLihpHN8EwKhWZvb-WiIXcG0rxYIaViyLMhDUJwQkq1X_VuU', 1, 5, 3, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (9, 'Tamarack', 'Larix laricina', '2022-12-21', 'Deciduous conifer. Needles yellow in fall; very cold tolerant.', 0, '', 'https://www.estabrooksonline.com/images/products/larix_laricina.jpg', 3, 7, 2, 2, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (10, 'Spicebush', 'Lindera benzoin', '2022-12-21', 'Butterfly larval food plant. Deep yellow fall color with shiny red fruit. Fragrant leaves.', 0, '', 'https://www.gardenia.net/storage/app/public/uploads/images/detail/4fwCSSQaV1hJ8prMZc2eXB5RQVTTg8MBzUAo3mvc.webp', 3, 7, 3, 2, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (11, 'Horsemint', 'Monarda punctata', '2022-12-21', 'Needs good air circulation - great for borders. Benefit Bee populations ', 1, 'Ease Backache, Used for fever reduction', 'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcSJmUpnpOxT2UmscnsRWcIdQEoEuL8H4Uaei2-3Rkg_uBpHhmKvkE6JeozSn94s0w16jUAZeamtVpVs-TA', 2, 7, 1, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (12, 'Switchgrass', 'Panicum virgatum', '2022-12-21', 'Lower Great Lakes shorelines. Wildlife food, habitat. Has purple stigmas', 0, '', 'https://www.laurensgardenservice.com/wp-content/uploads/2016/05/Panicum-virgatum-Shenandoah.jpg', 2, 7, 4, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (13, 'Blue phlox', 'Phlox divaricata', '2022-12-21', 'Host for swallowtail, grey hairstreak, w pygmy blue butterfly larvae', 0, '', 'http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQENOaQzVfsFF2ddMrr9ues9OIQaswuAFDK7ZurYHWdBVEC-FsAnmxjb9B_McEEnw0KTsV4L9H23bGPCZ4', 1, 7, 1, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (14, 'Hop Tree', 'Ptelea trifoliata', '2022-12-21', 'Tolerates walnut. Host plant for the Giant Swallowtail', 0, '', 'https://landscapeplants.oregonstate.edu/sites/plantid7/files/plantimage/pttr3853B.jpg', 1, 7, 2, 2, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (15, 'Big Bluestem', 'Ratibida pinnata', '2022-12-21', 'Showy tallgrass prairies plant.', 0, '', 'https://cdn.shopify.com/s/files/1/0005/0315/2697/products/shutterstock_1038359257_compact.jpg?v=1632233622', 2, 3, 1, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (16, 'Bloodroot', 'Sanguinaria canadensis', '2022-12-21', 'Walnut tolerant, harbinger of spring', 0, '', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Sanguinaria_canadensis_Arkansas.jpg/440px-Sanguinaria_canadensis_Arkansas.jpg', 1, 4, 1, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (17, 'Little Bluestem', 'Schizachyrium scoparium', '2022-12-21', 'Attracts birds. Larval plant for skippers. Dry prairie, savannah, dunes.', 0, '', 'https://www.wilsonbrosgardens.com/assets/images/schizachyrium-scoparium-standing-ovation-little-bluestem-grass-13.jpg', 2, 7, 4, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (18, 'Jack in the Pulpit', '\nArisaema triphyllum', '2022-12-21', 'Moist woods. Distinctive flower. Clusters of red berries in late summer.', 0, '', 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Arisaema_triphyllum-Flower-Fritz_Flohr_Reynolds-CC_BY-SA_2.0.jpeg', 1, 7, 1, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (19, 'Hairy Mountain Mint', 'Pycnanthemum verticillatum', '2022-12-21', 'Fragrant foliage. good nectar plant', 1, '', 'http://www.floralencounters.com/blog/wp-content/uploads/mountain_mint_flowers_close-2.jpg', 2, 7, 1, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (20, 'Virginia Meadow Beauty', 'Rhexia virginica', '2022-12-21', 'Prefers sandy, acidic soil', 0, '', 'https://www.gardenia.net/storage/app/public/uploads/images/detail/Mirv8ta8B0Kp3DwIEIBvPRA9qM8IMmAuI7BRbfkb.webp', 3, 7, 1, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (21, 'Wild Red Raspberry', 'Rubus strigosus', '2022-12-21', 'Edible fruit, June-Oct, very important to a wide variety of wildlife; penetrates clay; tolerates walnut', 1, '', 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Rubus_idaeus-bush--L_nd9n0FV0KGiy.jpg', 3, 8, 3, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (22, 'Wool-grass Bulrush', 'Scirpus cyperinus', '2022-12-21', 'Good for erosion control, provides nesting area and cover for waterfow', 0, '', 'https://hoffmannursery.com/assets/files/images/Scirpus_cyperinus_01.jpg', 2, 7, 4, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (23, 'Ramshaw Meadows Abronia', 'Abronia alpina', '2022-12-21', '', 0, '', 'https://upload.wikimedia.org/wikipedia/commons/b/be/Abronia_alpina_%28Ramshaw_Meadows_sand-verbena%29.jpg', 2, 4, 1, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (24, 'San Mateo Thornmint', 'Acanthomintha duttonii', '2022-12-21', '', 0, '', 'https://calscape.com/species_images/calphotos/images500/0000_0000_1109_2161.jpeg', 5, 3, 1, 2, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (25, 'Three-bract Onion', 'Allium tribracteatum', '2022-12-21', '', 0, '', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Table_Rock_Allium_Parvum.jpg/1200px-Table_Rock_Allium_Parvum.jpg', 5, 4, 1, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (26, 'Father Crowley\'s Lupine', 'Lupinus padre-crowleyi', '2022-12-21', 'endemic to California', 0, '', 'https://calscape.com/species_images/calphotos/images500/0000_0000_0810_2460.jpeg', 1, 4, 1, 1, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (27, 'Gumbo Limbo', 'Bursera simaruba', '2022-12-21', 'Provides shelter for many pollinators, moderate food produced for animals as well', 0, '', 'https://i.etsystatic.com/14792178/r/il/c19476/1581780663/il_1588xN.1581780663_t31w.jpg', 1, 3, 2, 2, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (28, 'Widows cross', 'Sedum pulchellum', '2022-12-21', 'Deer and rabbit resistnt, useful as groundcover', 0, '', 'https://www.gardenia.net/storage/app/public/uploads/images/detail/6ZYzmTWNMQ0hz9SIOZja0OC5ierKudRfeQDsaP8B.webp', 1, 3, 3, 2, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (29, 'Hog Plum', 'Pinus oalustris', '2022-12-21', 'Food and shelter for endangered red-cockaded woodpecker', 0, '', 'https://treesandshrubsonline.org/site/assets/files/6714/pinus-palustris-1.jpg', 1, 3, 2, 2, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (30, 'Scrub Oak', 'Quercus berberidifolia', '2022-12-21', 'Used for bank stabilization, bird gardens', 0, '', 'https://images.squarespace-cdn.com/content/v1/585dc42c725e25ca57806ffc/1605058521531-W9ERJH7HDJJ1XOT6REYO/P9260170.JPG?format=1000w', 2, 5, 3, 2, 1, '2022-12-22', '');
INSERT INTO `plant` (`id`, `common_name`, `scientific_name`, `last_updated`, `environmental_notes`, `edible`, `medicinal_properties`, `image_url`, `habitat_id`, `endangered_status_id`, `plant_type_id`, `season_id`, `created_by_id`, `create_date`, `description`) VALUES (31, 'Beacked Panicgrass', 'Lythrum alatum', '2022-12-21', 'Wildlife graze on its long stems', 0, '', 'https://bugwoodcloud.org/images/3072x2048/1120352.jpg', 1, 2, 4, 2, 1, '2022-12-22', '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sighting`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `sighting` (`id`, `date_posted`, `description`, `location`, `image`, `user_id`, `plant_id`, `latitude`, `longitude`) VALUES (1, '2022-12-22 00:00:00', 'This sure is a plant', 'Somewhere', NULL, 1, 1, 28, 19);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `comment` (`id`, `contents`, `in_reply_to`, `date_posted`, `user_id`, `sighting_id`) VALUES (1, 'Wow, what an amazing post!', NULL, '2022-12-22 00:00:00', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sighting_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `sighting_rating` (`value`, `user_id`, `sighting_id`, `rating_reason`) VALUES (1, 1, 1, 'It\'s my post I can do what I want');

COMMIT;


-- -----------------------------------------------------
-- Data for table `plant_has_zone`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (1, 3);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (1, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (1, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (1, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (1, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (1, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (1, 9);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (2, 1);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (2, 2);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (2, 3);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (2, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (2, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (2, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (2, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (2, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (2, 9);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (2, 10);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (3, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (3, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (3, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (3, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (4, 2);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (4, 3);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (4, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (4, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (4, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (5, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (5, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (5, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (5, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (5, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (6, 3);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (6, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (6, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (6, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (6, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (6, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (7, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (7, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (7, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (8, 3);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (8, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (8, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (8, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (8, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (8, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (9, 2);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (9, 3);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (9, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (9, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (10, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (10, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (10, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (10, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (10, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (10, 9);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (11, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (11, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (11, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (11, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (11, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (11, 9);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (12, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (12, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (12, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (12, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (12, 9);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (13, 3);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (13, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (13, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (13, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (13, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (13, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (14, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (14, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (14, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (14, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (14, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (14, 9);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (15, 3);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (15, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (15, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (15, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (15, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (16, 3);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (16, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (16, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (16, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (16, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (16, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (17, 3);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (17, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (17, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (17, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (17, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (17, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (17, 9);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (17, 10);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (18, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (18, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (18, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (18, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (18, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (18, 9);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (19, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (19, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (19, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (19, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (19, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (20, 3);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (20, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (20, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (20, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (20, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (21, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (21, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (21, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (21, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (22, 4);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (22, 5);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (22, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (22, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (22, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (23, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (23, 9);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (24, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (24, 9);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (25, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (25, 9);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (26, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (26, 9);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (27, 10);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (28, 6);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (28, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (28, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (28, 9);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (29, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (29, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (29, 9);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (29, 10);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (30, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (30, 9);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (31, 7);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (31, 8);
INSERT INTO `plant_has_zone` (`plant_id`, `zone_id`) VALUES (31, 9);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `comment_rating` (`value`, `user_id`, `rating_reason`, `comment_id`) VALUES (1, 1, 'Test data', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sun_exposure`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `sun_exposure` (`id`, `name`, `description`) VALUES (1, 'Full Sun', NULL);
INSERT INTO `sun_exposure` (`id`, `name`, `description`) VALUES (2, 'Partial Sun', NULL);
INSERT INTO `sun_exposure` (`id`, `name`, `description`) VALUES (3, 'Partial Shade', NULL);
INSERT INTO `sun_exposure` (`id`, `name`, `description`) VALUES (4, 'Shade', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `plant_has_sun_exposure`
-- -----------------------------------------------------
START TRANSACTION;
USE `biomedb`;
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (1, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (1, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (1, 3);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (2, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (2, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (3, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (3, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (3, 3);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (4, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (4, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (5, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (5, 3);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (6, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (6, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (7, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (8, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (9, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (9, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (9, 3);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (10, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (10, 4);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (11, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (11, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (12, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (13, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (13, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (14, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (14, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (14, 4);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (15, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (16, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (16, 4);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (17, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (17, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (18, 4);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (19, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (19, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (20, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (20, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (21, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (21, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (21, 4);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (22, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (22, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (23, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (24, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (24, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (25, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (25, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (26, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (27, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (27, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (28, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (28, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (29, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (29, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (30, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (30, 2);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (31, 1);
INSERT INTO `plant_has_sun_exposure` (`plant_id`, `sun_exposure_id`) VALUES (31, 2);

COMMIT;

