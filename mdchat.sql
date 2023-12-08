CREATE DATABASE  IF NOT EXISTS `mdchat` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mdchat`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mdchat
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel` (
  `channel_type` smallint NOT NULL,
  `created` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `description` longtext NOT NULL,
  `name` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK63ahsnil6b4g7i7g9rkl0yrk9` (`user_id`),
  CONSTRAINT `FK63ahsnil6b4g7i7g9rkl0yrk9` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_approved_users_rights`
--

DROP TABLE IF EXISTS `channel_approved_users_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_approved_users_rights` (
  `can_comment` bit(1) NOT NULL,
  `can_post` bit(1) NOT NULL,
  `can_remove_comments` bit(1) NOT NULL,
  `can_remove_posts` bit(1) NOT NULL,
  `can_view` bit(1) NOT NULL,
  `channel_type` smallint NOT NULL,
  `channel_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe4cjfgs66eyq6ohv0p5u3ybc1` (`channel_id`),
  KEY `FK5hw3aq8tjx0rcjhgade74uyid` (`user_id`),
  CONSTRAINT `FK5hw3aq8tjx0rcjhgade74uyid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKe4cjfgs66eyq6ohv0p5u3ybc1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `claims_count` int NOT NULL,
  `comments_closed` bit(1) NOT NULL,
  `vote_count` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs1slvnkuemjsq2kj4h3vhx7i1` (`post_id`),
  KEY `FK8kcum44fvpupyw6f5baccx25c` (`user_id`),
  CONSTRAINT `FK8kcum44fvpupyw6f5baccx25c` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKs1slvnkuemjsq2kj4h3vhx7i1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `comments_locked` bit(1) NOT NULL,
  `vote_count` int NOT NULL,
  `channel_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `description` longtext NOT NULL,
  `post_name` text NOT NULL,
  `url` text,
  PRIMARY KEY (`id`),
  KEY `FKpvtuuee0fnilflnjmilg8w6cw` (`channel_id`),
  KEY `FK72mt33dhhs48hf9gcqrq4fxte` (`user_id`),
  KEY `FKkpnaer1neky705hud5l7o9hwm` (`post_id`),
  CONSTRAINT `FK72mt33dhhs48hf9gcqrq4fxte` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKkpnaer1neky705hud5l7o9hwm` FOREIGN KEY (`post_id`) REFERENCES `channel` (`id`),
  CONSTRAINT `FKpvtuuee0fnilflnjmilg8w6cw` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refresh_token`
--

DROP TABLE IF EXISTS `refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_token` (
  `created` datetime(6) DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_type`
--

DROP TABLE IF EXISTS `role_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_type` (
  `role_type_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `expiry_date` datetime(6) DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_g7im3j7f0g31yhl6qco2iboy5` (`user_id`),
  CONSTRAINT `FKe32ek7ixanakfqsdaokm4q9y2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `enabled` bit(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `modified` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_black_list`
--

DROP TABLE IF EXISTS `user_black_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_black_list` (
  `disable_comment` bit(1) NOT NULL,
  `disable_view` bit(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id_from` bigint NOT NULL,
  `user_id_to` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgc2c07qjn690xj3w0wivncmfm` (`user_id_from`),
  KEY `FKa78up0vlanhg36xbw2sk96rd5` (`user_id_to`),
  CONSTRAINT `FKa78up0vlanhg36xbw2sk96rd5` FOREIGN KEY (`user_id_to`) REFERENCES `user` (`id`),
  CONSTRAINT `FKgc2c07qjn690xj3w0wivncmfm` FOREIGN KEY (`user_id_from`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_channels_subscriptions`
--

DROP TABLE IF EXISTS `user_channels_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_channels_subscriptions` (
  `enabled` bit(1) NOT NULL,
  `channel_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmx7utc8rvvenjh73nlx6ja8vy` (`channel_id`),
  KEY `FK9v2ig8s4efguqvkbfdjcyyh00` (`user_id`),
  CONSTRAINT `FK9v2ig8s4efguqvkbfdjcyyh00` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKmx7utc8rvvenjh73nlx6ja8vy` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_posts_subscriptions`
--

DROP TABLE IF EXISTS `user_posts_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_posts_subscriptions` (
  `enabled` bit(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc3a1odsedo85xvhqqv4eud516` (`post_id`),
  KEY `FKtmax378r7c8vevtclixraptq4` (`user_id`),
  CONSTRAINT `FKc3a1odsedo85xvhqqv4eud516` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `FKtmax378r7c8vevtclixraptq4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `role_type_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `user_role_id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_role_id`),
  KEY `FKam20h2moa5vx5sst74becst8x` (`role_type_id`),
  KEY `FK55itppkw3i07do3h7qoclqd4k` (`user_id`),
  CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKam20h2moa5vx5sst74becst8x` FOREIGN KEY (`role_type_id`) REFERENCES `role_type` (`role_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vote` (
  `vote_type` tinyint NOT NULL,
  `comment_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `post_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `vote_id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`vote_id`),
  KEY `FKcsaksoe2iepaj8birrmithwve` (`user_id`),
  KEY `FKl3c067ewaw5xktl5cjvniv3e9` (`post_id`),
  KEY `FKpx8u9rivrirg53lsdcqvi90qo` (`comment_id`),
  CONSTRAINT `FKcsaksoe2iepaj8birrmithwve` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKl3c067ewaw5xktl5cjvniv3e9` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `FKpx8u9rivrirg53lsdcqvi90qo` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'mdchat'
--

--
-- Dumping routines for database 'mdchat'
--
/*!50003 DROP FUNCTION IF EXISTS `formatElapsedTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `formatElapsedTime`(createdTime DATETIME) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
  DECLARE elapsed INT;
  DECLARE years INT;
  DECLARE months INT;
  DECLARE days INT;
  DECLARE hours INT;
  DECLARE minutes INT;
  DECLARE result VARCHAR(255);
  DECLARE separator1 VARCHAR(10);

  SET elapsed = TIMESTAMPDIFF(SECOND, createdTime, NOW());
  SET years = FLOOR(elapsed / (60 * 60 * 24 * 365.25));
  SET elapsed = elapsed - years * (60 * 60 * 24 * 365.25);
  SET months = FLOOR(elapsed / (60 * 60 * 24 * 30.44));
  SET elapsed = elapsed - months * (60 * 60 * 24 * 30.44);
  SET days = FLOOR(elapsed / (60 * 60 * 24));
  SET elapsed = elapsed - days * (60 * 60 * 24);
  SET hours = FLOOR(elapsed / 3600);
  SET elapsed = elapsed - hours * 3600;
  SET minutes = FLOOR(elapsed / 60);

  SET result = '';
  SET separator1 = '';

  IF years > 0 THEN
    SET result = CONCAT(result, separator1, years, ' year', IF(years > 1, 's', ''));
    SET separator1 = ' ';
  END IF;

  IF months > 0 THEN
    SET result = CONCAT(result, separator1, months, ' month', IF(months > 1, 's', ''));
    SET separator1 = ' ';
  END IF;

  IF days > 0 THEN
    SET result = CONCAT(result, separator1, days, ' day', IF(days > 1, 's', ''));
    SET separator1 = ' ';
  END IF;

  IF hours > 0 THEN
    SET result = CONCAT(result, separator1, hours, ' hour', IF(hours > 1, 's', ''));
    SET separator1 = ' ';
  END IF;

  IF minutes > 0 THEN
    SET result = CONCAT(result, separator1, minutes, ' minute', IF(minutes > 1, 's', ''));
    SET separator1 = ' ';
  END IF;

  IF result = '' THEN
    SET result = 'Less than a minute';
  END IF;
  RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeUserInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeUserInfo`(IN currentUserId INT, IN userId INT, IN newUserName varchar(255), IN newEmail varchar(255), IN  newPassword varchar(255))
BEGIN
	DECLARE userExist INT;
    DECLARE currentUserName VARCHAR(255);
	IF currentUserId != userId THEN
		SELECT -userId AS id, 'You can\'t change user info' AS message;
    ELSE
        SELECT COUNT(*), u.username INTO userExist, currentUserName FROM user as u WHERE id = currentUserId;
        IF userExist>0 THEN
			UPDATE user as u
				SET u.username = newUserName,
					u.password = newPassword,
                    u.email = newEmail
				WHERE id = currentUserId;
                SELECT currentUserId AS id, 'Success updating user info' AS message;
        ELSE
			SELECT -userId AS id, CONCAT('User id',currentUserId, ' not found') AS message;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deletePost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePost`(IN postId INT, IN userId INT)
BEGIN
    DECLARE postExists INT;
    -- Check if exist record with given postId
    SELECT COUNT(*) INTO postExists FROM post WHERE id = postId;
    IF postExists > 0 THEN
    -- If post record exist
    DELETE FROM vote where post_id=postId;
    DELETE FROM user_posts_subscriptions where post_id=postId;
        DELETE FROM post WHERE id = postId;
        -- Return succes delete result
        SELECT postId AS id, 'Success deleted' AS message;
    ELSE
        -- Return unsacces delete result
        SELECT -postId AS id, 'Post not found' AS message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserInfo`(IN p_userIdentifier VARCHAR(255))
BEGIN
    DECLARE v_userId INT;
    IF p_userIdentifier REGEXP '^[0-9]+$' THEN
        SET v_userId = CAST(p_userIdentifier AS UNSIGNED);
    ELSE
        SELECT id INTO v_userId FROM user WHERE username = p_userIdentifier;
    END IF;
    SELECT id, email, username, description,
    DATE_FORMAT(created, '%d.%m.%Y %H:%i:%s') AS created,
    DATE_FORMAT(modified, '%d.%m.%Y %H:%i:%s') AS modified, 
    enabled
    FROM user WHERE id = v_userId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `searchChannelsByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchChannelsByName`(IN channelName varchar(30), IN userId INT, IN searchMode INT, IN descLength INT)
BEGIN
 -- sortMode 0 - best, 1 - hot, 2 - new, 3 -top
IF descLength IS NULL THEN
	SET descLength = 0;
END IF;
SELECT ch.id as id,
       ch.name as channelName,
       LEFT(ch.description, descLength) as channelDescription,
       ch.channel_type as channelType,
       DATE_FORMAT(ch.created, '%d-%m-%Y %H:%i:%s') as created,
       u.username as author,
       COUNT(p.id) as countPosts
FROM channel as ch
JOIN user as u ON ch.user_id = u.id
LEFT JOIN post as p ON ch.id = p.channel_id
WHERE ch.name LIKE CONCAT('%', channelName, '%')
GROUP BY id, channelName, channelDescription, channelType, created, author;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `selectChannelPosts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectChannelPosts`(channelId INT, userId INT)
BEGIN
	select * from post where channel_id=channelId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `voteForPost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `voteForPost`(IN p_userId INT, IN p_postId INT, IN p_voteType INT)
BEGIN
    DECLARE v_voteExist INT;
    SELECT vote_type INTO v_voteExist
    FROM vote
    WHERE user_id = p_userId AND post_id = p_postId AND vote_type = p_voteType;
    IF v_voteExist IS NOT NULL THEN
		SELECT -p_postId AS id, 'You are already voted' AS message;
	ELSE
        INSERT INTO vote (post_id, user_id, vote_type,created)
        VALUES (p_postId, p_userId, p_voteType,now());
        
    END IF;
    -- Обновление счетчика голосов для поста
        UPDATE post
        SET vote_count = CASE WHEN p_voteType = 1 THEN vote_count + 1 ELSE vote_count - 1 END
        WHERE id = p_postId;
    -- Успешное голосование
    SELECT p_postId AS id, 'Success voted' AS message;
END ;;
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

-- Dump completed on 2023-12-08  8:45:50
