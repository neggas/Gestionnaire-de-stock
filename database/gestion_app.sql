-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 12, 2020 at 07:56 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestion_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actions` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `dates` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `actions`, `product`, `amount`, `dates`) VALUES
(3, 'vente', 'Nissan', 2, '2020-07-12 10:45:42'),
(4, 'vente', 'Nissan', 2, '2020-07-12 11:14:38'),
(5, 'ajout', 'toyaota', 12, '2020-07-12 11:43:32'),
(6, 'vente', 'Nissan', 1, '2020-07-12 11:54:02'),
(7, 'vente', 'Peugeot 307', 10, '2020-07-12 11:56:29'),
(8, 'vente', 'Peugeot 307', 10, '2020-07-12 11:57:55'),
(9, 'vente', 'Peugeot 307', 3, '2020-07-12 11:58:20'),
(10, 'vente', 'Peugeot 307', 3, '2020-07-12 12:05:33'),
(11, 'vente', 'Peugeot 408', 2, '2020-07-12 12:13:34'),
(12, 'ajout', 'utsuzu', 5, '2020-07-12 12:14:27'),
(13, 'vente', 'Peugeot 307', 3, '2020-07-12 19:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `ref` text NOT NULL,
  `amount` text NOT NULL,
  `price_ht` text NOT NULL,
  `price_ttc` text NOT NULL,
  `notes` text NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `ref`, `amount`, `price_ht`, `price_ttc`, `notes`, `image`) VALUES
(20, 'Nissan', '23490-34', '3', '18 000', '20 000', 'Voiture toute équipé.', './assets/img/locaion-voiture-rentacar-economique.png'),
(21, 'Peugeot 307', '244-3', '10', '10 000', '12 000', 'Voiture sportive', './assets/img/location-voiture.png'),
(22, 'Peugeot 408', '123-4', '2', '8 000', '10 000', 'Voiture citadine', './assets/img/locaion-voiture-rentacar-economique.png'),
(23, 'Clio', '23-2345', '9', '12 000', '10 000', 'Voiture citadine', './assets/img/ma new vature clio3.jpg2..jpg'),
(24, 'Peugeot 407', '24555-8', '23', '7 000', '10 000', 'Voiture citadine', './assets/img/images.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(50) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `mdp` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `pseudo`, `mail`, `mdp`) VALUES
(44, 'az', 'az@az.fr', '90283840d90de49b8e7984bd99b47fee0d4bd50d');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
