-- 直系亲属 direct relative
-- 旁系亲属 collateral relatives
-- 称谓 appellation


-- 创建数据库
CREATE DATABASE IF NOT EXISTS `pedigree`;
USE `pedigree`;

-- 数据字典
-- 库名 pedigree
-- SET FOREIGN_KEY_CHECKS=0;

-- 人物表的设计	ped_user
-- 不推荐 `sex` enum('男','女','保密') NOT NULL DEFAULT '保密' COMMENT '',
DROP TABLE IF EXISTS `ped_user`;
CREATE TABLE `ped_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 称呼表的设计		ped_appellation
DROP TABLE IF EXISTS `ped_appellation`;
CREATE TABLE `ped_appellation` (
	`id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '称呼id',
	`district_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '地方',
	`name` varchar(30) NOT NULL COMMENT '称呼名',
	`type` tinyint(3) unsigned DEFAULT '0' COMMENT '类别：是否长辈对晚辈的称谓',
	`remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
	`list_order` smallint(6) unsigned DEFAULT '0' COMMENT '排序字段，类型float,默认值10000，默认排序按从小到大',
	PRIMARY KEY (`id`),
	KEY `idx1` (`district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='称谓表';

-- 人物关系表的设计 ped_kinship
DROP TABLE IF EXISTS `ped_kinship`;
-- CREATE TABLE `ped_kinship` (
-- 	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
-- 	`fid` int(11) unsigned NOT NULL COMMENT '父亲ID',
-- 	`hid` int(11) unsigned NOT NULL COMMENT '丈夫ID',
-- 	`wid` int(11) unsigned NOT NULL COMMENT '妻子ID',
-- 	PRIMARY KEY ('id'),
-- 	KEY `fid` (`fid`),
-- 	KEY `hid` (`hid`),
-- 	KEY `wid` (`wid`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='亲属关系表';
CREATE TABLE `ped_kinship` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`ap_id` int(11) unsigned NOT NULL COMMENT '称呼ID',
	`user_id1` int(11) unsigned NOT NULL COMMENT '成员1 ID',
	`user_id2` int(11) unsigned NOT NULL COMMENT '成员2 ID',
	PRIMARY KEY ('id'),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='亲属关系表';


DROP TABLE IF EXISTS `ped_user_zone`;
CREATE TABLE `ped_user_zone` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
	`user_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '用户ID',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='个人空间表';









