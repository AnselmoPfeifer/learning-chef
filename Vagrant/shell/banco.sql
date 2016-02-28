-- MySQL dump 10.13  Distrib 5.6.27, for osx10.8 (x86_64)
--
-- Host: localhost    Database: algaworks_cursojsf
-- ------------------------------------------------------
-- Server version	5.6.27

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
-- Table structure for table `lancamento`
--

DROP TABLE IF EXISTS `lancamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lancamento` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `data_pagamento` datetime DEFAULT NULL,
  `data_vencimento` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `pago` bit(1) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  `codigo_pessoa` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_jk370dbqg33lqf68n97ftvlih` (`codigo_pessoa`),
  CONSTRAINT `FK_jk370dbqg33lqf68n97ftvlih` FOREIGN KEY (`codigo_pessoa`) REFERENCES `pessoa` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lancamento`
--

LOCK TABLES `lancamento` WRITE;
/*!40000 ALTER TABLE `lancamento` DISABLE KEYS */;
INSERT INTO `lancamento` VALUES (4,'2015-12-10 00:00:00','2015-12-10 00:00:00','Pagamento de Cartão da Caixa','','DESPESA',100.00,2),(6,'2015-12-10 00:00:00','2015-12-05 00:00:00','Cartão de Credito Banco do Brasil','','DESPESA',500.00,1),(10,'2015-12-10 00:00:00','2015-12-05 00:00:00','Salario Carlos dos Santos','','RECEITA',50000.00,1),(11,'2015-12-10 00:00:00','2015-12-05 00:00:00','Salario TimTim','','RECEITA',50000.00,2),(14,'2016-01-10 00:00:00','2016-01-10 00:00:00','Pagamento de Cartao de Credito Bradesco','','RECEITA',100.00,2),(15,'2016-01-10 00:00:00','2016-01-10 00:00:00','Pagamento de Cartao de Credito Bradesco','','DESPESA',100.00,2),(16,'2016-01-10 00:00:00','2016-01-10 00:00:00','Carlos dos Santos','','RECEITA',100.00,2),(17,'2015-12-10 00:00:00','2015-12-05 00:00:00','Salario Joao da Silva','','RECEITA',100000.00,1),(18,'2015-12-10 00:00:00','2015-12-10 00:00:00','Pagamento de Luz','','DESPESA',100.00,2),(19,'2015-12-10 00:00:00','2015-12-10 00:00:00','Salario Carlos da Silva','','RECEITA',100.00,1),(20,'2015-12-10 00:00:00','2015-12-10 00:00:00','Pagamento de Luz2','','RECEITA',100.00,1);
/*!40000 ALTER TABLE `lancamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Olivia Joanna Susanne'),(2,'Ivar Iachin Zimri');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ramo`
--

DROP TABLE IF EXISTS `ramo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ramo` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ramo`
--

LOCK TABLES `ramo` WRITE;
/*!40000 ALTER TABLE `ramo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ramo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-27 23:44:30
