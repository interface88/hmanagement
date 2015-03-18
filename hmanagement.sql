-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 18, 2015 at 08:44 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `admission_type`
--

CREATE TABLE IF NOT EXISTS `admission_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admission_type`
--

INSERT INTO `admission_type` (`ID`, `CODE`, `NAME`) VALUES
(1, 'OPT', 'Operation'),
(2, 'GCARE', 'General Care');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`ID`, `CODE`, `NAME`) VALUES
(1, '', 'Cardiology'),
(2, 'ORTHO', 'Orthopadics');

-- --------------------------------------------------------

--
-- Table structure for table `discharge_ticket`
--

CREATE TABLE IF NOT EXISTS `discharge_ticket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STAFF_NAME` varchar(100) NOT NULL,
  `ENTRY_DATE` date NOT NULL,
  `ADMISSION_ID` varchar(200) NOT NULL,
  `PATIENT_ID` int(11) NOT NULL,
  `IPD_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `TREATMENT_NOTE` varchar(300) NOT NULL,
  `DISCHARGE_NOTE` varchar(300) NOT NULL,
  `ADVICE` varchar(300) NOT NULL,
  `CONDITION_OF_PATIENT` varchar(300) NOT NULL,
  `PRESSURE` varchar(100) DEFAULT NULL,
  `PULSE` varchar(100) DEFAULT NULL,
  `TEMPERATURE` varchar(100) DEFAULT NULL,
  `SUGAR` varchar(100) DEFAULT NULL,
  `WEIGHT` varchar(100) DEFAULT NULL,
  `EXAMING_TIME` varchar(100) DEFAULT NULL,
  `PRESCRIBED_MEDICINE` varchar(100) DEFAULT NULL,
  `FOLLOW_UP_SCHEDULE` varchar(100) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `discharge_ticket`
--

INSERT INTO `discharge_ticket` (`ID`, `STAFF_NAME`, `ENTRY_DATE`, `ADMISSION_ID`, `PATIENT_ID`, `IPD_ID`, `DOCTOR_ID`, `TREATMENT_NOTE`, `DISCHARGE_NOTE`, `ADVICE`, `CONDITION_OF_PATIENT`, `PRESSURE`, `PULSE`, `TEMPERATURE`, `SUGAR`, `WEIGHT`, `EXAMING_TIME`, `PRESCRIBED_MEDICINE`, `FOLLOW_UP_SCHEDULE`, `REMARK`) VALUES
(1, 'hemant', '2015-03-17', 'HMS/ADD_ID/3', 4, 1, 3, 'fsdf', 'sdfsd', 'sdfsd', 'ewrwer', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(150) NOT NULL,
  `ADDRESS1` varchar(250) DEFAULT NULL,
  `ADDRESS2` varchar(250) DEFAULT NULL,
  `DEPARTMENT_ID` int(11) NOT NULL,
  `DUTY_HRS` varchar(100) DEFAULT NULL,
  `QUALIFICATION` varchar(250) DEFAULT NULL,
  `CONSULTATION_FEE` decimal(10,2) DEFAULT '0.00',
  `WEEKLY_OFF_DAY` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`ID`, `CODE`, `NAME`, `ADDRESS1`, `ADDRESS2`, `DEPARTMENT_ID`, `DUTY_HRS`, `QUALIFICATION`, `CONSULTATION_FEE`, `WEEKLY_OFF_DAY`) VALUES
(2, '', 'hemant', 'maharani farm__durgapura', '', 1, '10-9', 'MS', 300.00, 'Sun'),
(3, 'IK', 'irfan khan', 'Sec-9', 'savina udaipur', 2, '10-7', 'MBBS', 500.00, 'Sunday');

-- --------------------------------------------------------

--
-- Table structure for table `final_bill`
--

CREATE TABLE IF NOT EXISTS `final_bill` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STAFF_NAME` varchar(100) NOT NULL,
  `ENTRY_DATE` date NOT NULL,
  `ADMISSION_ID` varchar(50) NOT NULL,
  `PATIENT_ID` int(11) NOT NULL,
  `IPD_ID` int(11) NOT NULL,
  `ADMISSION_TYPE_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `BILL_NO` varchar(50) NOT NULL,
  `BILL_DATE` date NOT NULL,
  `GROSS_TOTAL` double(10,2) NOT NULL,
  `DISCOUNT` double(10,2) DEFAULT NULL,
  `TAX` double(10,2) DEFAULT NULL,
  `NET_AMOUNT` double(10,2) NOT NULL,
  `BALANCE_RECEIVE_AMOUNT` double(10,2) DEFAULT NULL,
  `FINAL_RECEIVE_AMOUNT` double(10,2) DEFAULT NULL,
  `PAYMENT_MODE` varchar(50) NOT NULL,
  `CHEQUE_NUMBER` varchar(50) DEFAULT NULL,
  `CHEQUE_DATE` date DEFAULT NULL,
  `DISCHARGE_DATE` date NOT NULL,
  `BANK` varchar(100) DEFAULT NULL,
  `OTHER_DETAILS` varchar(100) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `final_bill`
--

INSERT INTO `final_bill` (`ID`, `STAFF_NAME`, `ENTRY_DATE`, `ADMISSION_ID`, `PATIENT_ID`, `IPD_ID`, `ADMISSION_TYPE_ID`, `DOCTOR_ID`, `BILL_NO`, `BILL_DATE`, `GROSS_TOTAL`, `DISCOUNT`, `TAX`, `NET_AMOUNT`, `BALANCE_RECEIVE_AMOUNT`, `FINAL_RECEIVE_AMOUNT`, `PAYMENT_MODE`, `CHEQUE_NUMBER`, `CHEQUE_DATE`, `DISCHARGE_DATE`, `BANK`, `OTHER_DETAILS`, `REMARK`) VALUES
(1, 'hemant', '2015-03-17', 'HMS/ADD_ID/3', 4, 1, 1, 2, 'RAF4455', '2015-03-17', 790.00, 10.00, 5.00, 785.00, 100.00, 685.00, 'Cash', '', NULL, '2015-03-06', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ipd`
--

