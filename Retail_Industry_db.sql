-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: atliq_tshirts
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `discount_id` int NOT NULL AUTO_INCREMENT,
  `t_shirt_id` int NOT NULL,
  `pct_discount` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`discount_id`),
  KEY `t_shirt_id` (`t_shirt_id`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`t_shirt_id`) REFERENCES `t_shirts` (`t_shirt_id`),
  CONSTRAINT `discounts_chk_1` CHECK ((`pct_discount` between 0 and 100))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,1,10.00),(2,2,15.00),(3,3,20.00),(4,4,5.00),(5,5,25.00),(6,6,10.00),(7,7,30.00),(8,8,35.00),(9,11,40.00),(10,10,45.00),(11,98,50.00);
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_shirts`
--

DROP TABLE IF EXISTS `t_shirts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_shirts` (
  `t_shirt_id` int NOT NULL AUTO_INCREMENT,
  `brand` enum('Van Huesen','Levi','Nike','Adidas') NOT NULL,
  `color` enum('Red','Blue','Black','White') NOT NULL,
  `size` enum('XS','S','M','L','XL') NOT NULL,
  `price` int DEFAULT NULL,
  `stock_quantity` int NOT NULL,
  PRIMARY KEY (`t_shirt_id`),
  UNIQUE KEY `brand_color_size` (`brand`,`color`,`size`),
  CONSTRAINT `t_shirts_chk_1` CHECK ((`price` between 10 and 50))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_shirts`
--

LOCK TABLES `t_shirts` WRITE;
/*!40000 ALTER TABLE `t_shirts` DISABLE KEYS */;
INSERT INTO `t_shirts` VALUES (1,'Nike','White','L',26,14),(2,'Van Huesen','White','S',44,45),(3,'Levi','White','L',28,96),(4,'Levi','Red','M',22,88),(5,'Levi','Blue','L',20,33),(6,'Nike','White','XL',47,81),(7,'Van Huesen','Black','L',28,26),(8,'Nike','Blue','L',23,76),(10,'Van Huesen','Red','XS',25,40),(11,'Nike','Black','M',35,66),(12,'Levi','Blue','S',14,78),(14,'Adidas','Blue','XL',21,100),(15,'Van Huesen','Black','S',47,70),(16,'Nike','Red','M',29,77),(17,'Levi','Red','S',35,43),(18,'Adidas','Black','L',14,63),(19,'Nike','Blue','XL',26,39),(22,'Adidas','Red','L',34,99),(24,'Nike','Blue','S',46,77),(25,'Van Huesen','Red','L',43,18),(27,'Levi','Black','S',39,47),(28,'Adidas','Blue','XS',34,57),(29,'Adidas','Black','XS',22,97),(30,'Adidas','Black','S',14,44),(31,'Nike','Black','L',20,39),(32,'Adidas','Blue','S',24,93),(33,'Levi','Black','L',45,18),(34,'Adidas','White','XL',19,27),(35,'Levi','White','S',11,29),(36,'Van Huesen','Blue','XL',25,21),(38,'Van Huesen','Black','XL',31,93),(40,'Van Huesen','Red','M',46,97),(41,'Van Huesen','White','L',10,11),(45,'Adidas','Red','M',17,66),(46,'Nike','White','M',43,77),(47,'Van Huesen','White','XS',49,37),(48,'Nike','Red','XL',23,79),(49,'Adidas','White','M',23,14),(50,'Levi','Red','L',31,36),(51,'Adidas','Black','XL',50,52),(52,'Levi','Blue','XS',16,53),(53,'Adidas','Red','S',18,89),(54,'Nike','Red','S',18,21),(56,'Van Huesen','Blue','S',34,18),(58,'Nike','Red','XS',27,55),(60,'Nike','Black','XL',45,71),(61,'Adidas','White','XS',29,38),(62,'Van Huesen','Black','XS',28,94),(63,'Levi','Black','XL',44,82),(67,'Nike','Blue','XS',16,75),(68,'Van Huesen','Blue','M',32,20),(69,'Adidas','Blue','M',11,77),(70,'Nike','Black','XS',35,98),(76,'Nike','White','S',43,43),(77,'Levi','White','XS',48,45),(78,'Van Huesen','Blue','L',25,77),(79,'Nike','Black','S',50,84),(82,'Van Huesen','Black','M',10,84),(91,'Van Huesen','White','XL',32,25),(93,'Nike','Blue','M',37,96),(98,'Adidas','Blue','L',29,40),(99,'Levi','Blue','XL',28,65);
/*!40000 ALTER TABLE `t_shirts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-16 15:54:28
