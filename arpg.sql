/*
Navicat MySQL Data Transfer

Source Server         : weihaoyu
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : arpg

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-11-16 11:38:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gold` int(11) DEFAULT NULL,
  `diamond` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `head` int(11) DEFAULT NULL,
  `arm` int(11) DEFAULT NULL,
  `chest` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('245', '123', '123', '10000', '100', '1001', '0', '0', '0');
INSERT INTO `account` VALUES ('246', 'qwe', 'qwe', '10000', '100', '1001', '0', '0', '0');
INSERT INTO `account` VALUES ('247', '1', '1', '10000', '100', '1001', '0', '0', '0');

-- ----------------------------
-- Table structure for `characters`
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `race` int(4) DEFAULT NULL COMMENT '种族',
  `job` int(4) DEFAULT NULL COMMENT '职业',
  `gender` int(4) DEFAULT NULL COMMENT '性别',
  `level` int(11) DEFAULT NULL COMMENT '等级',
  `exp` int(11) DEFAULT NULL COMMENT '经验',
  `diamond` int(11) DEFAULT NULL,
  `gold` int(11) DEFAULT NULL,
  `pos_x` float DEFAULT NULL,
  `pos_y` float DEFAULT NULL,
  `pos_z` float DEFAULT NULL,
  `cfgid` int(11) DEFAULT NULL,
  `mapid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of characters
-- ----------------------------
INSERT INTO `characters` VALUES ('128', '240', '盖伦1', '0', '1', '1', '1', '0', '200', '1000', '0', '0.5', '0', '1002', '1001');
INSERT INTO `characters` VALUES ('129', '241', '盖伦', '0', '1', '1', '1', '0', '200', '1000', '0', '0.5', '0', '1001', '1001');

-- ----------------------------
-- Table structure for `equip`
-- ----------------------------
DROP TABLE IF EXISTS `equip`;
CREATE TABLE `equip` (
  `id` int(11) NOT NULL,
  `itemId` int(11) DEFAULT NULL,
  `atk` int(11) DEFAULT NULL,
  `def` int(11) DEFAULT NULL,
  `equipType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of equip
-- ----------------------------

-- ----------------------------
-- Table structure for `inventory`
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `characterid` int(11) DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=564 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('494', '128', '1', '1101', '1');
INSERT INTO `inventory` VALUES ('495', '128', '2', '1102', '1');
INSERT INTO `inventory` VALUES ('496', '128', '3', '1103', '1');
INSERT INTO `inventory` VALUES ('497', '128', '4', '1201', '1');
INSERT INTO `inventory` VALUES ('498', '128', '5', '1202', '1');
INSERT INTO `inventory` VALUES ('499', '128', '6', '1203', '1');
INSERT INTO `inventory` VALUES ('500', '128', '7', '1301', '1');
INSERT INTO `inventory` VALUES ('501', '128', '8', '1302', '1');
INSERT INTO `inventory` VALUES ('502', '128', '9', '1303', '1');
INSERT INTO `inventory` VALUES ('503', '128', '10', '1304', '1');
INSERT INTO `inventory` VALUES ('504', '128', '11', '-1', '1');
INSERT INTO `inventory` VALUES ('505', '128', '12', '-1', '1');
INSERT INTO `inventory` VALUES ('506', '128', '13', '-1', '1');
INSERT INTO `inventory` VALUES ('507', '128', '14', '-1', '1');
INSERT INTO `inventory` VALUES ('508', '128', '15', '-1', '1');
INSERT INTO `inventory` VALUES ('509', '128', '16', '-1', '1');
INSERT INTO `inventory` VALUES ('510', '128', '17', '-1', '1');
INSERT INTO `inventory` VALUES ('511', '128', '18', '-1', '1');
INSERT INTO `inventory` VALUES ('512', '128', '19', '-1', '1');
INSERT INTO `inventory` VALUES ('513', '128', '20', '-1', '1');
INSERT INTO `inventory` VALUES ('514', '129', '1', '1101', '1');
INSERT INTO `inventory` VALUES ('515', '129', '2', '1102', '1');
INSERT INTO `inventory` VALUES ('516', '129', '3', '1103', '1');
INSERT INTO `inventory` VALUES ('517', '129', '4', '1201', '1');
INSERT INTO `inventory` VALUES ('518', '129', '5', '1202', '1');
INSERT INTO `inventory` VALUES ('519', '129', '6', '1203', '1');
INSERT INTO `inventory` VALUES ('520', '129', '7', '1301', '1');
INSERT INTO `inventory` VALUES ('521', '129', '8', '1302', '1');
INSERT INTO `inventory` VALUES ('522', '129', '9', '1303', '1');
INSERT INTO `inventory` VALUES ('523', '129', '10', '1304', '1');
INSERT INTO `inventory` VALUES ('524', '129', '11', '-1', '1');
INSERT INTO `inventory` VALUES ('525', '129', '12', '-1', '1');
INSERT INTO `inventory` VALUES ('526', '129', '13', '-1', '1');
INSERT INTO `inventory` VALUES ('527', '129', '14', '-1', '1');
INSERT INTO `inventory` VALUES ('528', '129', '15', '-1', '1');
INSERT INTO `inventory` VALUES ('529', '129', '16', '-1', '1');
INSERT INTO `inventory` VALUES ('530', '129', '17', '-1', '1');
INSERT INTO `inventory` VALUES ('531', '129', '18', '-1', '1');
INSERT INTO `inventory` VALUES ('532', '129', '19', '-1', '1');
INSERT INTO `inventory` VALUES ('533', '129', '20', '-1', '1');
INSERT INTO `inventory` VALUES ('534', '129', '21', '-1', '1');
INSERT INTO `inventory` VALUES ('535', '129', '22', '-1', '1');
INSERT INTO `inventory` VALUES ('536', '129', '23', '-1', '1');
INSERT INTO `inventory` VALUES ('537', '129', '24', '-1', '1');
INSERT INTO `inventory` VALUES ('538', '129', '25', '-1', '1');
INSERT INTO `inventory` VALUES ('539', '129', '26', '-1', '1');
INSERT INTO `inventory` VALUES ('540', '129', '27', '-1', '1');
INSERT INTO `inventory` VALUES ('541', '129', '28', '-1', '1');
INSERT INTO `inventory` VALUES ('542', '129', '29', '-1', '1');
INSERT INTO `inventory` VALUES ('543', '129', '30', '-1', '1');
INSERT INTO `inventory` VALUES ('544', '129', '31', '-1', '1');
INSERT INTO `inventory` VALUES ('545', '129', '32', '-1', '1');
INSERT INTO `inventory` VALUES ('546', '129', '33', '-1', '1');
INSERT INTO `inventory` VALUES ('547', '129', '34', '-1', '1');
INSERT INTO `inventory` VALUES ('548', '129', '35', '-1', '1');
INSERT INTO `inventory` VALUES ('549', '129', '36', '-1', '1');
INSERT INTO `inventory` VALUES ('550', '129', '37', '-1', '1');
INSERT INTO `inventory` VALUES ('551', '129', '38', '-1', '1');
INSERT INTO `inventory` VALUES ('552', '129', '39', '-1', '1');
INSERT INTO `inventory` VALUES ('553', '129', '40', '-1', '1');
INSERT INTO `inventory` VALUES ('554', '129', '41', '-1', '1');
INSERT INTO `inventory` VALUES ('555', '129', '42', '-1', '1');
INSERT INTO `inventory` VALUES ('556', '129', '43', '-1', '1');
INSERT INTO `inventory` VALUES ('557', '129', '44', '-1', '1');
INSERT INTO `inventory` VALUES ('558', '129', '45', '-1', '1');
INSERT INTO `inventory` VALUES ('559', '129', '46', '-1', '1');
INSERT INTO `inventory` VALUES ('560', '129', '47', '-1', '1');
INSERT INTO `inventory` VALUES ('561', '129', '48', '-1', '1');
INSERT INTO `inventory` VALUES ('562', '129', '49', '-1', '1');
INSERT INTO `inventory` VALUES ('563', '129', '50', '-1', '1');

-- ----------------------------
-- Table structure for `mail`
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `deliver_time` varchar(255) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `has_items` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mail
-- ----------------------------
INSERT INTO `mail` VALUES ('34', '0', '128', '开服大礼包1', '您收到极品装备倚天剑的碎片1', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('35', '0', '128', '开服大礼包2', '您收到极品装备倚天剑的碎片2', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('36', '0', '128', '开服大礼包3', '您收到极品装备倚天剑的碎片3', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('37', '0', '128', '开服大礼包4', '您收到极品装备倚天剑的碎片4', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('38', '0', '128', '开服大礼包5', '您收到极品装备倚天剑的碎片5', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('39', '0', '128', '开服大礼包6', '您收到极品装备倚天剑的碎片6', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('40', '0', '128', '开服大礼包7', '您收到极品装备倚天剑的碎片7', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('41', '0', '128', '开服大礼包8', '您收到极品装备倚天剑的碎片8', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('42', '0', '128', '开服大礼包9', '您收到极品装备倚天剑的碎片9', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('43', '0', '128', '开服大礼包10', '您收到极品装备倚天剑的碎片10', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('44', '0', '129', '开服大礼包1', '您收到极品装备倚天剑的碎片1', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('45', '0', '129', '开服大礼包2', '您收到极品装备倚天剑的碎片2', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('46', '0', '129', '开服大礼包3', '您收到极品装备倚天剑的碎片3', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('47', '0', '129', '开服大礼包4', '您收到极品装备倚天剑的碎片4', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('48', '0', '129', '开服大礼包5', '您收到极品装备倚天剑的碎片5', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('49', '0', '129', '开服大礼包6', '您收到极品装备倚天剑的碎片6', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('50', '0', '129', '开服大礼包7', '您收到极品装备倚天剑的碎片7', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('51', '0', '129', '开服大礼包8', '您收到极品装备倚天剑的碎片8', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('52', '0', '129', '开服大礼包9', '您收到极品装备倚天剑的碎片9', '2017-06-23', '0', '0');
INSERT INTO `mail` VALUES ('53', '0', '129', '开服大礼包10', '您收到极品装备倚天剑的碎片10', '2017-06-23', '0', '0');

-- ----------------------------
-- Table structure for `mail_items`
-- ----------------------------
DROP TABLE IF EXISTS `mail_items`;
CREATE TABLE `mail_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mail_items
-- ----------------------------

-- ----------------------------
-- Table structure for `nowequip`
-- ----------------------------
DROP TABLE IF EXISTS `nowequip`;
CREATE TABLE `nowequip` (
  `id` int(11) NOT NULL,
  `head` int(11) DEFAULT NULL,
  `arm` int(11) DEFAULT NULL,
  `chest` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nowequip
-- ----------------------------

-- ----------------------------
-- Table structure for `queststats`
-- ----------------------------
DROP TABLE IF EXISTS `queststats`;
CREATE TABLE `queststats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `characterid` int(11) DEFAULT NULL,
  `questid` int(11) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `explored` int(4) DEFAULT NULL,
  `timer` int(11) DEFAULT NULL,
  `mobcount1` int(6) DEFAULT NULL,
  `mobcount2` int(6) DEFAULT NULL,
  `mobcount3` int(6) DEFAULT NULL,
  `mobcount4` int(6) DEFAULT NULL,
  `itemcount1` int(6) DEFAULT NULL,
  `itemcount2` int(6) DEFAULT NULL,
  `itemcount3` int(6) DEFAULT NULL,
  `itemcount4` int(6) DEFAULT NULL,
  `playercount` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of queststats
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
