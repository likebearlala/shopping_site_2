DROP DATABASE IF EXISTS `final`;
CREATE DATABASE `final` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `final`;

CREATE TABLE `Client` (
  `CName` VARCHAR(20) NOT NULL,
  `CPhone` VARCHAR(10) NOT NULL,
  `CAddress` VARCHAR(30) NOT NULL,
  `CAccount` VARCHAR(30) NOT NULL UNIQUE,
  `CPassword` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`CAccount`)
);
INSERT INTO `Client` VALUES ('曾順莉','0900000000','桃園市中壢區中北路33號','10944133@gmail.com','10944133');
INSERT INTO `Client` VALUES ('楊芷昀','0900000001','桃園市中壢區中北路35號','10944135@gmail.com','10944135');
INSERT INTO `Client` VALUES ('羅渽民','0900000002','桃園市中壢區中北路2號','nctdream@gmail.com','nctdream');
INSERT INTO `Client` VALUES ('金太妍','0900000003','桃園市中壢區中北路39號','taeteon0309@gmail.com','0309');
INSERT INTO `Client` VALUES ('金曉珍','0900000004','桃園市中壢區中北路422號','onf0422@gmail.com','onf0422');

CREATE TABLE `Order` (
  `OrderID` INT NOT NULL UNIQUE AUTO_INCREMENT,
  `CAccount` VARCHAR(30) NOT NULL,
  `ODate` DATE,
  `PName` text NOT NULL,
  `OTotal` INT,
  `OSendway` VARCHAR(10),
  `OPayway` VARCHAR(10),
  PRIMARY KEY (`OrderID`)
);

