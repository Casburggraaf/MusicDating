-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 192.168.56.101    Database: datingapp
-- ------------------------------------------------------
-- Server version	5.5.5-10.0.30-MariaDB-0+deb8u1

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `gebruikersnaam` varchar(45) DEFAULT NULL,
  `wachtwoord` varchar(45) DEFAULT NULL,
  `laatslogin` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'cas','9964fcf15cf03644571918538e83618148b6cc34',NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gebruiker`
--

DROP TABLE IF EXISTS `gebruiker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gebruiker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `voornaam` varchar(45) DEFAULT NULL,
  `achternaam` varchar(45) DEFAULT NULL,
  `geslacht` enum('man','vrouw','geen van bijde') DEFAULT NULL,
  `geboortedatum` date DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `wachtwoord` varchar(45) DEFAULT NULL,
  `zoekgeslacht` enum('man','vrouw','bijde') DEFAULT NULL,
  `zoekafstand` int(11) DEFAULT NULL,
  `zoekleeftijdmin` int(11) DEFAULT NULL,
  `zoekleeftijdmax` int(11) DEFAULT NULL,
  `huisnummer` int(11) DEFAULT NULL,
  `favartist1` varchar(45) DEFAULT NULL,
  `favartist2` varchar(45) DEFAULT NULL,
  `favartist3` varchar(45) DEFAULT NULL,
  `profielfoto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gebruiker`
--

