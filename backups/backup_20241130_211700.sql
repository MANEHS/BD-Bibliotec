-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: btm
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add autor',7,'add_autor'),(26,'Can change autor',7,'change_autor'),(27,'Can delete autor',7,'delete_autor'),(28,'Can view autor',7,'view_autor'),(29,'Can add autor libro',8,'add_autorlibro'),(30,'Can change autor libro',8,'change_autorlibro'),(31,'Can delete autor libro',8,'delete_autorlibro'),(32,'Can view autor libro',8,'view_autorlibro'),(33,'Can add genero',9,'add_genero'),(34,'Can change genero',9,'change_genero'),(35,'Can delete genero',9,'delete_genero'),(36,'Can view genero',9,'view_genero'),(37,'Can add libro',10,'add_libro'),(38,'Can change libro',10,'change_libro'),(39,'Can delete libro',10,'delete_libro'),(40,'Can view libro',10,'view_libro'),(41,'Can add libro genero',11,'add_librogenero'),(42,'Can change libro genero',11,'change_librogenero'),(43,'Can delete libro genero',11,'delete_librogenero'),(44,'Can view libro genero',11,'view_librogenero'),(45,'Can add prestamo',12,'add_prestamo'),(46,'Can change prestamo',12,'change_prestamo'),(47,'Can delete prestamo',12,'delete_prestamo'),(48,'Can view prestamo',12,'view_prestamo'),(49,'Can add usuario',13,'add_usuario'),(50,'Can change usuario',13,'change_usuario'),(51,'Can delete usuario',13,'delete_usuario'),(52,'Can view usuario',13,'view_usuario');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$Tjds7DUQx2993B4JK859oc$TH6sCO8EcWYyvS3YxMLzc8C5HJ2mRqRwhr92yjIwAL8=','2024-12-01 03:15:57.776344',1,'gustavo','','','guztavodelacruz@gmail.com',1,1,'2024-11-07 00:29:52.795000'),(2,'pbkdf2_sha256$600000$1g4jiwpndppjzRKyt5WNlw$/GOyjEJh/2rwuk0SjTKdnxSOs0wQxTpsPnj3cB2IZBI=','2024-11-26 14:33:52.610819',1,'Administrador','','','',1,1,'2024-11-07 00:40:13.000000'),(3,'pbkdf2_sha256$600000$l3pxUh0fNjjdUkRRqTPUeW$JCjXfbnoknz53vuWqK2b6znwF7k7SxyhhFl3YjjVs94=','2024-11-07 01:03:54.139000',0,'Bibliotecario','','','',1,1,'2024-11-07 00:42:22.000000'),(4,'pbkdf2_sha256$600000$3FlnnjG6UHmwAYex2zZznt$UyRC4glhb2QHXGHdxhBwHGPjXZQRGlE9M7U1goKMBi4=','2024-11-07 01:04:23.354000',0,'Usuario','','','',1,1,'2024-11-07 00:44:39.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (34,2,1),(35,2,2),(36,2,3),(37,2,4),(38,2,5),(39,2,6),(40,2,7),(41,2,8),(42,2,9),(43,2,10),(44,2,11),(45,2,12),(46,2,13),(47,2,14),(48,2,15),(49,2,16),(50,2,17),(51,2,18),(52,2,19),(53,2,20),(54,2,21),(55,2,22),(56,2,23),(57,2,24),(58,2,25),(59,2,26),(60,2,27),(61,2,28),(62,2,29),(63,2,30),(64,2,31),(65,2,32),(66,2,33),(67,2,34),(68,2,35),(69,2,36),(70,2,37),(71,2,38),(72,2,39),(73,2,40),(74,2,41),(75,2,42),(76,2,43),(77,2,44),(78,2,45),(79,2,46),(80,2,47),(81,2,48),(82,2,49),(83,2,50),(84,2,51),(85,2,52),(1,3,25),(2,3,26),(3,3,27),(4,3,28),(5,3,29),(6,3,30),(7,3,31),(8,3,32),(9,3,33),(10,3,34),(11,3,35),(12,3,36),(13,3,37),(14,3,38),(15,3,39),(16,3,40),(17,3,41),(18,3,42),(19,3,43),(20,3,44),(21,3,45),(22,3,46),(23,3,47),(24,3,48),(25,3,49),(26,3,50),(27,3,51),(28,3,52),(33,4,28),(29,4,32),(30,4,36),(31,4,40),(32,4,44);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor` (
  `id_autor` int(9) NOT NULL AUTO_INCREMENT,
  `nom_autor` varchar(20) NOT NULL,
  `apellido_p` varchar(20) NOT NULL,
  `apellido_m` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_muerte` date DEFAULT NULL,
  `nacionalidad` varchar(15) NOT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Gabriel','Garcia','Marquez','1927-03-06','2014-04-17','Colombiana'),(2,'Isabel','Allende','','1942-08-02',NULL,'Chilena'),(3,'Julio','Cortazar','','1914-08-26','1984-02-12','Argentina'),(4,'Mario','Vargas','Llosa','1936-03-28',NULL,'Peruana'),(5,'Octavio','Paz','','1914-03-31','1998-04-19','Mexicana'),(6,'Pablo','Neruda','','1904-07-12','1973-09-23','Chilena'),(7,'Jorge Luis','Borges','','1899-08-24','1986-06-14','Argentina'),(8,'Laura','Esquivel','','1950-09-30',NULL,'Mexicana'),(9,'Carlos','Fuentes','','1928-11-11','2012-05-15','Mexicana'),(10,'Miguel','de Cervantes','Saavedra','1547-09-29','1616-04-23','Espanyola');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor_libro`
--

DROP TABLE IF EXISTS `autor_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor_libro` (
  `id_autor` int(9) NOT NULL,
  `id_libro` int(9) NOT NULL,
  PRIMARY KEY (`id_autor`,`id_libro`),
  KEY `id_libro` (`id_libro`),
  KEY `id_autor` (`id_autor`),
  CONSTRAINT `autor_libro_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `autor_libro_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor_libro`
--

LOCK TABLES `autor_libro` WRITE;
/*!40000 ALTER TABLE `autor_libro` DISABLE KEYS */;
INSERT INTO `autor_libro` VALUES (1,11),(2,8),(3,5),(3,6),(4,3),(4,5),(5,2),(6,9),(7,7),(8,4),(9,10);
/*!40000 ALTER TABLE `autor_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-11-07 00:40:14.424000','2','Administrador',1,'[{\"added\": {}}]',4,1),(2,'2024-11-07 00:41:20.299000','2','Administrador',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(3,'2024-11-07 00:41:52.523000','2','Administrador',2,'[]',4,1),(4,'2024-11-07 00:42:22.687000','3','Bibliotecario',1,'[{\"added\": {}}]',4,1),(5,'2024-11-07 00:44:18.353000','3','Bibliotecario',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]',4,1),(6,'2024-11-07 00:44:39.801000','4','Usuario',1,'[{\"added\": {}}]',4,1),(7,'2024-11-07 00:50:19.456000','4','Usuario',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(8,'2024-11-07 00:50:31.715000','4','Usuario',2,'[]',4,1),(9,'2024-11-07 00:50:40.122000','4','Usuario',2,'[]',4,1),(10,'2024-11-07 00:55:20.298000','2','Administrador',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(11,'2024-11-07 00:57:50.877000','3','Bibliotecario',2,'[]',4,1),(12,'2024-11-07 00:58:05.593000','4','Usuario',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(13,'2024-11-09 03:27:56.482000','1','Cien anyos de soledad',2,'[{\"changed\": {\"fields\": [\"Editorial\"]}}]',10,1),(14,'2024-11-09 05:06:54.725407','1','Gabriel',3,'',7,1),(15,'2024-11-09 05:06:54.736356','2','Isabel',3,'',7,1),(16,'2024-11-09 05:06:54.736356','3','Julio',3,'',7,1),(17,'2024-11-09 05:07:03.085397','4','Mario',3,'',7,1),(18,'2024-11-09 05:07:03.093917','5','Octavio',3,'',7,1),(19,'2024-11-09 05:07:03.097210','6','Pablo',3,'',7,1),(20,'2024-11-09 05:07:12.067646','7','Jorge Luis',3,'',7,1),(21,'2024-11-09 05:07:12.069054','8','Laura',3,'',7,1),(22,'2024-11-09 05:07:12.078234','9','Carlos',3,'',7,1),(23,'2024-11-09 05:07:19.094364','10','Miguel',3,'',7,1),(24,'2024-11-09 05:07:33.799760','1','Novela',3,'',9,1),(25,'2024-11-09 05:07:33.804223','2','Poesía',3,'',9,1),(26,'2024-11-09 05:07:33.804223','3','Ensayo',3,'',9,1),(27,'2024-11-09 05:07:33.818853','4','Teatro',3,'',9,1),(28,'2024-11-09 05:07:33.818853','5','Cuento',3,'',9,1),(29,'2024-11-09 05:07:33.818853','6','Biografía',3,'',9,1),(30,'2024-11-09 05:07:33.833508','7','Autobiografía',3,'',9,1),(31,'2024-11-09 05:07:33.837137','8','Fábula',3,'',9,1),(32,'2024-11-09 05:07:33.837137','9','Crónica',3,'',9,1),(33,'2024-11-09 05:07:33.837137','10','Periodismo Literario',3,'',9,1),(34,'2024-11-09 05:07:49.516288','1','Cien años de soledad',3,'',10,1),(35,'2024-11-09 05:07:49.518713','2','La casa de los espíritus',3,'',10,1),(36,'2024-11-09 05:07:49.528593','3','Rayuela',3,'',10,1),(37,'2024-11-09 05:07:49.533210','4','La ciudad y los perros',3,'',10,1),(38,'2024-11-09 05:07:49.536818','5','El laberinto de la soledad',3,'',10,1),(39,'2024-11-09 05:07:49.541044','6','Veinte poemas de amor y una canción dese',3,'',10,1),(40,'2024-11-09 05:07:49.548557','7','Ficciones',3,'',10,1),(41,'2024-11-09 05:07:49.550452','8','Como agua para chocolate',3,'',10,1),(42,'2024-11-09 05:07:49.556673','9','Terra Nostra',3,'',10,1),(43,'2024-11-09 05:07:49.560143','10','Don Quijote de la Mancha',3,'',10,1),(44,'2024-11-09 05:08:13.715978','1','Juan',3,'',13,1),(45,'2024-11-09 05:08:13.717771','2','María',3,'',13,1),(46,'2024-11-09 05:08:13.726639','3','Carlos',3,'',13,1),(47,'2024-11-09 05:08:13.726639','4','Ana',3,'',13,1),(48,'2024-11-09 05:08:13.734198','5','Luis',3,'',13,1),(49,'2024-11-09 05:08:13.734198','6','Laura',3,'',13,1),(50,'2024-11-09 05:08:13.742484','7','Jorge',3,'',13,1),(51,'2024-11-09 05:08:13.742484','8','Sofía',3,'',13,1),(52,'2024-11-09 05:08:13.749359','9','Pedro',3,'',13,1),(53,'2024-11-09 05:08:13.752308','10','Angélica',3,'',13,1),(54,'2024-11-22 05:32:17.091329','1','Gabriel',3,'',8,1),(55,'2024-11-22 05:32:17.097859','2','Isabel',3,'',8,1),(56,'2024-11-22 05:32:17.101895','3','Julio',3,'',8,1),(57,'2024-11-22 05:32:17.105090','4','Mario',3,'',8,1),(58,'2024-11-22 05:32:17.107900','5','Octavio',3,'',8,1),(59,'2024-11-22 05:32:17.110928','6','Pablo',3,'',8,1),(60,'2024-11-22 05:32:17.114928','7','Jorge Luis',3,'',8,1),(61,'2024-11-22 05:32:17.118449','8','Laura',3,'',8,1),(62,'2024-11-22 05:32:17.121453','9','Carlos',3,'',8,1),(63,'2024-11-22 05:32:17.126029','10','Miguel',3,'',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'biblio_tec','autor'),(8,'biblio_tec','autorlibro'),(9,'biblio_tec','genero'),(10,'biblio_tec','libro'),(11,'biblio_tec','librogenero'),(12,'biblio_tec','prestamo'),(13,'biblio_tec','usuario'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-07 00:28:28.282805'),(2,'auth','0001_initial','2024-11-07 00:28:29.013110'),(3,'admin','0001_initial','2024-11-07 00:28:29.201488'),(4,'admin','0002_logentry_remove_auto_add','2024-11-07 00:28:29.216528'),(5,'admin','0003_logentry_add_action_flag_choices','2024-11-07 00:28:29.232685'),(6,'contenttypes','0002_remove_content_type_name','2024-11-07 00:28:29.332425'),(7,'auth','0002_alter_permission_name_max_length','2024-11-07 00:28:29.416074'),(8,'auth','0003_alter_user_email_max_length','2024-11-07 00:28:29.462462'),(9,'auth','0004_alter_user_username_opts','2024-11-07 00:28:29.493165'),(10,'auth','0005_alter_user_last_login_null','2024-11-07 00:28:29.586899'),(11,'auth','0006_require_contenttypes_0002','2024-11-07 00:28:29.596874'),(12,'auth','0007_alter_validators_add_error_messages','2024-11-07 00:28:29.622822'),(13,'auth','0008_alter_user_username_max_length','2024-11-07 00:28:29.653346'),(14,'auth','0009_alter_user_last_name_max_length','2024-11-07 00:28:29.681123'),(15,'auth','0010_alter_group_name_max_length','2024-11-07 00:28:29.706720'),(16,'auth','0011_update_proxy_permissions','2024-11-07 00:28:29.721269'),(17,'auth','0012_alter_user_first_name_max_length','2024-11-07 00:28:29.747868'),(18,'biblio_tec','0001_initial','2024-11-07 00:28:29.763942'),(19,'biblio_tec','0002_authgroup_authgrouppermissions_authpermission_and_more','2024-11-07 00:28:29.782765'),(20,'biblio_tec','0003_delete_authgroup_delete_authgrouppermissions_and_more','2024-11-07 00:28:29.795069'),(21,'biblio_tec','0004_alter_autorlibro_table','2024-11-07 00:28:29.803666'),(22,'sessions','0001_initial','2024-11-07 00:28:29.863449');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('gd8ui3pckrg8lv3bdxja3nup9v2oy4gt','.eJxVjMsOwiAUBf-FtSFQysule7-BcB-VqoGktCvjv2uTLnR7Zua8RMrbWtLWeUkzibPQ4vS7QcYH1x3QPddbk9jquswgd0UetMtrI35eDvfvoORevvVgojXMKiJ7R5E4gsmTJRemoIEDRtRGEZDS1lhLqDwY74YwKhVwJPH-APCTN9w:1tHaRB:zgpk28o6_tCZUABvzqODhv3Q4qSJ6BwaKXJxjniXCuQ','2024-12-15 03:15:57.781379'),('jr9o0m85gx7nxkm385geu3448ocq76gq','.eJxVjMsOwiAUBf-FtSFQysule7-BcB-VqoGktCvjv2uTLnR7Zua8RMrbWtLWeUkzibPQ4vS7QcYH1x3QPddbk9jquswgd0UetMtrI35eDvfvoORevvVgojXMKiJ7R5E4gsmTJRemoIEDRtRGEZDS1lhLqDwY74YwKhVwJPH-APCTN9w:1tELbW:jUUmkJu8WVddvp-yGrzDiIlqtr1ALHiWGWFa_VjIcjs','2024-12-06 04:49:14.180946'),('zbhlzk6slvmk4gkktafpxvnxr6djygs4','.eJxVjMsOwiAUBf-FtSFQysule7-BcB-VqoGktCvjv2uTLnR7Zua8RMrbWtLWeUkzibPQ4vS7QcYH1x3QPddbk9jquswgd0UetMtrI35eDvfvoORevvVgojXMKiJ7R5E4gsmTJRemoIEDRtRGEZDS1lhLqDwY74YwKhVwJPH-APCTN9w:1t9dBg:OE55GZoxthC-Ftvy2gDeiNcyae6RS7FgGqRinCZNL34','2024-11-23 04:35:04.306000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `id_genero` int(9) NOT NULL AUTO_INCREMENT,
  `nombre_genero` varchar(20) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Novela'),(2,'Poesia'),(3,'Ensayo'),(4,'Teatro'),(5,'Cuento'),(6,'Biografia'),(7,'Autobiografia'),(8,'Fabula'),(9,'Cronica'),(10,'Periodismo Literario');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro` (
  `id_libro` int(9) NOT NULL AUTO_INCREMENT,
  `nomb_libro` varchar(40) NOT NULL,
  `editorial` int(20) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `num_paginas` int(5) NOT NULL,
  PRIMARY KEY (`id_libro`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'Cien anyos de soledad',1,'978-0307474728',471),(2,'La casa de los espiritus',2,'978-0553383805',433),(3,'Rayuela',3,'978-0099593965',576),(4,'La ciudad y los perros',4,'978-8433970987',432),(5,'El laberinto de la soledad',5,'978-0307387438',398),(6,'Veinte poemas de amor y una cancion dese',6,'978-6074000533',70),(7,'Ficciones',7,'978-8426403184',248),(8,'Como agua para chocolate',8,'978-0385420174',224),(9,'Terra Nostra',9,'978-0374522838',803),(10,'Don Quijote de la Mancha',10,'978-8491051149',1056),(11,'El Principito',5,'978-1234567897',120);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prevent_book_deletion` BEFORE DELETE ON `libro` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 FROM prestamo WHERE id_libro = OLD.id_libro AND estado = 'Prestado') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar un libro que está en préstamo.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `libro_genero`
--

DROP TABLE IF EXISTS `libro_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro_genero` (
  `id_libro` int(9) NOT NULL,
  `id_genero` int(9) NOT NULL,
  PRIMARY KEY (`id_libro`,`id_genero`),
  KEY `id_libro` (`id_libro`),
  KEY `id_genero` (`id_genero`),
  CONSTRAINT `libro_genero_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `libro_genero_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_genero`
--

LOCK TABLES `libro_genero` WRITE;
/*!40000 ALTER TABLE `libro_genero` DISABLE KEYS */;
INSERT INTO `libro_genero` VALUES (1,1),(2,1),(3,1),(4,1),(5,3),(6,2),(7,2),(8,1),(9,1),(10,1),(11,2);
/*!40000 ALTER TABLE `libro_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamo` (
  `id_prestamo` int(9) NOT NULL AUTO_INCREMENT,
  `fecha_prestamo` date NOT NULL,
  `dias_prestamo` int(5) NOT NULL,
  `fecha_devuelto` date NOT NULL,
  `estado` varchar(10) NOT NULL,
  `id_usuario` int(9) NOT NULL,
  `id_libro` int(9) NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `id_libro` (`id_libro`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
INSERT INTO `prestamo` VALUES (1,'2024-10-01',7,'2024-10-08','Devuelto',1,1),(2,'2024-10-05',10,'2024-10-15','Devuelto',2,2),(3,'2024-10-10',14,'2024-10-24','Devuelto',3,3),(4,'2024-10-12',5,'2024-10-17','Devuelto',4,4),(5,'2024-10-15',7,'2024-10-22','Devuelto',5,5),(6,'2024-10-20',15,'2024-11-04','Devuelto',6,6),(7,'2024-10-22',8,'2024-10-30','Devuelto',7,7),(8,'2024-10-25',12,'2024-11-06','Devuelto',8,8),(9,'2024-10-28',6,'2024-11-03','Devuelto',9,9),(10,'2024-10-30',9,'2024-11-08','Devuelto',10,10),(11,'2024-12-01',14,'2024-12-15','prestado',1,1);
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(9) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(30) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `ap_map` varchar(20) NOT NULL,
  `ap_pat` varchar(20) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Calle 1 #123','juan.perez@example.com','Juan','Perez','Garcia','5512345678'),(2,'Av. Central #45','maria.lopez@example.com','Maria','Lopez','Martinez','5523456789'),(3,'Calle Norte #567','carlos.mendez@example.com','Carlos','Mendez','Hernandez','5534567890'),(4,'Col. Centro #789','ana.ramirez@example.com','Ana','Ramirez','Sanchez','5545678901'),(5,'Zona Sur #101','luis.gonzalez@example.com','Luis','Gonzalez','Diaz','5556789012'),(6,'Boulevard 15 #202','laura.rodriguez@example.com','Laura','Rodriguez','Flores','5567890123'),(7,'Av. del Sol #303','jorge.fernandez@example.com','Jorge','Fernandez','Torres','5578901234'),(8,'Pasaje 12 #404','sofia.garcia@example.com','Sofia','Garcia','Lopez','5589012345'),(9,'Callejon 9 #505','pedro.martinez@example.com','Pedro','Martinez','Gomez','5590123456'),(10,'Sector Este #606','angelica.rivera@example.com','Angelica','Rivera','Perez','5501234567');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prevent_user_deletion` BEFORE DELETE ON `usuario` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 
               FROM prestamo 
               WHERE id_usuario = OLD.id_usuario 
                 AND estado = 'Prestado') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar un usuario que tiene libros prestados.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-30 21:17:01
