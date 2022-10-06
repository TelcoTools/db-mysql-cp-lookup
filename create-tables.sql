-- MySQL dump 10.19  Distrib 10.3.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cp.telco.tools
-- ------------------------------------------------------
-- Server version	10.3.34-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `S1`
--

DROP TABLE IF EXISTS `S1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S1` (
  `NMSNumberBlock` varchar(64) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Communications Provider` varchar(255) DEFAULT NULL,
  `Number Length` varchar(255) DEFAULT NULL,
  `Change` varchar(255) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S3`
--

DROP TABLE IF EXISTS `S3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S3` (
  `NMSNumberBlock` varchar(64) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Communications Provider` varchar(255) DEFAULT NULL,
  `Number Length` varchar(255) DEFAULT NULL,
  `Change` varchar(255) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S5`
--

DROP TABLE IF EXISTS `S5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S5` (
  `NMSNumberBlock` varchar(64) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Communications Provider` varchar(255) DEFAULT NULL,
  `Number Length` varchar(255) DEFAULT NULL,
  `Change` varchar(255) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S7`
--

DROP TABLE IF EXISTS `S7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S7` (
  `NMSNumberBlock` varchar(64) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Communications Provider` varchar(255) DEFAULT NULL,
  `Number Length` varchar(255) DEFAULT NULL,
  `Change` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S8`
--

DROP TABLE IF EXISTS `S8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S8` (
  `NMSNumberBlock` varchar(64) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Communications Provider` varchar(255) DEFAULT NULL,
  `Number Length` varchar(255) DEFAULT NULL,
  `Change` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S9`
--

DROP TABLE IF EXISTS `S9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S9` (
  `NMSNumberBlock` varchar(64) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Communications Provider` varchar(255) DEFAULT NULL,
  `Number Length` varchar(255) DEFAULT NULL,
  `Change` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SABC`
--

DROP TABLE IF EXISTS `SABC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SABC` (
  `CODE` int(11) DEFAULT NULL,
  `D/DE` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Use` varchar(255) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cupids`
--

DROP TABLE IF EXISTS `cupids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cupids` (
  `cupid` int(4) unsigned NOT NULL,
  `cp` varchar(255) DEFAULT NULL,
  `updated` date DEFAULT NULL,
  `last_retrieved` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`cupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `known_ported`
--

DROP TABLE IF EXISTS `known_ported`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `known_ported` (
  `number` bigint(20) NOT NULL,
  `status` varchar(64) DEFAULT NULL,
  `cp` varchar(255) DEFAULT NULL,
  `num_length` varchar(16) DEFAULT NULL,
  `use` varchar(255) DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `exclusive` bit(1) DEFAULT b'0',
  `exclusive_cp_cupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`number`),
  KEY `cp` (`cp`(250))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `numbering_allocation`
--

DROP TABLE IF EXISTS `numbering_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numbering_allocation` (
  `number` bigint(20) NOT NULL,
  `status` varchar(64) DEFAULT NULL,
  `cp` varchar(255) DEFAULT NULL,
  `num_length` varchar(16) DEFAULT NULL,
  `use` varchar(255) DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`number`),
  KEY `cp` (`cp`(250))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
