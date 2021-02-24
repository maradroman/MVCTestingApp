CREATE DATABASE  IF NOT EXISTS `final_project` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `final_project`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: final_project
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `passed_tests`
--

DROP TABLE IF EXISTS `passed_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passed_tests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `test_id` int NOT NULL,
  `result` int NOT NULL,
  `time_spent` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`user_id`),
  KEY `id_idx1` (`test_id`),
  CONSTRAINT `id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passed_tests`
--

LOCK TABLES `passed_tests` WRITE;
/*!40000 ALTER TABLE `passed_tests` DISABLE KEYS */;
INSERT INTO `passed_tests` VALUES (39,23,1,83,60),(40,23,2,0,20);
/*!40000 ALTER TABLE `passed_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_id` int NOT NULL,
  `text` varchar(2000) NOT NULL,
  `option1` varchar(1500) NOT NULL,
  `option2` varchar(1500) NOT NULL,
  `option3` varchar(1500) NOT NULL,
  `option4` varchar(1500) NOT NULL,
  `o1IsCorrect` enum('true','false') NOT NULL DEFAULT 'false',
  `o2IsCorrect` enum('true','false') NOT NULL DEFAULT 'false',
  `o3IsCorrect` enum('true','false') NOT NULL DEFAULT 'false',
  `o4IsCorrect` enum('true','false') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (33,1,'CPP','right','---','---','---','true','false','false','false'),(34,1,'question','right','wrong','wrong','right','true','false','false','true'),(35,1,'question','right','right','wrong','wrong','true','true','false','false'),(36,1,'запитання','правильна відповідь','неправильна відповідь','неправильна відповідь','неправильна відповідь','true','false','false','false'),(37,2,'rwerwe','321312','4214124124','32423423','4123321312','false','false','true','false'),(38,1,'ugyhgfhgdhdg','hgfdhgdhdghgd','hgdhdg','hgfhgh','dhdhd','true','false','false','false'),(39,1,'ппапаап','апаппаапап','паапапап','паапап','апапапапаап','true','true','false','false'),(40,2,'опраоароа','ораоа','опренггк','гкгкг','кгкгкг','true','true','false','false'),(41,3,'erqweqweqweqweqweqweqw','+++++','-----','-----','+++++','true','false','false','true'),(42,31,'hgfhgdhdghdghdg','+++++','+++++','_______','_______','true','true','false','false'),(43,32,'ghdhgdhdghdghdghd','++++++','fgsdgfsgfsd','gsdfgsdfgfsd','gsdfgsdfgsdf','true','false','false','false'),(44,34,'bbvbvbvb','4242234','4224243','342424','4234234423','false','false','false','true'),(45,32,'fdsfsd','fdsfsdfsd','fsdfsd','fsdfsd','ffsdfsdfsd','false','false','true','false');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `complexity` int NOT NULL,
  `number_of_requests` int NOT NULL DEFAULT '0',
  `time_for_test` int NOT NULL,
  `topic` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `topic_idx` (`topic`),
  CONSTRAINT `topicID` FOREIGN KEY (`topic`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'cpp',5,3,30,1),(2,'java',7,72,25,2),(3,'javascript',5,312,27,3),(31,'gfgdsgfsdgsdf',4,0,27,1),(32,'twerywyeuyeueyuyeuery',6,0,12,2),(33,'cfdffdsdfsdf',6,0,12,1),(34,'2311231233131',6,0,21,1),(35,'gfsdgsfgsdf',6,0,23,1),(36,'321321312',6,0,32,1),(37,'432432432',6,0,22,1),(38,'3213124112441',6,0,123,1),(39,'fgdfgfsgsf',10,0,25,1);
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'c++'),(2,'java'),(3,'javascript');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `isBlocked` enum('true','false') NOT NULL DEFAULT 'false',
  `type` enum('student','admin') NOT NULL DEFAULT 'student',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idusers_UNIQUE` (`id`),
  UNIQUE KEY `login_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (22,'MaradRoman','Roma','Marad','maradroman@mail.com','123456789','false','admin'),(23,'FooJon','John','Foo111','johnfoo@gmail.coms','123qweQWE','false','student'),(24,'bobdoe','Bob','Doe','doebob@outlook.com','','false','student'),(47,'рома','мапа','воалдпо','roma@gma.com','123qweQWE','false','student'),(48,'gdgdfgdtrtretretet','ettegdgdg','gddgfggdgd','gdgdfgdd@gjkldg.com','123qweQWE','false','student'),(50,'newuser','newname','newsurname','gjfkldf@gfjkdl.com','123qweQWE','false','student'),(53,'MaradRomanssddssd','dsdsdssdd','dsdsds','dsdsdssd','123456789WQ12wq','false','student');
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

-- Dump completed on 2021-02-24 11:41:34
