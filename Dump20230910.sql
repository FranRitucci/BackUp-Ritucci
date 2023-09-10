-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: telecomunicaciones
-- ------------------------------------------------------
-- Server version	8.0.32

-- LAS TABLAS QUE SE ENCUENTRAN EN ESTE BACKUP SON: customers / sales / services / services_customers / stock_distribution / stock_equipment

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
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'sandra','perez',52698325,1,56228745,'sandrap@gmail.com','Sauces 1450','residencial'),(2,'martin','lopez',41784523,2,54119637,'martinlopez@gmail.com','Av. falsa 123','residencial'),(3,'elba','edelmira',51284963,3,54009753,'elbaedel@gmail.com','Las Margaritas 3210','residencial'),(4,'raul','jael',22943255,4,1184226397,'rauljael@gmail.com','Rivadavia 1037','corporativo'),(5,'mabel','gomez',1594321,5,42518964,'mabegomez@gmail.com','Los troncos 6550','residencial'),(6,'lorena','hertz',46389428,1,11479536,'lorehertz@hotmail.com','Av. Lavalle 500','residencial'),(7,'ramiro','alterio',40098297,1,43789454,'ramialterio@gmail.com','Tambues 1200','residencial'),(8,'hector','correa',17894221,2,38008850,'correahector17@yahoo.com.ar','Asuncion 100','corporativo'),(19,'norma','angeles',52948563,4,29563775,'angelesnormita@live.com.ar','Los nogales 5700','residencial'),(20,'hernan','lopez',12973655,2,54119736,'hernilo@gmail.com','Av. Soberania 103','corporativo'),(21,'elba','chuca',11967418,3,52362157,'elchubaca@gmail.com','Orquideas 633','residencial'),(22,'raul','ramirez',36934555,4,3699334,'rr777@gmail.com','Ingeniero schur 1800','corporativo'),(23,'belinda','saenz',5666956,5,34903025,'bsaenz07@hotmail.com','oso pardo 560','residencial');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'internet 100Mb','2017-05-15',2,NULL,NULL,NULL),(2,'internet 200Mb','2019-08-09',1,NULL,NULL,NULL),(3,'TV + INT 100Mb','2018-03-10',3,NULL,NULL,NULL),(4,'TV + INT 200Mb','2018-01-12',1,NULL,NULL,NULL),(5,'TV + INT 100Mb + TEL','2017-02-19',4,NULL,NULL,NULL),(6,'TV + INT 200Mb + TEL','2020-12-28',5,NULL,NULL,NULL),(7,'internet 200mb','2023-08-26',1,NULL,'modem docsis2.0',1),(8,'internet 200Mb','2023-09-05',2,4400.55,'modem docsis1.0',1);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'internet 100Mb',2000.00),(2,'internet 200Mb',5324.67),(3,'TV + INT 100Mb',3500.00),(4,'TV + INT 200Mb',5500.80),(5,'TV + INT 100Mb + TEL',5900.00),(6,'TV + INT 200Mb + TEL',8950.00);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `services_customers`
--

LOCK TABLES `services_customers` WRITE;
/*!40000 ALTER TABLE `services_customers` DISABLE KEYS */;
INSERT INTO `services_customers` VALUES (1,1,2,'internet 100Mb'),(2,2,1,'internet 200Mb'),(3,3,3,'TV + INT 100Mb'),(5,5,4,'TV + INT 100Mb + TEL'),(4,4,1,'TV + INT 200Mb'),(6,6,5,'TV + INT 200Mb + TEL');
/*!40000 ALTER TABLE `services_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stock_distribution`
--

LOCK TABLES `stock_distribution` WRITE;
/*!40000 ALTER TABLE `stock_distribution` DISABLE KEYS */;
INSERT INTO `stock_distribution` VALUES (1,1,'modem docsis1.0',80,'Vedia 1230'),(2,1,'modem docsis2.0',68,'Vedia 1230'),(3,1,'Central-Home1.0',100,'Vedia 1230'),(4,1,'Central-Home2.0',95,'Vedia 1230'),(5,1,'Central-Home+TEL1.0',45,'Saenz 500'),(6,1,'Central-Home+TEL2.0',21,'Saenz 500'),(7,2,'modem docsis1.0',30,'Batalla de San Lorenzo 150'),(8,2,'modem docsis2.0',29,'Batalla de San Lorenzo 150'),(9,2,'Central-Home1.0',51,'Batalla de San Lorenzo 150'),(10,2,'Central-Home2.0',51,'Batalla de San Lorenzo 150'),(11,2,'Central-Home+TEL1.0',27,'Batalla de San Lorenzo 150'),(12,2,'Central-Home+TEL2.0',21,'Batalla de San Lorenzo 150'),(13,3,'modem docsis1.0',30,'Calle110 320'),(14,3,'modem docsis2.0',29,'Calle110 320'),(15,3,'Central-Home1.0',50,'Calle110 320'),(16,3,'Central-Home2.0',51,'Calle110 320'),(17,3,'Central-Home+TEL1.0',27,'Calle110 320'),(18,3,'Central-Home+TEL2.0',19,'Nogales 9000'),(19,4,'modem docsis1.0',35,'Ruta 5 Km1.5'),(20,4,'modem docsis2.0',29,'Ruta 5 Km1.5'),(21,4,'Central-Home1.0',50,'Rotonda310 Ala 1'),(22,4,'Central-Home2.0',53,'Rotonda310 Ala 1'),(23,4,'Central-Home+TEL1.0',30,'Rotonda310 Ala 1'),(24,4,'Central-Home+TEL2.0',19,'Rotonda310 Ala 1'),(25,5,'modem docsis1.0',25,'Ruta 1 Km30'),(26,5,'modem docsis2.0',29,'Ruta 1 Km30'),(27,5,'Central-Home1.0',50,'Ruta 1 Km30'),(28,5,'Central-Home2.0',51,'Ruta 1 Km30'),(29,5,'Central-Home+TEL1.0',27,'Ruta 1 Km30'),(30,5,'Central-Home+TEL2.0',19,'Ruta 1 Km30');
/*!40000 ALTER TABLE `stock_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stock_equipment`
--

LOCK TABLES `stock_equipment` WRITE;
/*!40000 ALTER TABLE `stock_equipment` DISABLE KEYS */;
INSERT INTO `stock_equipment` VALUES ('Central-Home+TEL1.0',5,156,4),('Central-Home+TEL2.0',6,99,4),('Central-Home1.0',3,301,1),('Central-Home2.0',4,301,1),('modem docsis1.0',1,200,1),('modem docsis2.0',2,184,3);
/*!40000 ALTER TABLE `stock_equipment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-10 17:38:32
