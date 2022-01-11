CREATE DATABASE IF NOT EXISTS `games_2`;
USE games_2;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `cID` char(4) NOT NULL,
  `coname` char(32) NOT NULL,
  `founding` date NOT NULL,
  `closing` date DEFAULT NULL,
  `address` text NOT NULL,
  `parent_cID` char(4) DEFAULT NULL,
  -- `icon` int(16) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`),
  KEY `parent_cID` (`parent_cID`),
  -- KEY `icon` (`icon`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`parent_cID`) REFERENCES `company` (`cID`)
  -- CONSTRAINT `company_ibfk_2` FOREIGN KEY (`icon`) REFERENCES `image` (`iID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('CHUN','Chunsoft Co.','1984-04-09',NULL,'Minato-ku, Tokyo, Japan',NULL),
('ENIX','Enix Corporation','1975-09-22','2003-04-01','Shibuya, Tokyo, Japan','SQEN'),
('MSFT','Microsoft','1975-04-04',NULL,'One Microsoft Way, Redmond, Washington, U.S.',NULL),
('NEC','Japanese Electric Company','1899-07-17',NULL,'Shiba, Minato, Tokyo, Japan',NULL),
('NTDO','Nintendo','1889-09-23',NULL,'11-1 Kamitoba Hokodatecho, Minami-ku, Kyoto, Japan',NULL),
('SEGA','Sega','1960-06-03',NULL,'Shinagawa, Tokyo, Japan',NULL),
('SNIC','Sonic Team','1991-06-03',NULL,'Tokyo, Japan','SEGA'),
('SQEN','Square-Enix','1975-09-22',NULL,'Shinjuku, Tokyo, Japan',NULL),
('SQRE','Square Co., Ltd.','1986-09-01','2003-04-01','Meguro, Tokyo, Japan','SQEN');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `console`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `console` (
  `pcID` char(3) NOT NULL,
  `pcName` char(24) NOT NULL,
  `developer` char(4) NOT NULL,
  `release_date` date NOT NULL,
  -- `icon` int(16) unsigned NOT NULL DEFAULT '0',
  -- `about` text,
  PRIMARY KEY (`pcID`),
  KEY `developer` (`developer`),
  -- KEY `icon` (`icon`),
  CONSTRAINT `console_ibfk_1` FOREIGN KEY (`developer`) REFERENCES `company` (`cID`)
  -- CONSTRAINT `console_ibfk_2` FOREIGN KEY (`icon`) REFERENCES `image` (`iID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `console` WRITE;
/*!40000 ALTER TABLE `console` DISABLE KEYS */;
INSERT INTO `console` VALUES ('GB','Gameboy','NTDO','1989-04-21'),('GBA','Gameboy Advanced','NTDO','2001-03-21'),
	('GBC','Gameboy Color','NTDO','1998-10-21'),('GEN','Genesis','SEGA','1988-10-29'),('GG','Game Gear','SEGA','1990-10-06'),
    ('MS','Master System','SEGA','1985-10-20'),('MSX','MSX','MSFT','1983-10-31'),('NES','NES','NTDO','1983-07-15'),
    ('PCE','TurboGrafx-16','NEC','1987-10-30'),('SFC','SNES','NTDO','1990-11-21');
-- ('GB','Gameboy','NTDO','1989-04-21',105,'The Gameboy was a handheld consoles developed by Nintendo. While other handhelds released during the era, many more technically capable, the Gameboy was the unchallenged king of handhelds at the time.'),
-- ('GBA','Gameboy Advanced','NTDO','2001-03-21',106,'The Gameboy Advanced (GBA) was the successor to the Gameboy Color. Unlike it\'s predecessor, the GBA supported full color sprites instead of a 4 color pallette system.'),
-- ('GBC','Gameboy Color','NTDO','1998-10-21',113,'The Gameboy Color was the successor to the Gameboy relased by Nintendo. As the name implies the Gameboy Color added a color screen to the device however, programs could only use 4 colors per sprite which were stored in a pallete.'),
-- ('GEN','Genesis','SEGA','1988-10-29',112,'The Genesis (also known as the Mega Drive) was the successor to the SEGA Master System. Although it\'s catalogue of games increased in both quality and volume compared to the Master System, the Genesis still fell behind the SNES althought the difference was much less noticable.'),
-- ('GG','Game Gear','SEGA','1990-10-06',107,'The Gamegear was a handheld console released by SEGA to compete with Nintendo\'s Gameboy. While the Gamegear had a 32-bit color screen, the Gameboy\'s earlier release and larger catalogue doomed the handheld console.'),
-- ('MS','Master System','SEGA','1985-10-20',109,'The Master System was a console released by Sega to compete with the NES. While the console had some success, due to the NES\'s earlier release and bigger catalogue the Master System had difficulty competing with the industry giant.'),
-- ('MSX','MSX','MSFT','1983-10-31',104,'A system developed by Microsoft for the Japanese market that ran off an offshoot of DOS (aptly named MSX-DOS). Many japanese game titles of the era were developed for the MSX. The console had 3 subsuquent releases titled the MSX2, MSX2+, and MSX turboR - all of which, are catagorized under this tag.'),
-- ('NES','NES','NTDO','1983-07-15',110,'The NES (Nintendo Entertainment System, or Famicon in Japan) was a console released by Nintendo for the 8-bit era. Due to it\'s enormous catalouge of amazing games (even using today\'s standards) the console was the unchallenged leader of the era.'),
-- ('PCE','TurboGrafx-16','NEC','1987-10-30',108,'The Turbografx-16, or PC Engine, was a 8-bit console released by NEC. Released late into the 8-bit era, the console saw moderate success but had difficulty competing after the release of 16-bit consoles like the SNES and Genesis.'),
-- ('SFC','SNES','NTDO','1990-11-21',111,'The SNES or Super NES was the successor the the NES released by Nintendo. With an increased 16-bit processor the console was a huge leap technically from the previous era of consoles and, as it\'s library shows, developers took advantage of this.');
/*!40000 ALTER TABLE `console` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `meta_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_game` (
	`gID` int(16) unsigned NOT NULL auto_increment,
    `series` int(16) unsigned DEFAULT NULL,
    `players` int(3) unsigned NOT NULL DEFAULT 1,
    -- `about` text,
    PRIMARY KEY(`gID`),
    CONSTRAINT FOREIGN KEY (`series`) REFERENCES `series` (`sID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `meta_game` WRITE;
/*!40000 ALTER TABLE `meta_game` DISABLE KEYS */;
INSERT INTO `meta_game` VALUES (1,3,2),(2,3,2),(3,3,2),(4,3,2),(6,1,1),(7,1,1),(8,1,1),(9,1,1),(11,7,1);
-- (1,3,2,'The first Super Mario Bros. game. Originally released for the NES, Super Mario Bros. was levels above many platformers of the time, which is probably why the series has been able to thrive for so long.'),
-- (2,3,2,'The sequal to Super Mario Bros. In reality this is just a reskin of the Japanese title Doki Doki Panic.'),
-- (3,3,2,'The third game in the Super Mario series. Here we see some of the more modern characteristics of a mario game such as the aesthetic, the world map, toad houses, and power-ups taking hold. '),
-- (4,3,2,'Super Mario Bros. World is the fourth installment in the series. The game introduced one of the series most well known characters - Yoshi.'),
-- (6,1,1,'Dragon Quest is the first game in the Dragon Quest series. Originally released for the MSX'),
-- (7,1,1,'Dragon Quest 2 is the second game in the Dragon Quest Series. The game makes many improvements to the original, including a party system.'),
-- (8,1,1,'Dragon Quest 3 is the third game in the Dragon Quest Series. The game expands on it\'s predecessors both in story telling and gameplay.'),
-- (9,1,1,'Dragon Quest 1 & 2 is a compilation of the first 2 games. Released for the SNES and Gameboy Color, the games see some visual improvements as well as gameplay tweeks.'),
-- (11,7,1,'Sonic the Hedgehog was a game released originally for the Genesis. You play as a Hedgehog who\'s personality comes down to speed, being \'Totally Kool,\' and chilli dogs. Gameplay and Music are top notch though.');
/*!40000 ALTER TABLE `meta_game` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `game_port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_port` (
  `gID` int(16) unsigned NOT NULL auto_increment,
  `pcID` char(3) NOT NULL,
  `producer` char(4) NOT NULL,
  `developer` char(4) NOT NULL,
  PRIMARY KEY (`gID`,`pcID`),
  KEY `pcID` (`pcID`),
  KEY `developer` (`developer`),
  CONSTRAINT `game_port_ibfk_1` FOREIGN KEY (`gID`) REFERENCES `meta_game` (`gID`),
  CONSTRAINT `game_port_ibfk_2` FOREIGN KEY (`pcID`) REFERENCES `console` (`pcID`),
  CONSTRAINT `game_port_ibfk_3` FOREIGN KEY (`producer`) REFERENCES `company` (`cID`),
  CONSTRAINT `game_port_ibfk_4` FOREIGN KEY (`developer`) REFERENCES `company` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `game_port` WRITE;
/*!40000 ALTER TABLE `game_port` DISABLE KEYS */;
INSERT INTO `game_port` VALUES (6,'MSX','ENIX','CHUN'),(6,'NES','ENIX','CHUN'),(7,'MSX','ENIX','CHUN'),(7,'NES','ENIX','CHUN'),(8,'GBC','ENIX','CHUN'),
(8,'NES','ENIX','CHUN'),(8,'SFC','ENIX','CHUN'),(9,'GBC','ENIX','CHUN'),(9,'SFC','ENIX','CHUN'),(1,'GBA','NTDO','NTDO'),(1,'GBC','NTDO','NTDO'),(1,'NES','NTDO','NTDO'),(2,'NES','NTDO','NTDO'),(3,'GBA','NTDO','NTDO'),
(3,'NES','NTDO','NTDO'),(4,'GBA','NTDO','NTDO'),(4,'SFC','NTDO','NTDO'),(11,'GBA','SEGA','SNIC'),(11,'GEN','SEGA','SNIC');
/*!40000 ALTER TABLE `game_port` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `game_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_release` (
  `gID` int(16) unsigned NOT NULL,
  `pcID` char(3) NOT NULL,
  `rID` char(3) NOT NULL,
  `gname` char(64) NOT NULL,
  `release_date` date NOT NULL,
  PRIMARY KEY (`gID`,`pcID`,`rID`),
  KEY `rID` (`rID`),
  CONSTRAINT `game_release_ibfk_1` FOREIGN KEY (`gID`, `pcID`) REFERENCES `game_port` (`gID`, `pcID`),
  CONSTRAINT `game_release_ibfk_2` FOREIGN KEY (`rID`) REFERENCES `region` (`rID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_release`
--

LOCK TABLES `game_release` WRITE;
/*!40000 ALTER TABLE `game_release` DISABLE KEYS */;
INSERT INTO `game_release` VALUES (1,'GBA','JPN','Super Mario Brothers','2004-02-14'),(1,'GBA','WLD','Classic NES Series: Super Mario Bros.','2004-07-07'),(1,'GBC','JPN','Super Mario Bros: Deluxe','2000-03-01'),(1,'GBC','PAL','Super Mario Bros: Deluxe','1999-06-10'),(1,'GBC','USA','Super Mario Bros: Deluxe','1999-05-01'),(1,'NES','JPN','Super Mario Brothers','1985-09-13'),(1,'NES','PAL','Super Mario Bros.','1987-05-15'),(1,'NES','USA','Super Mario Bros.','1985-10-01'),(2,'NES','JPN','Super Mario Bros. USA','1992-09-16'),(2,'NES','USA','Super Mario Bros. 2','1988-10-09'),(3,'GBA','JPN','Super Mario Advance 4: Super Mario Bros. 3','2003-07-11'),(3,'GBA','USA','Super Mario Advance 4: Super Mario Bros. 3','2003-10-17'),(3,'NES','JPN','Super Mario Brothers 3','1988-10-23'),(3,'NES','WLD','Super Mario Bros. 3','1990-02-12'),(4,'GBA','JPN','Super Mario World: Super Mario Advance 2','2001-12-14'),(4,'GBA','PAL','Super Mario World: Super Mario Advance 2','2002-02-12'),(4,'GBA','USA','Super Mario World: Super Mario Advance 2','2001-02-11'),(4,'SFC','JPN','Super Mario World','1990-11-21'),(4,'SFC','PAL','Super Mario World','1992-04-11'),(4,'SFC','USA','Super Mario World','1991-08-23'),(6,'MSX','JPN','Dragon Quest','1986-11-01'),(6,'NES','JPN','Dragon Quest','1986-05-27'),(6,'NES','USA','Dragon Warrior','1989-08-01'),(7,'MSX','JPN','Dragon Quest II','1988-02-01'),(7,'NES','JPN','Dragon Quest II','1987-01-26'),(7,'NES','USA','Dragon Warrior II','1990-10-30'),(8,'GBC','JPN','Dragon Quest III','2000-12-08'),(8,'GBC','USA','Dragon Warrior III','2001-07-07'),(8,'NES','JPN','Dragon Quest III','1988-02-10'),(8,'NES','USA','Dragon Warrior III','1992-03-12'),(8,'SFC','ENP','Dragon Quest III','2009-11-19'),(8,'SFC','JPN','Dragon Quest III','1996-12-06'),(9,'GBC','JPN','Dragon Quest I & II','1999-09-23'),(9,'GBC','USA','Dragon Warrior I & II','2000-09-27'),(9,'SFC','ENP','Dragon Quest I & II','2003-06-23'),(9,'SFC','JPN','Dragon Quest I & II','1993-12-18'),(11,'GBA','USA','Sonic the Hedgehog Genesis','2006-11-14'),(11,'GEN','JPN','Sonic the Hedgehog','1991-07-26'),(11,'GEN','PAL','Sonic the Hedgehog','1991-06-23'),(11,'GEN','USA','Sonic the Hedgehog','1991-06-23');
/*!40000 ALTER TABLE `game_release` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `tID` int(16) unsigned NOT NULL auto_increment,
  `short_name` char(13) NOT NULL,
  `long_name` char(32) DEFAULT NULL,
  PRIMARY KEY (`tID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (short_name,long_name) VALUES ('adventure',NULL),('arcade',NULL),('arpg','action role playing game'),('beat \`em up',NULL),
('fantasy',NULL),('fighting',NULL),('fps','first person shooter'),('hack and slash',NULL),('horror',NULL),
('jrpg','japanese role playing game'),('metroidvania',NULL),('open world',NULL),('platformer',NULL),('racing',NULL),
('rpg','role playing game'),('sci-fi',NULL),('sidescroller', NULL),('sports',NULL),('strategy',NULL),('Visual Novel',NULL);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

DROP TABLE IF EXISTS `game_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_tag` (
  `gID` int(16) unsigned NOT NULL,
  `tID` int(16) unsigned NOT NULL,
  PRIMARY KEY (`gID`,`tID`),
  KEY `tID` (`tID`),
  CONSTRAINT `game_tag_ibfk_1` FOREIGN KEY (`gID`) REFERENCES `meta_game` (`gID`),
  CONSTRAINT `game_tag_ibfk_2` FOREIGN KEY (`tID`) REFERENCES `tag` (`tID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `game_tag` WRITE;
/*!40000 ALTER TABLE `game_tag` DISABLE KEYS */;
INSERT INTO `game_tag` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),
	(8,1),(9,1),(10,1),(11,1),(1,2),(2,2),(3,2),(4,2),(5,2),(2,5),(3,5),
    (6,5),(7,5),(8,5),(9,5),(10,5),(11,5),(6,6),(7,6),(8,6),(9,6),(10,6),
    (11,6),(6,10),(7,10),(8,10),(9,10),(10,10),(11,10),(6,12),(7,12),(8,12),
    (9,12),(10,12),(11,12),(6,15),(7,15),(8,15),(9,15),(10,15),(11,15),
    (1,17),(2,17),(3,17),(4,17),(5,17),(1,13),(2,13),(3,13),(4,13),(5,13);
/*!40000 ALTER TABLE `game_tag` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `rID` char(3) NOT NULL,
  `rLongName` char(32) NOT NULL,
  PRIMARY KEY (`rID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('AUS','Australia'),('CHN','China'),('ENP','English Patch'),('JPN','Japan'),('PAL','Europe'),('USA','United States / North America'),('WLD','World / Region Free');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `sID` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `sname` char(32) NOT NULL,
  `about` text,
  PRIMARY KEY (`sID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,'Dragon Quest','Dragon Quest is a fantasy role-playing series developed by Enix (later Square-Enix). Each installment tells it\'s own story however, monsters, locations, and the rules of the world tend to stay consistent. The Dragon Quest Series art direction is led by Akira Toriyama - the author of the Dragon Ball series - so the aesthetic is very similar.'),
(2,'Final Fantasy','Final Fantasy is a fantasy role-playing series developed by Square (later Square-Enix). While the series shares similar archetypes, most installments are their own distinct stories - although their are some direct sequals. Along with Dragon Quest, the Final Fantasy series is widely considered to be one of the first JRPGs to reach global success, and from this, inspired many of the tropes seen in the genre today.'),
(3,'Super Mario', 'Super Mario is a adventure sidescroller series developed and published by Nintendo. While their were sidecrollers before Super Mario, the tight controls and physics based movement of Super Mario popularized the genre.'),
(7,'Sonic','Sonic is an adventure sidescroller series initially published by SEGA as a competitor to the Super Mario Series. The character was created as a mascot for the Genesis console, although character and world design, music, and gameplay are far above a generic mascot.'),
(8,'Metal Gear','Metal Gear is a series originally released for the MSX. One of Hideo Kojima\'s earliest successes, the series would go on to see world wide popularity from the Metal Gear Solid Franchise.'),
(10,'Poke\'mon','Poke\'mon is a series released by Nintendo. In it, you play as a tween collecting various monsters and battling them against each other, and against other trainers, to become the best poke\'mon trainer'),
(13,'Metroid','The Metroid Series is a sidecroller metroidvania. Along, with Castlevania, Metroid\'s explorative gameplay and non-linear level design inspired a genre.'),
(14,'Castlevania','Castlevania is a sidescroller metroidvania originally released for the NES. Along with Metroid, Castlevania\'s non-linear game design as you explore Dracula\'s Castle inspired a genre.');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

