-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: recibohaberes
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB

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
-- Table structure for table `art`
--

DROP TABLE IF EXISTS `art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `art` (
  `id_art` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_art`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art`
--

LOCK TABLES `art` WRITE;
/*!40000 ALTER TABLE `art` DISABLE KEYS */;
INSERT INTO `art` VALUES (1,'SANCOR SEGUROS','sancordseg@sancor.com.ar',1145555555);
/*!40000 ALTER TABLE `art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrataa`
--

DROP TABLE IF EXISTS `contrataa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrataa` (
  `id_empre` int(11) NOT NULL,
  `id_art` int(11) NOT NULL,
  PRIMARY KEY (`id_empre`,`id_art`),
  KEY `id_art` (`id_art`),
  CONSTRAINT `contrataa_ibfk_1` FOREIGN KEY (`id_empre`) REFERENCES `empresa` (`id_empre`),
  CONSTRAINT `contrataa_ibfk_2` FOREIGN KEY (`id_art`) REFERENCES `art` (`id_art`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrataa`
--

LOCK TABLES `contrataa` WRITE;
/*!40000 ALTER TABLE `contrataa` DISABLE KEYS */;
INSERT INTO `contrataa` VALUES (1,1);
/*!40000 ALTER TABLE `contrataa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrataos`
--

DROP TABLE IF EXISTS `contrataos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrataos` (
  `id_empre` int(11) NOT NULL,
  `id_os` int(11) NOT NULL,
  PRIMARY KEY (`id_empre`,`id_os`),
  KEY `id_os` (`id_os`),
  CONSTRAINT `contrataos_ibfk_1` FOREIGN KEY (`id_empre`) REFERENCES `empresa` (`id_empre`),
  CONSTRAINT `contrataos_ibfk_2` FOREIGN KEY (`id_os`) REFERENCES `obrasocial` (`id_os`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrataos`
--

LOCK TABLES `contrataos` WRITE;
/*!40000 ALTER TABLE `contrataos` DISABLE KEYS */;
INSERT INTO `contrataos` VALUES (1,1);
/*!40000 ALTER TABLE `contrataos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_empleado`
--

DROP TABLE IF EXISTS `datos_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_empleado` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `d_calle` varchar(40) DEFAULT NULL,
  `d_numero` int(11) DEFAULT NULL,
  `depo_provic` varchar(100) DEFAULT NULL,
  `email_per` varchar(70) DEFAULT NULL,
  `email_wk` varchar(70) DEFAULT NULL,
  `tel_per` int(11) DEFAULT NULL,
  `tel_wk` int(11) DEFAULT NULL,
  `categoria` varchar(10) DEFAULT NULL,
  `fecha_ing` date DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `provincia` varchar(30) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_empleado`
--

LOCK TABLES `datos_empleado` WRITE;
/*!40000 ALTER TABLE `datos_empleado` DISABLE KEYS */;
INSERT INTO `datos_empleado` VALUES (35855092,'Mario Daniel','Ledesma','Calle Falsa',123,'BANCO GALICIA - 123445677889990238','mariodanielledesma91@gmail.com','operador10@correoargentino.com.ar',2147483647,1143333333,'CAT01',NULL,NULL,'Argentina','Buenos Aires','Banfield');
/*!40000 ALTER TABLE `datos_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_empresa`
--

DROP TABLE IF EXISTS `datos_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_empresa` (
  `cuit` int(11) NOT NULL,
  `cp` varchar(10) DEFAULT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `d_calle` varchar(40) DEFAULT NULL,
  `d_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`cuit`),
  KEY `cp` (`cp`),
  CONSTRAINT `datos_empresa_ibfk_1` FOREIGN KEY (`cp`) REFERENCES `geo_empresa` (`cp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_empresa`
--

LOCK TABLES `datos_empresa` WRITE;
/*!40000 ALTER TABLE `datos_empresa` DISABLE KEYS */;
INSERT INTO `datos_empresa` VALUES (2147483647,'b1842zac','Correo Argentino','Avenida Fair',1101);
/*!40000 ALTER TABLE `datos_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `id_emp` int(11) NOT NULL,
  `id_empre` int(11) DEFAULT NULL,
  `id_os` int(11) DEFAULT NULL,
  `id_art` int(11) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `cuil` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_emp`),
  KEY `id_empre` (`id_empre`),
  KEY `id_os` (`id_os`),
  KEY `id_art` (`id_art`),
  KEY `dni` (`dni`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_empre`) REFERENCES `empresa` (`id_empre`),
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`id_os`) REFERENCES `obrasocial` (`id_os`),
  CONSTRAINT `empleado_ibfk_3` FOREIGN KEY (`id_art`) REFERENCES `art` (`id_art`),
  CONSTRAINT `empleado_ibfk_4` FOREIGN KEY (`dni`) REFERENCES `datos_empleado` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (156156,1,1,1,35855092,2147483647);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `id_empre` int(11) NOT NULL AUTO_INCREMENT,
  `id_paq` int(11) DEFAULT NULL,
  `cuit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_empre`),
  KEY `id_paq` (`id_paq`),
  KEY `cuit` (`cuit`),
  CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`id_paq`) REFERENCES `paquete` (`id_paq`),
  CONSTRAINT `empresa_ibfk_2` FOREIGN KEY (`cuit`) REFERENCES `datos_empresa` (`cuit`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,1,2147483647);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras`
--

DROP TABLE IF EXISTS `extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extras` (
  `tipo` varchar(10) NOT NULL,
  `id_rec` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`tipo`,`id_rec`),
  KEY `id_rec` (`id_rec`),
  CONSTRAINT `extras_ibfk_1` FOREIGN KEY (`id_rec`) REFERENCES `reciboh` (`id_rec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras`
--

LOCK TABLES `extras` WRITE;
/*!40000 ALTER TABLE `extras` DISABLE KEYS */;
INSERT INTO `extras` VALUES ('al-100%',1,4),('al-50%',1,8);
/*!40000 ALTER TABLE `extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_empresa`
--

DROP TABLE IF EXISTS `geo_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_empresa` (
  `cp` varchar(10) NOT NULL,
  `provincia` varchar(40) DEFAULT NULL,
  `ciudad` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_empresa`
--

LOCK TABLES `geo_empresa` WRITE;
/*!40000 ALTER TABLE `geo_empresa` DISABLE KEYS */;
INSERT INTO `geo_empresa` VALUES ('b1842zac','Buenos Aires','Monte Grande');
/*!40000 ALTER TABLE `geo_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `user` varchar(60) NOT NULL,
  `id_emp` int(11) DEFAULT NULL,
  `psw` varchar(20) DEFAULT NULL,
  `last_log` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user`),
  KEY `id_emp` (`id_emp`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`id_emp`) REFERENCES `empleado` (`id_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('mariodanielledesma91@gmail.com',156156,'123456789','2022-11-03 06:05:31');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obrasocial`
--

DROP TABLE IF EXISTS `obrasocial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obrasocial` (
  `id_os` int(11) NOT NULL AUTO_INCREMENT,
  `tel` int(11) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_os`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obrasocial`
--

LOCK TABLES `obrasocial` WRITE;
/*!40000 ALTER TABLE `obrasocial` DISABLE KEYS */;
INSERT INTO `obrasocial` VALUES (1,1141111111,'medife@medife.com.ar','Medife');
/*!40000 ALTER TABLE `obrasocial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquete`
--

DROP TABLE IF EXISTS `paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paquete` (
  `id_paq` int(11) NOT NULL AUTO_INCREMENT,
  `precio` decimal(20,2) DEFAULT NULL,
  `limite` int(11) DEFAULT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_paq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquete`
--

LOCK TABLES `paquete` WRITE;
/*!40000 ALTER TABLE `paquete` DISABLE KEYS */;
INSERT INTO `paquete` VALUES (1,0.00,0,'Sin Paquete');
/*!40000 ALTER TABLE `paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `id_per` varchar(20) NOT NULL,
  `id_paq` int(11) NOT NULL,
  `per_bool` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_per`,`id_paq`),
  KEY `id_paq` (`id_paq`),
  CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`id_paq`) REFERENCES `paquete` (`id_paq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reciboh`
--

DROP TABLE IF EXISTS `reciboh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reciboh` (
  `id_rec` int(11) NOT NULL AUTO_INCREMENT,
  `id_emp` int(11) DEFAULT NULL,
  `montobruto` decimal(20,2) DEFAULT NULL,
  `periodo` date DEFAULT NULL,
  `antiguedad` int(11) DEFAULT NULL,
  `descrip` varchar(50) DEFAULT NULL,
  `asisypum` tinyint(1) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `f_pago` date DEFAULT NULL,
  PRIMARY KEY (`id_rec`),
  KEY `id_emp` (`id_emp`),
  CONSTRAINT `reciboh_ibfk_1` FOREIGN KEY (`id_emp`) REFERENCES `empleado` (`id_emp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reciboh`
--

LOCK TABLES `reciboh` WRITE;
/*!40000 ALTER TABLE `reciboh` DISABLE KEYS */;
INSERT INTO `reciboh` VALUES (1,156156,90500.30,'2022-10-01',10,'Recibode septiembre',1,1,'2022-10-07');
/*!40000 ALTER TABLE `reciboh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamo`
--

DROP TABLE IF EXISTS `reclamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reclamo` (
  `id_recla` int(11) NOT NULL AUTO_INCREMENT,
  `id_rec` int(11) DEFAULT NULL,
  `id_emp` int(11) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `descrip` varchar(255) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tipo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_recla`),
  KEY `id_rec` (`id_rec`),
  KEY `id_emp` (`id_emp`),
  CONSTRAINT `reclamo_ibfk_1` FOREIGN KEY (`id_rec`) REFERENCES `reciboh` (`id_rec`),
  CONSTRAINT `reclamo_ibfk_2` FOREIGN KEY (`id_emp`) REFERENCES `empleado` (`id_emp`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamo`
--

LOCK TABLES `reclamo` WRITE;
/*!40000 ALTER TABLE `reclamo` DISABLE KEYS */;
INSERT INTO `reclamo` VALUES (2,1,156156,'A_Clasific','Quiero reclamar que me vendieron una coca sin gas','2022-11-03 06:32:09','Reclamo');
/*!40000 ALTER TABLE `reclamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reduccion`
--

DROP TABLE IF EXISTS `reduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reduccion` (
  `cod_reduc` varchar(20) NOT NULL,
  `id_rec` int(11) NOT NULL,
  `valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_reduc`,`id_rec`),
  KEY `id_rec` (`id_rec`),
  CONSTRAINT `reduccion_ibfk_1` FOREIGN KEY (`id_rec`) REFERENCES `reciboh` (`id_rec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reduccion`
--

LOCK TABLES `reduccion` WRITE;
/*!40000 ALTER TABLE `reduccion` DISABLE KEYS */;
INSERT INTO `reduccion` VALUES ('01-Jubilac',1,1),('02-ImpPais',1,3);
/*!40000 ALTER TABLE `reduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisa`
--

DROP TABLE IF EXISTS `supervisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisa` (
  `id_emp_sa` int(11) NOT NULL,
  `id_emp_so` int(11) NOT NULL,
  PRIMARY KEY (`id_emp_sa`,`id_emp_so`),
  KEY `id_emp_so` (`id_emp_so`),
  CONSTRAINT `supervisa_ibfk_1` FOREIGN KEY (`id_emp_so`) REFERENCES `empleado` (`id_emp`),
  CONSTRAINT `supervisa_ibfk_2` FOREIGN KEY (`id_emp_sa`) REFERENCES `empleado` (`id_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisa`
--

LOCK TABLES `supervisa` WRITE;
/*!40000 ALTER TABLE `supervisa` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervisa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-03  3:35:15
