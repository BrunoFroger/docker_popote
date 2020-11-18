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
INSERT INTO `membres` VALUES (1,'admin','nimda','admin','user par defaut','','admin',0);
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
