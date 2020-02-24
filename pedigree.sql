/*
Navicat MySQL Data Transfer

Source Server         : lothar
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : pedigree

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-05-20 08:22:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for s_area
-- ----------------------------
DROP TABLE IF EXISTS `s_area`;
CREATE TABLE `s_area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '区域叫法; 长江流域、江南地区、塞北',
  `brief` varchar(255) NOT NULL DEFAULT '' COMMENT '简述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='区域表：大范围，如长江流域、江南地区、塞北';

-- ----------------------------
-- Records of s_area
-- ----------------------------

-- ----------------------------
-- Table structure for s_call
-- ----------------------------
DROP TABLE IF EXISTS `s_call`;
CREATE TABLE `s_call` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `area_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '区域表ID; 0通用(法律定义); 用于称呼快速查找; ',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '称呼: 阿哥/叔叔/婶婶',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='称呼表';

-- ----------------------------
-- Records of s_call
-- ----------------------------
INSERT INTO `s_call` VALUES ('1', '0', '爸爸');
INSERT INTO `s_call` VALUES ('2', '0', '妈妈');
INSERT INTO `s_call` VALUES ('3', '0', '爷爷');
INSERT INTO `s_call` VALUES ('4', '0', '奶奶');
INSERT INTO `s_call` VALUES ('5', '0', '爹爹');
INSERT INTO `s_call` VALUES ('6', '0', '外公');
INSERT INTO `s_call` VALUES ('7', '0', '外婆');
INSERT INTO `s_call` VALUES ('8', '0', '家公');
INSERT INTO `s_call` VALUES ('9', '0', '家婆');
INSERT INTO `s_call` VALUES ('10', '0', '丈夫');
INSERT INTO `s_call` VALUES ('11', '0', '妻子');
INSERT INTO `s_call` VALUES ('12', '0', '老公');
INSERT INTO `s_call` VALUES ('13', '0', '老婆');
INSERT INTO `s_call` VALUES ('14', '0', '娘子');

-- ----------------------------
-- Table structure for s_district
-- ----------------------------
DROP TABLE IF EXISTS `s_district`;
CREATE TABLE `s_district` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系路径',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '地区名称',
  `coordinate` varchar(50) NOT NULL DEFAULT '' COMMENT '地理坐标，用于区域分布',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='行政区表：法律明确定义的';

-- ----------------------------
-- Records of s_district
-- ----------------------------
INSERT INTO `s_district` VALUES ('1', '0', '0-1', '中国', '');
INSERT INTO `s_district` VALUES ('2', '1', '0-1-1', '北京', '');
INSERT INTO `s_district` VALUES ('3', '1', '0-1-2', '安徽', '');

-- ----------------------------
-- Table structure for s_kinship
-- ----------------------------
DROP TABLE IF EXISTS `s_kinship`;
CREATE TABLE `s_kinship` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '亲属关系ID',
  `pre_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '成员A',
  `next_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '成员B',
  `call_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '称呼表',
  PRIMARY KEY (`id`),
  KEY `pre_id` (`pre_id`,`next_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='成员称呼关系表。A对B的称呼';

-- ----------------------------
-- Records of s_kinship
-- ----------------------------
INSERT INTO `s_kinship` VALUES ('1', '1', '2', '11');
INSERT INTO `s_kinship` VALUES ('2', '1', '2', '13');
INSERT INTO `s_kinship` VALUES ('3', '2', '1', '10');
INSERT INTO `s_kinship` VALUES ('4', '2', '1', '12');

-- ----------------------------
-- Table structure for s_member
-- ----------------------------
DROP TABLE IF EXISTS `s_member`;
CREATE TABLE `s_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dis_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区ID',
  `race_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '种族ID',
  `login_name` varchar(30) NOT NULL DEFAULT '' COMMENT '登录名; 用户名',
  `passwd` varchar(64) NOT NULL DEFAULT '' COMMENT '密码；口令 ',
  `first_name` varchar(30) NOT NULL DEFAULT '' COMMENT '法定名字',
  `last_name` varchar(30) NOT NULL DEFAULT '' COMMENT '法定姓氏',
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '昵称; 自己对自己的称谓',
  `appellation` varchar(255) NOT NULL DEFAULT '' COMMENT '别人对自己的称谓：大师，厨神……',
  `avatar` varchar(100) NOT NULL,
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别: 0保密; 1男; 2女;',
  `birthday` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '出生日期; 生日; 农历',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='成员基本表';

-- ----------------------------
-- Records of s_member
-- ----------------------------
INSERT INTO `s_member` VALUES ('1', '3', '1', 'lothar', '123456', '铭', '汪', '', '', '', '1', '1990-04-12 11:35:24', '', '');
INSERT INTO `s_member` VALUES ('2', '3', '1', 'wanan', '123456', '某某', '朱', '', '', '', '1', '1990-05-11 00:00:00', '', '');

-- ----------------------------
-- Table structure for s_member_info
-- ----------------------------
DROP TABLE IF EXISTS `s_member_info`;
CREATE TABLE `s_member_info` (
  `mb_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '成员表ID',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `web_url` varchar(255) NOT NULL DEFAULT '' COMMENT '个人网址',
  `remark` text COMMENT '备注',
  UNIQUE KEY `member_id` (`mb_id`) USING BTREE,
  CONSTRAINT `s_member_info_ibfk_1` FOREIGN KEY (`mb_id`) REFERENCES `s_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='成员副表';

-- ----------------------------
-- Records of s_member_info
-- ----------------------------
INSERT INTO `s_member_info` VALUES ('1', '', '', null);

-- ----------------------------
-- Table structure for s_ethnic
-- ----------------------------
DROP TABLE IF EXISTS `s_ethnic`;
CREATE TABLE `s_ethnic` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '种族ID',
  `area_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '区域表ID; 广泛分布的区域',
  `name` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '民族名',
  `brief` varchar(255) NOT NULL DEFAULT '' COMMENT '简述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='大中华56民族';

-- ----------------------------
-- Records of s_ethnic
-- ----------------------------
INSERT INTO `s_ethnic` VALUES ('1', '汉族', '大汉王朝');
