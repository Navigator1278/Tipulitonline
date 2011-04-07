-- phpMyAdmin SQL Dump
-- version 3.1.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Мар 26 2011 г., 16:25
-- Версия сервера: 5.1.30
-- Версия PHP: 5.2.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `tipulitonline`
--

-- --------------------------------------------------------

--
-- Структура таблицы `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_user_id` int(11) NOT NULL,
  `f_video_id` int(11) NOT NULL,
  `f_improvement` set('Yes','No') NOT NULL,
  `f_difficulty` set('Hard','Suitable','Easy') NOT NULL,
  `f_difficulty_text` text,
  `f_suggestions` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `feedback`
--


-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `n_datetime` datetime NOT NULL,
  `n_title` varchar(250) NOT NULL,
  `n_body` text NOT NULL,
  `n_status_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `news`
--


-- --------------------------------------------------------

--
-- Структура таблицы `news_status`
--

CREATE TABLE IF NOT EXISTS `news_status` (
  `ns_id` int(11) NOT NULL AUTO_INCREMENT,
  `ns_status` varchar(45) NOT NULL,
  PRIMARY KEY (`ns_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `news_status`
--

INSERT INTO `news_status` (`ns_id`, `ns_status`) VALUES
(1, 'New'),
(2, 'Visible'),
(3, 'Hidden'),
(4, 'Pending'),
(5, 'Deleted');

-- --------------------------------------------------------

--
-- Структура таблицы `privat_messages`
--

