CREATE DATABASE IF NOT EXISTS `test`;
CREATE DATABASE IF NOT EXISTS `live`;

CREATE USER 'test_user'@'%' IDENTIFIED BY 'test_user';

GRANT ALL PRIVILEGES ON *.* TO 'test_user'@'%';

use test;

DROP TABLE IF EXISTS `dockerSample`;

CREATE TABLE `dockerSample` (
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `dockerSample` WRITE;
/*!40000 ALTER TABLE `dockerSample` DISABLE KEYS */;
INSERT INTO `dockerSample` VALUES ('George'),('Sam'),('Kathy');
/*!40000 ALTER TABLE `dockerSample` ENABLE KEYS */;
UNLOCK TABLES;

