-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 26, 2023 at 12:00 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_parking`
--
CREATE DATABASE IF NOT EXISTS `smart_parking` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `smart_parking`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user_details', 7, 'add_user_details'),
(26, 'Can change user_details', 7, 'change_user_details'),
(27, 'Can delete user_details', 7, 'delete_user_details'),
(28, 'Can view user_details', 7, 'view_user_details'),
(29, 'Can add upload_ file', 8, 'add_upload_file'),
(30, 'Can change upload_ file', 8, 'change_upload_file'),
(31, 'Can delete upload_ file', 8, 'delete_upload_file'),
(32, 'Can view upload_ file', 8, 'view_upload_file'),
(33, 'Can add user details', 9, 'add_userdetails'),
(34, 'Can change user details', 9, 'change_userdetails'),
(35, 'Can delete user details', 9, 'delete_userdetails'),
(36, 'Can view user details', 9, 'view_userdetails'),
(37, 'Can add cheque details', 10, 'add_chequedetails'),
(38, 'Can change cheque details', 10, 'change_chequedetails'),
(39, 'Can delete cheque details', 10, 'delete_chequedetails'),
(40, 'Can view cheque details', 10, 'view_chequedetails'),
(41, 'Can add user screenshot', 11, 'add_userscreenshot'),
(42, 'Can change user screenshot', 11, 'change_userscreenshot'),
(43, 'Can delete user screenshot', 11, 'delete_userscreenshot'),
(44, 'Can view user screenshot', 11, 'view_userscreenshot'),
(45, 'Can add captured image', 12, 'add_capturedimage'),
(46, 'Can change captured image', 12, 'change_capturedimage'),
(47, 'Can delete captured image', 12, 'delete_capturedimage'),
(48, 'Can view captured image', 12, 'view_capturedimage');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cheque_details1`
--

