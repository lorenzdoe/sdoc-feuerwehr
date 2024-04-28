-- Start by connecting to the MySQL server as a root user
-- This step is usually done through a MySQL client or interface
-- and not inside the script, but is shown here for completeness.
-- mysql -u root -p -h localhost --port=3306
-- When prompted, enter the password: feuerwehr

-- exectue the script by running the following command
-- source /path/to/init_db.sql

-- could also be done directly by running the following command
-- mysql -u root -p -h localhost --port=3306 < /path/to/init_db.sql

-- 1. Create the new database named 'fw_db'
CREATE DATABASE IF NOT EXISTS fw_db;

-- 2. Create the new user 'fw_admin' with the specified password
-- Note: Adjust the hostname as per your requirements; '%' allows connection from any host
CREATE USER IF NOT EXISTS 'fw_admin'@'%' IDENTIFIED BY 'fw_password';

-- 3. Grant all privileges on the 'fw_db' database to 'fw_admin'
GRANT ALL PRIVILEGES ON fw_db.* TO 'fw_admin'@'%';

-- 4. Apply the changes made by the GRANT statement
FLUSH PRIVILEGES;


-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Erstellungszeit: 07. Apr 2024 um 13:15
-- Server-Version: 8.3.0
-- PHP-Version: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `fw_db`
--

-- --------------------------------------------------------
USE `fw_db`;
--
-- Tabellenstruktur für Tabelle `activities`
--

CREATE TABLE `activities` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `activity_type_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `activities`
--

INSERT INTO `activities` (`id`, `date`, `name`, `description`, `activity_type_id`) VALUES
(6, '2024-02-01', 'Brandeinsatz', 'Einsatz, Großbrand in Wien mit Menschenrettung', 1),
(7, '2024-02-03', 'Technische Übung', 'Technische Übung, eingeklemmte Person im Auto', 2),
(8, '2024-02-10', 'Übung Feuerlöscher', 'Übung: richtiger Umgang mit dem Feuerlöscher', 2),
(9, '2024-02-24', 'Übung Ausbildungsprüfung', 'Übung für Atemschutz-Ausbildungsprüfung', 2),
(10, '2024-03-04', 'Wartung Masken', 'Überprüfung der Einsatzbereitschaft, Tausch Ventile', 5),
(11, '2024-04-08', 'Einsatz', 'Kleinbrand Fahrzeughalle, Niemandsdorf', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `activity_member_association`
--

CREATE TABLE `activity_member_association` (
  `activity_id` int NOT NULL,
  `member_id` int NOT NULL,
  `ats` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `activity_member_association`
--

INSERT INTO `activity_member_association` (`activity_id`, `member_id`, `ats`) VALUES
(6, 11, 1),
(6, 16, 0),
(6, 21, 0),
(6, 27, 0),
(6, 29, 0),
(6, 34, 1),
(6, 57, 0),
(6, 64, 0),
(6, 66, 0),
(6, 74, 0),
(6, 84, 1),
(6, 90, 0),
(6, 93, 0),
(6, 113, 0),
(6, 114, 0),
(6, 131, 1),
(6, 137, 0),
(6, 138, 1),
(6, 144, 0),
(7, 20, 0),
(7, 29, 0),
(7, 52, 0),
(7, 60, 0),
(7, 86, 0),
(7, 106, 0),
(7, 127, 0),
(7, 133, 0),
(7, 138, 0),
(7, 144, 0),
(7, 149, 0),
(8, 16, 0),
(8, 33, 0),
(8, 47, 0),
(8, 66, 0),
(8, 78, 0),
(8, 90, 0),
(8, 133, 0),
(8, 136, 0),
(8, 138, 0),
(9, 20, 1),
(9, 21, 1),
(9, 46, 1),
(9, 74, 1),
(9, 79, 1),
(9, 138, 1),
(9, 142, 1),
(9, 143, 1),
(9, 150, 1),
(11, 3, 1),
(11, 14, 1),
(11, 20, 0),
(11, 25, 0),
(11, 31, 0),
(11, 51, 0),
(11, 54, 1),
(11, 64, 0),
(11, 71, 1),
(11, 74, 1),
(11, 85, 0),
(11, 90, 0),
(11, 96, 0),
(11, 103, 0),
(11, 118, 0),
(11, 123, 0),
(11, 127, 0),
(11, 138, 0),
(11, 142, 1),
(11, 144, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `activity_types`
--

CREATE TABLE `activity_types` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `activity_types`
--

INSERT INTO `activity_types` (`id`, `name`, `description`) VALUES
(1, 'Einsatz', 'Feuerwehreinsatz mit Alarmierung'),
(2, 'Übung', 'Feuerwehrübung mit oder ohne Atemschutz'),
(3, 'Schulung', 'Schulung für Feuerwehrmitglieder'),
(4, 'Tauglichkeits-Überprüfung', 'Überprüfung zur Tauglichkeit für Atemschutzgeräteträger'),
(5, 'Wartung', 'Wartung von Geräten oder Fahrzeugen');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `breathing_apparatuses`
--

CREATE TABLE `breathing_apparatuses` (
  `id` int NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `pressure_regulator_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `breathing_apparatuses`
--

