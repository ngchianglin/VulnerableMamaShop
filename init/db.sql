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
INSERT INTO `category` VALUES (1000,'Clothing'),(1001,'Hats'),(1002,'Myspace Links'),(1003,'Secondhand Food');
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
INSERT INTO `products` VALUES (42,'The Logfathers ASCII T-Shirt','Worn-out t-shirt with ASCII art of The Logfather. Exudes a sense of technological nostalgia.  Provides the wearer +99 against regex patterns.',8.25,1000),(17,'Faded Star Wars Hoodie','A well-loved hoodie featuring Darth Vader with The Logfathers signature on the sleeve.',14.99,1000),(91,'Binary Code Socks','A pair of socks The Logfather used to wear, patterned with binary code.',4.50,1000),(11,'Logfathers Fedora','A Fedora hat with the inscription -Logfather- at the side. Slightly worn out.',15.75,1001),(37,'Vintage UNIX Cap','The Logfathers favorite cap, with UNIX logo. Shows signs of heavy use.',9.99,1001),(29,'BeOS Beanie','A warm beanie with BeOS logo. Once belonged to The Logfather.',12.00,1001),(57,'Myspace Music: The Golden Age','A link to a nostalgic playlist of the top hits during Myspaces prime.',0.50,1002),(86,'The Birth of Social Media: A Myspace Retrospective','A link to an in-depth article detailing the rise and fall of Myspace.',0.75,1002),(23,'Dial-up Sounds ASMR','A Myspace link to a compilation of soothing, nostalgic dial-up internet sounds.',1.00,1002),(96,'Half-eaten Grilled Cheese Sandwich','A slightly toasted sandwich, cheese still melting. The Logfathers last bite.',2.50,1003),(5,'Cold Cup of Coffee','The Logfathers favorite brew, now cold. May contain remnants of code-fueled late nights.',1.75,1003),(78,'Leftover Pizza Slice','A piece of pepperoni pizza The Logfather hasnt finished. Still tastes good... we think.',3.00,1003),(66,'The Logfathers Matrix T-Shirt','A t-shirt with green matrix code, an old favorite of The Logfather.',7.75,1000),(19,'Worn-out C++ Hoodie','A faded hoodie with C++ logo, shows signs of countless debugging sessions.',13.50,1000),(39,'Script Kiddie Snapback','A stylish snapback hat, once belonged to The Logfather. Embroidered with "Script Kiddie" text.',10.99,1001),(33,'Early Internet Explorer Hat','A relic from the past. This hat with the Internet Explorer logo was once The Logfathers.',15.00,1001),(8,'Myspace Page Customization Tutorials','A collection of links to the best Myspace page customization tutorials.',1.25,1002),(95,'Geocities Archive','A Myspace link to an archive of Geocities, the internet as it used to be.',0.80,1002),(27,'Bowl of Unfinished Ramen','A half-eaten bowl of ramen from The Logfathers late-night coding session.',3.50,1003),(65,'Semi-Finished Chocolate Chip Cookie','One of The Logfathers favorite cookies, with a single bite missing.',1.25,1003),(75,'The Logfathers Original 128k Mac Shirt','A vintage t-shirt with the original 128k Macintosh. Faded but well-loved.',8.99,1000),(30,'Old Linux Cap','The Logfathers worn cap with a faded Linux logo. For true open-source enthusiasts.',11.99,1001),(81,'Early YouTube Vlogs','A Myspace link to a compilation of the earliest vlogs on YouTube. Feel the nostalgia.',0.95,1002),(48,'Leftover Sushi Rolls','A couple of sushi rolls that The Logfather couldnt finish. Eat at your own risk.',4.00,1003),(55,'Bitten Donut','A donut with a single bite. The Logfathers favorite - sprinkled with code and sugar.',1.99,1003);
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
  `serial_number` varchar(64) DEFAULT NULL,
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
INSERT INTO `users` VALUES (21,'John','Doe','A12345678Z','john.doe@logfather.org','password123'),(34,'Jane','Smith','B23456789X','jane.smith@freemail.com','qwerty789'),(72,'Bob','Builder','C34567891Y','bob.builder@logfather.org','!BuildItBetter!'),(55,'Alice','Wonderland','D45678912W','aliceinwonderland@wondermail.com','RabbitHole2023'),(89,'Norton','Antivirus','E56789123V','norton.antivirus@virusmail.com','InfectMeNot'),(7,'Crash','Override','F67891234U','crashoverride@hackzone.com','ZeroC00L'),(27,'Fork','Bomb','G78912345T','fork.bomb@geekmail.com','() { :;};'),(44,'Lord','Vader','H89123456S','lord.vader@empiremail.com','DarkSideRulz'),(66,'Major','Bug','I91234567R','majorbug@debugger.com','FixMeIfUCan'),(11,'Eve','Drop','J01234567Q','eve.drop@securemail.com','ListenToThis!'),(99,'Tracer','T','K12345678P','tracer.t@packetmail.com','Ping!P0ng'),(88,'Null','Pointer','L23456789O','null.pointer@codemail.com','DereferenceMe'),(46,'Dennis','Ritchie','M34567891N','dennis.ritchie@logfather.org','Cis4Cookie'),(53,'Sir Dumps','A Lot','N45678912M','sir.dumpsalot@dumpstermail.com','E#*dj&29@ckds(2d'),(37,'Iama','Teapot','O56789123L','iamateapot@teapotmail.com','4xxShortAndStout');
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