DROP TABLE IF EXISTS `cheque_details1`;
CREATE TABLE IF NOT EXISTS `cheque_details1` (
  `C_id` int NOT NULL AUTO_INCREMENT,
  `CSignImg` longtext,
  `UserForegin_id` int NOT NULL,
  `AccontNum` bigint DEFAULT NULL,
  `DigitAmount` bigint DEFAULT NULL,
  `ToName` longtext,
  `WordAmount` longtext,
  `Cheque_date` datetime(6) DEFAULT NULL,
  `Status` longtext,
  `Reason` longtext,
  PRIMARY KEY (`C_id`),
  KEY `cheque_details1_UserForegin_id_77e42265` (`UserForegin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cheque_details1`
--

INSERT INTO `cheque_details1` (`C_id`, `CSignImg`, `UserForegin_id`, `AccontNum`, `DigitAmount`, `ToName`, `WordAmount`, `Cheque_date`, `Status`, `Reason`) VALUES
(54, NULL, 5, 1, 10000, 'dhoni', 'Ten Thousand', '2023-12-26 11:54:05.156817', 'success', 'Transaction Successful'),
(52, NULL, 5, 1212, 1000, 'upender', 'thousand', '2023-12-26 11:51:04.723968', 'fraud', 'Sign Not Matched'),
(53, NULL, 5, 3213, 1000, 'upender bala', 'thousand', '2023-12-26 11:52:30.959368', 'fraud', 'Sign Not Matched'),
(50, NULL, 5, 121212, 1000, 'upender', 'Ten Thousand', '2023-12-26 11:49:12.603069', 'fraud', 'Amount miss match'),
(51, NULL, 5, 221212, 10000, 'upender', 'Ten Thousand', '2023-12-26 11:49:35.616378', 'fraud', 'Sign Not Matched'),
(49, NULL, 4, 1234, 10000, 'dhoni', 'Ten Thousand', '2023-12-26 11:17:33.498012', 'success', 'Transaction Successful'),
(48, NULL, 4, 1234, 1000, 'upender', 'thousand', '2023-12-26 11:15:33.980724', 'fraud', 'Sign Not Matched'),
(45, NULL, 4, 12, 40000, 'upender bala', 'forty thousand ', '2023-12-26 11:10:06.415187', 'success', 'Transaction Successful'),
(46, NULL, 4, 1234, 1000, 'dhoni', 'thousand', '2023-12-26 11:13:14.169351', 'fraud', 'Sign Not Matched'),
(47, NULL, 4, 12, 455, 'kohli', 'thousand', '2023-12-26 11:14:43.166000', 'fraud', 'Amount miss match'),
(43, NULL, 4, 2, 1000, 'dhoni', 'thousand', '2023-12-18 16:39:12.038400', 'success', 'Transaction Successful'),
(44, NULL, 4, 1, 40000, 'upender', 'thousand', '2023-12-26 11:09:35.083951', 'fraud', 'Amount miss match'),
(41, NULL, 4, 1, 1000, 'upender bala', 'thousand', '2023-12-18 16:36:49.754376', 'fraud', 'Sign Not Matched'),
(42, NULL, 4, 1, 1000, 'dhoni', 'thousand', '2023-12-18 16:38:11.011178', 'fraud', 'Sign Not Matched'),
(40, NULL, 4, 1, 10000, 'sainath', 'Ten Thousand', '2023-12-18 16:35:50.882321', 'fraud', 'Sign Not Matched'),
(39, NULL, 4, 1, 1000, 'kohli', 'thousand', '2023-12-18 16:33:01.600598', 'success', 'Transaction Successful');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'parkingapp', 'user_details'),
(8, 'parkingapp', 'upload_file'),
(9, 'userapp', 'userdetails'),
(10, 'userapp', 'chequedetails'),
(11, 'userapp', 'userscreenshot'),
(12, 'userapp', 'capturedimage');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-11-28 12:49:43.243343'),
(2, 'auth', '0001_initial', '2023-11-28 12:49:44.846153'),
(3, 'admin', '0001_initial', '2023-11-28 12:49:45.230974'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-28 12:49:45.241988'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-28 12:49:45.255659'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-11-28 12:49:45.460435'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-11-28 12:49:45.626717'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-11-28 12:49:45.723675'),
(9, 'auth', '0004_alter_user_username_opts', '2023-11-28 12:49:45.737286'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-11-28 12:49:45.809822'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-11-28 12:49:45.814941'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-11-28 12:49:45.827498'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-11-28 12:49:45.959132'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-11-28 12:49:46.027508'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-11-28 12:49:46.102706'),
(16, 'auth', '0011_update_proxy_permissions', '2023-11-28 12:49:46.113320'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-11-28 12:49:46.197932'),
(18, 'parkingapp', '0001_initial', '2023-11-28 12:49:46.217243'),
(19, 'parkingapp', '0002_upload_file', '2023-11-28 12:49:46.230487'),
(20, 'sessions', '0001_initial', '2023-11-28 12:49:46.297879'),
(21, 'userapp', '0001_initial', '2023-11-28 12:49:46.311363'),
(22, 'userapp', '0002_chequedetails', '2023-11-28 12:49:46.481754'),
(23, 'userapp', '0003_remove_chequedetails_caname_and_more', '2023-11-28 12:49:47.053902'),
(24, 'userapp', '0004_alter_chequedetails_accontnum_and_more', '2023-11-28 12:49:47.064362'),
(25, 'userapp', '0005_chequedetails_cheque_date', '2023-11-28 12:49:47.150305'),
(26, 'userapp', '0006_alter_chequedetails_csignimg', '2023-11-28 12:49:47.258571'),
(27, 'userapp', '0007_chequedetails_status', '2023-11-28 12:49:47.370841'),
(28, 'userapp', '0008_chequedetails_reason', '2023-11-28 12:49:47.442096'),
(29, 'userapp', '0009_alter_userdetails_otp', '2023-11-28 12:49:47.512142'),
(30, 'userapp', '0010_userdetails_account_number', '2023-11-28 12:49:47.565748'),
(31, 'userapp', '0011_userdetails_ustatus', '2023-11-28 12:49:47.682634'),
(32, 'userapp', '0012_userscreenshot', '2023-12-02 11:27:59.483726'),
(33, 'userapp', '0013_capturedimage', '2023-12-16 11:27:44.479476'),
(34, 'userapp', '0014_userdetails_tries', '2023-12-16 11:59:35.885892');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ser1l3bquzvxu80tf6kiv6r9umwt6m1z', 'eyJFbWFpbCI6InVwZW5kZXJiYWxhMjVAZ21haWwuY29tIiwiVV9pZCI6Mn0:1r9SVi:b6PyPR4Z77yjRRMbvE6N4eUJXZPm9AHuRYgvr9qOQZY', '2023-12-16 16:06:30.871364'),
('bfopib0mqjemg4sarrvzr48w8p8lchq2', 'eyJFbWFpbCI6Im5ld3VzZXJAZ21haWwuY29tIiwiVV9pZCI6NX0:1rI62t:bdWCvKWTVWApNqDfvP6O3NkMq5ju0G-IbZ5Wa3Ppxdw', '2024-01-09 11:56:27.787955');

-- --------------------------------------------------------

--
-- Table structure for table `upload_video`
--

DROP TABLE IF EXISTS `upload_video`;
CREATE TABLE IF NOT EXISTS `upload_video` (
  `Video_Id` int NOT NULL AUTO_INCREMENT,
  `Video` varchar(100) NOT NULL,
  PRIMARY KEY (`Video_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userapp_capturedimage`
--

DROP TABLE IF EXISTS `userapp_capturedimage`;
CREATE TABLE IF NOT EXISTS `userapp_capturedimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userapp_capturedimage_user_id_1b21d3ad` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userapp_capturedimage`
--

INSERT INTO `userapp_capturedimage` (`id`, `image`, `created_at`, `user_id`) VALUES
(25, 'captured_images/captured_image_YqLccgz.png', '2023-12-26 11:54:04.903777', 5),
(21, 'captured_images/captured_image_UwHPqtm.png', '2023-12-26 11:17:33.162352', 4);

-- --------------------------------------------------------

--
-- Table structure for table `userapp_userscreenshot`
--

DROP TABLE IF EXISTS `userapp_userscreenshot`;
CREATE TABLE IF NOT EXISTS `userapp_userscreenshot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userapp_userscreenshot_user_id_4e317c2e` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userdetails1`
--

DROP TABLE IF EXISTS `userdetails1`;
CREATE TABLE IF NOT EXISTS `userdetails1` (
  `U_id` int NOT NULL AUTO_INCREMENT,
  `FullName` longtext NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Contact` bigint NOT NULL,
  `Address` longtext NOT NULL,
  `Account_Type` longtext NOT NULL,
  `Partial_Amount` int NOT NULL,
  `Sign_Image` varchar(100) NOT NULL,
  `Otp` int DEFAULT NULL,
  `Account_Number` bigint DEFAULT NULL,
  `UStatus` longtext,
  `Tries` int NOT NULL,
  PRIMARY KEY (`U_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userdetails1`
--

INSERT INTO `userdetails1` (`U_id`, `FullName`, `Email`, `Contact`, `Address`, `Account_Type`, `Partial_Amount`, `Sign_Image`, `Otp`, `Account_Number`, `UStatus`, `Tries`) VALUES
(5, 'new user', 'newuser@gmail.com', 9666473716, 'hayathnagar', 'savings', 100000, 'sign_images/WhatsApp_Image_2023-11-28_at_6.42.48_PM_rGWxxAK.jpeg', 7313, 12345, 'accepted', 0),
(4, 'upender', 'upenderimp25@gmail.com', 9666473716, 'Hyderabad ', 'savings', 100000, 'sign_images/WhatsApp_Image_2023-11-28_at_6.42.48_PM.jpeg', 1818, -1, 'accepted', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE IF NOT EXISTS `user_details` (
  `User_id` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