INSERT INTO `breathing_apparatuses` (`id`, `type`, `pressure_regulator_number`) VALUES
(41, 'BD 70', 'LA1'),
(42, 'AIRGO', 'LA2'),
(43, 'BD 70', 'LA3'),
(44, 'AIRGO', 'LA4'),
(45, 'BD 296', 'LA5'),
(46, 'AIRGO', 'LA6'),
(47, 'AIRGO', 'LA7'),
(48, 'BD 296', 'LA8'),
(49, 'BD 70', 'LA9'),
(50, 'BD 296', 'LA10'),
(51, 'AIRGO', 'LA11'),
(52, 'AIRGO', 'LA12'),
(53, 'BD 296', 'LA13'),
(54, 'AIRGO', 'LA14'),
(55, 'BD 70', 'LA15'),
(56, 'BD 70', 'LA16'),
(57, 'AIRGO', 'LA17'),
(58, 'BD 296', 'LA18'),
(59, 'AIRGO', 'LA19'),
(60, 'BD 296', 'LA20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `devices`
--

CREATE TABLE `devices` (
  `id` int NOT NULL,
  `device_number` varchar(50) DEFAULT NULL,
  `internal_designation` varchar(50) DEFAULT NULL,
  `kind` varchar(50) DEFAULT NULL,
  `manufacturer` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `inventory_number` varchar(50) DEFAULT NULL,
  `activation_date` date DEFAULT NULL,
  `deactivation_date` date DEFAULT NULL,
  `year_of_manufacture` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `devices`
--

INSERT INTO `devices` (`id`, `device_number`, `internal_designation`, `kind`, `manufacturer`, `owner`, `inventory_number`, `activation_date`, `deactivation_date`, `year_of_manufacture`) VALUES
(1, '3000', 'MK1', 'oxygen_mask', 'MSA', 'FF-Wien', '9893', '2017-11-21', NULL, 2019),
(2, '3001', 'MK2', 'oxygen_mask', 'Scott', 'FF-Wien', '9894', '2017-05-05', NULL, 2012),
(3, '3002', 'MK3', 'oxygen_mask', 'Interspiro', 'FF-Wien', '9895', '2012-01-05', NULL, 2000),
(4, '3003', 'MK4', 'oxygen_mask', 'MSA', 'FF-Wien', '9896', '2003-04-08', NULL, 2018),
(5, '3004', 'MK5', 'oxygen_mask', 'Auer', 'FF-Wien', '9897', '2002-08-08', NULL, 2000),
(6, '3005', 'MK6', 'oxygen_mask', 'MSA', 'FF-Wien', '9898', '2000-06-28', NULL, 2002),
(7, '3006', 'MK7', 'oxygen_mask', 'Interspiro', 'FF-Wien', '9899', '2023-05-16', NULL, 2018),
(8, '3007', 'MK8', 'oxygen_mask', 'Auer', 'FF-Wien', '9900', '2002-02-07', NULL, 2013),
(9, '3008', 'MK9', 'oxygen_mask', 'MSA', 'FF-Wien', '9901', '2017-08-31', NULL, 2008),
(10, '3009', 'MK10', 'oxygen_mask', 'Auer', 'FF-Wien', '9902', '2016-11-18', NULL, 2003),
(11, '3010', 'MK11', 'oxygen_mask', 'MSA', 'FF-Wien', '9903', '2007-07-21', NULL, 2006),
(12, '3011', 'MK12', 'oxygen_mask', 'Interspiro', 'FF-Wien', '9904', '2000-11-12', NULL, 2001),
(13, '3012', 'MK13', 'oxygen_mask', 'Interspiro', 'FF-Wien', '9905', '2021-07-25', NULL, 2007),
(14, '3013', 'MK14', 'oxygen_mask', 'Interspiro', 'FF-Wien', '9906', '2022-05-03', NULL, 2017),
(15, '3014', 'MK15', 'oxygen_mask', 'Dräger', 'FF-Wien', '9907', '2023-11-07', NULL, 2009),
(16, '3015', 'MK16', 'oxygen_mask', 'Interspiro', 'FF-Wien', '9908', '2016-05-24', NULL, 2016),
(17, '3016', 'MK17', 'oxygen_mask', 'MSA', 'FF-Wien', '9909', '2013-08-27', NULL, 2018),
(18, '3017', 'MK18', 'oxygen_mask', 'MSA', 'FF-Wien', '9910', '2015-01-22', NULL, 2018),
(19, '3018', 'MK19', 'oxygen_mask', 'Auer', 'FF-Wien', '9911', '2021-11-26', NULL, 2009),
(20, '3019', 'MK20', 'oxygen_mask', 'Interspiro', 'FF-Wien', '9912', '2008-01-31', NULL, 2001),
(21, '4000', 'FL1', 'oxygen_bottle', 'MSA', 'FF-Wien', '10893', '2009-09-01', NULL, 2009),
(22, '4001', 'FL2', 'oxygen_bottle', 'Dräger', 'FF-Wien', '10894', '2012-09-26', NULL, 2017),
(23, '4002', 'FL3', 'oxygen_bottle', 'Dräger', 'FF-Wien', '10895', '2017-08-29', NULL, 2015),
(24, '4003', 'FL4', 'oxygen_bottle', 'Scott', 'FF-Wien', '10896', '2009-05-04', NULL, 2018),
(25, '4004', 'FL5', 'oxygen_bottle', 'MSA', 'FF-Wien', '10897', '2002-03-01', NULL, 2016),
(26, '4005', 'FL6', 'oxygen_bottle', 'MSA', 'FF-Wien', '10898', '2013-11-02', NULL, 2002),
(27, '4006', 'FL7', 'oxygen_bottle', 'Interspiro', 'FF-Wien', '10899', '2014-07-23', NULL, 2002),
(28, '4007', 'FL8', 'oxygen_bottle', 'Interspiro', 'FF-Wien', '10900', '2008-10-03', NULL, 2000),
(29, '4008', 'FL9', 'oxygen_bottle', 'MSA', 'FF-Wien', '10901', '2007-05-02', NULL, 2012),
(30, '4009', 'FL10', 'oxygen_bottle', 'Dräger', 'FF-Wien', '10902', '2007-02-08', NULL, 2007),
(31, '4010', 'FL11', 'oxygen_bottle', 'Auer', 'FF-Wien', '10903', '2013-03-06', NULL, 2002),
(32, '4011', 'FL12', 'oxygen_bottle', 'Auer', 'FF-Wien', '10904', '2010-03-15', NULL, 2016),
(33, '4012', 'FL13', 'oxygen_bottle', 'Scott', 'FF-Wien', '10905', '2008-04-09', NULL, 2014),
(34, '4013', 'FL14', 'oxygen_bottle', 'Auer', 'FF-Wien', '10906', '2009-09-17', NULL, 2012),
(35, '4014', 'FL15', 'oxygen_bottle', 'Interspiro', 'FF-Wien', '10907', '2015-05-11', NULL, 2006),
(36, '4015', 'FL16', 'oxygen_bottle', 'MSA', 'FF-Wien', '10908', '2016-12-26', NULL, 2016),
(37, '4016', 'FL17', 'oxygen_bottle', 'Dräger', 'FF-Wien', '10909', '2023-12-29', NULL, 2019),
(38, '4017', 'FL18', 'oxygen_bottle', 'Dräger', 'FF-Wien', '10910', '2023-06-07', NULL, 2011),
(39, '4018', 'FL19', 'oxygen_bottle', 'Scott', 'FF-Wien', '10911', '2001-01-17', NULL, 2004),
(40, '4019', 'FL20', 'oxygen_bottle', 'Interspiro', 'FF-Wien', '10912', '2007-08-20', NULL, 2001),
(41, '2000', 'PA1', 'breathing_apparatus', 'Scott', 'FF-Wien', '8893', '2004-12-26', NULL, 2020),
(42, '2001', 'PA2', 'breathing_apparatus', 'Dräger', 'FF-Wien', '8894', '2017-11-16', NULL, 2020),
(43, '2002', 'PA3', 'breathing_apparatus', 'Dräger', 'FF-Wien', '8895', '2016-08-24', NULL, 2017),
(44, '2003', 'PA4', 'breathing_apparatus', 'Auer', 'FF-Wien', '8896', '2011-06-23', NULL, 2010),
(45, '2004', 'PA5', 'breathing_apparatus', 'Auer', 'FF-Wien', '8897', '2006-01-22', NULL, 2010),
(46, '2005', 'PA6', 'breathing_apparatus', 'Scott', 'FF-Wien', '8898', '2011-11-11', NULL, 2009),
(47, '2006', 'PA7', 'breathing_apparatus', 'Auer', 'FF-Wien', '8899', '2016-03-24', NULL, 2000),
(48, '2007', 'PA8', 'breathing_apparatus', 'MSA', 'FF-Wien', '8900', '2007-08-09', NULL, 2020),
(49, '2008', 'PA9', 'breathing_apparatus', 'Auer', 'FF-Wien', '8901', '2018-04-16', NULL, 2015),
(50, '2009', 'PA10', 'breathing_apparatus', 'Auer', 'FF-Wien', '8902', '2012-05-03', NULL, 2020),
(51, '2010', 'PA11', 'breathing_apparatus', 'Scott', 'FF-Wien', '8903', '2020-08-13', NULL, 2001),
(52, '2011', 'PA12', 'breathing_apparatus', 'Dräger', 'FF-Wien', '8904', '2001-07-12', NULL, 2003),
(53, '2012', 'PA13', 'breathing_apparatus', 'Interspiro', 'FF-Wien', '8905', '2019-01-08', NULL, 2009),
(54, '2013', 'PA14', 'breathing_apparatus', 'Auer', 'FF-Wien', '8906', '2018-09-18', NULL, 2012),
(55, '2014', 'PA15', 'breathing_apparatus', 'Auer', 'FF-Wien', '8907', '2003-12-24', NULL, 2006),
(56, '2015', 'PA16', 'breathing_apparatus', 'Auer', 'FF-Wien', '8908', '2023-02-24', NULL, 2005),
(57, '2016', 'PA17', 'breathing_apparatus', 'Scott', 'FF-Wien', '8909', '2003-06-14', NULL, 2019),
(58, '2017', 'PA18', 'breathing_apparatus', 'Auer', 'FF-Wien', '8910', '2013-06-27', NULL, 2016),
(59, '2018', 'PA19', 'breathing_apparatus', 'Auer', 'FF-Wien', '8911', '2007-05-28', NULL, 2014),
(60, '2019', 'PA20', 'breathing_apparatus', 'MSA', 'FF-Wien', '8912', '2008-09-11', NULL, 2003),
(61, '1000', 'LA1', 'pressure_regulator', 'MSA', 'FF-Wien', '7893', '2020-10-12', NULL, 2014),
(62, '1001', 'LA2', 'pressure_regulator', 'MSA', 'FF-Wien', '7894', '2010-11-24', NULL, 2020),
(63, '1002', 'LA3', 'pressure_regulator', 'Scott', 'FF-Wien', '7895', '2008-06-21', NULL, 2013),
(64, '1003', 'LA4', 'pressure_regulator', 'Auer', 'FF-Wien', '7896', '2013-08-21', NULL, 2013),
(65, '1004', 'LA5', 'pressure_regulator', 'Scott', 'FF-Wien', '7897', '2015-01-26', NULL, 2002),
(66, '1005', 'LA6', 'pressure_regulator', 'Auer', 'FF-Wien', '7898', '2002-04-28', NULL, 2003),
(67, '1006', 'LA7', 'pressure_regulator', 'MSA', 'FF-Wien', '7899', '2005-02-27', NULL, 2006),
(68, '1007', 'LA8', 'pressure_regulator', 'Interspiro', 'FF-Wien', '7900', '2001-03-24', NULL, 2000),
(69, '1008', 'LA9', 'pressure_regulator', 'Auer', 'FF-Wien', '7901', '2021-10-16', NULL, 2006),
(70, '1009', 'LA10', 'pressure_regulator', 'Scott', 'FF-Wien', '7902', '2000-08-25', NULL, 2000),
(71, '1010', 'LA11', 'pressure_regulator', 'Interspiro', 'FF-Wien', '7903', '2007-12-21', NULL, 2004),
(72, '1011', 'LA12', 'pressure_regulator', 'MSA', 'FF-Wien', '7904', '2021-01-23', NULL, 2017),
(73, '1012', 'LA13', 'pressure_regulator', 'Auer', 'FF-Wien', '7905', '2020-11-16', NULL, 2019),
(74, '1013', 'LA14', 'pressure_regulator', 'Scott', 'FF-Wien', '7906', '2007-03-20', NULL, 2020),
(75, '1014', 'LA15', 'pressure_regulator', 'Scott', 'FF-Wien', '7907', '2014-05-02', NULL, 2010),
(76, '1015', 'LA16', 'pressure_regulator', 'Dräger', 'FF-Wien', '7908', '2015-04-03', NULL, 2009),
(77, '1016', 'LA17', 'pressure_regulator', 'MSA', 'FF-Wien', '7909', '2017-04-13', NULL, 2006),
(78, '1017', 'LA18', 'pressure_regulator', 'Auer', 'FF-Wien', '7910', '2021-02-26', NULL, 2013),
(79, '1018', 'LA19', 'pressure_regulator', 'Scott', 'FF-Wien', '7911', '2019-12-21', NULL, 2001),
(80, '1019', 'LA20', 'pressure_regulator', 'Auer', 'FF-Wien', '7912', '2003-08-31', NULL, 2000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `device_device_usage_record_association`
--

CREATE TABLE `device_device_usage_record_association` (
  `device_usage_record_id` int NOT NULL,
  `device_id` int NOT NULL,
  `usage_action_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `device_device_usage_record_association`
--

INSERT INTO `device_device_usage_record_association` (`device_usage_record_id`, `device_id`, `usage_action_id`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 5),
(3, 1, 1),
(3, 1, 2),
(3, 1, 3),
(3, 1, 5),
(5, 1, 1),
(5, 1, 2),
(5, 1, 3),
(5, 1, 5),
(3, 2, 1),
(3, 2, 2),
(3, 2, 3),
(3, 2, 5),
(1, 3, 1),
(1, 3, 2),
(1, 3, 3),
(1, 3, 5),
(3, 4, 1),
(3, 4, 2),
(3, 4, 3),
(3, 4, 5),
(4, 4, 4),
(5, 5, 1),
(5, 5, 2),
(5, 5, 3),
(5, 5, 5),
(3, 6, 1),
(3, 6, 2),
(3, 6, 3),
(3, 6, 5),
(1, 7, 1),
(1, 7, 2),
(1, 7, 3),
(1, 7, 5),
(3, 8, 1),
(3, 8, 2),
(3, 8, 3),
(3, 8, 5),
(4, 8, 4),
(1, 11, 1),
(1, 11, 2),
(1, 11, 3),
(1, 11, 5),
(3, 11, 1),
(3, 11, 2),
(3, 11, 3),
(3, 11, 5),
(4, 11, 4),
(5, 11, 1),
(5, 11, 2),
(5, 11, 3),
(5, 11, 5),
(1, 12, 1),
(1, 12, 2),
(1, 12, 3),
(1, 12, 5),
(4, 12, 4),
(5, 15, 1),
(5, 15, 2),
(5, 15, 3),
(5, 15, 5),
(4, 18, 4),
(1, 19, 1),
(1, 19, 2),
(1, 19, 3),
(1, 19, 5),
(4, 19, 4),
(5, 19, 1),
(5, 19, 2),
(5, 19, 3),
(5, 19, 5),
(4, 20, 4),
(5, 20, 1),
(5, 20, 2),
(5, 20, 3),
(5, 20, 5),
(2, 25, 1),
(2, 25, 2),
(2, 25, 3),
(2, 28, 1),
(2, 28, 2),
(2, 28, 3),
(2, 30, 1),
(2, 30, 2),
(2, 30, 3),
(2, 31, 1),
(2, 31, 2),
(2, 31, 3),
(2, 38, 1),
(2, 38, 2),
(2, 38, 3),
(2, 40, 1),
(2, 40, 2),
(2, 40, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `device_usage_records`
--

CREATE TABLE `device_usage_records` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `activity_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `device_kind` varchar(50) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `remark` varchar(350) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `device_usage_records`
--

INSERT INTO `device_usage_records` (`id`, `user_id`, `activity_id`, `date`, `device_kind`, `duration`, `remark`) VALUES
(1, 1, 6, '2024-02-01', 'oxygen_mask', NULL, 'Gebrauch von Masken, Wiederherstellung Einsatzbereitschaft'),
(2, 1, 6, '2024-02-02', 'oxygen_bottle', NULL, 'Verwendung Flaschen, Wiederherstellung Einsatzbereitschaft'),
(3, 1, 9, '2024-02-24', 'oxygen_mask', NULL, 'Verwendung Masken für Übung'),
(4, 1, 10, '2024-03-04', 'oxygen_mask', NULL, ''),
(5, 1, 11, '2024-04-09', 'oxygen_mask', NULL, 'Gebrauch von Masken, Herstellung Einsatzbereitschaft');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `members`
--

CREATE TABLE `members` (
  `stbnr` int NOT NULL,
  `fw_nr` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `rank` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `ats_course` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `members`
--

INSERT INTO `members` (`stbnr`, `fw_nr`, `status`, `first_name`, `last_name`, `rank`, `date_of_birth`, `gender`, `ats_course`) VALUES
(1, 1, 'AKTIV', 'Nisa', 'Dorn', 'PFM', '1941-11-12', 'f', 0),
(2, 1, 'AKTIV', 'Kai', 'Seiser', 'EHBM', '1954-05-18', 'm', 1),
(3, 1, 'AKTIV', 'Bernhard', 'Kastner', 'FM', '1999-04-01', 'm', 1),
(4, 1, 'AKTIV', 'Liam', 'Wiesbauer', 'FM', '1988-07-12', 'm', 1),
(5, 1, 'EHRENMITGLIED', 'Leo', 'Raab', 'LM', '1980-04-07', 'm', 0),
(6, 1, 'ABGEMELDET', 'Cornelius', 'Holl', 'FM', '1983-09-01', 'm', 1),
(7, 1, 'AKTIV', 'Valentin', 'Ulrich', 'LM', '1964-07-02', 'm', 1),
(8, 1, 'AKTIV', 'Sven', 'Penz', 'PFM', '2000-05-27', 'm', 1),
(9, 1, 'AKTIV', 'Arthur', 'Paier', 'FM', '1977-01-15', 'm', 0),
(10, 1, 'AKTIV', 'David', 'Höglinger', 'LM', '1979-05-03', 'm', 1),
(11, 1, 'RESERVE', 'Maurice', 'Huber', 'FM', '2000-08-30', 'm', 1),
(12, 1, 'AKTIV', 'Jamie', 'Pöll', 'OLM', '1999-07-13', 'm', 1),
(13, 1, 'INAKTIV', 'Benedict', 'Pacher', 'FM', '1977-06-20', 'm', 0),
(14, 1, 'AKTIV', 'Maida', 'Schröder', 'FM', '1952-10-03', 'f', 1),
(15, 1, 'INAKTIV', 'Marko', 'Jungwirth', 'FM', '1947-09-28', 'm', 0),
(16, 1, 'AKTIV', 'Thomas', 'Leibetseder', 'ELM', '1987-12-04', 'm', 1),
(17, 1, 'RESERVE', 'Andrej', 'Sturm', 'LM', '1942-03-19', 'm', 0),
(18, 1, 'AKTIV', 'Joel', 'Stütz', 'ELM', '1964-10-13', 'm', 1),
(19, 1, 'ABGEMELDET', 'Franz', 'Steidl', 'FM', '1983-10-28', 'm', 1),
(20, 1, 'AKTIV', 'Julijana', 'Zeiner', 'FM', '1949-11-13', 'f', 1),
(21, 1, 'AKTIV', 'Alex', 'Brandstetter', 'EHBM', '1946-02-24', 'm', 1),
(22, 1, 'EHRENMITGLIED', 'Nicolai', 'Polzer', 'ELM', '1953-11-01', 'm', 1),
(23, 1, 'RESERVE', 'Robin', 'Neumayer', 'OLM', '1973-09-09', 'm', 1),
(24, 1, 'EHRENMITGLIED', 'Tristan', 'Gindl', 'ABI', '1951-03-07', 'm', 1),
(25, 1, 'AKTIV', 'Noel', 'Röck', 'LM', '1954-08-16', 'm', 1),
(26, 1, 'AKTIV', 'Tobias', 'Neuhold', 'LM', '1994-11-13', 'm', 1),
(27, 1, 'AKTIV', 'Oscar', 'König', 'LM', '1979-03-09', 'm', 1),
(28, 1, 'ABGEMELDET', 'Rana', 'Brenner', 'PFM', '1948-02-12', 'f', 0),
(29, 1, 'AKTIV', 'Cornelius', 'Zeiler', 'FM', '1973-05-17', 'm', 0),
(30, 1, 'AKTIV', 'Laila', 'Lassnig', 'LM', '2005-10-21', 'f', 0),
(31, 1, 'AKTIV', 'Severin', 'Reischl', 'ABI', '1970-06-24', 'm', 1),
(32, 1, 'ABGEMELDET', 'Jan', 'Pichler', 'FM', '1994-05-31', 'm', 1),
(33, 1, 'AKTIV', 'Leo', 'Eberharter', 'FM', '1995-08-16', 'm', 0),
(34, 1, 'EHRENMITGLIED', 'Simon', 'Nussbaumer', 'FM', '1971-03-17', 'm', 1),
(35, 1, 'EHRENMITGLIED', 'Friedrich', 'Berthold', 'LM', '1968-02-24', 'm', 0),
(36, 1, 'AKTIV', 'Frida', 'Hammer', 'BI', '1962-04-10', 'f', 0),
(37, 1, 'AKTIV', 'Noah', 'Rudolf', 'LM', '1947-01-18', 'm', 0),
(38, 1, 'AKTIV', 'James', 'Holzknecht', 'FM', '1989-09-02', 'm', 0),
(39, 1, 'AKTIV', 'Merlin', 'Stadler', 'EHBM', '1998-04-20', 'm', 0),
(40, 1, 'ABGEMELDET', 'Justus', 'Spreitzer', 'BI', '1967-12-19', 'm', 0),
(41, 1, 'AKTIV', 'Philip', 'Hütter', 'LM', '1992-03-01', 'm', 0),
(42, 1, 'INAKTIV', 'Phillip', 'Thalhammer', 'FM', '1973-01-27', 'm', 1),
(43, 1, 'AKTIV', 'Theodor', 'Geier', 'OLM', '1947-11-10', 'm', 0),
(44, 1, 'INAKTIV', 'Andreas', 'Trummer', 'FM', '1985-09-19', 'm', 0),
(45, 1, 'AKTIV', 'Aleksander', 'Siegl', 'FM', '1978-05-01', 'm', 0),
(46, 1, 'AKTIV', 'Moritz', 'Burgstaller', 'FM', '1944-04-08', 'm', 1),
(47, 1, 'AKTIV', 'Tiffany', 'Frick', 'FM', '2000-08-19', 'f', 1),
(48, 1, 'RESERVE', 'Kilian', 'Ortner', 'ABI', '1948-10-13', 'm', 1),
(49, 1, 'AKTIV', 'Benjamin', 'Hofinger', 'BI', '1959-02-07', 'm', 1),
(50, 1, 'EHRENMITGLIED', 'Alexander', 'Hubmann', 'FM', '1973-07-22', 'm', 0),
(51, 1, 'AKTIV', 'Vincent', 'Krammer', 'ABI', '1952-07-13', 'm', 0),
(52, 1, 'AKTIV', 'Angelo', 'Strohmeier', 'EHBM', '1993-06-29', 'm', 0),
(53, 1, 'AKTIV', 'Bastian', 'Schartner', 'FM', '2005-07-25', 'm', 1),
(54, 1, 'INAKTIV', 'Noah', 'Zettl', 'FM', '1995-09-05', 'm', 1),
(55, 1, 'ABGEMELDET', 'Philip', 'Kuhn', 'OLM', '1958-07-08', 'm', 1),
(56, 1, 'AKTIV', 'Leopold', 'Rinner', 'OLM', '1993-09-07', 'm', 0),
(57, 1, 'AKTIV', 'Moritz', 'König', 'FM', '1947-09-04', 'm', 0),
(58, 1, 'ABGEMELDET', 'Leonard', 'Peer', 'LM', '1950-09-19', 'm', 0),
(59, 1, 'AKTIV', 'Finn', 'Seiser', 'OLM', '1979-06-14', 'm', 1),
(60, 1, 'AKTIV', 'Henry', 'Schatz', 'LM', '1980-04-08', 'm', 1),
(61, 1, 'EHRENMITGLIED', 'Niko', 'Heigl', 'PFM', '1955-10-31', 'm', 0),
(62, 1, 'INAKTIV', 'Mara', 'Hauer', 'BI', '1989-05-02', 'f', 1),
(63, 1, 'AKTIV', 'Andreas', 'Kitzler', 'OLM', '1951-10-03', 'm', 1),
(64, 1, 'AKTIV', 'Dario', 'Forstner', 'FM', '1979-12-31', 'm', 0),
(65, 1, 'AKTIV', 'Nathan', 'Hausberger', 'FM', '2002-11-28', 'm', 1),
(66, 1, 'AKTIV', 'Ben', 'Lehner', 'EHBM', '1992-03-26', 'm', 1),
(67, 1, 'EHRENMITGLIED', 'Alexandar', 'Siegl', 'FM', '1946-08-14', 'm', 0),
(68, 1, 'ABGEMELDET', 'Patrick', 'Falkner', 'BI', '1968-12-26', 'm', 0),
(69, 1, 'INAKTIV', 'Florin', 'Martin', 'FM', '2004-08-17', 'm', 0),
(70, 1, 'AKTIV', 'Johanna', 'Suppan', 'FM', '1967-12-10', 'f', 0),
(71, 1, 'AKTIV', 'Tim', 'Schuh', 'OLM', '1962-02-20', 'm', 1),
(72, 1, 'ABGEMELDET', 'Marius', 'Dorner', 'FM', '1973-11-16', 'm', 0),
(73, 1, 'ABGEMELDET', 'Diana', 'Reichl', 'FM', '1996-02-08', 'f', 1),
(74, 1, 'AKTIV', 'Bruno', 'Koch', 'FM', '1986-03-11', 'm', 1),
(75, 1, 'RESERVE', 'Leonora', 'Hauer', 'FM', '1968-04-29', 'f', 0),
(76, 1, 'AKTIV', 'Alexandar', 'Perner', 'LM', '1953-07-03', 'm', 0),
(77, 1, 'INAKTIV', 'Matteo', 'Kopp', 'LM', '1990-09-30', 'm', 0),
(78, 1, 'AKTIV', 'Mateo', 'Dorner', 'LM', '1977-01-14', 'm', 1),
(79, 1, 'AKTIV', 'Matteo', 'Hubmann', 'LM', '1969-09-10', 'm', 1),
(80, 1, 'AKTIV', 'Ferdinand', 'Schrammel', 'EHBM', '1997-08-31', 'm', 0),
(81, 1, 'INAKTIV', 'Tanja', 'Lipp', 'ABI', '1961-05-17', 'f', 0),
(82, 1, 'AKTIV', 'Adrian', 'Pirker', 'FM', '1978-09-09', 'm', 0),
(83, 1, 'AKTIV', 'Axel', 'Fuchs', 'FM', '1962-03-21', 'm', 0),
(84, 1, 'AKTIV', 'Joshua', 'Holzer', 'OLM', '1979-01-04', 'm', 1),
(85, 1, 'AKTIV', 'Tom', 'Walder', 'LM', '2001-12-04', 'm', 1),
(86, 1, 'AKTIV', 'Robert', 'Stütz', 'LM', '1967-06-07', 'm', 1),
(87, 1, 'RESERVE', 'Emanuel', 'Kurzmann', 'LM', '2005-10-10', 'm', 1),
(88, 1, 'AKTIV', 'Matteo', 'Pohl', 'FM', '1942-04-29', 'm', 1),
(89, 1, 'ABGEMELDET', 'Franziska', 'Leitner', 'FM', '1992-09-06', 'f', 0),
(90, 1, 'AKTIV', 'Liliana', 'Ernst', 'FM', '1950-01-12', 'f', 1),
(91, 1, 'RESERVE', 'Emilia', 'Hofbauer', 'BI', '1974-10-07', 'f', 0),
(92, 1, 'EHRENMITGLIED', 'Milo', 'Koppensteiner', 'ELM', '1940-06-25', 'm', 0),
(93, 1, 'AKTIV', 'Manuel', 'Aschauer', 'FM', '1996-12-17', 'm', 1),
(94, 1, 'AKTIV', 'Constantin', 'Doppler', 'FM', '1968-09-07', 'm', 0),
(95, 1, 'ABGEMELDET', 'Karim', 'Kogler', 'FM', '1945-01-09', 'm', 1),
(96, 1, 'AKTIV', 'Timo', 'Wurzer', 'FM', '1993-12-12', 'm', 0),
(97, 1, 'RESERVE', 'Severin', 'Dallinger', 'FM', '1957-10-28', 'm', 1),
(98, 1, 'AKTIV', 'Ariana', 'Gschwandtner', 'FM', '2004-01-31', 'f', 1),
(99, 1, 'AKTIV', 'Benjamin', 'Hofmeister', 'EHBM', '1982-11-04', 'm', 1),
(100, 1, 'RESERVE', 'Kristian', 'Grünwald', 'LM', '1969-06-07', 'm', 0),
(101, 1, 'EHRENMITGLIED', 'Nikolas', 'Frick', 'FM', '1997-05-24', 'm', 1),
(102, 1, 'ABGEMELDET', 'Sascha', 'Schiefer', 'FM', '1949-03-01', 'm', 0),
(103, 1, 'AKTIV', 'Liam', 'Steinberger', 'FM', '1984-03-16', 'm', 0),
(104, 1, 'AKTIV', 'Theodora', 'Schmidt', 'FM', '1986-02-16', 'f', 0),
(105, 1, 'AKTIV', 'Tom', 'Steinböck', 'ELM', '1945-12-18', 'm', 0),
(106, 1, 'AKTIV', 'Tristan', 'Steinböck', 'PFM', '1972-04-18', 'm', 0),
(107, 1, 'EHRENMITGLIED', 'Luana', 'Gahleitner', 'OLM', '1947-02-26', 'f', 1),
(108, 1, 'INAKTIV', 'Niko', 'Koppensteiner', 'PFM', '1983-06-04', 'm', 0),
(109, 1, 'AKTIV', 'Igor', 'Höglinger', 'FM', '1993-04-24', 'm', 1),
(110, 1, 'AKTIV', 'Mika', 'Eisl', 'LM', '1988-05-30', 'm', 0),
(111, 1, 'ABGEMELDET', 'Fernando', 'Bichler', 'OLM', '1952-11-17', 'm', 0),
(112, 1, 'AKTIV', 'Manuel', 'Kramer', 'OLM', '1982-10-05', 'm', 0),
(113, 1, 'AKTIV', 'Friedrich', 'Berchtold', 'FM', '1995-07-15', 'm', 0),
(114, 1, 'AKTIV', 'Mike', 'Punz', 'EHBM', '1982-09-29', 'm', 1),
(115, 1, 'RESERVE', 'Aurelio', 'Prem', 'BI', '1976-03-13', 'm', 0),
(116, 1, 'RESERVE', 'Phillip', 'Böck', 'FM', '1999-11-15', 'm', 0),
(117, 1, 'AKTIV', 'Lars', 'Rosner', 'BI', '1973-10-05', 'm', 0),
(118, 1, 'AKTIV', 'Richard', 'Nowak', 'FM', '1989-12-28', 'm', 0),
(119, 1, 'INAKTIV', 'Valentino', 'Grabher', 'EHBM', '1992-11-27', 'm', 1),
(120, 1, 'AKTIV', 'Rene', 'Strauss', 'FM', '1993-02-17', 'm', 0),
(121, 1, 'AKTIV', 'Isa', 'Holzmann', 'LM', '1969-09-13', 'm', 1),
(122, 1, 'EHRENMITGLIED', 'Lean', 'Peer', 'FM', '1953-05-23', 'm', 1),
(123, 1, 'AKTIV', 'Rene', 'Simon', 'OLM', '2000-05-10', 'm', 0),
(124, 1, 'AKTIV', 'Niklas', 'Moser', 'LM', '1987-04-24', 'm', 1),
(125, 1, 'INAKTIV', 'Sascha', 'Gamsjäger', 'FM', '1995-11-22', 'm', 0),
(126, 1, 'ABGEMELDET', 'Nikolai', 'Weidinger', 'FM', '1999-09-13', 'm', 1),
(127, 1, 'AKTIV', 'Patrik', 'Wirth', 'LM', '1971-12-17', 'm', 0),
(128, 1, 'EHRENMITGLIED', 'Milan', 'Schmid', 'FM', '1945-01-05', 'm', 1),
(129, 1, 'AKTIV', 'Konstantin', 'Probst', 'LM', '1950-12-09', 'm', 0),
(130, 1, 'RESERVE', 'Heinrich', 'Brandstätter', 'FM', '1968-12-06', 'm', 0),
(131, 1, 'INAKTIV', 'Alice', 'Gmeiner', 'LM', '1982-10-27', 'f', 1),
(132, 1, 'AKTIV', 'Theo', 'Schatz', 'FM', '1961-09-16', 'm', 0),
(133, 1, 'AKTIV', 'Nicolai', 'Brandner', 'LM', '1979-09-19', 'm', 0),
(134, 1, 'INAKTIV', 'Marissa', 'Gahleitner', 'FM', '1949-04-22', 'f', 1),
(135, 1, 'AKTIV', 'Rosa', 'Hermann', 'LM', '1966-03-30', 'f', 1),
(136, 1, 'AKTIV', 'Kilian', 'Berchtold', 'FM', '1980-01-26', 'm', 0),
(137, 1, 'AKTIV', 'Luka', 'Rausch', 'FM', '1952-04-14', 'm', 1),
(138, 1, 'AKTIV', 'Lorenz', 'Beck', 'FM', '1995-09-24', 'm', 1),
(139, 1, 'AKTIV', 'Tristan', 'Müllner', 'OLM', '1969-05-15', 'm', 0),
(140, 1, 'AKTIV', 'Leopold', 'Dorner', 'FM', '2004-07-05', 'm', 0),
(141, 1, 'ABGEMELDET', 'Alexandar', 'Mitteregger', 'ABI', '1988-12-24', 'm', 0),
(142, 1, 'INAKTIV', 'Anton', 'Weissenböck', 'FM', '1938-11-05', 'm', 1),
(143, 1, 'EHRENMITGLIED', 'Philip', 'Keplinger', 'FM', '1954-03-14', 'm', 1),
(144, 1, 'AKTIV', 'Matthias', 'Bachinger', 'OLM', '1985-04-04', 'm', 1),
(145, 1, 'EHRENMITGLIED', 'Georg', 'Oberleitner', 'LM', '1991-12-19', 'm', 1),
(146, 1, 'AKTIV', 'Martina', 'Lackner', 'ABI', '2002-06-15', 'f', 1),
(147, 1, 'AKTIV', 'Caroline', 'Kucera', 'FM', '1975-09-22', 'f', 1),
(148, 1, 'AKTIV', 'Gabriel', 'Vogl', 'PFM', '1972-09-12', 'm', 1),
(149, 1, 'AKTIV', 'Max', 'Schatz', 'FM', '1996-02-27', 'm', 1),
(150, 1, 'INAKTIV', 'Emilie', 'Wilhelm', 'LM', '1999-04-10', 'f', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oxygen_bottles`
--

CREATE TABLE `oxygen_bottles` (
  `id` int NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `last_inspection` date DEFAULT NULL,
  `filling_pressure` int DEFAULT NULL,
  `filling_capacity_liter` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `oxygen_bottles`
--

INSERT INTO `oxygen_bottles` (`id`, `type`, `barcode`, `last_inspection`, `filling_pressure`, `filling_capacity_liter`) VALUES
(21, 'Stahl', NULL, '2002-08-01', 291, 10),
(22, 'Composite', NULL, '2001-12-10', 284, 11),
(23, 'Composite', NULL, '2004-08-11', 300, 7),
(24, 'Alu', NULL, '2023-02-08', 294, 11),
(25, 'Stahl', NULL, '2023-05-27', 262, 9),
(26, 'Alu', NULL, '2014-05-05', 297, 6),
(27, 'Alu', NULL, '2009-09-08', 260, 11),
(28, 'Alu', NULL, '2005-12-19', 277, 10),
(29, 'Stahl', NULL, '2009-01-19', 294, 12),
(30, 'Alu', NULL, '2008-03-27', 297, 4),
(31, 'Stahl', NULL, '2008-10-31', 258, 12),
(32, 'Composite', NULL, '2017-08-23', 293, 10),
(33, 'Stahl', NULL, '2023-09-08', 215, 7),
(34, 'Alu', NULL, '2011-04-27', 212, 5),
(35, 'Stahl', NULL, '2018-09-03', 207, 9),
(36, 'Alu', NULL, '2022-06-29', 275, 9),
(37, 'Alu', NULL, '2019-12-21', 219, 5),
(38, 'Alu', NULL, '2024-01-10', 276, 7),
(39, 'Alu', NULL, '2002-02-17', 289, 6),
(40, 'Stahl', NULL, '2012-07-19', 220, 12);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oxygen_masks`
--

CREATE TABLE `oxygen_masks` (
  `id` int NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `connection_type` varchar(50) DEFAULT NULL,
  `pressure_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `oxygen_masks`
--

INSERT INTO `oxygen_masks` (`id`, `type`, `connection_type`, `pressure_type`) VALUES
(1, 'PANORAMA NOVA', 'Gewindeanschluss', 'ÜD'),
(2, 'PANORAMA NOVA', 'Gewindeanschluss', 'ÜD'),
(3, 'PANORAMA NOVA', 'Steckanschluss', 'ND'),
(4, '3S-PF', 'Steckanschluss', 'ND'),
(5, 'PANORAMA NOVA', 'Steckanschluss', 'ÜD'),
(6, '3S-PF', 'Steckanschluss', 'ND'),
(7, 'PANORAMA NOVA', 'Steckanschluss', 'ÜD'),
(8, 'ULTRA-ELITE', 'Steckanschluss', 'ÜD'),
(9, 'PANORAMA NOVA', 'Steckanschluss', 'ÜD'),
(10, '3S-PF', 'Steckanschluss', 'ÜD'),
(11, 'ULTRA-ELITE', 'Steckanschluss', 'ÜD'),
(12, '3S-PF', 'Gewindeanschluss', 'ÜD'),
(13, 'PANORAMA NOVA', 'Steckanschluss', 'ND'),
(14, '3S-PF', 'Gewindeanschluss', 'ND'),
(15, 'ULTRA-ELITE', 'Steckanschluss', 'ÜD'),
(16, 'ULTRA-ELITE', 'Steckanschluss', 'ND'),
(17, 'ULTRA-ELITE', 'Steckanschluss', 'ND'),
(18, '3S-PF', 'Steckanschluss', 'ND'),
(19, 'ULTRA-ELITE', 'Gewindeanschluss', 'ND'),
(20, '3S-PF', 'Steckanschluss', 'ÜD');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pressure_regulators`
--

CREATE TABLE `pressure_regulators` (
  `id` int NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `pressure_type` varchar(50) DEFAULT NULL,
  `connection_type` varchar(50) DEFAULT NULL,
  `breathing_apparatus_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `pressure_regulators`
--

INSERT INTO `pressure_regulators` (`id`, `type`, `pressure_type`, `connection_type`, `breathing_apparatus_number`) VALUES
(61, 'PA90', 'ND', 'M45x3', 'PA1'),
(62, 'PA94', 'ÜD', 'AS', 'PA2'),
(63, 'PA94', 'ND', 'AS', 'PA3'),
(64, 'PA98', 'ND', 'M45x3', 'PA4'),
(65, 'PA98', 'ÜD', 'AS', 'PA5'),
(66, 'PA90', 'ÜD', 'AS', 'PA6'),
(67, 'PA90', 'ÜD', 'M45x3', 'PA7'),
(68, 'PA97', 'ND', 'AS', 'PA8'),
(69, 'PA96', 'ÜD', 'M45x3', 'PA9'),
(70, 'PA97', 'ÜD', 'M45x3', 'PA10'),
(71, 'PA90', 'ND', 'AS', 'PA11'),
(72, 'PA97', 'ÜD', 'AS', 'PA12'),
(73, 'PA97', 'ND', 'AS', 'PA13'),
(74, 'PA97', 'ND', 'M45x3', 'PA14'),
(75, 'PA97', 'ND', 'AS', 'PA15'),
(76, 'PA94', 'ÜD', 'AS', 'PA16'),
(77, 'PA90', 'ND', 'M45x3', 'PA17'),
(78, 'PA96', 'ÜD', 'AS', 'PA18'),
(79, 'PA98', 'ND', 'M45x3', 'PA19'),
(80, 'PA97', 'ND', 'M45x3', 'PA20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'admin', 'role with root privilegues'),
(2, 'respiratory-protection', 'role with access to respiratory protection data');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `usage_actions`
--

CREATE TABLE `usage_actions` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `usage_actions`
--

INSERT INTO `usage_actions` (`id`, `name`, `type`, `description`) VALUES
(1, 'Gebrauch', NULL, 'Gebruach von Geräten'),
(2, 'Reinigung', NULL, 'Standardreinigung'),
(3, 'Desinfektion', NULL, 'Desinfektion von Geräten'),
(4, 'Wartung', NULL, 'Standardwartung von Geräten'),
(5, 'Funktionsprüfung statisch', 'oxygen_mask', 'Maskenüberprüfung'),
(6, 'Funktionsprüfung statisch', 'pressure_regulator', 'Lungenautomatenüberprüfung statisch'),
(7, 'Funktionsprüfung statisch', 'breathing_apparatus', 'Pressluftatmerüberprüfung statisch');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `hashed_password` varchar(200) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `hashed_password`, `first_name`, `last_name`, `is_active`) VALUES
(1, 'admin', 'admin@asdf.at', '$scrypt$ln=16,r=8,p=1$MuY8J4SQMuZcS6n1Xqu1tg$uxbWfbAZnVDYxq09JLkQ98fWHQ9Ar+cs7w3b5i0Pi2Y', 'Admin', 'Root', 1),
(2, 'resprot', 'resprot@ff.at', '$scrypt$ln=16,r=8,p=1$I2SMMWZMSel9b03JGYPw3g$9O8dUNykgf2LCoT3LhpovkkMndc4pyecDv4sC5ltQJ8', 'Alfred', 'Atemschutz', 1),
(3, 'readonly', 'readonly@read.at', '$scrypt$ln=16,r=8,p=1$sPY+J4SwNmbMeY8xhrA2Jg$DcdWnZ9grd9rvqXgK0COuMVtehjg5H/VAN++3MiOsPE', 'Robert', 'Readonly', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_role_association`
--

CREATE TABLE `user_role_association` (
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `user_role_association`
--

INSERT INTO `user_role_association` (`user_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_type_id` (`activity_type_id`);

--
-- Indizes für die Tabelle `activity_member_association`
--
ALTER TABLE `activity_member_association`
  ADD PRIMARY KEY (`activity_id`,`member_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indizes für die Tabelle `activity_types`
--
ALTER TABLE `activity_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indizes für die Tabelle `breathing_apparatuses`
--
ALTER TABLE `breathing_apparatuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pressure_regulator_number` (`pressure_regulator_number`);

--
-- Indizes für die Tabelle `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `device_number` (`device_number`);

--
-- Indizes für die Tabelle `device_device_usage_record_association`
--
ALTER TABLE `device_device_usage_record_association`
  ADD PRIMARY KEY (`device_usage_record_id`,`device_id`,`usage_action_id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `usage_action_id` (`usage_action_id`);

--
-- Indizes für die Tabelle `device_usage_records`
--
ALTER TABLE `device_usage_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `activity_id` (`activity_id`);

--
-- Indizes für die Tabelle `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`stbnr`);

--
-- Indizes für die Tabelle `oxygen_bottles`
--
ALTER TABLE `oxygen_bottles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcode` (`barcode`);

--
-- Indizes für die Tabelle `oxygen_masks`
--
ALTER TABLE `oxygen_masks`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pressure_regulators`
--
ALTER TABLE `pressure_regulators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `breathing_apparatus_number` (`breathing_apparatus_number`);

--
-- Indizes für die Tabelle `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indizes für die Tabelle `usage_actions`
--
ALTER TABLE `usage_actions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_usage_action` (`name`,`type`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indizes für die Tabelle `user_role_association`
--
ALTER TABLE `user_role_association`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `activity_types`
--
ALTER TABLE `activity_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT für Tabelle `device_usage_records`
--
ALTER TABLE `device_usage_records`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `members`
--
ALTER TABLE `members`
  MODIFY `stbnr` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT für Tabelle `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `usage_actions`
--
ALTER TABLE `usage_actions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`activity_type_id`) REFERENCES `activity_types` (`id`);

--
-- Constraints der Tabelle `activity_member_association`
--
ALTER TABLE `activity_member_association`
  ADD CONSTRAINT `activity_member_association_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `activity_member_association_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`stbnr`);

--
-- Constraints der Tabelle `breathing_apparatuses`
--
ALTER TABLE `breathing_apparatuses`
  ADD CONSTRAINT `breathing_apparatuses_ibfk_1` FOREIGN KEY (`id`) REFERENCES `devices` (`id`);

--
-- Constraints der Tabelle `device_device_usage_record_association`
--
ALTER TABLE `device_device_usage_record_association`
  ADD CONSTRAINT `device_device_usage_record_association_ibfk_1` FOREIGN KEY (`device_usage_record_id`) REFERENCES `device_usage_records` (`id`),
  ADD CONSTRAINT `device_device_usage_record_association_ibfk_2` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  ADD CONSTRAINT `device_device_usage_record_association_ibfk_3` FOREIGN KEY (`usage_action_id`) REFERENCES `usage_actions` (`id`);

--
-- Constraints der Tabelle `device_usage_records`
--
ALTER TABLE `device_usage_records`
  ADD CONSTRAINT `device_usage_records_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `device_usage_records_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`);

--
-- Constraints der Tabelle `oxygen_bottles`
--
ALTER TABLE `oxygen_bottles`
  ADD CONSTRAINT `oxygen_bottles_ibfk_1` FOREIGN KEY (`id`) REFERENCES `devices` (`id`);

--
-- Constraints der Tabelle `oxygen_masks`
--
ALTER TABLE `oxygen_masks`
  ADD CONSTRAINT `oxygen_masks_ibfk_1` FOREIGN KEY (`id`) REFERENCES `devices` (`id`);

--
-- Constraints der Tabelle `pressure_regulators`
--
ALTER TABLE `pressure_regulators`
  ADD CONSTRAINT `pressure_regulators_ibfk_1` FOREIGN KEY (`id`) REFERENCES `devices` (`id`);

--
-- Constraints der Tabelle `user_role_association`
--
ALTER TABLE `user_role_association`
  ADD CONSTRAINT `user_role_association_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_role_association_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