CREATE TABLE IF NOT EXISTS `ipd` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PATIENT_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `STAFF_NAME` varchar(50) NOT NULL,
  `ADMISSION_ID` varchar(50) NOT NULL,
  `ADMISSION_DATE` date NOT NULL,
  `ENTRY_DATE` date NOT NULL,
  `ADMISSION_TIME` varchar(10) DEFAULT NULL,
  `ADMISSION_TYPE_ID` int(11) NOT NULL,
  `WARD` varchar(50) NOT NULL,
  `BED_NO` int(5) DEFAULT NULL,
  `ADMISSION_DIAGNOSIS` varchar(50) DEFAULT NULL,
  `ADMISSION_DETAIL` varchar(50) DEFAULT NULL,
  `ADMISSION_TREATMENT` varchar(50) DEFAULT NULL,
  `ALLERGY_DETAIL` varchar(50) DEFAULT NULL,
  `SPECIAL_NOTE` varchar(50) DEFAULT NULL,
  `ADVANCE_PAYMENT` double DEFAULT NULL,
  `REMARK` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `login_type`
--

CREATE TABLE IF NOT EXISTS `login_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `login_type`
--

INSERT INTO `login_type` (`ID`, `CODE`, `NAME`) VALUES
(1, 'ADMIN', 'Administrator'),
(2, 'CSH', 'Cashier'),
(3, 'RECP', 'Receptionist'),
(4, 'NUR', 'Nursing');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE IF NOT EXISTS `medicine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `RATE` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`ID`, `CODE`, `NAME`, `RATE`) VALUES
(1, 'MED1', 'Medicine1', 100),
(2, 'MED2', 'Medicine2', 150),
(3, 'MED3', 'Medicine3', 75);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`ID`, `CODE`, `NAME`) VALUES
(1, 'OPD', 'OPD'),
(3, 'IPD', 'IPD'),
(4, 'NUR', 'Nursing');

-- --------------------------------------------------------

--
-- Table structure for table `nursing`
--