LOCK TABLES `gebruiker` WRITE;
/*!40000 ALTER TABLE `gebruiker` DISABLE KEYS */;
INSERT INTO `gebruiker` VALUES (3,'Russell','Willis','man','1989-08-08',7128,'rwillis2@google.com.br','9964fcf15cf03644571918538e83618148b6cc34','man',128,29,22,44,'Queen','Guns N Roses','Kraftwerk','https://randomuser.me/api/portraits/men/3.jpg');
INSERT INTO `gebruiker` VALUES (4,'Paula','Smith','vrouw','1995-09-20',5918,'psmith3@msu.edu','9964fcf15cf03644571918538e83618148b6cc34','man',245,57,26,42,'Fleetwood Mac','Kraftwerk','U2','https://randomuser.me/api/portraits/women/4.jpg');
INSERT INTO `gebruiker` VALUES (5,'Beverly','West','man','1975-04-26',3454,'bwest4@istockphoto.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',63,31,31,65,'Fleetwood Mac','Jimi Hendrix','Prince','https://randomuser.me/api/portraits/men/5.jpg');
INSERT INTO `gebruiker` VALUES (6,'Julie','Stewart','vrouw','1998-12-14',2543,'jstewart5@oakley.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',113,52,23,19,'AC/DC','Jimi Hendrix','Heart','https://randomuser.me/api/portraits/women/6.jpg');
INSERT INTO `gebruiker` VALUES (7,'Martin','Elliott','vrouw','1995-11-18',4157,'melliott6@stanford.edu','9964fcf15cf03644571918538e83618148b6cc34','man',278,37,21,100,'The Who','Cash','Jimi Hendrix','https://randomuser.me/api/portraits/women/7.jpg');
INSERT INTO `gebruiker` VALUES (8,'Pamela','Grant','vrouw','1984-10-24',704,'pgrant7@opensource.org','9964fcf15cf03644571918538e83618148b6cc34','man',8,22,43,89,'Jonny','Talking Heads','David Bowie','https://randomuser.me/api/portraits/women/8.jpg');
INSERT INTO `gebruiker` VALUES (9,'Dennis','Cooper','vrouw','1973-05-05',9065,'dcooper8@sciencedirect.com','9964fcf15cf03644571918538e83618148b6cc34','man',173,59,36,31,'Led Zeppelin','Cash','Radiohead','https://randomuser.me/api/portraits/women/9.jpg');
INSERT INTO `gebruiker` VALUES (10,'Katherine','Price','man','1985-02-11',6826,'kprice9@spotify.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',233,62,56,88,'Zappa','Led Zeppelin','Sex Pistols','https://randomuser.me/api/portraits/women/10.jpg');
INSERT INTO `gebruiker` VALUES (11,'Evelyn','Cooper','vrouw','1992-07-13',2005,'ecoopera@amazon.co.uk','9964fcf15cf03644571918538e83618148b6cc34','vrouw',128,50,26,66,'AC/DC','Nirvana','Yeah Yeah Yeahs','https://randomuser.me/api/portraits/women/11.jpg');
INSERT INTO `gebruiker` VALUES (12,'Karen','Cox','man','1975-11-19',3123,'kcoxb@jimdo.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',16,35,19,1,'Queen','Cash','The Beatles','https://randomuser.me/api/portraits/men/12.jpg');
INSERT INTO `gebruiker` VALUES (13,'Scott','Adams','vrouw','1971-12-03',563,'sadamsc@list-manage.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',204,57,40,46,'U2','Prince','David Bowie','https://randomuser.me/api/portraits/women/13.jpg');
INSERT INTO `gebruiker` VALUES (14,'Dennis','Bennett','man','1991-12-07',8565,'dbennettd@webmd.com','9964fcf15cf03644571918538e83618148b6cc34','man',190,59,39,72,'Sex Pistols','Jonny','Radiohead','https://randomuser.me/api/portraits/men/14.jpg');
INSERT INTO `gebruiker` VALUES (15,'Lisa','Welch','vrouw','1987-05-11',6711,'lwelche@sciencedaily.com','9964fcf15cf03644571918538e83618148b6cc34','man',58,46,53,11,'Prince','Iggy Pop','Metallica','https://randomuser.me/api/portraits/women/15.jpg');
INSERT INTO `gebruiker` VALUES (16,'Carolyn','Ruiz','vrouw','1982-08-22',1508,'cruizf@samsung.com','9964fcf15cf03644571918538e83618148b6cc34','man',22,21,61,48,'Led Zeppelin','Sex Pistols','Fleetwood Mac','https://randomuser.me/api/portraits/women/16.jpg');
INSERT INTO `gebruiker` VALUES (17,'Donna','Fuller','man','1985-12-19',7362,'dfullerg@walmart.com','9964fcf15cf03644571918538e83618148b6cc34','man',12,33,61,83,'Radiohead','Velvet Underground','Velvet Underground','https://randomuser.me/api/portraits/men/17.jpg');
INSERT INTO `gebruiker` VALUES (18,'Debra','Griffin','man','1987-05-06',5070,'dgriffinh@wired.com','9964fcf15cf03644571918538e83618148b6cc34','man',288,23,62,16,'Velvet Underground','Heart','Jimi Hendrix','https://randomuser.me/api/portraits/men/18.jpg');
INSERT INTO `gebruiker` VALUES (19,'Joyce','West','man','1999-02-18',7467,'jwesti@nationalgeographic.com','9964fcf15cf03644571918538e83618148b6cc34','man',66,65,33,31,'Radiohead','The Who','Oasis','https://randomuser.me/api/portraits/women/19.jpg');
INSERT INTO `gebruiker` VALUES (20,'Nicholas','Oliver','man','1988-03-28',4323,'noliverj@homestead.com','9964fcf15cf03644571918538e83618148b6cc34','man',235,50,51,91,'Talking Heads','Led Zeppelin','Iggy Pop','https://randomuser.me/api/portraits/men/20.jpg');
INSERT INTO `gebruiker` VALUES (21,'Matthew','Nguyen','vrouw','1990-01-14',9790,'mnguyenk@craigslist.org','9964fcf15cf03644571918538e83618148b6cc34','vrouw',109,36,37,27,'Nirvana','Led Zeppelin','Fleetwood Mac','https://randomuser.me/api/portraits/women/21.jpg');
INSERT INTO `gebruiker` VALUES (22,'Shirley','Cook','vrouw','1990-08-20',5294,'scookl@theguardian.com','9964fcf15cf03644571918538e83618148b6cc34','man',198,20,37,91,'Oasis','Metallica','Kraftwerk','https://randomuser.me/api/portraits/women/22.jpg');
INSERT INTO `gebruiker` VALUES (23,'Jeffrey','Fox','man','1983-06-14',3935,'jfoxm@histats.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',32,23,45,86,'Jonny','Cash','David Bowie','https://randomuser.me/api/portraits/men/23.jpg');
INSERT INTO `gebruiker` VALUES (25,'Mary','Hawkins','man','1991-09-04',9808,'mhawkinso@walmart.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',241,31,42,36,'Jonny','The Who','Yeah Yeah Yeahs','https://randomuser.me/api/portraits/men/25.jpg');
INSERT INTO `gebruiker` VALUES (26,'Betty','Ross','vrouw','1987-09-03',4011,'brossp@eventbrite.com','9964fcf15cf03644571918538e83618148b6cc34','man',164,57,19,46,'Sex Pistols','Yeah Yeah Yeahs','Kraftwerk','https://randomuser.me/api/portraits/women/26.jpg');
INSERT INTO `gebruiker` VALUES (27,'Kathleen','Gonzales','vrouw','1974-02-18',2743,'kgonzalesq@amazon.de','9964fcf15cf03644571918538e83618148b6cc34','vrouw',216,63,26,64,'Prince','Queen','Elvis Presley','https://randomuser.me/api/portraits/women/27.jpg');
INSERT INTO `gebruiker` VALUES (28,'Albert','Crawford','vrouw','1976-08-08',4186,'acrawfordr@discuz.net','9964fcf15cf03644571918538e83618148b6cc34','man',230,21,63,23,'Jonny','The Beatles','Fleetwood Mac','https://randomuser.me/api/portraits/women/28.jpg');
INSERT INTO `gebruiker` VALUES (29,'Michelle','Rivera','man','1991-10-12',6179,'mriveras@seesaa.net','9964fcf15cf03644571918538e83618148b6cc34','man',58,24,33,91,'Zappa','Zappa','Jimi Hendrix','https://randomuser.me/api/portraits/men/29.jpg');
INSERT INTO `gebruiker` VALUES (30,'Terry','Burns','vrouw','1975-11-23',3825,'tburnst@dyndns.org','9964fcf15cf03644571918538e83618148b6cc34','vrouw',36,44,37,86,'Zappa','Zappa','David Bowie','https://randomuser.me/api/portraits/women/30.jpg');
INSERT INTO `gebruiker` VALUES (31,'Roy','Lopez','man','1981-07-19',8739,'rlopezu@samsung.com','9964fcf15cf03644571918538e83618148b6cc34','man',43,51,46,34,'Prince','Heart','The Who','https://randomuser.me/api/portraits/men/31.jpg');
INSERT INTO `gebruiker` VALUES (32,'Mildred','Coleman','vrouw','1992-08-11',4147,'mcolemanv@photobucket.com','9964fcf15cf03644571918538e83618148b6cc34','man',194,54,26,80,'Prince','Radiohead','The Beatles','https://randomuser.me/api/portraits/women/32.jpg');
INSERT INTO `gebruiker` VALUES (33,'Theresa','Howell','vrouw','1987-05-09',419,'thowellw@live.com','9964fcf15cf03644571918538e83618148b6cc34','man',182,65,29,11,'U2','Led Zeppelin','Guns N Roses','https://randomuser.me/api/portraits/women/33.jpg');
INSERT INTO `gebruiker` VALUES (34,'Laura','Rogers','vrouw','1988-10-09',6887,'lrogersx@infoseek.co.jp','9964fcf15cf03644571918538e83618148b6cc34','man',226,33,47,1,'AC/DC','Jonny','Guns N Roses','https://randomuser.me/api/portraits/women/34.jpg');
INSERT INTO `gebruiker` VALUES (35,'Richard','Patterson','vrouw','1995-01-14',2996,'rpattersony@ebay.co.uk','9964fcf15cf03644571918538e83618148b6cc34','vrouw',281,33,40,72,'Iggy Pop','Iggy Pop','Yeah Yeah Yeahs','https://randomuser.me/api/portraits/women/35.jpg');
INSERT INTO `gebruiker` VALUES (36,'Mildred','Perkins','man','1984-07-21',2273,'mperkinsz@senate.gov','9964fcf15cf03644571918538e83618148b6cc34','man',57,30,45,57,'Iggy Pop','Queen','Cash','https://randomuser.me/api/portraits/men/36.jpg');
INSERT INTO `gebruiker` VALUES (37,'Andrew','Alvarez','man','1975-03-11',6700,'aalvarez10@naver.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',151,65,62,73,'Guns N Roses','Elvis Presley','Cash','https://randomuser.me/api/portraits/men/37.jpg');
INSERT INTO `gebruiker` VALUES (38,'Bonnie','Perkins','vrouw','1978-05-11',8316,'bperkins11@example.com','9964fcf15cf03644571918538e83618148b6cc34','man',103,32,28,18,'Yeah Yeah Yeahs','Talking Heads','Velvet Underground','https://randomuser.me/api/portraits/women/38.jpg');
INSERT INTO `gebruiker` VALUES (39,'Keith','Boyd','man','1984-02-10',9533,'kboyd12@google.co.uk','9964fcf15cf03644571918538e83618148b6cc34','man',197,30,18,73,'Radiohead','Zappa','Fleetwood Mac','https://randomuser.me/api/portraits/men/39.jpg');
INSERT INTO `gebruiker` VALUES (40,'Paul','Ortiz','man','1999-02-02',4415,'portiz13@amazonaws.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',259,24,60,9,'Cash','Sex Pistols','Yeah Yeah Yeahs','https://randomuser.me/api/portraits/men/40.jpg');
INSERT INTO `gebruiker` VALUES (41,'Julie','Harper','vrouw','1999-03-14',4522,'jharper14@adobe.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',120,21,62,96,'The Beatles','AC/DC','Nirvana','https://randomuser.me/api/portraits/women/41.jpg');
INSERT INTO `gebruiker` VALUES (42,'Denise','Mitchell','man','1992-12-02',1849,'dmitchell15@delicious.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',90,19,63,60,'Led Zeppelin','Guns N Roses','Radiohead','https://randomuser.me/api/portraits/men/42.jpg');
INSERT INTO `gebruiker` VALUES (43,'Louise','Burke','man','1999-01-01',6425,'lburke16@yellowpages.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',128,53,65,39,'Elvis Presley','David Bowie','Yeah Yeah Yeahs','https://randomuser.me/api/portraits/men/43.jpg');
INSERT INTO `gebruiker` VALUES (44,'Pamela','Reid','man','1974-05-29',2839,'preid17@engadget.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',94,65,43,93,'Zappa','Cash','U2','https://randomuser.me/api/portraits/men/44.jpg');
INSERT INTO `gebruiker` VALUES (45,'Susan','Richardson','vrouw','1977-08-22',7049,'srichardson18@un.org','9964fcf15cf03644571918538e83618148b6cc34','man',174,36,37,65,'Zappa','Jimi Hendrix','Iggy Pop','https://randomuser.me/api/portraits/women/45.jpg');
INSERT INTO `gebruiker` VALUES (46,'Patricia','Duncan','vrouw','1987-07-08',3572,'pduncan19@eepurl.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',245,52,37,52,'Guns N Roses','Jonny','Yeah Yeah Yeahs','https://randomuser.me/api/portraits/women/46.jpg');
INSERT INTO `gebruiker` VALUES (47,'Ashley','Harper','man','1990-08-27',1539,'aharper1a@devhub.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',154,48,57,14,'Iggy Pop','Nirvana','Nirvana','https://randomuser.me/api/portraits/men/47.jpg');
INSERT INTO `gebruiker` VALUES (48,'Eugene','Wright','man','1977-08-28',8143,'ewright1b@privacy.gov.au','9964fcf15cf03644571918538e83618148b6cc34','man',279,48,32,19,'Zappa','Nirvana','Prince','https://randomuser.me/api/portraits/men/48.jpg');
INSERT INTO `gebruiker` VALUES (49,'Nicholas','Adams','man','1974-01-29',5091,'nadams1c@istockphoto.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',264,48,57,22,'Metallica','Yeah Yeah Yeahs','Jimi Hendrix','https://randomuser.me/api/portraits/women/49.jpg');
INSERT INTO `gebruiker` VALUES (50,'Nicholas','Palmer','vrouw','1995-11-14',2271,'npalmer1d@tmall.com','9964fcf15cf03644571918538e83618148b6cc34','man',125,42,36,99,'U2','Zappa','Iggy Pop','https://randomuser.me/api/portraits/women/50.jpg');
INSERT INTO `gebruiker` VALUES (52,'Bruce','Evans','man','1973-03-12',5260,'bevans1f@tuttocitta.it','9964fcf15cf03644571918538e83618148b6cc34','man',94,38,52,79,'Fleetwood Mac','Led Zeppelin','Kraftwerk','https://randomuser.me/api/portraits/men/52.jpg');
INSERT INTO `gebruiker` VALUES (53,'Frances','Powell','man','1987-08-22',2011,'fpowell1g@disqus.com','9964fcf15cf03644571918538e83618148b6cc34','man',84,63,55,32,'Talking Heads','Zappa','Iggy Pop','https://randomuser.me/api/portraits/men/53.jpg');
INSERT INTO `gebruiker` VALUES (54,'Jean','Harvey','vrouw','1994-12-03',3100,'jharvey1h@reference.com','9964fcf15cf03644571918538e83618148b6cc34','man',140,36,35,87,'Yeah Yeah Yeahs','Zappa','Jimi Hendrix','https://randomuser.me/api/portraits/women/54.jpg');
INSERT INTO `gebruiker` VALUES (55,'Irene','Peters','man','1994-11-27',5351,'ipeters1i@google.ru','9964fcf15cf03644571918538e83618148b6cc34','vrouw',195,31,22,47,'Jimi Hendrix','Guns N Roses','Metallica','https://randomuser.me/api/portraits/men/55.jpg');
INSERT INTO `gebruiker` VALUES (56,'Todd','Chapman','man','1983-05-13',2752,'tchapman1j@cbsnews.com','9964fcf15cf03644571918538e83618148b6cc34','man',98,20,22,46,'Zappa','Radiohead','Queen','https://randomuser.me/api/portraits/men/56.jpg');
INSERT INTO `gebruiker` VALUES (57,'Gerald','Morris','man','1989-04-22',9635,'gmorris1k@livejournal.com','9964fcf15cf03644571918538e83618148b6cc34','man',250,51,25,26,'Radiohead','The Who','Yeah Yeah Yeahs','https://randomuser.me/api/portraits/women/57.jpg');
INSERT INTO `gebruiker` VALUES (58,'Janice','Robinson','man','1997-08-28',8638,'jrobinson1l@narod.ru','9964fcf15cf03644571918538e83618148b6cc34','man',265,27,47,62,'Metallica','Fleetwood Mac','Queen','https://randomuser.me/api/portraits/men/58.jpg');
INSERT INTO `gebruiker` VALUES (59,'James','Brown','man','1986-02-01',5087,'jbrown1m@indiegogo.com','9964fcf15cf03644571918538e83618148b6cc34','man',203,64,52,1,'Fleetwood Mac','Heart','David Bowie','https://randomuser.me/api/portraits/women/59.jpg');
INSERT INTO `gebruiker` VALUES (60,'Anne','Johnston','vrouw','1976-04-28',9506,'ajohnston1n@infoseek.co.jp','9964fcf15cf03644571918538e83618148b6cc34','man',126,38,63,42,'Cash','Yeah Yeah Yeahs','Queen','https://randomuser.me/api/portraits/women/60.jpg');
INSERT INTO `gebruiker` VALUES (61,'Lori','Wood','vrouw','1975-03-04',8253,'lwood1o@ucla.edu','9964fcf15cf03644571918538e83618148b6cc34','man',103,59,53,78,'David Bowie','Iggy Pop','Yeah Yeah Yeahs','https://randomuser.me/api/portraits/women/61.jpg');
INSERT INTO `gebruiker` VALUES (62,'Joe','Lane','vrouw','1979-01-13',7859,'jlane1p@domainmarket.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',218,46,47,94,'Cash','The Who','U2','https://randomuser.me/api/portraits/women/62.jpg');
INSERT INTO `gebruiker` VALUES (63,'Arthur','Johnson','vrouw','1978-09-14',9885,'ajohnson1q@who.int','9964fcf15cf03644571918538e83618148b6cc34','man',293,57,23,8,'AC/DC','Zappa','David Bowie','https://randomuser.me/api/portraits/women/63.jpg');
INSERT INTO `gebruiker` VALUES (64,'Patricia','Robinson','man','1989-08-31',8814,'probinson1r@histats.com','9964fcf15cf03644571918538e83618148b6cc34','man',83,34,21,71,'Zappa','AC/DC','Oasis','https://randomuser.me/api/portraits/men/64.jpg');
INSERT INTO `gebruiker` VALUES (65,'Karen','Stewart','vrouw','1994-02-05',9027,'kstewart1s@4shared.com','9964fcf15cf03644571918538e83618148b6cc34','man',233,37,35,8,'Kraftwerk','Led Zeppelin','Elvis Presley','https://randomuser.me/api/portraits/women/65.jpg');
INSERT INTO `gebruiker` VALUES (66,'Johnny','Patterson','vrouw','1987-10-26',5533,'jpatterson1t@princeton.edu','9964fcf15cf03644571918538e83618148b6cc34','vrouw',228,21,39,96,'AC/DC','David Bowie','Heart','https://randomuser.me/api/portraits/women/66.jpg');
INSERT INTO `gebruiker` VALUES (67,'Doris','Cole','man','1979-03-22',6475,'dcole1u@mac.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',47,26,47,40,'Velvet Underground','Iggy Pop','Guns N Roses','https://randomuser.me/api/portraits/men/67.jpg');
INSERT INTO `gebruiker` VALUES (68,'Benjamin','Fowler','man','1992-10-27',6961,'bfowler1v@ovh.net','9964fcf15cf03644571918538e83618148b6cc34','vrouw',110,48,38,3,'Led Zeppelin','The Beatles','Sex Pistols','https://randomuser.me/api/portraits/women/68.jpg');
INSERT INTO `gebruiker` VALUES (69,'Ralph','Mason','vrouw','1975-09-11',5092,'rmason1w@shareasale.com','9964fcf15cf03644571918538e83618148b6cc34','man',273,56,29,7,'The Who','Jimi Hendrix','Guns N Roses','https://randomuser.me/api/portraits/women/69.jpg');
INSERT INTO `gebruiker` VALUES (70,'Paula','Hunter','vrouw','1983-09-10',6426,'phunter1x@amazon.de','9964fcf15cf03644571918538e83618148b6cc34','man',178,32,43,61,'Metallica','Queen','Iggy Pop','https://randomuser.me/api/portraits/women/70.jpg');
INSERT INTO `gebruiker` VALUES (71,'Jacqueline','Castillo','man','1992-08-16',1010,'jcastillo1y@moonfruit.com','9964fcf15cf03644571918538e83618148b6cc34','man',3,21,32,19,'David Bowie','Velvet Underground','Jonny','https://randomuser.me/api/portraits/men/71.jpg');
INSERT INTO `gebruiker` VALUES (72,'Virginia','Garrett','man','1976-11-25',1628,'vgarrett1z@quantcast.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',143,31,65,27,'Velvet Underground','Jimi Hendrix','Jimi Hendrix','https://randomuser.me/api/portraits/women/72.jpg');
INSERT INTO `gebruiker` VALUES (73,'Pamela','Roberts','vrouw','1975-05-02',5959,'proberts20@cam.ac.uk','9964fcf15cf03644571918538e83618148b6cc34','man',60,62,29,19,'The Who','Yeah Yeah Yeahs','Prince','https://randomuser.me/api/portraits/women/73.jpg');
INSERT INTO `gebruiker` VALUES (74,'Douglas','Richardson','vrouw','1983-11-22',5468,'drichardson21@ca.gov','9964fcf15cf03644571918538e83618148b6cc34','man',119,45,49,63,'Radiohead','Prince','AC/DC','https://randomuser.me/api/portraits/women/74.jpg');
INSERT INTO `gebruiker` VALUES (75,'George','Mcdonald','man','1989-06-28',9251,'gmcdonald22@360.cn','9964fcf15cf03644571918538e83618148b6cc34','man',223,38,54,66,'Nirvana','Oasis','Prince','https://randomuser.me/api/portraits/men/75.jpg');
INSERT INTO `gebruiker` VALUES (76,'Gloria','Watkins','man','1975-07-12',417,'gwatkins23@livejournal.com','9964fcf15cf03644571918538e83618148b6cc34','man',176,35,59,68,'Yeah Yeah Yeahs','Queen','Velvet Underground','https://randomuser.me/api/portraits/men/76.jpg');
INSERT INTO `gebruiker` VALUES (77,'Debra','Butler','man','1987-09-19',5533,'dbutler24@time.com','9964fcf15cf03644571918538e83618148b6cc34','man',170,27,47,10,'Zappa','The Beatles','Led Zeppelin','https://randomuser.me/api/portraits/men/77.jpg');
INSERT INTO `gebruiker` VALUES (78,'Arthur','Harvey','vrouw','1984-06-24',5341,'aharvey25@topsy.com','9964fcf15cf03644571918538e83618148b6cc34','man',35,35,38,84,'Elvis Presley','Jimi Hendrix','Prince','https://randomuser.me/api/portraits/women/78.jpg');
INSERT INTO `gebruiker` VALUES (79,'Gregory','Mccoy','man','1998-09-09',3638,'gmccoy26@wikipedia.org','9964fcf15cf03644571918538e83618148b6cc34','man',23,51,63,24,'Iggy Pop','Queen','David Bowie','https://randomuser.me/api/portraits/men/79.jpg');
INSERT INTO `gebruiker` VALUES (80,'Jennifer','Diaz','vrouw','1980-03-02',51,'jdiaz27@amazon.de','9964fcf15cf03644571918538e83618148b6cc34','man',22,20,34,45,'The Who','Queen','Cash','https://randomuser.me/api/portraits/women/80.jpg');
INSERT INTO `gebruiker` VALUES (81,'Gloria','Lewis','vrouw','1985-01-17',6681,'glewis28@wiley.com','9964fcf15cf03644571918538e83618148b6cc34','man',72,50,49,10,'Oasis','Zappa','Prince','https://randomuser.me/api/portraits/women/81.jpg');
INSERT INTO `gebruiker` VALUES (82,'Brian','Hughes','man','1998-10-09',511,'bhughes29@fotki.com','9964fcf15cf03644571918538e83618148b6cc34','man',251,57,31,69,'Metallica','Kraftwerk','Sex Pistols','https://randomuser.me/api/portraits/men/82.jpg');
INSERT INTO `gebruiker` VALUES (83,'Nicholas','Gonzalez','vrouw','1997-10-20',743,'ngonzalez2a@toplist.cz','9964fcf15cf03644571918538e83618148b6cc34','man',125,56,57,27,'Elvis Presley','Sex Pistols','Oasis','https://randomuser.me/api/portraits/women/83.jpg');
INSERT INTO `gebruiker` VALUES (84,'Ruby','Sanchez','man','1976-12-26',1248,'rsanchez2b@sciencedirect.com','9964fcf15cf03644571918538e83618148b6cc34','man',256,59,50,73,'Sex Pistols','Metallica','AC/DC','https://randomuser.me/api/portraits/men/84.jpg');
INSERT INTO `gebruiker` VALUES (85,'Ernest','Watson','man','1976-12-09',8367,'ewatson2c@samsung.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',201,44,56,7,'Queen','Heart','Jonny','https://randomuser.me/api/portraits/women/85.jpg');
INSERT INTO `gebruiker` VALUES (86,'Matthew','Harper','vrouw','1997-03-14',1977,'mharper2d@hhs.gov','9964fcf15cf03644571918538e83618148b6cc34','man',288,52,54,86,'Elvis Presley','Zappa','AC/DC','https://randomuser.me/api/portraits/women/86.jpg');
INSERT INTO `gebruiker` VALUES (87,'Henry','Garrett','man','1988-08-29',6096,'hgarrett2e@e-recht24.de','9964fcf15cf03644571918538e83618148b6cc34','vrouw',179,40,65,48,'Jonny','Elvis Presley','Elvis Presley','https://randomuser.me/api/portraits/men/87.jpg');
INSERT INTO `gebruiker` VALUES (88,'John','Thomas','man','1976-12-13',9019,'jthomas2f@hao123.com','9964fcf15cf03644571918538e83618148b6cc34','man',12,18,24,6,'Radiohead','Guns N Roses','Kraftwerk','https://randomuser.me/api/portraits/men/88.jpg');
INSERT INTO `gebruiker` VALUES (89,'Kathy','Hayes','man','1986-12-12',5598,'khayes2g@census.gov','9964fcf15cf03644571918538e83618148b6cc34','man',42,23,20,44,'Yeah Yeah Yeahs','Sex Pistols','Queen','https://randomuser.me/api/portraits/men/89.jpg');
INSERT INTO `gebruiker` VALUES (90,'Steve','Bennett','man','1996-10-06',3707,'sbennett2h@ed.gov','9964fcf15cf03644571918538e83618148b6cc34','man',276,65,42,81,'Sex Pistols','Fleetwood Mac','Cash','https://randomuser.me/api/portraits/men/90.jpg');
INSERT INTO `gebruiker` VALUES (91,'Adam','Mason','vrouw','1994-09-01',7469,'amason2i@wsj.com','9964fcf15cf03644571918538e83618148b6cc34','man',44,63,30,84,'Radiohead','David Bowie','Radiohead','https://randomuser.me/api/portraits/women/91.jpg');
INSERT INTO `gebruiker` VALUES (92,'Patrick','Greene','man','1986-10-15',6577,'pgreene2j@npr.org','9964fcf15cf03644571918538e83618148b6cc34','vrouw',104,40,36,84,'Jimi Hendrix','Jimi Hendrix','Yeah Yeah Yeahs','https://randomuser.me/api/portraits/men/92.jpg');
INSERT INTO `gebruiker` VALUES (93,'Cynthia','Reed','man','1995-03-15',8652,'creed2k@ameblo.jp','9964fcf15cf03644571918538e83618148b6cc34','man',269,48,22,33,'Fleetwood Mac','Elvis Presley','Prince','https://randomuser.me/api/portraits/men/93.jpg');
INSERT INTO `gebruiker` VALUES (94,'Debra','Owens','vrouw','1971-02-14',5732,'dowens2l@desdev.cn','9964fcf15cf03644571918538e83618148b6cc34','vrouw',92,18,19,35,'David Bowie','Prince','Zappa','https://randomuser.me/api/portraits/women/94.jpg');
INSERT INTO `gebruiker` VALUES (95,'Jane','Matthews','man','1999-03-13',465,'jmatthews2m@phpbb.com','9964fcf15cf03644571918538e83618148b6cc34','man',64,58,53,50,'AC/DC','Elvis Presley','David Bowie','https://randomuser.me/api/portraits/men/95.jpg');
INSERT INTO `gebruiker` VALUES (96,'Heather','Hicks','man','1987-05-15',158,'hhicks2n@typepad.com','9964fcf15cf03644571918538e83618148b6cc34','vrouw',80,43,60,93,'The Beatles','Sex Pistols','Elvis Presley','https://randomuser.me/api/portraits/men/96.jpg');
INSERT INTO `gebruiker` VALUES (97,'Wanda','Reyes','vrouw','1997-07-19',738,'wreyes2o@bbc.co.uk','9964fcf15cf03644571918538e83618148b6cc34','man',122,55,49,62,'Jonny','Yeah Yeah Yeahs','Sex Pistols','https://randomuser.me/api/portraits/women/97.jpg');
INSERT INTO `gebruiker` VALUES (98,'Charles','Hawkins','man','1978-03-05',749,'chawkins2p@gravatar.com','9964fcf15cf03644571918538e83618148b6cc34','man',248,30,64,95,'Guns N Roses','Zappa','Talking Heads','https://randomuser.me/api/portraits/men/98.jpg');
INSERT INTO `gebruiker` VALUES (99,'Gloria','Fisher','man','1990-11-11',9391,'gfisher2q@sciencedaily.com','9964fcf15cf03644571918538e83618148b6cc34','man',256,42,43,71,'U2','Radiohead','Sex Pistols','https://randomuser.me/api/portraits/men/99.jpg');
/*!40000 ALTER TABLE `gebruiker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-11 14:14:34
