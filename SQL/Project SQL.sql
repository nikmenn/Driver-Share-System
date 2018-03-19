-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: group28.caxv2nuxlyui.us-east-1.rds.amazonaws.com    Database: db28
-- ------------------------------------------------------
-- Server version	5.6.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BadOffer`
--

DROP TABLE IF EXISTS `BadOffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BadOffer` (
  `Username` varchar(45) NOT NULL,
  `Departure` varchar(45) NOT NULL,
  `Destination` varchar(45) NOT NULL,
  `Deptime` varchar(45) NOT NULL,
  `Date` date NOT NULL,
  `isDriver` varchar(45) NOT NULL,
  `carName` varchar(45) NOT NULL,
  PRIMARY KEY (`Username`,`Date`,`Deptime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BadOffer`
--

LOCK TABLES `BadOffer` WRITE;
/*!40000 ALTER TABLE `BadOffer` DISABLE KEYS */;
/*!40000 ALTER TABLE `BadOffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acceptedOffers`
--

DROP TABLE IF EXISTS `acceptedOffers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acceptedOffers` (
  `Driver` varchar(45) NOT NULL,
  `Passenger` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Time` varchar(45) NOT NULL,
  PRIMARY KEY (`Driver`,`Passenger`,`Date`,`Time`),
  KEY `bleh_idx` (`Passenger`),
  CONSTRAINT `blah` FOREIGN KEY (`Driver`) REFERENCES `registeredUsers` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bleh` FOREIGN KEY (`Passenger`) REFERENCES `registeredUsers` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceptedOffers`
--

