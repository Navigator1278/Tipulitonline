-- phpMyAdmin SQL Dump
-- version 3.1.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Час створення: Квт 08 2011 р., 16:05
-- Версія сервера: 5.1.30
-- Версія PHP: 5.2.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- БД: `tipulitonline`
--

-- --------------------------------------------------------

--
-- Структура таблиці `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_from_user_id` int(11) DEFAULT NULL,
  `chat_from_teacher_id` int(11) DEFAULT NULL,
  `chat_to_user_id` int(11) DEFAULT NULL,
  `chat_to_teacher_id` int(11) DEFAULT NULL,
  `chat_message` varchar(250) NOT NULL,
  `chat_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `chat_isread_s` tinyint(4) DEFAULT '0',
  `chat_isread_t` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=368 ;

--
-- Дамп даних таблиці `chat`
--

INSERT INTO `chat` (`chat_id`, `chat_from_user_id`, `chat_from_teacher_id`, `chat_to_user_id`, `chat_to_teacher_id`, `chat_message`, `chat_datetime`, `chat_isread_s`, `chat_isread_t`) VALUES
(355, NULL, 1, 92, NULL, 'New chat request', '2011-04-08 15:17:22', 1, 1),
(356, 92, NULL, NULL, 1, 'ttttt', '2011-04-08 15:18:09', 1, 1),
(357, NULL, 1, 92, NULL, 'vbvbvbvb', '2011-04-08 15:18:20', 1, 1),
(358, 92, NULL, NULL, 1, 'rtrtrtrt', '2011-04-08 15:18:42', 1, 1),
(359, NULL, 1, 92, NULL, 'ggg', '2011-04-08 15:19:42', 1, 1),
(360, NULL, 1, 92, NULL, 'erererer', '2011-04-08 15:19:42', 1, 1),
(361, 92, NULL, NULL, 1, 'gdgdgdgd', '2011-04-08 15:20:04', 1, 1),
(362, NULL, 1, 92, NULL, 'New chat request', '2011-04-08 15:20:26', 1, 1),
(363, 92, NULL, NULL, 1, 'tretre', '2011-04-08 15:23:27', 1, 0),
(364, 92, NULL, NULL, 1, 'bvvvvv', '2011-04-08 15:23:40', 1, 0),
(365, 92, NULL, NULL, 1, 'ewwewe', '2011-04-08 15:23:52', 1, 0),
(366, NULL, 1, 92, NULL, 'Im currently offline. I will read your message by my next visit', '2011-04-08 15:23:52', 1, 0),
(367, 92, NULL, NULL, 1, 're', '2011-04-08 15:24:14', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_user_id` int(11) NOT NULL,
  `f_video_id` varchar(200) NOT NULL,
  `f_improvement` set('Yes','No') NOT NULL,
  `f_difficulty` set('Hard','Suitable','Easy') NOT NULL,
  `f_difficulty_text` text,
  `f_suggestions` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Дамп даних таблиці `feedback`
--

INSERT INTO `feedback` (`f_id`, `f_user_id`, `f_video_id`, `f_improvement`, `f_difficulty`, `f_difficulty_text`, `f_suggestions`) VALUES
(27, 92, '1', 'No', 'Suitable', '', '');

-- --------------------------------------------------------

--
-- Структура таблиці `news`
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
-- Дамп даних таблиці `news`
--


-- --------------------------------------------------------

--
-- Структура таблиці `news_status`
--

