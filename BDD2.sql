-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: reservation_salle
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `creneau`
--

DROP TABLE IF EXISTS `creneau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `creneau` (
  `numero_creneau` int(11) NOT NULL AUTO_INCREMENT,
  `heure_debut` time DEFAULT NULL,
  `heure_fin` time DEFAULT NULL,
  PRIMARY KEY (`numero_creneau`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creneau`
--

LOCK TABLES `creneau` WRITE;
/*!40000 ALTER TABLE `creneau` DISABLE KEYS */;
INSERT INTO `creneau` VALUES (1,'08:30:00','10:00:00'),(2,'08:30:00','10:00:00'),(3,'10:30:00','12:00:00'),(4,'13:30:00','15:00:00'),(5,'15:15:00','16:45:00'),(6,'17:00:00','18:30:00');
/*!40000 ALTER TABLE `creneau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservation` (
  `id_utilisateur` int(11) NOT NULL,
  `numero_reservation` varchar(20) NOT NULL,
  `id_salle_creneau` int(11) NOT NULL,
  `date_reservation` date NOT NULL,
  PRIMARY KEY (`id_utilisateur`,`id_salle_creneau`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salle`
--

DROP TABLE IF EXISTS `salle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `salle` (
  `numero_salle` char(4) NOT NULL,
  `nombre_place` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero_salle`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salle`
--

LOCK TABLES `salle` WRITE;
/*!40000 ALTER TABLE `salle` DISABLE KEYS */;
INSERT INTO `salle` VALUES ('S012',8),('S013',10),('S014',15),('S101',8),('S102',10),('S103',8),('S108',10),('S202',12),('S204',10),('S206',10),('S205',5);
/*!40000 ALTER TABLE `salle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salle_creneau`
--

DROP TABLE IF EXISTS `salle_creneau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `salle_creneau` (
  `idsalle_creneau` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `numero_salle` char(4) NOT NULL,
  `numero_creneau` int(11) NOT NULL,
  `etat` enum('disponible','indisponible') NOT NULL DEFAULT 'disponible',
  PRIMARY KEY (`idsalle_creneau`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salle_creneau`
--

LOCK TABLES `salle_creneau` WRITE;
/*!40000 ALTER TABLE `salle_creneau` DISABLE KEYS */;
/*!40000 ALTER TABLE `salle_creneau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_utilisateur` varchar(100) NOT NULL,
  `prenom_utilisateur` varchar(100) NOT NULL,
  `adresse_mail` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `mdp` varchar(200) NOT NULL,
  `mdpclaire` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'gtgt','gre','rre','rege','0812aa603826801d8b872c5bb2c6b40d',NULL),(2,'Bourdon','Didier','dbourdon@gmail.com','dbourdon','33948d0ba213753a50e0ebe678286932',NULL),(3,'Daudet','Alphonse','adaudet@gmail.com','adaudet','eadcbe5c3645066b3979a6982f9ebe12',NULL),(4,'de Balzac','Honor&eacute;','hdebalzac@gmail.com','hdebalzac','52f44598b8d8726c8aaafe4fdd49925c',NULL),(5,'Hugo','Victor','vhugo@gmail.com','vhugo','8fb9994f3fb799144c3d3a8c0924732c',NULL),(6,'Lecoq','Yves','ylecoq@gmail.com','ylecoq','89c21fa0291b63cc5064159a3dc62224',NULL),(7,'Miraglia','Michael','mmiraglia@gmail.com','mmiraglia','ef3523c4085981e754cc8f3488cfb90f',NULL),(8,'Nollevaux','Sebastien','snollevaux@gmail.com','snollevaux','fd15d4393749bd4919a90cf5171faa3d',NULL),(9,'Pirette','francois','fpirette@gmail.com','fpirette','a67294b3a6b96efe1eb3ebd3af729e19',NULL),(10,'Saintclair','anne','asaintclair@gmail.com','asaintclair','4e603a89daff9af2339b07fb4029d2bf',NULL),(11,'Vennes','jules','jvennes@gmail.com','jvennes','d3aa5080dcee8e43af7e458716567f43',NULL),(12,'Zalo','emile','ezola@gmail.com','ezola','a54a341e52ab33af7c972adc4d639c68',NULL);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-09 12:02:47
