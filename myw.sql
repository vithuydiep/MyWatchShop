-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: mywshop
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `payment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1609511201673,1608274905742,1316000,NULL,'Gò Cát Quận 9 TPHCM','2021-01-01 14:26:42','Diệp ThuyVi','0898018964'),(1608218141089,1,22470000,'Bank transfer','HCMC','2020-12-17 15:15:41','quangcute','0898018964'),(1608218991591,3,14980000,'Bank transfer','HCMC','2020-12-17 15:29:52','eee','0898018964');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_detail`
--

DROP TABLE IF EXISTS `bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_detail` (
  `bill_detail_id` bigint NOT NULL,
  `bill_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`bill_detail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_detail`
--

LOCK TABLES `bill_detail` WRITE;
/*!40000 ALTER TABLE `bill_detail` DISABLE KEYS */;
INSERT INTO `bill_detail` VALUES (0,1488468815884,2,9000000,1),(1490683071143,1490683071125,14,55440000,1),(1490687358050,1490687358000,6,20900000,1),(1608218141117,1608218141089,2,7490000,3),(1608218991603,1608218991591,2,7490000,2),(1608219971084,1608219971062,3,5690000,1),(1608220174135,1608220174117,2,7490000,1),(1608220174149,1608220174117,3,5690000,1),(1608220174158,1608220174117,4,19999000,1),(1608220398094,1608220398073,3,5690000,1),(1608308302651,1608308302634,1,12999000,1),(1608308976458,1608308976439,1,12999000,1),(1608308976472,1608308976439,3,5690000,1),(1608688832491,1608688832401,1,12999000,1),(1608688832536,1608688832401,2,7490000,1),(1609494525653,1609494525638,1,12999000,1),(1609494525669,1609494525638,2,7490000,1),(1609511201704,1609511201673,5,1316000,1),(1611914481521,1611914481510,1611911088942,338000,1),(1611914721411,1611914721397,1611911088942,338000,1),(1611914859732,1611914859717,1611911088942,338000,2),(1611923830062,1611923830049,1611911088942,338000,1),(1611924070871,1611924070860,1,12999000,1),(1611924552226,1611924552204,1,12999000,3),(1611924614383,1611924614371,1611911088942,338000,1),(1611927036239,1611927036222,1611911088942,338000,1),(1611927128844,1611927128834,1611911088942,338000,1),(1611927194901,1611927194893,1611911088942,338000,1),(1611927304178,1611927304167,1611911088942,338000,1);
/*!40000 ALTER TABLE `bill_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_id` bigint NOT NULL,
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Apple'),(2,'Casio'),(3,'Oppo'),(4,'Realme');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Man '),(2,'Woman'),(3,'Couple'),(4,'Kids');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `contact_id` bigint NOT NULL,
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_web` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_message` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `contact_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1490502122133,'Quang max cute','quang.com','dangquangkdc@gmail.com','Giao diện web',' Giao diện web cũng được',NULL),(1490503630308,'test','test','dangquangkdc@gmail.com','test',' test','2017-03-26 04:47:10');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter` (
  `newsletter_id` bigint NOT NULL,
  `newsletter_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`newsletter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter`
--