CREATE TABLE IF NOT EXISTS `news_status` (
  `ns_id` int(11) NOT NULL AUTO_INCREMENT,
  `ns_status` varchar(45) NOT NULL,
  PRIMARY KEY (`ns_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп даних таблиці `news_status`
--

INSERT INTO `news_status` (`ns_id`, `ns_status`) VALUES
(1, 'New'),
(2, 'Visible'),
(3, 'Hidden'),
(4, 'Pending'),
(5, 'Deleted');

-- --------------------------------------------------------

--
-- Структура таблиці `privat_messages`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=165 ;

--
-- Дамп даних таблиці `privat_messages`
--

INSERT INTO `privat_messages` (`spm_id`, `spm_from_user_id`, `spm_from_teacher_id`, `spm_to_user_id`, `spm_to_teacher_id`, `spm_subject`, `spm_body`, `spm_datetime`, `spm_is_new`) VALUES
(135, 92, NULL, NULL, 1, 'dsddd', 'asasas &nbsp; asdas s dasd asd aas', '2011-04-01 06:44:30', 1),
(136, 92, NULL, NULL, 1, 'test', '<p><strong>Bold </strong><em>Italic</em> <u>Underline</u> <font size="3">Font </font><font face="times new roman">sdf </font>sdf sdf sd fs <img src="http://sss.de" alt="sss" align="left">gssd fgd <img src="http://img849.imageshack.us/img849/9291/45205314.gif" width="75">gh fh <span style="background-color: #3366FF;">fdg</span>h fdjfgh gfh fh fdh fgh <a href="http://web.de" title="webde" target="">fgh</a> fh fh <font color="#ff0033">fh</font>d &nbsp;gdf</p>', '2011-04-01 06:47:42', 1),
(137, 92, NULL, NULL, 1, '', 'sdss str sadf s', '2011-04-01 06:49:20', 1),
(138, 92, NULL, NULL, 1, '', 'sdfsdf sdf sdf sf&nbsp;', '2011-04-01 06:49:47', 1),
(139, 92, NULL, NULL, 1, 'd', 'asas <strong>as</strong>d ad a d', '2011-04-01 06:50:25', 1),
(140, 92, NULL, NULL, 1, 'sss', '&lt;p&gt;&lt;strong&gt;Bold &lt;/strong&gt;&lt;em&gt;Italic&lt;/em&gt; &lt;u&gt;Underline&lt;/u&gt; &lt;font size="3"&gt;Font &lt;/font&gt;&lt;font face="times new roman"&gt;sdf &lt;/font&gt;sdf sdf sd fs &lt;img src="http://sss.de" alt="sss" align="left"&gt;gssd fgd &lt;img src="http://img849.imageshack.us/img849/9291/45205314.gif" width="75"&gt;gh fh &lt;span style="background-color: #3366FF;"&gt;fdg&lt;/span&gt;h fdjfgh gfh fh fdh fgh &lt;a href="http://web.de" title="webde" target=""&gt;fgh&lt;/a&gt; fh fh &lt;font color="#ff0033"&gt;fh&lt;/font&gt;d &amp;nbsp;gdf&lt;/p&gt;', '2011-04-01 06:51:53', 1),
(141, 92, NULL, NULL, 1, 'asas', '<strong>s<font color="#990066">dfl</font>skjf </strong><em>slfjs </em>l<u>fjs </u>fl<span style="background-color: #3300CC;">sjf <font size="4">lsd</font></span><font size="4">kfjsld</font><font color="#339933"><font size="4">fjsk</font>lfj</font>slk fksdf <font face="comic sans ms">lkjl </font>slkfj &nbsp;<img src="http://img832.imageshack.us/img832/7512/31891985.gif" width="75">lkj lkj <a href="http://web.de" title="web" target="">lk </a>jl', '2011-04-01 06:53:30', 1),
(142, 92, NULL, NULL, 1, 'ssss', '&lt;iframe&gt;', '2011-04-01 06:54:15', 1),
(143, 92, NULL, NULL, 1, 'Feedback', 'You''ve got following feedback from Dima Kolbin according to the video: EpevEEUJ:Improvement: YesDifficulty: HardHis comments to the difficulty: eHis suggestions: d', '2011-04-01 07:36:54', 1),
(144, 92, NULL, NULL, 1, 'Feedback', 'You''ve got following feedback from DDD Kolbin according to the video: 5:Improvement: YesDifficulty: HardHis comments to the difficulty: sssHis suggestions: ddd', '2011-04-01 15:20:12', 1),
(145, 100, NULL, NULL, 1, 'New user was registered', 'The new <a href=''/teacher/dashboard/view-student/stid/100''>user</a> was registered at the site', '2011-04-01 16:50:31', 0),
(146, 101, NULL, NULL, 1, 'New user was registered', 'The new <a href=''/teacher/dashboard/view-student/stid/101''>user</a> was registered at the site', '2011-04-01 16:52:37', 0),
(147, 102, NULL, NULL, 0, 'New user was registered', 'The new <a href=''/teacher/dashboard/view-student/stid/102''>user</a> was registered at the site', '2011-04-01 16:53:51', 0),
(148, 0, NULL, NULL, 1, 'New user was registered', 'The new <a href=''/teacher/dashboard/view-student/stid/103''>user</a> was registered at the site', '2011-04-01 16:54:37', 0),
(149, 0, NULL, NULL, 1, 'New user was registered', 'The new <a href=''/teacher/dashboard/view-student/stid/104''>user</a> was registered at the site', '2011-04-04 17:27:39', 0),
(150, NULL, 1, 92, NULL, 'Re: asas', 'ÑÐ°Ð¼ Ñ‚Ð°ÐºÐ¾Ð¹<br>', '2011-04-05 09:48:01', 0),
(151, NULL, 1, 92, NULL, '1', '1<br>', '2011-04-05 13:34:04', 1),
(152, NULL, 1, 92, NULL, '2', '2<br>', '2011-04-05 13:34:13', 1),
(153, 0, NULL, NULL, 1, 'New user was registered', 'The new <a href=''/teacher/dashboard/view-student/stid/105''>user</a> was registered at the site', '2011-04-05 14:44:58', 0),
(154, 92, NULL, NULL, 1, 'Feedback', 'You''ve got following feedback from DDD Kolbin according to the video: 5:Improvement: YesDifficulty: HardHis comments to the difficulty: His suggestions:', '2011-04-06 18:56:47', 0),
(155, 92, NULL, NULL, 1, 'Feedback', 'You''ve got following feedback from DDD Kolbin according to the video: 5:Improvement: YesDifficulty: HardHis comments to the difficulty: His suggestions:', '2011-04-06 18:57:06', 0),
(156, 92, NULL, NULL, 1, 'Feedback', 'You''ve got following feedback from DDD Kolbin according to the video: 5:Improvement: YesDifficulty: HardHis comments to the difficulty: gfHis suggestions:', '2011-04-06 18:57:24', 0),
(157, 92, NULL, NULL, 1, 'Feedback', 'You''ve got following feedback from DDD Kolbin according to the video: 5:Improvement: YesDifficulty: HardHis comments to the difficulty: dddHis suggestions: fff', '2011-04-06 18:58:18', 0),
(158, 92, NULL, NULL, 1, 'Feedback', 'You''ve got following feedback from DDD Kolbin according to the video: 5:Improvement: NoDifficulty: SuitableHis comments to the difficulty: hgjHis suggestions: gjgj', '2011-04-06 18:58:38', 0),
(159, 92, NULL, NULL, 1, 'Feedback', 'You''ve got following feedback from DDD Kolbin according to the video: 5:Improvement: YesDifficulty: HardHis comments to the difficulty: hgjkhjHis suggestions: hjkhj', '2011-04-06 18:58:48', 0),
(160, 92, NULL, NULL, 1, 'Feedback', 'You''ve got following feedback from DDD Kolbin according to the video: 5:Improvement: YesDifficulty: HardHis comments to the difficulty: ffHis suggestions: gg', '2011-04-06 18:59:42', 0),
(161, 92, NULL, NULL, 1, 'Feedback', 'You''ve got following feedback from DDD Kolbin according to the video: EpevEEUJ:Improvement: YesDifficulty: HardHis comments to the difficulty: fghfHis suggestions: fghfgh', '2011-04-06 19:00:42', 0),
(162, 92, NULL, NULL, 1, 'Feedback', 'You''ve got following feedback from DDD Kolbin according to the video: EpevEEUJ:Improvement: YesDifficulty: HardHis comments to the difficulty: tHis suggestions: y', '2011-04-06 19:01:08', 0),
(163, 92, NULL, NULL, 1, 'Feedback', 'You''ve got following feedback from DDD Kolbin according to the video: 1:Improvement: NoDifficulty: SuitableHis comments to the difficulty: His suggestions:', '2011-04-06 19:03:11', 0),
(164, NULL, 1, 92, NULL, 'Youve got the new 6d-video at tipulitonline<br/>', 'Youve got the new 6d-video at tipulitonline<br/>Now you can watch the video Nr. 2<br/>', '2011-04-06 19:04:12', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `system__alerts`
--

CREATE TABLE IF NOT EXISTS `system__alerts` (
  `sa_id` int(11) NOT NULL AUTO_INCREMENT,
  `sa_student_id` int(11) DEFAULT NULL,
  `sa_teacher_id` int(11) DEFAULT NULL,
  `sa_alert_type_id` tinyint(3) NOT NULL,
  `sa_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sa_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Дамп даних таблиці `system__alerts`
--

INSERT INTO `system__alerts` (`sa_id`, `sa_student_id`, `sa_teacher_id`, `sa_alert_type_id`, `sa_timestamp`) VALUES
(10, 92, NULL, 3, '2011-03-28 21:48:25'),
(11, 92, NULL, 4, '2011-04-01 15:20:12'),
(12, 99, NULL, 1, '2011-04-01 16:37:47'),
(13, 100, NULL, 1, '2011-04-01 16:50:31'),
(14, 0, NULL, 1, '2011-04-01 16:52:37'),
(15, 102, NULL, 1, '2011-04-01 16:53:51'),
(16, 103, NULL, 1, '2011-04-01 16:54:37'),
(17, 104, NULL, 1, '2011-04-04 17:27:39'),
(18, 105, NULL, 1, '2011-04-05 14:44:58'),
(19, 92, NULL, 4, '2011-04-06 18:56:47'),
(20, 92, NULL, 4, '2011-04-06 18:57:06'),
(21, 92, NULL, 4, '2011-04-06 18:57:24'),
(22, 92, NULL, 4, '2011-04-06 18:58:18'),
(23, 92, NULL, 4, '2011-04-06 18:58:38'),
(24, 92, NULL, 4, '2011-04-06 18:58:48'),
(25, 92, NULL, 4, '2011-04-06 18:59:42'),
(26, 92, NULL, 4, '2011-04-06 19:00:42'),
(27, 92, NULL, 4, '2011-04-06 19:01:08'),
(28, 92, NULL, 4, '2011-04-06 19:03:11');

-- --------------------------------------------------------

--
-- Структура таблиці `system__alert_type`
--

CREATE TABLE IF NOT EXISTS `system__alert_type` (
  `sat_id` int(11) NOT NULL AUTO_INCREMENT,
  `sat_type` varchar(100) NOT NULL,
  PRIMARY KEY (`sat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп даних таблиці `system__alert_type`
--

INSERT INTO `system__alert_type` (`sat_id`, `sat_type`) VALUES
(1, 'New User Registration'),
(2, 'Update User Information'),
(3, '6D Course Request'),
(4, 'Feedback from the student');

-- --------------------------------------------------------

--
-- Структура таблиці `system__email_templates`
--

CREATE TABLE IF NOT EXISTS `system__email_templates` (
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  `set_subject` varchar(250) NOT NULL,
  `set_body` text NOT NULL,
  PRIMARY KEY (`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп даних таблиці `system__email_templates`
--


-- --------------------------------------------------------

--
-- Структура таблиці `system__email_validation`
--

CREATE TABLE IF NOT EXISTS `system__email_validation` (
  `sev_id` int(11) NOT NULL AUTO_INCREMENT,
  `sev_reg_request_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sev_user_id` int(11) NOT NULL,
  `sev_validation_code` varchar(255) NOT NULL,
  `sev_pass` varchar(45) NOT NULL,
  PRIMARY KEY (`sev_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=89 ;

--
-- Дамп даних таблиці `system__email_validation`
--

INSERT INTO `system__email_validation` (`sev_id`, `sev_reg_request_time`, `sev_user_id`, `sev_validation_code`, `sev_pass`) VALUES
(75, '2011-03-16 19:05:51', 92, '7aeb0f20503c5c0948792192e4e7f6d2', 'qwqw'),
(76, '2011-03-17 07:46:28', 93, '2c092688f1170547bd330529daf174cb', 'qwqw'),
(77, '2011-03-17 08:21:21', 94, '32ed51713c398b7760e02e77d55714da', 'qwqw'),
(78, '2011-03-22 15:28:24', 95, 'a53dd2e8058b02a6dbfbf836ee980655', 'qwqw'),
(79, '2011-04-01 16:23:01', 96, 'a1a8bd8da4c9ef07eb0d151b872f5258', 'qwqw'),
(80, '2011-04-01 16:24:35', 97, '28d98dac888219c142447677de80e732', 'qwqw'),
(81, '2011-04-01 16:31:41', 98, '089bd527e9cc669f20fec9208a57f4cf', 'qwqw'),
(82, '2011-04-01 16:37:29', 99, '022b243a4b92b822d9ba1487d8f837bc', 'qwqw'),
(83, '2011-04-01 16:49:22', 100, '5e651a6f9185195dc7a74f7ef18c9d3c', 'qwqw'),
(84, '2011-04-01 16:52:15', 101, '9a106c89d11f83336b2ff2e0eb855cd8', 'qwqw'),
(85, '2011-04-01 16:53:34', 102, '45300dbfad75d98bf78ef5a4e23cce53', 'qwqw'),
(86, '2011-04-01 16:54:20', 103, 'a001dc29ffe770eb49c6d684cee90538', 'qwqw'),
(87, '2011-04-04 17:27:20', 104, '4ecd50a297d18df6b7ee33ca186d8cb4', 'qwqw'),
(88, '2011-04-05 14:44:00', 105, 'eedff7e7651d977dbd3c6c750eb2e9ef', 'qwqw');

-- --------------------------------------------------------

--
-- Структура таблиці `system__language`
--

CREATE TABLE IF NOT EXISTS `system__language` (
  `sl_id` int(11) NOT NULL AUTO_INCREMENT,
  `sl_language` varchar(60) NOT NULL,
  PRIMARY KEY (`sl_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `system__language`
--

INSERT INTO `system__language` (`sl_id`, `sl_language`) VALUES
(1, 'Hebrew'),
(2, 'English'),
(3, 'Arabic');

-- --------------------------------------------------------

--
-- Структура таблиці `system__log`
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
-- Дамп даних таблиці `system__log`
--


-- --------------------------------------------------------

--
-- Структура таблиці `system__properties`
--

CREATE TABLE IF NOT EXISTS `system__properties` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(250) NOT NULL,
  `p_value` text,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `system__properties`
--

INSERT INTO `system__properties` (`p_id`, `p_name`, `p_value`) VALUES
(1, 'payment_info', '<p>\r\n	sdsdf</p>\r\n<p>\r\n	sdf</p>\r\n<p>\r\n	sd</p>\r\n<p>\r\n	fs</p>\r\n<p>\r\n	df</p>\r\n<p>\r\n	s</p>\r\n<p>\r\n	fs</p>\r\n<p>\r\n	df</p>\r\n<p>\r\n	sd</p>\r\n<p>\r\n	fs</p>\r\n<p>\r\n	df</p>\r\n<p>\r\n	sd</p>\r\n<p>\r\n	f</p>\r\n<p>\r\n	sdf</p>\r\n<p>\r\n	sd</p>\r\n<p>\r\n	f</p>\r\n<p>\r\n	sdfsfsdfsfsdfsasd asd adasd asd asd a</p>\r\n');

-- --------------------------------------------------------

--
-- Структура таблиці `system__sex`
--

CREATE TABLE IF NOT EXISTS `system__sex` (
  `ss_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_sex` varchar(10) NOT NULL,
  PRIMARY KEY (`ss_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп даних таблиці `system__sex`
--

INSERT INTO `system__sex` (`ss_id`, `ss_sex`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Структура таблиці `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_first_name` varchar(250) NOT NULL,
  `t_last_name` varchar(250) NOT NULL,
  `t_lastactivity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `t_visible` tinyint(4) DEFAULT NULL,
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
-- Дамп даних таблиці `teachers`
--

INSERT INTO `teachers` (`t_id`, `t_first_name`, `t_last_name`, `t_lastactivity`, `t_visible`, `t_email`, `t_pass`, `t_sex_id`, `t_language_id`, `t_style`, `t_skype`, `t_facebook`, `t_phone`, `t_url`, `t_picture`) VALUES
(1, 'Dima', 'Kolbin', '2011-04-08 16:02:09', 0, 'navigator1278@gmail.com', 'qwqw', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(100) NOT NULL,
  `u_family_name` varchar(100) NOT NULL,
  `u_status_id` tinyint(3) NOT NULL,
  `u_registraion_date` date NOT NULL,
  `u_lastactivity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=106 ;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`u_id`, `u_name`, `u_family_name`, `u_status_id`, `u_registraion_date`, `u_lastactivity`, `u_address`, `u_state_id`, `u_zip`, `u_country_id`, `u_password`, `u_email`, `u_sex_id`, `u_date_of_birth`, `u_external_emails`, `u_visits_amount`, `u_picture`, `u_registration_stamp`, `u_objectives`) VALUES
(92, 'DDD', 'Kolbin', 4, '2011-03-16', '2011-04-08 15:24:17', '', 1, NULL, 1, 'qwqw', 'tenhi@mail.ru', NULL, '2011-03-01', NULL, 43, 'ava13016576202948.jpg', 3333, 'qwqws2'),
(93, 'dsfsdf', 'sdfsdfsdf', 5, '2011-03-17', '2011-04-07 07:48:06', '', 1, NULL, 1, 'qwqw', 'test2@test.ru', 1, '2011-03-01', NULL, 1, NULL, 3333, ''),
(94, 'dddd', 'fffff', 5, '2011-03-17', '2011-04-06 15:20:18', '', 1, NULL, 1, 'qwqw', 'sfsdfs@web.de', 0, '2011-03-08', NULL, 0, NULL, 3333, ''),
(95, 'asasas', 'dsdsd', 4, '2011-03-22', '2011-04-06 15:20:18', '', 1, NULL, 1, 'qwqw', 'asasas@web.de', 0, '2011-03-01', 'Yes', 0, NULL, 3333, ''),
(96, 'dsfs', 'dfgdfg', 5, '2011-04-01', '2011-04-06 15:20:18', '', 1, NULL, 1, 'qwqw', 'sdfsdf@web.de', 0, '2011-04-12', NULL, 0, NULL, 3333, ''),
(97, 'dsfs', 'dfgdfg', 5, '2011-04-01', '2011-04-06 15:20:18', '', 1, NULL, 1, 'qwqw', 'sdfsdfsss@web.de', 0, '2011-04-12', NULL, 0, NULL, 3333, ''),
(98, 'sdsdsd', 'fddfdf', 5, '2011-04-01', '2011-04-06 15:20:18', '', 1, NULL, 1, 'qwqw', 'sdsdfsd@mail.ru', 1, '2011-04-04', NULL, 0, NULL, 3333, ''),
(99, 'ttt', 'yyy', 5, '2011-04-01', '2011-04-06 15:20:18', '', 1, NULL, 1, 'qwqw', 'sftr@mail.ru', 1, '2011-04-11', NULL, 0, NULL, 3333, ''),
(100, 'dsfdf', 'gfgf', 5, '2011-04-01', '2011-04-06 15:20:18', '', 1, NULL, 1, 'qwqw', 'trtr@mail.ru', 0, '2011-04-12', NULL, 0, NULL, 3333, ''),
(101, 'xvxcvx', 'sdfsdfs', 5, '2011-04-01', '2011-04-06 15:20:18', '', 1, NULL, 1, 'qwqw', 'sfsdfs@mail.ru', 0, '2011-04-05', NULL, 0, NULL, 3333, ''),
(102, 'xvxcvx', 'sdfsdfs', 5, '2011-04-01', '2011-04-06 15:20:18', '', 1, NULL, 1, 'qwqw', 'sfsdwwfs@mail.ru', 0, '2011-04-05', NULL, 0, NULL, 3333, ''),
(103, 'xvxcvx', 'sdfsdfs', 5, '2011-04-01', '2011-04-06 15:20:18', '', 1, NULL, 1, 'qwqw', 'sfsdwwfwws@mail.ru', 0, '2011-04-04', NULL, 0, NULL, 3333, ''),
(104, 'sdfsdfff', 'gggg', 5, '2011-04-04', '2011-04-06 15:20:18', '', 1, NULL, 1, 'qwqw', 'rere@web.de', 1, '2011-04-03', NULL, 0, NULL, 3333, ''),
(105, 'yyyy', 'yyyy', 5, '2011-04-05', '2011-04-06 15:20:18', '', 1, NULL, 1, 'qwqw', 'yyy@mail.ru', 0, '2011-04-04', NULL, 0, NULL, 3333, '');

-- --------------------------------------------------------

--
-- Структура таблиці `user__health_table`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

--
-- Дамп даних таблиці `user__health_table`
--

INSERT INTO `user__health_table` (`uht_id`, `uht_user_id`, `uht_height`, `uht_weight`, `uht_bmi`, `uht_pregnant`, `uht_pregnant_since`, `uht_walk`, `uht_sit`, `uht_hands`, `uht_slipped_disk`, `uht_backashes`, `uht_ankles_and_feet`, `uht_ankles`, `uht_breath`, `uht_knees`, `uht_thighs_or_pelvis`, `uht_lower_back`, `uht_upper_back`, `uht_neck_and_shoulders`, `uht_head`, `uht_wrists`, `uht_elbows`, `uht_other_pain_body`, `uht_depression_or_anxiety`, `uht_heart_or_pb`, `uht_injury`, `uht_injury_text`, `uht_epilepsy`, `uht_cancer`, `uht_diabetes`, `uht_asthma`, `uht_Artritis`, `uht_hernia`, `uht_medication`, `uht_which_medication`, `uht_migrene`, `uht_babies`, `uht_nosleep`, `uht_digestion`, `uht_menopause`, `uht_sclorosies`, `uht_headaches`, `uht_fatigue`, `uht_general1`, `uht_general2`, `uht_general3`, `uht_more_info`, `uht_other_conditions`) VALUES
(80, 92, NULL, 20, NULL, 'No', 1, 'No', 'No', 'Yes', 'No', 'Yes', 'Yes', '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', NULL, NULL, 'Yes', 'Yes', 'Yes', 'sss', 'Yes', 'Yes', '', 'Yes', 'Yes', 'Yes', '', 'dd', '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', '', '', '', 'ff', NULL),
(81, 93, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL),
(82, 94, NULL, NULL, NULL, 'Yes', 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL),
(83, 95, NULL, NULL, NULL, 'Yes', 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL),
(84, 96, NULL, NULL, NULL, 'Yes', 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', 'as', '', '', '', '', '', '', '', 'sd', '', '', '', '', '', '', '', '', '', '', '', 'ds', NULL),
(85, 97, NULL, NULL, NULL, 'Yes', 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', 'dfg', '', '', '', '', '', '', '', 'dfg', '', '', '', '', '', '', '', '', '', '', '', 'dfg', NULL),
(86, 98, NULL, NULL, NULL, 'Yes', 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL),
(87, 99, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL),
(88, 100, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL),
(89, 101, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL),
(90, 102, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL),
(91, 103, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL),
(92, 104, NULL, NULL, NULL, 'Yes', 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL),
(93, 105, 128, 27, NULL, 'Yes', 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `user__status`
--

CREATE TABLE IF NOT EXISTS `user__status` (
  `us_id` int(11) NOT NULL AUTO_INCREMENT,
  `us_type` varchar(45) NOT NULL,
  PRIMARY KEY (`us_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп даних таблиці `user__status`
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
-- Структура таблиці `video__6d`
--

CREATE TABLE IF NOT EXISTS `video__6d` (
  `v6d_id` int(11) NOT NULL AUTO_INCREMENT,
  `v6d_code` varchar(255) NOT NULL,
  PRIMARY KEY (`v6d_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп даних таблиці `video__6d`
--

INSERT INTO `video__6d` (`v6d_id`, `v6d_code`) VALUES
(1, '<script type="text/javascript" src="http://content.bitsontherun.com/players/6ieFYyoc-YGFwoZEb.js"></script>'),
(2, '<script type="text/javascript" src="http://content.bitsontherun.com/players/6ieFYyoc-YGFwoZEb.js"></script>'),
(3, '<script type="text/javascript" src="http://content.bitsontherun.com/players/6ieFYyoc-YGFwoZEb.js"></script>'),
(4, '<script type="text/javascript" src="http://content.bitsontherun.com/players/6ieFYyoc-YGFwoZEb.js"></script>'),
(5, '<script type="text/javascript" src="http://content.bitsontherun.com/players/6ieFYyoc-YGFwoZEb.js"></script>'),
(6, '<script type="text/javascript" src="http://content.bitsontherun.com/players/6ieFYyoc-YGFwoZEb.js"></script>');

-- --------------------------------------------------------

--
-- Структура таблиці `video__6d_status`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=75 ;

--
-- Дамп даних таблиці `video__6d_status`
--

INSERT INTO `video__6d_status` (`v6ds_id`, `v6ds_video_id`, `v6ds_user_id`, `v6ds_teacher_id`, `v6ds_viewed`, `v6ds_timestamp`, `v6ds_paused`, `v6ds_notified`) VALUES
(73, 1, 92, 1, 'Yes', '2011-04-06 19:03:09', 'No', 'Yes'),
(74, 2, 92, 1, 'No', '2011-04-06 19:04:09', 'No', 'No');

-- --------------------------------------------------------

--
-- Структура таблиці `video__all_movies`
--

CREATE TABLE IF NOT EXISTS `video__all_movies` (
  `vam_id` int(11) NOT NULL AUTO_INCREMENT,
  `vam_video_player1` varchar(255) DEFAULT NULL,
  `vam_video_player2` text,
  `vam_teacher_id` int(11) NOT NULL,
  `vam_user_id` int(11) NOT NULL,
  `vam_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vam_is_payed` set('Yes','No') DEFAULT 'No',
  `vam_playing_duration` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп даних таблиці `video__all_movies`
--

