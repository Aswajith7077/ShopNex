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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `PRODUCT_ID` varchar(30) NOT NULL,
  `USER_ID` varchar(30) NOT NULL,
  `QUANTITY` decimal(10,0) NOT NULL DEFAULT '0',
  `TOTAL_PRICE` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PRODUCT_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('1010','johndoe@example.com',5,100);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ORDER_ID` varchar(50) NOT NULL,
  `PRODUCT_ID` varchar(30) DEFAULT NULL,
  `USER_ID` varchar(100) DEFAULT NULL,
  `DATE_OF_ORDER` timestamp NOT NULL,
  `QUANTITY` int NOT NULL DEFAULT '0',
  `PRICE` decimal(10,0) NOT NULL,
  `POINTS_GAINED` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('1001','johndoe@example.com','1010','2024-04-06 13:14:24',2,40,6);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login` (
  `USERNAME` varchar(40) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `PASSWD` varchar(50) NOT NULL,
  `POINTS` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login`
--

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` VALUES ('JohnDoe','johndoe@example.com','johndoe',0),('Scarlet','scarlet@email.com','scarlet',0);
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wish_list`
--

DROP TABLE IF EXISTS `wish_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wish_list` (
  `PRODUCT_ID` varchar(30) NOT NULL,
  `USER_ID` varchar(100) NOT NULL,
  `PRIORITY` int DEFAULT '0',
  PRIMARY KEY (`PRODUCT_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish_list`
--

LOCK TABLES `wish_list` WRITE;
/*!40000 ALTER TABLE `wish_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `wish_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'e_commerce'
--

--
-- Dumping routines for database 'e_commerce'
--
/*!50003 DROP PROCEDURE IF EXISTS `ADD_PROMOTIONS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ADD_PROMOTIONS`(
	IN PRO_CODE VARCHAR(30),
	IN PRO_QOT VARCHAR(500),
    IN VALIDITY_PERIOD TIMESTAMP,
    IN DISCOUNT DECIMAL(2,2)
)
BEGIN
	IF (SELECT VALIDITY_PERIOD > SYSDATE()) 
		AND (DISCOUNT BETWEEN 0 AND 1) 
        AND (PRO_CODE IN (
				SELECT PRODUCT_ID
				FROM PRODUCTS
			)
		)
		AND PRO_QOT != ''
    THEN
		INSERT INTO PROMOTIONS
		VALUES(PRO_CODE,PRO_QOT,VALIDITY_PERIOD,DISCOUNT);
        SELECT 'SUCCESS';
    ELSE
    	SELECT 'FAILURE';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_TO_CART` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ADD_TO_CART`(
	IN EMAIL_ID VARCHAR(40),
    IN PRO_CODE VARCHAR(30),
    IN QUANTITY NUMERIC
)
BEGIN
	DECLARE PRICE NUMERIC;
	IF (EMAIL_ID IN (
			SELECT EMAIL
            FROM USER_LOGIN
		) AND PRO_CODE IN (
			SELECT PRODUCT_ID
            FROM PRODUCTS
        ) AND PRO_CODE NOT IN(
			SELECT PRODUCT_ID
            FROM CART
            WHERE USER_ID = EMAIL_ID
        )
        AND QUANTITY > 0
	)
    THEN
		SELECT PRODUCT_PRICE INTO PRICE
		FROM PRODUCTS
        WHERE PRODUCT_ID = PRO_CODE;
        
		SET PRICE := PRICE * QUANTITY;
		INSERT INTO CART
        VALUES(PRO_CODE,EMAIL_ID,QUANTITY,PRICE);
	ELSE
		SELECT 'FAILURE';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_BEST_SELLERS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_BEST_SELLERS`(IN NUMBER_OF_ELEMENTS INTEGER)
BEGIN
	SELECT PRODUCT_ID,PRODUCT_PRICE,NO_OF_SOLD
    FROM PRODUCTS
    ORDER BY NO_OF_SOLD DESC
    LIMIT NUMBER_OF_ELEMENTS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_CART_ITEMS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_CART_ITEMS`(IN EMAIL_ID VARCHAR(100))
BEGIN
	SELECT *
    FROM CART
    WHERE USER_ID = EMAIL_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_SEARCH_RESULTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_SEARCH_RESULTS`(IN SEARCH_ELEMENT VARCHAR(20))
BEGIN
	SELECT *
    FROM PRODUCTS
    WHERE PRODUCT_NAME LIKE CONCAT('%',SEARCH_ELEMENT,'%') OR CATEGORY LIKE CONCAT('%',SEARCH_ELEMENT,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_USERS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_USERS`()
BEGIN
	SELECT *
    FROM USER_LOGIN;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_WISH_LIST_ELEMENTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_WISH_LIST_ELEMENTS`(IN EMAIL_ID VARCHAR(100))
BEGIN
	IF (EMAIL_ID IN (
				SELECT EMAIL
				FROM USER_LOGIN
			)
		)
	THEN
		SELECT *
		FROM WISH_LIST
		WHERE USER_ID = EMAIL_ID;
	ELSE
		SELECT 'FAILURE';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PLACE_ORDER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PLACE_ORDER`(
	IN ORD_ID VARCHAR(50),
	IN EMAIL_ID VARCHAR(40),
    IN PRO_CODE VARCHAR(30),
    IN QUANTITY INTEGER
)
BEGIN
	DECLARE POINTS NUMERIC;
	DECLARE PRICES NUMERIC;
	DECLARE ORDER_DATE TIMESTAMP;
	IF (EMAIL_ID IN (
			SELECT EMAIL
            FROM USER_LOGIN
		) AND PRO_CODE IN (
			SELECT PRODUCT_ID
            FROM PRODUCTS
        ) AND QUANTITY > 0
	)
    THEN
		SET ORDER_DATE := SYSDATE();
		SELECT PRODUCT_PRICE,POINT_PER_UNIT
			INTO PRICES,POINTS
		FROM PRODUCTS
		WHERE PRODUCT_ID = PRO_CODE;
		
		SET PRICES := PRICES * QUANTITY;
		SET POINTS := POINTS * QUANTITY;
        
        INSERT INTO ORDERS
        VALUES(ORD_ID,EMAIL_ID,PRO_CODE,ORDER_DATE,QUANTITY,PRICES,POINTS);
    ELSE
		SELECT 'FAILURE';
    END IF;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REMOVE_FROM_CART` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REMOVE_FROM_CART`(
	IN EMAIL_ID VARCHAR(40),
    IN PRO_CODE VARCHAR(30)
)
BEGIN
	IF (EMAIL_ID IN (
			SELECT EMAIL
            FROM USER_LOGIN
		) AND PRO_CODE IN (
			SELECT PRODUCT_ID
            FROM CART
            WHERE USER_ID = EMAIL_ID
		)
    )
    THEN
		DELETE FROM CART
        WHERE USER_ID = EMAIL_ID AND PRODUCT_ID = PRO_CODE;
    ELSE
		SELECT 'FAILURE';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-19 19:58:55
