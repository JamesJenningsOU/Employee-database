-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: finalproject
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `AppointmentID` int NOT NULL,
  `DoctorID` int DEFAULT NULL,
  `PatientID` int DEFAULT NULL,
  `Time` text,
  `Date` text,
  PRIMARY KEY (`AppointmentID`),
  KEY `fk_patient` (`PatientID`),
  KEY `fk_doctor` (`DoctorID`),
  CONSTRAINT `fk_doctor` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`),
  CONSTRAINT `fk_patient` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`Patient ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (3612,1742,2121,'4:30pm','10/26/22'),(3613,1738,2117,'3pm','10/31/22'),(3614,1745,2119,'8am','11/14/22'),(3615,1741,2126,'10:30am','12/5/22'),(3616,1738,2124,'9am','1/6/2023\n'),(3617,1747,2120,'8:30am','1/26/2023\n'),(3618,1746,2125,'1pm','2/7/2023\n'),(3619,1739,2123,'3pm','8/16/2023\n'),(3620,1743,2118,'2:30pm','12/6/2023\n'),(3621,1744,2122,'12:30pm','12/11/2023\n');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `DoctorID` int NOT NULL,
  `LastName` text,
  `FirstName` text,
  `Field` text,
  `Email` text,
  PRIMARY KEY (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1730,'Holloman','Jimmy','Immunology','JimmyHolloman@gmail.com'),(1738,'Thomas','James','Neuroscience','TJames@gmail.com'),(1739,'Gallegos','Robert','Pediatrics','RobGallegos@gmail.com'),(1741,'Dominguez','Paul','Urology','PDomingo@gmail.com'),(1742,'Scott','William','Orthopedics','WillScott@gmail.com'),(1743,'Rudolph','Baird','Dermatology','BRudolph@gmail.com'),(1744,'Piana','Richard','Pedatrics','RichPiana@gmail.com'),(1745,'Shaw','Brian','Surgery','BrianShaw@gmail.com'),(1746,'Malloy','Alex','Pulmonology','AMalloy@gmail.com'),(1747,'Frost','Fredo','Nephrology','FredoFrost@gmail.com');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `Patient ID` int NOT NULL,
  `FirstName` text,
  `LastName` text,
  `BloodType` text,
  `Email` text,
  PRIMARY KEY (`Patient ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (2117,'Paul','Blart','AB+','PaulBlart@gmail.com'),(2118,'Gerald','Medina','B+','GMedina@gmail.com'),(2119,'Marta','Murphy','B-','MMurph@gmail.com'),(2120,'Manuel','Carver','B+','BigCar@gmail.com'),(2121,'Georgia','Pitts','A-','GeorgiaPitts@gmail.com'),(2122,'Harry','Farmer','O-','HarryF@gmail.com'),(2123,'Kris','Godwin','AB-','KrisGodwin@gmail.com'),(2124,'Owen','Whittman','A+','OWhittman@gmail.com'),(2125,'Rickey','Stanickey','B+','BigRicky@gmail.com'),(2126,'Loretta','Goldburg','AB+','LGoldburg@gmail.com');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-12 15:09:32
