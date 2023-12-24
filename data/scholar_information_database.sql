-- MariaDB dump 10.19-11.2.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: scholar_information
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB

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
-- Current Database: `scholar_information`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `scholar_information` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;

USE `scholar_information`;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES
(1,'admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add admin',1,'add_admin'),
(2,'Can change admin',1,'change_admin'),
(3,'Can delete admin',1,'delete_admin'),
(4,'Can view admin',1,'view_admin'),
(5,'Can add subject',2,'add_subject'),
(6,'Can change subject',2,'change_subject'),
(7,'Can delete subject',2,'delete_subject'),
(8,'Can view subject',2,'view_subject'),
(9,'Can add user',3,'add_user'),
(10,'Can change user',3,'change_user'),
(11,'Can delete user',3,'delete_user'),
(12,'Can view user',3,'view_user'),
(13,'Can add paper',4,'add_paper'),
(14,'Can change paper',4,'change_paper'),
(15,'Can delete paper',4,'delete_paper'),
(16,'Can view paper',4,'view_paper'),
(17,'Can add authorship',5,'add_authorship'),
(18,'Can change authorship',5,'change_authorship'),
(19,'Can delete authorship',5,'delete_authorship'),
(20,'Can view authorship',5,'view_authorship'),
(21,'Can add log entry',6,'add_logentry'),
(22,'Can change log entry',6,'change_logentry'),
(23,'Can delete log entry',6,'delete_logentry'),
(24,'Can view log entry',6,'view_logentry'),
(25,'Can add permission',7,'add_permission'),
(26,'Can change permission',7,'change_permission'),
(27,'Can delete permission',7,'delete_permission'),
(28,'Can view permission',7,'view_permission'),
(29,'Can add group',8,'add_group'),
(30,'Can change group',8,'change_group'),
(31,'Can delete group',8,'delete_group'),
(32,'Can view group',8,'view_group'),
(33,'Can add user',9,'add_user'),
(34,'Can change user',9,'change_user'),
(35,'Can delete user',9,'delete_user'),
(36,'Can view user',9,'view_user'),
(37,'Can add content type',10,'add_contenttype'),
(38,'Can change content type',10,'change_contenttype'),
(39,'Can delete content type',10,'delete_contenttype'),
(40,'Can view content type',10,'view_contenttype'),
(41,'Can add session',11,'add_session'),
(42,'Can change session',11,'change_session'),
(43,'Can delete session',11,'delete_session'),
(44,'Can view session',11,'view_session');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorship`
--

DROP TABLE IF EXISTS `authorship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorship` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `paper_ID_id` int(11) NOT NULL,
  `user_ID_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `authorship_paper_ID_id_f48f82bc_fk_paper_paper_ID` (`paper_ID_id`),
  KEY `authorship_user_ID_id_75da2526_fk_user_user_ID` (`user_ID_id`),
  CONSTRAINT `authorship_paper_ID_id_f48f82bc_fk_paper_paper_ID` FOREIGN KEY (`paper_ID_id`) REFERENCES `paper` (`paper_ID`),
  CONSTRAINT `authorship_user_ID_id_75da2526_fk_user_user_ID` FOREIGN KEY (`user_ID_id`) REFERENCES `user` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorship`
--

LOCK TABLES `authorship` WRITE;
/*!40000 ALTER TABLE `authorship` DISABLE KEYS */;
INSERT INTO `authorship` VALUES
(8,1,1),
(9,2,2),
(10,3,3),
(11,4,4),
(12,5,5),
(13,6,6),
(14,7,7),
(15,8,8),
(16,9,9),
(17,10,10),
(18,11,10),
(19,12,10),
(20,13,12),
(21,14,12),
(22,15,12),
(23,16,13),
(24,17,13);
/*!40000 ALTER TABLE `authorship` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(6,'admin','logentry'),
(8,'auth','group'),
(7,'auth','permission'),
(9,'auth','user'),
(10,'contenttypes','contenttype'),
(11,'sessions','session'),
(1,'sims_app','admin'),
(5,'sims_app','authorship'),
(4,'sims_app','paper'),
(2,'sims_app','subject'),
(3,'sims_app','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2023-12-18 13:01:30.527161'),
(2,'auth','0001_initial','2023-12-18 13:01:30.938507'),
(3,'admin','0001_initial','2023-12-18 13:01:31.029004'),
(4,'admin','0002_logentry_remove_auto_add','2023-12-18 13:01:31.039619'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-12-18 13:01:31.050667'),
(6,'contenttypes','0002_remove_content_type_name','2023-12-18 13:01:31.115381'),
(7,'auth','0002_alter_permission_name_max_length','2023-12-18 13:01:31.160017'),
(8,'auth','0003_alter_user_email_max_length','2023-12-18 13:01:31.202718'),
(9,'auth','0004_alter_user_username_opts','2023-12-18 13:01:31.216189'),
(10,'auth','0005_alter_user_last_login_null','2023-12-18 13:01:31.253839'),
(11,'auth','0006_require_contenttypes_0002','2023-12-18 13:01:31.256474'),
(12,'auth','0007_alter_validators_add_error_messages','2023-12-18 13:01:31.266557'),
(13,'auth','0008_alter_user_username_max_length','2023-12-18 13:01:31.288643'),
(14,'auth','0009_alter_user_last_name_max_length','2023-12-18 13:01:31.314662'),
(15,'auth','0010_alter_group_name_max_length','2023-12-18 13:01:31.354753'),
(16,'auth','0011_update_proxy_permissions','2023-12-18 13:01:31.366473'),
(17,'auth','0012_alter_user_first_name_max_length','2023-12-18 13:01:31.389765'),
(18,'sessions','0001_initial','2023-12-18 13:01:31.427732'),
(19,'sims_app','0001_initial','2023-12-18 13:01:31.623385');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('r7e0b7j2oxm115voclmuvgcnbeuo7a73','eyJhZG1pbl9sb2dnZWRfaW4iOnRydWV9:1rHGrp:KN_iITmsTt-0AxrBUSH20OQuVlPVcgPCozsP4Uo9Wf8','2024-01-07 05:17:37.917339');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper` (
  `paper_ID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `publication_date` date NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`paper_ID`),
  UNIQUE KEY `title` (`title`),
  KEY `paper_subject_id_b3803e39_fk_subject_subject_ID` (`subject_id`),
  CONSTRAINT `paper_subject_id_b3803e39_fk_subject_subject_ID` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` VALUES
(1,'Protein measurement with the folin phenol reagent','1951-11-11',2),
(2,'Cleavage of structural proteins during the assembly of the head of bacteriophage T4','1970-11-11',2),
(3,'A rapid and sensitive method for the quantitation of microgram quantities of protein utilizing the principle of protein-dye binding','1976-11-11',2),
(4,'DNA sequencing with chain-terminating inhibitors.','1977-11-11',2),
(5,'Single-step method of RNA isolation by acid guanidinium thiocyanate-phenol-chloroform extraction.','1987-11-11',2),
(6,'Electrophoretic transfer of proteins from polyacrylamide gels to nitrocellulose sheets: procedure and some applications','1979-12-12',2),
(7,'Development of the Colle-Salvetti correlation-energy formula into a functional of the electron density','1988-04-04',3),
(8,'Density-functional thermochemistry. III. The role of exact exchange.','1993-12-05',3),
(9,'A simple method for the isolation and purification of total lipides from animal tissues','1957-03-03',2),
(10,'Attention Is All You Need','2017-12-06',1),
(11,'All Mistakes Are Not Equal: Comprehensive Hierarchy Aware Multi-label Predictions','2022-06-17',1),
(12,'Simple and Efficient ways to Improve REALM','2021-04-18',1),
(13,'A Research Paper About Computer Science','2011-11-11',1),
(14,'A Research Paper About Biology','2022-02-22',2),
(15,'A Research Paper About Physics','2023-12-14',4),
(16,'A Test Paper about AI','2023-12-09',1),
(17,'A Test Paper About Machine Learning','2023-01-19',1);
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subject_ID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `date_added` date NOT NULL,
  PRIMARY KEY (`subject_ID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES
(1,'Computer Science','2023-12-18'),
(2,'Biology','2023-12-24'),
(3,'Chemistry','2023-12-24'),
(4,'Physics','2023-12-24'),
(5,'Bioinformatics','2023-12-24');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_ID` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `nationality` varchar(20) NOT NULL,
  `university` varchar(50) NOT NULL,
  PRIMARY KEY (`user_ID`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'oliverlowry','Oliver Howe','Lowry','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','oliverhowelowry@gmail.com','1234567890','American','Washington University'),
(2,'ulrichlaemmli','Ulrich K.','Laemmli','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','ulrichlaemmli@gmail.com','1234567890','Swiss','University of Geneva'),
(3,'marionbradford','Marion M.','Bradford','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','marionbradford@gmail.com','1234567890','American','University of Georgia'),
(4,'fredericksanger','Frederick','Sanger','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','fredrick_sanger@gmail.com','1234567890','British','University of Cambridge'),
(5,'piotr','Piotr','Chomczynski','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','piotr_chomczynski@yahoo.com','1234567890','Polish','Molecular Research Center'),
(6,'henrytowbin','Henry','Towbin','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','htowbin@ldeo.columbia.edu','8453658302','American','Columbia University'),
(7,'chengtehlee','Chengteh','Lee','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','chengteh_lee@gmail.com','1234567890','Chinese','University of Barcelona'),
(8,'axelbecke','Axel D.','Becke','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','axel_becke@gmail.com','1234567890','Canadian','Dalhousie University'),
(9,'jordifolch','Jordi','Folch','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','jordifolch@gmail.com','1234567890','Spanish','Harvard'),
(10,'ashish','Ashish','Vaswani','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','ashish_vaswani@gmail.com','1234567890','Indian','University of Southern California'),
(11,'furuwei','Furu','Wei','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','furuwei@gmail.com','1234567890','Chinese','Microsoft Corporation'),
(12,'junnun','Junnun','Karim','f70c6bc8eed0c6a93e0ede8ce37c47e59e588cbc6c2a43301c4507c7930adba0','junnun@gmail.com','+8801810184337','Bangladeshi','East West University'),
(13,'yousuf','Yousuf','Hozaifa','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','yousuf@gmail.com','+8801942567887','Bangladeshi','East West University');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-24 11:45:49
