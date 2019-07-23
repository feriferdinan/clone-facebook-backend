/*
SQLyog Community v13.1.2 (64 bit)
MySQL - 10.1.38-MariaDB : Database - db_facebook
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_facebook` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_facebook`;

/*Table structure for table `comment_replies` */

DROP TABLE IF EXISTS `comment_replies`;

CREATE TABLE `comment_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comment_replies_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `feed_comments` (`id`),
  CONSTRAINT `comment_replies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comment_replies` */

/*Table structure for table `comment_responses` */

DROP TABLE IF EXISTS `comment_responses`;

CREATE TABLE `comment_responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) DEFAULT NULL,
  `response_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`),
  KEY `response_id` (`response_id`),
  CONSTRAINT `comment_responses_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `feed_comments` (`id`),
  CONSTRAINT `comment_responses_ibfk_2` FOREIGN KEY (`response_id`) REFERENCES `responses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comment_responses` */

/*Table structure for table `feed_comments` */

DROP TABLE IF EXISTS `feed_comments`;

CREATE TABLE `feed_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_id` (`feed_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `feed_comments_ibfk_1` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`),
  CONSTRAINT `feed_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feed_comments` */

/*Table structure for table `feed_responses` */

DROP TABLE IF EXISTS `feed_responses`;

CREATE TABLE `feed_responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_id` int(11) DEFAULT NULL,
  `response_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_id` (`feed_id`),
  KEY `response_id` (`response_id`),
  CONSTRAINT `feed_responses_ibfk_1` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`),
  CONSTRAINT `feed_responses_ibfk_2` FOREIGN KEY (`response_id`) REFERENCES `responses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feed_responses` */

/*Table structure for table `feeds` */

DROP TABLE IF EXISTS `feeds`;

CREATE TABLE `feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `media` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `from_group` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `feeds_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `feeds` */

insert  into `feeds`(`id`,`user_id`,`media`,`content`,`createdAt`,`updatedAt`,`from_group`) values 
(26,6,'https://images.unsplash.com/photo-1556783625-69e49a065671?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80','Halo gan :)','2019-06-26 15:25:49','2019-06-26 15:25:49',NULL);

/*Table structure for table `friends` */

DROP TABLE IF EXISTS `friends`;

CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person` int(11) DEFAULT NULL,
  `other_person` int(11) DEFAULT NULL,
  `status` enum('accepted','requested') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `friends` */

/*Table structure for table `responses` */

DROP TABLE IF EXISTS `responses`;

CREATE TABLE `responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `responses` */

/*Table structure for table `sequelizemeta` */

DROP TABLE IF EXISTS `sequelizemeta`;

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `sequelizemeta` */

insert  into `sequelizemeta`(`name`) values 
('20190624055518-create-users.js'),
('20190625045439-create-feeds.js'),
('20190625055346-create-friends.js'),
('20190625055457-create-stories.js'),
('20190625060159-create-comment-responses.js'),
('20190625060427-create-comment-replies.js'),
('20190625060545-create-feed-comments.js'),
('20190625060656-create-feed-responses.js'),
('20190625061215-create-responses.js');

/*Table structure for table `stories` */

DROP TABLE IF EXISTS `stories`;

CREATE TABLE `stories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `media` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `stories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stories` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`phone_number`,`gender`,`avatar`,`createdAt`,`updatedAt`) values 
(1,'feri','feri@gmail.com','$2b$10$9HO/p/ixBmQkMQS2vk9MyeAyRlVyOn1v2vSnrzJO/erzGtWJalEYi','087676765',1,'','2019-06-24 06:09:14','2019-06-26 08:12:41'),
(4,'ea','ea@gmail.com','$2b$10$9HO/p/ixBmQkMQS2vk9MyeAyRlVyOn1v2vSnrzJO/erzGtWJalEYi','21312321',1,NULL,'2019-06-26 02:57:57','2019-06-26 08:12:48'),
(5,'Bill Gates','bill@gmail.com','$2b$10$9HO/p/ixBmQkMQS2vk9MyeAyRlVyOn1v2vSnrzJO/erzGtWJalEYi','0293012392',1,'https://image.cnbcfm.com/api/v1/image/104907724-Bill_Gates_Wave.jpg?v=1551374691&w=1400&h=950','2019-06-26 03:17:34','2019-06-26 08:13:04'),
(6,'Mark Zukenberk','mark@gmail.com','$2b$10$9HO/p/ixBmQkMQS2vk9MyeAyRlVyOn1v2vSnrzJO/erzGtWJalEYi','045012392',1,'https://media.wired.com/photos/592676467034dc5f91beb80e/master/pass/MarkZuckerberg.jpg','2019-06-26 03:18:48','2019-06-26 08:13:10'),
(7,'Linus Torvalds','linus@gmail.com','$2b$10$9HO/p/ixBmQkMQS2vk9MyeAyRlVyOn1v2vSnrzJO/erzGtWJalEYi','045012392',1,'https://cdn.britannica.com/s:300x300/99/124299-004-225EA56D.jpg','2019-06-26 03:19:52','2019-06-26 08:13:15'),
(8,'Gilfoyle','gilfoyle@gmail.com','$2b$10$9HO/p/ixBmQkMQS2vk9MyeAyRlVyOn1v2vSnrzJO/erzGtWJalEYi','045012392',1,'https://img.sharetv.com/shows/characters/large/silicon_valley.gilfoyle.jpg','2019-06-26 03:20:40','2019-06-26 08:13:20'),
(9,'Jack Ma','jack@gmail.com','$2b$10$9HO/p/ixBmQkMQS2vk9MyeAyRlVyOn1v2vSnrzJO/erzGtWJalEYi','0865271272',1,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJvY1agogqnWtHSMjg6fgZSjSKy_t833wJki_i4vAsayqC7Ity','2019-06-26 03:22:26','2019-06-26 08:13:25'),
(10,'John Wick','wick@gmail.com','$2b$10$9HO/p/ixBmQkMQS2vk9MyeAyRlVyOn1v2vSnrzJO/erzGtWJalEYi','0865271272',1,'https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2Fa7c0a756d6b04801bd97d880c40e4113%2F960x0.jpg%3Ffit%3Dscale','2019-06-26 03:23:17','2019-06-26 08:13:31'),
(11,'Barrack Obama','obama@gmail.com','$2b$10$9HO/p/ixBmQkMQS2vk9MyeAyRlVyOn1v2vSnrzJO/erzGtWJalEYi','0876566556',1,'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/President_Barack_Obama.jpg/220px-President_Barack_Obama.jpg','2019-06-26 03:24:31','2019-06-26 08:13:51'),
(12,'eaa','eaa@gmail.com','$2b$10$yXwMkO1Hl96u63BZatZSiO/MCL9bjfCcqXRfG1e6NXqLF9yClaMK6','21312321',1,NULL,'2019-06-26 08:05:56','2019-06-26 08:05:56');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
