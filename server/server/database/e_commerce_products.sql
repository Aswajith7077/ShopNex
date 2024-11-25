CREATE DATABASE  IF NOT EXISTS `e_commerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `e_commerce`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: e_commerce
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `PRODUCT_ID` varchar(30) NOT NULL,
  `PRODUCT_DESC` varchar(500) NOT NULL,
  `PRODUCT_NAME` varchar(60) NOT NULL,
  `PRODUCT_PRICE` decimal(10,0) NOT NULL,
  `POINT_PER_UNIT` decimal(10,0) DEFAULT '0',
  `PRODUCT_RATING` decimal(10,0) DEFAULT '0',
  `PRODUCT_LINK` varchar(500) NOT NULL,
  `NO_OF_SOLD` int DEFAULT '0',
  `CATEGORY` varchar(50) NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  CONSTRAINT `products_chk_1` CHECK ((`PRODUCT_PRICE` > 0)),
  CONSTRAINT `products_chk_2` CHECK ((`NO_OF_SOLD` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('1001','High-quality leather wallet with multiple compartments.','Leather Wallet',50,5,5,'https://example.com/leather-wallet',120,'Accessories'),('1002','Stainless steel water bottle, 20 oz capacity.','Stainless Steel Water Bottle',20,3,4,'https://example.com/water-bottle',80,'Kitchenware'),('1003','Lightweight and durable laptop backpack with padded compartments.','Laptop Backpack',60,8,5,'https://example.com/laptop-backpack',150,'Bags & Luggage'),('1004','Soft cotton t-shirt with a minimalist design.','Basic T-Shirt',15,2,4,'https://example.com/basic-t-shirt',200,'Clothing'),('1005','Premium noise-canceling headphones with Bluetooth connectivity.','Noise-Canceling Headphones',150,10,5,'https://example.com/headphones',90,'Electronics'),('1006','Classic leather belt with a polished buckle.','Leather Belt',35,4,4,'https://example.com/leather-belt',110,'Accessories'),('1007','Stylish sunglasses with UV protection.','Sunglasses',30,3,5,'https://example.com/sunglasses',70,'Accessories'),('1008','Set of ceramic mugs, perfect for morning coffee.','Ceramic Mug Set',25,4,5,'https://example.com/mug-set',100,'Kitchenware'),('1009','Cozy fleece blanket for chilly evenings.','Fleece Blanket',40,6,4,'https://example.com/fleece-blanket',80,'Home & Decor'),('1010','Versatile canvas tote bag with reinforced handles.','Canvas Tote Bag',20,3,4,'https://example.com/tote-bag',130,'Bags & Luggage');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-19 19:57:22
