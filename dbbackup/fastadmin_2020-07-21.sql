# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.25)
# Database: fastadmin
# Generation Time: 2020-07-20 16:52:18 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table fa_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_admin`;

CREATE TABLE `fa_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';

LOCK TABLES `fa_admin` WRITE;
/*!40000 ALTER TABLE `fa_admin` DISABLE KEYS */;

INSERT INTO `fa_admin` (`id`, `username`, `nickname`, `password`, `salt`, `avatar`, `email`, `loginfailure`, `logintime`, `loginip`, `createtime`, `updatetime`, `token`, `status`)
VALUES
	(1,'admin','Admin','de44dbc127a4018c651e31b6464a753a','9c49ab','/assets/img/avatar.png','repheal@163.com',0,1595260724,'127.0.0.1',1492186163,1595260724,'f31fdd33-a5df-45c5-ac33-e712c902edb9','normal');

/*!40000 ALTER TABLE `fa_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_admin_log`;

CREATE TABLE `fa_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员日志表';

LOCK TABLES `fa_admin_log` WRITE;
/*!40000 ALTER TABLE `fa_admin_log` DISABLE KEYS */;

INSERT INTO `fa_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`)
VALUES
	(1,0,'Unknown','/lyhDuLEFqn.php/index/login?url=%2FlyhDuLEFqn.php','','{\"url\":\"\\/lyhDuLEFqn.php\",\"__token__\":\"7c2eb3dd7adad98b67dc0fc3b952af67\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592407076),
	(2,1,'admin','/lyhDuLEFqn.php/index/login?url=%2FlyhDuLEFqn.php','登录','{\"url\":\"\\/lyhDuLEFqn.php\",\"__token__\":\"7eb10838a57e86769c17e86e12a09f51\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592407296),
	(3,1,'admin','/lyhDuLEFqn.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"b6d6ac0c3d56acd8ec0a29b96a1f4999\",\"row\":{\"name\":\"Hoge\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{&quot;backend&quot;:&quot;zh-cn&quot;,&quot;frontend&quot;:&quot;zh-cn&quot;}\",\"fixedpage\":\"dashboard\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592407325),
	(4,0,'Unknown','/lyhDuLEFqn.php/index/login?url=%2FlyhDuLEFqn.php','','{\"url\":\"\\/lyhDuLEFqn.php\",\"__token__\":\"732c60dadf64affe0c65e698b394d0b6\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592407768),
	(5,1,'admin','/lyhDuLEFqn.php/index/login?url=%2FlyhDuLEFqn.php','登录','{\"url\":\"\\/lyhDuLEFqn.php\",\"__token__\":\"934b23005e894289db56444b6be5897f\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592407769),
	(6,1,'admin','/lyhDuLEFqn.php/index/login','登录','{\"__token__\":\"cff2a94ef47870a290050df50e7ceeea\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592407782),
	(7,1,'admin','/lyhDuLEFqn.php/auth/rule/multi/ids/3','权限管理 菜单规则','{\"action\":\"\",\"ids\":\"3\",\"params\":\"ismenu=0\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592407870),
	(8,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592407871),
	(9,1,'admin','/lyhDuLEFqn.php/auth/rule/multi/ids/4','权限管理 菜单规则','{\"action\":\"\",\"ids\":\"4\",\"params\":\"ismenu=0\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592407890),
	(10,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592407891),
	(11,1,'admin','/lyhDuLEFqn.php/user/user/edit/ids/1?dialog=1','会员管理 会员管理 编辑','{\"dialog\":\"1\",\"__token__\":\"3bd14a07099b9a1de07a6e627512b0cd\",\"row\":{\"id\":\"1\",\"group_id\":\"1\",\"username\":\"admin\",\"nickname\":\"admin\",\"password\":\"123456\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":\"2017-04-15\",\"bio\":\"\",\"money\":\"0.00\",\"score\":\"0\",\"successions\":\"1\",\"maxsuccessions\":\"1\",\"prevtime\":\"2018-01-17 14:28:12\",\"logintime\":\"2018-01-17 14:46:54\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2017-04-06 14:50:18\",\"status\":\"normal\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592407909),
	(12,1,'admin','/lyhDuLEFqn.php/auth/rule/edit/ids/5?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"1fa73010a1e8b1ac2b5a38327c164f58\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"auth\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"fa fa-group\",\"weigh\":\"99\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"5\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409368),
	(13,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409368),
	(14,1,'admin','/lyhDuLEFqn.php/auth/rule/multi/ids/5','菜单规则','{\"action\":\"\",\"ids\":\"5\",\"params\":\"ismenu=0\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409378),
	(15,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409378),
	(16,1,'admin','/lyhDuLEFqn.php/auth/rule/multi/ids/5','菜单规则','{\"action\":\"\",\"ids\":\"5\",\"params\":\"ismenu=1\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409380),
	(17,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409381),
	(18,1,'admin','/lyhDuLEFqn.php/auth/rule/edit/ids/5?dialog=1','菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"22de2995a8d4248ba1e5878967ee272f\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"auth\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"fa fa-group\",\"weigh\":\"99\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"5\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409385),
	(19,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409386),
	(20,1,'admin','/lyhDuLEFqn.php/auth/rule/edit/ids/5?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"5558ea45f41ffd00ee57e5a0e48abe18\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"auth\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"fa fa-group\",\"weigh\":\"96\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"5\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409681),
	(21,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409681),
	(22,1,'admin','/lyhDuLEFqn.php/auth/rule/edit/ids/5?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"4b5397a52644b1e72b2df165d34378c4\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"auth\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"fa fa-group\",\"weigh\":\"99\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"5\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409703),
	(23,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409703),
	(24,1,'admin','/lyhDuLEFqn.php/auth/rule/edit/ids/1?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"abd71f3e7ef41aa5dc413f7b16e0c9fd\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"dashboard\",\"title\":\"\\u63a7\\u5236\\u53f0\",\"icon\":\"fa fa-dashboard\",\"weigh\":\"143\",\"condition\":\"\",\"remark\":\"Dashboard tips\",\"status\":\"normal\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409744),
	(25,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409745),
	(26,1,'admin','/lyhDuLEFqn.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"ba54ffa0ba09f2993de166e9c085373a\",\"row\":{\"name\":\"Hoge\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{&quot;backend&quot;:&quot;zh-cn&quot;,&quot;frontend&quot;:&quot;zh-cn&quot;}\",\"fixedpage\":\"auth\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409958),
	(27,1,'admin','/lyhDuLEFqn.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"cc71e84d6b39306165b53675d134a0b9\",\"row\":{\"name\":\"Hoge\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{&quot;backend&quot;:&quot;zh-cn&quot;,&quot;frontend&quot;:&quot;zh-cn&quot;}\",\"fixedpage\":\"dashboard\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592409978),
	(28,1,'admin','/lyhDuLEFqn.php/index/login','登录','{\"__token__\":\"4b7ca87bdbcad0611ff4ad70310a10e2\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592410163),
	(29,1,'admin','/lyhDuLEFqn.php/index/login','登录','{\"__token__\":\"e6a7e994a95086bb50b8d73d97e3e6d1\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592410197),
	(30,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"banbandidi.jpeg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592491040),
	(31,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"pic\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"status\":\"normal\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592491097),
	(32,1,'admin','/lyhDuLEFqn.php/data/edit/ids/1?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"status\":\"normal\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592491135),
	(33,1,'admin','/lyhDuLEFqn.php/data/edit/ids/1?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"status\":\"normal\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592491530),
	(34,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"banbandidi.jpeg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592492547),
	(35,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"status\":\"normal\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592492557),
	(36,1,'admin','/lyhDuLEFqn.php/data/multi/ids/2','数据管理 批量更新','{\"action\":\"\",\"ids\":\"2\",\"params\":\"type=1\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592493626),
	(37,1,'admin','/lyhDuLEFqn.php/data/multi/ids/2','数据管理 批量更新','{\"action\":\"\",\"ids\":\"2\",\"params\":\"type=1\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592493627),
	(38,1,'admin','/lyhDuLEFqn.php/data/multi/ids/2','数据管理 批量更新','{\"action\":\"\",\"ids\":\"2\",\"params\":\"type=1\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592493628),
	(39,1,'admin','/lyhDuLEFqn.php/data/multi/ids/2','数据管理 批量更新','{\"action\":\"\",\"ids\":\"2\",\"params\":\"type=1\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592493629),
	(40,1,'admin','/lyhDuLEFqn.php/data/edit/ids/2?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"status\":\"normal\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592493837),
	(41,1,'admin','/lyhDuLEFqn.php/data/del/ids/2','数据管理 删除','{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592494230),
	(42,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"QI3DE49BEC07AAEAD46941D8935E3F2C.jpg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592496668),
	(43,1,'admin','/lyhDuLEFqn.php/data/edit/ids/2?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200619\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592496675),
	(44,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"57A209A46C3A3E8F07B5C8CCBBC024F5.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592496683),
	(45,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"1.mp4\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592496837),
	(46,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"1.mp4\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592496937),
	(47,1,'admin','/lyhDuLEFqn.php/data/edit/ids/2?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200619\\/aa542c0448abdaf2ce7bd05363631c08.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592496940),
	(48,1,'admin','/lyhDuLEFqn.php/auth/rule/edit/ids/105?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"41f772f1d908e5c22ca8cfa03467ac3e\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"data\",\"title\":\"\\u6570\\u636e\\u7ba1\\u7406\",\"icon\":\"fa fa-database\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"105\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592497239),
	(49,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592497239),
	(50,1,'admin','/lyhDuLEFqn.php/data/edit/ids/2?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200619\\/aa542c0448abdaf2ce7bd05363631c08.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"2\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592528837),
	(51,1,'admin','/lyhDuLEFqn.php/data/edit/ids/2?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200619\\/aa542c0448abdaf2ce7bd05363631c08.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592528851),
	(52,1,'admin','/lyhDuLEFqn.php/data/edit/ids/2?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200619\\/aa542c0448abdaf2ce7bd05363631c08.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592531263),
	(53,1,'admin','/lyhDuLEFqn.php/auth/rule/edit/ids/115?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"f3f3fbc54a9f2a159c266dc0202b5aba\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"task\",\"title\":\"\\u4efb\\u52a1\\u4e2d\\u5fc3\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"115\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592536088),
	(54,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592536088),
	(55,1,'admin','/lyhDuLEFqn.php/auth/rule/edit/ids/116?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"dff7adfd2297254ac6f75e898cca285c\",\"row\":{\"ismenu\":\"1\",\"pid\":\"115\",\"name\":\"task\\/tasklist\",\"title\":\"\\u4efb\\u52a1\\u5217\\u8868\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"116\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592536112),
	(56,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592536113),
	(57,1,'admin','/lyhDuLEFqn.php/auth/rule/edit/ids/126?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"2ace564d885e2c26b56e9089238c5459\",\"row\":{\"ismenu\":\"1\",\"pid\":\"115\",\"name\":\"task\\/taskmy\",\"title\":\"\\u6211\\u7684\\u4efb\\u52a1\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"126\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592536157),
	(58,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592536157),
	(59,1,'admin','/lyhDuLEFqn.php/auth/rule/edit/ids/115?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"6a5e97eb6c0366e170203b71d916bc9f\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"task\",\"title\":\"\\u4efb\\u52a1\\u4e2d\\u5fc3\",\"icon\":\"fa fa-tasks\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"115\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592536202),
	(60,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592536203),
	(61,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"57A209A46C3A3E8F07B5C8CCBBC024F5.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592548779),
	(62,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"690693600C865196F9794ACED2EE22A3.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592554378),
	(63,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"690693600C865196F9794ACED2EE22A3.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592554378),
	(64,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"QI3DE49BEC07AAEAD46941D8935E3F2C.jpg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592554387),
	(65,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"QI3DE49BEC07AAEAD46941D8935E3F2C.jpg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592554387),
	(66,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"690693600C865196F9794ACED2EE22A3.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592554515),
	(67,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"690693600C865196F9794ACED2EE22A3.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592554515),
	(68,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"3DE49BEC07AAEAD46941D8935E3F2C45.jpg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592554566),
	(69,1,'admin','/lyhDuLEFqn.php/auth/rule/multi/ids/66','权限管理 菜单规则','{\"action\":\"\",\"ids\":\"66\",\"params\":\"ismenu=0\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592558722),
	(70,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',1592558722),
	(71,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"QI3DE49BEC07AAEAD46941D8935E3F2C.jpg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594048871),
	(72,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200706\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200706\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594048896),
	(73,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"690693600C865196F9794ACED2EE22A3.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594049113),
	(74,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200706\\/690693600c865196f9794aced2ee22a3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200706\\/690693600c865196f9794aced2ee22a3.png\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594049122),
	(75,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"3DE49BEC07AAEAD46941D8935E3F2C45.jpg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594049347),
	(76,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200706\\/3de49bec07aaead46941d8935e3f2c45.jpg\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200706\\/3de49bec07aaead46941d8935e3f2c45.jpg\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5uu\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594049362),
	(77,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"4.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594049441),
	(78,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"2.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594049552),
	(79,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"4.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594049685),
	(80,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"2.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594049734),
	(81,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"5.jpg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594051234),
	(82,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"5.jpg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594082955),
	(83,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"4.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594083192),
	(84,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"2.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594083539),
	(85,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"5.jpg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594088108),
	(86,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"5.jpg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594089801),
	(87,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"5.jpg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594304062),
	(88,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"2.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594304739),
	(89,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"4.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594304927),
	(90,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"3.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594305069),
	(91,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"4.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594305237),
	(92,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"5.jpg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594347829),
	(93,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u622a\\u5c4f2020-07-17\\u4e0a\\u534810.20.34.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594994293),
	(94,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u622a\\u5c4f2020-07-17\\u4e0a\\u534810.19.42.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594994918),
	(95,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u622a\\u5c4f2020-07-17\\u4e0a\\u534810.21.42.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594995471),
	(96,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u622a\\u5c4f2020-07-17\\u4e0a\\u534810.20.34.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594995543),
	(97,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u622a\\u5c4f2020-07-17\\u4e0a\\u534810.19.42.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594995691),
	(98,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u622a\\u5c4f2020-07-17\\u4e0a\\u534810.20.34.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594995815),
	(99,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u622a\\u5c4f2020-07-17\\u4e0a\\u534810.21.42.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594996227),
	(100,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u622a\\u5c4f2020-07-17\\u4e0a\\u534810.21.42.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594996487),
	(101,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u622a\\u5c4f2020-07-17\\u4e0a\\u534810.20.34.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594996491),
	(102,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594997083),
	(103,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594997207),
	(104,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594997239),
	(105,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594997371),
	(106,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594997581),
	(107,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594998057),
	(108,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594998454),
	(109,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594998506),
	(110,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594998756),
	(111,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594998800),
	(112,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594998815),
	(113,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1594999468),
	(114,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595000353),
	(115,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595000792),
	(116,1,'admin','/lyhDuLEFqn.php/data/del/ids/26,25,24,23,22,21,20,19,18,17','数据管理 删除','{\"action\":\"del\",\"ids\":\"26,25,24,23,22,21,20,19,18,17\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595001072),
	(117,1,'admin','/lyhDuLEFqn.php/data/del/ids/16,15,14,13,12,11,10,9,8,7','数据管理 删除','{\"action\":\"del\",\"ids\":\"16,15,14,13,12,11,10,9,8,7\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595001077),
	(118,1,'admin','/lyhDuLEFqn.php/data/edit/ids/6?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"6\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595003753),
	(119,1,'admin','/lyhDuLEFqn.php/data/edit/ids/5?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200706\\/3de49bec07aaead46941d8935e3f2c45.jpg\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200706\\/3de49bec07aaead46941d8935e3f2c45.jpg\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5uu\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"5\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595003785),
	(120,1,'admin','/lyhDuLEFqn.php/data/edit/ids/4?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200706\\/690693600c865196f9794aced2ee22a3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200706\\/690693600c865196f9794aced2ee22a3.png\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"4\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595003788),
	(121,1,'admin','/lyhDuLEFqn.php/data/edit/ids/3?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200706\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200706\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595003791),
	(122,1,'admin','/lyhDuLEFqn.php/data/edit/ids/2?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200619\\/aa542c0448abdaf2ce7bd05363631c08.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ar\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595003793),
	(123,1,'admin','/lyhDuLEFqn.php/data/edit/ids/6?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"6\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595003840),
	(124,1,'admin','/lyhDuLEFqn.php/data/edit/ids/5?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200706\\/3de49bec07aaead46941d8935e3f2c45.jpg\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200706\\/3de49bec07aaead46941d8935e3f2c45.jpg\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5uu\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"5\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595003845),
	(125,1,'admin','/lyhDuLEFqn.php/data/edit/ids/4?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200706\\/690693600c865196f9794aced2ee22a3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200706\\/690693600c865196f9794aced2ee22a3.png\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"4\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595003848),
	(126,1,'admin','/lyhDuLEFqn.php/data/edit/ids/3?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200706\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200706\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595003851),
	(127,1,'admin','/lyhDuLEFqn.php/data/edit/ids/2?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200619\\/aa542c0448abdaf2ce7bd05363631c08.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ar\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595003855),
	(128,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"1.mp3\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595006036),
	(129,1,'admin','/lyhDuLEFqn.php/data/edit/ids/6?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"audio\",\"file\":\"\\/uploads\\/20200718\\/aaf5a61f702b368e039f27ece2f83cd9.mp3\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"6\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595006047),
	(130,1,'admin','/lyhDuLEFqn.php/data/edit/ids/6?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"audio\",\"file\":\"\\/uploads\\/20200718\\/aaf5a61f702b368e039f27ece2f83cd9.mp3\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"6\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595006360),
	(131,1,'admin','/lyhDuLEFqn.php/data/edit/ids/2?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200619\\/aa542c0448abdaf2ce7bd05363631c08.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ar\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595006384),
	(132,1,'admin','/lyhDuLEFqn.php/data/edit/ids/2?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200619\\/aa542c0448abdaf2ce7bd05363631c08.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ar\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595006403),
	(133,1,'admin','/lyhDuLEFqn.php/data/edit/ids/5?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200706\\/3de49bec07aaead46941d8935e3f2c45.jpg\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200706\\/3de49bec07aaead46941d8935e3f2c45.jpg\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5uu\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"5\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595007341),
	(134,1,'admin','/lyhDuLEFqn.php/data/edit/ids/5?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200706\\/3de49bec07aaead46941d8935e3f2c45.jpg\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200706\\/3de49bec07aaead46941d8935e3f2c45.jpg\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5uu\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"1\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"5\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595007390),
	(135,1,'admin','/lyhDuLEFqn.php/data/edit/ids/5?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200706\\/3de49bec07aaead46941d8935e3f2c45.jpg\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200706\\/3de49bec07aaead46941d8935e3f2c45.jpg\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5uu\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"1\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"5\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595007410),
	(136,1,'admin','/lyhDuLEFqn.php/data/edit/ids/6?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"audio\",\"file\":\"\\/uploads\\/20200718\\/aaf5a61f702b368e039f27ece2f83cd9.mp3\",\"title\":\"111111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"6\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595007519),
	(137,1,'admin','/lyhDuLEFqn.php/data/edit/ids/4?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200706\\/690693600c865196f9794aced2ee22a3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200706\\/690693600c865196f9794aced2ee22a3.png\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"4\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595011143),
	(138,1,'admin','/lyhDuLEFqn.php/data/edit/ids/2?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200619\\/aa542c0448abdaf2ce7bd05363631c08.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ar\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595011343),
	(139,1,'admin','/lyhDuLEFqn.php/data/edit/ids/2?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200619\\/aa542c0448abdaf2ce7bd05363631c08.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595014241),
	(140,1,'admin','/lyhDuLEFqn.php/data/edit/ids/2?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200619\\/aa542c0448abdaf2ce7bd05363631c08.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595014265),
	(141,1,'admin','/lyhDuLEFqn.php/data/edit/ids/2?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200618\\/6420110c8d1f06aa8823fc2146bf4d12.jpeg\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200619\\/aa542c0448abdaf2ce7bd05363631c08.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"200\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595014331),
	(142,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"cat.txt\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595166596),
	(143,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200710\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6587\\u672c\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595167044),
	(144,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200710\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6587\\u672c\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595167307),
	(145,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200710\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6587\\u672c\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595167411),
	(146,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200710\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6587\\u672c\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595167472),
	(147,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200710\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6587\\u672c\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595167490),
	(148,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200710\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6587\\u672c\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595167559),
	(149,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200710\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6587\\u672c\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595167599),
	(150,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200710\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6587\\u672c\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595167650),
	(151,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200710\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6587\\u672c\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595167721),
	(152,1,'admin','/lyhDuLEFqn.php/data/del/ids/16,15,14,13,12,11,10,9,8','数据管理 删除','{\"action\":\"del\",\"ids\":\"16,15,14,13,12,11,10,9,8\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595167749),
	(153,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"cat.txt\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595167893),
	(154,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595167897),
	(155,1,'admin','/lyhDuLEFqn.php/data/del/ids/17','数据管理 删除','{\"action\":\"del\",\"ids\":\"17\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595167971),
	(156,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595167989),
	(157,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595168018),
	(158,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595168133),
	(159,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595168139),
	(160,1,'admin','/lyhDuLEFqn.php/data/del/ids/21,20,19,18','数据管理 删除','{\"action\":\"del\",\"ids\":\"21,20,19,18\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595168190),
	(161,1,'admin','/lyhDuLEFqn.php/data/edit/ids/7?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200710\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6587\\u672c\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"1\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"7\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595168561),
	(162,1,'admin','/lyhDuLEFqn.php/data/edit/ids/7?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200710\\/7a160b49482dda0b2138ed6c712a9e67.jpg\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200719\\/25d0e1031eba0900f8d003b910adf926.txt\",\"title\":\"\\u6587\\u672c\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"1\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"7\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595168617),
	(163,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"dog.txt\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595169546),
	(164,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200710\\/3de49bec07aaead46941d8935e3f2c45.jpg\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200719\\/022c2a5a9a5af863910c29d2f20fcf4b.txt\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595169550),
	(165,1,'admin','/lyhDuLEFqn.php/data/edit/ids/22?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200710\\/3de49bec07aaead46941d8935e3f2c45.jpg\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200719\\/022c2a5a9a5af863910c29d2f20fcf4b.txt\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"0\",\"ar_status\":\"1\"},\"ids\":\"22\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595169672),
	(166,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"pig.txt\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595169879),
	(167,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200709\\/57a209a46c3a3e8f07b5c8ccbbc024f5.png\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200719\\/56421191913bd0400ac7929570c45d65.txt\",\"title\":\"\\u4efb\\u52a1\\u4e2d\\u5fc3\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595169882),
	(168,1,'admin','/lyhDuLEFqn.php/general/attachment/del/ids/11','常规管理 附件管理 删除','{\"action\":\"del\",\"ids\":\"11\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595169957),
	(169,1,'admin','/lyhDuLEFqn.php/general/attachment/del/ids/16','常规管理 附件管理 删除','{\"action\":\"del\",\"ids\":\"16\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595169963),
	(170,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u56db\\u5c0f\\u5929\\u9e45\\u821e\\u66f2.mp3\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595170110),
	(171,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200709\\/57a209a46c3a3e8f07b5c8ccbbc024f5.png\",\"type\":\"audio\",\"file\":\"\\/uploads\\/20200719\\/e4d6a1be9e2fa09b251b6c8b7551c00c.mp3\",\"title\":\"123321\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595170120),
	(172,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"IMG_0586.mp4\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595170599),
	(173,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200719\\/e24d4f84acf4f6513b6fc89afc897f79.mp4\",\"title\":\"123321\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595170607),
	(174,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"benla.jpg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595171277),
	(175,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200719\\/b511d118d20abfcb256732483d88f06c.jpg\",\"title\":\"\\u654f\\u611f\\u4eba\\u8138\\u8bc6\\u522b\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595171289),
	(176,1,'admin','/lyhDuLEFqn.php/data/edit/ids/26?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200719\\/b511d118d20abfcb256732483d88f06c.jpg\",\"title\":\"\\u654f\\u611f\\u4eba\\u8138\\u8bc6\\u522b\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"4\",\"ar_status\":\"1\"},\"ids\":\"26\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595171447),
	(177,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"ae1092.mp4\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595171897),
	(178,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/2b57f586afd577b9842c994ee9cb94ff.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200719\\/b44e15f4c2c767c786c9e3be8cdc3986.mp4\",\"title\":\"\\u89c6\\u9891\\u654f\\u611f\\u4eba\\u8138\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595171914),
	(179,1,'admin','/lyhDuLEFqn.php/auth/rule/multi/ids/1','权限管理 菜单规则','{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=0\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595173047),
	(180,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595173047),
	(181,1,'admin','/lyhDuLEFqn.php/auth/rule/multi/ids/115','权限管理 菜单规则','{\"action\":\"\",\"ids\":\"115\",\"params\":\"ismenu=0\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595173055),
	(182,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595173055),
	(183,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"ARTHUR.mp3\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595174783),
	(184,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"audio\",\"file\":\"\\/uploads\\/20200720\\/8de373aed5bae1f7561db99b18d3fab7.mp3\",\"title\":\"\\u97f3\\u9891\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595174801),
	(185,1,'admin','/lyhDuLEFqn.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"7d853d1c17566694d3c7f0af09d410c2\",\"row\":{\"name\":\"E\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{&quot;backend&quot;:&quot;zh-cn&quot;,&quot;frontend&quot;:&quot;zh-cn&quot;}\",\"fixedpage\":\"dashboard\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595206357),
	(186,1,'admin','/lyhDuLEFqn.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"a8c24491cdc82048c6ab5fa128147cd8\",\"row\":{\"name\":\"Easy\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{&quot;backend&quot;:&quot;zh-cn&quot;,&quot;frontend&quot;:&quot;zh-cn&quot;}\",\"fixedpage\":\"dashboard\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595206370),
	(187,1,'admin','/lyhDuLEFqn.php/index/login?url=%2FlyhDuLEFqn.php%2Fgeneral%2Fconfig%3Fref%3Daddtabs','登录','{\"url\":\"\\/lyhDuLEFqn.php\\/general\\/config?ref=addtabs\",\"__token__\":\"432fcc87869d6d84bd6d599e1eb18ad8\",\"username\":\"admin\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595206490),
	(188,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"0e6f3d3.mp4\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595207632),
	(189,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200720\\/ec2692b4d58fad84ff3e5d0adc60ebd0.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd51111\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595207649),
	(190,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"88fd35.mp4\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595209396),
	(191,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/6b9268d3b8811c0dfb45f4e6b8b63e43.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200720\\/d8c51a9dbed1460d026a4cf36a0c89cc.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5123\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595209455),
	(192,1,'admin','/lyhDuLEFqn.php/data/edit/ids/30?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/6b9268d3b8811c0dfb45f4e6b8b63e43.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200720\\/d8c51a9dbed1460d026a4cf36a0c89cc.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5123\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"2\",\"ar_status\":\"1\"},\"ids\":\"30\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595210440),
	(193,1,'admin','/lyhDuLEFqn.php/data/edit/ids/30?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/6b9268d3b8811c0dfb45f4e6b8b63e43.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200720\\/d8c51a9dbed1460d026a4cf36a0c89cc.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5123\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"2\",\"ar_status\":\"1\"},\"ids\":\"30\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595210567),
	(194,1,'admin','/lyhDuLEFqn.php/data/edit/ids/30?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/6b9268d3b8811c0dfb45f4e6b8b63e43.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200720\\/d8c51a9dbed1460d026a4cf36a0c89cc.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5123\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"2\",\"ar_status\":\"2\"},\"ids\":\"30\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595210605),
	(195,1,'admin','/lyhDuLEFqn.php/data/edit/ids/30?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/6b9268d3b8811c0dfb45f4e6b8b63e43.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200720\\/d8c51a9dbed1460d026a4cf36a0c89cc.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd5123\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"2\",\"ar_status\":\"1\"},\"ids\":\"30\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595210637),
	(196,1,'admin','/lyhDuLEFqn.php/data/edit/ids/30?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/6b9268d3b8811c0dfb45f4e6b8b63e43.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200720\\/d8c51a9dbed1460d026a4cf36a0c89cc.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd53333\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"2\",\"ar_status\":\"1\"},\"ids\":\"30\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595210646),
	(197,1,'admin','/lyhDuLEFqn.php/data/edit/ids/30?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/6b9268d3b8811c0dfb45f4e6b8b63e43.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200720\\/d8c51a9dbed1460d026a4cf36a0c89cc.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd53333\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"2\",\"ar_status\":\"1\"},\"ids\":\"30\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595210698),
	(198,1,'admin','/lyhDuLEFqn.php/data/edit/ids/30?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/6b9268d3b8811c0dfb45f4e6b8b63e43.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200720\\/d8c51a9dbed1460d026a4cf36a0c89cc.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd53332\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"2\",\"ar_status\":\"1\"},\"ids\":\"30\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595210734),
	(199,1,'admin','/lyhDuLEFqn.php/data/edit/ids/30?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/6b9268d3b8811c0dfb45f4e6b8b63e43.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200720\\/ec2692b4d58fad84ff3e5d0adc60ebd0.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd53332\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"2\",\"ar_status\":\"1\"},\"ids\":\"30\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595210825),
	(200,1,'admin','/lyhDuLEFqn.php/data/edit/ids/30?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/6b9268d3b8811c0dfb45f4e6b8b63e43.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200619\\/aa542c0448abdaf2ce7bd05363631c08.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd53332\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"2\",\"ar_status\":\"1\"},\"ids\":\"30\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595210855),
	(201,1,'admin','/lyhDuLEFqn.php/data/edit/ids/30?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/6b9268d3b8811c0dfb45f4e6b8b63e43.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200719\\/e24d4f84acf4f6513b6fc89afc897f79.mp4\",\"title\":\"\\u6211\\u662f\\u6d4b\\u8bd53332\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"2\",\"ar_status\":\"1\"},\"ids\":\"30\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595211991),
	(202,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u8d5b\\u8783\\u87f9-0.jpeg\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595219207),
	(203,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/39f47aa730b6aac154e38157257e77b3.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200720\\/b1fc013713ddae60dac72cf029fe6571.jpeg\",\"title\":\"\\u8783\\u87f9\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595219214),
	(204,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"sadamu.jpeg\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595221411),
	(205,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/6b9268d3b8811c0dfb45f4e6b8b63e43.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200720\\/9c41398a5b8c3dfa55b3d0c02a19c148.jpeg\",\"title\":\"\\u5c0f\\u8428\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595221420),
	(206,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"sadamu-1.jpeg\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595221643),
	(207,1,'admin','/lyhDuLEFqn.php/data/edit/ids/32?dialog=1','数据管理 编辑','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200717\\/6b9268d3b8811c0dfb45f4e6b8b63e43.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200720\\/6d9d6c0cefbe8be9b9182d5855c28ecf.jpeg\",\"title\":\"\\u5c0f\\u8428\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"5\",\"ai_status\":\"2\",\"ar_status\":\"1\"},\"ids\":\"32\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595221646),
	(208,1,'admin','/lyhDuLEFqn.php/general/attachment/del/ids/21','常规管理 附件管理 删除','{\"action\":\"del\",\"ids\":\"21\",\"params\":\"\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595226091),
	(209,1,'admin','/lyhDuLEFqn.php/index/login?url=%2FlyhDuLEFqn.php','登录','{\"url\":\"\\/lyhDuLEFqn.php\",\"__token__\":\"be3b1f1306c6d12374d1a9e21cbede5e\",\"username\":\"admin\"}','10.0.1.35','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595229909),
	(210,1,'admin','/lyhDuLEFqn.php/index/login','登录','{\"__token__\":\"75a5b5efe3f66255239f92386c4e76c1\",\"username\":\"admin\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595229926),
	(211,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u8584\\u7199\\u6765.jpeg\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230297),
	(212,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200720\\/b1fc013713ddae60dac72cf029fe6571.jpeg\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200720\\/d9a31a85c344435be447bf6560f85f19.jpeg\",\"title\":\"\\u653f\\u6cbb\\u4eba\\u7269\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230329),
	(213,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u674e\\u514b\\u5f3a.jpg\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230529),
	(214,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据管理 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200720\\/b1fc013713ddae60dac72cf029fe6571.jpeg\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200720\\/d6ad46645700cedea5d18ef5e886545f.jpg\",\"title\":\"\\u653f\\u6cbb\\u4eba\\u7269\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230581),
	(215,1,'admin','/lyhDuLEFqn.php/auth/rule/multi/ids/115','权限管理 菜单规则','{\"action\":\"\",\"ids\":\"115\",\"params\":\"ismenu=1\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230609),
	(216,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230609),
	(217,1,'admin','/lyhDuLEFqn.php/auth/rule/add?dialog=1','权限管理 菜单规则 添加','{\"dialog\":\"1\",\"__token__\":\"3eba181c5875186d1d1fe10e050cd98b\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"task\",\"title\":\"\\u5f00\\u653e\\u63a5\\u53e3\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230645),
	(218,1,'admin','/lyhDuLEFqn.php/auth/rule/add?dialog=1','权限管理 菜单规则 添加','{\"dialog\":\"1\",\"__token__\":\"78ea4c330e46823f8fe5ac9de6c52c09\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"task\\/1\",\"title\":\"\\u5f00\\u653e\\u63a5\\u53e3\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230655),
	(219,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230656),
	(220,1,'admin','/lyhDuLEFqn.php/auth/rule/add?dialog=1','权限管理 菜单规则 添加','{\"dialog\":\"1\",\"__token__\":\"560a6ccb659e34a7108ef77869d2c274\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"task\\/2\",\"title\":\"\\u7edf\\u8ba1\\u4e2d\\u5fc3\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230681),
	(221,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230681),
	(222,1,'admin','/lyhDuLEFqn.php/auth/rule/multi/ids/1','权限管理 菜单规则','{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=1\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230698),
	(223,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230698),
	(224,1,'admin','/lyhDuLEFqn.php/auth/rule/edit/ids/1?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"96ce9876e8eb433587f38150cd5c8bff\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"dashboard\",\"title\":\"\\u4e2a\\u4eba\\u5de5\\u4f5c\\u53f0\",\"icon\":\"fa fa-dashboard\",\"weigh\":\"143\",\"condition\":\"\",\"remark\":\"Dashboard tips\",\"status\":\"normal\"},\"ids\":\"1\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230718),
	(225,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230718),
	(226,1,'admin','/lyhDuLEFqn.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"35cb5df8823a10eb80b5045dcb77dceb\",\"row\":{\"name\":\"\\u767d\\u6cfd\\u667a\\u80fd-\\u5ba1\\u6838\\u5e73\\u53f0\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{&quot;backend&quot;:&quot;zh-cn&quot;,&quot;frontend&quot;:&quot;zh-cn&quot;}\",\"fixedpage\":\"dashboard\"}}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595230950),
	(227,1,'admin','/lyhDuLEFqn.php/auth/rule/edit/ids/105?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"7aae624aeca03c0c3983bd7cec8cd21a\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"data\",\"title\":\"\\u6570\\u636e\\u4e2d\\u5fc3\",\"icon\":\"fa fa-database\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"105\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595231638),
	(228,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595231638),
	(229,1,'admin','/lyhDuLEFqn.php/auth/rule/add?dialog=1','权限管理 菜单规则 添加','{\"dialog\":\"1\",\"__token__\":\"2819e0b22fb120a006655175ecff79a0\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"auditSetting\",\"title\":\"\\u5ba1\\u6838\\u914d\\u7f6e\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595231717),
	(230,1,'admin','/lyhDuLEFqn.php/auth/rule/add?dialog=1','权限管理 菜单规则 添加','{\"dialog\":\"1\",\"__token__\":\"c3db356f31b3c912546217034a58826b\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"audit_setting\",\"title\":\"\\u5ba1\\u6838\\u914d\\u7f6e\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595231727),
	(231,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595231728),
	(232,1,'admin','/lyhDuLEFqn.php/auth/rule/add?dialog=1','权限管理 菜单规则 添加','{\"dialog\":\"1\",\"__token__\":\"7a7f46787d2fa149222992620844768d\",\"row\":{\"ismenu\":\"1\",\"pid\":\"138\",\"name\":\"audit_setting\\/sface\",\"title\":\"\\u4eba\\u8138\\u7b56\\u7565\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595231782),
	(233,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595231782),
	(234,1,'admin','/lyhDuLEFqn.php/auth/rule/add?dialog=1','权限管理 菜单规则 添加','{\"dialog\":\"1\",\"__token__\":\"bedb541cff9c57842488c1b4459a841d\",\"row\":{\"ismenu\":\"1\",\"pid\":\"138\",\"name\":\"audit_setting\\/text\",\"title\":\"\\u6587\\u672c\\u7b56\\u7565\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595231804),
	(235,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595231804),
	(236,1,'admin','/lyhDuLEFqn.php/auth/rule/add?dialog=1','权限管理 菜单规则 添加','{\"dialog\":\"1\",\"__token__\":\"2667e7fee0fff637fdf548ad1f0c4767\",\"row\":{\"ismenu\":\"1\",\"pid\":\"138\",\"name\":\"audit_setting\\/image\",\"title\":\"\\u56fe\\u50cf\\u7b56\\u7565\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595231829),
	(237,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595231829),
	(238,1,'admin','/lyhDuLEFqn.php/auth/rule/multi/ids/3','权限管理 菜单规则','{\"action\":\"\",\"ids\":\"3\",\"params\":\"ismenu=1\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595232109),
	(239,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595232109),
	(240,1,'admin','/lyhDuLEFqn.php/auth/rule/multi/ids/3','权限管理 菜单规则','{\"action\":\"\",\"ids\":\"3\",\"params\":\"ismenu=0\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595232134),
	(241,1,'admin','/lyhDuLEFqn.php/index/index','','{\"action\":\"refreshmenu\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595232135),
	(242,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"76dbe3a.mp4\"}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595233702),
	(243,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据中心 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/uploads\\/20200710\\/3de49bec07aaead46941d8935e3f2c45.jpg\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200720\\/2472f175792c45fcecec53f3fa45f7d8.mp4\",\"title\":\"\\u89c6\\u9891\\u4eba\\u8138\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','10.0.30.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595233714),
	(244,1,'admin','/lyhDuLEFqn.php/index/login?url=%2FlyhDuLEFqn.php','登录','{\"url\":\"\\/lyhDuLEFqn.php\",\"__token__\":\"7d9b9e538aaba6481cf7ddf951742e53\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595252593),
	(245,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"sup-dog.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595253129),
	(246,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256001),
	(247,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256001),
	(248,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256011),
	(249,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256011),
	(250,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256019),
	(251,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256019),
	(252,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256021),
	(253,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256021),
	(254,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256031),
	(255,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256032),
	(256,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256041),
	(257,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256041),
	(258,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256051),
	(259,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256051),
	(260,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256061),
	(261,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256061),
	(262,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256071),
	(263,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256071),
	(264,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256081),
	(265,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256082),
	(266,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256091),
	(267,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256091),
	(268,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256101),
	(269,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256101),
	(270,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256111),
	(271,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256111),
	(272,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256121),
	(273,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256121),
	(274,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256131),
	(275,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256131),
	(276,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256143),
	(277,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256143),
	(278,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256152),
	(279,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256152),
	(280,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256161),
	(281,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256161),
	(282,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256171),
	(283,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256171),
	(284,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256182),
	(285,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256182),
	(286,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256193),
	(287,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256193),
	(288,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256201),
	(289,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256201),
	(290,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256211),
	(291,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256211),
	(292,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256221),
	(293,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256221),
	(294,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256232),
	(295,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256232),
	(296,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256241),
	(297,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256241),
	(298,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256251),
	(299,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256251),
	(300,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256261),
	(301,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256261),
	(302,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256271),
	(303,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256271),
	(304,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256281),
	(305,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256281),
	(306,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256291),
	(307,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256291),
	(308,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256300),
	(309,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256301),
	(310,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256311),
	(311,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256311),
	(312,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256321),
	(313,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256321),
	(314,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256331),
	(315,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256331),
	(316,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256341),
	(317,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256341),
	(318,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256351),
	(319,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256351),
	(320,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256360),
	(321,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256360),
	(322,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256371),
	(323,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256371),
	(324,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256382),
	(325,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256382),
	(326,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256391),
	(327,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256391),
	(328,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256401),
	(329,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256401),
	(330,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256411),
	(331,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256411),
	(332,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256421),
	(333,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256421),
	(334,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256431),
	(335,0,'Unknown','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"time.jpeg\",\"file\":\"@\\/Users\\/repheal\\/Downloads\\/timg-1.jpeg\"}','127.0.0.1','',1595256431),
	(336,1,'admin','/lyhDuLEFqn.php/index/login?url=%2FlyhDuLEFqn.php%2Fdata%3Fref%3Daddtabs','登录','{\"url\":\"\\/lyhDuLEFqn.php\\/data?ref=addtabs\",\"__token__\":\"8147d8a0bd1653b03cc0e83977129f8e\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595260724),
	(337,1,'admin','/lyhDuLEFqn.php/data/del/ids/35,34,33,32,31,30,29,28,27,26,25,24,23,22,7,6,5,4,3,2','数据中心 删除','{\"action\":\"del\",\"ids\":\"35,34,33,32,31,30,29,28,27,26,25,24,23,22,7,6,5,4,3,2\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595260733),
	(338,1,'admin','/lyhDuLEFqn.php/general/attachment/del/ids/47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,29,28,27,26,25,24,23,22,20,19,18,17,15,14,13,12,10,9,8,7,6,5,4,3,2','常规管理 附件管理 删除','{\"action\":\"del\",\"ids\":\"47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,29,28,27,26,25,24,23,22,20,19,18,17,15,14,13,12,10,9,8,7,6,5,4,3,2\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595260755),
	(339,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"2.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595261119),
	(340,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u622a\\u5c4f2020-07-21\\u4e0a\\u534812.12.17.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595261638),
	(341,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u622a\\u5c4f2020-07-21\\u4e0a\\u534812.13.00.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595261658),
	(342,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u622a\\u5c4f2020-07-21\\u4e0a\\u534812.13.21.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595261667),
	(343,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u622a\\u5c4f2020-07-21\\u4e0a\\u534812.13.34.png\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595261676),
	(344,1,'admin','/lyhDuLEFqn.php/general/attachment/edit/ids/50?dialog=1','常规管理 附件管理 编辑','{\"dialog\":\"1\",\"row\":{\"url\":\"\\/assets\\/img\\/qrcode.png\",\"imagewidth\":\"140\",\"imageheight\":\"110\",\"imagetype\":\"png\",\"imageframes\":\"0\",\"filesize\":\"7737\",\"mimetype\":\"image\\/png\",\"extparam\":\"{&quot;name&quot;:&quot;\\\\u622a\\\\u5c4f2020-07-21\\\\u4e0a\\\\u534812.12.17.png&quot;}\",\"uploadtime\":\"2020-07-21 00:13:58\",\"storage\":\"local\"},\"ids\":\"50\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595261802),
	(345,1,'admin','/lyhDuLEFqn.php/general/attachment/edit/ids/50?dialog=1','常规管理 附件管理 编辑','{\"dialog\":\"1\",\"row\":{\"url\":\"\\/assets\\/img\\/video.png\",\"imagewidth\":\"140\",\"imageheight\":\"110\",\"imagetype\":\"png\",\"imageframes\":\"0\",\"filesize\":\"7737\",\"mimetype\":\"image\\/png\",\"extparam\":\"{&quot;name&quot;:&quot;\\\\u622a\\\\u5c4f2020-07-21\\\\u4e0a\\\\u534812.12.17.png&quot;}\",\"uploadtime\":\"2020-07-21 00:13:58\",\"storage\":\"local\"},\"ids\":\"50\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595261811),
	(346,1,'admin','/lyhDuLEFqn.php/general/attachment/edit/ids/51?dialog=1','常规管理 附件管理 编辑','{\"dialog\":\"1\",\"row\":{\"url\":\"\\/assets\\/img\\/image.png\",\"imagewidth\":\"124\",\"imageheight\":\"96\",\"imagetype\":\"png\",\"imageframes\":\"0\",\"filesize\":\"6011\",\"mimetype\":\"image\\/png\",\"extparam\":\"{&quot;name&quot;:&quot;\\\\u622a\\\\u5c4f2020-07-21\\\\u4e0a\\\\u534812.13.00.png&quot;}\",\"uploadtime\":\"2020-07-21 00:14:18\",\"storage\":\"local\"},\"ids\":\"51\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595261850),
	(347,1,'admin','/lyhDuLEFqn.php/general/attachment/edit/ids/52?dialog=1','常规管理 附件管理 编辑','{\"dialog\":\"1\",\"row\":{\"url\":\"\\/assets\\/img\\/text.png\",\"imagewidth\":\"110\",\"imageheight\":\"108\",\"imagetype\":\"png\",\"imageframes\":\"0\",\"filesize\":\"5192\",\"mimetype\":\"image\\/png\",\"extparam\":\"{&quot;name&quot;:&quot;\\\\u622a\\\\u5c4f2020-07-21\\\\u4e0a\\\\u534812.13.21.png&quot;}\",\"uploadtime\":\"2020-07-21 00:14:27\",\"storage\":\"local\"},\"ids\":\"52\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595261887),
	(348,1,'admin','/lyhDuLEFqn.php/general/attachment/edit/ids/53?dialog=1','常规管理 附件管理 编辑','{\"dialog\":\"1\",\"row\":{\"url\":\"\\/assets\\/img\\/audio.png\",\"imagewidth\":\"106\",\"imageheight\":\"84\",\"imagetype\":\"png\",\"imageframes\":\"0\",\"filesize\":\"6105\",\"mimetype\":\"image\\/png\",\"extparam\":\"{&quot;name&quot;:&quot;\\\\u622a\\\\u5c4f2020-07-21\\\\u4e0a\\\\u534812.13.34.png&quot;}\",\"uploadtime\":\"2020-07-21 00:14:36\",\"storage\":\"local\"},\"ids\":\"53\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595261915),
	(349,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"76dbe3a.mp4\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595261969),
	(350,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据中心 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/assets\\/img\\/video.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200721\\/2472f175792c45fcecec53f3fa45f7d8.mp4\",\"title\":\"\\u5173\\u4e8e\\u5965\\u5df4\\u9a6c\\u89c6\\u9891\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595261991),
	(351,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u8584\\u7199\\u6765.jpeg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595263276),
	(352,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据中心 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/assets\\/img\\/image.png\",\"type\":\"pic\",\"file\":\"\\/uploads\\/20200721\\/d9a31a85c344435be447bf6560f85f19.jpeg\",\"title\":\"\\u5173\\u4e8e\\u8584\\u7199\\u6765\\u654f\\u611f\\u4eba\\u7269\\u5934\\u50cf\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595263295),
	(353,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"benla.jpg\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595263616),
	(354,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据中心 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/assets\\/img\\/image.png\",\"type\":\"video\",\"file\":\"\\/uploads\\/20200721\\/b511d118d20abfcb256732483d88f06c.jpg\",\"title\":\"\\u5173\\u4e8e\\u654f\\u611f\\u4efb\\u52a1\\u672c\\u62c9\\u767b\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595263631),
	(355,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"\\u674e\\u73b2\\u7389 - \\u7c89\\u7ea2\\u8272\\u7684\\u56de\\u5fc6.mp3\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595263678),
	(356,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据中心 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/assets\\/img\\/audio.png\",\"type\":\"audio\",\"file\":\"\\/uploads\\/20200721\\/aaf5a61f702b368e039f27ece2f83cd9.mp3\",\"title\":\"\\u97f3\\u4e50\\u97f3\\u9891\\u6587\\u5b57\\u8bc6\\u522b\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595263698),
	(357,1,'admin','/lyhDuLEFqn.php/ajax/upload','','{\"name\":\"pig.txt\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595263754),
	(358,1,'admin','/lyhDuLEFqn.php/data/add?dialog=1','数据中心 添加','{\"dialog\":\"1\",\"row\":{\"index_pic\":\"\\/assets\\/img\\/text.png\",\"type\":\"txt\",\"file\":\"\\/uploads\\/20200721\\/56421191913bd0400ac7929570c45d65.txt\",\"title\":\"\\u6587\\u5b57\\u5185\\u5bb9\\u8bc6\\u522b\\u6d4b\\u8bd5\",\"filesize\":\"0\",\"author\":\"\\u65e0\\u540d\",\"source\":\"ai\",\"data_status\":\"0\",\"ai_status\":\"0\",\"ar_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36',1595263764);

/*!40000 ALTER TABLE `fa_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_area
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_area`;

CREATE TABLE `fa_area` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简称',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) DEFAULT NULL COMMENT '层级 0 1 2 省市区县',
  `pinyin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='地区表';



# Dump of table fa_attachment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_attachment`;

CREATE TABLE `fa_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '透传数据',
  `need_ai` tinyint(3) DEFAULT '1' COMMENT '是否AI请求数据',
  `airesult` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AI结果',
  `is_aisuccess` tinyint(3) DEFAULT '0' COMMENT 'ai是否分析完毕',
  `is_aisyncrelation` tinyint(3) DEFAULT '0' COMMENT '是否同步关系表',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='附件表';

LOCK TABLES `fa_attachment` WRITE;
/*!40000 ALTER TABLE `fa_attachment` DISABLE KEYS */;

INSERT INTO `fa_attachment` (`id`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filesize`, `mimetype`, `extparam`, `need_ai`, `airesult`, `is_aisuccess`, `is_aisyncrelation`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`)
VALUES
	(1,1,0,'/assets/img/qrcode.png','150','150','png',0,21859,'image/png','',0,'',0,0,1499681848,1595217633,1499681848,'local','17163603d0263e4838b9387ff2cd4877e8b018f6'),
	(2,1,0,'/assets/img/video.png','140','110','png',0,7737,'image/png','{\"name\":\"\\u622a\\u5c4f2020-07-21\\u4e0a\\u534812.12.17.png\"}',0,'',0,0,1595261638,1595261811,1595261638,'local','52ca2aa799942e4a9c52a3c32790b425ce63d95d'),
	(3,1,0,'/assets/img/image.png','124','96','png',0,6011,'image/png','{\"name\":\"\\u622a\\u5c4f2020-07-21\\u4e0a\\u534812.13.00.png\"}',0,'',0,0,1595261658,1595261850,1595261658,'local','0254630b917511982f825271742958cd47bd6f48'),
	(4,1,0,'/assets/img/text.png','110','108','png',0,5192,'image/png','{\"name\":\"\\u622a\\u5c4f2020-07-21\\u4e0a\\u534812.13.21.png\"}',0,'',0,0,1595261667,1595261887,1595261667,'local','b1a25ab0f2df7ba8c1ce0a622e2ebf3c12f42a76'),
	(5,1,0,'/assets/img/audio.png','106','84','png',0,6105,'image/png','{\"name\":\"\\u622a\\u5c4f2020-07-21\\u4e0a\\u534812.13.34.png\"}',0,'',0,0,1595261676,1595261915,1595261676,'local','bf4c3bc5ff2868bdd130295ce3cbd2efe2c6e2dd'),
	(54,1,0,'/uploads/20200721/2472f175792c45fcecec53f3fa45f7d8.mp4','','','mp4',0,4573701,'video/mp4','{\"name\":\"76dbe3a.mp4\"}',1,'{\"code\":200,\"data\":[{\"audioScanResults\":[{\"details\":[{\"endTime\":40,\"label\":\"normal\",\"startTime\":0,\"text\":\"more than anything the spend them in is forty five way to make the current on the idea that so many the focus church and not what know what the more even pretending to be interest\\u3002\\u8fd9\\u8fb9\\u662f\\u4e0a\\u6d77\\u73cd\\u8d35\\uff0chad a great weekend to get a lot of\\u5443jfk meeting for my progress we made many friends in including a\\u4ed6\\u4eec\\u5e94\\u8be5\\u4e0d\\u4f1a\\u662fiq for the help of black\\u5148\\u751f\\u3002\\u90a3\\u542c\\u6211\\u662f\\u770b\\u4e0d\\u7a7fgrowing up and thank you\\u3002\"}],\"label\":\"normal\",\"rate\":99.91,\"scene\":\"antispam\",\"suggestion\":\"pass\"}],\"code\":200,\"dataId\":\"5f15c42704b570.15621955\",\"msg\":\"OK\",\"results\":[{\"label\":\"normal\",\"rate\":99.9,\"scene\":\"porn\",\"suggestion\":\"pass\"},{\"frames\":[{\"label\":\"politics\",\"offset\":3,\"rate\":77.82,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":77.82}],\"h\":493,\"w\":493,\"x\":255,\"y\":22}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00004.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=i2JxVRNeEAOTFXtif971iZhheGY%3D\"},{\"label\":\"politics\",\"offset\":4,\"rate\":75.21,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":75.21}],\"h\":469,\"w\":469,\"x\":255,\"y\":10}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00005.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=MuRCq3bPudj%2BCQNZOb7YC%2FSgVfM%3D\"},{\"label\":\"politics\",\"offset\":5,\"rate\":76.72,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":76.72}],\"h\":476,\"w\":476,\"x\":272,\"y\":30}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00006.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=%2Bx3c4VA4gaSgZwPqVQDTmALZsek%3D\"},{\"label\":\"politics\",\"offset\":11,\"rate\":71.8,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":71.8}],\"h\":478,\"w\":478,\"x\":313,\"y\":74}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00012.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Jw85F9o3X4YncVqQxG9sQ7kskm0%3D\"},{\"label\":\"politics\",\"offset\":12,\"rate\":77.97,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":77.97}],\"h\":501,\"w\":501,\"x\":253,\"y\":57}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00013.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=5JEK2UQrJp8jCLSAPAtDfqQRnog%3D\"},{\"label\":\"politics\",\"offset\":29,\"rate\":74.8,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":74.8}],\"h\":122,\"w\":122,\"x\":461,\"y\":34}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00030.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=eZ45iZXP5OPIIXgNtUu7d0ezRpE%3D\"},{\"label\":\"politics\",\"offset\":30,\"rate\":75.3,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":75.3}],\"h\":124,\"w\":124,\"x\":456,\"y\":36}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00031.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Gw0Cz6yFid3jPD5rs2n3mww%2Bb5E%3D\"},{\"label\":\"politics\",\"offset\":31,\"rate\":71.01,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":71.01}],\"h\":126,\"w\":126,\"x\":428,\"y\":30}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00032.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=k2DGEwUbZFc6RmgJfCAECQph4yc%3D\"},{\"label\":\"politics\",\"offset\":35,\"rate\":70.77,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":70.77}],\"h\":118,\"w\":118,\"x\":460,\"y\":36}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00036.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=6qEzYWPrVq1ikcmSMHRvN1A1rXo%3D\"},{\"label\":\"politics\",\"offset\":36,\"rate\":74.86,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":74.86}],\"h\":124,\"w\":124,\"x\":414,\"y\":31}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00037.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=IEtKvflrt9zAFugC3drlS3QsgbI%3D\"},{\"label\":\"politics\",\"offset\":37,\"rate\":73.68,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":73.68}],\"h\":126,\"w\":126,\"x\":434,\"y\":22}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00038.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=omA6DKaMg9uGdlJF1GGPyRxXH6Y%3D\"},{\"label\":\"politics\",\"offset\":38,\"rate\":73.36,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":73.36}],\"h\":120,\"w\":120,\"x\":505,\"y\":32}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00039.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=FRqFfQCfToGRvuIuQvm%2BIpkX6xk%3D\"}],\"label\":\"terrorism\",\"rate\":77.97,\"scene\":\"terrorism\",\"suggestion\":\"review\"},{\"label\":\"normal\",\"rate\":99.9,\"scene\":\"live\",\"suggestion\":\"pass\"},{\"label\":\"normal\",\"rate\":99.9,\"scene\":\"logo\",\"suggestion\":\"pass\"},{\"label\":\"normal\",\"rate\":99.9,\"scene\":\"ad\",\"suggestion\":\"pass\"},{\"frames\":[{\"label\":\"sface\",\"offset\":0,\"rate\":0,\"sfaceData\":[{\"h\":457,\"w\":457,\"x\":239,\"y\":2}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00001.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=uftiQH3CwvEB5Pc24J%2FTwzUDHko%3D\"},{\"label\":\"sface\",\"offset\":1,\"rate\":78.3,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":78.3}],\"h\":508,\"w\":508,\"x\":277,\"y\":2}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00002.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=vtq1QoZwpi3cF%2BtdA582XuWk99Y%3D\"},{\"label\":\"sface\",\"offset\":2,\"rate\":64.7,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":64.7}],\"h\":469,\"w\":469,\"x\":279,\"y\":2}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00003.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=X27%2FEgR9bLBrEuRDdBReQ0Q6Y9E%3D\"},{\"label\":\"sface\",\"offset\":3,\"rate\":77.82,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":77.82}],\"h\":493,\"w\":493,\"x\":255,\"y\":22}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00004.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=i2JxVRNeEAOTFXtif971iZhheGY%3D\"},{\"label\":\"sface\",\"offset\":4,\"rate\":75.21,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":75.21}],\"h\":469,\"w\":469,\"x\":255,\"y\":10}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00005.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=MuRCq3bPudj%2BCQNZOb7YC%2FSgVfM%3D\"},{\"label\":\"sface\",\"offset\":5,\"rate\":76.72,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":76.72}],\"h\":476,\"w\":476,\"x\":272,\"y\":30}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00006.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=%2Bx3c4VA4gaSgZwPqVQDTmALZsek%3D\"},{\"label\":\"sface\",\"offset\":6,\"rate\":69.6,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":69.6}],\"h\":478,\"w\":478,\"x\":263,\"y\":29}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00007.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=pOFivEEcc%2B%2FHQMtsVvEOxKBeT%2BA%3D\"},{\"label\":\"sface\",\"offset\":7,\"rate\":80.55,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":80.55}],\"h\":513,\"w\":513,\"x\":235,\"y\":27}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00008.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Mife0r2niS3P11HTmTOxsu420P8%3D\"},{\"label\":\"sface\",\"offset\":8,\"rate\":0,\"sfaceData\":[{\"h\":527,\"w\":527,\"x\":265,\"y\":95}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00009.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=G7cioEK73Sd383LLb5GbSqLbSEQ%3D\"},{\"label\":\"sface\",\"offset\":9,\"rate\":75.91,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":75.91}],\"h\":490,\"w\":490,\"x\":281,\"y\":66}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00010.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=DnLPIcFAZdwZLWXw4TEVY6K25BA%3D\"},{\"label\":\"sface\",\"offset\":10,\"rate\":67.6,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":67.6}],\"h\":483,\"w\":483,\"x\":316,\"y\":-4}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00011.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=1SYk13IPhp2HDX57feDKyqY3huM%3D\"},{\"label\":\"sface\",\"offset\":11,\"rate\":71.8,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":71.8}],\"h\":478,\"w\":478,\"x\":313,\"y\":74}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00012.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Jw85F9o3X4YncVqQxG9sQ7kskm0%3D\"},{\"label\":\"sface\",\"offset\":12,\"rate\":77.97,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018209\",\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":77.97}],\"h\":501,\"w\":501,\"x\":253,\"y\":57}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00013.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=5JEK2UQrJp8jCLSAPAtDfqQRnog%3D\"},{\"label\":\"sface\",\"offset\":13,\"rate\":65.17,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":65.17}],\"h\":119,\"w\":119,\"x\":363,\"y\":44}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00014.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=g6k2QNPiJ2FZuoU4Ff9fv0%2FWDlQ%3D\"},{\"label\":\"sface\",\"offset\":14,\"rate\":0,\"sfaceData\":[{\"h\":119,\"w\":119,\"x\":375,\"y\":47}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00015.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Pq9%2BtWduPUs%2BVx91KMi%2FeBWWGfw%3D\"},{\"label\":\"sface\",\"offset\":15,\"rate\":74.91,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":74.91}],\"h\":118,\"w\":118,\"x\":488,\"y\":66}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00016.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=%2BWfONHpMJpmb7Y3sjOJTWCRqIS0%3D\"},{\"label\":\"sface\",\"offset\":16,\"rate\":65.77,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":65.77}],\"h\":110,\"w\":110,\"x\":478,\"y\":98}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00017.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=FMlSJLx3BgMBrYWtHOQfTOkP%2FTI%3D\"},{\"label\":\"sface\",\"offset\":17,\"rate\":63.21,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":63.21}],\"h\":117,\"w\":117,\"x\":480,\"y\":86}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00018.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=WxqnCwaMuplK%2FLIau96oYFDHvMs%3D\"},{\"label\":\"sface\",\"offset\":18,\"rate\":0,\"sfaceData\":[{\"h\":112,\"w\":112,\"x\":464,\"y\":89}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00019.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Q5wozzUTT7BgYDjnAsoyDczeVa8%3D\"},{\"label\":\"sface\",\"offset\":19,\"rate\":0,\"sfaceData\":[{\"h\":115,\"w\":115,\"x\":448,\"y\":88}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00020.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=xvQtDoWlm0sGpDOdxgFuK6drG8Q%3D\"},{\"label\":\"sface\",\"offset\":20,\"rate\":68.91,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":68.91},{\"id\":\"AliFace_0011741\",\"name\":\"Tim_Powell\",\"rate\":63.12}],\"h\":122,\"w\":122,\"x\":446,\"y\":59}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00021.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=MY3M2BvIbmdHpwuC%2B55exT6ORxs%3D\"},{\"label\":\"sface\",\"offset\":21,\"rate\":62.55,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":62.55}],\"h\":121,\"w\":121,\"x\":441,\"y\":55}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00022.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=NVplHxLoPMDIqMKSbXhfsVIk%2Fzk%3D\"},{\"label\":\"sface\",\"offset\":22,\"rate\":60.52,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0000114\",\"name\":\"\\u4e7e\\u5fb7\\u95e8\",\"rate\":60.52}],\"h\":119,\"w\":119,\"x\":427,\"y\":39}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00023.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=vsheGNmtW7LivP5ZP0qW2v%2FEj3g%3D\"},{\"label\":\"sface\",\"offset\":23,\"rate\":64.98,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":64.98}],\"h\":127,\"w\":127,\"x\":430,\"y\":38}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00024.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=yUZHKsh%2F2BhjG%2Br1CGDefcXVc0I%3D\"},{\"label\":\"sface\",\"offset\":24,\"rate\":65.12,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":65.12}],\"h\":125,\"w\":125,\"x\":441,\"y\":29}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00025.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=MQQHW8VeKy0zq0k8HFJA1qBDVYI%3D\"},{\"label\":\"sface\",\"offset\":25,\"rate\":72.92,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":72.92}],\"h\":131,\"w\":131,\"x\":421,\"y\":27}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00026.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Z8jLg%2FWOmu0YsdV7w745Q904VgU%3D\"},{\"label\":\"sface\",\"offset\":26,\"rate\":63.11,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":63.11}],\"h\":127,\"w\":127,\"x\":406,\"y\":33}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00027.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=oo7ytvgF9sni7ivSxusqkD6e9XY%3D\"},{\"label\":\"sface\",\"offset\":27,\"rate\":72.53,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":72.53}],\"h\":124,\"w\":124,\"x\":421,\"y\":36}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00028.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=ejcum9%2FCOYfLvQDMxxAlsz4klLk%3D\"},{\"label\":\"sface\",\"offset\":28,\"rate\":66.85,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":66.85}],\"h\":127,\"w\":127,\"x\":428,\"y\":31}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00029.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=4rp28r0JREXzh%2Fi4b7fsKctIC5U%3D\"},{\"label\":\"sface\",\"offset\":29,\"rate\":74.8,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":74.8}],\"h\":122,\"w\":122,\"x\":461,\"y\":34}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00030.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=eZ45iZXP5OPIIXgNtUu7d0ezRpE%3D\"},{\"label\":\"sface\",\"offset\":30,\"rate\":75.3,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":75.3}],\"h\":124,\"w\":124,\"x\":456,\"y\":36}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00031.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Gw0Cz6yFid3jPD5rs2n3mww%2Bb5E%3D\"},{\"label\":\"sface\",\"offset\":31,\"rate\":71.01,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":71.01}],\"h\":126,\"w\":126,\"x\":428,\"y\":30}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00032.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=k2DGEwUbZFc6RmgJfCAECQph4yc%3D\"},{\"label\":\"sface\",\"offset\":32,\"rate\":65.55,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":65.55}],\"h\":126,\"w\":126,\"x\":422,\"y\":34}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00033.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=97S4VjQfg6KTtQVq6a5EFxswukg%3D\"},{\"label\":\"sface\",\"offset\":33,\"rate\":68.69,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":68.69}],\"h\":119,\"w\":119,\"x\":423,\"y\":38}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00034.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=2QJeCdjhBDknNDUzwrrBarcAFaw%3D\"},{\"label\":\"sface\",\"offset\":34,\"rate\":68.62,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":68.62}],\"h\":116,\"w\":116,\"x\":446,\"y\":39}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00035.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=OwHvTwgycCQJ4VUvxEnT2HIHgd0%3D\"},{\"label\":\"sface\",\"offset\":35,\"rate\":70.77,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":70.77}],\"h\":118,\"w\":118,\"x\":460,\"y\":36}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00036.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=6qEzYWPrVq1ikcmSMHRvN1A1rXo%3D\"},{\"label\":\"sface\",\"offset\":36,\"rate\":74.86,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":74.86}],\"h\":124,\"w\":124,\"x\":414,\"y\":31}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00037.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=IEtKvflrt9zAFugC3drlS3QsgbI%3D\"},{\"label\":\"sface\",\"offset\":37,\"rate\":73.68,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":73.68}],\"h\":126,\"w\":126,\"x\":434,\"y\":22}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00038.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=omA6DKaMg9uGdlJF1GGPyRxXH6Y%3D\"},{\"label\":\"sface\",\"offset\":38,\"rate\":73.36,\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018407\",\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":73.36}],\"h\":120,\"w\":120,\"x\":505,\"y\":32}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00039.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=FRqFfQCfToGRvuIuQvm%2BIpkX6xk%3D\"},{\"label\":\"sface\",\"offset\":39,\"rate\":0,\"sfaceData\":[{\"h\":124,\"w\":124,\"x\":435,\"y\":29}],\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00040.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=UllONi%2BkWC%2FjTFn6iv7H9ERmoWI%3D\"}],\"label\":\"sface\",\"rate\":80.55,\"scene\":\"sface\",\"suggestion\":\"review\"}],\"taskId\":\"vi2OJOsWtlAGQ7OGNEVAx8$5-1sSQ6e\",\"url\":\"http:\\/\\/repheal.oss-cn-shanghai.aliyuncs.com\\/2472f175792c45fcecec53f3fa45f7d8.mp4?OSSAccessKeyId=LTAI4FiuJ3SmAruqSMxn5r2x&Expires=1595265591&Signature=YYwUvdf7%2FyGm1Xen%2FLam3HF5hx8%3D\"}],\"msg\":\"OK\",\"requestId\":\"4D2A3649-589E-4470-8979-E3585ADA9FE1\"}',1,1,1595261969,1595262052,1595261969,'local','a9ca65a8199ddc39865f3cee8a82219a820cef31'),
	(55,1,0,'/uploads/20200721/5d064305729a1b61ebfc4fe0e28f27de.jpg','960','540','jpg',0,49052,'image/jpeg','{\"name\":\"tRqcf00008.jpg\"}',0,'',0,0,1595262741,1595262741,1595262741,'local','e614965c5e47d7aaeef630dc78c1e5b6673c22ed'),
	(56,1,0,'/uploads/20200721/bf828ed5f54a67a1c2e72f0757133020.jpg','960','540','jpg',0,21059,'image/jpeg','{\"name\":\"ijcYf00039.jpg\"}',0,'',0,0,1595262741,1595262741,1595262741,'local','b5a2429643fcb1d61e72dfc51826b5e2f02f5ab0'),
	(57,1,0,'/uploads/20200721/61e258e62c4ce6f3aba117a3523507bd.jpg','960','540','jpg',0,22907,'image/jpeg','{\"name\":\"Df59f00027.jpg\"}',0,'',0,0,1595262742,1595262742,1595262742,'local','4f7dcd3daceac8cf2e9a070be955eb3fdb2e2f6a'),
	(58,1,0,'/uploads/20200721/36877f32a7328ce92ff13589952fcc58.jpg','960','540','jpg',0,23636,'image/jpeg','{\"name\":\"WBHwf00031.jpg\"}',0,'',0,0,1595262742,1595262742,1595262742,'local','b58200eef0a7ae23ab93077b1fc20dbee168b11f'),
	(59,1,0,'/uploads/20200721/7fffdfb0cbc23d1edf6fa2bdff0391de.jpg','960','540','jpg',0,20878,'image/jpeg','{\"name\":\"Y5zRf00036.jpg\"}',0,'',0,0,1595262742,1595262742,1595262742,'local','2d0b5b2f3c64ac9a04b83afbf50484c33a12bd26'),
	(60,1,0,'/uploads/20200721/0732b898aeacdb92c57adccf151bd6ef.jpg','960','540','jpg',0,23357,'image/jpeg','{\"name\":\"mtdUf00032.jpg\"}',0,'',0,0,1595262743,1595262743,1595262743,'local','36c1abeab89a55da8bc64d0c818b8eb4abcfb349'),
	(61,1,0,'/uploads/20200721/9b30cdc6b31969848ab6e820d503e758.jpg','960','540','jpg',0,38660,'image/jpeg','{\"name\":\"a2OSf00010.jpg\"}',0,'',0,0,1595262743,1595262743,1595262743,'local','aa6d4ecad3f07014e9ea739c1d7824a80f3d8e26'),
	(62,1,0,'/uploads/20200721/3d80f5172d9c815387fc4f63b30c892a.jpg','960','540','jpg',0,23635,'image/jpeg','{\"name\":\"csR5f00022.jpg\"}',0,'',0,0,1595262743,1595262743,1595262743,'local','382fd8e594bfa372c989b3588a8b5b3f31ca5745'),
	(63,1,0,'/uploads/20200721/b60719e808fcd3ab4689b2aa39bb2c5c.jpg','960','540','jpg',0,35082,'image/jpeg','{\"name\":\"1xOBf00002.jpg\"}',0,'',0,0,1595262743,1595262743,1595262743,'local','d9d942424064f8fb3634ae20d353d290fef838fa'),
	(64,1,0,'/uploads/20200721/8659e87b85dfb1b2c6b447b61fac169f.jpg','960','540','jpg',0,63848,'image/jpeg','{\"name\":\"LXfPf00005.jpg\"}',0,'',0,0,1595262743,1595262743,1595262743,'local','5baeaa52cf35899bca4cdcd99f57a8146328cf83'),
	(65,1,0,'/uploads/20200721/1bf2b6cac73677e11545038e60b89f36.jpg','960','540','jpg',0,23517,'image/jpeg','{\"name\":\"bFurf00028.jpg\"}',0,'',0,0,1595262744,1595262744,1595262744,'local','f2a6c9b9706becde088b07c31b6c2eda6b1bad27'),
	(66,1,0,'/uploads/20200721/96dd3983458b738a46d3a6ecec95624d.jpg','960','540','jpg',0,32257,'image/jpeg','{\"name\":\"RpZff00012.jpg\"}',0,'',0,0,1595262744,1595262744,1595262744,'local','a86c70ed11a9fbcbd5a4e9ccd0f16c9f8b0b0c1c'),
	(67,1,0,'/uploads/20200721/a5f14577d76f93dd7e3321b525a4ead0.jpg','960','540','jpg',0,20458,'image/jpeg','{\"name\":\"KUwrf00037.jpg\"}',0,'',0,0,1595262744,1595262744,1595262744,'local','39bffd5ee52fda077e81cb5f13c1d912a23a38b8'),
	(68,1,0,'/uploads/20200721/7adacc02fa9ad79d87c3780af4673180.jpg','960','540','jpg',0,22530,'image/jpeg','{\"name\":\"jo4Ff00023.jpg\"}',0,'',0,0,1595262744,1595262744,1595262744,'local','46266197e2ac8764196deeac6666dcae46298e96'),
	(69,1,0,'/uploads/20200721/3b5d165b2be822826c4ec693a01d19c5.jpg','960','540','jpg',0,22746,'image/jpeg','{\"name\":\"5L9sf00024.jpg\"}',0,'',0,0,1595262745,1595262745,1595262745,'local','15ffd6bec73114121a24736c18c4e06820941cf9'),
	(70,1,0,'/uploads/20200721/b85a9743691569ca6f17276c09056590.jpg','960','540','jpg',0,23453,'image/jpeg','{\"name\":\"orkjf00033.jpg\"}',0,'',0,0,1595262745,1595262745,1595262745,'local','926c2fad80d7b8a210f93e2055b818e09c2ef673'),
	(71,1,0,'/uploads/20200721/eed13e984a98d8ee486e753f0db4eaff.jpg','960','540','jpg',0,62943,'image/jpeg','{\"name\":\"wb60f00007.jpg\"}',0,'',0,0,1595262745,1595262745,1595262745,'local','26d3340657fc815b1a92625cba74a826f9901c46'),
	(72,1,0,'/uploads/20200721/4de345f8f1188c01d28d6643e8e9de46.jpg','960','540','jpg',0,64527,'image/jpeg','{\"name\":\"OVsff00006.jpg\"}',0,'',0,0,1595262745,1595262745,1595262745,'local','e6ca89a4e4eb019a174cd7427cf6f47c84cf37db'),
	(73,1,0,'/uploads/20200721/0e60a7678b2e0dba688cdb03c4a9e3a8.jpg','960','540','jpg',0,23536,'image/jpeg','{\"name\":\"Fcwef00029.jpg\"}',0,'',0,0,1595262745,1595262745,1595262745,'local','c182e5607f54f128b8d9278ad9c7c4b444c7effb'),
	(74,1,0,'/uploads/20200721/f1e9a9e681e3792e499c7f4ca6b8e0d3.jpg','960','540','jpg',0,23328,'image/jpeg','{\"name\":\"tbjzf00035.jpg\"}',0,'',0,0,1595262746,1595262746,1595262746,'local','fb26ebd4b72b794b26ef76a06999998c3e864aa0'),
	(75,1,0,'/uploads/20200721/949d6364f60d395eb6b6baec086aae90.jpg','960','540','jpg',0,37226,'image/jpeg','{\"name\":\"iDBMf00011.jpg\"}',0,'',0,0,1595262746,1595262746,1595262746,'local','8f8b9eca93a42f77505b6cff888167fb9f12c37e'),
	(76,1,0,'/uploads/20200721/41082e9eed7ea14c501291146b3365dd.jpg','960','540','jpg',0,29958,'image/jpeg','{\"name\":\"EjtUf00013.jpg\"}',0,'',0,0,1595262746,1595262746,1595262746,'local','f6b3d480d74f4d1c63263c1303f8abb3fd6a8dbb'),
	(77,1,0,'/uploads/20200721/5bc3c6884967b29564abdcfe903dfdce.jpg','960','540','jpg',0,39158,'image/jpeg','{\"name\":\"Y6n4f00003.jpg\"}',0,'',0,0,1595262746,1595262746,1595262746,'local','181649e571ce8c2e25d5878ffa08d44b4e964e6b'),
	(78,1,0,'/uploads/20200721/d9a31a85c344435be447bf6560f85f19.jpeg','268','369','jpeg',0,80168,'image/jpeg','{\"name\":\"\\u8584\\u7199\\u6765.jpeg\"}',1,'{\"code\":200,\"data\":[{\"code\":200,\"dataId\":\"5f15c93e7abd25.87584107\",\"extras\":[],\"msg\":\"OK\",\"results\":[{\"label\":\"normal\",\"rate\":100,\"scene\":\"porn\",\"suggestion\":\"pass\"},{\"label\":\"politics\",\"rate\":100,\"scene\":\"terrorism\",\"suggestion\":\"block\"},{\"label\":\"sface\",\"rate\":98.53,\"scene\":\"sface\",\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0007589\",\"name\":\"\\u8584\\u7199\\u6765\",\"rate\":98.53}],\"h\":169,\"w\":169,\"x\":62,\"y\":81}],\"suggestion\":\"review\"}],\"taskId\":\"img1ZL5bh9UkMG4TZ0h6QrxcI-1sSQq7\",\"url\":\"http:\\/\\/repheal.oss-cn-shanghai.aliyuncs.com\\/d9a31a85c344435be447bf6560f85f19.jpeg?OSSAccessKeyId=LTAI4FiuJ3SmAruqSMxn5r2x&Expires=1595266894&Signature=brrICIwfYP3Syj94lg3PWCQQAso%3D\"}],\"msg\":\"OK\",\"requestId\":\"CC924F97-6A70-4B79-AB9A-C577F7285654\"}',1,1,1595263276,1595263295,1595263276,'local','1936fb33302a197e779890592315e1f10e71b8f5'),
	(79,1,0,'/uploads/20200721/b511d118d20abfcb256732483d88f06c.jpg','500','328','jpg',0,19275,'image/jpeg','{\"name\":\"benla.jpg\"}',1,'{\"code\":200,\"data\":[{\"code\":200,\"dataId\":\"5f15ca8e943e81.25044604\",\"extras\":[],\"msg\":\"OK\",\"results\":[{\"label\":\"normal\",\"rate\":97.27,\"scene\":\"porn\",\"suggestion\":\"pass\"},{\"label\":\"politics\",\"rate\":100,\"scene\":\"terrorism\",\"suggestion\":\"block\"},{\"label\":\"sface\",\"rate\":98.42,\"scene\":\"sface\",\"sfaceData\":[{\"faces\":[{\"id\":\"AliFace_0018177\",\"name\":\"\\u5965\\u8428\\u9a6c.\\u672c.\\u62c9\\u767b\",\"rate\":98.42}],\"h\":145,\"w\":145,\"x\":157,\"y\":19}],\"suggestion\":\"review\"}],\"taskId\":\"img7hFUiTbDAgB71Fo0@LaXmY-1sSQvf\",\"url\":\"http:\\/\\/repheal.oss-cn-shanghai.aliyuncs.com\\/b511d118d20abfcb256732483d88f06c.jpg?OSSAccessKeyId=LTAI4FiuJ3SmAruqSMxn5r2x&Expires=1595267230&Signature=BfC%2Fg3JBia2E5wO79gRmC11%2BIBI%3D\"}],\"msg\":\"OK\",\"requestId\":\"7E4F52FE-1C3A-4B10-812A-0F353FA1FCA2\"}',1,1,1595263616,1595263631,1595263616,'local','45cabb2afe5d36c3fb3b467ff684952baae7b665'),
	(80,1,0,'/uploads/20200721/aaf5a61f702b368e039f27ece2f83cd9.mp3','','','mp3',0,9341685,'audio/mpeg','{\"name\":\"\\u674e\\u73b2\\u7389 - \\u7c89\\u7ea2\\u8272\\u7684\\u56de\\u5fc6.mp3\"}',1,'{\"code\":200,\"data\":[{\"code\":200,\"dataId\":\"5f15cad22ddff3.35953633\",\"msg\":\"OK\",\"results\":[{\"details\":[{\"endTime\":6,\"label\":\"normal\",\"startTime\":0,\"text\":\"\\u55ef\\u3002\"},{\"endTime\":11,\"label\":\"normal\",\"startTime\":10,\"text\":\"\\u55ef\\u3002\"},{\"endTime\":14,\"label\":\"normal\",\"startTime\":13,\"text\":\"\\u554a\\u3002\"},{\"endTime\":45,\"label\":\"normal\",\"startTime\":27,\"text\":\"\\u60f3\\u8981\\u542c\\u590f\\u5929\\u6084\\u6084\\u8fc7\\u53bb\\uff0c\\u7559\\u4e0b\\u5c0f\\u79d8\\u5bc6\\uff0c\\u538b\\u5fc3\\u5e95\\u538b\\u5fc3\\u5e95\\u4e0d\\u80fd\\u544a\\u8bc9\\u4f60\\uff0c\\u665a\\u98ce\\u5439\\u8fc7\\u6e29\\u6696\\u6211\\u5fc3\\u5e95\\u3002\\u6211\\u53c8\\u60f3\\u8d77\\u4f60\\u5929\\u5730\\u591a\\u751c\\u871c\\u3002\"},{\"endTime\":65,\"label\":\"normal\",\"startTime\":45,\"text\":\"\\u4e0d\\u80fd\\u5fd8\\u8bb0\\u4f60\\u628a\\u4f60\\u5199\\u5728\\u5fc3\\u91cc\\u60f3\\uff0c\\u8fd8\\u662f\\u4f60\\u8fd8\\u6709\\u6211\\u4e00\\u4e2a\\u7c89\\u7ea2\\u7684\\u56de\\u5fc6\\uff0c\\u590f\\u5929\\u6084\\u6084\\u8fc7\\u53bb\\u3002\"},{\"endTime\":80,\"label\":\"normal\",\"startTime\":65,\"text\":\"\\u4f60\\u8ba4\\u4e3a\\u5e74\\u5e95\\u90fd\\u5c06\\u4f1a\\u5168\\u90e8\\u5728\\u5c31\\u5728\\u79cb\\u5929\\u7684\\u68a6\\u91cc\\uff0c\\u6211\\u9047\\u89c1\\u4f60\\u4e0d\\u662f\\u4e0d\\u80fd\\u5fd8\\u8bb0\\u4f60\\u3002\"},{\"endTime\":86,\"label\":\"normal\",\"startTime\":85,\"text\":\"\\u5728\\u3002\"},{\"endTime\":112,\"label\":\"normal\",\"startTime\":93,\"text\":\"\\u590f\\u5929\\u590f\\u5929\\u6084\\u6084\\u8fc7\\u53bb\\uff0c\\u7559\\u4e0b\\u5c0f\\u79d8\\u5bc6\\uff0c\\u538b\\u5fc3\\u5e95\\u538b\\u5fc3\\u5e95\\u4e0d\\u80fd\\u98ce\\u5439\\u8fc7\\u5fc3\\u7406\\uff0c\\u6211\\u53c8\\u60f3\\u8d77\\u4f60\\u591a\\u4e48\\u4f60\\u591a\\u751c\\u871c\\u3002\"},{\"endTime\":132,\"label\":\"normal\",\"startTime\":112,\"text\":\"\\u6211\\u4eec\\u5fd8\\u8bb0\\u4f60\\u628a\\u4f60\\u5199\\u5728\\u8fd9\\u91cc\\uff0c\\u8bf7\\u4f60\\u5fc3\\u91cc\\u8fd8\\u662f\\u4f60\\u8fd8\\u6709\\u6d6a\\u6f2b\\u7684\\u3002\\u6211\\u4e00\\u4e2a\\u5206\\u516c\\u542c\\u4f1a\\uff0c\\u590f\\u5929\\u590f\\u5929\\u6084\\u6084\\u8fc7\\u53bb\\u3002\"},{\"endTime\":138,\"label\":\"normal\",\"startTime\":132,\"text\":\"\\u4f60\\u8ba9\\u4eba\\u6000\\u7591\\u3002\\u5e74\\u5e95\\u4f60\\u5c06\\u3002\"},{\"endTime\":147,\"label\":\"normal\",\"startTime\":138,\"text\":\"\\u5c31\\u5728\\u9152\\u5e97\\u91cc\\uff0c\\u68a6\\u91cc\\u6211\\u9047\\u89c1\\u4f60\\u603b\\u662f\\u4e0d\\u80fd\\u5fd8\\u8bb0\\u4f60\\u3002\"},{\"endTime\":167,\"label\":\"normal\",\"startTime\":147,\"text\":\"\\u6211\\u4eec\\u5fd8\\u8bb0\\u4f60\\u628a\\u4f60\\u5199\\u8fdb\\u4f60\\u5fc3\\u91cc\\uff0c\\u8fd8\\u662f\\u4f60\\u8fd8\\u6709\\u4e00\\u4e2a\\u5feb\\u9012\\u67dc\\uff0c\\u4ec0\\u4e48\\u5929\\u4f7f\\u8981\\u542c\\uff0c\\u6084\\u6084\\u8fc7\\u53bb\\u3002\"},{\"endTime\":184,\"label\":\"normal\",\"startTime\":167,\"text\":\"\\u4f9d\\u7136\\u6000\\u7591\\u5e74\\u5e95\\u54aa\\u54aa\\u4f60\\u53eb\\u6211\\u56de\\u9152\\u5e97\\u91cc\\uff0c\\u68a6\\u91cc\\u6211\\u9047\\u89c1\\u4f60\\u603b\\u662f\\u4e0d\\u80fd\\u5fd8\\u8bb0\\u4f60\\u3002\"},{\"endTime\":197,\"label\":\"normal\",\"startTime\":196,\"text\":\"\\u5bf9\\u3002\"},{\"endTime\":206,\"label\":\"normal\",\"startTime\":205,\"text\":\"\\u55ef\\u3002\"}],\"label\":\"normal\",\"rate\":99.91,\"scene\":\"antispam\",\"suggestion\":\"pass\"}],\"taskId\":\"vc_f_5R2l6zYDH9G6gOTetCu1OH-1sSQwh\",\"url\":\"http:\\/\\/repheal.oss-cn-shanghai.aliyuncs.com\\/aaf5a61f702b368e039f27ece2f83cd9.mp3?OSSAccessKeyId=LTAI4FiuJ3SmAruqSMxn5r2x&Expires=1595267298&Signature=72htjd%2BgGJiIU1fC9d33VGaRVR4%3D\"}],\"msg\":\"OK\",\"requestId\":\"976CAABE-EFE7-45E0-8717-788B41AEC33B\"}',1,1,1595263678,1595263722,1595263678,'local','10e41d3fb8238ea0d9cb548e1b277c92d6f84bd5'),
	(81,1,0,'/uploads/20200721/56421191913bd0400ac7929570c45d65.txt','','','txt',0,1335,'text/plain','{\"name\":\"pig.txt\"}',1,'{\"code\":200,\"data\":[{\"code\":200,\"content\":\"\\u65b0\\u534e\\u793e\\u90d1\\u5dde7\\u670819\\u65e5\\u7535\\uff08\\u8bb0\\u8005\\u5b59\\u6e05\\u6e05\\u3001\\u7fdf\\u6fef\\uff09\\u8bb0\\u8005\\u4ece\\u6cb3\\u5357\\u7701\\u5e94\\u6025\\u7ba1\\u7406\\u5385\\u83b7\\u6089\\uff0c\\u9274\\u4e8e\\u5f53\\u524d\\u9632\\u6c5b\\u5f62\\u52bf\\u975e\\u5e38\\u4e25\\u5cfb\\uff0c\\u7ecf\\u6cb3\\u5357\\u7701\\u9632\\u6c5b\\u6297\\u65f1\\u6307\\u6325\\u90e8\\u4f1a\\u5546\\u7814\\u5224\\uff0c\\u6839\\u636e\\u300a\\u6cb3\\u5357\\u7701\\u9632\\u6c5b\\u5e94\\u6025\\u9884\\u6848\\u300b\\u6709\\u5173\\u89c4\\u5b9a\\uff0c\\u6cb3\\u5357\\u7701\\u51b3\\u5b9a\\u4e8e7\\u670819\\u65e511\\u65f6\\u5c06\\u9632\\u6c5b\\u5e94\\u6025\\u54cd\\u5e94\\u7ea7\\u522b\\u7531\\u2163\\u7ea7\\u63d0\\u5347\\u4e3a\\u2162\\u7ea7\\u3002\\n\\n\\u8fd1\\u65e5\\uff0c\\u6cb3\\u5357\\u7701\\u5468\\u53e3\\u5e02\\u3001\\u6f2f\\u6cb3\\u5e02\\u3001\\u5e73\\u9876\\u5c71\\u5e02\\u5357\\u90e8\\u3001\\u5357\\u9633\\u5e02\\u4e1c\\u90e8\\u3001\\u9a7b\\u9a6c\\u5e97\\u5e02\\u5317\\u90e8\\u3001\\u4fe1\\u9633\\u5e02\\u5927\\u90e8\\u5206\\u5730\\u533a\\u964d\\u5927\\u5230\\u66b4\\u96e8\\uff0c\\u5c40\\u90e8\\u5927\\u66b4\\u96e8\\u3002\\u636e\\u6c14\\u8c61\\u90e8\\u95e8\\u9884\\u62a5\\uff0c\\u6cb3\\u5357\\u7701\\u4e1c\\u5357\\u90e8\\u4ecd\\u6709\\u4e00\\u6b21\\u5f3a\\u964d\\u96e8\\u8fc7\\u7a0b\\uff0c\\u5f3a\\u964d\\u96e8\\u4e0e\\u524d\\u671f\\u964d\\u96e8\\u533a\\u57df\\u9ad8\\u5ea6\\u91cd\\u53e0\\uff0c\\u66b4\\u96e8\\u533a\\u53d1\\u751f\\u5c71\\u6d2a\\u5730\\u8d28\\u707e\\u5bb3\\u3001\\u4e2d\\u5c0f\\u6cb3\\u6d41\\u6d2a\\u6c34\\u548c\\u57ce\\u5e02\\u5185\\u6d9d\\u7684\\u98ce\\u9669\\u8f83\\u9ad8\\u3002\\n\\n\\u636e\\u6089\\uff0c\\u6cb3\\u5357\\u7701\\u9632\\u6c5b\\u6297\\u65f1\\u6307\\u6325\\u90e8\\u5df2\\u7ecf\\u6d3e\\u51fa3\\u4e2a\\u5de5\\u4f5c\\u7ec4\\u8d76\\u8d74\\u53d7\\u964d\\u96e8\\u5f71\\u54cd\\u8f83\\u91cd\\u7684\\u5730\\u533a\\u6307\\u5bfc\\u9632\\u6c5b\\u5de5\\u4f5c\\uff0c\\u540c\\u65f6\\u8981\\u6c42\\u53d7\\u964d\\u96e8\\u5f71\\u54cd\\u8f83\\u91cd\\u7684\\u7701\\u8f96\\u5e02\\u9632\\u6307\\u53ca\\u65f6\\u62a5\\u9001\\u6d2a\\u6d9d\\u707e\\u60c5\\u3001\\u9669\\u60c5\\u3002\\u542f\\u52a8\\u2162\\u7ea7\\u5e94\\u6025\\u54cd\\u5e94\\u540e\\uff0c\\u6cb3\\u5357\\u7701\\u9632\\u6307\\u5c06\\u7ec4\\u7ec7\\u5e94\\u6025\\u3001\\u6c34\\u5229\\u3001\\u6c14\\u8c61\\u3001\\u81ea\\u7136\\u8d44\\u6e90\\u3001\\u519c\\u4e1a\\u519c\\u6751\\u7b49\\u90e8\\u95e8\\u5bf9\\u6c5b\\u60c5\\u8fdb\\u884c\\u4f1a\\u5546\\u5e76\\u6307\\u5bfc\\u505a\\u597d\\u76f8\\u5173\\u5de5\\u4f5c\\u3002\\u6cb3\\u5357\\u7701\\u6c14\\u8c61\\u5c40\\u3001\\u7701\\u6c34\\u5229\\u5385\\u6bcf3\\u5c0f\\u65f6\\u62a5\\u544a\\u96e8\\u60c5\\u76d1\\u6d4b\\u3001\\u5929\\u6c14\\u9884\\u62a5\\u3001\\u6d2a\\u6c34\\u9884\\u62a5\\u60c5\\u51b5\\uff1b\\u6cb3\\u5357\\u7701\\u81ea\\u7136\\u8d44\\u6e90\\u5385\\u3001\\u7701\\u5e94\\u6025\\u7ba1\\u7406\\u5385\\u548c\\u7701\\u9632\\u6307\\u5176\\u4ed6\\u6709\\u5173\\u6210\\u5458\\u5355\\u4f4d\\u6bcf\\u65e5\\u5b9a\\u65f6\\u62a5\\u544a\\u5730\\u8d28\\u707e\\u5bb3\\u76d1\\u6d4b\\u9884\\u8b66\\u9884\\u62a5\\u3001\\u6d2a\\u6d9d\\u707e\\u5bb3\\u635f\\u5931\\u7b49\\u60c5\\u51b5\\u3002\\n\",\"dataId\":\"5f15cb142f9e49.22195548\",\"msg\":\"OK\",\"results\":[{\"label\":\"normal\",\"rate\":99.91,\"scene\":\"antispam\",\"suggestion\":\"pass\"}],\"taskId\":\"txt7MtBe1xdQTP52Q86n4iElV-1sSQxh\"}],\"msg\":\"OK\",\"requestId\":\"CDD49A13-36C3-42D3-8EED-50BD57C3392E\"}',1,1,1595263754,1595263764,1595263754,'local','46e369e8d4d134eb5164d6d15de2419e37a680f8');

/*!40000 ALTER TABLE `fa_attachment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_attachment_ai_relation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_attachment_ai_relation`;

CREATE TABLE `fa_attachment_ai_relation` (
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '素材ID',
  `label` varchar(30) DEFAULT '' COMMENT '状态标签',
  `rate` varchar(10) DEFAULT '0' COMMENT '百分比',
  `scene` varchar(10) DEFAULT '0' COMMENT '审核类型',
  `suggestion` varchar(10) DEFAULT '0' COMMENT '通过结果',
  `result_type` varchar(30) DEFAULT 'default' COMMENT '结果类型，主要是针对视频的音频部分',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  UNIQUE KEY `aid` (`aid`,`label`,`scene`,`result_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fa_attachment_ai_relation` WRITE;
/*!40000 ALTER TABLE `fa_attachment_ai_relation` DISABLE KEYS */;

INSERT INTO `fa_attachment_ai_relation` (`aid`, `label`, `rate`, `scene`, `suggestion`, `result_type`, `createtime`, `updatetime`)
VALUES
	(54,'normal','99.9','porn','pass','default',1595262052,1595262052),
	(54,'terrorism','77.97','terrorism','review','default',1595262052,1595262052),
	(54,'normal','99.9','live','pass','default',1595262052,1595262052),
	(54,'normal','99.9','logo','pass','default',1595262052,1595262052),
	(54,'normal','99.9','ad','pass','default',1595262052,1595262052),
	(54,'sface','80.55','sface','review','default',1595262052,1595262052),
	(54,'normal','99.91','antispam','pass','video_audio',1595262052,1595262052),
	(78,'normal','100','porn','pass','default',1595263321,1595263321),
	(78,'politics','100','terrorism','block','default',1595263321,1595263321),
	(78,'sface','98.53','sface','review','default',1595263321,1595263321),
	(79,'normal','97.27','porn','pass','default',1595263632,1595263632),
	(79,'politics','100','terrorism','block','default',1595263632,1595263632),
	(79,'sface','98.42','sface','review','default',1595263632,1595263632),
	(80,'normal','99.91','antispam','pass','default',1595263722,1595263722),
	(81,'normal','99.91','antispam','pass','default',1595263771,1595263771);

/*!40000 ALTER TABLE `fa_attachment_ai_relation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_attachment_ai_sface
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_attachment_ai_sface`;

CREATE TABLE `fa_attachment_ai_sface` (
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '素材ID',
  `skey` char(32) NOT NULL COMMENT '源地址的md5值',
  `surl` varchar(255) DEFAULT '' COMMENT '源地址',
  `scene` varchar(15) NOT NULL COMMENT '类型',
  `label` varchar(15) NOT NULL COMMENT '标签',
  `main` tinyint(3) DEFAULT '0' COMMENT '主显示',
  `url` varchar(255) DEFAULT '' COMMENT '本地化的访问地址',
  `ext` text COMMENT '额外信息',
  `createtime` int(10) DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`aid`,`skey`,`scene`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='本地化的sfache图片地址';

LOCK TABLES `fa_attachment_ai_sface` WRITE;
/*!40000 ALTER TABLE `fa_attachment_ai_sface` DISABLE KEYS */;

INSERT INTO `fa_attachment_ai_sface` (`aid`, `skey`, `surl`, `scene`, `label`, `main`, `url`, `ext`, `createtime`, `updatetime`)
VALUES
	(54,'122007ce9ce049a40c99a0dd53a7d04d','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00008.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Mife0r2niS3P11HTmTOxsu420P8%3D','sface','sface',1,'/uploads/20200721/5d064305729a1b61ebfc4fe0e28f27de.jpg','{\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":80.55,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00008.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Mife0r2niS3P11HTmTOxsu420P8%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018209\"}',1595262052,1595262052),
	(54,'1c596fde72df76ade37f339266ff90fc','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00039.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=FRqFfQCfToGRvuIuQvm%2BIpkX6xk%3D','sface','sface',0,'/uploads/20200721/bf828ed5f54a67a1c2e72f0757133020.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":73.36,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00039.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=FRqFfQCfToGRvuIuQvm%2BIpkX6xk%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'1c596fde72df76ade37f339266ff90fc','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00039.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=FRqFfQCfToGRvuIuQvm%2BIpkX6xk%3D','terrorism','terrorism',0,'/uploads/20200721/bf828ed5f54a67a1c2e72f0757133020.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":73.36,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00039.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=FRqFfQCfToGRvuIuQvm%2BIpkX6xk%3D\",\"scene\":\"terrorism\",\"label\":\"terrorism\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'24b9a62cd8be366894444a84664e89c3','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00027.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=oo7ytvgF9sni7ivSxusqkD6e9XY%3D','sface','sface',0,'/uploads/20200721/61e258e62c4ce6f3aba117a3523507bd.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":63.11,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00027.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=oo7ytvgF9sni7ivSxusqkD6e9XY%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'27fbf9f15b267eb90d803fad6f734dcc','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00031.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Gw0Cz6yFid3jPD5rs2n3mww%2Bb5E%3D','sface','sface',1,'/uploads/20200721/36877f32a7328ce92ff13589952fcc58.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":75.3,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00031.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Gw0Cz6yFid3jPD5rs2n3mww%2Bb5E%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'27fbf9f15b267eb90d803fad6f734dcc','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00031.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Gw0Cz6yFid3jPD5rs2n3mww%2Bb5E%3D','terrorism','terrorism',1,'/uploads/20200721/36877f32a7328ce92ff13589952fcc58.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":75.3,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00031.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Gw0Cz6yFid3jPD5rs2n3mww%2Bb5E%3D\",\"scene\":\"terrorism\",\"label\":\"terrorism\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'329b5d82a3b93547aaf2009b4ba0f51d','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00036.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=6qEzYWPrVq1ikcmSMHRvN1A1rXo%3D','sface','sface',0,'/uploads/20200721/7fffdfb0cbc23d1edf6fa2bdff0391de.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":70.77,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00036.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=6qEzYWPrVq1ikcmSMHRvN1A1rXo%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'329b5d82a3b93547aaf2009b4ba0f51d','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00036.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=6qEzYWPrVq1ikcmSMHRvN1A1rXo%3D','terrorism','terrorism',0,'/uploads/20200721/7fffdfb0cbc23d1edf6fa2bdff0391de.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":70.77,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00036.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=6qEzYWPrVq1ikcmSMHRvN1A1rXo%3D\",\"scene\":\"terrorism\",\"label\":\"terrorism\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'51d801977993bc71f87f124c37cc8692','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00032.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=k2DGEwUbZFc6RmgJfCAECQph4yc%3D','sface','sface',0,'/uploads/20200721/0732b898aeacdb92c57adccf151bd6ef.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":71.01,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00032.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=k2DGEwUbZFc6RmgJfCAECQph4yc%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'51d801977993bc71f87f124c37cc8692','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00032.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=k2DGEwUbZFc6RmgJfCAECQph4yc%3D','terrorism','terrorism',0,'/uploads/20200721/0732b898aeacdb92c57adccf151bd6ef.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":71.01,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00032.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=k2DGEwUbZFc6RmgJfCAECQph4yc%3D\",\"scene\":\"terrorism\",\"label\":\"terrorism\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'5537162001d9faf1cf2ddb4937a3d0b8','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00010.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=DnLPIcFAZdwZLWXw4TEVY6K25BA%3D','sface','sface',0,'/uploads/20200721/9b30cdc6b31969848ab6e820d503e758.jpg','{\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":75.91,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00010.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=DnLPIcFAZdwZLWXw4TEVY6K25BA%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018209\"}',1595262052,1595262052),
	(54,'67c8f4d766fe0d67bd09f6cb37cb87a7','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00022.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=NVplHxLoPMDIqMKSbXhfsVIk%2Fzk%3D','sface','sface',0,'/uploads/20200721/3d80f5172d9c815387fc4f63b30c892a.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":62.55,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00022.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=NVplHxLoPMDIqMKSbXhfsVIk%2Fzk%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'81e7d13962e79570eadb8ac61fd2daed','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00002.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=vtq1QoZwpi3cF%2BtdA582XuWk99Y%3D','sface','sface',0,'/uploads/20200721/b60719e808fcd3ab4689b2aa39bb2c5c.jpg','{\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":78.3,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00002.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=vtq1QoZwpi3cF%2BtdA582XuWk99Y%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018209\"}',1595262052,1595262052),
	(54,'8e525bc58e1ba8118b1bd90e305fa142','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00005.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=MuRCq3bPudj%2BCQNZOb7YC%2FSgVfM%3D','terrorism','terrorism',0,'/uploads/20200721/8659e87b85dfb1b2c6b447b61fac169f.jpg','{\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":75.21,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00005.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=MuRCq3bPudj%2BCQNZOb7YC%2FSgVfM%3D\",\"scene\":\"terrorism\",\"label\":\"terrorism\",\"face_id\":\"AliFace_0018209\"}',1595262052,1595262052),
	(54,'9db11e9ea24c8d716fe03e1093907185','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00028.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=ejcum9%2FCOYfLvQDMxxAlsz4klLk%3D','sface','sface',0,'/uploads/20200721/1bf2b6cac73677e11545038e60b89f36.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":72.53,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00028.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=ejcum9%2FCOYfLvQDMxxAlsz4klLk%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'a560a0b4bf98e36da899af93311e255b','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00012.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Jw85F9o3X4YncVqQxG9sQ7kskm0%3D','sface','sface',0,'/uploads/20200721/96dd3983458b738a46d3a6ecec95624d.jpg','{\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":71.8,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00012.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Jw85F9o3X4YncVqQxG9sQ7kskm0%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018209\"}',1595262052,1595262052),
	(54,'a560a0b4bf98e36da899af93311e255b','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00012.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Jw85F9o3X4YncVqQxG9sQ7kskm0%3D','terrorism','terrorism',0,'/uploads/20200721/96dd3983458b738a46d3a6ecec95624d.jpg','{\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":71.8,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00012.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Jw85F9o3X4YncVqQxG9sQ7kskm0%3D\",\"scene\":\"terrorism\",\"label\":\"terrorism\",\"face_id\":\"AliFace_0018209\"}',1595262052,1595262052),
	(54,'a617b8efea5d0c3f0c34e3b0f3c15ba8','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00037.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=IEtKvflrt9zAFugC3drlS3QsgbI%3D','sface','sface',0,'/uploads/20200721/a5f14577d76f93dd7e3321b525a4ead0.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":74.86,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00037.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=IEtKvflrt9zAFugC3drlS3QsgbI%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'a617b8efea5d0c3f0c34e3b0f3c15ba8','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00037.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=IEtKvflrt9zAFugC3drlS3QsgbI%3D','terrorism','terrorism',0,'/uploads/20200721/a5f14577d76f93dd7e3321b525a4ead0.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":74.86,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00037.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=IEtKvflrt9zAFugC3drlS3QsgbI%3D\",\"scene\":\"terrorism\",\"label\":\"terrorism\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'af6d01a6d00e2bb975e6af0911826fa1','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00023.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=vsheGNmtW7LivP5ZP0qW2v%2FEj3g%3D','sface','sface',1,'/uploads/20200721/7adacc02fa9ad79d87c3780af4673180.jpg','{\"name\":\"\\u4e7e\\u5fb7\\u95e8\",\"rate\":60.52,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00023.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=vsheGNmtW7LivP5ZP0qW2v%2FEj3g%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0000114\"}',1595262052,1595262052),
	(54,'bd5c09b0cc298739a36b6f9489c0870d','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00024.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=yUZHKsh%2F2BhjG%2Br1CGDefcXVc0I%3D','sface','sface',0,'/uploads/20200721/3b5d165b2be822826c4ec693a01d19c5.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":64.98,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00024.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=yUZHKsh%2F2BhjG%2Br1CGDefcXVc0I%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'bd6f9650898777542e6cc780176dbcf9','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00033.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=97S4VjQfg6KTtQVq6a5EFxswukg%3D','sface','sface',0,'/uploads/20200721/b85a9743691569ca6f17276c09056590.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":65.55,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00033.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=97S4VjQfg6KTtQVq6a5EFxswukg%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'c9979672fb8871e37e2126caca2d7586','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00007.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=pOFivEEcc%2B%2FHQMtsVvEOxKBeT%2BA%3D','sface','sface',0,'/uploads/20200721/eed13e984a98d8ee486e753f0db4eaff.jpg','{\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":69.6,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00007.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=pOFivEEcc%2B%2FHQMtsVvEOxKBeT%2BA%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018209\"}',1595262052,1595262052),
	(54,'ccf02a40caa430404090737373180b88','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00006.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=%2Bx3c4VA4gaSgZwPqVQDTmALZsek%3D','sface','sface',0,'/uploads/20200721/4de345f8f1188c01d28d6643e8e9de46.jpg','{\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":76.72,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00006.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=%2Bx3c4VA4gaSgZwPqVQDTmALZsek%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018209\"}',1595262052,1595262052),
	(54,'ccf02a40caa430404090737373180b88','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00006.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=%2Bx3c4VA4gaSgZwPqVQDTmALZsek%3D','terrorism','terrorism',0,'/uploads/20200721/4de345f8f1188c01d28d6643e8e9de46.jpg','{\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":76.72,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00006.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=%2Bx3c4VA4gaSgZwPqVQDTmALZsek%3D\",\"scene\":\"terrorism\",\"label\":\"terrorism\",\"face_id\":\"AliFace_0018209\"}',1595262052,1595262052),
	(54,'d7b9b7943fbaaff7b777fa71b8e7e289','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00029.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=4rp28r0JREXzh%2Fi4b7fsKctIC5U%3D','sface','sface',0,'/uploads/20200721/0e60a7678b2e0dba688cdb03c4a9e3a8.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":66.85,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00029.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=4rp28r0JREXzh%2Fi4b7fsKctIC5U%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'d876c521156e5c6c87f1ae300c5d0428','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00035.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=OwHvTwgycCQJ4VUvxEnT2HIHgd0%3D','sface','sface',0,'/uploads/20200721/f1e9a9e681e3792e499c7f4ca6b8e0d3.jpg','{\"name\":\"\\u5510\\u7eb3\\u5fb7\\u00b7\\u7279\\u6717\\u666e\",\"rate\":68.62,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00035.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=OwHvTwgycCQJ4VUvxEnT2HIHgd0%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018407\"}',1595262052,1595262052),
	(54,'eca5445a1c6dd5cd07aa25bbd831f53e','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00011.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=1SYk13IPhp2HDX57feDKyqY3huM%3D','sface','sface',0,'/uploads/20200721/949d6364f60d395eb6b6baec086aae90.jpg','{\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":67.6,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00011.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=1SYk13IPhp2HDX57feDKyqY3huM%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018209\"}',1595262052,1595262052),
	(54,'f49fd589f636f06f03ab9a738ce84087','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00013.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=5JEK2UQrJp8jCLSAPAtDfqQRnog%3D','sface','sface',0,'/uploads/20200721/41082e9eed7ea14c501291146b3365dd.jpg','{\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":77.97,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00013.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=5JEK2UQrJp8jCLSAPAtDfqQRnog%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018209\"}',1595262052,1595262052),
	(54,'f49fd589f636f06f03ab9a738ce84087','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00013.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=5JEK2UQrJp8jCLSAPAtDfqQRnog%3D','terrorism','terrorism',1,'/uploads/20200721/41082e9eed7ea14c501291146b3365dd.jpg','{\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":77.97,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00013.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=5JEK2UQrJp8jCLSAPAtDfqQRnog%3D\",\"scene\":\"terrorism\",\"label\":\"terrorism\",\"face_id\":\"AliFace_0018209\"}',1595262052,1595262052),
	(54,'f8e00c007df11c62e0e9125f48fb2e99','https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/21195a39/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00003.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=X27%2FEgR9bLBrEuRDdBReQ0Q6Y9E%3D','sface','sface',0,'/uploads/20200721/5bc3c6884967b29564abdcfe903dfdce.jpg','{\"name\":\"\\u8d1d\\u62c9\\u514b\\u00b7\\u4faf\\u8d5b\\u56e0\\u00b7\\u5965\\u5df4\\u9a6c\",\"rate\":64.7,\"url\":\"https:\\/\\/aligreen-shanghai.oss-cn-shanghai.aliyuncs.com\\/prod\\/hammal\\/21195a39\\/14289333_2472f175792c45fcecec53f3fa45f7d8.mp4-frames\\/f00003.jpg?Expires=1595263852&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=X27%2FEgR9bLBrEuRDdBReQ0Q6Y9E%3D\",\"scene\":\"sface\",\"label\":\"sface\",\"face_id\":\"AliFace_0018209\"}',1595262052,1595262052);

/*!40000 ALTER TABLE `fa_attachment_ai_sface` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_auth_group`;

CREATE TABLE `fa_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分组表';

LOCK TABLES `fa_auth_group` WRITE;
/*!40000 ALTER TABLE `fa_auth_group` DISABLE KEYS */;

INSERT INTO `fa_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`)
VALUES
	(1,0,'Admin group','*',1490883540,149088354,'normal'),
	(2,1,'Second group','13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5',1490883540,1505465692,'normal'),
	(3,2,'Third group','1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5',1490883540,1502205322,'normal'),
	(4,1,'Second group 2','1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65',1490883540,1502205350,'normal'),
	(5,2,'Third group 2','1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34',1490883540,1502205344,'normal');

/*!40000 ALTER TABLE `fa_auth_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_auth_group_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_auth_group_access`;

CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限分组表';

LOCK TABLES `fa_auth_group_access` WRITE;
/*!40000 ALTER TABLE `fa_auth_group_access` DISABLE KEYS */;

INSERT INTO `fa_auth_group_access` (`uid`, `group_id`)
VALUES
	(1,1);

/*!40000 ALTER TABLE `fa_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_auth_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_auth_rule`;

CREATE TABLE `fa_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='节点表';

LOCK TABLES `fa_auth_rule` WRITE;
/*!40000 ALTER TABLE `fa_auth_rule` DISABLE KEYS */;

INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `condition`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`)
VALUES
	(1,'file',0,'dashboard','个人工作台','fa fa-dashboard','','Dashboard tips',1,1497429920,1595230718,143,'normal'),
	(2,'file',0,'general','General','fa fa-cogs','','',1,1497429920,1497430169,137,'normal'),
	(3,'file',0,'category','Category','fa fa-leaf','','Category tips',0,1497429920,1595232134,119,'normal'),
	(4,'file',0,'addon','Addon','fa fa-rocket','','Addon tips',0,1502035509,1592407890,0,'normal'),
	(5,'file',0,'auth','权限管理','fa fa-group','','',1,1497429920,1592409702,99,'normal'),
	(6,'file',2,'general/config','Config','fa fa-cog','','Config tips',1,1497429920,1497430683,60,'normal'),
	(7,'file',2,'general/attachment','Attachment','fa fa-file-image-o','','Attachment tips',1,1497429920,1497430699,53,'normal'),
	(8,'file',2,'general/profile','Profile','fa fa-user','','',1,1497429920,1497429920,34,'normal'),
	(9,'file',5,'auth/admin','Admin','fa fa-user','','Admin tips',1,1497429920,1497430320,118,'normal'),
	(10,'file',5,'auth/adminlog','Admin log','fa fa-list-alt','','Admin log tips',1,1497429920,1497430307,113,'normal'),
	(11,'file',5,'auth/group','Group','fa fa-group','','Group tips',1,1497429920,1497429920,109,'normal'),
	(12,'file',5,'auth/rule','Rule','fa fa-bars','','Rule tips',1,1497429920,1497430581,104,'normal'),
	(13,'file',1,'dashboard/index','View','fa fa-circle-o','','',0,1497429920,1497429920,136,'normal'),
	(14,'file',1,'dashboard/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,135,'normal'),
	(15,'file',1,'dashboard/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,133,'normal'),
	(16,'file',1,'dashboard/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,134,'normal'),
	(17,'file',1,'dashboard/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,132,'normal'),
	(18,'file',6,'general/config/index','View','fa fa-circle-o','','',0,1497429920,1497429920,52,'normal'),
	(19,'file',6,'general/config/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,51,'normal'),
	(20,'file',6,'general/config/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,50,'normal'),
	(21,'file',6,'general/config/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,49,'normal'),
	(22,'file',6,'general/config/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,48,'normal'),
	(23,'file',7,'general/attachment/index','View','fa fa-circle-o','','Attachment tips',0,1497429920,1497429920,59,'normal'),
	(24,'file',7,'general/attachment/select','Select attachment','fa fa-circle-o','','',0,1497429920,1497429920,58,'normal'),
	(25,'file',7,'general/attachment/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,57,'normal'),
	(26,'file',7,'general/attachment/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,56,'normal'),
	(27,'file',7,'general/attachment/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,55,'normal'),
	(28,'file',7,'general/attachment/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,54,'normal'),
	(29,'file',8,'general/profile/index','View','fa fa-circle-o','','',0,1497429920,1497429920,33,'normal'),
	(30,'file',8,'general/profile/update','Update profile','fa fa-circle-o','','',0,1497429920,1497429920,32,'normal'),
	(31,'file',8,'general/profile/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,31,'normal'),
	(32,'file',8,'general/profile/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,30,'normal'),
	(33,'file',8,'general/profile/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,29,'normal'),
	(34,'file',8,'general/profile/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,28,'normal'),
	(35,'file',3,'category/index','View','fa fa-circle-o','','Category tips',0,1497429920,1497429920,142,'normal'),
	(36,'file',3,'category/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,141,'normal'),
	(37,'file',3,'category/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,140,'normal'),
	(38,'file',3,'category/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,139,'normal'),
	(39,'file',3,'category/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,138,'normal'),
	(40,'file',9,'auth/admin/index','View','fa fa-circle-o','','Admin tips',0,1497429920,1497429920,117,'normal'),
	(41,'file',9,'auth/admin/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,116,'normal'),
	(42,'file',9,'auth/admin/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,115,'normal'),
	(43,'file',9,'auth/admin/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,114,'normal'),
	(44,'file',10,'auth/adminlog/index','View','fa fa-circle-o','','Admin log tips',0,1497429920,1497429920,112,'normal'),
	(45,'file',10,'auth/adminlog/detail','Detail','fa fa-circle-o','','',0,1497429920,1497429920,111,'normal'),
	(46,'file',10,'auth/adminlog/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,110,'normal'),
	(47,'file',11,'auth/group/index','View','fa fa-circle-o','','Group tips',0,1497429920,1497429920,108,'normal'),
	(48,'file',11,'auth/group/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,107,'normal'),
	(49,'file',11,'auth/group/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,106,'normal'),
	(50,'file',11,'auth/group/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,105,'normal'),
	(51,'file',12,'auth/rule/index','View','fa fa-circle-o','','Rule tips',0,1497429920,1497429920,103,'normal'),
	(52,'file',12,'auth/rule/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,102,'normal'),
	(53,'file',12,'auth/rule/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,101,'normal'),
	(54,'file',12,'auth/rule/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,100,'normal'),
	(55,'file',4,'addon/index','View','fa fa-circle-o','','Addon tips',0,1502035509,1502035509,0,'normal'),
	(56,'file',4,'addon/add','Add','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),
	(57,'file',4,'addon/edit','Edit','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),
	(58,'file',4,'addon/del','Delete','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),
	(59,'file',4,'addon/downloaded','Local addon','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),
	(60,'file',4,'addon/state','Update state','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),
	(63,'file',4,'addon/config','Setting','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),
	(64,'file',4,'addon/refresh','Refresh','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),
	(65,'file',4,'addon/multi','Multi','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),
	(66,'file',0,'user','User','fa fa-list','','',0,1516374729,1592558722,0,'normal'),
	(67,'file',66,'user/user','User','fa fa-user','','',1,1516374729,1516374729,0,'normal'),
	(68,'file',67,'user/user/index','View','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),
	(69,'file',67,'user/user/edit','Edit','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),
	(70,'file',67,'user/user/add','Add','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),
	(71,'file',67,'user/user/del','Del','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),
	(72,'file',67,'user/user/multi','Multi','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),
	(73,'file',66,'user/group','User group','fa fa-users','','',1,1516374729,1516374729,0,'normal'),
	(74,'file',73,'user/group/add','Add','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),
	(75,'file',73,'user/group/edit','Edit','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),
	(76,'file',73,'user/group/index','View','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),
	(77,'file',73,'user/group/del','Del','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),
	(78,'file',73,'user/group/multi','Multi','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),
	(79,'file',66,'user/rule','User rule','fa fa-circle-o','','',1,1516374729,1516374729,0,'normal'),
	(80,'file',79,'user/rule/index','View','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),
	(81,'file',79,'user/rule/del','Del','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),
	(82,'file',79,'user/rule/add','Add','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),
	(83,'file',79,'user/rule/edit','Edit','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),
	(84,'file',79,'user/rule/multi','Multi','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),
	(105,'file',0,'data','数据中心','fa fa-database','','',1,1592492524,1595231638,0,'normal'),
	(106,'file',105,'data/import','Import','fa fa-circle-o','','',0,1592492524,1592492524,0,'normal'),
	(107,'file',105,'data/index','查看','fa fa-circle-o','','',0,1592492524,1592492524,0,'normal'),
	(108,'file',105,'data/recyclebin','回收站','fa fa-circle-o','','',0,1592492524,1592492524,0,'normal'),
	(109,'file',105,'data/add','添加','fa fa-circle-o','','',0,1592492524,1592492524,0,'normal'),
	(110,'file',105,'data/edit','编辑','fa fa-circle-o','','',0,1592492524,1592492524,0,'normal'),
	(111,'file',105,'data/del','删除','fa fa-circle-o','','',0,1592492524,1592492524,0,'normal'),
	(112,'file',105,'data/destroy','真实删除','fa fa-circle-o','','',0,1592492524,1592492524,0,'normal'),
	(113,'file',105,'data/restore','还原','fa fa-circle-o','','',0,1592492524,1592492524,0,'normal'),
	(114,'file',105,'data/multi','批量更新','fa fa-circle-o','','',0,1592492524,1592492524,0,'normal'),
	(115,'file',0,'task','任务中心','fa fa-tasks','','',1,1592536051,1595230609,0,'normal'),
	(116,'file',115,'task/tasklist','任务列表','fa fa-circle-o','','',1,1592536051,1592536112,0,'normal'),
	(117,'file',116,'task/tasklist/import','Import','fa fa-circle-o','','',0,1592536051,1592536051,0,'normal'),
	(118,'file',116,'task/tasklist/index','查看','fa fa-circle-o','','',0,1592536051,1592536051,0,'normal'),
	(119,'file',116,'task/tasklist/recyclebin','回收站','fa fa-circle-o','','',0,1592536051,1592536051,0,'normal'),
	(120,'file',116,'task/tasklist/add','添加','fa fa-circle-o','','',0,1592536051,1592536051,0,'normal'),
	(121,'file',116,'task/tasklist/edit','编辑','fa fa-circle-o','','',0,1592536051,1592536051,0,'normal'),
	(122,'file',116,'task/tasklist/del','删除','fa fa-circle-o','','',0,1592536051,1592536051,0,'normal'),
	(123,'file',116,'task/tasklist/destroy','真实删除','fa fa-circle-o','','',0,1592536051,1592536051,0,'normal'),
	(124,'file',116,'task/tasklist/restore','还原','fa fa-circle-o','','',0,1592536051,1592536051,0,'normal'),
	(125,'file',116,'task/tasklist/multi','批量更新','fa fa-circle-o','','',0,1592536051,1592536051,0,'normal'),
	(126,'file',115,'task/taskmy','我的任务','fa fa-circle-o','','',1,1592536055,1592536157,0,'normal'),
	(127,'file',126,'task/taskmy/import','Import','fa fa-circle-o','','',0,1592536055,1592536055,0,'normal'),
	(128,'file',126,'task/taskmy/index','查看','fa fa-circle-o','','',0,1592536055,1592536055,0,'normal'),
	(129,'file',126,'task/taskmy/recyclebin','回收站','fa fa-circle-o','','',0,1592536055,1592536055,0,'normal'),
	(130,'file',126,'task/taskmy/add','添加','fa fa-circle-o','','',0,1592536055,1592536055,0,'normal'),
	(131,'file',126,'task/taskmy/edit','编辑','fa fa-circle-o','','',0,1592536055,1592536055,0,'normal'),
	(132,'file',126,'task/taskmy/del','删除','fa fa-circle-o','','',0,1592536055,1592536055,0,'normal'),
	(133,'file',126,'task/taskmy/destroy','真实删除','fa fa-circle-o','','',0,1592536055,1592536055,0,'normal'),
	(134,'file',126,'task/taskmy/restore','还原','fa fa-circle-o','','',0,1592536055,1592536055,0,'normal'),
	(135,'file',126,'task/taskmy/multi','批量更新','fa fa-circle-o','','',0,1592536055,1592536055,0,'normal'),
	(136,'file',0,'task/1','开放接口','fa fa-circle-o','','',1,1595230655,1595230655,0,'normal'),
	(137,'file',0,'task/2','统计中心','fa fa-circle-o','','',1,1595230681,1595230681,0,'normal'),
	(138,'file',0,'audit_setting','审核配置','fa fa-circle-o','','',1,1595231727,1595231727,0,'normal'),
	(139,'file',138,'audit_setting/sface','人脸策略','fa fa-circle-o','','',1,1595231782,1595231782,0,'normal'),
	(140,'file',138,'audit_setting/text','文本策略','fa fa-circle-o','','',1,1595231804,1595231804,0,'normal'),
	(141,'file',138,'audit_setting/image','图像策略','fa fa-circle-o','','',1,1595231829,1595231829,0,'normal');

/*!40000 ALTER TABLE `fa_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_category`;

CREATE TABLE `fa_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分类表';

LOCK TABLES `fa_category` WRITE;
/*!40000 ALTER TABLE `fa_category` DISABLE KEYS */;

INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`)
VALUES
	(1,0,'page','官方新闻','news','recommend','/assets/img/qrcode.png','','','news',1495262190,1495262190,1,'normal'),
	(2,0,'page','移动应用','mobileapp','hot','/assets/img/qrcode.png','','','mobileapp',1495262244,1495262244,2,'normal'),
	(3,2,'page','微信公众号','wechatpublic','index','/assets/img/qrcode.png','','','wechatpublic',1495262288,1495262288,3,'normal'),
	(4,2,'page','Android开发','android','recommend','/assets/img/qrcode.png','','','android',1495262317,1495262317,4,'normal'),
	(5,0,'page','软件产品','software','recommend','/assets/img/qrcode.png','','','software',1495262336,1499681850,5,'normal'),
	(6,5,'page','网站建站','website','recommend','/assets/img/qrcode.png','','','website',1495262357,1495262357,6,'normal'),
	(7,5,'page','企业管理软件','company','index','/assets/img/qrcode.png','','','company',1495262391,1495262391,7,'normal'),
	(8,6,'page','PC端','website-pc','recommend','/assets/img/qrcode.png','','','website-pc',1495262424,1495262424,8,'normal'),
	(9,6,'page','移动端','website-mobile','recommend','/assets/img/qrcode.png','','','website-mobile',1495262456,1495262456,9,'normal'),
	(10,7,'page','CRM系统 ','company-crm','recommend','/assets/img/qrcode.png','','','company-crm',1495262487,1495262487,10,'normal'),
	(11,7,'page','SASS平台软件','company-sass','recommend','/assets/img/qrcode.png','','','company-sass',1495262515,1495262515,11,'normal'),
	(12,0,'test','测试1','test1','recommend','/assets/img/qrcode.png','','','test1',1497015727,1497015727,12,'normal'),
	(13,0,'test','测试2','test2','recommend','/assets/img/qrcode.png','','','test2',1497015738,1497015738,13,'normal');

/*!40000 ALTER TABLE `fa_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_config`;

CREATE TABLE `fa_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变量值',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统配置';

LOCK TABLES `fa_config` WRITE;
/*!40000 ALTER TABLE `fa_config` DISABLE KEYS */;

INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `value`, `content`, `rule`, `extend`)
VALUES
	(1,'name','basic','Site name','请填写站点名称','string','白泽智能-审核平台','','required',''),
	(2,'beian','basic','Beian','粤ICP备15000000号-1','string','','','',''),
	(3,'cdnurl','basic','Cdn url','如果静态资源使用第三方云储存请配置该值','string','','','',''),
	(4,'version','basic','Version','如果静态资源有变动请重新配置该值','string','1.0.1','','required',''),
	(5,'timezone','basic','Timezone','','string','Asia/Shanghai','','required',''),
	(6,'forbiddenip','basic','Forbidden ip','一行一条记录','text','','','',''),
	(7,'languages','basic','Languages','','array','{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}','','required',''),
	(8,'fixedpage','basic','Fixed page','请尽量输入左侧菜单栏存在的链接','string','dashboard','','required',''),
	(9,'categorytype','dictionary','Category type','','array','{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}','','',''),
	(10,'configgroup','dictionary','Config group','','array','{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}','','',''),
	(11,'mail_type','email','Mail type','选择邮件发送方式','select','1','[\"Please select\",\"SMTP\",\"Mail\"]','',''),
	(12,'mail_smtp_host','email','Mail smtp host','错误的配置发送邮件会导致服务器超时','string','smtp.qq.com','','',''),
	(13,'mail_smtp_port','email','Mail smtp port','(不加密默认25,SSL默认465,TLS默认587)','string','465','','',''),
	(14,'mail_smtp_user','email','Mail smtp user','（填写完整用户名）','string','10000','','',''),
	(15,'mail_smtp_pass','email','Mail smtp password','（填写您的密码）','string','password','','',''),
	(16,'mail_verify_type','email','Mail vertify type','（SMTP验证方式[推荐SSL]）','select','2','[\"None\",\"TLS\",\"SSL\"]','',''),
	(17,'mail_from','email','Mail from','','string','10000@qq.com','','','');

/*!40000 ALTER TABLE `fa_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_data`;

CREATE TABLE `fa_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `index_pic` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '索引图片',
  `type` enum('pic','video','audio','txt') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'video' COMMENT '类型:pic=图片,video=视频,audio=音频,txt=文本',
  `file` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件',
  `file_id` int(11) DEFAULT '0',
  `auditor_id` int(10) DEFAULT '0' COMMENT '审核人',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `filesize` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '文件大小',
  `author` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '无名' COMMENT '作者',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `source` enum('ar','ai') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ai' COMMENT '来源:ar=人工,ai=机器',
  `data_status` enum('0','1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '数据状态:0=上传中,1=上传完成,2=上传失败,3=等待审核,4=智能审核中,5=智能审核完成',
  `ai_status` enum('0','1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '智能状态:0=审核中,1=正常,2=疑似,3=违规,4=失败',
  `ai_result` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ai结果',
  `ai_result_detail` text COLLATE utf8mb4_unicode_ci COMMENT 'ai结果详情',
  `ar_status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '人工状态:1=正常,2=打回',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='数据表';

LOCK TABLES `fa_data` WRITE;
/*!40000 ALTER TABLE `fa_data` DISABLE KEYS */;

INSERT INTO `fa_data` (`id`, `index_pic`, `type`, `file`, `file_id`, `auditor_id`, `title`, `filesize`, `author`, `createtime`, `updatetime`, `deletetime`, `source`, `data_status`, `ai_status`, `ai_result`, `ai_result_detail`, `ar_status`)
VALUES
	(36,'/assets/img/video.png','video','/uploads/20200721/2472f175792c45fcecec53f3fa45f7d8.mp4',54,0,'关于奥巴马视频','0','无名',1595261990,1595261990,NULL,'ai','5','2','review','[{\"aid\":54,\"label\":\"normal\",\"rate\":\"99.9\",\"scene\":\"porn\",\"suggestion\":\"pass\",\"result_type\":\"default\"},{\"aid\":54,\"label\":\"terrorism\",\"rate\":\"77.97\",\"scene\":\"terrorism\",\"suggestion\":\"review\",\"result_type\":\"default\"},{\"aid\":54,\"label\":\"normal\",\"rate\":\"99.9\",\"scene\":\"live\",\"suggestion\":\"pass\",\"result_type\":\"default\"},{\"aid\":54,\"label\":\"normal\",\"rate\":\"99.9\",\"scene\":\"logo\",\"suggestion\":\"pass\",\"result_type\":\"default\"},{\"aid\":54,\"label\":\"normal\",\"rate\":\"99.9\",\"scene\":\"ad\",\"suggestion\":\"pass\",\"result_type\":\"default\"},{\"aid\":54,\"label\":\"sface\",\"rate\":\"80.55\",\"scene\":\"sface\",\"suggestion\":\"review\",\"result_type\":\"default\"},{\"aid\":54,\"label\":\"normal\",\"rate\":\"99.91\",\"scene\":\"antispam\",\"suggestion\":\"pass\",\"result_type\":\"video_audio\"}]','1'),
	(37,'/assets/img/image.png','pic','/uploads/20200721/d9a31a85c344435be447bf6560f85f19.jpeg',78,0,'关于薄熙来敏感人物头像','0','无名',1595263294,1595263294,NULL,'ai','5','3','block','[{\"aid\":78,\"label\":\"normal\",\"rate\":\"100\",\"scene\":\"porn\",\"suggestion\":\"pass\",\"result_type\":\"default\"},{\"aid\":78,\"label\":\"politics\",\"rate\":\"100\",\"scene\":\"terrorism\",\"suggestion\":\"block\",\"result_type\":\"default\"},{\"aid\":78,\"label\":\"sface\",\"rate\":\"98.53\",\"scene\":\"sface\",\"suggestion\":\"review\",\"result_type\":\"default\"}]','1'),
	(38,'/assets/img/image.png','video','/uploads/20200721/b511d118d20abfcb256732483d88f06c.jpg',79,0,'关于敏感任务本拉登','0','无名',1595263630,1595263630,NULL,'ai','5','3','block','[{\"aid\":79,\"label\":\"normal\",\"rate\":\"97.27\",\"scene\":\"porn\",\"suggestion\":\"pass\",\"result_type\":\"default\"},{\"aid\":79,\"label\":\"politics\",\"rate\":\"100\",\"scene\":\"terrorism\",\"suggestion\":\"block\",\"result_type\":\"default\"},{\"aid\":79,\"label\":\"sface\",\"rate\":\"98.42\",\"scene\":\"sface\",\"suggestion\":\"review\",\"result_type\":\"default\"}]','1'),
	(39,'/assets/img/audio.png','audio','/uploads/20200721/aaf5a61f702b368e039f27ece2f83cd9.mp3',80,0,'音乐音频文字识别','0','无名',1595263691,1595263691,NULL,'ai','5','1','pass','[{\"aid\":80,\"label\":\"normal\",\"rate\":\"99.91\",\"scene\":\"antispam\",\"suggestion\":\"pass\",\"result_type\":\"default\"}]','1'),
	(40,'/assets/img/text.png','txt','/uploads/20200721/56421191913bd0400ac7929570c45d65.txt',81,0,'文字内容识别测试','0','无名',1595263764,1595263764,NULL,'ai','5','1','pass','[{\"aid\":81,\"label\":\"normal\",\"rate\":\"99.91\",\"scene\":\"antispam\",\"suggestion\":\"pass\",\"result_type\":\"default\"}]','1');

/*!40000 ALTER TABLE `fa_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_ems
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_ems`;

CREATE TABLE `fa_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮箱验证码表';



# Dump of table fa_sms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_sms`;

CREATE TABLE `fa_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信验证码表';



# Dump of table fa_test
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_test`;

CREATE TABLE `fa_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='测试表';

LOCK TABLES `fa_test` WRITE;
/*!40000 ALTER TABLE `fa_test` DISABLE KEYS */;

INSERT INTO `fa_test` (`id`, `admin_id`, `category_id`, `category_ids`, `week`, `flag`, `genderdata`, `hobbydata`, `title`, `content`, `image`, `images`, `attachfile`, `keywords`, `description`, `city`, `json`, `price`, `views`, `startdate`, `activitytime`, `year`, `times`, `refreshtime`, `createtime`, `updatetime`, `deletetime`, `weigh`, `switch`, `status`, `state`)
VALUES
	(1,0,12,'12,13','monday','hot,index','male','music,reading','我是一篇测试文章','<p>我是测试内容</p>','/assets/img/avatar.png','/assets/img/avatar.png,/assets/img/qrcode.png','/assets/img/avatar.png','关键字','描述','广西壮族自治区/百色市/平果县','{\"a\":\"1\",\"b\":\"2\"}',0.00,0,'2017-07-10','2017-07-10 18:24:45','2017','18:24:45',1499682285,1499682526,1499682526,NULL,0,1,'normal','1');

/*!40000 ALTER TABLE `fa_test` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_user`;

CREATE TABLE `fa_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员表';

LOCK TABLES `fa_user` WRITE;
/*!40000 ALTER TABLE `fa_user` DISABLE KEYS */;

INSERT INTO `fa_user` (`id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`)
VALUES
	(1,1,'admin','admin','08b47c742e4967a89bb4da5730ffe7da','G9SDIQ','admin@163.com','13888888888','',0,0,'2017-04-15','',0.00,0,1,1,1516171614,1592407927,'127.0.0.1',0,'127.0.0.1',1491461418,0,1592407927,'','normal','');

/*!40000 ALTER TABLE `fa_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_user_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_user_group`;

CREATE TABLE `fa_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8mb4_unicode_ci COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员组表';

LOCK TABLES `fa_user_group` WRITE;
/*!40000 ALTER TABLE `fa_user_group` DISABLE KEYS */;

INSERT INTO `fa_user_group` (`id`, `name`, `rules`, `createtime`, `updatetime`, `status`)
VALUES
	(1,'默认组','1,2,3,4,5,6,7,8,9,10,11,12',1515386468,1516168298,'normal');

/*!40000 ALTER TABLE `fa_user_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_user_money_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_user_money_log`;

CREATE TABLE `fa_user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员余额变动表';



# Dump of table fa_user_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_user_rule`;

CREATE TABLE `fa_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员规则表';

LOCK TABLES `fa_user_rule` WRITE;
/*!40000 ALTER TABLE `fa_user_rule` DISABLE KEYS */;

INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`)
VALUES
	(1,0,'index','前台','',1,1516168079,1516168079,1,'normal'),
	(2,0,'api','API接口','',1,1516168062,1516168062,2,'normal'),
	(3,1,'user','会员模块','',1,1515386221,1516168103,12,'normal'),
	(4,2,'user','会员模块','',1,1515386221,1516168092,11,'normal'),
	(5,3,'index/user/login','登录','',0,1515386247,1515386247,5,'normal'),
	(6,3,'index/user/register','注册','',0,1515386262,1516015236,7,'normal'),
	(7,3,'index/user/index','会员中心','',0,1516015012,1516015012,9,'normal'),
	(8,3,'index/user/profile','个人资料','',0,1516015012,1516015012,4,'normal'),
	(9,4,'api/user/login','登录','',0,1515386247,1515386247,6,'normal'),
	(10,4,'api/user/register','注册','',0,1515386262,1516015236,8,'normal'),
	(11,4,'api/user/index','会员中心','',0,1516015012,1516015012,10,'normal'),
	(12,4,'api/user/profile','个人资料','',0,1516015012,1516015012,3,'normal');

/*!40000 ALTER TABLE `fa_user_rule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_user_score_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_user_score_log`;

CREATE TABLE `fa_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员积分变动表';

LOCK TABLES `fa_user_score_log` WRITE;
/*!40000 ALTER TABLE `fa_user_score_log` DISABLE KEYS */;

INSERT INTO `fa_user_score_log` (`id`, `user_id`, `score`, `before`, `after`, `memo`, `createtime`)
VALUES
	(1,1,0,0,0,'管理员变更积分',1592407909);

/*!40000 ALTER TABLE `fa_user_score_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fa_user_token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_user_token`;

CREATE TABLE `fa_user_token` (
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员Token表';



# Dump of table fa_version
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fa_version`;

CREATE TABLE `fa_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='版本表';




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