CREATE TABLE IF NOT EXISTS `nursing` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADMISSION_ID` varchar(50) NOT NULL,
  `PATIENT_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `NURSING_DATE` date NOT NULL,
  `STAFF_NAME` varchar(50) NOT NULL,
  `NO_OF_VISIT` int(11) NOT NULL,
  `PULSE` varchar(10) DEFAULT NULL,
  `TEMPERATURE` varchar(10) DEFAULT NULL,
  `PRESSURE` varchar(10) DEFAULT NULL,
  `REMARK` varchar(300) DEFAULT NULL,
  `SUGAR` varchar(10) DEFAULT NULL,
  `EXAMING_TIME` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `nursing`
--

INSERT INTO `nursing` (`ID`, `ADMISSION_ID`, `PATIENT_ID`, `DOCTOR_ID`, `NURSING_DATE`, `STAFF_NAME`, `NO_OF_VISIT`, `PULSE`, `TEMPERATURE`, `PRESSURE`, `REMARK`, `SUGAR`, `EXAMING_TIME`) VALUES
(1, 'HMS/ADD_ID/3', 4, 3, '2015-03-17', 'hemant', 4, '55', '8', '44', '', '54', '7:00 AM');

-- --------------------------------------------------------

--
-- Table structure for table `nursing_transaction`
--

CREATE TABLE IF NOT EXISTS `nursing_transaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NURSING_ID` int(11) DEFAULT NULL,
  `TREATMENT` varchar(50) NOT NULL,
  `TREATMENT_COST` double NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `opd`
--

CREATE TABLE IF NOT EXISTS `opd` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADMISSION_ID` varchar(50) NOT NULL,
  `ENTRY_DATE` varchar(50) NOT NULL,
  `PATIENT_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `STAFF_NAME` varchar(50) NOT NULL,
  `CASE_TYPE` varchar(50) NOT NULL,
  `CONSULATION_FEE` double NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `opd`
--

INSERT INTO `opd` (`ID`, `ADMISSION_ID`, `ENTRY_DATE`, `PATIENT_ID`, `DOCTOR_ID`, `STAFF_NAME`, `CASE_TYPE`, `CONSULATION_FEE`) VALUES
(1, 'HMS/ADD_ID/1', '2015-03-18', 1, 2, 'hemant', 'NEW', 320),
(2, 'HMS/ADD_ID/2', '2015-03-18', 2, 2, 'hemant', 'NEW', 600);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REGISTRATION_DATE` date NOT NULL,
  `TITLE` varchar(50) NOT NULL,
  `FIRST_NAME` varchar(50) NOT NULL,
  `MIDDLE_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) NOT NULL,
  `GENDER` varchar(50) NOT NULL,
  `DAY` int(3) DEFAULT NULL,
  `MONTH` int(2) DEFAULT NULL,
  `YEAR` int(3) DEFAULT NULL,
  `CONTACT_INFO` varchar(50) DEFAULT NULL,
  `REFERRED_BY` varchar(50) NOT NULL,
  `BLOOD_GROUP` varchar(50) DEFAULT NULL,
  `WEIGHT` varchar(50) DEFAULT NULL,
  `TELEPHONE` varchar(50) DEFAULT NULL,
  `MOBILE` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `ADDRESS_1` varchar(50) DEFAULT NULL,
  `ADDRESS_2` varchar(50) DEFAULT NULL,
  `ADDRESS_3` varchar(50) DEFAULT NULL,
  `AREA` varchar(50) DEFAULT NULL,
  `DISTRICT` varchar(50) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `STATE` varchar(50) DEFAULT NULL,
  `ZIP` varchar(50) DEFAULT NULL,
  `COUNTRY` varchar(50) DEFAULT NULL,
  `REGISTRATION_NO` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`ID`, `REGISTRATION_DATE`, `TITLE`, `FIRST_NAME`, `MIDDLE_NAME`, `LAST_NAME`, `GENDER`, `DAY`, `MONTH`, `YEAR`, `CONTACT_INFO`, `REFERRED_BY`, `BLOOD_GROUP`, `WEIGHT`, `TELEPHONE`, `MOBILE`, `EMAIL`, `ADDRESS`, `ADDRESS_1`, `ADDRESS_2`, `ADDRESS_3`, `AREA`, `DISTRICT`, `CITY`, `STATE`, `ZIP`, `COUNTRY`, `REGISTRATION_NO`) VALUES
