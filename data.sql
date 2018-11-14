-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: mysite
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add blog type',7,'add_blogtype'),(26,'Can change blog type',7,'change_blogtype'),(27,'Can delete blog type',7,'delete_blogtype'),(28,'Can view blog type',7,'view_blogtype'),(29,'Can add blog',8,'add_blog'),(30,'Can change blog',8,'change_blog'),(31,'Can delete blog',8,'delete_blog'),(32,'Can view blog',8,'view_blog'),(33,'Can add about',9,'add_about'),(34,'Can change about',9,'change_about'),(35,'Can delete about',9,'delete_about'),(36,'Can view about',9,'view_about');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$Gwudth8DA57o$HkDYg640GMbvEuczkf1YyWQYNnnLgGkHG9yCBq5JckI=','2018-11-09 04:51:44.132000',1,'tang','','','',1,1,'2018-10-25 14:44:46.699000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blog`
--

DROP TABLE IF EXISTS `blog_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_updated_time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `blog_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blog_author_id_8791af69_fk_auth_user_id` (`author_id`),
  KEY `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` (`blog_type_id`),
  CONSTRAINT `blog_blog_author_id_8791af69_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` FOREIGN KEY (`blog_type_id`) REFERENCES `blog_blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blog`
--

LOCK TABLES `blog_blog` WRITE;
/*!40000 ALTER TABLE `blog_blog` DISABLE KEYS */;
INSERT INTO `blog_blog` VALUES (19,'写在部署之前','<p>做一个属于自己的网站的想法已经挺久了，只是上个月才决定下来正式开工。大概了解全部流程以后，在centos7下选择了腾讯云的香港服务器（不需要备案），搭建了apache+mysql+php/python的环境，后端框架使用django，前端使用bootstrap的布局。刚开始也是一头雾水，因为django确实是一个很强大也很臃肿的框架，我只好不断地在网上找教程、看官方文档，总算是对网站搭建有了一些认识，也搭建起了现在这个小破站。</p>\r\n\r\n<p>&nbsp;</p>','2018-11-13 03:44:09.014342','2018-11-13 08:39:57.070808',1,1);
/*!40000 ALTER TABLE `blog_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogtype`
--

DROP TABLE IF EXISTS `blog_blogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogtype`
--

LOCK TABLES `blog_blogtype` WRITE;
/*!40000 ALTER TABLE `blog_blogtype` DISABLE KEYS */;
INSERT INTO `blog_blogtype` VALUES (1,'杂谈'),(2,'微信小程序'),(3,'学习'),(4,'Python'),(5,'Django'),(6,'HTML/CSS'),(7,'Javascript');
/*!40000 ALTER TABLE `blog_blogtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-10-25 14:52:53.091000','1','BlogType object (1)',1,'[{\"added\": {}}]',7,1),(2,'2018-10-25 14:53:03.822000','2','BlogType object (2)',1,'[{\"added\": {}}]',7,1),(3,'2018-10-25 14:53:24.834000','3','BlogType object (3)',1,'[{\"added\": {}}]',7,1),(4,'2018-10-25 14:55:42.154000','1','<Blog: 第一篇>',1,'[{\"added\": {}}]',8,1),(5,'2018-10-26 15:00:01.702000','2','<Blog: 第二篇>',1,'[{\"added\": {}}]',8,1),(6,'2018-10-26 15:04:32.570000','2','<Blog: 第二篇>',3,'',8,1),(7,'2018-10-26 15:04:32.709000','1','<Blog: 第一篇>',3,'',8,1),(8,'2018-10-26 15:05:01.838000','3','<Blog: longlong>',1,'[{\"added\": {}}]',8,1),(9,'2018-10-26 16:09:06.342000','4','<Blog: 第二批>',1,'[{\"added\": {}}]',8,1),(10,'2018-10-26 16:09:51.450000','5','<Blog: 天呐>',1,'[{\"added\": {}}]',8,1),(11,'2018-11-03 05:02:05.866000','6','<Blog: test1>',1,'[{\"added\": {}}]',8,1),(12,'2018-11-03 08:32:34.052000','7','<Blog: 12433f>',1,'[{\"added\": {}}]',8,1),(13,'2018-11-03 08:32:41.823000','8','<Blog: ewaf>',1,'[{\"added\": {}}]',8,1),(14,'2018-11-03 08:32:48.827000','9','<Blog: asfasdfewa>',1,'[{\"added\": {}}]',8,1),(15,'2018-11-05 13:58:55.802000','10','<Blog: 12131234>',1,'[{\"added\": {}}]',8,1),(16,'2018-11-05 13:59:01.549000','11','<Blog: 123123123>',1,'[{\"added\": {}}]',8,1),(17,'2018-11-05 13:59:07.522000','12','<Blog: 123rfd>',1,'[{\"added\": {}}]',8,1),(18,'2018-11-05 13:59:14.049000','13','<Blog: weq32143f>',1,'[{\"added\": {}}]',8,1),(19,'2018-11-07 10:13:51.328000','14','<Blog: 123edfvfdsb>',1,'[{\"added\": {}}]',8,1),(20,'2018-11-07 10:14:00.026000','15','<Blog: sfdvs>',1,'[{\"added\": {}}]',8,1),(21,'2018-11-07 10:14:06.679000','16','<Blog: efwwefewf>',1,'[{\"added\": {}}]',8,1),(22,'2018-11-07 10:14:13.449000','17','<Blog: ewffffffffffffffffff>',1,'[{\"added\": {}}]',8,1),(23,'2018-11-07 10:29:57.100000','17','<Blog: ewffffffffffffffffff>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(24,'2018-11-07 10:44:01.405000','17','<Blog: ewffffffffffffffffff>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(25,'2018-11-07 10:44:15.915000','17','<Blog: ewffffffffffffffffff>',2,'[]',8,1),(26,'2018-11-07 14:36:15.572000','17','<Blog: ewffffffffffffffffff>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(27,'2018-11-10 12:40:46.916000','1','公告1',1,'[{\"added\": {}}]',9,1),(28,'2018-11-10 14:03:59.002000','18','<Blog: 今天是伊阿宋打飞机啊是的看法阿三；抵抗力 放假啊算了；杜可风发纠结啊；可怜的方法就打算考虑； 就法律>',1,'[{\"added\": {}}]',8,1),(29,'2018-11-11 08:22:48.559000','1','公告1',3,'',9,1),(30,'2018-11-13 03:20:28.253945','2','微信小程序',2,'[{\"changed\": {\"fields\": [\"type_name\"]}}]',7,1),(31,'2018-11-13 03:20:41.756863','4','python',1,'[{\"added\": {}}]',7,1),(32,'2018-11-13 03:21:09.571507','5','django',1,'[{\"added\": {}}]',7,1),(33,'2018-11-13 03:21:35.366088','6','前端',1,'[{\"added\": {}}]',7,1),(34,'2018-11-13 03:28:23.948878','6','HTML/CSS',2,'[{\"changed\": {\"fields\": [\"type_name\"]}}]',7,1),(35,'2018-11-13 03:28:54.975757','5','Django',2,'[{\"changed\": {\"fields\": [\"type_name\"]}}]',7,1),(36,'2018-11-13 03:29:06.059848','4','Python',2,'[{\"changed\": {\"fields\": [\"type_name\"]}}]',7,1),(37,'2018-11-13 03:29:36.867736','7','Javascript',1,'[{\"added\": {}}]',7,1),(38,'2018-11-13 03:29:51.586417','18','<Blog: 今天是伊阿宋打飞机啊是的看法阿三；抵抗力 放假啊算了；杜可风发纠结啊；可怜的方法就打算考虑； 就法律>',3,'',8,1),(39,'2018-11-13 03:29:51.755038','17','<Blog: ewffffffffffffffffff>',3,'',8,1),(40,'2018-11-13 03:29:51.812882','16','<Blog: efwwefewf>',3,'',8,1),(41,'2018-11-13 03:29:51.863748','15','<Blog: sfdvs>',3,'',8,1),(42,'2018-11-13 03:29:51.912616','14','<Blog: 123edfvfdsb>',3,'',8,1),(43,'2018-11-13 03:29:51.971459','13','<Blog: weq32143f>',3,'',8,1),(44,'2018-11-13 03:29:52.022324','12','<Blog: 123rfd>',3,'',8,1),(45,'2018-11-13 03:29:52.113079','11','<Blog: 123123123>',3,'',8,1),(46,'2018-11-13 03:29:52.163944','10','<Blog: 12131234>',3,'',8,1),(47,'2018-11-13 03:29:52.196855','9','<Blog: asfasdfewa>',3,'',8,1),(48,'2018-11-13 03:29:52.253703','8','<Blog: ewaf>',3,'',8,1),(49,'2018-11-13 03:29:52.313542','7','<Blog: 12433f>',3,'',8,1),(50,'2018-11-13 03:29:52.363410','6','<Blog: test1>',3,'',8,1),(51,'2018-11-13 03:29:52.413275','5','<Blog: 天呐>',3,'',8,1),(52,'2018-11-13 03:29:52.455165','4','<Blog: 第二批>',3,'',8,1),(53,'2018-11-13 03:29:52.505030','3','<Blog: longlong>',3,'',8,1),(54,'2018-11-13 03:44:09.014342','19','<Blog: 写在部署之前>',1,'[{\"added\": {}}]',8,1),(55,'2018-11-13 03:54:45.340283','19','<Blog: 写在部署之前>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(56,'2018-11-13 08:39:57.135653','19','<Blog: 写在部署之前>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'blog','about'),(8,'blog','blog'),(7,'blog','blogtype'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-11-13 02:54:56.316785'),(2,'auth','0001_initial','2018-11-13 02:55:05.058541'),(3,'admin','0001_initial','2018-11-13 02:55:07.043229'),(4,'admin','0002_logentry_remove_auto_add','2018-11-13 02:55:07.082125'),(5,'admin','0003_logentry_add_action_flag_choices','2018-11-13 02:55:07.139970'),(6,'contenttypes','0002_remove_content_type_name','2018-11-13 02:55:08.434583'),(7,'auth','0002_alter_permission_name_max_length','2018-11-13 02:55:09.335174'),(8,'auth','0003_alter_user_email_max_length','2018-11-13 02:55:10.209835'),(9,'auth','0004_alter_user_username_opts','2018-11-13 02:55:10.299608'),(10,'auth','0005_alter_user_last_login_null','2018-11-13 02:55:10.968803'),(11,'auth','0006_require_contenttypes_0002','2018-11-13 02:55:11.007708'),(12,'auth','0007_alter_validators_add_error_messages','2018-11-13 02:55:11.077511'),(13,'auth','0008_alter_user_username_max_length','2018-11-13 02:55:12.026972'),(14,'auth','0009_alter_user_last_name_max_length','2018-11-13 02:55:12.984409'),(15,'blog','0001_initial','2018-11-13 02:55:15.684187'),(16,'blog','0002_auto_20181105_1714','2018-11-13 02:55:15.742030'),(17,'blog','0003_auto_20181107_1841','2018-11-13 02:55:15.850739'),(18,'blog','0004_auto_20181109_1655','2018-11-13 02:55:15.907587'),(19,'blog','0005_about','2018-11-13 02:55:16.344418'),(20,'blog','0006_delete_about','2018-11-13 02:55:16.549868'),(21,'sessions','0001_initial','2018-11-13 02:55:17.292882');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5qzq73oawcfv033ruxnk9srfgesna8b0','MzI5MTlkMDYzZWUxM2ZjNGFlYTg4ZTE1N2VjNjdkYzJkYzYxMzc2Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZGRlNmRiZjcxZjQyM2I5NTg0YTg1NzlkYjBmMDQxMGI0NzlkMTNmIn0=','2018-11-08 14:51:16.965000'),('vxsv6ndipuserolhbxutorwwh10mrgz4','MzI5MTlkMDYzZWUxM2ZjNGFlYTg4ZTE1N2VjNjdkYzJkYzYxMzc2Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZGRlNmRiZjcxZjQyM2I5NTg0YTg1NzlkYjBmMDQxMGI0NzlkMTNmIn0=','2018-11-23 04:51:44.272000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-13 21:42:05