LOCK TABLES `newsletter` WRITE;
/*!40000 ALTER TABLE `newsletter` DISABLE KEYS */;
INSERT INTO `newsletter` VALUES (1490505766760,'dangquangkdc@gmail.com','2017-03-26 05:22:46');
/*!40000 ALTER TABLE `newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` bigint NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` bigint DEFAULT NULL,
  `product_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_image_forward` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_image_back` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_price` decimal(10,0) DEFAULT NULL,
  `product_description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `amount` int DEFAULT NULL,
  `state` int DEFAULT '1',
  `current` int DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Apple Watch S6 44mm viền nhôm',1,'images/pro1-1.jpg','images/pro1-1.jpg','images/pro1-2.jpg',12999000,'Apple Watch S6 44mm viền nhôm dây đeo cao su là một sản phẩm có thiết kế tinh xảo trên từng chi tiết, gia công hoàn hảo và chắc chắn, ở phiên bản màu xanh navy mang đến sự mới lạ và lôi cuốn hơn cho người dùng',10,1,7),(2,1,'Oppo Watch 46mm dây silicone đen',3,'images/pro2-1.jpg','images/pro2-1.jpg','images/pro2-2.jpg',7490000,'Đồng hồ thông minh Oppo Watch dây silicon đen phiên bản 46mm sử dụng màn hình AMOLED 1.91 inch độ phân giải 402 x 476 pixels, độ sáng cao lên đến 326 ppi cho phép hiển thị rõ nội dung ngoài trời. Với thiết kế mặt đồng hồ vuông, bo cong nhẹ ở 4 góc, cùng với mặt kính cong 2D có chiều sâu tạo cảm giác như mặt kính cong 3D mang lại cảm giác cao cấp hơn cho sản phẩm. Dây đeo silicon cho cảm giác mang được dễ chịu và thoải mái',10,1,10),(3,2,'Oppo Watch 41mm dây silicone hồng',3,'images/pro3-1.jpg','images/pro3-1.jpg','images/pro3-2.jpg',5690000,'Đồng hồ thông minh Oppo Watch màu hồng phiên bản 41mm có màn hình AMOLED 1.6 inch, độ phân giải 320 x 360 pixels cùng mật độ điểm ảnh 326 ppi cho chất lượng hình ảnh cực kì sắc nét. Dây đeo silicon mang lại cảm giác vô cùng thoải mái, không bị đau khi đeo trong thời gian dài',10,1,10),(4,2,'Apple Watch S5 LTE 44mm viền thép dây thép bạc',1,'images/pro4-1.jpg','images/pro4-1.jpg','images/pro4-2.jpg',19999000,'Apple Watch S5 LTE phiên bản dây thép bạc này sở hữu thiết kế sang trọng với viền thép bền bỉ và chắc chắn, dây đeo dạng lưới đan mỏng thời thượng, ôm trọn cổ tay người đeo. Màn hình rộng 1.78 inch giúp hiển thị đầy đủ thông tin. Ngoài ra, để người dùng thoải mái trước các hoạt động thường ngày, nhà Táo đã trang bị cho mẫu đồng hồ Apple series 5 này lớp kính cường lực Saphire cứng cáp, chống trầy xước hiệu quả',10,1,10),(5,3,'Đồng hồ đôi Casio LTP-1095Q-7A',2,'images/pro5-1.jpg','images/pro5-1.jpg','images/pro5-2.jpg',1316000,'Thương hiệu đồng hồ nổi tiếng đến từ Nhật Bản không ngừng cải tiến và cho ra mắt những dòng sản phẩm chất lượng phù hợp với nhiều đối tượng khách hàng. Những dòng sản phẩm nổi tiếng của Casio là: G-Shock với thiết kế mạnh mẽ cùng độ bền cao, Edifice thiết kế hiện đại cùng nhiều tính năng vượt trội, Sheen với thiết kế cổ điển và sang trọng,…',10,1,10),(1611911088942,1,'test',3,'images/pro-1.jpg','images/','images/',338000,'đồng hồ đẹp nè',20,1,19);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` bigint NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `review_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `review_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `review_star` int DEFAULT NULL,
  `review_message` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`review_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1490201148301,1,'Quang','dangquangkdc@gmail.com',5,'The GD100RSCE is a full size acoustic electric guitar specifically engineered for the serious player. Carefully selected tone woods of mahogany and spruce create a sound that is well balanced and articulate, especially for finger pickers. It features a gloss finish and upgraded features traditionally found on guitars costing much more.'),(1490201320318,1,'Quang siêu cute','dangquangkdc@gmail.com',2,' Sản phẩm cũng được, khá đẹp ^^'),(1490442620582,2,'Quang đẹp trai','quangcute@protonmail.com',4,' Cây đàn này được rất nhiều chọn để quánh cafe :3'),(1490444655206,2,'Quang cute','dangquangkdc@gmail.com',3,' Mình test thử thôi chứ ko đánh giá đâu :)))'),(1490445109940,2,'Quang cute','dangquangkdc@gmail.com',3,' Mình test thử thôi chứ ko đánh giá đâu :)))'),(1490202226404,1,'Quang','dangquangkdc@gmail.com',1,'The GD100RSCE is a full size acoustic electric guitar specifically engineered for the serious player. '),(1490445318522,3,'Vô danh','mail@mail.com',5,' Sản phẩm cũng được :3'),(1490455827023,4,'Quang quyền quý','dangquangkdc@gmail.com',4,' Đàn bao ngon :)))'),(1490509844040,24,'Quang review','dangquangkdc@gmail.com',5,' Quá sắc sảo :3'),(1490661562334,21,'test','dangquangkdc@gmail.com',2,' cũng được');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useradmin`
--

DROP TABLE IF EXISTS `useradmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useradmin` (
  `user_ad_id` bigint NOT NULL,
  `user_ad_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_ad_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_ad_role` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_ad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useradmin`
--

LOCK TABLES `useradmin` WRITE;
/*!40000 ALTER TABLE `useradmin` DISABLE KEYS */;
INSERT INTO `useradmin` VALUES (1,'admin','123',_binary '');
/*!40000 ALTER TABLE `useradmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_role` bit(1) DEFAULT NULL,
  `user_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1608275113354,'bbbb','bb@gmail.com','123',_binary '\0','01528566'),(1608274905742,'vidiep','diepvi2810@gmail.com','1234',_binary '\0','0902099101');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mywshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-31 11:42:31