(1, '2015-03-02', 'Mr.', 'rajesh', '', 'kakawat', 'Male', 7, 4, 27, '', '2', 'B', '60', '', '', '', 'Address', 'Add1', 'Add2', 'Add3', 'Kharsan', 'Vallabhnagar', 'udaipur', 'Rajasthan', '313602', 'India', 'HMS/PAT/1'),
(2, '2015-03-02', 'Dr.', 'Candice', '', 'Taylor', 'Female', 5, 8, 24, '', '3', 'A', '60', '', '', '', '', '', '', '', '', '', '', '', '', '', 'HMS/PAT/2');

-- --------------------------------------------------------

--
-- Table structure for table `payment_collection`
--

CREATE TABLE IF NOT EXISTS `payment_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STAFF_NAME` varchar(50) NOT NULL,
  `ENTRY_DATE` date NOT NULL,
  `ADMISSION_ID` varchar(50) NOT NULL,
  `PATIENT_ID` int(11) NOT NULL,
  `PAYMENT_DATE` date NOT NULL,
  `RECEIVE_AMOUNT` double(10,2) NOT NULL,
  `PAYMENT_MODE` varchar(50) NOT NULL,
  `CHEQUE_NUMBER` varchar(50) DEFAULT NULL,
  `CHEQUE_DATE` date DEFAULT NULL,
  `BANK` varchar(100) DEFAULT NULL,
  `OTHER_DETAILS` varchar(100) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `payment_collection`
--

INSERT INTO `payment_collection` (`ID`, `STAFF_NAME`, `ENTRY_DATE`, `ADMISSION_ID`, `PATIENT_ID`, `PAYMENT_DATE`, `RECEIVE_AMOUNT`, `PAYMENT_MODE`, `CHEQUE_NUMBER`, `CHEQUE_DATE`, `BANK`, `OTHER_DETAILS`, `REMARK`) VALUES
(1, 'hemant', '2015-03-17', 'HMS/ADD_ID/3', 4, '2015-03-10', 500.00, 'Cash', '', NULL, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `DEPARTMENT_ID` int(11) NOT NULL,
  `SERVICES_CHARGES` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`ID`, `CODE`, `NAME`, `DEPARTMENT_ID`, `SERVICES_CHARGES`) VALUES
(1, 'S1', 'service1', 1, 400),
(2, 'S1', 'service2', 2, 200);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(150) DEFAULT NULL,
  `ADDRESS1` varchar(250) DEFAULT NULL,
  `ADDRESS2` varchar(250) DEFAULT NULL,
  `DEPARTMENT_ID` int(11) NOT NULL,
  `DUTY_HRS` varchar(100) DEFAULT NULL,
  `QUALIFICATION` varchar(200) DEFAULT NULL,
  `LOGIN_TYPE_ID` int(11) NOT NULL,
  `USER_ID` varchar(200) DEFAULT NULL,
  `PASSWORD` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_ID` (`USER_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`ID`, `CODE`, `NAME`, `ADDRESS1`, `ADDRESS2`, `DEPARTMENT_ID`, `DUTY_HRS`, `QUALIFICATION`, `LOGIN_TYPE_ID`, `USER_ID`, `PASSWORD`) VALUES
(1, '1', 'Hemant', 'udaipur', NULL, 1, '08AM. to 04PM', 'BCA,MCA,Phd', 1, 'hemant', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `TEST_TYPE` varchar(50) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `RATE` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`ID`, `CODE`, `TEST_TYPE`, `NAME`, `RATE`) VALUES
(1, 'SGF', 'Lab', 'Sugar Fasting', 200),
(2, 'ECG', 'Sono', 'ECG', 340),
(3, 'CBC', 'Lab', 'CBC', 250);

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE IF NOT EXISTS `ward` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ward`
--

INSERT INTO `ward` (`ID`, `CODE`, `NAME`) VALUES
(2, 'GEN', 'General'),
(3, 'ICU', 'ICU');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
