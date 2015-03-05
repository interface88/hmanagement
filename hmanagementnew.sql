-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2015 at 10:12 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hmanagement`
--
CREATE DATABASE IF NOT EXISTS `hmanagement` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hmanagement`;

-- --------------------------------------------------------

--
-- Table structure for table `admission_type`
--

CREATE TABLE IF NOT EXISTS `admission_type` (
  `CODE` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `CODE` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`CODE`, `NAME`) VALUES
(1, 'Cardiology');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (
  `CODE` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(150) DEFAULT NULL,
  `ADDRESS` varchar(250) DEFAULT NULL,
  `DEPARTMENT_CODE` int(11) NOT NULL,
  `DUTY_HRS` varchar(100) DEFAULT NULL,
  `QUALIFICATION` varchar(250) DEFAULT NULL,
  `CONSULTATION_FEE` varchar(10) DEFAULT '0',
  `WEEKLY_OFF_DAY` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`CODE`, `NAME`, `ADDRESS`, `DEPARTMENT_CODE`, `DUTY_HRS`, `QUALIFICATION`, `CONSULTATION_FEE`, `WEEKLY_OFF_DAY`) VALUES
(1, 'testdoc', 'udaipur', 1, '10-10', 'MBBS', '200', 'satuarday'),
(2, 'hemant', 'maharani farm__durgapura', 1, '10-10', 'MS', '200', 'Sun');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE IF NOT EXISTS `medicine` (
  `CODE` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) DEFAULT NULL,
  `RATE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `CODE` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `CODE` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) DEFAULT NULL,
  `DEPARTMENT_CODE` int(11) NOT NULL,
  `SERVICES_CHARGES` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `CODE` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(150) DEFAULT NULL,
  `ADDRESS` varchar(250) DEFAULT NULL,
  `DEPARTMENT_CODE` int(11) NOT NULL,
  `DUTY_HRS` varchar(100) DEFAULT NULL,
  `QUALIFICATION` varchar(200) DEFAULT NULL,
  `LOGIN_TYPE_CODE` int(11) NOT NULL,
  `USER_ID` varchar(200) DEFAULT NULL,
  `PASSWORD` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`CODE`, `NAME`, `ADDRESS`, `DEPARTMENT_CODE`, `DUTY_HRS`, `QUALIFICATION`, `LOGIN_TYPE_CODE`, `USER_ID`, `PASSWORD`) VALUES
(1, 'Hemant', 'udaipur', 1, '08AM. to 04PM', 'BCA,MCA,Phd', 1, 'hemant', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `CODE` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) DEFAULT NULL,
  `RATE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE IF NOT EXISTS `ward` (
  `CODE` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
