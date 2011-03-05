SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `tipulito_online` ;
CREATE SCHEMA IF NOT EXISTS `tipulito_online` DEFAULT CHARACTER SET utf8 ;
USE `tipulito_online` ;

-- -----------------------------------------------------
-- Table `tipulito_online`.`user__status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`user__status` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`user__status` (
  `us_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `us_type` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`us_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tipulito_online`.`system__sex`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`system__sex` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`system__sex` (
  `ss_id` INT NOT NULL AUTO_INCREMENT ,
  `ss_sex` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`ss_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tipulito_online`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`users` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`users` (
  `u_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `u_name` VARCHAR(100) NOT NULL ,
  `u_family_name` VARCHAR(100) NOT NULL ,
  `u_status_id` TINYINT(3) NOT NULL ,
  `u_registraion_date` DATE NOT NULL ,
  `u_address` VARCHAR(255) NULL DEFAULT NULL ,
  `u_state_id` SMALLINT(5) NULL DEFAULT NULL ,
  `u_zip` VARCHAR(10) NULL DEFAULT NULL ,
  `u_country_id` TINYINT(3) NOT NULL ,
  `u_password` VARCHAR(255) NOT NULL ,
  `u_email` VARCHAR(255) NOT NULL ,
  `u_sex_id` TINYINT(1) NULL ,
  `u_date_of_birth` DATE NULL DEFAULT NULL ,
  `u_external_emails` ENUM('Yes','No') NULL DEFAULT 'No' ,
  `u_visits_amount` INT(11) NULL DEFAULT NULL ,
  `u_picture` VARCHAR(255) NULL ,
  `u_registration_stamp` INT NOT NULL ,
  PRIMARY KEY (`u_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tipulito_online`.`system__log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`system__log` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`system__log` (
  `sl_id` VARCHAR(200) NOT NULL ,
  `sl_ip` INT(11) NOT NULL ,
  `sl_user_id` INT(11) NOT NULL ,
  `sl_login_time` INT(11) NOT NULL ,
  `sl_logout_time` INT(11) NULL DEFAULT NULL ,
  `sl_playing_time_1` INT(11) NULL DEFAULT NULL ,
  `sl_playing_time_2` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`sl_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tipulito_online`.`user__health_table`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`user__health_table` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`user__health_table` (
  `uht_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `uht_user_id` INT(11) NOT NULL ,
  `uht_height` DOUBLE NULL DEFAULT NULL ,
  `uht_weight` DOUBLE NULL DEFAULT NULL ,
  `uht_bmi` DOUBLE NULL DEFAULT NULL ,
  `uht_pregnant` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_walk` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_sit` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_hands` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_slipped_disk` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_ankles_and_feet` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_knees` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_thighs_or_pelvis` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_lower_back` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_upper_back` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_neck_and_shoulders` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_head` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_wrists` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_elbows` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_other_pain_body` TEXT NULL DEFAULT NULL ,
  `uht_depression_or_anxiety` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_heart_or_pb` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_injury` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_injury_text` TEXT NULL DEFAULT NULL ,
  `uht_epilepsy` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_cancer` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_diabetes` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_asthma` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_Artritis` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_hernia` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_medication` SET('Yes','No') NULL DEFAULT NULL ,
  `uht_other_conditions` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`uht_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tipulito_online`.`system__language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`system__language` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`system__language` (
  `sl_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_language` VARCHAR(60) NOT NULL ,
  PRIMARY KEY (`sl_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tipulito_online`.`teachers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`teachers` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`teachers` (
  `t_id` INT NOT NULL AUTO_INCREMENT ,
  `t_first_name` VARCHAR(250) NOT NULL ,
  `t_last_name` VARCHAR(250) NOT NULL ,
  `t_email` VARCHAR(255) NOT NULL ,
  `t_pass` VARCHAR(255) NOT NULL ,
  `t_sex_id` TINYINT(1) NULL ,
  `t_language_id` TINYINT(4) NULL ,
  `t_style` TEXT NULL ,
  `t_skype` VARCHAR(200) NULL ,
  `t_facebook` VARCHAR(255) NULL ,
  `t_phone` VARCHAR(20) NULL ,
  `t_url` VARCHAR(255) NULL ,
  `t_picture` VARCHAR(255) NULL ,
  PRIMARY KEY (`t_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



-- -----------------------------------------------------
-- Table `tipulito_online`.`system__email_validation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`system__email_validation` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`system__email_validation` (
  `sev_id` INT NOT NULL AUTO_INCREMENT ,
  `sev_reg_request_time` TIMESTAMP NOT NULL ,
  `sev_user_id` INT NOT NULL ,
  `sev_validation_code` VARCHAR(255) NOT NULL ,
  `sev_pass` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`sev_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tipulito_online`.`video__6d`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`video__6d` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`video__6d` (
  `v6d_id` INT NOT NULL AUTO_INCREMENT ,
  `v6d_code` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`v6d_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tipulito_online`.`video__all_movies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`video__all_movies` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`video__all_movies` (
  `vam_id` INT NOT NULL AUTO_INCREMENT ,
  `vam_video_player1` VARCHAR(100) NULL ,
  `vam_video_player2` TEXT NULL ,
  `vam_teacher_id` INT NOT NULL ,
  `vam_user_id` INT NOT NULL ,
  `vam_timestamp` TIMESTAMP NOT NULL ,
  `vam_is_payed` SET('Yes','No') NULL DEFAULT 'No' ,
  `vam_playing_duration` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`vam_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `tipulito_online`.`system__alerts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`system__alerts` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`system__alerts` (
  `sa_id` INT NOT NULL AUTO_INCREMENT ,
  `sa_alert_type_id` TINYINT(3) NOT NULL ,
  `sa_timestamp` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`sa_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tipulito_online`.`system__alert_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`system__alert_type` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`system__alert_type` (
  `sat_id` INT NOT NULL AUTO_INCREMENT ,
  `sat_type` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`sat_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tipulito_online`.`video__6d_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`video__6d_status` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`video__6d_status` (
  `v6ds_id` INT NOT NULL AUTO_INCREMENT ,
  `v6ds_video_id` TINYINT(3) NOT NULL ,
  `v6ds_user_id` INT NOT NULL ,
  `v6ds_teacher_id` INT NOT NULL ,
  `v6ds_viewed` SET('Yes','No') NULL DEFAULT 'No',
  PRIMARY KEY (`v6ds_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



-- -----------------------------------------------------
-- Table `tipulito_online`.`system__email_templates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`system__email_templates` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`system__email_templates` (
  `set_id` INT NOT NULL AUTO_INCREMENT ,
  `set_subject` VARCHAR(250) NOT NULL ,
  `set_body` TEXT NOT NULL ,
  PRIMARY KEY (`set_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tipulito_online`.`privat_messages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`privat_messages` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`privat_messages` (
  `spm_id` INT NOT NULL AUTO_INCREMENT ,
  `spm_from_user_id` INT NULL ,
  `spm_from_teacher_id` INT NULL ,
  `spm_to_user_id` INT NULL ,
  `spm_to_teacher_id` INT NULL ,
  `spm_subject` VARCHAR(250) NOT NULL DEFAULT 'No subject' ,
  `spm_body` TEXT NOT NULL ,
  `spm_datetime` DATETIME NOT NULL ,
  `spm_is_new` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`spm_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tipulito_online`.`news_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`news_status` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`news_status` (
  `ns_id` INT NOT NULL AUTO_INCREMENT ,
  `ns_status` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`ns_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tipulito_online`.`news`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`news` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`news` (
  `n_id` INT NOT NULL AUTO_INCREMENT ,
  `n_datetime` DATETIME NOT NULL ,
  `n_title` VARCHAR(250) NOT NULL ,
  `n_body` TEXT NOT NULL ,
  `n_status_id` TINYINT NOT NULL ,
  PRIMARY KEY (`n_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tipulito_online`.`feedback`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipulito_online`.`feedback` ;

CREATE  TABLE IF NOT EXISTS `tipulito_online`.`feedback` (
  `f_id` INT NOT NULL AUTO_INCREMENT ,
  `f_user_id` INT NOT NULL ,
  `f_video_id` INT NOT NULL ,
  `f_improvement` SET('Yes','No') NOT NULL ,
  `f_difficulty` SET('Hard','Suitable','Easy') NOT NULL ,
  `f_difficulty_text` TEXT NULL ,
  `f_suggestions` VARCHAR(250) NULL ,
  PRIMARY KEY (`f_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `tipulito_online`.`user__status`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `tipulito_online`;
INSERT INTO `tipulito_online`.`user__status` (`us_id`, `us_type`) VALUES ('1', 'Premium');
INSERT INTO `tipulito_online`.`user__status` (`us_id`, `us_type`) VALUES ('2', 'Subscription');
INSERT INTO `tipulito_online`.`user__status` (`us_id`, `us_type`) VALUES ('3', 'Free');
INSERT INTO `tipulito_online`.`user__status` (`us_id`, `us_type`) VALUES ('4', '6D');
INSERT INTO `tipulito_online`.`user__status` (`us_id`, `us_type`) VALUES ('5', 'Open');
INSERT INTO `tipulito_online`.`user__status` (`us_id`, `us_type`) VALUES ('6', 'Close');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tipulito_online`.`system__sex`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `tipulito_online`;
INSERT INTO `tipulito_online`.`system__sex` (`ss_id`, `ss_sex`) VALUES ('1', 'Male');
INSERT INTO `tipulito_online`.`system__sex` (`ss_id`, `ss_sex`) VALUES ('2', 'Female');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tipulito_online`.`system__language`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `tipulito_online`;
INSERT INTO `tipulito_online`.`system__language` (`sl_id`, `sl_language`) VALUES ('1', 'Hebrew');
INSERT INTO `tipulito_online`.`system__language` (`sl_id`, `sl_language`) VALUES ('2', 'English');
INSERT INTO `tipulito_online`.`system__language` (`sl_id`, `sl_language`) VALUES ('3', 'Arabic');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tipulito_online`.`video__6d`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `tipulito_online`;
INSERT INTO `tipulito_online`.`video__6d` (`v6d_id`, `v6d_code`) VALUES ('1', 'code1');
INSERT INTO `tipulito_online`.`video__6d` (`v6d_id`, `v6d_code`) VALUES ('2', 'code2');
INSERT INTO `tipulito_online`.`video__6d` (`v6d_id`, `v6d_code`) VALUES ('3', 'code3');
INSERT INTO `tipulito_online`.`video__6d` (`v6d_id`, `v6d_code`) VALUES ('4', 'code4');
INSERT INTO `tipulito_online`.`video__6d` (`v6d_id`, `v6d_code`) VALUES ('5', 'code5');
INSERT INTO `tipulito_online`.`video__6d` (`v6d_id`, `v6d_code`) VALUES ('6', 'code6');
INSERT INTO `tipulito_online`.`video__6d` (`v6d_id`, `v6d_code`) VALUES ('7', 'code7');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tipulito_online`.`system__alert_type`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `tipulito_online`;
INSERT INTO `tipulito_online`.`system__alert_type` (`sat_id`, `sat_type`) VALUES ('1', 'New User Registration');
INSERT INTO `tipulito_online`.`system__alert_type` (`sat_id`, `sat_type`) VALUES ('2', 'Update User Information');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tipulito_online`.`news_status`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `tipulito_online`;
INSERT INTO `tipulito_online`.`news_status` (`ns_id`, `ns_status`) VALUES ('1', 'New');
INSERT INTO `tipulito_online`.`news_status` (`ns_id`, `ns_status`) VALUES ('2', 'Visible');
INSERT INTO `tipulito_online`.`news_status` (`ns_id`, `ns_status`) VALUES ('3', 'Hidden');
INSERT INTO `tipulito_online`.`news_status` (`ns_id`, `ns_status`) VALUES ('4', 'Pending');
INSERT INTO `tipulito_online`.`news_status` (`ns_id`, `ns_status`) VALUES ('5', 'Deleted');

COMMIT;
