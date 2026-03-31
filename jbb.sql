-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jbb_db
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `bno` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 NOT NULL,
  `content` varchar(500) CHARACTER SET utf8mb3 NOT NULL,
  `img1` blob,
  `img2` blob,
  `img3` blob,
  `view_cnt` int DEFAULT '0',
  `comment_cnt` int DEFAULT '0',
  `reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `writer` varchar(45) CHARACTER SET utf8mb3 NOT NULL,
  `up_date` datetime DEFAULT NULL,
  `b_bc_code` int NOT NULL DEFAULT '1000',
  PRIMARY KEY (`bno`),
  KEY `fe_board_cate_idx` (`b_bc_code`),
  CONSTRAINT `fe_board_cate` FOREIGN KEY (`b_bc_code`) REFERENCES `category` (`bc_code`)
) ENGINE=InnoDB AUTO_INCREMENT=830 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (811,'초콜릿 쿠키 레시피 공유합니다~','안녕하세요!\r\n오늘은 초콜릿 쿠키 만들어봤어용\r\n레시피 너무 맛있어서 공유합니다~				\r\n							\r\n							\r\n							\r\n			',_binary '7906f178-b56e-4372-895e-c6a181d97883.jpg','','',16,3,'2025-07-12 16:07:08','asdf',NULL,1001),(812,'맛있는 치즈 식빵','오늘 만든 치즈 식빵 레시피 너무 맛있어서 공유합니다!				\r\n							\r\n							\r\n							\r\n							\r\n							\r\n			',_binary '10f79b60-cec5-4380-b8ec-5607d48cff2f.jpg',_binary '39412b60-27fb-4446-bbbb-ed7928a0f77a.jpg',_binary '1cffb018-b75a-44a6-b534-aff5fd3d46c7.jpg',32,3,'2025-07-22 18:26:37','asdf',NULL,1002),(813,'휘핑기 공구하실분!','휘핑기 같이 구매하실 분 계실까요?\r\n같은 구매하면 조금 더 저렴한 가격에 구매가능해서 올려봅니다~',_binary '2a12222d-c252-408f-8caa-62834bbd4f96.png',NULL,NULL,7,1,'2025-04-08 11:07:17','aaa',NULL,2001),(814,'생크림 공구!','생크림 같이 구매하실 분~~\r\n한박스 사면 너무 많아서 같이 나눠 구매해용',_binary '5f85d6d8-577b-4626-84e2-aef2e48f51ea.jpg',_binary '5fda2e9d-e8d6-4b72-93c1-ae36391c44c4.jpg',NULL,7,0,'2025-04-08 11:08:33','aaa',NULL,2002),(815,'대파크림 스콘~~','대파크림 스콘 처음으로 만들어봤는데,\r\n너무 맛있게 나와서 신나용!!ㅎㅎ',_binary '72fb4dcf-e130-4599-aeb4-3c9c70a65fd3.jpg',NULL,NULL,9,1,'2025-04-08 11:09:37','aaa',NULL,3001),(816,'오늘 날씨 너무 좋아요~~','오늘 날씨 너무 좋지 않나요~~? ㅎㅎ',_binary '131ea594-dc90-4e08-ba8d-32abc07bc0f5.jpg',_binary '801d1a72-74de-4ac3-9655-321fc0d3d28d.jpg',NULL,13,1,'2025-04-08 15:35:55','asdf1',NULL,3002),(826,'블루베리 쿠키 레시피!!!','블루베리 쿠키 레시피입니다!!				\r\n			',_binary 'fc335864-7dec-4308-9e78-7128032cd263.jpg','','',10,2,'2025-07-11 17:52:44','asdf',NULL,1001),(827,'초콜릿 쿠키 레시피','초콜릿 쿠키 레시피입니다~!',_binary 'cefec5e2-2d5b-48e2-8ff9-648e940829cf.png',_binary 'ef0ea7db-eac8-449a-9ba3-113667220b5b.gif','',21,2,'2025-07-12 17:30:56','admin',NULL,1001),(829,'블루베리 크림치즈 식빵','레시피 공개합니다!',_binary 'bdf0e38c-2746-46ad-b960-120a3d13b18d.jpg',NULL,NULL,2,0,'2026-03-02 23:55:48','test',NULL,1001);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_draft`
--

