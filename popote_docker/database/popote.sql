-- MySQL dump 10.13  Distrib 5.5.62, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: popote
-- ------------------------------------------------------
-- Server version	5.5.62-0ubuntu0.14.04.1

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
-- Current Database: `popote`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `popote` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `popote`;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie` (
  `id_cat` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'(vide)',''),(2,'plat principal','plat'),(3,'dessert','pour bien finir'),(4,'entrée','pour bien commencer vos repas'),(6,'apéro','avant de commencer'),(7,'Brunch','Saisir description');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `commentaire_par_membre`
--

DROP TABLE IF EXISTS `commentaire_par_membre`;
/*!50001 DROP VIEW IF EXISTS `commentaire_par_membre`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `commentaire_par_membre` (
  `titre` tinyint NOT NULL,
  `nom` tinyint NOT NULL,
  `prenom` tinyint NOT NULL,
  `message` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentaires` (
  `id_commentaire` int(11) NOT NULL AUTO_INCREMENT,
  `id_recette` int(11) NOT NULL,
  `id_membre` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  PRIMARY KEY (`id_commentaire`),
  KEY `idx_fk_id_recette_commentaires` (`id_recette`),
  KEY `idx_fk_id_membre_commentaires` (`id_membre`),
  CONSTRAINT `fk_id_membre_commentaires` FOREIGN KEY (`id_membre`) REFERENCES `membres` (`id_membre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_recette_commentaires` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id_recette`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentaires`
--

LOCK TABLES `commentaires` WRITE;
/*!40000 ALTER TABLE `commentaires` DISABLE KEYS */;
/*!40000 ALTER TABLE `commentaires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constituants`
--

DROP TABLE IF EXISTS `constituants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constituants` (
  `id_constituant` int(11) NOT NULL AUTO_INCREMENT,
  `id_recette` int(11) NOT NULL,
  `id_ingredient` int(11) NOT NULL,
  `quantite` varchar(50) NOT NULL,
  `rang` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_constituant`),
  KEY `idx_fk_id_recette_constituants` (`id_recette`),
  KEY `idx_fk_id_ingredient_constituants` (`id_ingredient`),
  CONSTRAINT `fk_id_ingredient_constituants` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredients` (`id_ingredient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_recette_constituants` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id_recette`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constituants`
--

LOCK TABLES `constituants` WRITE;
/*!40000 ALTER TABLE `constituants` DISABLE KEYS */;
INSERT INTO `constituants` VALUES (155,34,58,'4',1),(156,34,53,'125g',2),(157,34,12,'80g',3),(158,34,46,'80g',4),(159,34,69,'25cl',5),(160,34,22,'1sachet',6),(161,34,4,'1 pincée ',7),(162,34,74,'500g',8),(168,32,51,'1',1),(170,32,46,'100g',2),(171,32,4,'1 pinsee',3),(172,22,23,'200 g',1),(173,22,53,'140 g',2),(174,22,12,'90 g',3),(175,22,46,'70 g',4),(176,22,54,'4',5),(177,22,59,'1 cueillere',6),(178,23,69,'1/2 l',1),(179,23,22,'1sachet',2),(180,23,61,'4',3),(181,23,53,'50g',4),(182,20,12,'100g',1),(183,20,53,'100g',2),(184,20,4,'1 pincée ',3),(185,20,71,'4',4),(186,20,46,'100g',5),(187,20,58,'2',6),(188,20,14,'1/2 sachet',7),(189,21,58,'2',1),(190,21,53,'100g',2),(191,21,22,'1sachet',3),(192,21,55,'3 cuillère à soupe',4),(193,21,12,'75g',5),(194,21,56,'50g',6),(195,21,14,'1/2 sachet',7),(196,25,12,'250g',1),(197,25,66,'125g',2),(198,25,4,'1 pincée ',3),(199,25,45,'1/2verre',4),(200,28,58,'10',1),(201,28,53,'200g',2),(202,28,12,'160g',3),(203,28,69,'1l',4),(204,28,75,'5cl',5),(205,28,16,'1cuillère à soupe',6),(206,28,70,'250g à 300g',7),(207,31,12,'200g',1),(208,31,58,'3',2),(209,31,53,'200g',3),(210,31,46,'100g',4),(211,31,57,'100g',5),(212,31,14,'1/2 sachet',6),(213,31,16,'1cuillere à café ',7),(214,31,69,'3dl (demi verre)',8),(215,33,71,'1kl',1),(216,33,53,'100g',2),(217,33,72,'150g',3),(218,33,46,'150g',4),(219,33,12,'150g',5),(220,24,68,'1',1),(221,24,64,'4',2),(222,24,53,'150g',3),(223,24,66,'100g',4),(224,24,58,'6',5),(225,24,67,'50g',6),(226,36,76,'1kl',1),(227,36,21,'2',2),(229,36,77,'4',4),(230,36,78,'20cl',5),(231,32,4,'',4),(232,36,79,'',6),(233,36,12,'',6),(234,36,4,'',7),(235,36,5,'',8),(236,36,80,'',9),(237,37,81,'2',1),(238,37,46,'70g',2),(239,37,6,'200g',3),(241,37,82,'3',4),(242,37,14,'1c a soupe',5),(243,37,12,'170g',6);
/*!40000 ALTER TABLE `constituants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredients` (
  `id_ingredient` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `couleur` varchar(50) NOT NULL,
  `type` varchar(11) NOT NULL COMMENT 'Legumes, condiment ...pas utilise dans la 1ere version',
  `rang` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'poireau','vert','legume',NULL),(2,'pomme de terre','jaune','legume',NULL),(3,'carotte','rouge','legume',NULL),(4,'sel','blanc','condiments',NULL),(5,'poivre','noir','condiments',NULL),(6,'sucre en poudre','blanc','??',NULL),(7,'sucre roux en poudre ','roux','??',NULL),(8,'pomme','jaune','fruit',NULL),(9,'crème glacée Carte d\'Or Chocolat Noir','','',NULL),(10,'yaourt nature','','',NULL),(11,'huile d\'olive','','',NULL),(12,'farine','','',NULL),(13,'œuf','','',NULL),(14,'levure chimique','','',NULL),(15,'orange non traitée','','',NULL),(16,'extrait de vanille','','',NULL),(17,'filet mignon de porc','','',NULL),(18,'pâte feuillettée (en rouleau)','','',NULL),(19,'tranche de jambon','','',NULL),(20,'gruyère rapé','','',NULL),(21,'oignon','','',NULL),(22,'Sucre vanillé','','',NULL),(23,'chocolat noir','','',NULL),(24,'citron','','',NULL),(25,'pâte brisée','','',NULL),(26,'crème fraiche épaisse','','',NULL),(27,'concentré de tomate','','',NULL),(28,'thon blanc','','',NULL),(29,'herbes de Provence','','',NULL),(30,'fromage râpé','','',NULL),(31,'pomme de terre','','',NULL),(32,'lardons fumées','','',NULL),(33,'oignons émincés','','',NULL),(34,'reblechon','','',NULL),(35,'ail','','',NULL),(36,'pavé de saumon','','',NULL),(37,'mozzarella','','',NULL),(38,'tomate','','',NULL),(39,'basilic','','',NULL),(40,'olive noire','','',NULL),(41,'saumon fumé','','',NULL),(42,'courgette','','',NULL),(43,'aneth','','',NULL),(44,'menthe','','',NULL),(45,'eau','','',NULL),(46,'beurre','','',NULL),(47,'curry','','',NULL),(48,'cumin','','',NULL),(49,'sel de Guérande','','',NULL),(50,'crème fraiche liquide','','',NULL),(51,'Poulet','blanc','viande',NULL),(53,'Sucre','','',NULL),(54,' oeufs ','','',NULL),(55,'Eau chaude','','',NULL),(56,'Maizena ','','',NULL),(57,'Chocolat ','','',NULL),(58,'Oeufs','','',NULL),(59,'Rhum','','',NULL),(60,'Iait','','',NULL),(61,'Jaune d oeuf','','',NULL),(62,'Sucre fin','','',NULL),(63,'Pate brisé ','','',NULL),(64,'citron non traité ','','',NULL),(65,'Citrons  non traités ','','',NULL),(66,'beurre mou','','',NULL),(67,'Sucre glace','','',NULL),(68,'Pate à  tarte','','',NULL),(69,'Lait','','',NULL),(70,'Pruneaux','','',NULL),(71,'pommes','','',NULL),(72,'Cassonade','','',NULL),(73,'Cerises noir','','',NULL),(74,'Cerises noires','','',NULL),(75,'Rhum brun','','',NULL),(76,'Jarret de veau','','',NULL),(77,'Grosse tomate','','',NULL),(78,'Vin blanc','','',NULL),(79,'huile d olive','','',NULL),(80,'Persil','','',NULL),(81,'Orange','','',NULL),(82,'jaunes d\'oeuf','','',NULL);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ingredients_par_recette`
--

DROP TABLE IF EXISTS `ingredients_par_recette`;
/*!50001 DROP VIEW IF EXISTS `ingredients_par_recette`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ingredients_par_recette` (
  `titre` tinyint NOT NULL,
  `nom` tinyint NOT NULL,
  `quantite` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `membres`
--

DROP TABLE IF EXISTS `membres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membres` (
  `id_membre` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `type` varchar(10) NOT NULL COMMENT 'admin ou user',
  `valid` tinyint(1) DEFAULT NULL COMMENT 'autorisation login d''un user',
  PRIMARY KEY (`id_membre`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membres`
--

LOCK TABLES `membres` WRITE;
/*!40000 ALTER TABLE `membres` DISABLE KEYS */;
INSERT INTO `membres` VALUES (1,'bfr','3paul2fan','Froger','Bruno','bruno.froger@orange.com','admin',1),(10,'bfr2','3paul2fan','Froger','Bruno','bruno.froger2@wanadoo.fr','admin',0),(11,'_popote','lmdpdp','popote','user par defaut','','admin',0),(12,'Fanfan','fanfan','Ozan','Francoise','fanfan72000@gmail.com ','user',1),(14,'moi','moi','toto','tit','bruno.froger93@gmail.com','user',0);
/*!40000 ALTER TABLE `membres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id_photo` int(11) NOT NULL AUTO_INCREMENT,
  `id_recette` int(11) NOT NULL,
  `lien` varchar(100) NOT NULL,
  PRIMARY KEY (`id_photo`),
  KEY `idx_fk_id_recette_photo` (`id_recette`),
  CONSTRAINT `fk_id_recette_photo` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id_recette`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,32,'bfr_bfr_soupe.jpg'),(2,37,'Fanfan_IMG_20181216_185822.jpg'),(3,22,'Fanfan_IMG_20181216_202136.jpg');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `photos_par_recette`
--

DROP TABLE IF EXISTS `photos_par_recette`;
/*!50001 DROP VIEW IF EXISTS `photos_par_recette`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `photos_par_recette` (
  `titre` tinyint NOT NULL,
  `lien` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `preferees`
--

DROP TABLE IF EXISTS `preferees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferees` (
  `id_preferee` int(11) NOT NULL AUTO_INCREMENT,
  `id_recette` int(11) NOT NULL,
  `id_membre` int(11) NOT NULL,
  PRIMARY KEY (`id_preferee`),
  KEY `fk_id_recette_preferees_idx` (`id_recette`),
  KEY `fk_id_membre_preferees_idx` (`id_membre`),
  CONSTRAINT `fk_id_membre_preferees` FOREIGN KEY (`id_membre`) REFERENCES `membres` (`id_membre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_recette_preferees` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id_recette`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferees`
--

LOCK TABLES `preferees` WRITE;
/*!40000 ALTER TABLE `preferees` DISABLE KEYS */;
INSERT INTO `preferees` VALUES (1,33,12);
/*!40000 ALTER TABLE `preferees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `recette_par_membre`
--

DROP TABLE IF EXISTS `recette_par_membre`;
/*!50001 DROP VIEW IF EXISTS `recette_par_membre`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `recette_par_membre` (
  `titre` tinyint NOT NULL,
  `nom` tinyint NOT NULL,
  `prenom` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `recettes`
--

DROP TABLE IF EXISTS `recettes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recettes` (
  `id_recette` int(11) NOT NULL AUTO_INCREMENT,
  `id_membre` int(11) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `nb_pers` int(11) NOT NULL,
  `cat_prix` varchar(30) DEFAULT NULL,
  `cat_diff` varchar(30) DEFAULT NULL,
  `note` int(11) DEFAULT NULL,
  `somme_notes` int(11) DEFAULT NULL,
  `nb_votes` int(11) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `preparation` varchar(100) NOT NULL,
  `cuisson` varchar(100) NOT NULL,
  `conseil` varchar(1000) NOT NULL,
  `id_cat` int(11) DEFAULT NULL,
  `id_ss_cat` int(11) DEFAULT NULL,
  `publication` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'indicateur de publication d''une recette \n= false la recette n''est pas validée par l''admin\n= true la recette a eu l''approbation de l''admin et peut être vue par tous',
  PRIMARY KEY (`id_recette`),
  UNIQUE KEY `titre_UNIQUE` (`titre`),
  KEY `idx_fk_id_membre_recettes` (`id_membre`),
  KEY `idx_fk_id_categorie_recettes` (`id_cat`),
  KEY `idx_fk_id_ss_categorie_recettes` (`id_ss_cat`),
  CONSTRAINT `fk_id_categorie_recettes` FOREIGN KEY (`id_cat`) REFERENCES `categorie` (`id_cat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_membre_recettes` FOREIGN KEY (`id_membre`) REFERENCES `membres` (`id_membre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_ss_categorie_recettes` FOREIGN KEY (`id_ss_cat`) REFERENCES `sous_categorie` (`id_ss_cat`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recettes`
--

LOCK TABLES `recettes` WRITE;
/*!40000 ALTER TABLE `recettes` DISABLE KEYS */;
INSERT INTO `recettes` VALUES (20,12,'Gateau Anna',6,'Peu Cher (1/5)','Super débutant (0/5)',0,0,0,'Dans un saladier, faites une fontaine avec la farine , le sucre et le sel. Ajoutez les oeufs entiers et le beurre fondu. Melangez soigneusement et ajoutez la levure et les pommes pelées et coupées en petits dés.Versez dans un moule rond beurre et faites cuire au four th 7 pendant 30 mm environ. Demoulez et servez tiede.','15mn','30mn','Servir avec une boule de glace à la vanille ou de la chantilly.',3,6,1),(21,12,'Biscuit  fin ',1,'Peu Cher (1/5)','Super débutant (0/5)',0,0,0,'Battre au fouet les 2 jaunes d oeufs  avec ,100g de sucre ,1 sachet de sucre vanillé et 3 cuillère à soupe d eau chaude. Ajoutez les 75g de farine,  50g de maizena et un demi sachet de levure (peut remplacer la maizena par la farine ). Battre les blancs en neige ferme et les incorporer à la préparation. Mélanger délicatement. Mettre la pate dans un moule à manqué beurré. Faire cuire à four moyen (th 5-6) pendant 20 à 25 mn. Le soupoudrer de sucre glace quand il sera froid. Le servir avec une salade de fruit, une mousse au chocolat etc.... où le couper en 2 et mettre des fraises et de la chantilly, etc.....','15 mn ','20 à 25 mn','',3,6,1),(22,12,'Gateau au chocolat',1,'Très Abordable (2/5)','Débutant expérimenté (2/5)',0,0,0,'Casser les 3/4 de la tablette de chocolat, le mettre à fondre avec le beurre, à feu très doux. Quand le chocolat est froid ,mettre les jaunes d\'oeufs un à un, puis la farine , le sucre et le rhum. Battre les blancs d\'oeufs en neige et les mettre dans la préparation. Mettre dans un moule à manqué et enfourner dans un four à feu doux environ 50mn. A la sortie du four glacer avec le reste du chocolat (fondre le chocolat avec un peu d eau et napper le gateau). Servir avec une creme anglaise où une salade d\'orange','30mn','50mn','Mettre surtout les jaunes d\'oeufs dans le chocolat froid sinon risque de les cuire',3,6,1),(23,12,'Creme anglaise',4,'Très Abordable (2/5)','Expert débutant (3/5)',0,0,0,'Faites  bouillir le  lait  avec  le  sucre  vanillé dans une casserole à fond épais. Dans un saladier battez les jaunes d\'oeufs et le sucre fin jusqu à ce que  le  mèlange blanchisse et devienne mousseux.  Versez le lait bouillant sur les oeufs en tournant vivement. Renverser le mèlange obtenu dans la casserole. Faites épaissir la crème sur feu doux en remuant sans arrêt. Dès que celle ci nappe la cuillère ,retirez du feu avant ébullition. Versez dans une jatte laissez refroidir.','8mn','7mn','Si vous  faites trop cuir la crème, elle aura un aspect caillé,la mettre dans une bouteille plastique ,fermer et secouer énergiquement. ',3,7,1),(24,12,'Tarte au citron meringuée',8,'Cher (3/5)','Expert débutant (3/5)',0,0,0,'Preparez la pâte à tarte  (voir la recette ). Graissez un moule à  tarte, étalez la pâte ,piquez la,cuire à four chaud 200°(th5) 20 à 25mn. Lassez refroidir. Dans un saladier  mettre 2 jus de citrons, le zeste d un citron,le sucre,le beurre coupé en morceaux, 3 oeufs entiers et 3 jaunes d\'oeuf (les blans seront utilisés  pour la meringue). Montez les 3 blancs en neige très ferme puis mettre le sucre glace. Versez la crème au citron sur la pate, étalez la meringue sur la crème puis mettre au four à 180° jusqu à  les blancs brunissent.','30mn','40mn','',3,6,1),(25,12,'Pate à  tarte',8,'Très Abordable (2/5)','Débutant expérimenté (2/5)',0,0,0,'Mettre dans un  saladier la farine, le beurre coupé en morceaux, le sel ,mélangez afin d\'obtenir une poudre. Ensuite mettre l\'eau et faire une boule. Laissez repose(une petite heure).','15mn','','',3,9,1),(28,12,'Far breton',10,'Cher (3/5)','Débutant expérimenté (2/5)',0,0,0,'Dans  un saladier battre les oeufs, ajouter le sucre, la farine, le lait tiède,le rhum et l\'extrait de vanille, les uns après les autres. Mettre les pruneaux dans un plat beurré et verser la préparation dessus, mettre au four à 175°environ 1h.','15 mn ','1henviron (th175°)','',3,6,1),(31,12,'Marbré ',8,'Très Abordable (2/5)','Débutant expérimenté (2/5)',0,0,0,'Travaillez le beurre avec le sucre. Mettre les jaunes d\'oeufs, la farine, la levure. Battres les blancs en neige et les mettre dans la préparation. Séparez la pâte en deux, dans une mettre la vanille ou le zeste de citron et dans l autre le chocolat fondu. Mettre en alternance la pâte  à  la vanille  et celle au chocolat dans un moule à  cake. Enfournez 1h th3 ou à  160°. Laissez refroidir coupez en tranche et servir avec une creme anglaise ou une salade d orange.','30mn','1h (th3)','On peut mettre un zeste d\'un citron à la place  de l\' extrait de vanille.',3,6,1),(32,1,'test',1,'Gratuit (0/5)','Super débutant (0/5)',0,0,0,'','','','',2,3,0),(33,12,'Crumble de pommes',6,'Très Abordable (2/5)','Débutant expérimenté (2/5)',0,0,0,'Epluchez les pommes ,couper en quartier ,les mettre dans un plat beurré allant au four et soupoudrez de sucre. Dans un saladier mettre le beurre coupé  en morceaux, le sucre roux (cassonade) et la farine,  émiettez ce mélange pour qu il devienne sableux,versez le sur les pommes. Faites cuire.  Si vous ne le faites pas avec du beurre salé mettre une pincée  de sel dans la pâte. ','15mn','30mn(180°à 200°)','On peut remplacer 1/3 des pommes par des framboises. Peut aussi faire ce crumble avec des prunes. Dans le crumble aux pommes on peut mettre 1c à café de cannelle en poudre. ',3,6,1),(34,12,'Clafoutis ',8,'Très Abordable (2/5)','Débutant expérimenté (2/5)',0,0,0,'Battez les oeufs en omelette dans une jatte, ajoutez 1 pincée de sel et le sucre. Mélangez bien. Tamisez la farine et versez la en pluie sur les oeufs. Mélangez jusqu\'à consistance lisse. Faites fondre 60g de beurre et ajoutez le à la pâte quand il est un peu refroidi. Ajoutez lelait pour délayer. Beurrez un plat ,mettre les cerises lavées et écoutées. Versez la pâte sur les fruits et mettre sur le dessus quelques noisettes  de beurres. Faites cuire au four à 180°,200°, jusqu\'à ce que le dessus commence à dorer. Poudrez de sucre vanillé et servez.','20mn','45mn (180°à 200°)','On peut mettre d autres fruits que les cerises. Le sucre vanillé peut etre mis dans la pâte ou au dessus comme dans la recette. Peut diminuer l apport de beurre.',3,6,1),(35,10,'ma recette',1,'Gratuit (0/5)','Super débutant (0/5)',0,0,0,'','','','',1,1,0),(36,12,'Osso bucco',6,'Cher (3/5)','Débutant expérimenté (2/5)',0,0,0,'','30mn','1h40','',2,2,1),(37,12,'Gateau à l orange (Espagne)',8,'Peu Cher (1/5)','Débutant expérimenté (2/5)',0,0,0,'Prélever le zeste de 2 oranges et le jus. \r\nDans un saladier, mélanger 60g de beurre en pommade et le sucre, ajouter les jaunes d’œufs, le jus d\'orange (avec la pulpe) et 2/3 des zestes d\'oranges. \r\nMélanger la farine et la levure et incorporez le mélange à la préparation précédente. \r\nVerser la pâte obtenue dans un plat à cake ou à manqué et cuire à thermostat 5 (150 °) pendant 40 min. \r\n\r\nOn peut faire des zestes confits, dans ce cas, mettre dans une casserole 50g de sucre, le reste des zestes et 3cl d\'eau. \r\nSortir le gâteau du four, laisser refroidir et saupoudrer de sucre glace. \r\nDéposer les zestes d\'orange confits sur le gâteau et servir. ','20 min','40 min','',3,6,1);
/*!40000 ALTER TABLE `recettes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sous_categorie`
--

DROP TABLE IF EXISTS `sous_categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sous_categorie` (
  `id_ss_cat` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `id_cat` int(11) NOT NULL,
  PRIMARY KEY (`id_ss_cat`),
  KEY `idx_fk_id_categorie_ss_cat` (`id_cat`),
  CONSTRAINT `fk_id_categorie_ss_cat` FOREIGN KEY (`id_cat`) REFERENCES `categorie` (`id_cat`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sous_categorie`
--

LOCK TABLES `sous_categorie` WRITE;
/*!40000 ALTER TABLE `sous_categorie` DISABLE KEYS */;
INSERT INTO `sous_categorie` VALUES (1,'(vide)','',1),(2,'viande','viande',2),(3,'poisson','poisson',2),(4,'glace','glace',3),(6,'gateau','gateau',3),(7,'creme','creme',3),(9,'tarte','tarte',3),(10,'salade','salade',4),(11,'entree froide','entree froide',4),(12,'entree chaude','entree chaude',4),(13,'cocktail','cocktail',6),(14,'toast','toast',6),(15,'Tarte','Tarte',4),(16,'Mousse','Mousse',3),(17,'Soufflet','Soufflet',2),(18,'Soufflet','Soufflet',3),(19,'Soufflet','Soufflet',4),(20,'Salade','Salade',3);
/*!40000 ALTER TABLE `sous_categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `popote`
--

USE `popote`;

--
-- Final view structure for view `commentaire_par_membre`
--

/*!50001 DROP TABLE IF EXISTS `commentaire_par_membre`*/;
/*!50001 DROP VIEW IF EXISTS `commentaire_par_membre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`bruno`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `commentaire_par_membre` AS select `recettes`.`titre` AS `titre`,`membres`.`nom` AS `nom`,`membres`.`prenom` AS `prenom`,`commentaires`.`message` AS `message` from ((`commentaires` join `recettes` on((`commentaires`.`id_recette` = `recettes`.`id_recette`))) join `membres` on((`commentaires`.`id_membre` = `membres`.`id_membre`))) order by `membres`.`nom` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ingredients_par_recette`
--

/*!50001 DROP TABLE IF EXISTS `ingredients_par_recette`*/;
/*!50001 DROP VIEW IF EXISTS `ingredients_par_recette`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`bruno`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ingredients_par_recette` AS select `recettes`.`titre` AS `titre`,`ingredients`.`nom` AS `nom`,`constituants`.`quantite` AS `quantite` from ((`constituants` join `ingredients` on((`constituants`.`id_ingredient` = `ingredients`.`id_ingredient`))) join `recettes` on((`constituants`.`id_recette` = `recettes`.`id_recette`))) order by `constituants`.`id_recette` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `photos_par_recette`
--

/*!50001 DROP TABLE IF EXISTS `photos_par_recette`*/;
/*!50001 DROP VIEW IF EXISTS `photos_par_recette`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`bruno`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `photos_par_recette` AS select `recettes`.`titre` AS `titre`,`photos`.`lien` AS `lien` from (`photos` join `recettes` on((`photos`.`id_recette` = `recettes`.`id_recette`))) order by `recettes`.`titre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recette_par_membre`
--

/*!50001 DROP TABLE IF EXISTS `recette_par_membre`*/;
/*!50001 DROP VIEW IF EXISTS `recette_par_membre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`bruno`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `recette_par_membre` AS select `recettes`.`titre` AS `titre`,`membres`.`nom` AS `nom`,`membres`.`prenom` AS `prenom` from (`recettes` join `membres` on((`recettes`.`id_membre` = `membres`.`id_membre`))) order by `membres`.`nom` */;
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

-- Dump completed on 2020-11-13 15:17:03