LOCK TABLES `acceptedOffers` WRITE;
/*!40000 ALTER TABLE `acceptedOffers` DISABLE KEYS */;
INSERT INTO `acceptedOffers` VALUES ('ni','an','2017-08-12','10:20');
/*!40000 ALTER TABLE `acceptedOffers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adTable`
--

DROP TABLE IF EXISTS `adTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adTable` (
  `Advertisement` varchar(200) NOT NULL,
  `Amount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Advertisement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adTable`
--

LOCK TABLES `adTable` WRITE;
/*!40000 ALTER TABLE `adTable` DISABLE KEYS */;
INSERT INTO `adTable` VALUES ('Blah',99);
/*!40000 ALTER TABLE `adTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cars` (
  `Username` varchar(45) NOT NULL,
  `carName` varchar(45) NOT NULL,
  `License` varchar(10) NOT NULL,
  PRIMARY KEY (`License`),
  KEY `username_idx` (`Username`),
  CONSTRAINT `Username` FOREIGN KEY (`Username`) REFERENCES `registeredUsers` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES ('ni','Civic','123333');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentTable`
--

DROP TABLE IF EXISTS `commentTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentTable` (
  `Username` varchar(45) DEFAULT NULL,
  `Comment` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentTable`
--

LOCK TABLES `commentTable` WRITE;
/*!40000 ALTER TABLE `commentTable` DISABLE KEYS */;
INSERT INTO `commentTable` VALUES ('Andre','Decent'),('Andre','Not good'),('Nik','Not good'),('Andre','Decent'),('Andre','Decent'),('Nik','Ss'),('Nik','Ss'),('Test','Great'),('Nikhil',''),('ni','Average');
/*!40000 ALTER TABLE `commentTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driverOffer`
--

DROP TABLE IF EXISTS `driverOffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driverOffer` (
  `Username` varchar(45) NOT NULL,
  `Departure` varchar(45) NOT NULL,
  `Destination` varchar(45) NOT NULL,
  `Deptime` varchar(45) NOT NULL,
  `Date` date NOT NULL,
  `isDriver` varchar(45) NOT NULL,
  `carName` varchar(45) NOT NULL,
  PRIMARY KEY (`Username`,`Deptime`,`Date`),
  KEY `DriverOffer_Username_idx` (`Username`),
  CONSTRAINT `DriverOffer_Username` FOREIGN KEY (`Username`) REFERENCES `registeredUsers` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driverOffer`
--

LOCK TABLES `driverOffer` WRITE;
/*!40000 ALTER TABLE `driverOffer` DISABLE KEYS */;
INSERT INTO `driverOffer` VALUES ('ni','Busch','Livingston','10:20','2017-08-12','yes','Civic');
/*!40000 ALTER TABLE `driverOffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messageTable`
--

DROP TABLE IF EXISTS `messageTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messageTable` (
  `Sender` varchar(45) NOT NULL,
  `Reciever` varchar(45) NOT NULL,
  `Message` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messageTable`
--

LOCK TABLES `messageTable` WRITE;
/*!40000 ALTER TABLE `messageTable` DISABLE KEYS */;
INSERT INTO `messageTable` VALUES ('Nik','Andre','sup'),('Nik','Phil','This is a test'),('Phil','Nik','recieved message');
/*!40000 ALTER TABLE `messageTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offerGiven`
--

DROP TABLE IF EXISTS `offerGiven`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offerGiven` (
  `Username` varchar(45) NOT NULL,
  `Passenger` varchar(45) NOT NULL,
  `Date` date NOT NULL,
  `Time` varchar(45) NOT NULL,
  `carName` varchar(45) NOT NULL,
  `numPassengers` int(11) NOT NULL,
  PRIMARY KEY (`Passenger`,`Username`,`Date`,`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offerGiven`
--

LOCK TABLES `offerGiven` WRITE;
/*!40000 ALTER TABLE `offerGiven` DISABLE KEYS */;
/*!40000 ALTER TABLE `offerGiven` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengerRequest`
--

DROP TABLE IF EXISTS `passengerRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passengerRequest` (
  `Username` varchar(45) NOT NULL,
  `Departure` varchar(45) NOT NULL,
  `Destination` varchar(45) NOT NULL,
  `Deptime` varchar(45) NOT NULL,
  `Date` date NOT NULL,
  `isPassenger` varchar(45) NOT NULL,
  PRIMARY KEY (`Username`,`Deptime`,`Date`),
  CONSTRAINT `PassengerRequest_Username` FOREIGN KEY (`Username`) REFERENCES `registeredUsers` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengerRequest`
--

LOCK TABLES `passengerRequest` WRITE;
/*!40000 ALTER TABLE `passengerRequest` DISABLE KEYS */;
INSERT INTO `passengerRequest` VALUES ('an','Busch','Livingston','10:20','2017-08-12','yes');
/*!40000 ALTER TABLE `passengerRequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registeredUsers`
--

DROP TABLE IF EXISTS `registeredUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registeredUsers` (
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `ridesGiven` int(11) DEFAULT '0',
  `ridesTaken` int(11) DEFAULT '0',
  `driverRating` float DEFAULT '0',
  `passengerRating` float DEFAULT '5',
  `lockedOut` varchar(45) NOT NULL DEFAULT 'No',
  `Forward` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registeredUsers`
--

LOCK TABLES `registeredUsers` WRITE;
/*!40000 ALTER TABLE `registeredUsers` DISABLE KEYS */;
INSERT INTO `registeredUsers` VALUES ('an','an','an@email.com','','','',0,1,5,5,'No',NULL),('ni','ni','ni@rutgers.edu','ni','','',1,0,5,5,'No',NULL);
/*!40000 ALTER TABLE `registeredUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supportStaff`
--

DROP TABLE IF EXISTS `supportStaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supportStaff` (
  `staffUser` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`staffUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supportStaff`
--

LOCK TABLES `supportStaff` WRITE;
/*!40000 ALTER TABLE `supportStaff` DISABLE KEYS */;
INSERT INTO `supportStaff` VALUES ('Staff1','Staff1');
/*!40000 ALTER TABLE `supportStaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Rides Given` int(11) NOT NULL DEFAULT '0',
  `Rides Taken` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('','',0,0),('andre','andre',0,0),('neil','neil',0,0),('Nik','Nik',0,0),('Nik2','Nik',0,0),('nik22','Nikkk',0,0),('Nik222','nss',0,0),('Nike3d3e','Nikkkk',0,0),('Phil','Phil',0,0),('qiong','123456',0,0),('Raj','Raj',0,0),('test','1234',0,0),('the','deee',0,0),('Try','Try',0,0),('v','v',0,0),('valia','valia',0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-26 17:02:01