DROP TABLE IF EXISTS `board_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_draft` (
  `draft_id` int NOT NULL AUTO_INCREMENT,
  `writer` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `img1` blob,
  `img2` blob,
  `img3` blob,
  `b_bc_code` int DEFAULT NULL,
  `kip_cnt` int DEFAULT '0',
  `up_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`draft_id`),
  KEY `fk_bc_code_idx` (`b_bc_code`),
  CONSTRAINT `fk_bc_code` FOREIGN KEY (`b_bc_code`) REFERENCES `category` (`bc_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_draft`
--

LOCK TABLES `board_draft` WRITE;
/*!40000 ALTER TABLE `board_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `board_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `bc_code` int NOT NULL,
  `bc_name` varchar(255) NOT NULL,
  `bc_code_ref_mn` int DEFAULT NULL,
  PRIMARY KEY (`bc_code`),
  KEY `fe_cate_idx` (`bc_code_ref_mn`),
  CONSTRAINT `fe_cate` FOREIGN KEY (`bc_code_ref_mn`) REFERENCES `category` (`bc_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1000,'레시피',NULL),(1001,'제과',1000),(1002,'제빵',1000),(2000,'같이사요',NULL),(2001,'도구',2000),(2002,'재료',2000),(3000,'토크토크',NULL),(3001,'내빵자랑',3000),(3002,'수다톡톡',3000);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `cno` int NOT NULL AUTO_INCREMENT,
  `bno` int NOT NULL,
  `pcno` int DEFAULT '0',
  `comment` varchar(3000) COLLATE utf8mb3_bin DEFAULT NULL,
  `commenter` varchar(30) COLLATE utf8mb3_bin DEFAULT NULL,
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `up_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cno`),
  KEY `bno_idx` (`bno`),
  CONSTRAINT `fe_bno` FOREIGN KEY (`bno`) REFERENCES `board` (`bno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (86,811,NULL,'헉 너무 맛있을 것 같은 레시피예요! 저도 도전해봐야겠어용ㅎㅎ','aaa','2025-04-08 11:07:40','2025-04-08 11:07:40'),(87,811,NULL,'와! 좋은 레시피 감사해요','asdf1','2025-04-08 15:34:32','2025-04-08 15:34:32'),(88,812,NULL,'치즈식빵 너무 맛있을 것 같아요~','asdf1','2025-04-08 15:34:53','2025-04-08 15:34:53'),(89,813,NULL,'저 필요한데 같이 구매해요~~','asdf1','2025-04-08 15:36:20','2025-04-08 15:36:20'),(90,811,NULL,'맛있겠당ㅜㅜ!!','asdf2','2025-04-08 15:38:12','2025-04-08 15:38:12'),(91,816,NULL,'네~ 날씨가 너무 좋네용ㅎㅎ','asdf','2025-04-10 23:16:39','2025-04-10 23:16:39'),(92,815,NULL,'헉 너무 맛있을것같아요!','asdf','2025-04-10 23:16:57','2025-04-10 23:16:57'),(115,826,NULL,'우와! 너무 맛있을거 같은 레시피예요!ㅎㅎ','admin','2025-05-05 18:35:12','2025-05-05 18:35:12'),(116,827,NULL,'오! 맛있겠어용','asdf','2025-05-05 18:37:09','2025-05-05 18:37:09'),(117,826,NULL,'오오','admin','2025-05-05 18:37:36','2025-05-05 18:37:36'),(120,812,NULL,'오! 맛있을것같아용','admin','2025-05-05 23:44:08','2025-05-05 23:44:08'),(121,812,NULL,'dhdh','asdf','2025-07-22 17:24:38','2025-07-22 17:24:38'),(122,827,NULL,'ㅎㅎ','test','2026-03-03 00:06:29','2026-03-03 00:06:29');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `fno` int NOT NULL AUTO_INCREMENT,
  `f_question` varchar(300) NOT NULL,
  `f_answer` varchar(500) NOT NULL,
  `f_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fno`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (12,'회원가입이 안돼요ㅠㅠ','JBB 홈페이지 상단메뉴에서 회원가입을 선택하시고, \r\n정보 입력 후 가입하시면 됩니다!','2025-03-25 17:31:40'),(13,'JBB는 뭐하는 사이트인가요?','JBB에 방문해주셔서 감사합니다.\r\nJBB는 제과제빵을 좋아하는 사람들이 모여 만든 커뮤니티예요 ~','2025-03-25 18:31:40'),(14,'1:1 문의 게시판이 안보여요ㅠㅠ','1:1 문의 게시판은 로그인 후 확인가능합니다.','2025-03-25 18:34:59'),(15,'공동구매는 어떻게 하는건가요??','공동구매를 원하는 도구, 재료를 공동구매 관련 게시판에 올려주시면 됩니다!','2026-03-04 15:03:54');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `board_bno` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bno_idx` (`board_bno`),
  KEY `fk_userid_idx` (`user_id`),
  CONSTRAINT `fk_bno` FOREIGN KEY (`board_bno`) REFERENCES `board` (`bno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (98,'asdf',811),(100,'aaa',811),(101,'aaa',814),(102,'asdf1',811),(103,'asdf1',812),(104,'asdf1',816),(105,'asdf1',813),(106,'asdf1',815),(107,'asdf1',814),(108,'asdf2',811),(109,'asdf',816),(110,'asdf',815),(116,'admin',826),(118,'asdf',827),(119,'admin',812),(120,'asdf',826),(121,'asdf',812),(122,'admin',827),(123,'test',827);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipient` varchar(50) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'admin','COMMENT','asdf님이 댓글을 남겼습니다.','/board/read?bno=825','2025-05-02 14:53:24',1),(2,'admin','LIKE','asdf님이 좋아요를 눌렀습니다.','/board/read?bno=825','2025-05-02 14:59:57',1),(3,'admin','LIKE','asdf님이 좋아요를 눌렀습니다.','/board/read?bno=825','2025-05-02 15:00:12',1),(4,'admin','COMMENT','asdf님이 댓글을 남겼습니다.','/board/read?bno=825','2025-05-02 15:16:52',1),(5,'admin','COMMENT','asdf님이 댓글을 남겼습니다.','/board/read?bno=825','2025-05-02 15:16:56',1),(6,'admin','COMMENT','asdf님이 댓글을 남겼습니다.','/board/read?bno=825','2025-05-02 15:25:55',1),(7,'asdf','COMMENT','admin님이 댓글을 남겼습니다.','/board/read?bno=826','2025-05-04 07:46:35',1),(8,'asdf','LIKE','admin님이 좋아요를 눌렀습니다.','/board/read?bno=826','2025-05-04 07:48:57',1),(9,'asdf','COMMENT','admin님이 댓글을 남겼습니다.','/board/read?bno=826','2025-05-04 07:51:55',1),(10,'asdf','LIKE','admin님이 좋아요를 눌렀습니다.','/board/read?bno=826','2025-05-04 07:52:01',1),(11,'asdf','COMMENT','admin님이 댓글을 남겼습니다.','/board/read?bno=826','2025-05-05 09:35:12',1),(12,'admin','LIKE','asdf님이 좋아요를 눌렀습니다.','/board/read?bno=827','2025-05-05 09:36:42',1),(13,'admin','COMMENT','asdf님이 댓글을 남겼습니다.','/board/read?bno=827','2025-05-05 09:37:09',1),(14,'asdf','COMMENT','admin님이 댓글을 남겼습니다.','/board/read?bno=826','2025-05-05 09:37:36',1),(15,'admin','LIKE','asdf님이 좋아요를 눌렀습니다.','/board/read?bno=827','2025-05-05 09:39:57',1),(16,'asdf','LIKE','admin님이 좋아요를 눌렀습니다.','/board/read?bno=812','2025-05-05 14:08:28',1),(17,'asdf','COMMENT','admin님이 댓글을 남겼습니다.','/board/read?bno=812','2025-05-05 14:09:43',1),(18,'asdf','COMMENT','admin님이 댓글을 남겼습니다.','/board/read?bno=812','2025-05-05 14:42:18',1),(19,'asdf','COMMENT','admin님이 댓글을 남겼습니다.','/board/read?bno=812','2025-05-05 14:44:08',1),(20,'asdf','LIKE','asdf님이 좋아요를 눌렀습니다.','/board/read?bno=826','2025-07-11 06:29:03',1),(21,'asdf','LIKE','asdf님이 좋아요를 눌렀습니다.','/board/read?bno=812','2025-07-12 06:23:45',1),(22,'admin','LIKE','admin님이 좋아요를 눌렀습니다.','/board/read?bno=827','2025-07-12 08:31:10',1),(23,'asdf','COMMENT','asdf님이 댓글을 남겼습니다.','/board/read?bno=812','2025-07-22 08:24:38',1),(24,'admin','COMMENT','test님이 댓글을 남겼습니다.','/board/read?bno=827','2026-03-02 15:06:29',1),(25,'admin','LIKE','test님이 좋아요를 눌렀습니다.','/board/read?bno=827','2026-03-03 15:10:16',1);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify`
--

DROP TABLE IF EXISTS `notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notify` (
  `nno` int NOT NULL AUTO_INCREMENT,
  `ntitle` varchar(100) NOT NULL,
  `ncontent` varchar(300) NOT NULL,
  `n_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nno`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify`
--

LOCK TABLES `notify` WRITE;
/*!40000 ALTER TABLE `notify` DISABLE KEYS */;
INSERT INTO `notify` VALUES (19,'4/8 공지사항','4월 8일 공지사항입니다~','2025-04-08 15:40:39'),(20,'공동구매 관련 공지사항','안녕하세요.\r\nJBB 관리자가 진행하는 공동구매 관련 공지사항 입니다!\r\n날짜에 맞춰 1:1 문의 남겨주시면 공동구매 관련 안내 드려요~~\r\n\r\n4/10 : 버터 공동구매\r\n4/15 : 오븐 공동구매\r\n4/20 : 마카롱 밀키트 공동구매`','2026-03-04 14:49:24');
/*!40000 ALTER TABLE `notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `qno` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `writer` varchar(50) NOT NULL,
  `q_content` varchar(300) DEFAULT NULL,
  `a_content` varchar(300) DEFAULT NULL,
  `qna_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_answered` tinyint DEFAULT NULL,
  PRIMARY KEY (`qno`),
  KEY `fk_qno_idx` (`parent_id`),
  CONSTRAINT `fk_qno` FOREIGN KEY (`parent_id`) REFERENCES `qna` (`qno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (48,NULL,'asdf1','안녕하세요~ 문의드립니다!\r\n',NULL,'2025-04-08 15:37:12',1),(49,NULL,'asdf2','문의남깁니다!',NULL,'2025-04-08 15:38:29',0),(53,NULL,'test','문의테스트합니다!',NULL,'2026-03-04 11:18:38',0),(55,48,'관리자',NULL,'답변드려요~','2026-03-04 14:49:03',1);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pwd` varchar(50) CHARACTER SET utf8mb3 NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb3 NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb3 NOT NULL,
  `tel` varchar(50) CHARACTER SET utf8mb3 NOT NULL,
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `login_count` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('aaa','1234','테스트','aaa@naver.com','010-1111-1111','2025-04-02 10:34:59',1),('admin','1234','관리자','admin@naver.com','010-2580-2580','2025-03-20 23:55:07',57),('asdf','1234','asdf','abc@naver.com','010-1234-1234','2024-12-28 15:06:58',99),('asdf1','1234','재재','asdf1@naver.com','010-1111-1111','2025-01-24 11:17:17',3),('asdf2','1234','aaa','asdf@naver.com','010-1234-1234','2025-01-14 17:22:11',1),('bbb','1234','테스트2','bbb@naver.com','010-9999-9999','2025-04-02 10:46:33',0),('koung','1234','경이','koung@naver.com','010-7777-7777','2025-04-08 00:36:05',0),('test','1234','테스트','test@naver.com','010-2580-1234','2026-03-02 23:53:55',6),('young','1234','영이','young@naver.com','010-4909-1111','2025-01-24 11:18:54',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-06 11:35:12
