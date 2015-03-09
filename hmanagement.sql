-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.12-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table hmanagement.admission_type
CREATE TABLE IF NOT EXISTS `admission_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hmanagement.admission_type: ~0 rows (approximately)
/*!40000 ALTER TABLE `admission_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `admission_type` ENABLE KEYS */;


-- Dumping structure for table hmanagement.department
CREATE TABLE IF NOT EXISTS `department` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table hmanagement.department: ~0 rows (approximately)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`ID`, `CODE`, `NAME`) VALUES
	(1, '', 'Cardiology');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;


-- Dumping structure for table hmanagement.doctor
CREATE TABLE IF NOT EXISTS `doctor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(150) DEFAULT NULL,
  `ADDRESS` varchar(250) DEFAULT NULL,
  `DEPARTMENT_ID` int(11) NOT NULL,
  `DUTY_HRS` varchar(100) DEFAULT NULL,
  `QUALIFICATION` varchar(250) DEFAULT NULL,
  `CONSULTATION_FEE` varchar(10) DEFAULT '0',
  `WEEKLY_OFF_DAY` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table hmanagement.doctor: ~2 rows (approximately)
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` (`ID`, `CODE`, `NAME`, `ADDRESS`, `DEPARTMENT_ID`, `DUTY_HRS`, `QUALIFICATION`, `CONSULTATION_FEE`, `WEEKLY_OFF_DAY`) VALUES
	(1, '', 'testdoc', 'udaipur', 1, '10-10', 'MBBS', '200', 'satuarday'),
	(2, '', 'hemant', 'maharani farm__durgapura', 1, '10-10', 'MS', '200', 'Sun');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;


-- Dumping structure for table hmanagement.medicine
CREATE TABLE IF NOT EXISTS `medicine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `RATE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hmanagement.medicine: ~0 rows (approximately)
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;


-- Dumping structure for table hmanagement.module
CREATE TABLE IF NOT EXISTS `module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hmanagement.module: ~0 rows (approximately)
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
/*!40000 ALTER TABLE `module` ENABLE KEYS */;


-- Dumping structure for table hmanagement.services
CREATE TABLE IF NOT EXISTS `services` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `DEPARTMENT_ID` int(11) NOT NULL,
  `SERVICES_CHARGES` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hmanagement.services: ~0 rows (approximately)
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;


-- Dumping structure for table hmanagement.staff
CREATE TABLE IF NOT EXISTS `staff` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(150) DEFAULT NULL,
  `ADDRESS` varchar(250) DEFAULT NULL,
  `DEPARTMENT_ID` int(11) NOT NULL,
  `DUTY_HRS` varchar(100) DEFAULT NULL,
  `QUALIFICATION` varchar(200) DEFAULT NULL,
  `LOGIN_TYPE_CODE` int(11) NOT NULL,
  `USER_ID` varchar(200) DEFAULT NULL,
  `PASSWORD` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table hmanagement.staff: ~1 rows (approximately)
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` (`ID`, `CODE`, `NAME`, `ADDRESS`, `DEPARTMENT_ID`, `DUTY_HRS`, `QUALIFICATION`, `LOGIN_TYPE_CODE`, `USER_ID`, `PASSWORD`) VALUES
	(1, '', 'Hemant', 'udaipur', 1, '08AM. to 04PM', 'BCA,MCA,Phd', 1, 'hemant', '1234');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;


-- Dumping structure for table hmanagement.test
CREATE TABLE IF NOT EXISTS `test` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) DEFAULT NULL,
  `RATE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hmanagement.test: ~0 rows (approximately)
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;


-- Dumping structure for table hmanagement.ward
CREATE TABLE IF NOT EXISTS `ward` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table hmanagement.ward: ~0 rows (approximately)
/*!40000 ALTER TABLE `ward` DISABLE KEYS */;
INSERT INTO `ward` (`ID`, `CODE`, `NAME`) VALUES
	(2, '', 'General');
/*!40000 ALTER TABLE `ward` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