CREATE TABLE `product` (
	`PID` INT NOT NULL UNIQUE AUTO_INCREMENT,
    `PName` VARCHAR(45) NOT NULL,
    `PBrand` VARCHAR(10) NOT NULL,
    `PPrice` INT,
    `PQuantity` INT,
    `PSales` INT,
    `PFeature` TEXT,
    `PImg` VARCHAR(45),
    PRIMARY KEY (`pID`)
);
INSERT INTO `Product` VALUE (1, '曾粉 海味叻沙 Seafood Laksa', '曾拌麵', '198','100', '0', '成分含蝦。\n辛辣程度：微辣。\n使用宜蘭老字號虎牌米粉，乾湯兩吃，美味升級。\n濃郁咖哩與香甜椰漿熬製，充滿異國風味，濃而不膩。', '../assets/images/products/zeng_guocheng00.jpg');
INSERT INTO `Product` VALUE (2, '曾拌麵 香蔥椒麻 Scallion Sichuan Pepper (五辛素/Vegan)', '曾拌麵', '168','100', '0', '五辛素。\n麵體：刀削麵。\n辛辣程度：小辣(花椒麻)。\n堅持手工日曬麵製程；健康純粹，感動美味。\n特選紅蔥與低溫提煉椒麻油，香氣與麻辣口感兼具。', '../assets/images/products/zeng_guocheng01.jpg');
INSERT INTO `Product` VALUE (3, '曾拌麵 胡蔴醬香(香辣醬版) Spicy White Sesame', '曾拌麵', '198','100', '0', '麵體：細扁麵。\n辛辣程度：小辣。\n香辣醬內含海鮮成分\n堅持手工日曬麵製程；健康純粹，感動美味。\n嚴選純正白芝麻粒，低溫研磨，完整保留白芝麻的香氣及營養。\n獨家秘製香辣醬，嚴選多種純天然辛香料，為香辣醬增添一股溫醇而有質感的麻與香。', '../assets/images/products/zeng_guocheng02.jpg');
INSERT INTO `Product` VALUE (4, '曾拌麵 柚香冷麵 Yuzu Cold Noodles (奶素/Vegetarian)', '曾拌麵', '198','100', '0', '奶素可食。\n麵體：芯型麵。\n辛辣程度：不辣。\n堅持手工日曬麵製程；健康純粹，感動美味。\n每一口都品嚐得到柚香醬汁的清爽甘甜', '../assets/images/products/zeng_guocheng03.jpg');
INSERT INTO `Product` VALUE (5, '曾拌麵 咖哩叻沙 Curry Laksa', '曾拌麵', '198','100', '0', '麵體：細扁麵。\n辛辣程度：中辣。\n日曬細扁麵拌進含有新鮮椰漿的咖哩叻沙中，細緻濃郁的口感融合在舌尖，溫潤帶甜、濃而不膩，每一口都吃得到屬於南洋咖哩的風味。', '../assets/images/products/zeng_guocheng04.jpg');
INSERT INTO `Product` VALUE (6, '千拌麵∣醋香麻醬 (3包/袋)', '千拌麵', '189','100', '0', '傳統石磨機研磨/黃金比例台九花生、白芝麻/天然醬料', '../assets/images/products/qianqian00.jpeg');
INSERT INTO `Product` VALUE (7, '千拌麵∣香辣擔擔麵 (3包/袋)', '千拌麵', '189','100', '0','蒜香辣籽油/香醇厚麻醬/80年功夫麵 植物五辛素', '../assets/images/products/qianqian01.jpeg');
INSERT INTO `Product` VALUE (8, '千拌麵∣黑麻油麵線 (3包/袋)', '千拌麵', '168','100', '0','●美味熱銷補貨到-黑麻油麵線\n●美食水水-千千強力推薦好味道\n●懷舊復古台灣傳統好滋味\n●100%古法培製黑麻油\n●小農契作天然老薑\n●Q彈滑順有勁麵線', '../assets/images/products/qianqian02.jpeg');
INSERT INTO `Product` VALUE (9, '千拌麵∣辣豆瓣金盞花麵 (3包/袋)', '千拌麵', '168','100', '0','純手工釀造辣豆瓣/嚴選宜蘭三星蔥/彈潤嚼勁金盞花麵/植物五辛素\n●強勢新口味登場-辣豆瓣金盞花麵\n●美食水水-千千強力推薦好味道\n●懷舊台灣傳統好滋味\n●精選非基改黃豆，手工釀辣豆瓣醬\n●宜蘭三星蔥炒醬\n●豐富層次、香氣濃郁，十分到胃\n●天然梔子花上色黃麵 \n●植物五辛素', '../assets/images/products/qianqian03.jpeg');
INSERT INTO `Product` VALUE (10, '千拌麵∣香芋米粉 (3包/袋)', '千拌麵', '168','100', '0','綿密芋頭 / 脆甜蔬菜 / 香酥不油膩紅蔥頭/葷食', '../assets/images/products/qianqian04.jpeg');
INSERT INTO `Product` VALUE (11, '賈以食日-泰式酸辣粉（1盒/3入）', '賈以食日', '229','100', '0', '精選泰式辛香料調配而成酸辣醬\n加水即可呈現泰國TOM YUM湯頭\n純綠豆製成彈牙細寬粉吸附整個湯汁\n搭配新鮮乾燥高麗菜增添豐富口感\n撒上泰式辣椒粉提升整體香辣層次\n在家也能嚐到道地異國風味\n不論何時都能輕易地享用泰式酸辣粉', '../assets/images/products/chia00.jpg');
INSERT INTO `Product` VALUE (12, '賈以食日-雞白湯拉麵（1盒/3份入）', '賈以食日', '399','100', '0', '＊日本研發技術合作、原裝進口，傳承道地濃厚雞白湯頭\n＊獨家秘製金黃色澤雞油與特調辣椒粉，提升整體色香味\n＊堅持九道反覆延壓工序製作日式細拉麵，Q彈帶勁口感', '../assets/images/products/chia01.jpg');
INSERT INTO `Product` VALUE (13, '賈以食日-雙椒麵（1袋/4入）', '賈以食日' , '268','100', '0', '大紅袍香與青花椒麻\n雙重熬製的獨特醬料\n嚴選波浪中板刀削麵\n香、麻、辣一次到位', '../assets/images/products/chia02.jpg');
INSERT INTO `Product` VALUE (14, '賈以食日-麻花麵（1袋/4入）', '賈以食日' , '268','100', '0', '*香醇研磨白芝麻醬\n*採用大紅袍花椒油\n*嚴選日曬手摺細麵', '../assets/images/products/chia03.jpg');
INSERT INTO `Product` VALUE (15, '賈以食日-麻薑麵（1袋/4入）', '賈以食日' , '268','100', '0', '黑麻油與在地老薑低溫熬煮\n38度香醇料理高粱酒\n嚴選古法手摺細麵線', '../assets/images/products/chia04.jpg');
INSERT INTO `Product` VALUE (16, '賈以食日-拌麵禮盒（1盒/9入）', '賈以食日', '599','100', '0', '用心創作一碗麵\n麻花麵・雙椒麵・麻薑麵\n拌出家常的幸福滋味\n獻上最真摯的麵麵俱到心意', '../assets/images/products/chia05.jpg');
INSERT INTO `Product` VALUE (17, '老媽拌麵-紅油擔擔（1袋/3入）', '老媽拌麵', '158','100', '0', '❙ 老媽擔擔麵 素食口味乾拌麵\n❙ 花椒辣油與麻醬完美搭配，層層調味驚喜你的味蕾\n❙ 完美襯托麻醬的Q彈細麵，吃出古法日曬關廟麵特有的麵粉香氣', '../assets/images/products/laoma00.jpg');
INSERT INTO `Product` VALUE (18, '老媽拌麵-蒜香麻油（1袋/3入）', '老媽拌麵', '158','100', '0', '❙ 老媽拌麵 x 全聯限定口味\n❙ 濃厚黑麻油香氣結合淡淡的蒜香味\n❙ 搭配滑順的麵線，在這冬天裡帶給你幸福與療癒', '../assets/images/products/laoma01.jpg');
INSERT INTO `Product` VALUE (19, '老媽拌麵-香菇炸醬（1袋/4入）', '老媽拌麵', '185','100', '0', '❙ 選用台灣特產山珍香菇，五辛素可食乾拌麵\n❙ 古法手工日曬關廟麵，寬版波浪狀完美沾附醬汁', '../assets/images/products/laoma02.jpg');
INSERT INTO `Product` VALUE (20, '老媽拌麵-川味紅燒牛肉拉麵（3入）', '老媽拌麵', '799','100', '0', '❙ 川味紅燒牛肉拉麵一次滿足 不用上餐廳也能享受\n❙ 嚴選澳洲穀飼牛腱心，油花分佈均勻口感軟嫩\n❙ 牛肉增量50%，就是要你吃的豪邁\n❙ 加入私房拌炒牛油 香辣口味層次再升級', '../assets/images/products/laoma03.jpg');
INSERT INTO `Product` VALUE (21, '老媽拌麵-干貝花雕雞拉麵（3入）', '老媽拌麵', '538','100', '0', '❙ 美國泡麵達人里納許2022評選冠軍\n❙ 嚴選白露花老母雞熬製，不添加化學香精\n❙ 特選金華火腿搭配干貝，集合濃、醇、鮮、鹹香\n❙ 加上精釀花雕酒增添風味\n❙ 傳承古法，手工日曬手折關廟麵條', '../assets/images/products/laoma04.jpg');

CREATE TABLE `noodlemembers` (
  `username` varchar(45) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_email`)
) ;
INSERT INTO `noodlemembers` VALUE ('admin', '1@admin', 'admin');

CREATE TABLE `counter` (
  `count` INT NOT NULL,
  PRIMARY KEY (`count`)
);
INSERT INTO `countER` VALUE (0);

CREATE TABLE `cart` (
	`CartID` INT NOT NULL UNIQUE AUTO_INCREMENT,
    `CAccount` VARCHAR(30) NOT NULL,
    `PID` INT NOT NULL,
    `PName` VARCHAR(45) NOT NULL,
    `PPrice` INT,
    `CartQ` INT,
    `CPrice` INT,
    PRIMARY KEY (`CartID`)
);

CREATE TABLE `Comment` (
  `Conum` INT NOT NULL UNIQUE AUTO_INCREMENT,
  `PID` INT NOT NULL,
  `Star` INT,
  `CoAccount` VARCHAR(30) NOT NULL,
  `CoName` VARCHAR(20) NOT NULL,
  `Cocontent` TEXT,
  `CoDate` DATE,
  PRIMARY KEY (`Conum`)
);