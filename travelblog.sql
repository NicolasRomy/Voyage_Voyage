-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 30 mars 2021 à 16:31
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `travelblog`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PSEUDO` tinytext NOT NULL,
  `PASSWORD` tinytext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`ID`, `PSEUDO`, `PASSWORD`) VALUES
(1, 'Jean-luc', '$2y$10$4zM7BdBkvPkCI4oXRIqUk.JiVzZIb7sR8JWOGe6vC.B0g.T/q.1Ku'),
(2, 'xxdarkslayerxx', '$2y$10$b9V5TdyK3YiOX.QWb.XkOeYYywLwBgKdQ.BCLE18Ip7RQXDgWgRp2');

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` text NOT NULL,
  `Image` text NOT NULL,
  `Content` text NOT NULL,
  `Publication_date` datetime NOT NULL,
  `Article_content_date` datetime NOT NULL,
  `country_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Country` (`country_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`ID`, `Title`, `Image`, `Content`, `Publication_date`, `Article_content_date`, `country_ID`) VALUES
(1, 'A DAY IN INDIA', 'https://miro.medium.com/max/700/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg', 'YESTERDAY I WEN TO INDIA', '2021-03-30 18:25:41', '2021-03-29 18:25:41', 7);

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE` datetime NOT NULL,
  `Pseudo` tinytext NOT NULL,
  `Content` int(11) NOT NULL,
  `article_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `article_ID` (`article_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADMIN_ID` int(11) NOT NULL,
  `Name` tinytext NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Admin_ID` (`ADMIN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `countries`
--

INSERT INTO `countries` (`ID`, `ADMIN_ID`, `Name`) VALUES
(5, 1, 'France'),
(6, 2, 'Spain'),
(7, 1, 'Italy');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `Country` FOREIGN KEY (`country_ID`) REFERENCES `countries` (`ID`);

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `article_ID` FOREIGN KEY (`article_ID`) REFERENCES `articles` (`ID`);

--
-- Contraintes pour la table `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `Admin_ID` FOREIGN KEY (`ADMIN_ID`) REFERENCES `admin` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
