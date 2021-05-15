-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 14, 2021 at 01:19 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr13_bigevents_bettina`
--
CREATE DATABASE IF NOT EXISTS `cr13_bigevents_bettina` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr13_bigevents_bettina`;

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210514094335', '2021-05-14 09:43:44', 40);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int(11) NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `name`, `date`, `description`, `location`, `picture`, `capacity`, `phone`, `email`, `url`) VALUES
(1, 'Tash Sultana', '2021-09-01 20:00:00', 'TASH SULTANA is an explosive global producer and artist who has commanded attention worldwide since homemade videos went viral on YouTube.', 'Arena Wien, Baumgasse 80, 1030 Vienna', 'https://www.volume.at/cdn/event/Tash-Sultana-720x377-3__photo_x1.jpg', 2500, '01 7988595', 'arena@arena.co.at', 'https://arena.wien/'),
(6, 'Avec', '2021-07-04 20:00:00', 'AVEC appeared seemingly out of nowhere in 2015. With the release of her debut EP “Heartbeats”, the young Upper Austrian has bridged the gap between writing heartfelt lyrics and experimenting with textural sounds.', 'Globe, Karl Farkas Gasse 19, 1030 Vienna', 'https://cdn.kurier.at/img/100/260/179/avec-2020.jpg', 1000, '01 5889340', 'office@globewien.at', 'https://www.globe.wien/'),
(7, 'Tosca', '2021-05-24 18:30:00', 'Rome, 1800: The city suffers from Scarpias, the Chief Constables, reign of terror. The seditious painter Cavaradossi falls into his clutches and is bound to be executed. His beloved Tosca - chased after by Scarpia - strikes a bargain.', 'Vienna State Opera, Opernring 2, 1010 Vienna', 'https://www.wiener-staatsoper.at/fileadmin/_processed_/3/e/csm_VIDEO_pink_bb3543df37.jpg', 1700, '01 514442250', 'information@wiener-staatsoper.at', 'wiener-staatsoper.at'),
(8, 'Wien is ur oasch 1.0', '2021-06-18 19:30:00', 'Wien is ur oasch! Aber auch ur leiwand!\r\nWas Wien abseits des Mainstreams musikalisch so zu bieten hat, findet sich gesammelt auf der Spotify Playlist „Wien is ur oasch!“.', 'Szene Wien, Hauffgasse 26, 1110 Vienna', 'http://www.new-metal-media.de/wp-content/uploads/2016/03/Szene-Wien.jpg', 400, '01 332464125', 'office@szenewien.at', 'http://www.planet.tt/'),
(9, 'Fink', '2022-05-13 20:00:00', 'Fink began as the performing alias of British DJ/electronic musician Fin Greenall, who started out making downtempo trip-hop before expanding the project into a more songwriting-focused indie band.', 'Gasometer, Guglgasse 8, 1110 Vienna', 'https://ninjatune.net/images/artists/fink-main.jpg', 3600, '01 7436430', 'office@planet.tt', 'http://www.planet.tt/');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
