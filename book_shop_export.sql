-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: 127.0.0.1    Database: book_shop
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `author_fname` varchar(100) DEFAULT NULL,
  `author_lname` varchar(100) DEFAULT NULL,
  `released_year` int DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  `pages` int DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`book_id`, `title`, `author_fname`, `author_lname`, `released_year`, `stock_quantity`, `pages`) VALUES (1,'The Namesake','Jhumpa','Lahiri',2003,32,291),(2,'Norse Mythology','Neil','Gaiman',2016,43,304),(3,'American Gods','Neil','Gaiman',2001,12,465),(4,'Interpreter of Maladies','Jhumpa','Lahiri',1996,97,198),(5,'A Hologram for the King: A Novel','Dave','Eggers',2012,154,352),(6,'The Circle','Dave','Eggers',2013,26,504),(7,'The Amazing Adventures of Kavalier & Clay','Michael','Chabon',2000,68,634),(8,'Just Kids','Patti','Smith',2010,55,304),(9,'A Heartbreaking Work of Staggering Genius','Dave','Eggers',2001,104,437),(10,'Coraline','Neil','Gaiman',2003,100,208),(11,'What We Talk About When We Talk About Love: Stories','Raymond','Carver',1981,23,176),(12,'Where I\'m Calling From: Selected Stories','Raymond','Carver',1989,12,526),(13,'White Noise','Don','DeLillo',1985,49,320),(14,'Cannery Row','John','Steinbeck',1945,95,181),(15,'Oblivion: Stories','David','Foster Wallace',2004,172,329),(16,'Consider the Lobster','David','Foster Wallace',2005,92,343),(17,'10% Happier','Dan','Harris',2014,29,256),(18,'fake_book','Freida','Harris',2001,287,428),(19,'Lincoln In The Bardo','George','Saunders',2017,1000,367),(20,'My Life','Dave','Naugler',NULL,NULL,NULL),(21,'My Life in Words','Dave','Naugler',2024,65,634);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-25 16:08:24
