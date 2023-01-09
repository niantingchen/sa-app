CREATE DATABASE  IF NOT EXISTS `question` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `question`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: question
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `exchange`
--

DROP TABLE IF EXISTS `exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exchange` (
  `itemid` int NOT NULL AUTO_INCREMENT,
  `item` varchar(45) DEFAULT NULL,
  `itempoint` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange`
--

LOCK TABLES `exchange` WRITE;
/*!40000 ALTER TABLE `exchange` DISABLE KEYS */;
INSERT INTO `exchange` VALUES (1,'跑車上路許可','-3000'),(2,'重機上路許可','-4000'),(3,'住五星級飯店','-8000'),(4,'住四星期飯店','-5000'),(5,'炭烤烤肉許可','-5000'),(6,'放煙火許可','-3000'),(7,'遊樂園號碼牌','-5000'),(8,'游輪票號碼牌','-20000'),(9,'郵輪票號碼牌','-50000');
/*!40000 ALTER TABLE `exchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `memberId` int NOT NULL AUTO_INCREMENT,
  `memberAc` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `memberPw` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'M111111112','sally','123','0988443213'),(2,'M111111115','asds','221qw','098888332'),(3,'M111111113','eewq','eewrt','2234134'),(4,'L222211111','eewqi','uuuiou','11111111111'),(5,'J334251732','3ssaa','1111','1234567221'),(6,'D1114444333','wwwqr','ewq','0966112345'),(7,'F221333344','eewqr','123','094432567'),(8,'K332456443','eewrt','admin','0977734521'),(9,'G992345431','eedt','eeeee','0966334778'),(10,'K773829213','hhew','777uewq','09773452132'),(11,'F443772832','ffds','33324','0988421443'),(12,'J223443215','lll','iii','0988665456'),(13,'H221334532','dsad','eewqer','0988774323'),(14,'U443222111','www','nullw','0944332664'),(15,'I123443253','ffff','mmmm','0977643221'),(16,'R331223432','ddd','eee','0977332113'),(17,'O113444334','saeee','kkk','0966754332'),(18,'U777766665','jjjj','jjjj','0988887766');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_card`
--

DROP TABLE IF EXISTS `member_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_card` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cardid` varchar(45) DEFAULT NULL,
  `cardnum` varchar(45) DEFAULT NULL,
  `carddate` date DEFAULT NULL,
  `memberid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_card`
--

LOCK TABLES `member_card` WRITE;
/*!40000 ALTER TABLE `member_card` DISABLE KEYS */;
INSERT INTO `member_card` VALUES (1,'11111222','1111222','2023-02-07','M111111112'),(2,'12345443','54321123','2023-01-03','M111111115'),(3,'4456789','543678','2023-04-01','M111111113'),(4,'55678904','332456','2023-03-05','L222211111'),(5,'12345443','54321123','2023-01-03','J334251732'),(6,'12345443','54321123','2023-01-03','D1114444333'),(7,'12345443','1234321','2023-01-24','F221333344'),(8,'3325678','332567','2023-02-11','K332456443'),(9,'88937421','55463721','2023-02-23','G992345431'),(10,'7743234932','88439532','2023-04-24','K773829213'),(11,'44443332','11234','2023-02-10','F443772832'),(12,'11233432','55543257','2023-02-09','J223443215'),(13,'33211457','99975455','2023-11-12','H221334532'),(14,'1114444','222222','2023-02-03','U443222111'),(15,'1234','11234','2023-02-04','I123443253'),(16,'667443','44677','2023-02-03','R331223432'),(17,'7788899','665544','2023-01-26','O113444334'),(18,'444444','333333','2023-02-10','U777766665');
/*!40000 ALTER TABLE `member_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_change`
--

DROP TABLE IF EXISTS `member_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_change` (
  `changeid` int NOT NULL AUTO_INCREMENT,
  `memberAc` varchar(45) NOT NULL,
  `state` varchar(45) DEFAULT NULL,
  `recordTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`changeid`,`memberAc`,`recordTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_change`
--

LOCK TABLES `member_change` WRITE;
/*!40000 ALTER TABLE `member_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_log`
--

DROP TABLE IF EXISTS `member_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_log` (
  `billId` char(20) DEFAULT NULL,
  `memberId` int DEFAULT NULL,
  `totalMoney` decimal(7,0) DEFAULT NULL,
  `cbTax` decimal(7,2) DEFAULT NULL,
  `cbPoint` decimal(7,2) DEFAULT NULL,
  `cbEm` decimal(7,2) DEFAULT NULL,
  `billDt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_log`
--

LOCK TABLES `member_log` WRITE;
/*!40000 ALTER TABLE `member_log` DISABLE KEYS */;
INSERT INTO `member_log` VALUES ('12345',1,500,5.50,24.00,22.50,'2023-01-08 00:00:00'),('12345',5,300,2.50,21.00,21.50,'2023-01-09 00:00:00'),('12345',5,300,2.50,21.00,21.50,'2023-01-09 00:00:00'),('12345',5,300,2.50,21.00,21.50,'2023-01-09 00:00:00'),('12345',5,300,2.50,21.00,21.50,'2023-01-09 00:00:00');
/*!40000 ALTER TABLE `member_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problem` (
  `problemid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `problem` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`problemid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wish`
--

DROP TABLE IF EXISTS `wish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wish` (
  `wishid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `deposit` int DEFAULT NULL,
  `target` int DEFAULT NULL,
  PRIMARY KEY (`wishid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish`
--

LOCK TABLES `wish` WRITE;
/*!40000 ALTER TABLE `wish` DISABLE KEYS */;
INSERT INTO `wish` VALUES (11,'我要放煙火',1000,3000),(12,'我想開車車',3000,5000),(13,'好讚',77,77);
/*!40000 ALTER TABLE `wish` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-09 21:47:20
