-- MySQL dump 10.15  Distrib 10.0.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: appdb
-- ------------------------------------------------------
-- Server version	10.0.34-MariaDB-0ubuntu0.16.04.1

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
-- Current Database: `appdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `appdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `appdb`;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1000,'drinks'),(1001,'snacks'),(1002,'fruits'),(1003,'lunch boxes');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `price` decimal(6,2) DEFAULT NULL,
  `catid` int(11) NOT NULL,
  PRIMARY KEY (`productid`),
  KEY `catid` (`catid`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`catid`) REFERENCES `category` (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'kopi O','Coffee without sugar',1.00,1000),(2,'kopi','Regular Coffee',1.20,1000),(3,'milo','Milo with condense milk and sugar',1.00,1000),(4,'tea','Regular tea with sugar',1.00,1000),(5,'Orchi','Bubble tea with jasmine flower',3.00,1000),(6,'Quanhao','Herbal tea with chinese herbs',3.00,1000),(7,'LongTian','Regular herbal tea',2.50,1000),(8,'Apple Green','Red and Green Apples pack',2.60,1002),(9,'Orange','Oranges in a bag',3.00,1002),(10,'Pineapple','Slices of pineapple',2.00,1002),(11,'Mango','Slices of mango',2.50,1002),(12,'Water Melon','Juicy Water Melons',1.50,1002),(13,'Banana','Bunches of Banana ',2.00,1002),(14,'Papaya','Slices of papaya',1.80,1002),(15,'Crackers','Regular Crackers pack',1.20,1001),(16,'Peanuts','Regular Peanuts in a bag',1.20,1001),(17,'Dark choco','Bar of dark chocolate',2.00,1001),(18,'Choco bar','Milk chocolate bar',1.50,1001),(19,'Tomato Sandwich','Sandwich with lots of tomatoes',3.00,1001),(20,'Tuna Sandwich','Sandwich Tuna fillings ',3.00,1001),(21,'Hainanese Chicken Rice Set','Chicken rice set with Vege',3.00,1003),(22,'Bee Hoon Set','Local Fried Bee Hoon Set',3.00,1003),(23,'Lasi Lemak','Lasi Lemak chilli favour',3.00,1003);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `nric` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ming Hua','Tan','S9830887T','mhwa@mytestinternet.com.sg','secretagent0'),(2,'Kevin Boon Zeng','Lau','S8911009K','boon.zeng@newinternettest.sg','hiddenvalue-0'),(3,'Bean Hock','Quek','T0377668Z','bhq10@bht-int15.com.sg','password0'),(4,'Raymond ','Ng','S7769118C','raymond.ng@itesting.com.sg','test1234'),(5,'Zhi Wei','Tang','T1634009D','zwei-pu@test.network.sg','P@ssw0rd'),(6,'Betty Pu hong','Cheng','S8497001B','bty@h0menet.sg','b@tty-0987');
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

create user 'appuser'@'localhost' identified by 'appsecret123';
grant all privileges on appdb.* to 'appuser'@'localhost';
flush privileges;

-- Dump completed on 2018-05-11  2:13:10