CREATE TABLE IF NOT EXISTS `privat_messages` (
  `spm_id` int(11) NOT NULL AUTO_INCREMENT,
  `spm_from_user_id` int(11) DEFAULT NULL,
  `spm_from_teacher_id` int(11) DEFAULT NULL,
  `spm_to_user_id` int(11) DEFAULT NULL,
  `spm_to_teacher_id` int(11) DEFAULT NULL,
  `spm_subject` varchar(250) NOT NULL DEFAULT 'No subject',
  `spm_body` text NOT NULL,
  `spm_datetime` datetime NOT NULL,
  `spm_is_new` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`spm_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=101 ;

--
-- Дамп данных таблицы `privat_messages`
--

INSERT INTO `privat_messages` (`spm_id`, `spm_from_user_id`, `spm_from_teacher_id`, `spm_to_user_id`, `spm_to_teacher_id`, `spm_subject`, `spm_body`, `spm_datetime`, `spm_is_new`) VALUES
(77, NULL, 1, 92, NULL, 'werwer', 'werwer<br>', '2011-03-19 17:04:12', 0),
(78, NULL, 1, 92, NULL, 'hh', 'jj', '2011-03-19 17:43:12', 0),
(79, NULL, 1, 92, NULL, 'dfgdfg', 'ererg', '2011-03-19 17:44:13', 0),
(80, NULL, 1, 92, NULL, 'fgdfg', '<br>', '2011-03-19 17:47:07', 0),
(81, NULL, 1, 92, NULL, 'asdas', 'sdfsdf<br>', '2011-03-19 18:22:02', 0),
(82, NULL, 1, 92, NULL, '444', '555<br>', '2011-03-19 18:22:09', 0),
(83, NULL, 1, 92, NULL, 'dgdf', 'sdfsdfsdfsd<br>', '2011-03-19 18:22:17', 0),
(84, NULL, 1, 92, NULL, 'sdsd', 'dfdf<br>', '2011-03-22 15:47:16', 0),
(85, NULL, 1, 92, NULL, 'asas', 'sdsd<br>', '2011-03-22 15:50:26', 0),
(86, NULL, 1, 92, NULL, 'as', 'sdsd<br>', '2011-03-22 15:50:51', 0),
(87, NULL, 1, 92, NULL, 'asas', 'ssdds<br>', '2011-03-22 15:51:24', 0),
(88, NULL, 1, 92, NULL, 'sdf', 'sdfs<br>', '2011-03-22 15:55:35', 0),
(89, NULL, 1, 92, NULL, 'sdf', 'sdfs<br>', '2011-03-22 15:58:59', 0),
(90, NULL, 1, 92, NULL, 'bbbb', 'ddd<br>', '2011-03-22 15:59:09', 0),
(91, NULL, 1, 92, NULL, 'Youve got the new 6d-video at tipulitonline<br/>', 'Youve got the new 6d-video at tipulitonline<br/>Now you can watch the video Nr. <br/>', '2011-03-26 12:14:37', 0),
(92, NULL, 1, 92, NULL, 'Youve got the new 6d-video at tipulitonline<br/>', 'Youve got the new 6d-video at tipulitonline<br/>Now you can watch the video Nr. 2<br/>', '2011-03-26 12:15:22', 0),
(93, NULL, 1, 49, NULL, 'Youve got the new 6d-video at tipulitonline<br/>', '', '2011-03-26 12:43:55', 0),
(94, NULL, 1, 92, NULL, 'Youve got the new 6d-video at tipulitonline<br/>', 'Youve got the new 6d-video at tipulitonline<br/>Now you can watch the video Nr. 2<br/>', '2011-03-26 12:43:55', 0),
(95, NULL, 1, 92, NULL, 'Youve got the new 6d-video at tipulitonline<br/>', 'Youve got the new 6d-video at tipulitonline<br/>Now you can watch the video Nr. 2<br/>', '2011-03-26 12:44:20', 0),
(96, NULL, 1, 92, NULL, 'Youve got the new 6d-video at tipulitonline<br/>', 'Youve got the new 6d-video at tipulitonline<br/>Now you can watch the video Nr. 2<br/>', '2011-03-26 12:44:55', 0),
(97, NULL, 1, 92, NULL, 'Youve got the new 6d-video at tipulitonline<br/>', 'Youve got the new 6d-video at tipulitonline<br/>Now you can watch the video Nr. 2<br/>', '2011-03-26 12:45:37', 0),
(98, NULL, 1, 92, NULL, 'Youve got the new 6d-video at tipulitonline<br/>', 'Youve got the new 6d-video at tipulitonline<br/>Now you can watch the video Nr. 1<br/>', '2011-03-26 12:59:51', 0),
(99, NULL, 1, 92, NULL, 'Youve got the new 6d-video at tipulitonline<br/>', 'Youve got the new 6d-video at tipulitonline<br/>Now you can watch the video Nr. 1<br/>', '2011-03-26 14:02:27', 0),
(100, NULL, 1, 92, NULL, 'Youve got the new 6d-video at tipulitonline<br/>', 'Youve got the new 6d-video at tipulitonline<br/>Now you can watch the video Nr. 2<br/>', '2011-03-26 14:02:27', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `system__alerts`
--

CREATE TABLE IF NOT EXISTS `system__alerts` (
  `sa_id` int(11) NOT NULL AUTO_INCREMENT,
  `sa_student_id` int(11) DEFAULT NULL,
  `sa_teacher_id` int(11) DEFAULT NULL,
  `sa_alert_type_id` tinyint(3) NOT NULL,
  `sa_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sa_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `system__alerts`
--

INSERT INTO `system__alerts` (`sa_id`, `sa_student_id`, `sa_teacher_id`, `sa_alert_type_id`, `sa_timestamp`) VALUES
(8, 92, NULL, 3, '2011-03-25 18:10:03');

-- --------------------------------------------------------

--
-- Структура таблицы `system__alert_type`
--

CREATE TABLE IF NOT EXISTS `system__alert_type` (
  `sat_id` int(11) NOT NULL AUTO_INCREMENT,
  `sat_type` varchar(100) NOT NULL,
  PRIMARY KEY (`sat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `system__alert_type`
--

INSERT INTO `system__alert_type` (`sat_id`, `sat_type`) VALUES
(1, 'New User Registration'),
(2, 'Update User Information'),
(3, '6D Course Request');

-- --------------------------------------------------------

--
-- Структура таблицы `system__email_templates`
--

CREATE TABLE IF NOT EXISTS `system__email_templates` (
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  `set_subject` varchar(250) NOT NULL,
  `set_body` text NOT NULL,
  PRIMARY KEY (`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `system__email_templates`
--


-- --------------------------------------------------------

--
-- Структура таблицы `system__email_validation`
--

CREATE TABLE IF NOT EXISTS `system__email_validation` (
  `sev_id` int(11) NOT NULL AUTO_INCREMENT,
  `sev_reg_request_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sev_user_id` int(11) NOT NULL,
  `sev_validation_code` varchar(255) NOT NULL,
  `sev_pass` varchar(45) NOT NULL,
  PRIMARY KEY (`sev_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- Дамп данных таблицы `system__email_validation`
--

INSERT INTO `system__email_validation` (`sev_id`, `sev_reg_request_time`, `sev_user_id`, `sev_validation_code`, `sev_pass`) VALUES
(75, '2011-03-16 19:05:51', 92, '7aeb0f20503c5c0948792192e4e7f6d2', 'qwqw'),
(76, '2011-03-17 07:46:28', 93, '2c092688f1170547bd330529daf174cb', 'qwqw'),
(77, '2011-03-17 08:21:21', 94, '32ed51713c398b7760e02e77d55714da', 'qwqw'),
(78, '2011-03-22 15:28:24', 95, 'a53dd2e8058b02a6dbfbf836ee980655', 'qwqw');

-- --------------------------------------------------------

--
-- Структура таблицы `system__language`
--

CREATE TABLE IF NOT EXISTS `system__language` (
  `sl_id` int(11) NOT NULL AUTO_INCREMENT,
  `sl_language` varchar(60) NOT NULL,
  PRIMARY KEY (`sl_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `system__language`
--

INSERT INTO `system__language` (`sl_id`, `sl_language`) VALUES
(1, 'Hebrew'),
(2, 'English'),
(3, 'Arabic');

-- --------------------------------------------------------

--
-- Структура таблицы `system__log`
--

CREATE TABLE IF NOT EXISTS `system__log` (
  `sl_id` varchar(200) NOT NULL,
  `sl_ip` int(11) NOT NULL,
  `sl_user_id` int(11) NOT NULL,
  `sl_login_time` int(11) NOT NULL,
  `sl_logout_time` int(11) DEFAULT NULL,
  `sl_playing_time_1` int(11) DEFAULT NULL,
  `sl_playing_time_2` int(11) DEFAULT NULL,
  PRIMARY KEY (`sl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `system__log`
--


-- --------------------------------------------------------

--
-- Структура таблицы `system__sex`
--

CREATE TABLE IF NOT EXISTS `system__sex` (
  `ss_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_sex` varchar(10) NOT NULL,
  PRIMARY KEY (`ss_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `system__sex`
--

INSERT INTO `system__sex` (`ss_id`, `ss_sex`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Структура таблицы `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_first_name` varchar(250) NOT NULL,
  `t_last_name` varchar(250) NOT NULL,
  `t_email` varchar(255) NOT NULL,
  `t_pass` varchar(255) NOT NULL,
  `t_sex_id` tinyint(1) DEFAULT NULL,
  `t_language_id` tinyint(4) DEFAULT NULL,
  `t_style` text,
  `t_skype` varchar(200) DEFAULT NULL,
  `t_facebook` varchar(255) DEFAULT NULL,
  `t_phone` varchar(20) DEFAULT NULL,
  `t_url` varchar(255) DEFAULT NULL,
  `t_picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `teachers`
--

INSERT INTO `teachers` (`t_id`, `t_first_name`, `t_last_name`, `t_email`, `t_pass`, `t_sex_id`, `t_language_id`, `t_style`, `t_skype`, `t_facebook`, `t_phone`, `t_url`, `t_picture`) VALUES
(1, 'Dima', 'Kolbin', 'navigator1278@gmail.com', 'qwqw', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(100) NOT NULL,
  `u_family_name` varchar(100) NOT NULL,
  `u_status_id` tinyint(3) NOT NULL,
  `u_registraion_date` date NOT NULL,
  `u_address` varchar(255) DEFAULT NULL,
  `u_state_id` smallint(5) DEFAULT NULL,
  `u_zip` varchar(10) DEFAULT NULL,
  `u_country_id` tinyint(3) NOT NULL,
  `u_password` varchar(255) NOT NULL,
  `u_email` varchar(255) NOT NULL,
  `u_sex_id` tinyint(1) DEFAULT NULL,
  `u_date_of_birth` date DEFAULT NULL,
  `u_external_emails` enum('Yes','No') DEFAULT 'No',
  `u_visits_amount` int(11) DEFAULT NULL,
  `u_picture` varchar(255) DEFAULT NULL,
  `u_registration_stamp` int(11) NOT NULL,
  `u_objectives` text,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=96 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`u_id`, `u_name`, `u_family_name`, `u_status_id`, `u_registraion_date`, `u_address`, `u_state_id`, `u_zip`, `u_country_id`, `u_password`, `u_email`, `u_sex_id`, `u_date_of_birth`, `u_external_emails`, `u_visits_amount`, `u_picture`, `u_registration_stamp`, `u_objectives`) VALUES
(92, 'Dima', 'Kolbin', 5, '2011-03-16', '', 1, NULL, 1, 'qwqw', 'tenhi@mail.ru', 0, '2011-03-01', NULL, 0, 'ava13002952178662.jpg', 3333, 'qwqw'),
(93, 'dsfsdf', 'sdfsdfsdf', 5, '2011-03-17', '', 1, NULL, 1, 'qwqw', 'test@test.ru', 1, '2011-03-01', NULL, 0, NULL, 3333, ''),
(94, 'dddd', 'fffff', 5, '2011-03-17', '', 1, NULL, 1, 'qwqw', 'sfsdfs@web.de', 0, '2011-03-08', NULL, 0, NULL, 3333, ''),
(95, 'asasas', 'dsdsd', 4, '2011-03-22', '', 1, NULL, 1, 'qwqw', 'asasas@web.de', 0, '2011-03-01', 'Yes', 0, NULL, 3333, '');

-- --------------------------------------------------------

--
-- Структура таблицы `user__health_table`
--

CREATE TABLE IF NOT EXISTS `user__health_table` (
  `uht_id` int(11) NOT NULL AUTO_INCREMENT,
  `uht_user_id` int(11) NOT NULL,
  `uht_height` double DEFAULT NULL,
  `uht_weight` double DEFAULT NULL,
  `uht_bmi` double DEFAULT NULL,
  `uht_pregnant` set('Yes','No') DEFAULT NULL,
  `uht_pregnant_since` tinyint(4) DEFAULT NULL,
  `uht_walk` set('Yes','No') DEFAULT NULL,
  `uht_sit` set('Yes','No') DEFAULT NULL,
  `uht_hands` set('Yes','No') DEFAULT NULL,
  `uht_slipped_disk` set('Yes','No') DEFAULT NULL,
  `uht_backashes` set('Yes','No') DEFAULT NULL,
  `uht_ankles_and_feet` set('Yes','No') DEFAULT NULL,
  `uht_ankles` set('Yes','No') DEFAULT NULL,
  `uht_breath` set('Yes','No') DEFAULT NULL,
  `uht_knees` set('Yes','No') DEFAULT NULL,
  `uht_thighs_or_pelvis` set('Yes','No') DEFAULT NULL,
  `uht_lower_back` set('Yes','No') DEFAULT NULL,
  `uht_upper_back` set('Yes','No') DEFAULT NULL,
  `uht_neck_and_shoulders` set('Yes','No') DEFAULT NULL,
  `uht_head` set('Yes','No') DEFAULT NULL,
  `uht_wrists` set('Yes','No') DEFAULT NULL,
  `uht_elbows` set('Yes','No') DEFAULT NULL,
  `uht_other_pain_body` text,
  `uht_depression_or_anxiety` set('Yes','No') DEFAULT NULL,
  `uht_heart_or_pb` set('Yes','No') DEFAULT NULL,
  `uht_injury` set('Yes','No') DEFAULT NULL,
  `uht_injury_text` text,
  `uht_epilepsy` set('Yes','No') DEFAULT NULL,
  `uht_cancer` set('Yes','No') DEFAULT NULL,
  `uht_diabetes` set('Yes','No') DEFAULT NULL,
  `uht_asthma` set('Yes','No') DEFAULT NULL,
  `uht_Artritis` set('Yes','No') DEFAULT NULL,
  `uht_hernia` set('Yes','No') DEFAULT NULL,
  `uht_medication` set('Yes','No') DEFAULT NULL,
  `uht_which_medication` text,
  `uht_migrene` set('Yes','No') DEFAULT NULL,
  `uht_babies` set('Yes','No') DEFAULT NULL,
  `uht_nosleep` set('Yes','No') DEFAULT NULL,
  `uht_digestion` set('Yes','No') DEFAULT NULL,
  `uht_menopause` set('Yes','No') DEFAULT NULL,
  `uht_sclorosies` set('Yes','No') DEFAULT NULL,
  `uht_headaches` set('Yes','No') DEFAULT NULL,
  `uht_fatigue` set('Yes','No') DEFAULT NULL,
  `uht_general1` varchar(250) DEFAULT NULL,
  `uht_general2` varchar(250) DEFAULT NULL,
  `uht_general3` varchar(250) DEFAULT NULL,
  `uht_more_info` text,
  `uht_other_conditions` text,
  PRIMARY KEY (`uht_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=84 ;

--
-- Дамп данных таблицы `user__health_table`
--

INSERT INTO `user__health_table` (`uht_id`, `uht_user_id`, `uht_height`, `uht_weight`, `uht_bmi`, `uht_pregnant`, `uht_pregnant_since`, `uht_walk`, `uht_sit`, `uht_hands`, `uht_slipped_disk`, `uht_backashes`, `uht_ankles_and_feet`, `uht_ankles`, `uht_breath`, `uht_knees`, `uht_thighs_or_pelvis`, `uht_lower_back`, `uht_upper_back`, `uht_neck_and_shoulders`, `uht_head`, `uht_wrists`, `uht_elbows`, `uht_other_pain_body`, `uht_depression_or_anxiety`, `uht_heart_or_pb`, `uht_injury`, `uht_injury_text`, `uht_epilepsy`, `uht_cancer`, `uht_diabetes`, `uht_asthma`, `uht_Artritis`, `uht_hernia`, `uht_medication`, `uht_which_medication`, `uht_migrene`, `uht_babies`, `uht_nosleep`, `uht_digestion`, `uht_menopause`, `uht_sclorosies`, `uht_headaches`, `uht_fatigue`, `uht_general1`, `uht_general2`, `uht_general3`, `uht_more_info`, `uht_other_conditions`) VALUES
(80, 92, NULL, NULL, NULL, 'No', 1, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', NULL, NULL, 'Yes', 'Yes', 'Yes', 'sss', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', '', 'dd', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'qwqw', 'qwqwqw', 'eeee', 'ff', NULL),
(81, 93, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL),
(82, 94, NULL, NULL, NULL, 'Yes', 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL),
(83, 95, NULL, NULL, NULL, 'Yes', 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user__status`
--

CREATE TABLE IF NOT EXISTS `user__status` (
  `us_id` int(11) NOT NULL AUTO_INCREMENT,
  `us_type` varchar(45) NOT NULL,
  PRIMARY KEY (`us_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `user__status`
--

INSERT INTO `user__status` (`us_id`, `us_type`) VALUES
(1, 'Premium'),
(2, 'Subscription'),
(3, 'Free'),
(4, '6D'),
(5, 'Open'),
(6, 'Close');

-- --------------------------------------------------------

--
-- Структура таблицы `video__6d`
--

CREATE TABLE IF NOT EXISTS `video__6d` (
  `v6d_id` int(11) NOT NULL AUTO_INCREMENT,
  `v6d_code` varchar(100) NOT NULL,
  PRIMARY KEY (`v6d_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `video__6d`
--

INSERT INTO `video__6d` (`v6d_id`, `v6d_code`) VALUES
(1, 'oCQIOYJXYWw'),
(2, 'J6AwEPay8x4'),
(3, 'Ts2DXY0zfLs'),
(4, 'code4'),
(5, 'code5'),
(6, 'code6'),
(7, 'code7');

-- --------------------------------------------------------

--
-- Структура таблицы `video__6d_status`
--

CREATE TABLE IF NOT EXISTS `video__6d_status` (
  `v6ds_id` int(11) NOT NULL AUTO_INCREMENT,
  `v6ds_video_id` tinyint(3) NOT NULL,
  `v6ds_user_id` int(11) NOT NULL,
  `v6ds_teacher_id` int(11) NOT NULL,
  `v6ds_viewed` set('Yes','No') DEFAULT 'No',
  `v6ds_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `v6ds_paused` set('Yes','No') DEFAULT 'No',
  `v6ds_notified` set('Yes','No') DEFAULT 'No',
  PRIMARY KEY (`v6ds_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Дамп данных таблицы `video__6d_status`
--

INSERT INTO `video__6d_status` (`v6ds_id`, `v6ds_video_id`, `v6ds_user_id`, `v6ds_teacher_id`, `v6ds_viewed`, `v6ds_timestamp`, `v6ds_paused`, `v6ds_notified`) VALUES
(24, 1, 92, 1, 'Yes', '2011-03-26 14:02:27', 'No', 'Yes'),
(38, 2, 92, 1, 'Yes', '2011-03-26 14:02:27', 'No', 'Yes');

-- --------------------------------------------------------

--
-- Структура таблицы `video__all_movies`
--

CREATE TABLE IF NOT EXISTS `video__all_movies` (
  `vam_id` int(11) NOT NULL AUTO_INCREMENT,
  `vam_video_player1` varchar(100) DEFAULT NULL,
  `vam_video_player2` text,
  `vam_teacher_id` int(11) NOT NULL,
  `vam_user_id` int(11) NOT NULL,
  `vam_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vam_is_payed` set('Yes','No') DEFAULT 'No',
  `vam_playing_duration` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vam_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Дамп данных таблицы `video__all_movies`
--

INSERT INTO `video__all_movies` (`vam_id`, `vam_video_player1`, `vam_video_player2`, `vam_teacher_id`, `vam_user_id`, `vam_timestamp`, `vam_is_payed`, `vam_playing_duration`) VALUES
(36, NULL, '<iframe title=\\"YouTube video player\\" width=\\"480\\" height=\\"390\\" src=\\"http://www.youtube.com/embed/J6AwEPay8x4\\" frameborder=\\"0\\" allowfullscreen></iframe>', 1, 92, '2011-03-19 20:35:01', 'No', 0),
(37, NULL, '<iframe title="YouTube video player" width="480" height="390" src="http://www.youtube.com/embed/J6AwEPay8x4" frameborder="0" allowfullscreen></iframe>', 1, 92, '2011-03-19 20:36:00', 'No', 0),
(38, NULL, '<iframe title="YouTube video player" width="480" height="390" src="http://www.youtube.com/embed/bjJKpJtBVwU" frameborder="0" allowfullscreen></iframe>', 1, 92, '2011-03-20 09:23:11', 'No', 0),
(40, 'ggg', NULL, 1, 92, '2011-03-20 07:22:21', 'No', 0),
(41, NULL, '<iframe title="YouTube video player" width="480" height="390" src="http://www.youtube.com/embed/J6AwEPay8x4" frameborder="0" allowfullscreen></iframe>', 1, 93, '2011-03-23 13:53:28', 'No', 0),
(42, NULL, '<iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/t4GryFY8dPg" frameborder="0" allowfullscreen></iframe>', 1, 92, '2011-03-25 18:22:04', 'No', 0);
