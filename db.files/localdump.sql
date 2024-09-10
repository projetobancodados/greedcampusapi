-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: greedcampus
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `All_Hunter_Answer`
--

DROP TABLE IF EXISTS `All_Hunter_Answer`;
/*!50001 DROP VIEW IF EXISTS `All_Hunter_Answer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `All_Hunter_Answer` AS SELECT
 1 AS `Hunter_Id`,
  1 AS `Username`,
  1 AS `Statement`,
  1 AS `Answer`,
  1 AS `Answer_Id`,
  1 AS `Card_Id`,
  1 AS `Description`,
  1 AS `Card_Challenge_Id`,
  1 AS `Book_Id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `All_Hunter_Info`
--

DROP TABLE IF EXISTS `All_Hunter_Info`;
/*!50001 DROP VIEW IF EXISTS `All_Hunter_Info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `All_Hunter_Info` AS SELECT
 1 AS `Hunter_Id`,
  1 AS `Type_Hunter_Id`,
  1 AS `Location_Id`,
  1 AS `Type_Question`,
  1 AS `Jenny_Qtd`,
  1 AS `Cards_Qtd`,
  1 AS `Book_Id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Answers`
--

DROP TABLE IF EXISTS `Answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Answers` (
  `Content` text DEFAULT NULL,
  `Answer_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Hunter_Id` int(11) NOT NULL,
  `Question_Id` int(11) NOT NULL,
  PRIMARY KEY (`Answer_Id`),
  KEY `Hunter_Id` (`Hunter_Id`),
  KEY `Question_Id` (`Question_Id`),
  CONSTRAINT `Answers_ibfk_1` FOREIGN KEY (`Hunter_Id`) REFERENCES `Hunters` (`Hunter_Id`) ON DELETE CASCADE,
  CONSTRAINT `Answers_ibfk_2` FOREIGN KEY (`Question_Id`) REFERENCES `Questions` (`Question_Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Answers`
--

LOCK TABLES `Answers` WRITE;
/*!40000 ALTER TABLE `Answers` DISABLE KEYS */;
INSERT INTO `Answers` VALUES
('Eren Jaeger',6,1,8),
('Makarov',12,3,28),
('Kirigaya Kazuto',13,3,38),
('Inuyasha é o cachorro',14,3,25),
('Em várias',15,3,18),
('Dragon Slayer do Fogo',16,3,33);
/*!40000 ALTER TABLE `Answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books` (
  `Book_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Hunter_Id` int(11) NOT NULL,
  PRIMARY KEY (`Book_Id`),
  KEY `Hunter_Id` (`Hunter_Id`),
  CONSTRAINT `Books_ibfk_1` FOREIGN KEY (`Hunter_Id`) REFERENCES `Hunters` (`Hunter_Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `Books` VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books_Cards`
--

DROP TABLE IF EXISTS `Books_Cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books_Cards` (
  `Card_Id` int(11) NOT NULL,
  `Book_Id` int(11) NOT NULL,
  PRIMARY KEY (`Card_Id`,`Book_Id`),
  KEY `Book_Id` (`Book_Id`),
  CONSTRAINT `Books_Cards_ibfk_1` FOREIGN KEY (`Card_Id`) REFERENCES `Cards` (`Card_Id`),
  CONSTRAINT `Books_Cards_ibfk_2` FOREIGN KEY (`Book_Id`) REFERENCES `Books` (`Book_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books_Cards`
--

LOCK TABLES `Books_Cards` WRITE;
/*!40000 ALTER TABLE `Books_Cards` DISABLE KEYS */;
INSERT INTO `Books_Cards` VALUES
(2,2),
(12,2),
(23,1),
(27,2),
(28,1),
(30,1),
(34,2),
(36,1),
(42,1);
/*!40000 ALTER TABLE `Books_Cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Card_Challenge`
--

DROP TABLE IF EXISTS `Card_Challenge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Card_Challenge` (
  `Card_Challenge_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Card_Id` int(11) NOT NULL,
  PRIMARY KEY (`Card_Challenge_Id`),
  KEY `Card_Id` (`Card_Id`),
  CONSTRAINT `Card_Challenge_ibfk_1` FOREIGN KEY (`Card_Id`) REFERENCES `Cards` (`Card_Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Card_Challenge`
--

LOCK TABLES `Card_Challenge` WRITE;
/*!40000 ALTER TABLE `Card_Challenge` DISABLE KEYS */;
INSERT INTO `Card_Challenge` VALUES
(6,18),
(12,48),
(13,53),
(14,56),
(15,66),
(16,84);
/*!40000 ALTER TABLE `Card_Challenge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Card_Challenge_Answer`
--

DROP TABLE IF EXISTS `Card_Challenge_Answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Card_Challenge_Answer` (
  `Card_Challenge_Id` int(11) NOT NULL,
  `Answer_Id` int(11) NOT NULL,
  PRIMARY KEY (`Card_Challenge_Id`,`Answer_Id`),
  KEY `Answer_Id` (`Answer_Id`),
  CONSTRAINT `Card_Challenge_Answer_ibfk_1` FOREIGN KEY (`Card_Challenge_Id`) REFERENCES `Card_Challenge` (`Card_Challenge_Id`) ON DELETE CASCADE,
  CONSTRAINT `Card_Challenge_Answer_ibfk_2` FOREIGN KEY (`Answer_Id`) REFERENCES `Answers` (`Answer_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Card_Challenge_Answer`
--

LOCK TABLES `Card_Challenge_Answer` WRITE;
/*!40000 ALTER TABLE `Card_Challenge_Answer` DISABLE KEYS */;
INSERT INTO `Card_Challenge_Answer` VALUES
(12,12),
(13,13),
(14,14),
(15,15),
(16,16);
/*!40000 ALTER TABLE `Card_Challenge_Answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cards`
--

DROP TABLE IF EXISTS `Cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cards` (
  `Title` varchar(500) NOT NULL,
  `Quantity` bigint(20) unsigned NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Card_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Card_Img` longblob DEFAULT NULL,
  `Slot_Number` varchar(20) DEFAULT NULL,
  `Difficulty_Code` int(11) NOT NULL,
  PRIMARY KEY (`Card_Id`),
  KEY `Difficulty_Code` (`Difficulty_Code`),
  CONSTRAINT `Cards_ibfk_1` FOREIGN KEY (`Difficulty_Code`) REFERENCES `Cards_Difficulty` (`Difficulty_Code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cards`
--

LOCK TABLES `Cards` WRITE;
/*!40000 ALTER TABLE `Cards` DISABLE KEYS */;
INSERT INTO `Cards` VALUES
('Ruler\'s Blessings',1,'A Castle given as a prize for winning the contest, town with population 10.000 included. It\'s Residents will live according to whatever laws and commands you issue.',1,NULL,'000',1),
('Patch of Forest',2,'The entrance to the giant forest called the Mountain god\'s garden where many unique endemic species live. They are all tame and friendly.',2,NULL,'001',1),
('Plot of Beach',3,'The entrance to a cave called Posseidon\'s Cavern. The cave changes its path at each visit, confusing intruders.',3,NULL,'002',1),
('Pitcher of Eternal Water',17,'A jar from which pure, clean water (1440 liters per day) continually flows.',4,NULL,'003',3),
('Skin Care Hot Springs',15,'A hot spring that cures you of any skin condition. Bathing in it for half an hour a day gives you skin as soft and smooth as a baby\'s.',5,NULL,'004',3),
('Spirited Away Hollow',8,'Enter and then exit this hollow and you wil be transported to a desolate location within the country. Circumstances will allow you to return to where you started without you having to spend any money.',6,NULL,'005',2),
('Liquor spring',15,'Draw some of this spring\'s water and one hour later it will become a random alcoholic drink of exquisite taste and extraordinary quality.',7,NULL,'006',3),
('Pregnancy Stone',10,'Carry a stone (Weighing 7 pounds each) for one month and you will get pregnant, even if you are male. You may chose the sex of the baby by the female or male stone.',8,NULL,'007',2),
('Mystery Pond',10,'Release one fish into this pond, and there will be one more fish of that type the next day. You can keep any combination of fish in this pond, even saltwater and freshwater fish together!',9,NULL,'008',2),
('Tree of Plenty',10,'A tree that bears all sorts of fruit. No matter how much you harvest, it will be full again the next day. The type and number of fruit are random.',10,NULL,'009',2),
('Golden Guidebook',20,'A travel guide that lists where and when you can meet people of the opposite sex who are your type.',11,NULL,'010',3),
('Golden Scales',29,'When faced with a two-opition choice, these scales will tell you wich is better for your future.',12,NULL,'011',4),
('Golden Dictionary',10,'Each day you will find a word glowing gold. You should learn those words because they will come in handy the next day.',13,NULL,'012',2),
('Luck Bankbook',20,'Refrain from using the little things of good luck in your daily life, and you can accumulate and convert them into cash.',14,NULL,'013',3),
('Connection Servering Scissors',22,'Cut a picture of someone you don\'t want to see with these scissors, and you will never see them again. Caution: It will take effect on everyone in the picture (except yourself).',15,NULL,'014',4),
('Fickle Genie',10,'This genie will grant you there wishes, but you need to suggest 1000 potential, significantly different wishes and he will choose three from among them. No cheating by asking for diffrent increments of money.',16,NULL,'015',2),
('Fairy king\'s advice',6,'The Fairy King offers you gentle, apt advice on what you lack or what you lack or what you should fix. The annoying thing is he appears when he wants to.',17,NULL,'016',2),
('Angels\'s Breath',3,'She cures one person of all wounds and ills, restoring them to perfect health. She will only appear once.',18,NULL,'017',1),
('Imp\'s Wink',18,'You will experience the most amazing ecstasy when she winks at you. She can appear multiple times. Be warned, it can get addictive.',19,NULL,'018',3),
('Poltergeist Pillow',13,'Sleep on this pillow and your astral form will be able to wander at will, but you will turn into a real ghost if you do not return to your body within 24 hours.',20,NULL,'019',3),
('Mood Clock',30,'This clock sets your current state of mind. Turn it to noon and you will maintain perfect serenity. This you can adjust your emotions according to the situation.',21,NULL,'020',4),
('X-ray Goggles',27,'You can see through things. an adjustment dial allows you to set the x-ray depth. The only thing it cannot see through is a pack of spell cards from masadora.',22,NULL,'021',4),
('Toraemon',21,'A beast on the verge of extinction, it has a habit of stuffing things in its 4-d pocket. You never know what kind of treasures it could have picked up.',23,NULL,'022',3),
('Tome of a Thousand Tales',30,'A Book that shows you a different story each time you open it. If you want to stay on the same story when you put it down, use the special included bookmark.',24,NULL,'023',4),
('Hypothetical T.V.',20,'Input a hypothetical situation with the included remote, and this tv will show you a 30-hour documentary of the possibilities. You are also able to record.',25,NULL,'024',3),
('Risky Dice',30,'A twenty-sided dice with one skull face and 19 star faces. Great thins happen when you roll a star, but rolling the skull will be bad enough to cancel out all the previous great events.',26,NULL,'025',4),
('Night Shift Dwarves',19,'They can do any work you can do, and they will work as long as you are asleep. They cannot do anything beyond your abilities.',27,NULL,'026',3),
('Book of V.I.P Passes',24,'You can go anywhere with these passes. Book of 1000.',28,NULL,'027',4),
('Capricious Remote',27,'A remote control to manipulate ten emotions someone feels toward someone else, on an intensity scale of 1-10. You cannot control how people feel toward you.',29,NULL,'028',4),
('Pre-order Vouchers',19,'Write the name of any commercially available product on a voucher and you\'ll be guaranteed to get it regardless of its scarcity (you still have to pay). A book of 1000.',30,NULL,'029',3),
('Favor Cushion',21,'seat someone on this cushion and he will do one thing for you, so long as it is within his capabilities.',31,NULL,'030',4),
('Double postcard to the dead',13,'Address and mail this return postagepaid postcard to a deceased person, and you will get a reply the next day. A book of 1000.',32,NULL,'031',2),
('Parrot Candy',30,'This candy allows for whoever consumes it, to perfectly mimic any voice they can think of. The effects last until the next time something is eaten. Provides 10 packs, each pack containing 50 candies.',33,NULL,'032',4),
('Hormone cookies',12,'After eating this candy, your sex will temporarily change for 24 hours. A set of 10 boxes, 20 cookies per box.',34,NULL,'033',2),
('Universal Survey',30,'Write a set of questions about yourself, and whoever you give it to, will answer all of the questions honestly. This is reusable.',35,NULL,'034',4),
('Charmeleon Cat',5,'An endangered species. Once tamed, it can transform into any animal. However, its mass remains constant, so it will be a tiny elephant or a large hamster, for example. ',36,NULL,'035',2),
('Recycling Room',10,'Put something broken in this room and it will be repaired as good as new 24 hours later. The door must not be opened until time is up',37,NULL,'036',2),
('Fledgling Athlete',30,'Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a top athlete when it hatches. The stronger your desire during incubations, the sooner it will hatch.',38,NULL,'037',4),
('Fledgling Artist',30,'Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a top artist when it hatches. The stronger your desire during incubations, the sooner it will hatch.',39,NULL,'038',4),
('Fledglin Politician',30,'Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a Renowned politician when it hatches. The stronger your desire during incubations, the sooner it will hatch.',40,NULL,'039',4),
('Fledgling Musician',30,'Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a top musician when it hatches. The stronger your desire during incubations, the sooner it will hatch.',41,NULL,'040',4),
('Fledgling Pilot',29,'Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a professional pilot when it hatches. The stronger your desire during incubations, the sooner it will hatch.',42,NULL,'041',4),
('Fledgling Novelist',30,'Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a superb writer when it hatches. The stronger your desire during incubations, the sooner it will hatch.',43,NULL,'042',4),
('Fledgling Gambler',30,'Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a top gambler when it hatches. The stronger your desire during incubations, the sooner it will hatch.',44,NULL,'043',4),
('Fledgling Actor',30,'Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a top actor when it hatches. The stronger your desire during incubations, the sooner it will hatch.',45,NULL,'044',4),
('Fledgling CEO',30,'Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a top CEO when it hatches. The stronger your desire during incubations, the sooner it will hatch.',46,NULL,'045',4),
('Gold Dust Girl',13,'A girl who sheds gold dust from her body, 500 grams of gold can be harvested from her daily bath. Very shy, she rarely leaves the house.',47,NULL,'046',3),
('Sleeping girl',11,'A girl who sleeps in your stead. You can be active for 24 hours without sleeping while she sleeps for you.',48,NULL,'047',3),
('Aromatherapy Girl',15,'A girl who emits the most comfortable aroma for you. While she\'s by your side, you will be free of stress.',49,NULL,'048',3),
('Miniature Mermaid',23,'A mermaid small enough to fit in your hand. A comfortable living enviroment puts her in a good mood, and she will sing with her.',50,NULL,'049',3),
('Miniature Dino',11,'A dinosaur small enough to fit in your hand. This creature produces a different species of tiny dinosaurs with each new generation.',51,NULL,'050',3),
('Miniature Dragon',10,'A dragon small enough to fit in your hand. It will obey your comands, and will eventually learn to talk if raised with love.',52,NULL,'051',2),
('Pearl Locusts',30,'Each of these locusts has a pearl in its abdomen. An outbreack occurs once every dozen years or so.',53,NULL,'052',4),
('King White Stag Beetle',30,'It uses special pheromones to lure other insects to build a huge colony. It leaves the colony once a day for an evening stroll.',54,NULL,'053',3),
('Millennium Butterfly',25,'A legendary insect named from the fact that the family of anyone who captures it will prosper for generations.',55,NULL,'054',3),
('Revenge Shop',20,'Report your grudges to the manager and he will retaliate for you in proportion to your grievance. Pay extra to request a more severe retaliation.',56,NULL,'055',3),
('Perfect Memory Studio',25,'Specify a time and date to get a picture of yourself in the past. You may also request a sequence of  fotographs.',57,NULL,'056',4),
('Hideout Realtor',11,'The agent will build a secret room just for you at a place of your choosing. However, you must not tell anyone about it or bring anybody to it.',58,NULL,'057',3),
('Secrets Video Rental',13,'Rent videos of other peoples secrets. You must not show the video or discuss its contents with anyone.',59,NULL,'058',3),
('Instant Foreign Language school',20,'Spend time studying a language at this school, and you will accrue time on a timer (included). while the timer is activated and counting down, you will be fluent.',60,NULL,'059',3),
('Long Lost Delivery',30,'Call the number and describe the item you lost, and it will be delivered to you the next day. It must be lost for longer than a month.',61,NULL,'060',4),
('Vending check-up',20,'A full-body medical scan for just 500 jenny. However, the only results are \'all clear\' or \'anomaly detected\', in which case it is recommended you see a doctor. ',62,NULL,'061',3),
('Club \'You rule\'',20,'Everyone in the club will do your bidding while you are there. However, one hour in the club equals a day outside.',63,NULL,'062',4),
('Virtual Restaurant',30,'You can order any food you want. You will feel full, but it is only an illusion. You will be given a multivitamin as you leave.',64,NULL,'063',4),
('Witch\'s Love Potion',30,'Kiss a pill and have your intended drink it, and he or she will fall in love with you. One pill lasts one week. One vial contains 500 pills.',65,NULL,'064',4),
('Witch\'s Rejuvenation Potion',10,'Each pill makes you physically younger by one year. You will retain all knowledge and memories. Beware, as you will die if you take more than your age. One vial contains 100 pills.',66,NULL,'065',2),
('Witch\'s Diet Pills',28,'Each pill makes you lose one kg. One vial contains 200 pills. Beware, as you will die if you take more than you weigh.',67,NULL,'066',4),
('Doyen\'s Growth Pills',30,'Each pill makes you grow one cm taller. Not recommended for people under 20 years of age. One vial contains 100 pills.',68,NULL,'067',4),
('Doien\'s Virility Pills',20,'A certain part of your anatomy will get very frisky. Both endurance and frequency are enhanced. One vial contains 500 pills.',69,NULL,'068',3),
('Doien\'s hair Restorer',30,'Luxurious hair will grow wherever it is applied. Use gloves, or hair will grow on fingers and palms. One vial contains 200 ml (enough to cover ten heads).',70,NULL,'069',4),
('Mad scientist\'s Steroids',16,'Get all the muscles you want without exercise. You must drink a litter a day for a week, and it tastes horrible. A seven-box set, with ten one liter bottles per box.',71,NULL,'070',3),
('Mad scientist\'s Pheromones',20,'Spray on your body to attract the opposite sex. However, you cannot adjust the strength of its effect, so be careful as it may cause a proliferation of stalkers.',72,NULL,'071',3),
('Mad scientist\'s Plastic Surgery',15,'Scan a picture of the face you want and you will end up an exact likeness. Each surgery carries a 5% chance of failure, and a 1% chance the machine itself will break.',73,NULL,'072',3),
('Night Jade',15,'A jewel \'blessed\' by the devil. When danger is about to befall its owner, it will deflect it to someone else.',74,NULL,'073',3),
('Sage\'s aquamarine',11,'Its owner will have many intelligent friends and keep those friendships for their entire lives.',75,NULL,'074',3),
('Wild Luck Alexandrite',20,'Its owner will get to have once-in-a-lifetime experiences, though you cannot choose whether they are for better or for worse...',76,NULL,'075',3),
('Roaming Ruby',30,'The owner of this ruby will gain immense wealth, but will never be able to remain in the same place fot more than a week.',77,NULL,'076',4),
('Bealty Magnet Emerald',10,'Specialists offering bealty services will flock to its owner, who will shine with heretofore unrecognized bealty.',78,NULL,'077',2),
('Lonely Sapphire',30,'The owner of this saphire will acquire vast wealth, but in exchange will spend a lifetime alone, forsaken by friends, family, and significant others.',79,NULL,'078',4),
('Rainbow Diamond',20,'A diamond that shines in a rainbow of collors. Propose with this diamond and she is guaranteed to say \'yes\'.',80,NULL,'079',3),
('Levitation Stone',7,'A stone about one carat in size that levitates. It can levitate one person, and receives energy from sunlight.',81,NULL,'080',2),
('Blue Planet',5,'A unique blue jewel. Its composition does not correspond to any know mineral, so it was given this name to mean \'a gift from space\'.',82,NULL,'081',1),
('Staff of Judgement',15,'Raise this staf in the air while calling out the name of someone you want to punish, and calamity will befall the one of you who has committed more bad deeds, the target or tourself.',83,NULL,'082',3),
('Sword of Truth',22,'Splits in two anyting and anyone deceitful. In trials, it\'s a criminal\'s worst nightmare. The sword will shatter when used to cut something true, but will regenerate if stored in its scabbard for one day.',84,NULL,'083',4),
('Paladin\'s necklace',60,'A player wearing this will reflect curses cast upon him, and be able to undo curses placed on cards he touches.',85,NULL,'084',6),
('Sacrifice Armor',8,'Renders ineffective any attack by a weapon reverted from a card. Beware, as it will randomly break sometime within the first 100 attacks.',86,NULL,'085',2),
('Quiver of Frustation',11,'You will be able to cast as many \'leave\' cards as you have arrows. It comes with 10 arrows, and one will be used each time you cast \'leave\'.',87,NULL,'086',3),
('Shield of Faith',15,'The spells \'relegate\', \'return\', \'drift\', and \'collision\' will be rended ineffective within a radius of 20 meters of the player armed with this shield.',88,NULL,'087',2),
('Eternal Hammer',15,'Anyone hit with this hammer will be afflicted with one random attack spell, and cannot defend him or herself with a defensive spell. However, it will not work on someone using \'paladin\'s necklace\' or spell card \'fortress\'.',89,NULL,'088',3),
('Tax Collector\'s Gauntlet',20,'Grants you the ability to cast \'levy\'. However, it will destroy one random specified slot card from your binder every time. You cannot cast it if your specified slots are empty.',90,NULL,'089',3),
('Memory Helmet',20,'You will never forget thingd you see or hear while wearing this helmet. Unfortunately, it\'s extremely large and heavy.',91,NULL,'090',3),
('Plastic King',20,'Recombine the parts of this 1:1 scale model kit to build any kind of vehicle. Fully functional, fuel not included.',92,NULL,'091',3),
('Swap Ticket',7,'Rip the ticket and give it to someone you want to switch with, and you can live his/her life for 24 hours. Book of 1000.',93,NULL,'092',2),
('Book of Life',28,'An encyclopedia of everyone who\'s been in your life sinse your birth, with records of conversations and memorable incidents. It may end up being tens of thousands of pages long.',94,NULL,'093',4),
('Bandit\'s Blade',10,'A successful attack with this weapon will cast \'mug\',\'pickpoket\', or \'thief\' on the target. Not effective on someone using \'Paladin\'s Necklace\' or spell card \'Fortress\'.',95,NULL,'094',2),
('Secret Cape',20,'You will be under the effect of \'Blackout Curtain\' while wearing this cape.',96,NULL,'095',3),
('Claivoryant',12,'Feed it card rank C or above, and it will spit up a \'Claivoryant\'.',97,NULL,'096',3),
('3-D Camera',20,'Pictures taken with this will be developed as 3-D objects, with all textures reproduced. Make Enlargements as needed.',98,NULL,'097',3),
('Silver Dog',8,'An endangered species with silver fur. Mix five grams of gold into its food everyday and it will excrete one kilogram of solid silver feces.',99,NULL,'098',2),
('Panda Maid',6,'An endangered species. Very neat and loves to cook, and each has a hobby such as sewing or gardening. They are excellent at taking care of human children.',100,NULL,'099',2);
/*!40000 ALTER TABLE `Cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cards_Difficulty`
--

DROP TABLE IF EXISTS `Cards_Difficulty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cards_Difficulty` (
  `Difficulty_Code` int(11) NOT NULL AUTO_INCREMENT,
  `Difficulty_Description` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Difficulty_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cards_Difficulty`
--

LOCK TABLES `Cards_Difficulty` WRITE;
/*!40000 ALTER TABLE `Cards_Difficulty` DISABLE KEYS */;
INSERT INTO `Cards_Difficulty` VALUES
(1,'SS'),
(2,'S'),
(3,'A'),
(4,'B'),
(5,'C'),
(6,'D'),
(7,'E'),
(8,'F'),
(9,'G'),
(10,'H');
/*!40000 ALTER TABLE `Cards_Difficulty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hunter_Stats`
--

DROP TABLE IF EXISTS `Hunter_Stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hunter_Stats` (
  `Hunter_Stats_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Jenny_Qtd` bigint(20) unsigned DEFAULT NULL,
  `Cards_Qtd` int(11) DEFAULT NULL,
  `Hunter_Id` int(11) NOT NULL,
  PRIMARY KEY (`Hunter_Stats_Id`),
  KEY `Hunter_Id` (`Hunter_Id`),
  CONSTRAINT `Hunter_Stats_ibfk_1` FOREIGN KEY (`Hunter_Id`) REFERENCES `Hunters` (`Hunter_Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hunter_Stats`
--

LOCK TABLES `Hunter_Stats` WRITE;
/*!40000 ALTER TABLE `Hunter_Stats` DISABLE KEYS */;
INSERT INTO `Hunter_Stats` VALUES
(1,16000,5,1),
(2,14000,4,2),
(3,16000,0,3),
(4,100000000,0,4),
(5,100000000,0,5);
/*!40000 ALTER TABLE `Hunter_Stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hunters`
--

DROP TABLE IF EXISTS `Hunters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hunters` (
  `Hunter_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Avatar` longblob DEFAULT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Location_Id` int(11) DEFAULT NULL,
  `Type_Hunter_Id` int(11) DEFAULT NULL,
  `Type_Question_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Hunter_Id`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`),
  KEY `Location_Id` (`Location_Id`),
  KEY `Type_Hunter_Id` (`Type_Hunter_Id`),
  KEY `Type_Question_Id` (`Type_Question_Id`),
  CONSTRAINT `Hunters_ibfk_1` FOREIGN KEY (`Location_Id`) REFERENCES `Locations` (`Location_Id`) ON DELETE CASCADE,
  CONSTRAINT `Hunters_ibfk_2` FOREIGN KEY (`Type_Hunter_Id`) REFERENCES `Types_Hunter` (`Type_Hunter_Id`) ON DELETE CASCADE,
  CONSTRAINT `Hunters_ibfk_3` FOREIGN KEY (`Type_Question_Id`) REFERENCES `Types_Question` (`Type_Question_Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hunters`
--

LOCK TABLES `Hunters` WRITE;
/*!40000 ALTER TABLE `Hunters` DISABLE KEYS */;
INSERT INTO `Hunters` VALUES
(1,NULL,'Anderson','123','ander@gmail.com',1,2,1),
(2,NULL,'Davi','123','davi@gmail.com',1,2,1),
(3,NULL,'Filipe','123','filipe@gmail.com',1,2,1),
(4,NULL,'Ednilson','123','ednil@gmail.com',1,2,1),
(5,NULL,'AndersonGM','123','andergm@gmail.com',1,1,1);
/*!40000 ALTER TABLE `Hunters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locations`
--

DROP TABLE IF EXISTS `Locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Locations` (
  `Location_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(500) NOT NULL,
  `Xaxis` int(11) NOT NULL,
  `Yaxis` int(11) NOT NULL,
  PRIMARY KEY (`Location_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locations`
--

LOCK TABLES `Locations` WRITE;
/*!40000 ALTER TABLE `Locations` DISABLE KEYS */;
INSERT INTO `Locations` VALUES
(1,'Central Science Institute',62,37),
(2,'Education Institute',45,35),
(3,'Art Institute',54,36),
(4,'Biology Institute',58,50),
(5,'Computer Science Institute',76,35),
(6,'Olympic Center',85,80),
(7,'Central Library',71,37);
/*!40000 ALTER TABLE `Locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Questions` (
  `Question_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Statement` longtext DEFAULT NULL,
  `Type_Question_Id` int(11) DEFAULT NULL,
  `Difficulty_Code` int(11) DEFAULT NULL,
  PRIMARY KEY (`Question_Id`),
  KEY `Type_Question_Id` (`Type_Question_Id`),
  KEY `Difficulty_Code` (`Difficulty_Code`),
  CONSTRAINT `Questions_ibfk_1` FOREIGN KEY (`Type_Question_Id`) REFERENCES `Types_Question` (`Type_Question_Id`) ON DELETE CASCADE,
  CONSTRAINT `Questions_ibfk_2` FOREIGN KEY (`Difficulty_Code`) REFERENCES `Cards_Difficulty` (`Difficulty_Code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
INSERT INTO `Questions` VALUES
(1,'Qual é o verdadeiro nome de L em \"Death Note\"?',1,1),
(2,'Em \"Neon Genesis Evangelion\", qual é a razão pela qual os Eva-01 podem se mover sem energia por 5 minutos?',1,1),
(3,'Qual é o nome da espada usada por Guts em \"Berserk\"?',1,1),
(4,'Em \"One Piece\", qual é a recompensa atual de Monkey D. Luffy? (Depois de Wano)',1,1),
(5,'Quem é o verdadeiro autor dos mangás dentro do anime \"Bakuman\"?',1,1),
(6,'Em \"Naruto\", qual é o nome completo do Quarto Hokage?',1,1),
(7,'Qual é o nome do protagonista de \"Your Lie in April\" (Shigatsu wa Kimi no Uso)?',1,1),
(8,'Em \"Attack on Titan\", qual é a verdadeira identidade do Titã Colossal?',1,1),
(9,'Qual é o nome do jogo jogado em \"Sword Art Online\"?',1,1),
(10,'Qual é a habilidade do Stand \"The World\" em \"JoJos Bizarre Adventure: Stardust Crusaders\"?',1,1),
(11,'Qual é o nome do líder dos Cavaleiros do Zodíaco de Bronze em \"Saint Seiya\"?',1,2),
(12,'Em \"Fullmetal Alchemist\", qual é o nome da substância que os alquimistas querem criar?',1,2),
(13,'Qual é o nome do Digimon parceiro de Tai em \"Digimon Adventure\"?',1,2),
(14,'Qual é o nome da organização terrorista em \"Akira\"?',1,2),
(15,'Quem é o principal antagonista em \"Yu Yu Hakusho\"?',1,2),
(16,'Em \"Dragon Ball Z\", qual é o verdadeiro nome de Piccolo?',1,2),
(17,'Qual é o nome do notebook usado para matar pessoas em \"Death Note\"?',1,2),
(18,'Qual é o nome da cidade onde se passa \"Cowboy Bebop\"?',1,2),
(19,'Qual é o nome do shinigami que acompanha Light em \"Death Note\"?',1,2),
(20,'Qual é o nome da escola em que Ichigo Kurosaki estuda em \"Bleach\"?',1,2),
(21,'Em \"One Piece\", qual é a fruta do diabo que Luffy comeu?',1,3),
(22,'Qual é o nome da irmã de Edward Elric em \"Fullmetal Alchemist\"?',1,3),
(23,'Qual é o nome do principal antagonista em \"Dragon Ball Z\"?',1,3),
(24,'Qual é a habilidade especial de Gon Freecss em \"Hunter x Hunter\"?',1,3),
(25,'Qual é o nome do cachorro de Inuyasha em \"Inuyasha\"?',1,3),
(26,'Qual é o nome do protagonista em \"Trigun\"?',1,3),
(27,'Qual é a profissão de Migi em \"Parasyte\"?',1,3),
(28,'Qual é o nome do líder da guilda Fairy Tail em \"Fairy Tail\"?',1,3),
(29,'Qual é a profissão de Tatsu em \"The Way of the Househusband\"?',1,3),
(30,'Qual é o nome do protagonista de \"Samurai Champloo\"?',1,3),
(31,'Qual é o nome do demônio dentro de Naruto?',1,4),
(32,'Qual é o nome do protagonista de \"Attack on Titan\"?',1,4),
(33,'Qual é a habilidade de Natsu Dragneel em \"Fairy Tail\"?',1,4),
(34,'Qual é o nome do protagonista de \"My Hero Academia\"?',1,4),
(35,'Qual é o nome do irmão mais novo de Edward Elric em \"Fullmetal Alchemist\"?',1,4),
(36,'Qual é o nome do protagonista de \"Tokyo Ghoul\"?',1,4),
(37,'Qual é a habilidade especial de Killua Zoldyck em \"Hunter x Hunter\"?',1,4),
(38,'Qual é o nome do protagonista de \"Sword Art Online\"?',1,4),
(39,'Qual é o nome do demônio que acompanha Allen Walker em \"D.Gray-man\"?',1,4),
(40,'Qual é o nome do protagonista de \"Blue Exorcist\"?',1,4),
(41,'Qual é o nome do protagonista de \"Black Clover\"?',1,5),
(42,'Qual é o nome do protagonista de \"One Punch Man\"?',1,5),
(43,'Qual é a habilidade especial de Meliodas em \"The Seven Deadly Sins\"?',1,5),
(44,'Qual é o nome do protagonista de \"Assassination Classroom\"?',1,5),
(45,'Qual é o nome do protagonista de \"The Promised Neverland\"?',1,5),
(46,'Qual é o nome do protagonista de \"Demon Slayer: Kimetsu no Yaiba\"?',1,5),
(47,'Qual é o nome do protagonista de \"Dr. Stone\"?',1,5),
(48,'Qual é o nome do protagonista de \"Fire Force\"?',1,5),
(49,'Qual é o nome do protagonista de \"Re:Zero\"?',1,5),
(50,'Qual é o nome do protagonista de \"Kaguya-sama: Love Is War\"?',1,5),
(51,'Qual é o nome do protagonista de \"Mob Psycho 100\"?',1,6),
(52,'Qual é o nome do protagonista de \"Vinland Saga\"?',1,6),
(53,'Qual é o nome do protagonista de \"Jujutsu Kaisen\"?',1,6),
(54,'Qual é o nome do protagonista de \"Beastars\"?',1,6),
(55,'Qual é o nome do protagonista de \"Attack on Titan\"?',1,6),
(56,'Qual é o nome do protagonista de \"The Rising of the Shield Hero\"?',1,6),
(57,'Qual é o nome do protagonista de \"That Time I Got Reincarnated as a Slime\"?',1,6),
(58,'Qual é o nome do protagonista de \"Food Wars!\"?',1,6),
(59,'Qual é o nome do protagonista de \"The Quintessential Quintuplets\"?',1,6),
(60,'Qual é o nome do protagonista de \"Rent-A-Girlfriend\"?',1,6),
(61,'Qual é o nome do protagonista de \"Your Name\"?',1,7),
(62,'Qual é o nome do protagonista de \"A Silent Voice\"?',1,7),
(63,'Qual é o nome do protagonista de \"Weathering With You\"?',1,7),
(64,'Qual é o nome do protagonista de \"Promare\"?',1,7),
(65,'Qual é o nome do protagonista de \"Children of the Whales\"?',1,7),
(66,'Qual é o nome do protagonista de \"The Garden of Words\"?',1,7),
(67,'Qual é o nome do protagonista de \"A Place Further than the Universe\"?',1,7),
(68,'Qual é o nome do protagonista de \"Anohana: The Flower We Saw That Day\"?',1,7),
(69,'Qual é o nome do protagonista de \"March Comes in Like a Lion\"?',1,7),
(70,'Qual é o nome do protagonista de \"Charlotte\"?',1,7),
(71,'Qual é o nome do protagonista de \"Orange\"?',1,8),
(72,'Qual é o nome do protagonista de \"Erased\"?',1,8),
(73,'Qual é o nome do protagonista de \"ReLife\"?',1,8),
(74,'Qual é o nome do protagonista de \"Your Lie in April\"?',1,8),
(75,'Qual é o nome do protagonista de \"Toradora!\"?',1,8),
(76,'Qual é o nome do protagonista de \"Clannad\"?',1,8),
(77,'Qual é o nome do protagonista de \"Angel Beats!\"?',1,8),
(78,'Qual é o nome do protagonista de \"Sword Art Online\"?',1,8),
(79,'Qual é o nome do protagonista de \"No Game No Life\"?',1,8),
(80,'Qual é o nome do protagonista de \"KonoSuba\"?',1,8),
(81,'Qual é o nome do protagonista de \"Steins;Gate\"?',1,9),
(82,'Qual é o nome do protagonista de \"Re:Zero\"?',1,9),
(83,'Qual é o nome do protagonista de \"The Rising of the Shield Hero\"?',1,9),
(84,'Qual é o nome do protagonista de \"That Time I Got Reincarnated as a Slime\"?',1,9),
(85,'Qual é o nome do protagonista de \"Overlord\"?',1,9),
(86,'Qual é o nome do protagonista de \"Goblin Slayer\"?',1,9),
(87,'Qual é o nome do protagonista de \"The Saga of Tanya the Evil\"?',1,9),
(88,'Qual é o nome do protagonista de \"Log Horizon\"?',1,9),
(89,'Qual é o nome do protagonista de \"The Devil Is a Part-Timer!\"?',1,9),
(90,'Qual é o nome do protagonista de \"Miss Kobayashis Dragon Maid\"?',1,9),
(91,'Qual é o nome do protagonista de \"Attack on Titan\"?',1,10),
(92,'Qual é o nome do protagonista de \"Naruto\"?',1,10),
(93,'Qual é o nome do protagonista de \"One Piece\"?',1,10),
(94,'Qual é o nome do protagonista de \"Dragon Ball Z\"?',1,10),
(95,'Qual é o nome do protagonista de \"Bleach\"?',1,10),
(96,'Qual é o nome do protagonista de \"My Hero Academia\"?',1,10),
(97,'Qual é o nome do protagonista de \"Demon Slayer: Kimetsu no Yaiba\"?',1,10),
(98,'Qual é o nome do protagonista de \"Sword Art Online\"?',1,10),
(99,'Qual é o nome do protagonista de \"Death Note\"?',1,10),
(100,'Qual é o nome do protagonista de \"Fullmetal Alchemist\"?',1,10),
(101,'',2,1),
(102,'',2,1),
(103,'',2,1),
(104,'',2,1),
(105,'',2,1),
(106,'',2,1),
(107,'',2,1),
(108,'',2,1),
(109,'',2,1),
(110,'',2,1),
(111,'',2,2),
(112,'',2,2),
(113,'',2,2),
(114,'',2,2),
(115,'',2,2),
(116,'',2,2),
(117,'',2,2),
(118,'',2,2),
(119,'',2,2),
(120,'',2,2),
(121,'',2,3),
(122,'',2,3),
(123,'',2,3),
(124,'',2,3),
(125,'',2,3),
(126,'',2,3),
(127,'',2,3),
(128,'',2,3),
(129,'',2,3),
(130,'',2,3),
(131,'',2,4),
(132,'',2,4),
(133,'',2,4),
(134,'',2,4),
(135,'',2,4),
(136,'',2,4),
(137,'',2,4),
(138,'',2,4),
(139,'',2,4),
(140,'',2,4),
(141,'',2,5),
(142,'',2,5),
(143,'',2,5),
(144,'',2,5),
(145,'',2,5),
(146,'',2,5),
(147,'',2,5),
(148,'',2,5),
(149,'',2,5),
(150,'',2,5),
(151,'',2,6),
(152,'',2,6),
(153,'',2,6),
(154,'',2,6),
(155,'',2,6),
(156,'',2,6),
(157,'',2,6),
(158,'',2,6),
(159,'',2,6),
(160,'',2,6),
(161,'',2,7),
(162,'',2,7),
(163,'',2,7),
(164,'',2,7),
(165,'',2,7),
(166,'',2,7),
(167,'',2,7),
(168,'',2,7),
(169,'',2,7),
(170,'',2,7),
(171,'',2,8),
(172,'',2,8),
(173,'',2,8),
(174,'',2,8),
(175,'',2,8),
(176,'',2,8),
(177,'',2,8),
(178,'',2,8),
(179,'',2,8),
(180,'',2,8),
(181,'',2,9),
(182,'',2,9),
(183,'',2,9),
(184,'',2,9),
(185,'',2,9),
(186,'',2,9),
(187,'',2,9),
(188,'',2,9),
(189,'',2,9),
(190,'',2,9),
(191,'',2,10),
(192,'',2,10),
(193,'',2,10),
(194,'',2,10),
(195,'',2,10),
(196,'',2,10),
(197,'',2,10),
(198,'',2,10),
(199,'',2,10),
(200,'',2,10),
(201,'',3,1),
(202,'',3,1),
(203,'',3,1),
(204,'',3,1),
(205,'',3,1),
(206,'',3,1),
(207,'',3,1),
(208,'',3,1),
(209,'',3,1),
(210,'',3,1),
(211,'',3,2),
(212,'',3,2),
(213,'',3,2),
(214,'',3,2),
(215,'',3,2),
(216,'',3,2),
(217,'',3,2),
(218,'',3,2),
(219,'',3,2),
(220,'',3,2),
(221,'',3,3),
(222,'',3,3),
(223,'',3,3),
(224,'',3,3),
(225,'',3,3),
(226,'',3,3),
(227,'',3,3),
(228,'',3,3),
(229,'',3,3),
(230,'',3,3),
(231,'',3,4),
(232,'',3,4),
(233,'',3,4),
(234,'',3,4),
(235,'',3,4),
(236,'',3,4),
(237,'',3,4),
(238,'',3,4),
(239,'',3,4),
(240,'',3,4),
(241,'',3,5),
(242,'',3,5),
(243,'',3,5),
(244,'',3,5),
(245,'',3,5),
(246,'',3,5),
(247,'',3,5),
(248,'',3,5),
(249,'',3,5),
(250,'',3,5),
(251,'',3,6),
(252,'',3,6),
(253,'',3,6),
(254,'',3,6),
(255,'',3,6),
(256,'',3,6),
(257,'',3,6),
(258,'',3,6),
(259,'',3,6),
(260,'',3,6),
(261,'',3,7),
(262,'',3,7),
(263,'',3,7),
(264,'',3,7),
(265,'',3,7),
(266,'',3,7),
(267,'',3,7),
(268,'',3,7),
(269,'',3,7),
(270,'',3,7),
(271,'',3,8),
(272,'',3,8),
(273,'',3,8),
(274,'',3,8),
(275,'',3,8),
(276,'',3,8),
(277,'',3,8),
(278,'',3,8),
(279,'',3,8),
(280,'',3,8),
(281,'',3,9),
(282,'',3,9),
(283,'',3,9),
(284,'',3,9),
(285,'',3,9),
(286,'',3,9),
(287,'',3,9),
(288,'',3,9),
(289,'',3,9),
(290,'',3,9),
(291,'',3,10),
(292,'',3,10),
(293,'',3,10),
(294,'',3,10),
(295,'',3,10),
(296,'',3,10),
(297,'',3,10),
(298,'',3,10),
(299,'',3,10),
(300,'',3,10);
/*!40000 ALTER TABLE `Questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Types_Hunter`
--

DROP TABLE IF EXISTS `Types_Hunter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Types_Hunter` (
  `Description` varchar(30) NOT NULL,
  `Type_Hunter_Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Type_Hunter_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Types_Hunter`
--

LOCK TABLES `Types_Hunter` WRITE;
/*!40000 ALTER TABLE `Types_Hunter` DISABLE KEYS */;
INSERT INTO `Types_Hunter` VALUES
('GAME MASTER',1),
('NORMAL PLAYER',2);
/*!40000 ALTER TABLE `Types_Hunter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Types_Question`
--

DROP TABLE IF EXISTS `Types_Question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Types_Question` (
  `Type_Question_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(30) NOT NULL,
  PRIMARY KEY (`Type_Question_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Types_Question`
--

LOCK TABLES `Types_Question` WRITE;
/*!40000 ALTER TABLE `Types_Question` DISABLE KEYS */;
INSERT INTO `Types_Question` VALUES
(1,'Anime'),
(2,'Music'),
(3,'Movie');
/*!40000 ALTER TABLE `Types_Question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `All_Hunter_Answer`
--

/*!50001 DROP VIEW IF EXISTS `All_Hunter_Answer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`moltres`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `All_Hunter_Answer` AS select `h`.`Hunter_Id` AS `Hunter_Id`,`h`.`Username` AS `Username`,`q`.`Statement` AS `Statement`,`a`.`Content` AS `Answer`,`a`.`Answer_Id` AS `Answer_Id`,`c`.`Card_Id` AS `Card_Id`,`c`.`Description` AS `Description`,`cc`.`Card_Challenge_Id` AS `Card_Challenge_Id`,`b`.`Book_Id` AS `Book_Id` from ((((((`Hunters` `h` join `Books` `b` on(`b`.`Hunter_Id` = `h`.`Hunter_Id`)) join `Answers` `a` on(`a`.`Hunter_Id` = `h`.`Hunter_Id`)) join `Card_Challenge_Answer` `cca` on(`cca`.`Answer_Id` = `a`.`Answer_Id`)) join `Questions` `q` on(`q`.`Question_Id` = `a`.`Question_Id`)) join `Card_Challenge` `cc` on(`cc`.`Card_Challenge_Id` = `cca`.`Card_Challenge_Id`)) join `Cards` `c` on(`c`.`Card_Id` = `cc`.`Card_Id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `All_Hunter_Info`
--

/*!50001 DROP VIEW IF EXISTS `All_Hunter_Info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`moltres`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `All_Hunter_Info` AS select `h`.`Hunter_Id` AS `Hunter_Id`,`h`.`Type_Hunter_Id` AS `Type_Hunter_Id`,`h`.`Location_Id` AS `Location_Id`,`h`.`Type_Question_Id` AS `Type_Question`,`hs`.`Jenny_Qtd` AS `Jenny_Qtd`,`hs`.`Cards_Qtd` AS `Cards_Qtd`,`b`.`Book_Id` AS `Book_Id` from (((((`Hunters` `h` join `Types_Hunter` `th` on(`th`.`Type_Hunter_Id` = `h`.`Type_Hunter_Id`)) join `Hunter_Stats` `hs` on(`hs`.`Hunter_Id` = `h`.`Hunter_Id`)) join `Locations` `l` on(`l`.`Location_Id` = `h`.`Location_Id`)) join `Types_Question` `tq` on(`tq`.`Type_Question_Id` = `h`.`Type_Question_Id`)) join `Books` `b` on(`b`.`Hunter_Id` = `h`.`Hunter_Id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-10 16:11:52
