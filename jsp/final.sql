-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: final
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `BID` int NOT NULL AUTO_INCREMENT,
  `BName` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BAdress` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`BID`),
  UNIQUE KEY `BID` (`BID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'曾拌麵','新北市221汐止區中興路183巷21號'),(2,'千拌麵','臺北市松山區南京東路4段50號12'),(3,'賈以食日','台北市松山區八德路四段760號10樓之3'),(4,'老媽拌麵','新北市汐止區新台五路一段97號25樓11(U-TOWN B棟)');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ClientID` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CPhone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CAddress` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CAccount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CPassword` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('C001','曾順莉','0900000000','桃園市中壢區中北路33號','10944133@gmail.com','10944133'),('C002','楊芷昀','0900000001','桃園市中壢區中北路35號','10944135@gmail.com','10944135'),('C003','羅渽民','0900000002','桃園市中壢區中北路2號','nctdream@gmail.com','nctdream'),('C004','金太妍','0900000003','桃園市中壢區中北路39號','taeteon0309@gmail.com','0309'),('C005','金曉珍','0900000004','桃園市中壢區中北路422號','onf0422@gmail.com','onf0422');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counter` (
  `count` int NOT NULL,
  PRIMARY KEY (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES (7);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `PID` int NOT NULL AUTO_INCREMENT,
  `ClientID` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Mcontent` text COLLATE utf8mb4_unicode_ci,
  `MDate` date DEFAULT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `PID` (`PID`),
  KEY `ClientID` (`ClientID`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'C001','GOOD!','2022-08-15'),(2,'C003','好便宜。','2022-06-30'),(3,'C004','好讚！','2022-04-05'),(4,'C002','很喜歡！','2022-06-07');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClientID` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ODate` date DEFAULT NULL,
  `OFare` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `ClientID` (`ClientID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('O001','C004','2022-08-15',39),('O002','C002','2022-08-20',60),('O003','C001','2022-09-15',39),('O004','C002','2022-10-05',60),('O005','C005','2022-11-15',39),('O006','C003','2022-11-30',60);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `OrderID` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProductID` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Total` int DEFAULT NULL,
  `BID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `BID` (`BID`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`BID`) REFERENCES `brand` (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES ('O001','P000',396,1),('O002','P004',990,2),('O003','P003',1980,3),('O004','P002',198,4),('O005','P001',594,3),('O006','P003',792,4);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `PID` int NOT NULL AUTO_INCREMENT,
  `PName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BID` int NOT NULL,
  `PPrice` int DEFAULT NULL,
  `PQuantuty` int DEFAULT NULL,
  `PFeature` text COLLATE utf8mb4_unicode_ci,
  `PImg` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `PID` (`PID`),
  KEY `BID` (`BID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`BID`) REFERENCES `brand` (`BID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'曾粉 海味叻沙 Seafood Laksa',1,198,100,'成分含蝦。\n辛辣程度：微辣。\n使用宜蘭老字號虎牌米粉，乾湯兩吃，美味升級。\n濃郁咖哩與香甜椰漿熬製，充滿異國風味，濃而不膩。','../assets/images/products/zeng_guocheng00.jpg'),(2,'曾拌麵 香蔥椒麻 Scallion Sichuan Pepper (五辛素/Vegan)',1,168,100,'五辛素。\n麵體：刀削麵。\n辛辣程度：小辣(花椒麻)。\n堅持手工日曬麵製程；健康純粹，感動美味。\n特選紅蔥與低溫提煉椒麻油，香氣與麻辣口感兼具。','../assets/images/products/zeng_guocheng01.jpg'),(3,'曾拌麵 胡蔴醬香(香辣醬版) Spicy White Sesame',1,198,100,'麵體：細扁麵。\n辛辣程度：小辣。\n香辣醬內含海鮮成分\n堅持手工日曬麵製程；健康純粹，感動美味。\n嚴選純正白芝麻粒，低溫研磨，完整保留白芝麻的香氣及營養。\n獨家秘製香辣醬，嚴選多種純天然辛香料，為香辣醬增添一股溫醇而有質感的麻與香。','../assets/images/products/zeng_guocheng02.jpg'),(4,'曾拌麵 柚香冷麵 Yuzu Cold Noodles (奶素/Vegetarian)',1,198,100,'奶素可食。\n麵體：芯型麵。\n辛辣程度：不辣。\n堅持手工日曬麵製程；健康純粹，感動美味。\n每一口都品嚐得到柚香醬汁的清爽甘甜','../assets/images/products/zeng_guocheng03.jpg'),(5,'曾拌麵 咖哩叻沙 Curry Laksa',1,198,100,'麵體：細扁麵。\n辛辣程度：中辣。\n日曬細扁麵拌進含有新鮮椰漿的咖哩叻沙中，細緻濃郁的口感融合在舌尖，溫潤帶甜、濃而不膩，每一口都吃得到屬於南洋咖哩的風味。','../assets/images/products/zeng_guocheng04.jpg'),(6,'千拌麵∣醋香麻醬 (3包/袋)',2,189,100,'傳統石磨機研磨/黃金比例台九花生、白芝麻/天然醬料','../assets/images/products/qianqian00.jpeg'),(7,'千拌麵∣香辣擔擔麵 (3包/袋)',2,189,100,'蒜香辣籽油/香醇厚麻醬/80年功夫麵 植物五辛素','../assets/images/products/qianqian01.jpeg'),(8,'千拌麵∣黑麻油麵線 (3包/袋)',2,168,100,'●美味熱銷補貨到-黑麻油麵線\n●美食水水-千千強力推薦好味道\n●懷舊復古台灣傳統好滋味\n●100%古法培製黑麻油\n●小農契作天然老薑\n●Q彈滑順有勁麵線','../assets/images/products/qianqian02.jpeg'),(9,'千拌麵∣辣豆瓣金盞花麵 (3包/袋)',2,168,100,'純手工釀造辣豆瓣/嚴選宜蘭三星蔥/彈潤嚼勁金盞花麵/植物五辛素\n●強勢新口味登場-辣豆瓣金盞花麵\n●美食水水-千千強力推薦好味道\n●懷舊台灣傳統好滋味\n●精選非基改黃豆，手工釀辣豆瓣醬\n●宜蘭三星蔥炒醬\n●豐富層次、香氣濃郁，十分到胃\n●天然梔子花上色黃麵 \n●植物五辛素','../assets/images/products/qianqian03.jpeg'),(10,'千拌麵∣香芋米粉 (3包/袋)',2,168,100,'綿密芋頭 / 脆甜蔬菜 / 香酥不油膩紅蔥頭/葷食','../assets/images/products/qianqian04.jpeg'),(11,'賈以食日-泰式酸辣粉（1盒/3入）',3,229,100,'精選泰式辛香料調配而成酸辣醬\n加水即可呈現泰國TOM YUM湯頭\n純綠豆製成彈牙細寬粉吸附整個湯汁\n搭配新鮮乾燥高麗菜增添豐富口感\n撒上泰式辣椒粉提升整體香辣層次\n在家也能嚐到道地異國風味\n不論何時都能輕易地享用泰式酸辣粉','../assets/images/products/chia00.jpg'),(12,'賈以食日-雞白湯拉麵（1盒/3份入）',3,399,100,'＊日本研發技術合作、原裝進口，傳承道地濃厚雞白湯頭\n＊獨家秘製金黃色澤雞油與特調辣椒粉，提升整體色香味\n＊堅持九道反覆延壓工序製作日式細拉麵，Q彈帶勁口感','../assets/images/products/chia01.jpg'),(13,'賈以食日-雙椒麵（1袋/4入）',3,268,100,'大紅袍香與青花椒麻\n雙重熬製的獨特醬料\n嚴選波浪中板刀削麵\n香、麻、辣一次到位','../assets/images/products/chia02.jpg'),(14,'賈以食日-麻花麵（1袋/4入）',3,268,100,'*香醇研磨白芝麻醬\n*採用大紅袍花椒油\n*嚴選日曬手摺細麵','../assets/images/products/chia03.jpg'),(15,'賈以食日-麻薑麵（1袋/4入）',3,268,100,'黑麻油與在地老薑低溫熬煮\n38度香醇料理高粱酒\n嚴選古法手摺細麵線','../assets/images/products/chia04.jpg'),(16,'賈以食日-拌麵禮盒（1盒/9入）',3,599,100,'用心創作一碗麵\n麻花麵・雙椒麵・麻薑麵\n拌出家常的幸福滋味\n獻上最真摯的麵麵俱到心意','../assets/images/products/chia05.jpg'),(17,'老媽拌麵-紅油擔擔（1袋/3入）',4,158,100,'❙ 老媽擔擔麵 素食口味乾拌麵\n❙ 花椒辣油與麻醬完美搭配，層層調味驚喜你的味蕾\n❙ 完美襯托麻醬的Q彈細麵，吃出古法日曬關廟麵特有的麵粉香氣','../assets/images/products/laoma00.jpg'),(18,'老媽拌麵-蒜香麻油（1袋/3入）',4,158,100,'❙ 老媽拌麵 x 全聯限定口味\n❙ 濃厚黑麻油香氣結合淡淡的蒜香味\n❙ 搭配滑順的麵線，在這冬天裡帶給你幸福與療癒','../assets/images/products/laoma01.jpg'),(19,'老媽拌麵-香菇炸醬（1袋/4入）',4,185,100,'❙ 選用台灣特產山珍香菇，五辛素可食乾拌麵\n❙ 古法手工日曬關廟麵，寬版波浪狀完美沾附醬汁','../assets/images/products/laoma02.jpg'),(20,'老媽拌麵-川味紅燒牛肉拉麵（3入）',4,799,100,'❙ 川味紅燒牛肉拉麵一次滿足 不用上餐廳也能享受\n❙ 嚴選澳洲穀飼牛腱心，油花分佈均勻口感軟嫩\n❙ 牛肉增量50%，就是要你吃的豪邁\n❙ 加入私房拌炒牛油 香辣口味層次再升級','../assets/images/products/laoma03.jpg'),(21,'老媽拌麵-干貝花雕雞拉麵（3入）',4,538,100,'❙ 美國泡麵達人里納許2022評選冠軍\n❙ 嚴選白露花老母雞熬製，不添加化學香精\n❙ 特選金華火腿搭配干貝，集合濃、醇、鮮、鹹香\n❙ 加上精釀花雕酒增添風味\n❙ 傳承古法，手工日曬手折關廟麵條','../assets/images/products/laoma04.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-05 22:27:16
