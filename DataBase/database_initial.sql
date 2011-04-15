-- phpMyAdmin SQL Dump
-- version 3.3.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Фев 08 2011 г., 09:14
-- Версия сервера: 5.1.49
-- Версия PHP: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- База данных: `tipulitonline`
--

-- --------------------------------------------------------

--
-- Структура таблицы `jos_banner`
--

CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT 'banner',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(100) NOT NULL DEFAULT '',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `showBanner` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `jos_banner`
--

INSERT INTO `jos_banner` (`bid`, `cid`, `type`, `name`, `alias`, `imptotal`, `impmade`, `clicks`, `imageurl`, `clickurl`, `date`, `showBanner`, `checked_out`, `checked_out_time`, `editor`, `custombannercode`, `catid`, `description`, `sticky`, `ordering`, `publish_up`, `publish_down`, `tags`, `params`) VALUES
(1, 1, 'banner', 'OSM 1', 'osm-1', 0, 43, 0, 'osmbanner1.png', 'http://www.opensourcematters.org', '2004-07-07 15:31:29', 1, 0, '0000-00-00 00:00:00', '', '', 13, '', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(2, 1, 'banner', 'OSM 2', 'osm-2', 0, 49, 0, 'osmbanner2.png', 'http://www.opensourcematters.org', '2004-07-07 15:31:29', 1, 0, '0000-00-00 00:00:00', '', '', 13, '', 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(3, 1, '', 'Joomla!', 'joomla', 0, 32, 0, '', 'http://www.joomla.org', '2006-05-29 14:21:28', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}" target="_blank">{NAME}</a>\r\n<br/>\r\nJoomla! The most popular and widely used Open Source CMS Project in the world.', 14, '', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(4, 1, '', 'JoomlaCode', 'joomlacode', 0, 32, 0, '', 'http://joomlacode.org', '2006-05-29 14:19:26', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}" target="_blank">{NAME}</a>\r\n<br/>\r\nJoomlaCode, development and distribution made easy.', 14, '', 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(5, 1, '', 'Joomla! Extensions', 'joomla-extensions', 0, 27, 0, '', 'http://extensions.joomla.org', '2006-05-29 14:23:21', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}" target="_blank">{NAME}</a>\r\n<br/>\r\nJoomla! Components, Modules, Plugins and Languages by the bucket load.', 14, '', 0, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(6, 1, '', 'Joomla! Shop', 'joomla-shop', 0, 27, 0, '', 'http://shop.joomla.org', '2006-05-29 14:23:21', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}" target="_blank">{NAME}</a>\r\n<br/>\r\nFor all your Joomla! merchandise.', 14, '', 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(7, 1, '', 'Joomla! Promo Shop', 'joomla-promo-shop', 0, 16, 1, 'shop-ad.jpg', 'http://shop.joomla.org', '2007-09-19 17:26:24', 1, 0, '0000-00-00 00:00:00', '', '', 33, '', 0, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(8, 1, '', 'Joomla! Promo Books', 'joomla-promo-books', 0, 19, 1, 'shop-ad-books.jpg', 'http://shop.joomla.org/amazoncom-bookstores.html', '2007-09-19 17:28:01', 1, 0, '0000-00-00 00:00:00', '', '', 33, '', 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `jos_bannerclient`
--

CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` time DEFAULT NULL,
  `editor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `jos_bannerclient`
--

INSERT INTO `jos_bannerclient` (`cid`, `name`, `contact`, `email`, `extrainfo`, `checked_out`, `checked_out_time`, `editor`) VALUES
(1, 'Open Source Matters', 'Administrator', 'admin@opensourcematters.org', '', 0, '00:00:00', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `jos_bannertrack`
--

CREATE TABLE IF NOT EXISTS `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jos_bannertrack`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_categories`
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=917 ;

--
-- Дамп данных таблицы `jos_categories`
--

INSERT INTO `jos_categories` (`id`, `parent_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `params`) VALUES
(906, 0, 'יוגה טיפולית לבעיות צוואר', '', 'therapeutic-yoga-neck-problems', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 6, 0, 0, ''),
(2, 0, 'Joomla! Specific Links', '', 'joomla-specific-links', 'clock.jpg', 'com_weblinks', 'left', 'A selection of links that are all related to the Joomla! Project.', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(3, 0, 'חדשות טיפולית אונליין', '', 'newsflash', '', '1', 'left', '', 1, 0, '0000-00-00 00:00:00', '', 1, 0, 0, ''),
(4, 0, 'Joomla!', '', 'joomla', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(5, 0, 'Free and Open Source Software', '', 'free-and-open-source-software', '', 'com_newsfeeds', 'left', 'Read the latest news about free and open source software from some of its leading advocates.', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(6, 0, 'Related Projects', '', 'related-projects', '', 'com_newsfeeds', 'left', 'Joomla builds on and collaborates with many other free and open source projects. Keep up with the latest news from some of them.', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(12, 0, 'Contacts', '', 'contacts', '', 'com_contact_details', 'left', 'Contact Details for this Web site', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(13, 0, 'Joomla', '', 'joomla', '', 'com_banner', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(14, 0, 'Text Ads', '', 'text-ads', '', 'com_banner', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(15, 0, 'Features', '', 'features', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 6, 0, 0, ''),
(17, 0, 'Benefits', '', 'benefits', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(18, 0, 'Platforms', '', 'platforms', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(19, 0, 'Other Resources', '', 'other-resources', '', 'com_weblinks', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(905, 0, 'יוגה טיפולית לכאבי כתפיים', '', 'therapeutic-yoga-shoulder-pain', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 5, 0, 0, ''),
(904, 0, 'יוגה טיפולית  להחלמה מסרטן', '', 'yoga-therapy-for-recovery-from-cancer', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(903, 0, 'יוגה טיפולית ללחץ וחרדה', '', 'therapeutic-yoga-stress-and-anxiety', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(902, 0, 'יוגה טיפולית לכאבי גב', '', 'therapeutic-yoga-for-back-pain', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(901, 0, 'יוגה טיפולית לפריצת דיסק', '', 'therapeutic-yoga-herniated-disc', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(33, 0, 'Joomla! Promo', '', 'joomla-promo', '', 'com_banner', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(900, 0, 'Additional Information', 'Personal', '', '', 'com_extending_field_list', 'left', '', 1, 62, '2007-03-30 14:36:58', NULL, 2, 0, 0, ''),
(907, 0, 'יוגה טיפולית לדלקות פרקים', '', 'yoga-therapy-arthritis', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 7, 0, 0, ''),
(908, 0, 'יוגה טיפולית לאסטמה ובעיות נשימה', '', 'yoga-therapy-for-asthma-and-respiratory-problems', 'category_image.jpg', '5', 'left', '<p>לטיפול בבעיות נשימה, מתח, חיזוק<br />הריכוז והיכולות המנטאליות. תרגול<br />מצויין לפני קבלת החלטות</p>', 1, 0, '0000-00-00 00:00:00', NULL, 8, 0, 0, ''),
(909, 0, 'יוגה טיפולית לבעיות עיכול', '', 'therapeutic-yoga-digestive-problems', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 9, 0, 0, ''),
(910, 0, 'יוגה טיפולית לגיל הזהב', '', 'therapeutic-yoga-for-seniors', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 10, 0, 0, ''),
(911, 0, 'יוגה טיפולית ללחץ דם', '', 'therapeutic-yoga-blood-pressure', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 11, 0, 0, ''),
(912, 0, 'יוגה טיפולית להריון ולאחר לידה', '', 'therapeutic-yoga-pregnancy-and-birth', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 12, 0, 0, ''),
(913, 0, 'יוגה טיפולית לגיל המעבר', '', 'yoga-therapy-menopause', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 13, 0, 0, ''),
(914, 0, 'יוגה טיפולית לסיאטיקה', '', 'therapeutic-yoga-lsiattika', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 14, 0, 0, ''),
(915, 0, 'יוגה טיפולית לבעיות לב', '', 'therapeutic-yoga-heart-problems', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 15, 0, 0, ''),
(916, 0, 'Page', '', 'page', '', '1', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `jos_components`
--

CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_menu_link` varchar(255) NOT NULL DEFAULT '',
  `admin_menu_alt` varchar(255) NOT NULL DEFAULT '',
  `option` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `admin_menu_img` varchar(255) NOT NULL DEFAULT '',
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Дамп данных таблицы `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, 'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n', 1),
(2, 'Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(3, 'Clients', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/component.png', 0, 'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 1),
(5, 'Links', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(6, 'Categories', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(7, 'Contacts', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/component.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(8, 'Contacts', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, '', 1),
(9, 'Categories', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(10, 'Polls', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(11, 'News Feeds', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(12, 'Feeds', '', 0, 11, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, 'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 1),
(13, 'Categories', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'User', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(15, 'Search', 'option=com_search', 0, 0, 'option=com_search', 'Search Statistics', 'com_search', 0, 'js/ThemeOffice/component.png', 1, 'enabled=0\n\n', 1),
(16, 'Categories', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail To', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Media Manager', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\nallowed_media_usergroup=3\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=0\n\n', 1),
(20, 'Articles', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=0\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=0\nshow_pdf_icon=0\nshow_print_icon=0\nshow_email_icon=0\nshow_hits=0\nfeed_summary=0\nfilter_tags=\nfilter_attritbutes=\n\n', 1),
(21, 'Configuration Manager', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Installation Manager', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Language Manager', '', 0, 0, '', 'Languages', 'com_languages', 0, '', 1, '', 1),
(24, 'Mass mail', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Menu Editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Messaging', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Modules Manager', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Plugin Manager', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Template Manager', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'User Manager', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=1\n\n', 1),
(32, 'Cache Manager', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Control Panel', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1),
(36, 'Hello!', 'option=com_hello', 0, 0, 'option=com_hello', 'Hello!', 'com_hello', 0, 'js/ThemeOffice/component.png', 0, '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `jos_contact_details`
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `jos_contact_details`
--

INSERT INTO `jos_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`) VALUES
(1, 'Name', 'name', 'Position', 'Street', 'Suburb', 'State', 'Country', 'Zip Code', 'Telephone', 'Fax', 'Miscellanous info', 'powered_by.png', 'top', 'email@email.com', 1, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\r\nshow_position=1\r\nshow_email=0\r\nshow_street_address=1\r\nshow_suburb=1\r\nshow_state=1\r\nshow_postcode=1\r\nshow_country=1\r\nshow_telephone=1\r\nshow_mobile=1\r\nshow_fax=1\r\nshow_webpage=1\r\nshow_misc=1\r\nshow_image=1\r\nallow_vcard=0\r\ncontact_icons=0\r\nicon_address=\r\nicon_email=\r\nicon_telephone=\r\nicon_fax=\r\nicon_misc=\r\nshow_email_form=1\r\nemail_description=1\r\nshow_email_copy=1\r\nbanned_email=\r\nbanned_subject=\r\nbanned_text=', 0, 12, 0, '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `jos_content`
--

CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title_alias` varchar(255) NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT '1',
  `parentid` int(11) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Дамп данных таблицы `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(2, 'Newsflash 1', 'newsflash-1', '', '<p>פריט יוגה החדשות לחדשות בדיקות לגלול</p>\r\n<p>\r\n', '\r\n</p>', 1, 1, 0, 3, '2008-08-10 06:30:34', 62, '', '2010-11-18 23:13:09', 62, 0, '0000-00-00 00:00:00', '2004-08-09 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 14, 0, 1, '', '', 0, 2, 'robots=\nauthor='),
(46, 'קורסים', 'courses', '', '<p><img src="images/stories/article_image.jpg" border="0" title="Featured Image" style="border: 0; float: left;" />המשימה שלנו כמורים ליוגה היא ללמד את כל בני האדם תרגול יוגה אישי המותאם לגילם ומצבם הבריאותי להענקת בריאות, שיפור באיכות החיים ושלום פנימי. היוגה הינה השיטה העתיקה ביותר הידועה לאדם למימוש הפוטנציאל הגבוה ביותר המצוי בנו. מחקרים מדעיים מאשרים שהיוגה עוזרת תמיד, מעוררת ומחזקת את כוחות הריפוי המצויים בגוף. היוגה מרפאה, משפרת את מצב הרוח, את היכולות המנטאליות ואת המצב הרגשי. היא עוזרת בתחזוק הגוף ומהווה רפואה מונעת וכלי לריפוי. היא מעניקה למתרגלים אותה שחרור מסבל קיומי ותובנות עמוקות ביותר של החיים בחוויה ישירה. היוגה אינה סוג של דת ונותנת חופש לכל אחד להחליט על אמונתו ובחירותיו בחיים.</p>\r\n<p>היוגה יכולה להעניק לך שחרור מכאבים כרוניים, תפקוד טוב של גוף ונפש, שיפור יכולות תנועה, הורדת לחץ, מתחים, חרדות וכעסים. היוגה משפרת זיכרון, מחזקת ריכוז ויכולות בינאישיות. אנו מאמינים ורואים בעבודתנו שיוגה עוזרת לכל אחד. אנו גם מאמינים שתרגול יומי של יוגה מותאמת, מספר דקות בכל ביום מביא שיפור עצום לחיים.</p>\r\n<p>במידה ואתה או את סובלים מבעיה רפואית כלשהי, נפשית או גופנית, נמצאים במצב בריאותי שיש בו סבל,  ליוגה שאנו מלמדים בטיפולית אונליין יש מה להציע. אנו רוצים ללמד אתכם לתרגל בבית ולא להיות תלויים בתרופות ובפחדים. אנו רוצים ללמד אתכם לעזור לעצמכם בעצמכם באמצעות שיטה טבעית ופשוטה לביצוע בבית שלכם.</p>\r\n<p>למידע נוסף על תוכניות הטיפול השונות בטיפולית אונליין &gt;&gt;</p>\r\n<p>למידע על מרכז הלמידה &gt;&gt;</p>\r\n<p>לעדויות על כוח היוגה בריפוי ושיפור הבריאות &gt;&gt;</p>\r\n<p>ליצירת קשר עימנו &gt;&gt;</p>', '', 1, 1, 0, 916, '2010-11-22 07:03:00', 62, '', '2010-11-23 11:03:01', 62, 0, '0000-00-00 00:00:00', '2010-11-22 07:03:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 4, '', '', 0, 145, 'robots=\nauthor='),
(3, 'Newsflash 2', 'newsflash-2', '', '<p>פריט יוגה החדשות לחדשות בדיקות לגלול</p>\r\n<p>\r\n', '\r\n</p>', 1, 1, 0, 3, '2008-08-09 22:30:34', 62, '', '2010-11-18 23:13:19', 62, 0, '0000-00-00 00:00:00', '2004-08-09 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 10, 0, 2, '', '', 0, 1, 'robots=\nauthor='),
(4, 'Newsflash 3', 'newsflash-3', '', '<p>פריט יוגה החדשות לחדשות בדיקות לגלול</p>\r\n<p>\r\n', '\r\n</p>', 1, 1, 0, 3, '2008-08-10 06:30:34', 62, '', '2010-11-18 23:13:29', 62, 0, '0000-00-00 00:00:00', '2004-08-09 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 10, 0, 3, '', '', 0, 2, 'robots=\nauthor='),
(47, 'המשימה שלנו ', 'our-mission', '', '<p>Donec pulvinar augue nec neque lacinia rhoncus. Phasellus ac tellus  vitae augue sagittis vulputate id ut enim. Integer tortor nibh, mollis  et vehicula sed, cursus sit amet nulla. Nullam a tortor nibh.  Pellentesque habitant morbi tristique senectus et netus et malesuada  fames ac turpis egestas. Proin velit nibh, accumsan eu suscipit in,  tempus sit amet massa. Nulla facilisi. Morbi varius gravida mattis.  Quisque ac libero libero, et sagittis diam. Nam consectetur fermentum  risus nec consequat. Ut eu dui elit. Integer aliquam facilisis libero, a  vulputate diam laoreet ut. Aliquam erat volutpat. Curabitur nulla quam,  sodales laoreet euismod a, molestie quis tellus. Etiam tincidunt  aliquam dui, et tincidunt nunc lacinia eu. Nam consectetur elit massa.  Ut nibh quam, convallis quis rhoncus sit amet, tempus ut risus. Nullam  malesuada lacus in quam molestie ultrices. Cras iaculis luctus velit, id  semper nisl molestie mattis.</p>\r\n<p>Donec ante lectus, placerat nec molestie sed, hendrerit a mi. Integer  nec lacus eros. Nam sit amet faucibus enim. Ut eu felis felis, ut  tristique libero. Aliquam rhoncus purus at risus fermentum eget porta  elit porta. Quisque consequat dapibus mattis. Phasellus blandit, urna in  consectetur pellentesque, odio eros porttitor felis, ac consequat enim  diam nec ligula. Nam eu sem ac enim tristique laoreet vel eu ipsum.  Fusce quis magna nunc, nec molestie purus. Vestibulum ante ipsum primis  in faucibus orci luctus et ultrices posuere cubilia Curae; Donec  bibendum nisi vitae erat euismod sed egestas enim pulvinar. Nunc eget  dolor neque, a commodo mi. Phasellus tempor orci eget ipsum tempor quis  tincidunt mauris vehicula. Integer justo lorem, vehicula a porttitor ac,  imperdiet in sem. Etiam blandit metus tortor. In tellus massa,  convallis quis fringilla dictum, iaculis non arcu. Duis commodo nisl eu  erat iaculis aliquam. Cum sociis natoque penatibus et magnis dis  parturient montes, nascetur ridiculus mus.</p>', '', 1, 1, 0, 916, '2010-11-22 07:04:35', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2010-11-22 07:04:35', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 22, 'robots=\nauthor='),
(48, 'אודות', 'about', '', '<p>Donec ante lectus, placerat nec molestie sed, hendrerit a mi. Integer  nec lacus eros. Nam sit amet faucibus enim. Ut eu felis felis, ut  tristique libero. Aliquam rhoncus purus at risus fermentum eget porta  elit porta. Quisque consequat dapibus mattis. Phasellus blandit, urna in  consectetur pellentesque, odio eros porttitor felis, ac consequat enim  diam nec ligula. Nam eu sem ac enim tristique laoreet vel eu ipsum.  Fusce quis magna nunc, nec molestie purus. Vestibulum ante ipsum primis  in faucibus orci luctus et ultrices posuere cubilia Curae; Donec  bibendum nisi vitae erat euismod sed egestas enim pulvinar. Nunc eget  dolor neque, a commodo mi. Phasellus tempor orci eget ipsum tempor quis  tincidunt mauris vehicula. Integer justo lorem, vehicula a porttitor ac,  imperdiet in sem. Etiam blandit metus tortor. In tellus massa,  convallis quis fringilla dictum, iaculis non arcu. Duis commodo nisl eu  erat iaculis aliquam. Cum sociis natoque penatibus et magnis dis  parturient montes, nascetur ridiculus mus</p>', '', 1, 1, 0, 916, '2010-11-22 07:05:26', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2010-11-22 07:05:26', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 18, 'robots=\nauthor='),
(49, 'מרכז הלמידה', 'learning-center', '', '<p>hasellus blandit, urna in consectetur pellentesque, odio eros  porttitor felis, ac consequat enim diam nec ligula. Nam eu sem ac enim  tristique laoreet vel eu ipsum. Fusce quis magna nunc, nec molestie  purus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices  posuere cubilia Curae; Donec bibendum nisi vitae erat euismod sed  egestas enim pulvinar. Nunc eget dolor neque, a commodo mi. Phasellus  tempor orci eget ipsum tempor quis tincidunt mauris vehicula. Integer  justo lorem, vehicula a porttitor ac, imperdiet in sem. Etiam blandit  metus tortor. In tellus massa, convallis quis fringilla dictum, iaculis  non arcu. Duis commodo nisl eu erat iaculis aliquam. Cum sociis natoque  penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\r\n<p>Sed sed auctor eros. Etiam condimentum dui nec magna pretium pharetra  porttitor lacus faucibus. Aenean id arcu velit. Nam nisi purus,  vestibulum et laoreet adipiscing, aliquet sed justo. Aenean nibh neque,  placerat ut pretium ut, vulputate consectetur massa. Aenean eget erat  magna, eget commodo eros. Nunc et orci tortor. Nulla id quam nec arcu  dictum accumsan. Ut et rutrum leo. Curabitur pharetra, dui in  sollicitudin volutpat, nulla massa tristique orci, sit amet consectetur  erat magna at diam. Etiam laoreet nibh imperdiet sapien venenatis  sagittis. Donec at dignissim urna. Mauris dictum risus in nibh fermentum  dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam  lectus risus, consectetur sed pulvinar vitae, euismod vel mi. Nunc  mattis pretium risus et mattis. Duis varius ipsum sed felis laoreet sit  amet blandit tortor semper. Nam faucibus consequat felis non  condimentum. Nulla aliquam, ipsum ac congue ultrices, nulla enim  bibendum velit, id volutpat nisi neque in mi. Donec ultricies ipsum non  magna adipiscing bibendum.</p>\r\n<p>Curabitur iaculis iaculis justo, eget laoreet nisi tincidunt eget.  Aliquam erat volutpat. Nam quam urna, pharetra nec fringilla eget,  rutrum ac tellus. Donec in lectus in urna pharetra mollis. Aliquam erat  volutpat. Duis posuere elit id est vehicula pulvinar ut ut quam.  Vestibulum fermentum arcu fringilla orci cursus aliquet. Suspendisse  porta, velit sit amet dictum faucibus, urna mauris bibendum elit, ac  facilisis elit urna a nisl. Aliquam in tellus non urna placerat tempor  et eget orci. Nullam placerat risus lectus, id tempor libero. Sed ut  aliquam enim. Praesent commodo, justo at scelerisque commodo, nisi mi  molestie purus, at blandit ante turpis quis nunc. Aenean vulputate  laoreet ante a tincidunt.</p>', '', 1, 1, 0, 916, '2010-11-22 07:06:39', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2010-11-22 07:06:39', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 49, 'robots=\nauthor='),
(41, 'Newsflash 5', 'newsflash-5', '', '<p>פריט יוגה החדשות לחדשות בדיקות לגלול</p>\r\n<p>\r\n', '\r\n</p>', 1, 1, 0, 3, '2010-11-18 00:00:00', 62, '', '2010-11-18 23:13:50', 62, 0, '0000-00-00 00:00:00', '2010-11-18 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 13, 0, 5, '', '', 0, 5, 'robots=\nauthor='),
(42, 'Newsflash 4', 'newsflash-4', '', '<p>פריט יוגה החדשות לחדשות בדיקות לגלול</p>\r\n<p>\r\n', '\r\n</p>', 1, 1, 0, 3, '2008-08-12 00:25:50', 62, '', '2010-11-18 23:13:41', 62, 0, '0000-00-00 00:00:00', '2006-10-11 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 12, 0, 4, '', '', 0, 6, 'robots=\nauthor=');

-- --------------------------------------------------------

--
-- Структура таблицы `jos_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jos_content_frontpage`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_content_rating`
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jos_content_rating`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_core_acl_aro`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_value` varchar(240) NOT NULL DEFAULT '0',
  `value` varchar(240) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0),
(11, 'users', '63', 0, 'anton', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `jos_core_acl_aro_groups`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Дамп данных таблицы `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Структура таблицы `jos_core_acl_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(230) NOT NULL DEFAULT '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jos_core_acl_aro_map`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_core_acl_aro_sections`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(230) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `jos_core_acl_groups_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(240) NOT NULL DEFAULT '',
  `aro_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(18, '', 11),
(25, '', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `jos_core_log_items`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL DEFAULT '0000-00-00',
  `item_table` varchar(50) NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jos_core_log_items`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jos_core_log_searches`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_extending_field_list`
--

CREATE TABLE IF NOT EXISTS `jos_extending_field_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `validate` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `size` int(11) NOT NULL DEFAULT '30',
  `size_vertical` int(11) NOT NULL DEFAULT '10',
  `uvalues` text NOT NULL,
  `table_align` varchar(50) NOT NULL DEFAULT '',
  `changeable` tinyint(1) NOT NULL DEFAULT '1',
  `unique_field` tinyint(1) NOT NULL DEFAULT '0',
  `search_by_this_field` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(250) NOT NULL DEFAULT '',
  `valid_error_msg` varchar(250) NOT NULL DEFAULT '',
  `count_cols` int(6) NOT NULL DEFAULT '0',
  `show_at_reg` tinyint(1) NOT NULL DEFAULT '1',
  `show_at_edit` tinyint(1) NOT NULL DEFAULT '1',
  `display_at_users_list` int(11) NOT NULL DEFAULT '1',
  `ordering` int(6) NOT NULL DEFAULT '0',
  `alternative_value` int(6) NOT NULL DEFAULT '0',
  `default_value` text NOT NULL,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `catid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `jos_extending_field_list`
--

INSERT INTO `jos_extending_field_list` (`id`, `title`, `published`, `required`, `validate`, `type`, `size`, `size_vertical`, `uvalues`, `table_align`, `changeable`, `unique_field`, `search_by_this_field`, `description`, `valid_error_msg`, `count_cols`, `show_at_reg`, `show_at_edit`, `display_at_users_list`, `ordering`, `alternative_value`, `default_value`, `access`, `checked_out`, `checked_out_time`, `catid`) VALUES
(1, 'Age: ', 1, 1, '', 'select', 0, 0, '18-25\r\n26-35\r\n36-45\r\n46-55\r\n56-65\r\n66-75\r\n75-85\r\n86-95\r\n96-105\r\n106-115', '', 1, 0, 0, '', '', 0, 1, 1, 1, 1, 0, '', 0, 0, '0000-00-00 00:00:00', 900),
(2, 'Country: ', 1, 1, '', 'select', 0, 0, 'Afghanistan\r\nAlbania\r\nAlgeria\r\nAmerican Samoa\r\nAndorra\r\nAngola\r\nAnguilla\r\nAntigua\r\nAntilles\r\nArgentina\r\nArmenia\r\nAruba\r\nAscension Island\r\nAustralia\r\nAustria\r\nAzerbaijan\r\nBahamas\r\nBahrain\r\nBangladesh\r\nBarbados\r\nBarbuda\r\nBelarus\r\nBelgium\r\nBelize\r\nBenin\r\nBermuda\r\nBhutan\r\nBolivia\r\nBotswana\r\nBrazil\r\nBrunei\r\nBulgaria\r\nBurkina Faso\r\nBurundi\r\nCambodia\r\nCameroon\r\nCanada\r\nCanary Islands\r\nCayman Islands\r\nChad\r\nChile, Rep. of\r\nChina\r\nChristmas Island\r\nColombia\r\nComoros\r\nCook Islands\r\nCosta Rica\r\nCroatia\r\nCuba\r\nCyprus\r\nCzech Rep.\r\nDenmark\r\nDiego Garcia\r\nDjibouti\r\nDominica\r\nDominican Rep.\r\nEcuador\r\nEgypt\r\nEl Salvador\r\nEritrea\r\nEstonia\r\nEthiopia\r\nFaeroe Islands\r\nFalkland Islands\r\nFiji\r\nFinland\r\nFrance\r\nFrench Antilles\r\nFrench Guiana\r\nFrench Polynesia\r\nGabon\r\nGambia\r\nGeorgia\r\nGermany\r\nGhana\r\nGibraltar\r\nGreece\r\nGreenland\r\nGrenada\r\nGuadeloupe\r\nGuatemala\r\nGuinea\r\nGuinea-Bissau\r\nGuyana\r\nHaiti\r\nHonduras\r\nHong Kong\r\nHungary\r\nIceland\r\nIndia\r\nIndonesia\r\nIraq\r\nIreland\r\nIsrael\r\nItaly\r\nJamaica\r\nJapan\r\nJordan\r\nKazakhstan\r\nKenya\r\nKiribati\r\nKorea, North\r\nKorea, South\r\nKuwait\r\nKyrgyzstan\r\nLaos\r\nLatvia\r\nLebanon\r\nLesotho\r\nLiberia\r\nLiechtenstein\r\nLithuania\r\nLuxembourg\r\nMacau\r\nMadagascar\r\nMalawi\r\nMalaysia\r\nMaldives\r\nMali\r\nMalta\r\nMarshall Islands\r\nMartinique\r\nMauritania\r\nMauritius\r\nMayotte Island\r\nMexico\r\nMoldova, Rep. of\r\nMonaco\r\nMongolia\r\nMontserrat\r\nMorocco\r\nMozambique\r\nMyanmar\r\nNamibia\r\nNauru\r\nNepal\r\nNetherlands\r\nNevis\r\nNew Caledonia\r\nNew Zealand\r\nNicaragua\r\nNiger\r\nNigeria\r\nNiue\r\nNorfolk Island\r\nNorway\r\nOman\r\nPakistan\r\nPalau\r\nPanama\r\nPapua New Guinea\r\nParaguay\r\nPeru\r\nPhilippines\r\nPoland\r\nPortugal\r\nPuerto Rico\r\nQatar\r\nReunion Island\r\nRomania\r\nRota Island\r\nRussia\r\nRwanda\r\nSaint Lucia\r\nSaipan Island\r\nSan Marino\r\nSaudi Arabia\r\nScotland\r\nSenegal\r\nSeychelles\r\nSierra Leone\r\nSingapore\r\nSlovakia\r\nSlovenia\r\nSolomon Islands\r\nSomalia\r\nSouth Africa\r\nSpain\r\nSri Lanka\r\nSt. Helena\r\nSt. Kitts\r\nSudan\r\nSuriname\r\nSwaziland\r\nSweden\r\nSwitzerland\r\nSyrian Arab Rep.\r\nTaiwan\r\nTajikistan\r\nTanzania\r\nThailand\r\nTinian Island\r\nTogo\r\nTokelau\r\nTonga\r\nTunisia\r\nTurkey\r\nTurkmenistan\r\nTuvalu\r\nUganda\r\nUkraine\r\nUnited Kingdom\r\nUruguay\r\nUSA\r\nUzbekistan\r\nVanuatu\r\nVatican City\r\nVenezuela\r\nViet Nam\r\nWales\r\nWestern Samoa\r\nYemen\r\nYugoslavia\r\nZambia\r\nZimbabwe', '', 1, 0, 0, '', '', 0, 1, 1, 1, 2, 0, '', 0, 0, '0000-00-00 00:00:00', 900),
(3, 'Occupation: ', 1, 1, '', 'select', 0, 0, 'Aircraft pilot (private)\r\nComputer programming, information technology, etc.\r\nDentist\r\nEngineer or computer scientist\r\nFarming, ranching, forestry, or fishing\r\nInternet programming, web design, ISP, webmaster, etc.\r\nMilitary (Army, Marines, Air Force or other special corps)\r\nNurse, nursing, or similar health caretaker\r\nPharmacist\r\nProfessor, instructor or teacher in college/university\r\nStock broker, stock analyst, investment analyst\r\nStudent\r\nOther occupation', '', 1, 0, 0, '', '', 0, 1, 1, 1, 3, 0, '', 0, 0, '0000-00-00 00:00:00', 900),
(4, 'Time set: ', 1, 1, '', 'select', 0, 0, '(GMT -12:00) Eniwetok, Kwajalein\r\n(GMT -11:00) Midway Island, Samoa\r\n(GMT -10:00) Hawaii\r\n(GMT -9:00) Alaska\r\n(GMT -8:00) Pacific Time (US & Canada)\r\n(GMT -7:00) Mountain Time (US & Canada)\r\n(GMT -6:00) Central Time (US & Canada), Mexico City\r\n(GMT -5:00) Eastern Time (US & Canada), Bogota, Lima\r\n(GMT -4:00) Atlantic Time (Canada), Caracas, La Paz\r\n(GMT -3:30) Newfoundland\r\n(GMT -3:00) Brazil, Buenos Aires, Georgetown\r\n(GMT -2:00) Mid-Atlantic\r\n(GMT -1:00) Azores, Cape Verde Islands\r\n(GMT) Western Europe Time, London, Lisbon, Casablanca\r\n(GMT +1:00) Brussels, Copenhagen, Madrid, Paris\r\n(GMT +2:00) Kaliningrad, South Africa\r\n(GMT +3:00) Baghdad, Riyadh, Moscow, St. Petersburg\r\n(GMT +3:30) Tehran\r\n(GMT +4:00) Abu Dhabi, Muscat, Baku, Tbilisi\r\n(GMT +4:30) Kabul\r\n(GMT +5:00) Ekaterinburg, Islamabad, Karachi, Tashkent\r\n(GMT +5:30) Bombay, Calcutta, Madras, New Delhi\r\n(GMT +6:00) Almaty, Dhaka, Colombo\r\n(GMT +7:00) Bangkok, Hanoi, Jakarta\r\n(GMT +8:00) Beijing, Perth, Singapore, Hong Kong\r\n(GMT +9:00) Tokyo, Seoul, Osaka, Sapporo, Yakutsk\r\n(GMT +9:30) Adelaide, Darwin\r\n(GMT +10:00) Eastern Australia, Guam, Vladivostok\r\n(GMT +11:00) Magadan, Solomon Islands, New Caledonia\r\n(GMT +12:00) Auckland, Wellington, Fiji, Kamchatka', '', 1, 0, 0, '', '', 0, 1, 1, 1, 4, 0, '', 0, 0, '0000-00-00 00:00:00', 900),
(5, 'State: ', 1, 1, '', 'select', 0, 0, 'Alaska\r\nArizona\r\nArkansas\r\nCalifornia\r\nColorado\r\nConnecticut\r\nDelaware\r\nDistrict of Columbia\r\nFlorida\r\nGeorgia\r\nHawaii\r\nIdaho\r\nIllinois\r\nIndiana\r\nIowa\r\nKansas\r\nKentucky\r\nLouisiana\r\nMaine\r\nMaryland\r\nMassachusetts\r\nMichigan\r\nMinnesota\r\nMississippi\r\nMissouri\r\nMontana\r\nNebraska\r\nNevada\r\nNew Hampshire\r\nNew Jersey\r\nNew Mexico\r\nNew York\r\nNorth Carolina\r\nNorth Dakota\r\nOhio\r\nOklahoma\r\nOregon\r\nPennsylvania\r\nRhode Island\r\nSouth Carolina\r\nSouth Dakota\r\nTennessee\r\nTexas\r\nUtah\r\nVermont\r\nVirginia\r\nWashington\r\nWest Virginia\r\nWisconsin\r\nWyoming', '', 1, 0, 0, '', '', 0, 1, 1, 1, 5, 0, '', 0, 0, '0000-00-00 00:00:00', 900);

-- --------------------------------------------------------

--
-- Структура таблицы `jos_groups`
--

CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Структура таблицы `jos_je_config`
--

CREATE TABLE IF NOT EXISTS `jos_je_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `component` varchar(30) NOT NULL DEFAULT '',
  `section` varchar(45) NOT NULL DEFAULT '',
  `lable` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(45) NOT NULL DEFAULT '',
  `type` set('selectlist','yesno','dropdown','text','textarea','page','directory','sections','static_content','categories_multiple') NOT NULL,
  `description` tinytext NOT NULL,
  `values` tinytext NOT NULL,
  `selected` tinytext NOT NULL,
  `hidden` enum('Y','N') NOT NULL DEFAULT 'N',
  `fieldset` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Дамп данных таблицы `jos_je_config`
--

INSERT INTO `jos_je_config` (`id`, `component`, `section`, `lable`, `name`, `type`, `description`, `values`, `selected`, `hidden`, `fieldset`) VALUES
(1, 'com_juser', 'general', 'Required field', 'required_field', 'selectlist', 'Mark required fields', 'bold, sign *, border,underline', 'sign *', 'N', 'Field list'),
(2, 'com_juser', 'general', 'Required color', 'required_color', 'text', 'Required color', '', '', 'N', 'Field list'),
(3, 'com_juser', 'general', 'Title position', 'title_position', 'selectlist', 'Title position', 'Over field, On the left', 'On the left', 'N', 'Field list'),
(4, 'com_juser', 'general', 'Registraton policy', 'registraton_policy', 'page', 'Registraton policy', '', '5', 'N', 'Field list'),
(5, 'com_juser', 'general', 'Registraton policy display type', 'registraton_policy_display_type', 'selectlist', 'Registraton policy display type', 'Link, Text, ScrollText', 'ScrollText', 'N', 'Field list'),
(6, 'com_juser', 'general', 'Uploaded file directory', 'uploaded_file_directory', 'directory', 'Uploaded file directory', '/administrator/components/com_juser/files/', 'C:wampwww\retipulit/administrator/components/com_juser/files/', 'N', 'Uploaded file'),
(7, 'com_juser', 'general', 'Allowed extends', 'allowed_extends', 'textarea', 'Allowed extends', '', 'jpg\r\npng\r\ngif', 'N', 'Uploaded file'),
(8, 'com_juser', 'general', 'Newsletters Categories', 'newsletters_categories', 'categories_multiple', 'Newsletters Categories', 'Over field, On the left', '', 'N', 'News Letters'),
(9, 'com_juser', 'general', 'Show users list', 'show_users_list', 'yesno', 'Show users list', '', '0', 'N', 'Users List'),
(10, 'com_juser', 'general', 'Cards on one page', 'count_cards', 'dropdown', 'Cards on one page', '5, 10, 15, 20, 25, 30, 50', '5', 'N', 'Users List'),
(11, 'com_juser', 'general', 'Show name', 'show_name_at_userlist', 'yesno', 'Show name', '', '0', 'N', 'Users List'),
(12, 'com_juser', 'general', 'Show Email', 'show_email_at_userlist', 'yesno', 'Show Email', '', '0', 'N', 'Users List'),
(13, 'com_juser', 'general', 'Show Data Registration', 'show_reg_date_at_userlist', 'yesno', 'Show Data Registration', '', '1', 'N', 'Users List'),
(14, 'com_juser', 'general', 'Show Last Visit', 'show_last_visit_at_userlist', 'yesno', 'Show Last Visit', '', '1', 'N', 'Users List'),
(15, 'com_juser', 'general', 'Show User Type', 'show_usertype_at_userlist', 'yesno', 'Show User Type', '', '1', 'N', 'Users List'),
(16, 'com_juser', 'general', 'Show Avatar', 'show_avatar_at_userlist', 'yesno', 'Show Avatar', '', '1', 'N', 'Users List'),
(17, 'com_juser', 'general', 'Enable avatar', 'enable_avatar', 'yesno', 'Enable avatar', '', '0', 'N', 'Avatar'),
(18, 'com_juser', 'general', 'Required avatar', 'required_avatar', 'yesno', 'Required avatar', '', '0', 'N', 'Avatar'),
(19, 'com_juser', 'general', 'Max size (pixels)', 'max_size', 'dropdown', 'Max size (pixels)', '80, 90,100,110,120,130,140,150', '100', 'N', 'Avatar'),
(20, 'com_juser', 'general', 'Uploaded Avatar Directory', 'uploaded_avatar_directory', 'directory', 'Uploaded Avatar Directory', '/images/', 'C:wampwww\retipulit/images/stories/Avatars/juser_avatars/', 'N', 'Avatar'),
(21, 'com_juser', 'general', 'Allowed extends', 'avatar_allowed_extends', 'textarea', 'Allowed extends', '', 'jpg\r\npng\r\ngif', 'N', 'Avatar'),
(22, 'com_juser', 'general', 'Show search filter', 'filters_show_search', 'yesno', 'Show search filter', ' ', '1', 'N', 'User Filters'),
(23, 'com_juser', 'general', 'Show core filters', 'filters_show_corefilters', 'yesno', 'Show core filters', ' ', '1', 'N', 'User Filters'),
(24, 'com_juser', 'general', 'Show additional filters', 'filters_show_additionalfilters', 'yesno', 'Show additional filters', ' ', '1', 'N', 'User Filters'),
(25, 'com_juser', 'general', 'Manual activation user', 'activationuser_manual', 'yesno', 'Manual activation user', ' ', '0', 'N', 'Activation Users'),
(26, 'com_juser', 'general', 'Content after registration', 'content_after_registration', 'static_content', 'Static content, which show after user registration', ' ', '0', 'N', 'User Registration'),
(27, 'com_juser', 'general', 'Count chars in captcha', 'count_chars_captcha', 'selectlist', 'Count chars in captcha', '4, 5, 6, 7, 8, 9, 10', '4', 'N', 'Captcha'),
(28, 'com_juser', 'general', 'Character set', 'captcha_character_set', 'selectlist', 'Character set', 'letters and numerals, letters only, numerals only', 'letters and numerals', 'N', 'Captcha'),
(29, 'com_juser', 'general', 'Captcha on/off', 'captcha_on', 'yesno', 'Captcha on/off', '', '1', 'N', 'Captcha'),
(30, 'com_juser', 'general', 'Date format', 'date_format', 'selectlist', 'Date format', 'YYYY-MM-DD, YYYY-DD-MM, MM-DD-YYYY, MM-YYYY-DD, DD-MM-YYYY, DD-YYYY-MM', 'YYYY-MM-DD', 'N', 'Other'),
(31, 'com_juser', 'general', 'Newsletters Sections', 'newsletters_sections', 'sections', '', '', '', 'N', 'News Letters'),
(32, 'com_juser', 'general', 'Allowed extends', 'avatar_allowed_extendstory', 'textarea', '', 'jpg\r\ngif\r\npng', '', 'N', 'Avatar');

-- --------------------------------------------------------

--
-- Структура таблицы `jos_juser_integration`
--

CREATE TABLE IF NOT EXISTS `jos_juser_integration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(50) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `export_status` int(11) NOT NULL DEFAULT '0',
  `import_status` int(11) NOT NULL DEFAULT '0',
  `integration_data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `jos_juser_integration`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_juser_integration_cash`
--

CREATE TABLE IF NOT EXISTS `jos_juser_integration_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `component_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `mdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `jos_juser_integration_cash`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_juser_integration_comparisons`
--

CREATE TABLE IF NOT EXISTS `jos_juser_integration_comparisons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ident` text NOT NULL,
  `name` text NOT NULL,
  `component_id` int(11) NOT NULL DEFAULT '0',
  `juser_field_id` int(11) NOT NULL DEFAULT '0',
  `static_juser_field` text NOT NULL,
  `default_value` text NOT NULL,
  `integrate` varchar(30) NOT NULL DEFAULT '0',
  `m_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `jos_juser_integration_comparisons`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_juser_users_additional_data`
--

CREATE TABLE IF NOT EXISTS `jos_juser_users_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `avatar` text NOT NULL,
  `email_valid` int(11) DEFAULT NULL,
  `mtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `jos_juser_users_additional_data`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_menu`
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text,
  `type` varchar(50) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `componentid` int(11) unsigned NOT NULL DEFAULT '0',
  `sublevel` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL DEFAULT '0',
  `browserNav` tinyint(4) DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `utaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL DEFAULT '0',
  `rgt` int(11) unsigned NOT NULL DEFAULT '0',
  `home` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- Дамп данных таблицы `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'טיפולית אונליין', 'home', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 12, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'num_leading_articles=0\nnum_intro_articles=0\nnum_columns=1\nnum_links=1\norderby_pri=\norderby_sec=front\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\npage_title=Welcome to the Frontpage\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 1),
(2, 'mainmenu', 'Joomla! License', 'joomla-license', 'index.php?option=com_content&view=article&id=5', 'component', -2, 0, 20, 0, 14, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(41, 'mainmenu', 'FAQ', 'faq', 'index.php?option=com_content&view=section&id=3', 'component', -2, 0, 20, 0, 13, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\nshow_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby=\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1', 0, 0, 0),
(11, 'othermenu', 'Joomla! Home', 'joomla-home', 'http://www.joomla.org', 'url', -2, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(12, 'othermenu', 'Joomla! Forums', 'joomla-forums', 'http://forum.joomla.org', 'url', -2, 0, 0, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(13, 'othermenu', 'Joomla! Documentation', 'joomla-documentation', 'http://docs.joomla.org', 'url', -2, 0, 0, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(14, 'othermenu', 'Joomla! Community', 'joomla-community', 'http://community.joomla.org', 'url', -2, 0, 0, 0, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(15, 'othermenu', 'Joomla! Magazine', 'joomla-community-magazine', 'http://magazine.joomla.org/', 'url', -2, 0, 0, 0, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(16, 'othermenu', 'OSM Home', 'osm-home', 'http://www.opensourcematters.org', 'url', -2, 0, 0, 0, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 6, 'menu_image=-1\n\n', 0, 0, 0),
(17, 'othermenu', 'Administrator', 'administrator', 'administrator/', 'url', -2, 0, 0, 0, 10, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(18, 'usermenu', 'כניסה למערכת', 'login', 'index.php?option=com_user&view=login', 'component', 1, 0, 14, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'show_login_title=1\nheader_login=כניסה למערכת\nlogin=\nlogin_message=0\ndescription_login=0\ndescription_login_text=\nimage_login=\nimage_login_align=right\nshow_logout_title=1\nheader_logout=\nlogout=\nlogout_message=1\ndescription_logout=1\ndescription_logout_text=\nimage_logout=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(27, 'mainmenu', 'Joomla! Overview', 'joomla-overview', 'index.php?option=com_content&view=article&id=19', 'component', -2, 0, 20, 0, 11, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(28, 'usermenu', 'שכחתי סיסמא', 'forgot-password', 'index.php?option=com_user&view=reset', 'component', 1, 0, 14, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(29, 'usermenu', 'התנתק', 'logout', 'index.php?option=com_user&task=logout&return=aW5kZXgucGhw', 'url', 1, 0, 0, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 'menu_image=-1\n\n', 0, 0, 0),
(30, 'usermenu', 'The Community', 'the-community', 'index.php?option=com_content&view=article&id=27', 'component', -2, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(34, 'mainmenu', 'What''s New in 1.5?', 'what-is-new-in-1-5', 'index.php?option=com_content&view=article&id=22', 'component', -2, 0, 20, 1, 10, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(64, 'hiddenmenu', 'צרו קשר', 'contact-us', 'index.php?option=com_contact&view=contact&id=1', 'component', 1, 0, 7, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_contact_list=0\nshow_category_crumb=0\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(37, 'mainmenu', 'More about Joomla!', 'more-about-joomla', 'index.php?option=com_content&view=section&id=4', 'component', -2, 0, 20, 0, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\nshow_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby=\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1', 0, 0, 0),
(53, 'footermenu', 'כל הזכויות שמורות', 'link1', 'index.php', 'url', 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(54, 'footermenu', 'תקנון', 'link2', 'index.php', 'url', 1, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(55, 'footermenu', 'טיפולית אונליין', 'link3', 'index.php', 'url', 1, 0, 0, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(56, 'mainmenu', 'קורסים', 'courses', 'index.php?option=com_content&view=article&id=46', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(57, 'mainmenu', 'מצבים בריאותיים', 'health-condition', 'index.php?option=com_content&view=section&id=5', 'component', 1, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=1\nshow_cat_num_articles=0\nshow_category_description=0\norderby=\norderby_sec=\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx= health_page\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(58, 'mainmenu', 'המשימה שלנו', 'our-misson', 'index.php?option=com_content&view=article&id=47', 'component', 1, 0, 20, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(59, 'mainmenu', 'אודות', 'about', 'index.php?option=com_content&view=article&id=48', 'component', 1, 0, 20, 0, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(60, 'mainmenu', 'מרכז הלמידה', 'learning-center', 'index.php?option=com_content&view=article&id=49', 'component', 1, 0, 20, 0, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(61, 'othermenu', 'שכחתי סיסמא', 'forgot-password', 'index.php?option=com_user&view=reset', 'component', 1, 0, 14, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(62, 'othermenu', 'התנתק', 'logout', 'index.php?option=com_user&task=logout&return=aW5kZXgucGhw', 'url', 1, 0, 0, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 'menu_image=-1\n\n', 0, 0, 0),
(63, 'othermenu', 'כניסה למערכת', 'login', 'index.php?option=com_user&view=login', 'component', 1, 0, 14, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_login_title=1\nheader_login=כניסה למערכת\nlogin=\nlogin_message=0\ndescription_login=0\ndescription_login_text=אתה יכול להתחבר באמצעות כתובת הדוא"ל והסיסמה שלך.\nimage_login=-1\nimage_login_align=right\nshow_logout_title=1\nheader_logout=יצאת החוצה.\nlogout=index.php\nlogout_message=1\ndescription_logout=1\ndescription_logout_text=תודה על הביקור באתר שלנו. בקרו אותנו שוב.\nimage_logout=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(48, 'mainmenu', 'Web Links', 'web-links', 'index.php?option=com_weblinks&view=categories', 'component', -2, 0, 4, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=Weblinks\nimage=-1\nimage_align=right\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 0, 0, 0),
(49, 'mainmenu', 'News Feeds', 'news-feeds', 'index.php?option=com_newsfeeds&view=categories', 'component', -2, 0, 11, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\npage_title=Newsfeeds\nshow_comp_description=1\ncomp_description=\nimage=-1\nimage_align=right\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_other_cats=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 0, 0, 0),
(50, 'mainmenu', 'The News', 'the-news', 'index.php?option=com_content&view=category&layout=blog&id=1', 'component', -2, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\npage_title=The News\nshow_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\nshow_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `jos_menu_types`
--

CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `jos_menu_types`
--

INSERT INTO `jos_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(8, 'hiddenmenu', 'Hidden Menu', 'Menu to be used as hidden links but we need to use this in the site.'),
(3, 'usermenu', 'User Menu', 'User navigation menu'),
(4, 'othermenu', 'Sub Menu', 'Sub Menu Below Main Menu'),
(7, 'footermenu', 'Footer Menu', 'Menu in the footer area.');

-- --------------------------------------------------------

--
-- Структура таблицы `jos_messages`
--

CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(11) NOT NULL DEFAULT '0',
  `priority` int(1) unsigned NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `jos_messages`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jos_messages_cfg`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_migration_backlinks`
--

CREATE TABLE IF NOT EXISTS `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jos_migration_backlinks`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_modules`
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `numnews` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `control` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Дамп данных таблицы `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(1, 'Main Menu', '', 0, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 0, 'menutype=mainmenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 1, 0, ''),
(2, 'Login', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Recent added Articles', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Menu Stats', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 2, 1, '', 0, 1, ''),
(6, 'Unread Messages', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Online Users', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Quick Icons', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Logged in Users', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Admin Menu', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Admin SubMenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'User Status', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'Title', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, ''),
(18, 'כניסה למערכת', '', 0, 'user4', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, 'cache=0\nmoduleclass_sfx= login_box\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=1\nname=0\nusesecure=0\n\n', 1, 0, ''),
(25, 'חדשות טיפולית אונליין', '', 0, 'user5', 0, '0000-00-00 00:00:00', 1, 'mod_newsflash', 0, 0, 1, 'catid=3\nlayout=vert\nimage=0\nlink_titles=\nshowLastSeparator=0\nreadmore=1\nitem_title=0\nitems=5\nmoduleclass_sfx=\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(27, 'Search', '', 2, 'user1', 0, '0000-00-00 00:00:00', 1, 'mod_search', 0, 0, 0, 'moduleclass_sfx=\nwidth=20\ntext=חיפוש\nbutton=1\nbutton_pos=right\nimagebutton=\nbutton_text=\nset_itemid=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(31, 'Sub Menu', '', 0, 'user2', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 0, 'menutype=othermenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(45, 'Footer Menu', '', 3, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 0, 'menutype=footermenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(44, 'Footer Copyright', '<p>תחתונה טקסט כאן <a href="index.php">קישורים כאן</a></p>', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=_footer_copyright\n\n', 0, 0, ''),
(41, 'Welcome to Joomla!', '<div style="padding: 5px">  <p>   Congratulations on choosing Joomla! as your content management system. To   help you get started, check out these excellent resources for securing your   server and pointers to documentation and other helpful resources. </p> <p>   <strong>Security</strong><br /> </p> <p>   On the Internet, security is always a concern. For that reason, you are   encouraged to subscribe to the   <a href="http://feedburner.google.com/fb/a/mailverify?uri=JoomlaSecurityNews" target="_blank">Joomla!   Security Announcements</a> for the latest information on new Joomla! releases,   emailed to you automatically. </p> <p>   If this is one of your first Web sites, security considerations may   seem complicated and intimidating. There are three simple steps that go a long   way towards securing a Web site: (1) regular backups; (2) prompt updates to the   <a href="http://www.joomla.org/download.html" target="_blank">latest Joomla! release;</a> and (3) a <a href="http://docs.joomla.org/Security_Checklist_2_-_Hosting_and_Server_Setup" target="_blank" title="good Web host">good Web host</a>. There are many other important security considerations that you can learn about by reading the <a href="http://docs.joomla.org/Category:Security_Checklist" target="_blank" title="Joomla! Security Checklist">Joomla! Security Checklist</a>. </p> <p>If you believe your Web site was attacked, or you think you have discovered a security issue in Joomla!, please do not post it in the Joomla! forums. Publishing this information could put other Web sites at risk. Instead, report possible security vulnerabilities to the <a href="http://developer.joomla.org/security/contact-the-team.html" target="_blank" title="Joomla! Security Task Force">Joomla! Security Task Force</a>.</p><p><strong>Learning Joomla!</strong> </p> <p>   A good place to start learning Joomla! is the   "<a href="http://docs.joomla.org/beginners" target="_blank">Absolute Beginner''s   Guide to Joomla!.</a>" There, you will find a Quick Start to Joomla!   <a href="http://help.joomla.org/ghop/feb2008/task048/joomla_15_quickstart.pdf" target="_blank">guide</a>   and <a href="http://help.joomla.org/ghop/feb2008/task167/index.html" target="_blank">video</a>,   amongst many other tutorials. The   <a href="http://community.joomla.org/magazine/view-all-issues.html" target="_blank">Joomla!   Community Magazine</a> also has   <a href="http://community.joomla.org/magazine/article/522-introductory-learning-joomla-using-sample-data.html" target="_blank">articles   for new learners</a> and experienced users, alike. A great place to look for   answers is the   <a href="http://docs.joomla.org/Category:FAQ" target="_blank">Frequently Asked   Questions (FAQ)</a>. If you are stuck on a particular screen in the   Administrator (which is where you are now), try clicking the Help toolbar   button to get assistance specific to that page. </p> <p>   If you still have questions, please feel free to use the   <a href="http://forum.joomla.org/" target="_blank">Joomla! Forums.</a> The forums   are an incredibly valuable resource for all levels of Joomla! users. Before   you post a question, though, use the forum search (located at the top of each   forum page) to see if the question has been asked and answered. </p> <p>   <strong>Getting Involved</strong> </p> <p>   <a name="twjs" title="twjs"></a> If you want to help make Joomla! better, consider getting   involved. There are   <a href="http://www.joomla.org/about-joomla/contribute-to-joomla.html" target="_blank">many ways   you can make a positive difference.</a> Have fun using Joomla!.</p></div>', 0, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 2, 1, 'moduleclass_sfx=\n\n', 1, 1, ''),
(42, 'Joomla! Security Newsfeed', '', 6, 'cpanel', 62, '2008-10-25 20:15:17', 1, 'mod_feed', 0, 0, 1, 'cache=1\ncache_time=15\nmoduleclass_sfx=\nrssurl=http://feeds.joomla.org/JoomlaSecurityNews\nrssrtl=0\nrsstitle=1\nrssdesc=0\nrssimage=1\nrssitems=1\nrssitemdesc=1\nword_count=0\n\n', 0, 1, ''),
(57, 'hiddenmenu', '', 1, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=hiddenmenu', 0, 0, ''),
(58, 'Health Condition Page Image', '<p><img src="images/stories/health.jpg" border="0" alt="Health" title="Health" align="left" /><img src="images/stories/health.jpg" border="0" /></p>', 0, 'user5', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx= health_page_images\n\n', 0, 0, ''),
(47, 'Categories List', '', 2, 'user6', 0, '0000-00-00 00:00:00', 1, 'mod_qcategories', 0, 0, 0, 'section_id=5\nlayout=0\nshow_empty_categories=1\nshow_counters=0\nshow_description=0\ncut_description=0\nstrip_tags=1\nallowed_tags=<b><i><strong><em>\nprocess_plugin=0\norder_by=0\nmoduleclass_sfx=_cat_list\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(48, 'Find Treatment', '<p><a href="index.php?option=com_content&amp;view=section&amp;id=5&amp;Itemid=57">חיפוש</a></p>', 0, 'user6', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx= find_button\n\n', 0, 0, ''),
(49, 'מרכז למידה', '<p><a href="index.php?option=com_content&amp;view=article&amp;id=49&amp;Itemid=60">בוידאו</a></p>\r\n<p style="text-align: center;"><span>התאמת תרגול יוגה <br />אישי באינטרנט</span></p>', 0, 'user7', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx= learning_center\n\n', 0, 0, ''),
(50, 'קורס חינם', '<p><a href="index.php">קורס יומי בצפייה ישירה. התחילו <br />לתרגל כבר היום. <strong>הירשמו לקורס</strong></a></p>', 3, 'user7', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx= free_course\n\n', 0, 0, ''),
(51, 'Home Video Box', '', 2, 'user7', 0, '0000-00-00 00:00:00', 1, 'mod_video_box', 0, 0, 0, 'show_video_box=1\nmoduleclass_sfx= video_boxes\nshow_video_one=1\nvideo_one_title=תירגול בבית\nvideo_one_url=http://www.youtube.com/watch?v=7drLSbrHft0\nvideo_one_thumb=thumb1.jpg\nshow_video_two=1\nvideo_two_title=השיטה שלנו\nvideo_two_url=http://www.youtube.com/watch?v=WyKhn1Z2JXU\nvideo_two_thumb=thumb1.jpg\nshow_video_three=1\nvideo_three_title=ברוכים הבאים\nvideo_three_url=http://www.youtube.com/watch?v=EJr_lir-6gI\nvideo_three_thumb=thumb1.jpg\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(54, 'Footer Top Link - Left', '<p><a href="index.php?option=com_content&amp;view=section&amp;id=5&amp;Itemid=57">לתוכניות תרגול נוספות&gt;&gt;</a></p>', 0, 'user3', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx= left\n\n', 0, 0, ''),
(53, 'תוכניות תרגול נבחרות', '', 0, 'user8', 0, '0000-00-00 00:00:00', 1, 'mod_category_boxes', 0, 0, 1, 'category_one=908\ncategory_two=908\ncategory_three=908\ncategory_four=908\ncut_description=0\nstrip_tags=1\nallowed_tags=<b><i><strong><em>\nprocess_plugin=0\nmoduleclass_sfx= training_program\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(55, 'Footer Top Link - Right', '<p><a href="index.php">לתוכניות תרגול כבקשתך&gt;&gt;</a></p>', 0, 'user3', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx= right\n\n', 0, 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `jos_modules_menu`
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(17, 0),
(18, 1),
(18, 59),
(25, 1),
(27, 0),
(31, 0),
(39, 43),
(39, 44),
(39, 45),
(39, 46),
(39, 47),
(40, 0),
(44, 0),
(45, 0),
(47, 0),
(48, 0),
(49, 1),
(49, 18),
(49, 28),
(49, 29),
(49, 53),
(49, 54),
(49, 55),
(49, 56),
(49, 57),
(49, 58),
(49, 59),
(49, 61),
(49, 62),
(49, 63),
(49, 64),
(50, 0),
(51, 1),
(53, 0),
(54, 1),
(55, 1),
(57, 0),
(58, 57);

-- --------------------------------------------------------

--
-- Структура таблицы `jos_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(11) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(11) unsigned NOT NULL DEFAULT '3600',
  `checked_out` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `jos_newsfeeds`
--

INSERT INTO `jos_newsfeeds` (`catid`, `id`, `name`, `alias`, `link`, `filename`, `published`, `numarticles`, `cache_time`, `checked_out`, `checked_out_time`, `ordering`, `rtl`) VALUES
(4, 1, 'Joomla! Announcements', 'joomla-official-news', 'http://feeds.joomla.org/JoomlaAnnouncements', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 1, 0),
(4, 2, 'Joomla! Core Team Blog', 'joomla-core-team-blog', 'http://feeds.joomla.org/JoomlaCommunityCoreTeamBlog', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 2, 0),
(4, 3, 'Joomla! Community Magazine', 'joomla-community-magazine', 'http://feeds.joomla.org/JoomlaMagazine', '', 1, 20, 3600, 0, '0000-00-00 00:00:00', 3, 0),
(4, 4, 'Joomla! Developer News', 'joomla-developer-news', 'http://feeds.joomla.org/JoomlaDeveloper', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 4, 0),
(4, 5, 'Joomla! Security News', 'joomla-security-news', 'http://feeds.joomla.org/JoomlaSecurityNews', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 5, 0),
(5, 6, 'Free Software Foundation Blogs', 'free-software-foundation-blogs', 'http://www.fsf.org/blogs/RSS', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 4, 0),
(5, 7, 'Free Software Foundation', 'free-software-foundation', 'http://www.fsf.org/news/RSS', NULL, 1, 5, 3600, 62, '2008-09-14 00:24:25', 3, 0),
(5, 8, 'Software Freedom Law Center Blog', 'software-freedom-law-center-blog', 'http://www.softwarefreedom.org/feeds/blog/', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 2, 0),
(5, 9, 'Software Freedom Law Center News', 'software-freedom-law-center', 'http://www.softwarefreedom.org/feeds/news/', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 1, 0),
(5, 10, 'Open Source Initiative Blog', 'open-source-initiative-blog', 'http://www.opensource.org/blog/feed', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 5, 0),
(6, 11, 'PHP News and Announcements', 'php-news-and-announcements', 'http://www.php.net/feed.atom', NULL, 1, 5, 3600, 62, '2008-09-14 00:25:37', 1, 0),
(6, 12, 'Planet MySQL', 'planet-mysql', 'http://www.planetmysql.org/rss20.xml', NULL, 1, 5, 3600, 62, '2008-09-14 00:25:51', 2, 0),
(6, 13, 'Linux Foundation Announcements', 'linux-foundation-announcements', 'http://www.linuxfoundation.org/press/rss20.xml', NULL, 1, 5, 3600, 62, '2008-09-14 00:26:11', 3, 0),
(6, 14, 'Mootools Blog', 'mootools-blog', 'http://feeds.feedburner.com/mootools-blog', NULL, 1, 5, 3600, 62, '2008-09-14 00:26:51', 4, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `jos_plugins`
--

CREATE TABLE IF NOT EXISTS `jos_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `element` varchar(100) NOT NULL DEFAULT '',
  `folder` varchar(100) NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `iscore` tinyint(3) NOT NULL DEFAULT '0',
  `client_id` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Дамп данных таблицы `jos_plugins`
--

INSERT INTO `jos_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Authentication - Joomla', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Authentication - LDAP', 'ldap', 'authentication', 0, 2, 0, 1, 0, 0, '0000-00-00 00:00:00', 'host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Authentication - GMail', 'gmail', 'authentication', 0, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Authentication - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'User - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Search - Content', 'content', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Search - Contacts', 'contacts', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Search - Categories', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Search - Sections', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Search - Newsfeeds', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Search - Weblinks', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Content - Pagebreak', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Content - Rating', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Content - Email Cloaking', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Content - Code Hightlighter (GeSHi)', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Content - Load Module', 'loadmodule', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\nstyle=0\n\n'),
(17, 'Content - Page Navigation', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Editor - No Editor', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Editor - TinyMCE', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'mode=advanced\nskin=0\ncompressed=0\ncleanup_startup=0\ncleanup_save=2\nentity_encoding=raw\nlang_mode=0\nlang_code=en\ntext_direction=ltr\ncontent_css=1\ncontent_css_custom=\nrelative_urls=1\nnewlines=0\ninvalid_elements=applet\nextended_elements=\ntoolbar=top\ntoolbar_align=left\nhtml_height=550\nhtml_width=750\nelement_path=1\nfonts=1\npaste=1\nsearchreplace=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\ncolors=1\ntable=1\nsmilies=1\nmedia=1\nhr=1\ndirectionality=1\nfullscreen=1\nstyle=1\nlayer=1\nxhtmlxtras=1\nvisualchars=1\nnonbreaking=1\ntemplate=0\nadvimage=1\nadvlink=1\nautosave=1\ncontextmenu=1\ninlinepopups=1\nsafari=1\ncustom_plugin=\ncustom_button=\n\n'),
(20, 'Editor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'Editor Button - Image', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Editor Button - Pagebreak', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Editor Button - Readmore', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'System - SEF', 'sef', 'system', 0, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'System - Debug', 'debug', 'system', 0, 2, 1, 0, 0, 0, '0000-00-00 00:00:00', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'System - Legacy', 'legacy', 'system', 0, 3, 0, 1, 0, 0, '0000-00-00 00:00:00', 'route=0\n\n'),
(30, 'System - Cache', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'System - Log', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'System - Remember Me', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'System - Backlink', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(34, 'System - Mootools Upgrade', 'mtupgrade', 'system', 0, 8, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(35, 'Authentication - JFooBar Joomla Email', 'jfoobar_joomlaemail', 'authentication', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(36, 'System - Disable Mootools', 'disable_mootools', 'system', 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\n');

-- --------------------------------------------------------

--
-- Структура таблицы `jos_polls`
--

CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `voters` int(9) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `lag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `jos_polls`
--

INSERT INTO `jos_polls` (`id`, `title`, `alias`, `voters`, `checked_out`, `checked_out_time`, `published`, `access`, `lag`) VALUES
(14, 'Joomla! is used for?', 'joomla-is-used-for', 11, 0, '0000-00-00 00:00:00', 1, 0, 86400);

-- --------------------------------------------------------

--
-- Структура таблицы `jos_poll_data`
--

CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollid` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `jos_poll_data`
--

INSERT INTO `jos_poll_data` (`id`, `pollid`, `text`, `hits`) VALUES
(1, 14, 'Community Sites', 2),
(2, 14, 'Public Brand Sites', 3),
(3, 14, 'eCommerce', 1),
(4, 14, 'Blogs', 0),
(5, 14, 'Intranets', 0),
(6, 14, 'Photo and Media Sites', 2),
(7, 14, 'All of the Above!', 3),
(8, 14, '', 0),
(9, 14, '', 0),
(10, 14, '', 0),
(11, 14, '', 0),
(12, 14, '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `jos_poll_date`
--

CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `jos_poll_date`
--

INSERT INTO `jos_poll_date` (`id`, `date`, `vote_id`, `poll_id`) VALUES
(1, '2006-10-09 13:01:58', 1, 14),
(2, '2006-10-10 15:19:43', 7, 14),
(3, '2006-10-11 11:08:16', 7, 14),
(4, '2006-10-11 15:02:26', 2, 14),
(5, '2006-10-11 15:43:03', 7, 14),
(6, '2006-10-11 15:43:38', 7, 14),
(7, '2006-10-12 00:51:13', 2, 14),
(8, '2007-05-10 19:12:29', 3, 14),
(9, '2007-05-14 14:18:00', 6, 14),
(10, '2007-06-10 15:20:29', 6, 14),
(11, '2007-07-03 12:37:53', 2, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `jos_poll_menu`
--

CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jos_poll_menu`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_sections`
--

CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `jos_sections`
--

INSERT INTO `jos_sections` (`id`, `title`, `name`, `alias`, `image`, `scope`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `count`, `params`) VALUES
(1, 'Content', '', 'content', '', 'content', 'right', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 6, ''),
(5, 'מצבים בריאותיים', '', 'health-condition', '', 'content', 'left', '<p>adasd</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 18, '');

-- --------------------------------------------------------

--
-- Структура таблицы `jos_session`
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) DEFAULT '',
  `time` varchar(14) DEFAULT '',
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `guest` tinyint(4) DEFAULT '1',
  `userid` int(11) DEFAULT '0',
  `usertype` varchar(50) DEFAULT '',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('', '1296739879', '30580b6ba7defdfab6df0573deda2835', 1, 0, '', 0, 0, '__default|a:8:{s:22:"session.client.browser";s:94:"Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13 GTB7.1";s:15:"session.counter";i:3;s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:79:"C:\\webroot\\tipulitonline.simpletest.biz\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"164259eaf022b61167791e11c97ca34e";s:19:"session.timer.start";i:1296739477;s:18:"session.timer.last";i:1296739477;s:17:"session.timer.now";i:1296739879;}');

-- --------------------------------------------------------

--
-- Структура таблицы `jos_stats_agents`
--

CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jos_stats_agents`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_templates_menu`
--

CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('retipulit', 0, 0),
('khepri', 0, 1),
('retipulit_home', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `jos_users`
--

CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- Дамп данных таблицы `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'alanpachuau@gmail.com', '83a5a879d16fb83888216b3a3e9a9bc2:CfApP1ebM9Hiy7M7RbUltVmeZcKPDXZb', 'Super Administrator', 0, 1, 25, '2010-11-03 04:25:07', '2011-01-11 15:38:18', '', ''),
(63, 'anton', 'anton', 'anton.krishtopin@gmail.com', '18124883ece00863925d8db804592101:fbaqnYRkSG4msAFQ28ajZJnoLsNn1TlK', 'Registered', 0, 0, 18, '2011-01-26 12:51:27', '2011-01-26 13:08:35', '', '\n');

-- --------------------------------------------------------

--
-- Структура таблицы `jos_users_extended_data`
--

CREATE TABLE IF NOT EXISTS `jos_users_extended_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `field_id` int(11) NOT NULL DEFAULT '0',
  `uvalue` text NOT NULL,
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `second` (`user_id`),
  KEY `third` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `jos_users_extended_data`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jos_weblinks`
--

CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `jos_weblinks`
--

INSERT INTO `jos_weblinks` (`id`, `catid`, `sid`, `title`, `alias`, `url`, `description`, `date`, `hits`, `published`, `checked_out`, `checked_out_time`, `ordering`, `archived`, `approved`, `params`) VALUES
(1, 2, 0, 'Joomla!', 'joomla', 'http://www.joomla.org', 'Home of Joomla!', '2005-02-14 15:19:02', 3, 1, 0, '0000-00-00 00:00:00', 1, 0, 1, 'target=0'),
(2, 2, 0, 'php.net', 'php', 'http://www.php.net', 'The language that Joomla! is developed in', '2004-07-07 11:33:24', 6, 1, 0, '0000-00-00 00:00:00', 3, 0, 1, ''),
(3, 2, 0, 'MySQL', 'mysql', 'http://www.mysql.com', 'The database that Joomla! uses', '2004-07-07 10:18:31', 1, 1, 0, '0000-00-00 00:00:00', 5, 0, 1, ''),
(4, 2, 0, 'OpenSourceMatters', 'opensourcematters', 'http://www.opensourcematters.org', 'Home of OSM', '2005-02-14 15:19:02', 11, 1, 0, '0000-00-00 00:00:00', 2, 0, 1, 'target=0'),
(5, 2, 0, 'Joomla! - Forums', 'joomla-forums', 'http://forum.joomla.org', 'Joomla! Forums', '2005-02-14 15:19:02', 4, 1, 0, '0000-00-00 00:00:00', 4, 0, 1, 'target=0'),
(6, 2, 0, 'Ohloh Tracking of Joomla!', 'ohloh-tracking-of-joomla', 'http://www.ohloh.net/projects/20', 'Objective reports from Ohloh about Joomla''s development activity. Joomla! has some star developers with serious kudos.', '2007-07-19 09:28:31', 1, 1, 0, '0000-00-00 00:00:00', 6, 0, 1, 'target=0\n\n');
