CREATE DATABASE  IF NOT EXISTS `epok` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `epok`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: epok
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `epok_kurs`
--

DROP TABLE IF EXISTS `epok_kurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `epok_kurs` (
  `kurs` varchar(6) NOT NULL,
  `kursnamn` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`kurs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epok_kurs`
--

LOCK TABLES `epok_kurs` WRITE;
/*!40000 ALTER TABLE `epok_kurs` DISABLE KEYS */;
INSERT INTO `epok_kurs` VALUES ('D0001N','EA'),('D0002N','Data mining');
/*!40000 ALTER TABLE `epok_kurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epok_moduler`
--

DROP TABLE IF EXISTS `epok_moduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `epok_moduler` (
  `modulkod` int NOT NULL,
  `kurs_kurs` varchar(6) NOT NULL,
  `benämning` varchar(45) DEFAULT NULL,
  `aktiv` tinyint DEFAULT NULL,
  PRIMARY KEY (`modulkod`,`kurs_kurs`),
  KEY `fk_moduler_kurs_idx` (`kurs_kurs`),
  CONSTRAINT `fk_moduler_kurs` FOREIGN KEY (`kurs_kurs`) REFERENCES `epok_kurs` (`kurs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epok_moduler`
--

LOCK TABLES `epok_moduler` WRITE;
/*!40000 ALTER TABLE `epok_moduler` DISABLE KEYS */;
INSERT INTO `epok_moduler` VALUES (1,'D0001N','Uppgift1',1),(1,'D0002N','Inlämning1',1),(2,'D0001N','Uppgift2',0),(2,'D0002N','Inlämning2',0);
/*!40000 ALTER TABLE `epok_moduler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ladok_betyg`
--

DROP TABLE IF EXISTS `ladok_betyg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ladok_betyg` (
  `betyg_id` int NOT NULL AUTO_INCREMENT,
  `ladok_moduler_modulID` int NOT NULL,
  `ladok_student_personnummer` varchar(15) COLLATE utf8_bin NOT NULL,
  `exdatum` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `betyg` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `ladok_kurs_kursID` varchar(8) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`betyg_id`),
  KEY `fk_ladok_moduler_has_ladok_student_ladok_student1_idx` (`ladok_student_personnummer`),
  KEY `fk_ladok_moduler_has_ladok_student_ladok_moduler1_idx` (`ladok_moduler_modulID`),
  KEY `fk_ladok_betyg_ladok_kurs1_idx` (`ladok_kurs_kursID`),
  CONSTRAINT `fk_ladok_betyg_ladok_kurs1` FOREIGN KEY (`ladok_kurs_kursID`) REFERENCES `ladok_kurs` (`kursID`),
  CONSTRAINT `fk_ladok_moduler_has_ladok_student_ladok_moduler1` FOREIGN KEY (`ladok_moduler_modulID`) REFERENCES `ladok_moduler` (`modulID`),
  CONSTRAINT `fk_ladok_moduler_has_ladok_student_ladok_student1` FOREIGN KEY (`ladok_student_personnummer`) REFERENCES `ladok_student` (`personnummer`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ladok_betyg`
--

LOCK TABLES `ladok_betyg` WRITE;
/*!40000 ALTER TABLE `ladok_betyg` DISABLE KEYS */;
INSERT INTO `ladok_betyg` VALUES (1,1,'198404251337','2021-11-12','VG','D0001N'),(3,2,'198404251337','2021-03-05','VG','D0001N'),(4,2,'198404251337','2021-03-05','VG','D0001N'),(5,2,'198404251337','2021-03-05','VG','D0001N'),(6,2,'198404251337','2021-03-05','VG','D0001N'),(7,2,'198404251337','2021-03-05','G','D0001N'),(8,2,'198404251337','2021-03-05','MVG','D0001N'),(9,1,'198404251337','2021-03-05','MVG','D0001N'),(10,1,'198404251337','2021-02-15','MVG','D0002N'),(11,1,'198404251337','2021-02-15','MVG','D0002N'),(12,2,'198404251337','2021-11-12','VMVG','D0001N'),(13,2,'198404251337','2021-11-12','VMVG','D0001N'),(14,2,'198404251337','2021-11-12','VMVG','D0001N'),(15,2,'198404251337','2021-11-12','VMVG','D0001N'),(16,2,'198404251337','2021-11-12','VMVG','D0001N'),(19,2,'198404251337','2021-11-12','VMVG','D0001N'),(20,2,'198404251337','2021-11-12','VMVG','D0001N'),(22,1,'198404251337','2021-11-12','VG','D0001N'),(23,1,'198404251337','2021-11-12','VG','D0001N'),(24,1,'198404251337','2021-11-12','VG','D0001N');
/*!40000 ALTER TABLE `ladok_betyg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ladok_kurs`
--

DROP TABLE IF EXISTS `ladok_kurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ladok_kurs` (
  `kursID` varchar(8) COLLATE utf8_bin NOT NULL,
  `kursnamn` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`kursID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ladok_kurs`
--

LOCK TABLES `ladok_kurs` WRITE;
/*!40000 ALTER TABLE `ladok_kurs` DISABLE KEYS */;
INSERT INTO `ladok_kurs` VALUES ('D0001N','EA'),('D0002N','Data Mining');
/*!40000 ALTER TABLE `ladok_kurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ladok_moduler`
--

DROP TABLE IF EXISTS `ladok_moduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ladok_moduler` (
  `modulID` int NOT NULL,
  `modulnamn` varchar(45) COLLATE utf8_bin NOT NULL,
  `kursID` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`modulID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ladok_moduler`
--

LOCK TABLES `ladok_moduler` WRITE;
/*!40000 ALTER TABLE `ladok_moduler` DISABLE KEYS */;
INSERT INTO `ladok_moduler` VALUES (1,'Uppgift 1','D0001N'),(2,'Inlämning1','D0002N'),(3,'Uppgift 2','D0001N'),(4,'Inlämning 2','D0002N');
/*!40000 ALTER TABLE `ladok_moduler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ladok_student`
--

DROP TABLE IF EXISTS `ladok_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ladok_student` (
  `personnummer` varchar(15) COLLATE utf8_bin NOT NULL,
  `namn` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`personnummer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ladok_student`
--

LOCK TABLES `ladok_student` WRITE;
/*!40000 ALTER TABLE `ladok_student` DISABLE KEYS */;
INSERT INTO `ladok_student` VALUES ('198404251337','Anders Svensson'),('200001011111','Test Testsson');
/*!40000 ALTER TABLE `ladok_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spis_studenter`
--

DROP TABLE IF EXISTS `spis_studenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spis_studenter` (
  `studentid` varchar(45) COLLATE utf8_bin NOT NULL,
  `personnummer` varchar(45) COLLATE utf8_bin NOT NULL,
  `namn` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`personnummer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spis_studenter`
--

LOCK TABLES `spis_studenter` WRITE;
/*!40000 ALTER TABLE `spis_studenter` DISABLE KEYS */;
INSERT INTO `spis_studenter` VALUES ('andsev-9','198404251337','Anders Svensson'),('lololo-1','199001015555','Lollo Olsson'),('testet-0','200001011234','Therese Stenstedt');
/*!40000 ALTER TABLE `spis_studenter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-22 18:02:26
