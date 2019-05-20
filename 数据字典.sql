-- 直系 direct
-- 称谓 label


-- 创建数据库
CREATE DATABASE IF NOT EXISTS `pedigree`;
USE `pedigree`;

-- 数据字典
-- 库名 pedigree
-- SET FOREIGN_KEY_CHECKS=0;

-- 称呼表的设计		ped_kinship
DROP TABLE IF EXISTS `ped_kinship`;
CREATE TABLE `ped_kinship` (
	`id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '称呼id',
	`kin` varchar(30) NOT NULL COMMENT '称呼',
	`type` tinyint(3) unsigned DEFAULT '0' COMMENT '类别',
	`sort` smallint(5) unsigned DEFAULT '0' COMMENT '排序',
	`WPCT` text COMMENT '备注',
	PRIMARY KEY (`id`),
  	UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 人物表的设计	ped_user
DROP TABLE IF EXISTS `ped_user`;
CREATE TABLE `ped_user` (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(20) NOT NULL,
	`pwd` char(32) NOT NULL,
	`mobile` varchar(11) DEFAULT '0';
	`email` varchar(30);
	`sex` enum('男','女','保密') DEFAULT '保密',
	`details` text,
	PRIMARY KEY ('id'),
	UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 人物关系表的设计 ped_relation
DROP TABLE IF EXISTS `ped_relation`;
CREATE TABLE `ped_relation` (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`fid` int unsigned NOT NULL,
	`hid` int unsigned NOT NULL,
	`wid` int unsigned NOT NULL
)





