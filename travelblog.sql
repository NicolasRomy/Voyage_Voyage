-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 31, 2021 at 06:16 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travelblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PSEUDO` tinytext NOT NULL,
  `PASSWORD` tinytext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `PSEUDO`, `PASSWORD`) VALUES
(1, 'Jean-luc', '$2y$10$4zM7BdBkvPkCI4oXRIqUk.JiVzZIb7sR8JWOGe6vC.B0g.T/q.1Ku'),
(2, 'xxdarkslayerxx', '$2y$10$b9V5TdyK3YiOX.QWb.XkOeYYywLwBgKdQ.BCLE18Ip7RQXDgWgRp2');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`ID`, `Title`, `Image`, `Content`, `Publication_date`, `Article_content_date`, `country_ID`) VALUES
(1, 'A DAY IN Italy', 'https://miro.medium.com/max/700/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg', 'YESTERDAY I WEN TO INDIA', '2021-03-30 18:25:41', '2021-03-29 18:25:41', 7),
(2, 'a day in france', 'https://headinablender.files.wordpress.com/2014/07/french-cliche.jpg', 'today i was in france blabla bla', '2021-03-17 01:03:26', '2021-03-01 01:03:26', 5),
(3, 'A Day in Spain', 'https://collegelearners.com/wp-content/uploads/2021/02/studyspain.jpg', 'today i was in spain lorem ipsum', '2021-03-01 01:05:45', '2021-03-01 01:05:45', 6),
(4, 'another day in france', 'https://www.imf.org/-/media/Images/IMF/News/news-article-images/2020/CF-570x312-France-legna69-by-Getty-images-iStock-1226730497.ashx?mh=304&la=en&h=304&w=556&mw=561', 'wow another beautifull day in france\r\n', '2021-03-24 03:12:11', '2021-03-14 03:12:11', 5),
(5, 'Another day in spain', 'https://www.trafalgar.com/real-word/wp-content/uploads/sites/3/2018/04/Toledo-Spain-www.istockphoto.com_gb_photo_toledo-spain-gm464975554-58756952-SeanPavonePhoto.jpg', 'WOW yet another day in spain', '2021-03-15 07:22:31', '2021-03-16 07:22:31', 6),
(6, 'VENICE TODAY', 'data:image/jpeg;base64,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', '', '2021-03-06 07:24:04', '2021-03-26 07:24:04', 7);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE` datetime NOT NULL,
  `Pseudo` tinytext NOT NULL,
  `Content` text NOT NULL,
  `article_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `article_ID` (`article_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`ID`, `DATE`, `Pseudo`, `Content`, `article_ID`) VALUES
(2, '2021-03-02 05:30:05', 'lalaland', 'tres tres bon article', 2),
(3, '2021-03-26 20:58:38', 'Vansman', 'wow', 2),
(4, '2021-03-26 20:58:38', 'Vansman', 'wow', 1),
(5, '2021-03-02 05:30:05', 'lalaland', 'tres tres bon article', 1),
(6, '2021-03-02 05:30:05', 'lalaland', 'tres tres bon article', 3),
(7, '2021-03-02 05:30:05', 'lalaland', 'tres tres bon article', 3),
(8, '2021-03-02 05:30:05', 'lalaland', 'tres tres bon article', 4),
(9, '2021-03-02 05:30:05', 'lalaland', 'tres tres bon article', 5),
(10, '2021-03-02 05:30:05', 'lalaland', 'tres tres bon article', 6);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
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
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`ID`, `ADMIN_ID`, `Name`) VALUES
(5, 1, 'France'),
(6, 2, 'Spain'),
(7, 1, 'Italy');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `Country` FOREIGN KEY (`country_ID`) REFERENCES `countries` (`ID`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `article_ID` FOREIGN KEY (`article_ID`) REFERENCES `articles` (`ID`);

--
-- Constraints for table `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `Admin_ID` FOREIGN KEY (`ADMIN_ID`) REFERENCES `admin` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
