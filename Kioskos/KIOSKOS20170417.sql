-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: KIOSKOS
-- ------------------------------------------------------
-- Server version	5.6.25

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
-- Table structure for table `EMPLEADO`
--

DROP TABLE IF EXISTS `EMPLEADO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLEADO` (
  `no_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `no_emp_sup` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `CP` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `nombre_kiosko` varchar(45) NOT NULL,
  PRIMARY KEY (`no_empleado`),
  KEY `fk_EMPLEADO_KIOSKO1_idx` (`nombre_kiosko`),
  CONSTRAINT `fk_EMPLEADO_KIOSKO1` FOREIGN KEY (`nombre_kiosko`) REFERENCES `KIOSKO` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLEADO`
--

LOCK TABLES `EMPLEADO` WRITE;
/*!40000 ALTER TABLE `EMPLEADO` DISABLE KEYS */;
INSERT INTO `EMPLEADO` VALUES (1,NULL,NULL,NULL,'JUAN','PEREZ',NULL,NULL,NULL,NULL,'NUTRITEC'),(2,NULL,NULL,NULL,'PEDRO','PEREZ',NULL,NULL,NULL,NULL,'NUTRITEC'),(3,NULL,NULL,NULL,'PEPE','PEREZ',NULL,NULL,NULL,NULL,'NUTRITEC'),(5,NULL,NULL,NULL,'JUANITO','GOMEZ',NULL,NULL,NULL,NULL,'NUTRITEC'),(6,NULL,NULL,NULL,'ALEXANDER','FERNANDEZ',NULL,NULL,NULL,NULL,'NUTRITEC'),(7,NULL,NULL,NULL,'MIGUEL','PEREZ',NULL,NULL,NULL,NULL,'LOS MOLLETES');
/*!40000 ALTER TABLE `EMPLEADO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KIOSKO`
--

DROP TABLE IF EXISTS `KIOSKO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KIOSKO` (
  `nombre` varchar(45) NOT NULL,
  `localizacion` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KIOSKO`
--

LOCK TABLES `KIOSKO` WRITE;
/*!40000 ALTER TABLE `KIOSKO` DISABLE KEYS */;
INSERT INTO `KIOSKO` VALUES ('LOS MOLLETES','EXPLANADA PROFESIONAL CSF'),('NUTRITEC','EXPLANADA PROFESIONAL CSF');
/*!40000 ALTER TABLE `KIOSKO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO`
--

DROP TABLE IF EXISTS `PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTO` (
  `EAN` char(13) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  PRIMARY KEY (`EAN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO`
--

LOCK TABLES `PRODUCTO` WRITE;
/*!40000 ALTER TABLE `PRODUCTO` DISABLE KEYS */;
INSERT INTO `PRODUCTO` VALUES ('7501055308248','CIEL 600ml',10.00),('7501059200050','CIEL 500ml',8.00),('7501059200051','PAPAS',10.00);
/*!40000 ALTER TABLE `PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO_has_KIOSKO`
--

DROP TABLE IF EXISTS `PRODUCTO_has_KIOSKO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTO_has_KIOSKO` (
  `PRODUCTO_EAN` char(13) NOT NULL,
  `KIOSKO_nombre` varchar(45) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PRODUCTO_EAN`,`KIOSKO_nombre`),
  KEY `fk_PRODUCTO_has_KIOSKO_KIOSKO1_idx` (`KIOSKO_nombre`),
  KEY `fk_PRODUCTO_has_KIOSKO_PRODUCTO1_idx` (`PRODUCTO_EAN`),
  CONSTRAINT `fk_PRODUCTO_has_KIOSKO_KIOSKO1` FOREIGN KEY (`KIOSKO_nombre`) REFERENCES `KIOSKO` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTO_has_KIOSKO_PRODUCTO1` FOREIGN KEY (`PRODUCTO_EAN`) REFERENCES `PRODUCTO` (`EAN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO_has_KIOSKO`
--

LOCK TABLES `PRODUCTO_has_KIOSKO` WRITE;
/*!40000 ALTER TABLE `PRODUCTO_has_KIOSKO` DISABLE KEYS */;
INSERT INTO `PRODUCTO_has_KIOSKO` VALUES ('7501055308248','NUTRITEC',99);
/*!40000 ALTER TABLE `PRODUCTO_has_KIOSKO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO_has_VENTA`
--

DROP TABLE IF EXISTS `PRODUCTO_has_VENTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTO_has_VENTA` (
  `PRODUCTO_EAN` char(13) NOT NULL,
  `VENTA_no_venta` int(11) NOT NULL,
  `CANTIDAD` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PRODUCTO_EAN`,`VENTA_no_venta`),
  KEY `fk_PRODUCTO_has_VENTA_VENTA1_idx` (`VENTA_no_venta`),
  KEY `fk_PRODUCTO_has_VENTA_PRODUCTO1_idx` (`PRODUCTO_EAN`),
  CONSTRAINT `fk_PRODUCTO_has_VENTA_PRODUCTO1` FOREIGN KEY (`PRODUCTO_EAN`) REFERENCES `PRODUCTO` (`EAN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTO_has_VENTA_VENTA1` FOREIGN KEY (`VENTA_no_venta`) REFERENCES `VENTA` (`no_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO_has_VENTA`
--

LOCK TABLES `PRODUCTO_has_VENTA` WRITE;
/*!40000 ALTER TABLE `PRODUCTO_has_VENTA` DISABLE KEYS */;
INSERT INTO `PRODUCTO_has_VENTA` VALUES ('7501055308248',1,1),('7501059200050',2,2),('7501059200050',6,4),('7501059200051',3,1),('7501059200051',4,1),('7501059200051',5,1);
/*!40000 ALTER TABLE `PRODUCTO_has_VENTA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENTA`
--

DROP TABLE IF EXISTS `VENTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VENTA` (
  `no_venta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `kiosko_venta` varchar(45) DEFAULT NULL,
  `no_empleado_venta` int(11) NOT NULL,
  PRIMARY KEY (`no_venta`,`no_empleado_venta`),
  KEY `fk_VENTA_KIOSKO1_idx` (`kiosko_venta`),
  KEY `fk_VENTA_EMPLEADO1_idx` (`no_empleado_venta`),
  CONSTRAINT `fk_VENTA_EMPLEADO1` FOREIGN KEY (`no_empleado_venta`) REFERENCES `EMPLEADO` (`no_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENTA_KIOSKO1` FOREIGN KEY (`kiosko_venta`) REFERENCES `KIOSKO` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENTA`
--

LOCK TABLES `VENTA` WRITE;
/*!40000 ALTER TABLE `VENTA` DISABLE KEYS */;
INSERT INTO `VENTA` VALUES (1,'2016-10-12 20:16:30','NUTRITEC',1),(2,'2016-11-02 20:47:06','NUTRITEC',1),(3,'2016-11-02 20:47:06','NUTRITEC',1),(4,'2016-11-02 20:52:40','NUTRITEC',2),(5,'2016-11-02 20:52:40','NUTRITEC',2),(6,'2016-11-02 20:52:41','NUTRITEC',2);
/*!40000 ALTER TABLE `VENTA` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-17 10:26:53
