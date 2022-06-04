DROP DATABASE IF EXISTS `noodlemembers`;
CREATE DATABASE  IF NOT EXISTS `noodlemembers`; 
--
-- Table structure for table `members`
--
USE `noodlemembers`;
DROP TABLE IF EXISTS `noodlemembers`;

CREATE TABLE `noodlemembers` (
  `username` varchar(45) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_email`)
) ;

--
-- Dumping data for table `members`
--
SELECT * FROM noodlemembers.noodlemembers;
