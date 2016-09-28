-- MySQL dump 10.13  Distrib 5.5.30, for Win32 (x86)
--
-- Host: localhost    Database: an_export1
-- ------------------------------------------------------
-- Server version	5.5.30

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'NEWBUCK',7,'2015-11-13 13:43:39','2015-11-19 10:02:53'),(2,'BRADO',7,'2015-11-17 07:07:20','2015-11-17 07:07:20'),(3,'NAPA',7,'2015-12-25 15:27:47','2015-12-25 15:27:47');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assort_products`
--

DROP TABLE IF EXISTS `assort_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assort_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pieces` int(11) DEFAULT NULL,
  `sqft` int(11) DEFAULT NULL,
  `assortment_id` int(11) DEFAULT NULL,
  `purchase_product_id` int(11) DEFAULT NULL,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assort_products`
--

LOCK TABLES `assort_products` WRITE;
/*!40000 ALTER TABLE `assort_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `assort_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assortments`
--

DROP TABLE IF EXISTS `assortments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assortments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assort_date` date DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assortments`
--

LOCK TABLES `assortments` WRITE;
/*!40000 ALTER TABLE `assortments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assortments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barcodes`
--

DROP TABLE IF EXISTS `barcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_product_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_barcodes_on_purchase_product_id` (`purchase_product_id`),
  KEY `index_barcodes_on_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcodes`
--

LOCK TABLES `barcodes` WRITE;
/*!40000 ALTER TABLE `barcodes` DISABLE KEYS */;
INSERT INTO `barcodes` VALUES (1,'000000',NULL,NULL,'2015-08-02 11:46:44','2015-08-02 11:46:45');
/*!40000 ALTER TABLE `barcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'SKIN','2015-08-02 07:14:16','2015-08-02 07:15:29'),(2,'CHEMICALS','2015-08-02 07:14:27','2015-08-02 07:15:53'),(3,'COW SELECTION','2015-11-09 14:16:05','2015-11-09 14:16:05');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chemicals`
--

DROP TABLE IF EXISTS `chemicals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chemicals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `percent` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chemicals`
--

LOCK TABLES `chemicals` WRITE;
/*!40000 ALTER TABLE `chemicals` DISABLE KEYS */;
INSERT INTO `chemicals` VALUES (1,5,1,'2015-12-09 12:48:30','2015-12-09 12:48:30',0.5),(2,6,1,'2015-12-09 12:52:31','2015-12-09 12:52:31',0.2),(3,12,1,'2015-12-09 13:06:10','2015-12-09 13:06:10',20),(4,13,1,'2015-12-09 13:12:00','2015-12-09 13:12:00',30),(5,14,1,'2015-12-09 13:14:00','2015-12-09 13:14:00',5),(6,15,1,'2015-12-09 13:22:51','2015-12-09 13:22:51',1),(7,16,1,'2015-12-09 13:24:43','2015-12-09 13:24:43',1),(8,5,2,'2015-12-25 15:40:04','2015-12-25 15:40:04',0.5),(9,6,2,'2015-12-25 15:41:51','2015-12-25 15:41:51',0.2),(10,12,2,'2015-12-25 15:47:22','2015-12-25 15:47:22',20);
/*!40000 ALTER TABLE `chemicals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'BLACK','2015-11-13 13:44:45','2015-11-13 13:44:45');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opening_balance` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `tin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'DEFAULT','',0,'2015-11-16 17:14:02','2015-11-16 17:14:02','','');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_chemicals`
--

DROP TABLE IF EXISTS `job_chemicals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_chemicals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `chemical_id` int(11) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_chemicals`
--

LOCK TABLES `job_chemicals` WRITE;
/*!40000 ALTER TABLE `job_chemicals` DISABLE KEYS */;
INSERT INTO `job_chemicals` VALUES (1,1,5,1,250,2.5,'2015-12-22 05:11:23','2015-12-22 05:11:23'),(2,1,6,2,100,1,'2015-12-22 05:11:23','2015-12-22 05:11:23'),(3,1,12,3,10000,100,'2015-12-22 05:11:23','2015-12-22 05:11:23'),(4,1,13,4,15000,150,'2015-12-22 05:11:23','2015-12-22 05:11:23'),(5,1,14,5,2500,25,'2015-12-22 05:11:23','2015-12-22 05:11:23'),(6,1,15,6,500,5,'2015-12-22 05:11:23','2015-12-22 05:11:23'),(7,1,16,7,500,5,'2015-12-22 05:11:24','2015-12-22 05:11:24'),(8,2,5,1,250,2.5,'2015-12-22 05:22:15','2015-12-22 05:22:15'),(9,2,6,2,100,1,'2015-12-22 05:22:15','2015-12-22 05:22:15'),(10,2,12,3,10000,100,'2015-12-22 05:22:15','2015-12-22 05:22:15'),(11,2,13,4,15000,150,'2015-12-22 05:22:15','2015-12-22 05:22:15'),(12,2,14,5,2500,25,'2015-12-22 05:22:15','2015-12-22 05:22:15'),(13,2,15,6,500,5,'2015-12-22 05:22:15','2015-12-22 05:22:15'),(14,2,16,7,500,5,'2015-12-22 05:22:15','2015-12-22 05:22:15'),(15,3,5,1,250,2.5,'2015-12-26 16:14:25','2015-12-26 16:14:25'),(16,3,6,2,200,1,'2015-12-26 16:14:25','2015-12-26 16:14:25'),(17,3,12,3,100,100,'2015-12-26 16:14:25','2015-12-26 16:14:25'),(18,3,13,4,150,150,'2015-12-26 16:14:25','2015-12-26 16:14:25'),(19,3,14,5,1750,25,'2015-12-26 16:14:25','2015-12-26 16:14:25'),(20,3,15,6,500,5,'2015-12-26 16:14:25','2015-12-26 16:14:25'),(21,3,16,7,500,5,'2015-12-26 16:14:25','2015-12-26 16:14:25'),(22,4,5,1,250,2.5,'2015-12-26 16:16:54','2015-12-26 16:16:54'),(23,4,6,2,200,1,'2015-12-26 16:16:54','2015-12-26 16:16:54'),(24,4,12,3,100,100,'2015-12-26 16:16:54','2015-12-26 16:16:54'),(25,4,13,4,150,150,'2015-12-26 16:16:54','2015-12-26 16:16:54'),(26,4,14,5,1750,25,'2015-12-26 16:16:54','2015-12-26 16:16:54'),(27,4,15,6,500,5,'2015-12-26 16:16:54','2015-12-26 16:16:54'),(28,4,16,7,500,5,'2015-12-26 16:16:54','2015-12-26 16:16:54');
/*!40000 ALTER TABLE `job_chemicals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_processes`
--

DROP TABLE IF EXISTS `job_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_processes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `my_process_id` int(11) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cards_on_article_id_id` (`article_id`),
  KEY `index_cards_on_job_process_id_id` (`my_process_id`),
  KEY `index_cards_on_job_card_id_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_processes`
--

LOCK TABLES `job_processes` WRITE;
/*!40000 ALTER TABLE `job_processes` DISABLE KEYS */;
INSERT INTO `job_processes` VALUES (1,1,'2015-12-22 00:08:00','2015-12-22 01:08:00',1,420,1,'2015-12-22 05:07:11','2015-12-22 05:08:40'),(2,1,'2015-12-22 01:08:00','2015-12-22 02:08:00',2,520,1,'2015-12-22 05:07:11','2015-12-22 05:09:04'),(3,1,'2015-12-22 02:09:00','2015-12-22 03:09:00',3,420,1,'2015-12-22 05:07:11','2015-12-22 05:09:19'),(4,1,'2015-12-22 03:09:00','2015-12-22 04:09:00',4,220,1,'2015-12-22 05:07:11','2015-12-22 05:09:31'),(5,1,'2015-12-22 04:09:00','2015-12-22 05:09:00',5,530,1,'2015-12-22 05:07:11','2015-12-22 05:09:46'),(6,1,'2015-12-22 05:12:00','2015-12-22 05:12:00',6,1050,1,'2015-12-22 05:07:11','2015-12-22 05:12:12'),(7,1,'2015-12-22 05:12:00','2015-12-22 05:12:00',7,1050,1,'2015-12-22 05:07:11','2015-12-22 05:12:18'),(8,1,'2015-12-22 05:12:00','2015-12-22 05:12:00',8,1050,1,'2015-12-22 05:07:11','2015-12-22 05:12:23'),(9,1,'2015-12-22 05:12:00','2015-12-22 05:12:00',9,510,1,'2015-12-22 05:07:11','2015-12-22 05:12:28'),(10,1,'2015-12-22 05:12:00','2015-12-22 05:12:00',10,320,1,'2015-12-22 05:07:11','2015-12-22 05:12:33'),(11,1,'2015-12-22 05:21:00','2015-12-22 05:21:00',1,580,2,'2015-12-22 05:17:48','2015-12-22 05:21:20'),(12,1,'2015-12-22 05:21:00','2015-12-22 05:21:00',2,680,2,'2015-12-22 05:17:48','2015-12-22 05:21:24'),(13,1,'2015-12-22 05:21:00','2015-12-22 05:21:00',3,580,2,'2015-12-22 05:17:48','2015-12-22 05:21:28'),(14,1,'2015-12-22 05:21:00','2015-12-22 05:21:00',4,380,2,'2015-12-22 05:17:48','2015-12-22 05:21:34'),(15,1,'2015-12-22 05:21:00','2015-12-22 05:21:00',5,770,2,'2015-12-22 05:17:48','2015-12-22 05:21:39'),(16,1,'2015-12-22 05:21:00','2015-12-22 05:21:00',6,1450,2,'2015-12-22 05:17:48','2015-12-22 05:21:47'),(17,1,'2015-12-22 05:21:00','2015-12-22 05:21:00',7,1450,2,'2015-12-22 05:17:48','2015-12-22 05:21:50'),(18,1,'2015-12-22 05:21:00','2015-12-22 05:21:00',8,1450,2,'2015-12-22 05:17:48','2015-12-22 05:21:54'),(19,1,'2015-12-22 05:22:00','2015-12-22 05:22:00',9,590,2,'2015-12-22 05:17:48','2015-12-22 05:22:02'),(20,1,'2015-12-22 05:22:00','2015-12-22 05:22:00',10,480,2,'2015-12-22 05:17:48','2015-12-22 05:22:23'),(21,1,'2015-12-26 15:01:00','2015-12-26 16:01:00',1,440,3,'2015-12-26 15:59:13','2015-12-26 16:01:29'),(22,1,'2015-12-26 16:01:00','2015-12-26 16:01:00',2,540,3,'2015-12-26 15:59:13','2015-12-26 16:01:40'),(23,1,'2015-12-26 16:01:00','2015-12-26 16:01:00',3,500,3,'2015-12-26 15:59:13','2015-12-26 16:01:49'),(24,1,'2015-12-26 16:01:00','2015-12-26 16:01:00',4,300,3,'2015-12-26 15:59:13','2015-12-26 16:02:16'),(25,1,'2015-12-26 16:02:00','2015-12-26 16:02:00',5,560,3,'2015-12-26 15:59:13','2015-12-26 16:02:21'),(26,1,'2015-12-26 16:02:00','2015-12-26 16:02:00',6,1100,3,'2015-12-26 15:59:13','2015-12-26 16:02:26'),(27,1,'2015-12-26 16:02:00','2015-12-26 16:02:00',7,1100,3,'2015-12-26 15:59:13','2015-12-26 16:02:48'),(28,1,'2015-12-26 16:03:00','2015-12-26 16:03:00',8,1100,3,'2015-12-26 15:59:13','2015-12-26 16:03:14'),(29,1,'2015-12-26 16:04:00','2015-12-26 16:04:00',9,520,3,'2015-12-26 15:59:13','2015-12-26 16:04:17'),(30,1,'2015-12-26 16:04:00','2015-12-26 16:04:00',10,340,3,'2015-12-26 15:59:13','2015-12-26 16:04:26'),(31,1,'2015-12-26 16:15:00','2015-12-26 16:15:00',1,560,4,'2015-12-26 16:15:29','2015-12-26 16:15:51'),(32,1,'2015-12-26 16:15:00','2015-12-26 16:15:00',2,660,4,'2015-12-26 16:15:29','2015-12-26 16:16:01'),(33,1,'2015-12-26 16:16:00','2015-12-26 16:16:00',3,560,4,'2015-12-26 16:15:29','2015-12-26 16:16:05'),(34,1,'2015-12-26 16:16:00','2015-12-26 16:16:00',4,360,4,'2015-12-26 16:15:29','2015-12-26 16:16:09'),(35,1,'2015-12-26 16:16:00','2015-12-26 16:16:00',5,740,4,'2015-12-26 16:15:29','2015-12-26 16:16:13'),(36,1,'2015-12-26 16:16:00','2015-12-26 16:16:00',6,1400,4,'2015-12-26 16:15:29','2015-12-26 16:16:18'),(37,1,'2015-12-26 16:16:00','2015-12-26 16:16:00',7,1400,4,'2015-12-26 16:15:29','2015-12-26 16:16:23'),(38,1,'2015-12-26 16:16:00','2015-12-26 16:16:00',8,1400,4,'2015-12-26 16:15:29','2015-12-26 16:16:26'),(39,1,'2015-12-26 16:16:00','2015-12-26 16:16:00',9,580,4,'2015-12-26 16:15:29','2015-12-26 16:16:31'),(40,1,'2015-12-26 16:16:00','2015-12-26 16:16:00',10,460,4,'2015-12-26 16:15:29','2015-12-26 16:16:34');
/*!40000 ALTER TABLE `job_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_products`
--

DROP TABLE IF EXISTS `job_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `pieces` int(11) DEFAULT NULL,
  `sqft` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_products`
--

LOCK TABLES `job_products` WRITE;
/*!40000 ALTER TABLE `job_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jc_date` date DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `substance_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `hides` int(11) DEFAULT NULL,
  `sides` int(11) DEFAULT NULL,
  `total_pieces` int(11) DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_sqft` int(11) DEFAULT NULL,
  `avg_sqft` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `manufacturing_order_id` int(11) DEFAULT NULL,
  `work_order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_job_cards_on_customer_id` (`customer_id`),
  KEY `index_job_cards_on_article_id` (`article_id`),
  KEY `index_job_cards_on_color_id` (`color_id`),
  KEY `index_job_cards_on_substance_id` (`substance_id`),
  KEY `index_jobs_on_manufacturing_order_id` (`manufacturing_order_id`),
  KEY `index_jobs_on_work_order_id` (`work_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,NULL,'particular1','2015-12-22',1,1,1,1,500,10,90,100,'DONE',1000,10,'2015-12-22 05:07:11','2015-12-22 05:12:44',1,NULL),(2,NULL,'particular2','2015-12-22',1,1,1,1,500,90,10,100,'DONE',1000,10,'2015-12-22 05:17:48','2015-12-22 05:22:33',1,NULL),(3,NULL,'particular1','2015-12-26',1,1,1,NULL,500,20,80,100,'DONE',1500,15,'2015-12-26 15:59:12','2015-12-26 16:14:50',2,NULL),(4,NULL,'particular1','2015-12-26',1,1,1,NULL,500,80,20,100,'DONE',1500,15,'2015-12-26 16:15:29','2015-12-26 16:17:02',2,NULL);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturing_orders`
--

DROP TABLE IF EXISTS `manufacturing_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturing_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `particular` varchar(255) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `substance_id` int(11) DEFAULT NULL,
  `total_sqft` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT 'DRAFT',
  `average` int(11) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `agent_commision` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_manufacturing_orders_on_customer_id` (`customer_id`),
  KEY `index_manufacturing_orders_on_article_id` (`article_id`),
  KEY `index_manufacturing_orders_on_color_id` (`color_id`),
  KEY `index_manufacturing_orders_on_substance_id` (`substance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturing_orders`
--

LOCK TABLES `manufacturing_orders` WRITE;
/*!40000 ALTER TABLE `manufacturing_orders` DISABLE KEYS */;
INSERT INTO `manufacturing_orders` VALUES (1,1,'This is the Particulars','2015-12-22',1,1,1,2000,'2015-12-22 05:01:51','2015-12-22 05:22:34','DONE',NULL,NULL,NULL,NULL,NULL,NULL),(2,1,'This is the Particulars','2015-12-26',1,1,1,3000,'2015-12-26 15:51:58','2015-12-26 16:17:02','DONE',NULL,NULL,NULL,NULL,NULL,NULL),(3,1,'This is a particular','2016-01-30',1,1,1,3000,'2016-01-30 05:29:54','2016-01-30 05:30:18','PRODUCTION STARTED',NULL,'2016-01-30','2016-01-30','INR',200000.00,10);
/*!40000 ALTER TABLE `manufacturing_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_processes`
--

DROP TABLE IF EXISTS `my_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_processes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost_per_side` decimal(10,0) DEFAULT NULL,
  `cost_hide` decimal(10,0) DEFAULT NULL,
  `cost_per_pieces` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_processes`
--

LOCK TABLES `my_processes` WRITE;
/*!40000 ALTER TABLE `my_processes` DISABLE KEYS */;
INSERT INTO `my_processes` VALUES (1,'Samming',4,6,5.00,'2015-04-29 13:39:44','2015-04-29 13:39:44',1),(2,'SPLITTING',5,7,5.00,'2015-04-29 13:40:18','2015-04-29 13:40:18',1),(3,'SHAVING',4,6,5.00,'2015-04-29 13:40:40','2015-04-29 13:40:40',1),(4,'Trimming',2,4,2.00,'2015-05-12 10:11:39','2015-05-18 18:58:56',1),(5,'Buffing',5,8,5.00,'2015-05-24 05:21:24','2015-05-24 05:21:24',1),(6,'Dying',10,15,10.00,'2015-12-15 14:48:28','2015-12-15 14:48:28',1),(7,'First Setting',10,15,10.00,'2015-12-15 14:49:21','2015-12-15 14:49:21',1),(8,'Second Setting',10,15,10.00,'2015-12-15 14:49:33','2015-12-15 14:49:33',1),(9,'Vacuum',5,6,5.00,'2015-12-15 14:51:23','2015-12-15 14:51:23',1),(10,'Hooking',3,5,3.00,'2015-12-15 14:55:49','2015-12-15 14:55:49',1),(11,'SAMMING',5,6,5.00,'2015-12-25 15:17:50','2015-12-25 15:17:50',2),(12,'SPLITTING',5,6,5.00,'2015-12-25 15:29:50','2015-12-25 15:29:50',2),(13,'SHAVING',5,6,5.00,'2015-12-25 15:31:26','2015-12-25 15:31:26',2),(14,'TRIMMING',5,6,5.00,'2015-12-25 15:38:08','2015-12-25 15:38:08',2),(15,'SAMMING',5,6,5.00,'2015-12-26 15:29:18','2015-12-26 15:29:18',3),(16,'SPLITTING',5,6,5.00,'2015-12-26 15:29:32','2015-12-26 15:29:32',3),(17,'SHAVING',5,6,5.00,'2015-12-26 15:29:44','2015-12-26 15:29:44',3),(18,'TRIMMING',5,6,5.00,'2015-12-26 15:30:42','2015-12-26 15:30:42',3),(19,'DRUM(RE-CHROME)',NULL,NULL,4.50,'2015-12-26 15:36:58','2015-12-26 15:36:58',3),(20,'SETTING',4,5,5.00,'2015-12-26 15:40:27','2015-12-26 15:40:27',3),(21,'REVERSE SETTING',7,8,7.00,'2015-12-26 15:40:53','2015-12-26 15:40:53',3),(22,'VACUUM',8,9,8.00,'2015-12-26 15:41:54','2015-12-26 15:41:54',3),(23,'HOOKING',2,2,1.50,'2015-12-26 15:42:22','2015-12-26 15:42:22',3),(24,'MOLISA',4,5,5.00,'2015-12-26 15:42:58','2015-12-26 15:42:58',3),(25,'TRIMMING',2,2,2.00,'2015-12-26 15:43:54','2015-12-26 15:43:54',3),(26,'BUFFING',4,5,5.00,'2015-12-26 15:44:33','2015-12-26 15:44:33',3),(27,'SNUFFING',4,5,5.00,'2015-12-26 15:44:49','2015-12-26 15:44:49',3),(28,'PLATING',4,5,5.00,'2015-12-26 15:45:08','2015-12-26 15:45:08',3),(29,'SPRAY',3,3,3.00,'2015-12-26 15:46:04','2015-12-26 15:46:04',3),(30,'GEMATA',8,9,9.00,'2015-12-26 15:46:32','2015-12-26 15:46:32',3),(31,'ROLLER',8,9,9.00,'2015-12-26 15:47:28','2015-12-26 15:47:28',3),(32,'PLATING',4,5,5.00,'2015-12-26 15:48:13','2015-12-26 15:48:13',3),(33,'TRIMMING',2,2,2.00,'2015-12-26 15:48:29','2015-12-26 15:48:29',3),(34,'ASSORTMENT',0,0,0.00,'2015-12-26 15:49:08','2015-12-26 15:49:08',3),(35,'MEASUREMENT',2,2,2.00,'2015-12-26 15:49:22','2015-12-26 15:49:22',3),(36,'PACKING',5,5,5.00,'2015-12-26 15:50:26','2015-12-26 15:50:26',3);
/*!40000 ALTER TABLE `my_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `substance_id` int(11) DEFAULT NULL,
  `sqft` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_payments_on_transaction_id` (`transaction_id`),
  KEY `index_payments_on_purchase_id` (`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pieces` float DEFAULT '0',
  `sqft` int(11) DEFAULT NULL,
  `style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_assortable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'COW',1,'Nos',0,'2015-08-02 07:16:23','2015-12-26 15:56:35',0,0,NULL,NULL,1),(2,'GOAT',1,'Nos',0,'2015-08-02 07:16:38','2015-11-09 14:11:12',0,0,NULL,NULL,1),(3,'SHEEP',1,'Nos',0,'2015-08-02 07:16:47','2015-11-09 14:48:51',0,0,NULL,NULL,1),(4,'BUFF',1,'Nos',0,'2015-08-02 07:16:55','2015-08-02 07:16:55',0,0,NULL,NULL,1),(5,'SAF',2,'Nos',0,'2015-08-02 07:17:21','2015-12-26 16:16:55',40,0,NULL,NULL,0),(6,'FORMIC ACID',2,'Nos',0,'2015-08-02 07:17:32','2015-12-26 16:16:55',6,0,NULL,NULL,0),(7,'COW SELECTION A',3,'Nos',0,'2015-11-09 14:16:25','2015-12-26 15:56:35',400,4000,NULL,NULL,0),(8,'COW SELECTION B',3,'Nos',0,'2015-11-09 14:16:33','2015-12-18 10:10:09',0,0,NULL,NULL,0),(9,'COW SELECTION C',3,'Nos',0,'2015-11-09 14:16:40','2015-11-10 12:07:22',0,0,NULL,NULL,0),(10,'COW SELECTION D',3,'Nos',0,'2015-11-09 14:16:46','2015-11-10 12:07:22',0,0,NULL,NULL,0),(11,'COW SELECTION E',3,'Nos',0,'2015-11-09 14:16:53','2015-11-10 12:07:22',0,0,NULL,NULL,0),(12,'AL',2,NULL,0,'2015-12-09 08:51:16','2015-12-26 16:16:55',600,NULL,NULL,NULL,NULL),(13,'CRN',2,NULL,0,'2015-12-09 08:51:16','2015-12-26 16:16:55',400,NULL,NULL,NULL,NULL),(14,'CHROME',2,NULL,0,'2015-12-09 08:51:16','2015-12-26 16:16:55',50,NULL,NULL,NULL,NULL),(15,'LBF',2,NULL,0,'2015-12-09 08:51:16','2015-12-26 16:16:55',40,NULL,NULL,NULL,NULL),(16,'FORMAT',2,NULL,0,'2015-12-09 08:51:16','2015-12-26 16:16:55',40,NULL,NULL,NULL,NULL),(17,'AF',2,NULL,0,'2015-12-09 08:51:16','2015-12-09 08:51:16',0,NULL,NULL,NULL,NULL),(18,'BICARB',2,NULL,0,'2015-12-09 08:51:16','2015-12-12 06:51:12',0,NULL,NULL,NULL,NULL),(19,'ANS',2,NULL,0,'2015-12-09 08:51:16','2015-12-09 08:51:16',0,NULL,NULL,NULL,NULL),(20,'RE',2,NULL,0,'2015-12-09 08:51:17','2015-12-09 08:51:17',0,NULL,NULL,NULL,NULL),(21,'SL100',2,NULL,0,'2015-12-09 08:51:17','2015-12-09 08:51:17',0,NULL,NULL,NULL,NULL),(22,'AM7',2,NULL,0,'2015-12-09 08:51:17','2015-12-09 08:51:17',0,NULL,NULL,NULL,NULL),(23,'FS66',2,NULL,0,'2015-12-09 08:51:17','2015-12-09 08:51:17',0,NULL,NULL,NULL,NULL),(24,'GSP',2,NULL,0,'2015-12-09 08:51:17','2015-12-09 08:51:17',0,NULL,NULL,NULL,NULL),(25,'FFS',2,NULL,0,'2015-12-09 08:51:17','2015-12-09 08:51:17',0,NULL,NULL,NULL,NULL),(26,'ATO',2,NULL,0,'2015-12-09 08:51:17','2015-12-09 08:51:17',0,NULL,NULL,NULL,NULL),(27,'BISULPHATE',2,NULL,0,'2015-12-09 08:51:17','2015-12-09 08:51:17',0,NULL,NULL,NULL,NULL),(28,'FBT',2,NULL,0,'2015-12-09 08:51:17','2015-12-09 08:51:17',0,NULL,NULL,NULL,NULL),(29,'NGR',2,NULL,0,'2015-12-09 08:51:17','2015-12-09 08:51:17',0,NULL,NULL,NULL,NULL),(30,'OLIVE BROWN BG',2,NULL,0,'2015-12-09 08:51:17','2015-12-09 08:51:17',0,NULL,NULL,NULL,NULL),(31,'SL70',2,NULL,0,'2015-12-09 08:51:17','2015-12-09 08:51:17',0,NULL,NULL,NULL,NULL),(32,'HLN',2,NULL,0,'2015-12-09 08:51:17','2015-12-09 08:51:17',0,NULL,NULL,NULL,NULL),(33,'WSF',2,NULL,0,'2015-12-09 08:51:17','2015-12-09 08:51:17',0,NULL,NULL,NULL,NULL),(34,'SORBITAL',2,NULL,0,'2015-12-09 08:51:18','2015-12-09 08:51:18',0,NULL,NULL,NULL,NULL),(35,'R7',2,NULL,0,'2015-12-09 08:51:18','2015-12-09 08:51:18',0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_products`
--

DROP TABLE IF EXISTS `purchase_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `pieces` int(11) DEFAULT NULL,
  `sqft` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `price` float DEFAULT NULL,
  `received_qty` int(11) DEFAULT NULL,
  `assorted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `purchase_id` (`purchase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_products`
--

LOCK TABLES `purchase_products` WRITE;
/*!40000 ALTER TABLE `purchase_products` DISABLE KEYS */;
INSERT INTO `purchase_products` VALUES (1,1,1,200,2000,'2015-12-22 04:45:10','2015-12-22 05:06:06',20000,NULL,1),(49,5,2,50,NULL,'2015-12-22 05:27:57','2015-12-22 05:27:57',100,NULL,NULL),(50,6,2,10,NULL,'2015-12-22 05:27:57','2015-12-22 05:27:57',200,NULL,NULL),(51,12,2,1000,NULL,'2015-12-22 05:27:57','2015-12-22 05:27:57',1,NULL,NULL),(52,13,2,1000,NULL,'2015-12-22 05:27:57','2015-12-22 05:27:57',1,NULL,NULL),(53,14,2,50,NULL,'2015-12-22 05:27:57','2015-12-22 05:27:57',100,NULL,NULL),(54,15,2,10,NULL,'2015-12-22 05:27:57','2015-12-22 05:27:57',100,NULL,NULL),(55,16,2,10,NULL,'2015-12-22 05:27:57','2015-12-22 05:27:57',100,NULL,NULL),(56,1,3,200,2000,'2015-12-26 15:56:05','2015-12-26 15:56:35',100000,NULL,1),(57,14,4,100,NULL,'2015-12-26 16:13:56','2015-12-26 16:13:56',70,NULL,NULL),(58,15,4,50,NULL,'2015-12-26 16:13:56','2015-12-26 16:13:56',100,NULL,NULL),(59,16,4,50,NULL,'2015-12-26 16:13:56','2015-12-26 16:13:56',100,NULL,NULL);
/*!40000 ALTER TABLE `purchase_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `receipt_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suppliers_invoice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transport` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lr_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `freight` int(11) DEFAULT NULL,
  `dc` int(11) DEFAULT NULL,
  `vat` float DEFAULT '0',
  `cst` int(11) DEFAULT '0',
  `duty` int(11) DEFAULT NULL,
  `edu_cess` int(11) DEFAULT NULL,
  `surcharge` int(11) DEFAULT NULL,
  `round_off` float DEFAULT NULL,
  `debit_note` int(11) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT '0',
  `assorted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,'SK - 1',1,'2015-12-22',1,'2015-12-22 04:45:10','2015-12-22 04:45:10','SKP','1','2015-12-22','0',NULL,NULL,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,0,0),(2,'CB - 1',1,'2015-12-22',1,'2015-12-22 05:27:57','2015-12-22 05:27:57','CHP','1','2015-12-22','0',NULL,NULL,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,0,0),(3,'SK - 2',1,'2015-12-26',1,'2015-12-26 15:56:05','2015-12-26 15:56:05','SKP','23`','2015-12-26','0',NULL,NULL,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,0,0),(4,'CB - 2',1,'2015-12-26',1,'2015-12-26 16:13:56','2015-12-26 16:13:56','CHP','133','2015-12-26','0',NULL,NULL,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_products`
--

DROP TABLE IF EXISTS `sale_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `cprice` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_products`
--

LOCK TABLES `sale_products` WRITE;
/*!40000 ALTER TABLE `sale_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_returns`
--

DROP TABLE IF EXISTS `sale_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_returns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `cprice` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sale_returns_on_sale_id` (`sale_id`),
  KEY `index_sale_returns_on_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_returns`
--

LOCK TABLES `sale_returns` WRITE;
/*!40000 ALTER TABLE `sale_returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` float DEFAULT '0',
  `vat` int(11) DEFAULT '0',
  `sale_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20151027182045'),('20151101125410'),('20151109142333'),('20151116165818'),('20151116172152'),('20151116172432'),('20151119071340'),('20151201055158'),('20151201081809'),('20151220164450'),('20151220170559'),('20151227072229');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selected_products`
--

DROP TABLE IF EXISTS `selected_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selected_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `purchase_product_id` int(11) DEFAULT NULL,
  `selection_id` int(11) DEFAULT NULL,
  `pieces` int(11) DEFAULT NULL,
  `sqft` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_selected_products_on_product_id_id` (`product_id`),
  KEY `index_selected_products_on_purchase_product_id_id` (`purchase_product_id`),
  KEY `index_selected_products_on_selection_id_id` (`selection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selected_products`
--

LOCK TABLES `selected_products` WRITE;
/*!40000 ALTER TABLE `selected_products` DISABLE KEYS */;
INSERT INTO `selected_products` VALUES (1,7,1,NULL,200,2000,'2015-12-22 05:06:06','2015-12-22 05:06:06'),(2,7,56,NULL,200,2000,'2015-12-26 15:56:35','2015-12-26 15:56:35');
/*!40000 ALTER TABLE `selected_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selections`
--

DROP TABLE IF EXISTS `selections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pieces` int(11) DEFAULT NULL,
  `sqft` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selections`
--

LOCK TABLES `selections` WRITE;
/*!40000 ALTER TABLE `selections` DISABLE KEYS */;
/*!40000 ALTER TABLE `selections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'STORE_NAME','A. N. EXPORTS','2015-04-27 12:39:10','2015-04-27 12:39:11');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sold_products`
--

DROP TABLE IF EXISTS `sold_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sold_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_product_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `purchase_product_id` int(11) DEFAULT NULL,
  `sale_product_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `cprice` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sold_products`
--

LOCK TABLES `sold_products` WRITE;
/*!40000 ALTER TABLE `sold_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `sold_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_products`
--

DROP TABLE IF EXISTS `stock_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cprice` float DEFAULT NULL,
  `purchase_product_id` int(11) DEFAULT NULL,
  `sale_product_id` int(11) DEFAULT NULL,
  `sale_return_id` int(11) DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_stock_products_on_sale_return_id` (`sale_return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_products`
--

LOCK TABLES `stock_products` WRITE;
/*!40000 ALTER TABLE `stock_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `substances`
--

DROP TABLE IF EXISTS `substances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `substances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `substances`
--

LOCK TABLES `substances` WRITE;
/*!40000 ALTER TABLE `substances` DISABLE KEYS */;
INSERT INTO `substances` VALUES (1,1.2,'2015-04-29 14:15:29','2015-04-29 14:15:29');
/*!40000 ALTER TABLE `substances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `closing_balance` float DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pincode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_person` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cst` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT '0.00',
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'DEFAULT','','2015-08-02 07:19:03','2015-08-02 07:19:03',NULL,'001','',NULL,'','','','',NULL,NULL,NULL,NULL,'',0.00,NULL);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_categories`
--

DROP TABLE IF EXISTS `transaction_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_income` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_categories`
--

LOCK TABLES `transaction_categories` WRITE;
/*!40000 ALTER TABLE `transaction_categories` DISABLE KEYS */;
INSERT INTO `transaction_categories` VALUES (1,'Purchase Payments',NULL,0,NULL,'2014-12-19 05:28:17','2014-12-19 05:28:17'),(2,'Sales',NULL,1,NULL,'2014-12-19 05:28:17','2014-12-19 05:28:17'),(3,'Salary',NULL,0,NULL,'2014-12-19 05:28:17','2014-12-19 05:28:17'),(4,'Other Expenses',NULL,0,NULL,'2014-12-19 05:28:17','2014-12-19 05:28:17');
/*!40000 ALTER TABLE `transaction_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `receipt_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `voucher_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_transactions_on_supplier_id` (`supplier_id`),
  KEY `index_transactions_on_transaction_category_id` (`transaction_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_reset_sent_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@email.com','$2a$10$A8/2iXIz7oiLFoTw5t6wsuWzC3hVYKJcKc9HxnZW5jUBDaCJMFguS','zAlAPkUk_0UBonPnOYbrPA',NULL,NULL,'2014-12-19 05:28:17','2014-12-19 05:28:17','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_orders`
--

DROP TABLE IF EXISTS `work_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `particular` varchar(255) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `substance_id` int(11) DEFAULT NULL,
  `total_sqft` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'DRAFT',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `average` float DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `agent_commision` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_orders`
--

LOCK TABLES `work_orders` WRITE;
/*!40000 ALTER TABLE `work_orders` DISABLE KEYS */;
INSERT INTO `work_orders` VALUES (1,1,'This is a Particular','2015-12-20',1,1,1,1000,'DRAFT','2015-12-20 16:58:29','2015-12-20 16:58:29',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `work_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-30 11:02:16
