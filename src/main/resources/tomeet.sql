/*
Navicat MySQL Data Transfer

Source Server         : 正式环境
Source Server Version : 50715
Source Host           : tomeet-app.mysql.rds.aliyuncs.com:3306
Source Database       : tomeet

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-06-28 14:08:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `expire` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('2', 'yueyuan', '670B14728AD9902AECBA32E22FA4F6BD', 'db051d7b-0490-4178-913c-01baf1cdeeff', '2017-06-28 13:56:08');

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_current` tinyint(1) DEFAULT '0',
  `platform` varchar(16) NOT NULL DEFAULT 'android',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES ('2', '1.2.4', '1', 'ios');
INSERT INTO `application` VALUES ('3', '1.0.8', '1', 'android');
INSERT INTO `application` VALUES ('4', '1', '1', 'gameType');

-- ----------------------------
-- Table structure for badge_details
-- ----------------------------
DROP TABLE IF EXISTS `badge_details`;
CREATE TABLE `badge_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(255) NOT NULL DEFAULT '',
  `badge` int(11) NOT NULL DEFAULT '0' COMMENT '徽章增加或减少的数量',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `badge_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of badge_details
-- ----------------------------
INSERT INTO `badge_details` VALUES ('1', '10000000007', '2017-06-16 10:23:36', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('2', '10000000007', '2017-06-16 10:27:08', '喊话消耗徽章', '1');
INSERT INTO `badge_details` VALUES ('3', '10000000005', '2017-06-16 17:00:00', 'vip会员每场活动获取一个徽章', '1');
INSERT INTO `badge_details` VALUES ('4', '10000000005', '2017-06-16 17:20:00', 'vip会员每场活动获取一个徽章', '1');
INSERT INTO `badge_details` VALUES ('5', '10000000008', '2017-06-16 17:28:23', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('6', '10000000001', '2017-06-16 19:10:01', 'vip会员每场活动获取一个徽章', '1');
INSERT INTO `badge_details` VALUES ('7', '10000000005', '2017-06-16 19:10:01', 'vip会员每场活动获取一个徽章', '1');
INSERT INTO `badge_details` VALUES ('8', '10000000009', '2017-06-18 22:13:06', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('9', '10000000003', '2017-06-19 10:34:39', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('10', '10000000006', '2017-06-19 18:48:13', '喊话消耗徽章', '1');
INSERT INTO `badge_details` VALUES ('11', '10000000010', '2017-06-19 20:43:08', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('12', '10000000011', '2017-06-20 15:36:21', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('13', '10000000011', '2017-06-20 15:36:26', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('14', '10000000000', '2017-06-20 16:07:04', '喊话消耗徽章', '1');
INSERT INTO `badge_details` VALUES ('15', '10000000006', '2017-06-20 16:30:36', '喊话消耗徽章', '1');
INSERT INTO `badge_details` VALUES ('16', '10000000006', '2017-06-20 16:30:48', '喊话消耗徽章', '1');
INSERT INTO `badge_details` VALUES ('17', '10000000006', '2017-06-20 16:31:00', '喊话消耗徽章', '1');
INSERT INTO `badge_details` VALUES ('18', '10000000006', '2017-06-20 17:10:00', 'vip会员每场活动获取一个徽章', '1');
INSERT INTO `badge_details` VALUES ('19', '10000000006', '2017-06-20 17:21:36', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('20', '10000000000', '2017-06-20 18:30:00', 'vip会员每场活动获取一个徽章', '1');
INSERT INTO `badge_details` VALUES ('21', '10000000000', '2017-06-20 18:50:00', 'vip会员每场活动获取一个徽章', '1');
INSERT INTO `badge_details` VALUES ('22', '10000000002', '2017-06-20 18:50:00', 'vip会员每场活动获取一个徽章', '1');
INSERT INTO `badge_details` VALUES ('23', '10000000006', '2017-06-20 18:50:01', 'vip会员每场活动获取一个徽章', '1');
INSERT INTO `badge_details` VALUES ('24', '10000000010', '2017-06-20 18:50:01', 'vip会员每场活动获取一个徽章', '1');
INSERT INTO `badge_details` VALUES ('25', '10000000000', '2017-06-20 21:46:02', '喊话消耗徽章', '1');
INSERT INTO `badge_details` VALUES ('26', '10000000000', '2017-06-20 21:53:50', '喊话消耗徽章', '1');
INSERT INTO `badge_details` VALUES ('27', '10000000000', '2017-06-20 21:54:17', '喊话消耗徽章', '1');
INSERT INTO `badge_details` VALUES ('28', '10000000012', '2017-06-21 06:18:23', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('29', '10000000013', '2017-06-22 09:52:32', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('34', '10000000006', '2017-06-22 12:10:17', 'vip会员每场活动获取一个叶子', '1');
INSERT INTO `badge_details` VALUES ('35', '10000000002', '2017-06-22 13:50:08', '喊话消耗叶子', '1');
INSERT INTO `badge_details` VALUES ('36', '10000000000', '2017-06-22 16:04:16', '喊话消耗叶子', '1');
INSERT INTO `badge_details` VALUES ('37', '10000000000', '2017-06-22 16:04:48', '喊话消耗叶子', '1');
INSERT INTO `badge_details` VALUES ('38', '10000000000', '2017-06-22 22:30:00', 'vip会员每场活动获取一个叶子', '1');
INSERT INTO `badge_details` VALUES ('39', '10000000006', '2017-06-22 22:30:00', 'vip会员每场活动获取一个叶子', '1');
INSERT INTO `badge_details` VALUES ('40', '10000000000', '2017-06-23 09:50:00', 'vip会员每场活动获取一个叶子', '1');
INSERT INTO `badge_details` VALUES ('41', '10000000001', '2017-06-23 09:50:00', 'vip会员每场活动获取一个叶子', '1');
INSERT INTO `badge_details` VALUES ('42', '10000000003', '2017-06-23 09:50:01', 'vip会员每场活动获取一个叶子', '1');
INSERT INTO `badge_details` VALUES ('43', '10000000014', '2017-06-23 10:25:25', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('44', '10000000015', '2017-06-23 14:43:18', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('45', '10000000002', '2017-06-23 15:48:58', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('46', '10000000006', '2017-06-23 19:11:03', '创建时圈子消耗', '1');
INSERT INTO `badge_details` VALUES ('47', '10000000000', '2017-06-23 22:14:29', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('48', '10000000000', '2017-06-23 22:17:25', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('49', '10000000006', '2017-06-24 09:54:57', '喊话消耗叶子', '1');
INSERT INTO `badge_details` VALUES ('50', '10000000000', '2017-06-24 22:32:08', '喊话消耗叶子', '1');
INSERT INTO `badge_details` VALUES ('51', '10000000003', '2017-06-25 14:40:15', '喊话消耗叶子', '1');
INSERT INTO `badge_details` VALUES ('52', '10000000003', '2017-06-26 09:06:24', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('53', '10000000016', '2017-06-26 09:12:18', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('54', '10000000016', '2017-06-26 09:49:50', '喊话消耗叶子', '1');
INSERT INTO `badge_details` VALUES ('55', '10000000017', '2017-06-26 09:52:08', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('56', '10000000018', '2017-06-26 09:54:54', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('57', '10000000016', '2017-06-26 10:01:09', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('58', '10000000016', '2017-06-26 10:01:39', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('59', '10000000004', '2017-06-26 11:12:19', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('60', '10000000006', '2017-06-26 16:49:18', '喊话消耗叶子', '1');
INSERT INTO `badge_details` VALUES ('61', '10000000019', '2017-06-26 16:51:21', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('62', '10000000020', '2017-06-26 17:07:32', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('63', '10000000004', '2017-06-27 11:40:42', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('64', '10000000004', '2017-06-27 11:41:29', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('65', '10000000004', '2017-06-27 11:53:50', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('66', '10000000001', '2017-06-27 11:58:55', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('67', '10000000001', '2017-06-27 11:59:33', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('68', '10000000001', '2017-06-27 12:00:04', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('69', '10000000004', '2017-06-27 12:01:49', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('70', '10000000001', '2017-06-27 12:07:31', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('71', '10000000001', '2017-06-27 12:07:39', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('72', '10000000001', '2017-06-27 12:08:20', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('73', '10000000001', '2017-06-27 12:08:37', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('74', '10000000001', '2017-06-27 13:46:38', '使用1个叶子添加经验值10分', '1');
INSERT INTO `badge_details` VALUES ('75', '10000000001', '2017-06-27 13:46:45', '使用1个叶子添加经验值10分', '1');
INSERT INTO `badge_details` VALUES ('76', '10000000001', '2017-06-27 13:46:49', '使用1个叶子添加经验值10分', '1');
INSERT INTO `badge_details` VALUES ('77', '10000000001', '2017-06-27 13:46:54', '使用1个叶子添加经验值10分', '1');
INSERT INTO `badge_details` VALUES ('78', '10000000001', '2017-06-27 13:47:00', '使用1个叶子添加经验值10分', '1');
INSERT INTO `badge_details` VALUES ('79', '10000000006', '2017-06-27 14:00:01', 'vip会员每场活动获取一个叶子', '1');
INSERT INTO `badge_details` VALUES ('80', '10000000019', '2017-06-27 14:00:01', 'vip会员每场活动获取一个叶子', '1');
INSERT INTO `badge_details` VALUES ('81', '10000000001', '2017-06-27 14:03:33', '使用1个叶子添加经验值10分', '1');
INSERT INTO `badge_details` VALUES ('82', '10000000001', '2017-06-27 14:03:36', '使用1个叶子添加经验值10分', '1');
INSERT INTO `badge_details` VALUES ('83', '10000000001', '2017-06-27 14:14:33', '使用1个叶子添加经验值10分', '1');
INSERT INTO `badge_details` VALUES ('84', '10000000001', '2017-06-27 14:14:36', '使用1个叶子添加经验值10分', '1');
INSERT INTO `badge_details` VALUES ('85', '10000000001', '2017-06-27 14:40:20', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('86', '10000000001', '2017-06-27 14:40:57', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('87', '10000000001', '2017-06-27 14:49:42', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('88', '10000000001', '2017-06-27 14:50:27', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('89', '10000000001', '2017-06-27 15:02:11', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('90', '10000000001', '2017-06-27 15:02:20', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('91', '10000000005', '2017-06-27 15:44:07', '喊话消耗叶子', '1');
INSERT INTO `badge_details` VALUES ('92', '10000000002', '2017-06-27 16:53:08', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('93', '10000000001', '2017-06-27 16:54:45', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('94', '10000000006', '2017-06-27 17:25:06', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('95', '10000000002', '2017-06-27 18:19:09', '喊话消耗叶子', '1');
INSERT INTO `badge_details` VALUES ('96', '10000000000', '2017-06-27 21:26:23', '喊话消耗叶子', '1');
INSERT INTO `badge_details` VALUES ('97', '10000000021', '2017-06-27 21:26:29', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('98', '10000000004', '2017-06-28 09:46:59', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('99', '10000000004', '2017-06-28 09:47:04', '加入圈子时消耗', '1');
INSERT INTO `badge_details` VALUES ('100', '10000000001', '2017-06-28 10:55:31', '创建时圈子消耗', '1');
INSERT INTO `badge_details` VALUES ('101', '10000000022', '2017-06-28 11:04:49', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('102', '10000000001', '2017-06-28 11:38:33', '创建时圈子消耗', '1');
INSERT INTO `badge_details` VALUES ('103', '10000000023', '2017-06-28 13:44:53', '注册赠送', '10');
INSERT INTO `badge_details` VALUES ('104', '10000000023', '2017-06-28 13:49:41', '喊话消耗叶子', '1');

-- ----------------------------
-- Table structure for circle
-- ----------------------------
DROP TABLE IF EXISTS `circle`;
CREATE TABLE `circle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `member_count` int(11) DEFAULT '0',
  `city` varchar(255) DEFAULT '',
  `place` varchar(255) DEFAULT '',
  `hot` int(11) DEFAULT '0' COMMENT '热门度，用于推荐，增加一个活动+1',
  `manager` bigint(20) DEFAULT NULL,
  `notice` varchar(256) DEFAULT '' COMMENT '公告',
  `latitude` double NOT NULL DEFAULT '0' COMMENT '纬度',
  `bg_signature` varchar(255) DEFAULT '',
  `avatar_signature` varchar(255) DEFAULT '',
  `longitude` double DEFAULT '0' COMMENT '经度',
  PRIMARY KEY (`id`),
  KEY `creator` (`manager`),
  CONSTRAINT `circle_ibfk_1` FOREIGN KEY (`manager`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000000004 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of circle
-- ----------------------------
INSERT INTO `circle` VALUES ('100000000000', '张国文的圈子一', '7', '杭州市', '西城博司展示中心', '0', '10000000000', '', '30.317123', '1498457552690', '1498457832312', '120.075936');
INSERT INTO `circle` VALUES ('100000000001', '人民大会堂', '7', '杭州', '兰州拉面', '0', '10000000000', '', '30.317687', '1498457740140', '1498224371313', '120.075948');
INSERT INTO `circle` VALUES ('100000000002', '我冲了100', '1', '杭州市', '鼎实装饰', '0', '10000000001', '', '30.317182', '1498618841288', '1498619468140', '120.075405');
INSERT INTO `circle` VALUES ('100000000003', '西湖龙井说唱', '1', '杭州市', '丽摄影(基地)', '0', '10000000001', '', '30.317398', '1498621244188', '', '120.07593');

-- ----------------------------
-- Table structure for complaint
-- ----------------------------
DROP TABLE IF EXISTS `complaint`;
CREATE TABLE `complaint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_id` bigint(20) NOT NULL COMMENT '投诉者',
  `person_id` bigint(20) NOT NULL COMMENT '被投诉者',
  `room_id` bigint(20) DEFAULT NULL,
  `content` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '投诉时间',
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  KEY `persion_id` (`person_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `user` (`id`),
  CONSTRAINT `complaint_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of complaint
-- ----------------------------
INSERT INTO `complaint` VALUES ('1', '10000000000', '10000000000', '1000000000020', '呵呵，我就像投诉自己', '2017-06-20 15:52:19');

-- ----------------------------
-- Table structure for declaration
-- ----------------------------
DROP TABLE IF EXISTS `declaration`;
CREATE TABLE `declaration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `declarer_id` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of declaration
-- ----------------------------
INSERT INTO `declaration` VALUES ('10', '10000000001', '张国文喊话一', '杭州市', '2017-05-15 09:14:40');
INSERT INTO `declaration` VALUES ('11', '10000000007', '大家好，我是来自杭州的美女😊', '杭州市', '2017-06-16 10:27:08');
INSERT INTO `declaration` VALUES ('12', '10000000006', '真是日了狗了', '杭州市', '2017-06-19 18:48:13');
INSERT INTO `declaration` VALUES ('13', '10000000000', '这里是杭州，这里有西湖😑😑😑', '杭州市', '2017-06-20 16:07:04');
INSERT INTO `declaration` VALUES ('15', '10000000006', '小兔子白又白', '杭州市', '2017-06-20 16:30:48');
INSERT INTO `declaration` VALUES ('16', '10000000006', '小兔子白又白两只耳朵竖起来', '杭州市', '2017-06-20 16:31:00');
INSERT INTO `declaration` VALUES ('17', '10000000000', '我是土豪，叶子无限用', '杭州市', '2017-06-20 21:46:02');
INSERT INTO `declaration` VALUES ('18', '10000000000', '帝都人民你们好！！', '北京市', '2017-06-20 21:53:50');
INSERT INTO `declaration` VALUES ('19', '10000000000', '魔都人民你们好！🤗🤗', '上海市', '2017-06-20 21:54:17');
INSERT INTO `declaration` VALUES ('20', '10000000002', '要亲亲要抱抱要举高高', '杭州市', '2017-06-22 13:50:08');
INSERT INTO `declaration` VALUES ('21', '10000000000', '有钱人365天的VIP', '杭州市', '2017-06-22 16:04:16');
INSERT INTO `declaration` VALUES ('22', '10000000000', '我觉得作为一个年费VIP，我的喊话也要跟别人不一样', '杭州市', '2017-06-22 16:05:31');
INSERT INTO `declaration` VALUES ('23', '10000000006', '雨下整夜', '杭州市', '2017-06-24 09:54:57');
INSERT INTO `declaration` VALUES ('24', '10000000000', '周末要好好学习才能考上心仪的大学', '杭州市', '2017-06-24 22:32:08');
INSERT INTO `declaration` VALUES ('25', '10000000003', '我是老中医 专治吹牛逼', '杭州市', '2017-06-25 14:40:15');
INSERT INTO `declaration` VALUES ('26', '10000000016', '一起玩吧', '杭州市', '2017-06-26 09:49:50');
INSERT INTO `declaration` VALUES ('27', '10000000006', 'VIP你们够了', '杭州市', '2017-06-26 16:49:18');
INSERT INTO `declaration` VALUES ('28', '10000000005', '阿嘞嘞', '杭州市', '2017-06-27 15:44:07');
INSERT INTO `declaration` VALUES ('29', '10000000002', '你有freestyle吗', '杭州市', '2017-06-27 18:19:09');
INSERT INTO `declaration` VALUES ('30', '10000000000', '我的皮皮虾去哪儿了？', '杭州市', '2017-06-27 21:26:23');
INSERT INTO `declaration` VALUES ('31', '10000000023', '你大爷的', '杭州市', '2017-06-28 13:49:41');

-- ----------------------------
-- Table structure for declaration_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `declaration_evaluation`;
CREATE TABLE `declaration_evaluation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `declaration_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `receiver_id` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of declaration_evaluation
-- ----------------------------
INSERT INTO `declaration_evaluation` VALUES ('11', '10', '10000000002', null, '他风风光光', '2017-05-23 12:07:35');
INSERT INTO `declaration_evaluation` VALUES ('12', '11', '10000000001', null, 'Oh a beautiful women', '2017-06-19 09:05:56');
INSERT INTO `declaration_evaluation` VALUES ('13', '12', '10000000000', null, '请文明发言！谢谢合作', '2017-06-20 15:50:56');
INSERT INTO `declaration_evaluation` VALUES ('14', '22', '10000000006', null, '啊', '2017-06-23 19:07:33');
INSERT INTO `declaration_evaluation` VALUES ('15', '25', '10000000016', null, '厉害啊', '2017-06-26 09:25:27');
INSERT INTO `declaration_evaluation` VALUES ('16', '28', '10000000000', null, '明天几点上课？', '2017-06-27 21:26:34');
INSERT INTO `declaration_evaluation` VALUES ('17', '25', '10000000000', '10000000016', '回复你的第二行会在什么地方开始😅😜😞😏😔😏😋😔😏😖😒😋😏👏👏👏😷👍👌✊👏👏', '2017-06-27 21:27:11');
INSERT INTO `declaration_evaluation` VALUES ('18', '25', '10000000000', '10000000000', '回复有bug', '2017-06-27 21:27:52');
INSERT INTO `declaration_evaluation` VALUES ('19', '12', '10000000000', '10000000000', 'bug就是刷新到别的item上去了', '2017-06-27 21:28:25');
INSERT INTO `declaration_evaluation` VALUES ('20', '30', '10000000000', null, '在上海', '2017-06-27 21:28:41');
INSERT INTO `declaration_evaluation` VALUES ('21', '28', '10000000000', null, '明天下午的课要逃吗？', '2017-06-27 21:29:05');
INSERT INTO `declaration_evaluation` VALUES ('22', '25', '10000000003', '10000000000', '哈狗🐶啊啊水电费啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '2017-06-28 13:36:25');

-- ----------------------------
-- Table structure for friend_connection
-- ----------------------------
DROP TABLE IF EXISTS `friend_connection`;
CREATE TABLE `friend_connection` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `owner` bigint(11) DEFAULT NULL,
  `friend` bigint(11) DEFAULT NULL,
  `point` double(11,1) DEFAULT '0.0' COMMENT '好友好感度最终分数',
  `evaluate_point` int(11) DEFAULT '0',
  `evaluated_point` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner` (`owner`,`friend`) USING BTREE,
  KEY `friend` (`friend`) USING BTREE,
  CONSTRAINT `friend_connection_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `user` (`id`),
  CONSTRAINT `friend_connection_ibfk_2` FOREIGN KEY (`friend`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of friend_connection
-- ----------------------------
INSERT INTO `friend_connection` VALUES ('57', '10000000000', '10000000001', '5.2', '7', '5');
INSERT INTO `friend_connection` VALUES ('58', '10000000001', '10000000000', '5.2', '5', '7');
INSERT INTO `friend_connection` VALUES ('59', '10000000005', '10000000006', '6.8', '5', '10');
INSERT INTO `friend_connection` VALUES ('60', '10000000006', '10000000005', '6.8', '10', '5');
INSERT INTO `friend_connection` VALUES ('61', '10000000006', '10000000001', '3.8', '1', '5');
INSERT INTO `friend_connection` VALUES ('62', '10000000001', '10000000006', '0.0', '5', '1');
INSERT INTO `friend_connection` VALUES ('63', '10000000001', '10000000005', '5.4', '5', '5');
INSERT INTO `friend_connection` VALUES ('64', '10000000005', '10000000001', '5.4', '5', '5');
INSERT INTO `friend_connection` VALUES ('65', '10000000000', '10000000006', '8.2', '5', '10');
INSERT INTO `friend_connection` VALUES ('66', '10000000006', '10000000000', '8.2', '10', '5');
INSERT INTO `friend_connection` VALUES ('67', '10000000003', '10000000004', '6.2', '5', '10');
INSERT INTO `friend_connection` VALUES ('68', '10000000004', '10000000003', '6.2', '10', '5');
INSERT INTO `friend_connection` VALUES ('69', '10000000000', '10000000002', '5.8', '9', '5');
INSERT INTO `friend_connection` VALUES ('70', '10000000002', '10000000000', '5.8', '5', '9');
INSERT INTO `friend_connection` VALUES ('71', '10000000000', '10000000003', '5.8', '8', '5');
INSERT INTO `friend_connection` VALUES ('72', '10000000003', '10000000000', '5.8', '5', '8');
INSERT INTO `friend_connection` VALUES ('73', '10000000000', '10000000004', '7.0', '7', '10');
INSERT INTO `friend_connection` VALUES ('74', '10000000004', '10000000000', '7.0', '10', '7');
INSERT INTO `friend_connection` VALUES ('75', '10000000000', '10000000010', '6.2', '10', '5');
INSERT INTO `friend_connection` VALUES ('76', '10000000010', '10000000000', '6.2', '5', '10');
INSERT INTO `friend_connection` VALUES ('77', '10000000001', '10000000002', '6.6', '5', '5');
INSERT INTO `friend_connection` VALUES ('78', '10000000002', '10000000001', '6.6', '5', '5');
INSERT INTO `friend_connection` VALUES ('79', '10000000001', '10000000003', '7.4', '5', '5');
INSERT INTO `friend_connection` VALUES ('80', '10000000003', '10000000001', '7.4', '5', '5');
INSERT INTO `friend_connection` VALUES ('81', '10000000001', '10000000004', '6.2', '5', '10');
INSERT INTO `friend_connection` VALUES ('82', '10000000004', '10000000001', '6.2', '10', '5');
INSERT INTO `friend_connection` VALUES ('83', '10000000001', '10000000010', '5.4', '5', '5');
INSERT INTO `friend_connection` VALUES ('84', '10000000010', '10000000001', '5.4', '5', '5');
INSERT INTO `friend_connection` VALUES ('85', '10000000002', '10000000003', '5.8', '5', '5');
INSERT INTO `friend_connection` VALUES ('86', '10000000003', '10000000002', '5.8', '5', '5');
INSERT INTO `friend_connection` VALUES ('87', '10000000002', '10000000004', '6.2', '5', '10');
INSERT INTO `friend_connection` VALUES ('88', '10000000004', '10000000002', '6.2', '10', '5');
INSERT INTO `friend_connection` VALUES ('89', '10000000002', '10000000006', '5.4', '5', '10');
INSERT INTO `friend_connection` VALUES ('90', '10000000006', '10000000002', '5.4', '10', '5');
INSERT INTO `friend_connection` VALUES ('91', '10000000002', '10000000010', '5.4', '5', '5');
INSERT INTO `friend_connection` VALUES ('92', '10000000010', '10000000002', '5.4', '5', '5');
INSERT INTO `friend_connection` VALUES ('93', '10000000003', '10000000006', '5.4', '5', '10');
INSERT INTO `friend_connection` VALUES ('94', '10000000006', '10000000003', '5.4', '10', '5');
INSERT INTO `friend_connection` VALUES ('95', '10000000003', '10000000010', '5.4', '5', '5');
INSERT INTO `friend_connection` VALUES ('96', '10000000010', '10000000003', '5.4', '5', '5');
INSERT INTO `friend_connection` VALUES ('97', '10000000004', '10000000006', '10.0', '10', '10');
INSERT INTO `friend_connection` VALUES ('98', '10000000006', '10000000004', '10.0', '10', '10');
INSERT INTO `friend_connection` VALUES ('99', '10000000004', '10000000010', '5.4', '10', '5');
INSERT INTO `friend_connection` VALUES ('100', '10000000010', '10000000004', '5.4', '5', '10');
INSERT INTO `friend_connection` VALUES ('101', '10000000006', '10000000010', '5.8', '10', '5');
INSERT INTO `friend_connection` VALUES ('102', '10000000010', '10000000006', '5.8', '5', '10');
INSERT INTO `friend_connection` VALUES ('103', '10000000000', '10000000005', '8.8', '10', '8');
INSERT INTO `friend_connection` VALUES ('104', '10000000005', '10000000000', '8.8', '8', '10');
INSERT INTO `friend_connection` VALUES ('105', '10000000002', '10000000005', '0.0', '5', '2');
INSERT INTO `friend_connection` VALUES ('106', '10000000005', '10000000002', '2.0', '2', '5');
INSERT INTO `friend_connection` VALUES ('107', '10000000003', '10000000005', '5.0', '5', '6');
INSERT INTO `friend_connection` VALUES ('108', '10000000005', '10000000003', '5.0', '6', '5');
INSERT INTO `friend_connection` VALUES ('109', '10000000004', '10000000005', '0.0', '10', '4');
INSERT INTO `friend_connection` VALUES ('110', '10000000005', '10000000004', '4.0', '4', '10');
INSERT INTO `friend_connection` VALUES ('111', '10000000005', '10000000010', '5.0', '10', '5');
INSERT INTO `friend_connection` VALUES ('112', '10000000010', '10000000005', '5.0', '5', '10');
INSERT INTO `friend_connection` VALUES ('113', '10000000006', '10000000019', '5.0', '10', '5');
INSERT INTO `friend_connection` VALUES ('114', '10000000019', '10000000006', '5.0', '5', '10');

-- ----------------------------
-- Table structure for friend_invitation
-- ----------------------------
DROP TABLE IF EXISTS `friend_invitation`;
CREATE TABLE `friend_invitation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` bigint(20) NOT NULL,
  `friend` bigint(20) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '0为未读，1为已读且跳过，2为同意添加好友，3为不同意添加好友',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `origin` varchar(32) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner` (`owner`,`friend`),
  KEY `friend` (`friend`),
  CONSTRAINT `friend_invitation_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `user` (`id`),
  CONSTRAINT `friend_invitation_ibfk_2` FOREIGN KEY (`friend`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of friend_invitation
-- ----------------------------
INSERT INTO `friend_invitation` VALUES ('1', '10000000006', '10000000005', '0', '2017-06-16 12:13:20', '');
INSERT INTO `friend_invitation` VALUES ('2', '10000000006', '10000000000', '2', '2017-06-16 17:22:02', '');
INSERT INTO `friend_invitation` VALUES ('3', '10000000006', '10000000001', '2', '2017-06-16 17:23:19', '');
INSERT INTO `friend_invitation` VALUES ('4', '10000000003', '10000000004', '2', '2017-06-20 16:48:25', 'PHONE');
INSERT INTO `friend_invitation` VALUES ('5', '10000000006', '10000000010', '0', '2017-06-20 16:46:46', '');
INSERT INTO `friend_invitation` VALUES ('6', '10000000001', '10000000003', '2', '2017-06-20 17:19:43', '');
INSERT INTO `friend_invitation` VALUES ('7', '10000000006', '10000000013', '0', '2017-06-23 17:27:51', '手机通讯录');
INSERT INTO `friend_invitation` VALUES ('8', '10000000000', '10000000007', '0', '2017-06-22 14:05:03', 'PHONE');

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示在排行榜',
  `is_scoring` tinyint(1) DEFAULT '0' COMMENT '是否需要计分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES ('0', '所有游戏', '-1', '0', '0');
INSERT INTO `game` VALUES ('1', '桌游棋牌', '0', '0', '0');
INSERT INTO `game` VALUES ('2', '体育运动', '0', '0', '0');
INSERT INTO `game` VALUES ('3', '聚会交友', '0', '0', '0');
INSERT INTO `game` VALUES ('4', '结伴出游', '0', '0', '0');
INSERT INTO `game` VALUES ('5', '其它活动', '0', '0', '0');
INSERT INTO `game` VALUES ('6', '狼人杀', '1', '1', '1');
INSERT INTO `game` VALUES ('7', '三国杀', '1', '1', '1');
INSERT INTO `game` VALUES ('8', '扑克', '1', '1', '1');
INSERT INTO `game` VALUES ('9', '麻将', '1', '1', '1');
INSERT INTO `game` VALUES ('10', '象棋', '1', '1', '1');
INSERT INTO `game` VALUES ('11', '围棋', '1', '1', '1');
INSERT INTO `game` VALUES ('12', '篮球', '2', '1', '1');
INSERT INTO `game` VALUES ('13', '足球', '2', '1', '1');
INSERT INTO `game` VALUES ('14', '排球', '2', '1', '1');
INSERT INTO `game` VALUES ('15', '网球', '2', '1', '1');
INSERT INTO `game` VALUES ('16', '乒乓球', '2', '1', '1');
INSERT INTO `game` VALUES ('17', '羽毛球', '2', '1', '1');
INSERT INTO `game` VALUES ('18', '密室', '3', '0', '0');
INSERT INTO `game` VALUES ('19', 'KTV', '3', '0', '0');
INSERT INTO `game` VALUES ('20', '酒吧', '3', '0', '0');
INSERT INTO `game` VALUES ('21', '派对', '3', '0', '0');
INSERT INTO `game` VALUES ('22', '电影', '3', '0', '0');
INSERT INTO `game` VALUES ('23', '美食', '3', '0', '0');
INSERT INTO `game` VALUES ('24', '逛街', '3', '0', '0');
INSERT INTO `game` VALUES ('25', '爬山', '4', '0', '0');
INSERT INTO `game` VALUES ('26', '骑车', '4', '0', '0');
INSERT INTO `game` VALUES ('27', '郊游', '4', '0', '0');
INSERT INTO `game` VALUES ('28', '短途旅行', '4', '0', '0');
INSERT INTO `game` VALUES ('29', '长途旅行', '4', '0', '0');

-- ----------------------------
-- Table structure for game_score
-- ----------------------------
DROP TABLE IF EXISTS `game_score`;
CREATE TABLE `game_score` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT '1000' COMMENT '活动的分数',
  `count` int(11) DEFAULT '1' COMMENT '活动次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`game_id`),
  KEY `game` (`game_id`),
  CONSTRAINT `game_score_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `game_score_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of game_score
-- ----------------------------
INSERT INTO `game_score` VALUES ('45', '10000000000', '6', '1030', '4');
INSERT INTO `game_score` VALUES ('46', '10000000001', '6', '1020', '4');
INSERT INTO `game_score` VALUES ('47', '10000000005', '6', '1015', '3');
INSERT INTO `game_score` VALUES ('48', '10000000006', '6', '1000', '4');
INSERT INTO `game_score` VALUES ('49', '10000000005', '16', '1000', '1');
INSERT INTO `game_score` VALUES ('50', '10000000006', '16', '1000', '1');
INSERT INTO `game_score` VALUES ('51', '10000000005', '10', '1000', '1');
INSERT INTO `game_score` VALUES ('52', '10000000006', '10', '1000', '2');
INSERT INTO `game_score` VALUES ('53', '10000000000', '13', '1015', '1');
INSERT INTO `game_score` VALUES ('54', '10000000001', '13', '1000', '1');
INSERT INTO `game_score` VALUES ('55', '10000000002', '13', '1000', '1');
INSERT INTO `game_score` VALUES ('56', '10000000003', '13', '1005', '1');
INSERT INTO `game_score` VALUES ('57', '10000000004', '13', '1025', '1');
INSERT INTO `game_score` VALUES ('58', '10000000006', '13', '1000', '1');
INSERT INTO `game_score` VALUES ('59', '10000000010', '13', '1035', '1');
INSERT INTO `game_score` VALUES ('60', '10000000000', '10', '1010', '3');
INSERT INTO `game_score` VALUES ('61', '10000000004', '10', '1025', '2');
INSERT INTO `game_score` VALUES ('62', '10000000002', '6', '1000', '1');
INSERT INTO `game_score` VALUES ('63', '10000000003', '6', '1000', '1');
INSERT INTO `game_score` VALUES ('64', '10000000004', '6', '1000', '1');
INSERT INTO `game_score` VALUES ('65', '10000000010', '6', '1040', '1');
INSERT INTO `game_score` VALUES ('66', '10000000000', '8', '1000', '1');
INSERT INTO `game_score` VALUES ('67', '10000000001', '9', '1005', '1');
INSERT INTO `game_score` VALUES ('68', '10000000002', '9', '1015', '1');
INSERT INTO `game_score` VALUES ('69', '10000000004', '9', '1000', '1');
INSERT INTO `game_score` VALUES ('70', '10000000010', '10', '1015', '1');
INSERT INTO `game_score` VALUES ('71', '10000000001', '10', '1000', '1');
INSERT INTO `game_score` VALUES ('72', '10000000002', '10', '1000', '1');
INSERT INTO `game_score` VALUES ('73', '10000000003', '10', '1015', '1');
INSERT INTO `game_score` VALUES ('74', '10000000006', '21', '1000', '1');
INSERT INTO `game_score` VALUES ('75', '10000000019', '21', '1000', '1');

-- ----------------------------
-- Table structure for game_score_history
-- ----------------------------
DROP TABLE IF EXISTS `game_score_history`;
CREATE TABLE `game_score_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` int(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `score` bigint(20) NOT NULL DEFAULT '0',
  `ranking` int(11) NOT NULL DEFAULT '1',
  `create_date` date NOT NULL,
  `count` int(11) DEFAULT '0' COMMENT '活动次数',
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`),
  KEY `game` (`game_id`),
  CONSTRAINT `game_score_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `game_score_history_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of game_score_history
-- ----------------------------
INSERT INTO `game_score_history` VALUES ('1', '6', '10000000010', '1040', '1', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('2', '6', '10000000000', '1030', '2', '2017-06-19', '4');
INSERT INTO `game_score_history` VALUES ('3', '6', '10000000001', '1020', '3', '2017-06-19', '4');
INSERT INTO `game_score_history` VALUES ('4', '6', '10000000005', '1015', '4', '2017-06-19', '3');
INSERT INTO `game_score_history` VALUES ('5', '6', '10000000006', '1000', '5', '2017-06-19', '4');
INSERT INTO `game_score_history` VALUES ('6', '6', '10000000002', '1000', '6', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('7', '6', '10000000003', '1000', '7', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('8', '6', '10000000004', '1000', '8', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('9', '8', '10000000000', '1000', '1', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('10', '9', '10000000002', '1015', '1', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('11', '9', '10000000001', '1005', '2', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('12', '9', '10000000004', '1000', '3', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('13', '10', '10000000004', '1025', '1', '2017-06-19', '2');
INSERT INTO `game_score_history` VALUES ('14', '10', '10000000010', '1015', '2', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('15', '10', '10000000003', '1015', '3', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('16', '10', '10000000000', '1010', '4', '2017-06-19', '3');
INSERT INTO `game_score_history` VALUES ('17', '10', '10000000005', '1000', '5', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('18', '10', '10000000006', '1000', '6', '2017-06-19', '2');
INSERT INTO `game_score_history` VALUES ('19', '10', '10000000001', '1000', '7', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('20', '10', '10000000002', '1000', '8', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('21', '13', '10000000010', '1035', '1', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('22', '13', '10000000004', '1025', '2', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('23', '13', '10000000000', '1015', '3', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('24', '13', '10000000003', '1005', '4', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('25', '13', '10000000001', '1000', '5', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('26', '13', '10000000002', '1000', '6', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('27', '13', '10000000006', '1000', '7', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('28', '16', '10000000005', '1000', '1', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('29', '16', '10000000006', '1000', '2', '2017-06-19', '1');
INSERT INTO `game_score_history` VALUES ('30', '6', '10000000010', '1040', '1', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('31', '6', '10000000000', '1030', '2', '2017-06-26', '4');
INSERT INTO `game_score_history` VALUES ('32', '6', '10000000001', '1020', '3', '2017-06-26', '4');
INSERT INTO `game_score_history` VALUES ('33', '6', '10000000005', '1015', '4', '2017-06-26', '3');
INSERT INTO `game_score_history` VALUES ('34', '6', '10000000006', '1000', '5', '2017-06-26', '4');
INSERT INTO `game_score_history` VALUES ('35', '6', '10000000002', '1000', '6', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('36', '6', '10000000003', '1000', '7', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('37', '6', '10000000004', '1000', '8', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('38', '8', '10000000000', '1000', '1', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('39', '9', '10000000002', '1015', '1', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('40', '9', '10000000001', '1005', '2', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('41', '9', '10000000004', '1000', '3', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('42', '10', '10000000004', '1025', '1', '2017-06-26', '2');
INSERT INTO `game_score_history` VALUES ('43', '10', '10000000010', '1015', '2', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('44', '10', '10000000003', '1015', '3', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('45', '10', '10000000000', '1010', '4', '2017-06-26', '3');
INSERT INTO `game_score_history` VALUES ('46', '10', '10000000005', '1000', '5', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('47', '10', '10000000006', '1000', '6', '2017-06-26', '2');
INSERT INTO `game_score_history` VALUES ('48', '10', '10000000001', '1000', '7', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('49', '10', '10000000002', '1000', '8', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('50', '13', '10000000010', '1035', '1', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('51', '13', '10000000004', '1025', '2', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('52', '13', '10000000000', '1015', '3', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('53', '13', '10000000003', '1005', '4', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('54', '13', '10000000001', '1000', '5', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('55', '13', '10000000002', '1000', '6', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('56', '13', '10000000006', '1000', '7', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('57', '16', '10000000005', '1000', '1', '2017-06-26', '1');
INSERT INTO `game_score_history` VALUES ('58', '16', '10000000006', '1000', '2', '2017-06-26', '1');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `image1_signature` varchar(255) NOT NULL DEFAULT '',
  `image2_signature` varchar(255) NOT NULL DEFAULT '',
  `image3_signature` varchar(255) NOT NULL DEFAULT '',
  `image4_signature` varchar(255) NOT NULL DEFAULT '',
  `image5_signature` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('4', '10000000001', '1498444086088', '1498619206893', '', '', '1498444460898');
INSERT INTO `image` VALUES ('5', '10000000007', '1497580075235', '1497580100727', '', '', '1497580134344');
INSERT INTO `image` VALUES ('6', '10000000000', '1497945820832', '1497945863292', '', '1497945941757', '1497945794061');
INSERT INTO `image` VALUES ('7', '10000000006', '1497946507983', '', '', '', '');
INSERT INTO `image` VALUES ('8', '10000000003', '1498566513802', '1498566880561', '1498566394264', '1498566505987', '');
INSERT INTO `image` VALUES ('9', '10000000016', '1498440553471', '1498440549333', '1498440537571', '1498440538750', '1498440544921');

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `longitude` double NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` double NOT NULL DEFAULT '0' COMMENT '纬度',
  `send_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `room_id` bigint(20) DEFAULT '0',
  `place` varchar(256) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1459 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('1', '10000000001', '120.081275', '30.316067', '2017-06-15 13:57:52', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('2', '10000000001', '120.081246', '30.3152', '2017-06-15 14:04:17', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('3', '10000000001', '120.076386', '30.317074', '2017-06-15 14:06:41', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('4', '10000000001', '120.076818', '30.316897', '2017-06-15 14:07:17', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('5', '10000000000', '120.076048', '30.316724', '2017-06-16 09:27:47', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('6', '10000000001', '120.076877', '30.316926', '2017-06-16 09:52:01', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('7', '10000000001', '120.076026', '30.317039', '2017-06-16 10:13:16', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('8', '10000000005', '120.074829', '30.31708', '2017-06-16 10:25:35', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('9', '10000000005', '120.074829', '30.31708', '2017-06-16 10:25:46', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('10', '10000000001', '120.076455', '30.316987', '2017-06-16 10:36:25', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('11', '10000000005', '120.074829', '30.31708', '2017-06-16 10:42:27', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('12', '10000000001', '120.076253', '30.317005', '2017-06-16 10:46:36', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('13', '10000000005', '120.074829', '30.31708', '2017-06-16 10:48:25', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('14', '10000000005', '120.074829', '30.31708', '2017-06-16 10:48:46', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('15', '10000000005', '120.074829', '30.31708', '2017-06-16 10:48:54', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('16', '10000000005', '120.074829', '30.31708', '2017-06-16 10:49:04', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('17', '10000000005', '120.074829', '30.31708', '2017-06-16 10:49:20', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('18', '10000000005', '120.074829', '30.31708', '2017-06-16 10:49:32', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('19', '10000000005', '120.074829', '30.31708', '2017-06-16 10:49:58', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('20', '10000000005', '120.074829', '30.31708', '2017-06-16 10:50:30', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('21', '10000000001', '120.075951', '30.317124', '2017-06-16 10:52:23', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('22', '10000000005', '120.074829', '30.31708', '2017-06-16 10:52:50', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('23', '10000000005', '120.074829', '30.31708', '2017-06-16 10:53:29', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('24', '10000000001', '120.076427', '30.317037', '2017-06-16 10:55:14', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('25', '10000000001', '120.076551', '30.316928', '2017-06-16 11:01:03', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('26', '10000000001', '120.076385', '30.317073', '2017-06-16 11:04:20', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('27', '10000000001', '120.076303', '30.317067', '2017-06-16 11:10:50', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('28', '10000000001', '120.076067', '30.317032', '2017-06-16 11:18:30', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('29', '10000000001', '120.076161', '30.317023', '2017-06-16 11:23:32', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('30', '10000000001', '120.076403', '30.316992', '2017-06-16 11:29:55', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('31', '10000000001', '120.076237', '30.317049', '2017-06-16 11:49:50', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('32', '10000000001', '120.076442', '30.316997', '2017-06-16 11:52:57', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('33', '10000000005', '120.074829', '30.31708', '2017-06-16 12:05:57', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('34', '10000000006', '120.076247', '30.317142', '2017-06-16 12:11:46', null, '中国浙江省杭州市西湖区紫萱路靠近西城博司');
INSERT INTO `location` VALUES ('35', '10000000005', '120.074829', '30.31708', '2017-06-16 12:12:53', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('36', '10000000001', '120.076399', '30.317017', '2017-06-16 12:17:28', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('37', '10000000001', '120.076744', '30.317407', '2017-06-16 12:20:32', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('38', '10000000006', '120.076536', '30.317151', '2017-06-16 16:31:02', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('39', '10000000005', '120.074829', '30.31708', '2017-06-16 16:32:53', '1000000000006', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('40', '10000000005', '120.074829', '30.31708', '2017-06-16 16:35:41', '1000000000006', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('41', '10000000005', '120.074829', '30.31708', '2017-06-16 16:35:43', '1000000000006', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('42', '10000000005', '120.074829', '30.31708', '2017-06-16 16:35:58', '1000000000006', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('43', '10000000006', '120.076715', '30.317291', '2017-06-16 16:36:01', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('44', '10000000005', '120.074829', '30.31708', '2017-06-16 16:38:26', '1000000000006', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('45', '10000000005', '120.074829', '30.31708', '2017-06-16 16:38:33', '1000000000006', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('46', '10000000005', '120.074829', '30.31708', '2017-06-16 16:38:42', '1000000000006', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('47', '10000000005', '120.074829', '30.31708', '2017-06-16 16:38:56', '1000000000006', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('48', '10000000005', '120.074829', '30.31708', '2017-06-16 16:39:11', '1000000000006', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('49', '10000000006', '120.076474', '30.317291', '2017-06-16 16:40:01', '1000000000006', '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('50', '10000000005', '120.074829', '30.31708', '2017-06-16 16:40:02', '1000000000006', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('51', '10000000005', '120.074829', '30.31708', '2017-06-16 16:40:31', '1000000000006', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('52', '10000000005', '120.074829', '30.31708', '2017-06-16 16:40:58', '1000000000006', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('53', '10000000005', '120.074829', '30.31708', '2017-06-16 16:42:47', '1000000000006', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('54', '10000000005', '120.074829', '30.31708', '2017-06-16 16:42:50', '1000000000006', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('55', '10000000005', '120.074829', '30.31708', '2017-06-16 16:42:52', '1000000000006', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('56', '10000000001', '120.077747', '30.316331', '2017-06-16 16:47:08', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('57', '10000000001', '120.081286', '30.316068', '2017-06-16 16:51:07', null, '中国浙江省杭州市西湖区西行路靠近杭州市西溪社区学院');
INSERT INTO `location` VALUES ('58', '10000000005', '120.074829', '30.31708', '2017-06-16 16:53:16', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('59', '10000000005', '120.074829', '30.31708', '2017-06-16 16:58:34', '1000000000008', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('60', '10000000005', '120.074829', '30.31708', '2017-06-16 17:01:31', '1000000000008', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('61', '10000000005', '120.074829', '30.31708', '2017-06-16 17:01:36', '1000000000008', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('62', '10000000001', '120.076058', '30.317094', '2017-06-16 17:02:05', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('63', '10000000006', '120.076687', '30.317205', '2017-06-16 17:02:19', '1000000000008', '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('64', '10000000001', '120.076634', '30.316969', '2017-06-16 17:07:37', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('65', '10000000001', '120.076252', '30.317051', '2017-06-16 17:09:28', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('66', '10000000005', '120.074829', '30.31708', '2017-06-16 17:09:59', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('67', '10000000005', '120.074829', '30.31708', '2017-06-16 17:10:01', '1000000000008', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('68', '10000000006', '120.07592', '30.317118', '2017-06-16 17:10:23', '1000000000008', '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('69', '10000000005', '120.074829', '30.31708', '2017-06-16 17:11:06', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('70', '10000000005', '120.074829', '30.31708', '2017-06-16 17:13:03', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('71', '10000000001', '120.076726', '30.316843', '2017-06-16 17:13:37', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('72', '10000000001', '120.076444', '30.317036', '2017-06-16 17:18:32', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('73', '10000000005', '120.074829', '30.31708', '2017-06-16 17:21:21', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('74', '10000000005', '120.074829', '30.31708', '2017-06-16 17:21:53', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('75', '10000000001', '120.076102', '30.317094', '2017-06-16 17:23:05', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('76', '10000000008', '120.076263', '30.317055', '2017-06-16 17:28:38', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('77', '10000000005', '120.074829', '30.31708', '2017-06-16 17:29:43', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('78', '10000000006', '120.074437', '30.315207', '2017-06-16 17:29:49', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('79', '10000000005', '120.074829', '30.31708', '2017-06-16 17:33:31', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('80', '10000000005', '120.074829', '30.31708', '2017-06-16 17:34:21', '1000000000009', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('81', '10000000001', '120.080713', '30.322028', '2017-06-16 17:35:30', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('82', '10000000005', '120.074829', '30.31708', '2017-06-16 17:36:10', '1000000000009', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('83', '10000000001', '120.081403', '30.322796', '2017-06-16 17:56:20', null, '中国浙江省杭州市西湖区厚仁路靠近厚诚桥社区');
INSERT INTO `location` VALUES ('84', '10000000001', '120.076309', '30.317081', '2017-06-16 17:58:54', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('85', '10000000006', '120.076452', '30.317369', '2017-06-16 18:00:18', '1000000000009', null);
INSERT INTO `location` VALUES ('86', '10000000001', '120.076071', '30.317052', '2017-06-16 18:00:22', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('87', '10000000001', '120.076095', '30.31712', '2017-06-16 18:01:53', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('88', '10000000001', '120.076019', '30.317125', '2017-06-16 18:07:28', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('89', '10000000001', '120.076313', '30.317028', '2017-06-16 18:09:56', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('90', '10000000001', '120.076235', '30.317027', '2017-06-16 18:10:00', '1000000000009', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('91', '10000000001', '120.07626', '30.317049', '2017-06-16 18:18:26', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('92', '10000000005', '120.027987', '30.366637', '2017-06-16 18:20:17', '1000000000009', '浙江省杭州市余杭区风情大道靠近玉鸟幼儿园(风情大道)');
INSERT INTO `location` VALUES ('93', '10000000005', '120.027987', '30.366637', '2017-06-16 18:20:18', '1000000000009', '浙江省杭州市余杭区风情大道靠近玉鸟幼儿园(风情大道)');
INSERT INTO `location` VALUES ('94', '10000000001', '120.076226', '30.317025', '2017-06-16 18:21:15', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('95', '10000000001', '120.076208', '30.317016', '2017-06-16 18:25:42', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('96', '10000000001', '120.076231', '30.317014', '2017-06-16 18:29:13', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('97', '10000000005', '120.009866', '30.277515', '2017-06-16 18:43:42', '1000000000009', '浙江省杭州市余杭区文一西路靠近万利大厦(文一西路1242号)');
INSERT INTO `location` VALUES ('98', '10000000007', '120.081322', '30.321804', '2017-06-16 18:52:40', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('99', '10000000005', '119.999489', '30.245134', '2017-06-16 19:14:56', null, '浙江省杭州市余杭区王家畈路靠近九曲湾(王家畈路43号)');
INSERT INTO `location` VALUES ('100', '10000000005', '119.999489', '30.245134', '2017-06-16 19:14:58', null, '浙江省杭州市余杭区王家畈路靠近九曲湾(王家畈路43号)');
INSERT INTO `location` VALUES ('101', '10000000005', '119.999779', '30.245901', '2017-06-16 19:15:29', null, '浙江省杭州市余杭区王家畈路靠近九曲湾(王家畈路1号)');
INSERT INTO `location` VALUES ('102', '10000000005', '119.999779', '30.245901', '2017-06-16 19:15:43', null, '浙江省杭州市余杭区王家畈路靠近九曲湾(王家畈路1号)');
INSERT INTO `location` VALUES ('103', '10000000006', '120.074591', '30.316234', '2017-06-16 19:36:23', '1000000000009', '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('104', '10000000000', '120.075976', '30.316724', '2017-06-16 20:55:41', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('105', '10000000000', '120.076041', '30.316769', '2017-06-16 21:02:40', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('106', '10000000000', '120.076041', '30.316769', '2017-06-16 21:03:28', '1000000000012', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('107', '10000000000', '120.076041', '30.316769', '2017-06-16 21:03:30', '1000000000012', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('108', '10000000000', '120.076041', '30.316769', '2017-06-16 21:03:30', '1000000000012', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('109', '10000000000', '120.076041', '30.316769', '2017-06-16 21:03:36', '1000000000012', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('110', '10000000000', '120.076153', '30.316833', '2017-06-16 21:55:39', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('111', '10000000000', '120.076454', '30.317165', '2017-06-16 22:06:53', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('112', '10000000006', '120.090343', '30.414513', '2017-06-17 00:53:59', null, '中国浙江省杭州市余杭区西南山西路靠近王家门小区');
INSERT INTO `location` VALUES ('113', '10000000006', '120.090196', '30.414499', '2017-06-17 11:13:14', null, '中国浙江省杭州市余杭区西南山西路靠近王家门小区');
INSERT INTO `location` VALUES ('114', '10000000000', '120.058975', '30.361486', '2017-06-17 17:30:35', null, '浙江省杭州市余杭区玉鸟路靠近永旺梦乐城(杭州良渚新城店)(玉鸟路1888号)');
INSERT INTO `location` VALUES ('115', '10000000000', '120.058725', '30.361474', '2017-06-17 17:31:33', '1000000000013', '浙江省杭州市余杭区玉鸟路靠近永旺梦乐城(杭州良渚新城店)(玉鸟路1888号)');
INSERT INTO `location` VALUES ('116', '10000000000', '120.058715', '30.361474', '2017-06-17 17:32:11', '1000000000013', '浙江省杭州市余杭区玉鸟路靠近永旺梦乐城(杭州良渚新城店)(玉鸟路1888号)');
INSERT INTO `location` VALUES ('117', '10000000000', '120.058694', '30.361477', '2017-06-17 17:49:52', '1000000000013', '浙江省杭州市余杭区玉鸟路靠近永旺梦乐城(杭州良渚新城店)(玉鸟路1888号)');
INSERT INTO `location` VALUES ('118', '10000000007', '-122.052214', '37.315988', '2017-06-17 18:05:22', null, '没有格式化字符串');
INSERT INTO `location` VALUES ('119', '10000000000', '120.05891', '30.36148', '2017-06-17 18:11:45', null, '浙江省杭州市余杭区玉鸟路靠近永旺梦乐城(杭州良渚新城店)(玉鸟路1888号)');
INSERT INTO `location` VALUES ('120', '10000000000', '120.05789', '30.361285', '2017-06-17 18:24:49', null, '浙江省杭州市余杭区玉鸟路靠近音之舞舞蹈(永旺梦乐城)(玉鸟路1888号)');
INSERT INTO `location` VALUES ('121', '10000000000', '120.057934', '30.361269', '2017-06-17 18:25:12', '1000000000013', '浙江省杭州市余杭区玉鸟路靠近音之舞舞蹈(永旺梦乐城)(玉鸟路1888号)');
INSERT INTO `location` VALUES ('122', '10000000006', '120.054622', '30.382813', '2017-06-17 19:25:50', '1000000000013', null);
INSERT INTO `location` VALUES ('123', '10000000000', '120.054544', '30.382785', '2017-06-17 19:40:57', null, '浙江省杭州市余杭区东方东路靠近交大昂立国际教育(东方东路188号)');
INSERT INTO `location` VALUES ('124', '10000000000', '120.054813', '30.382911', '2017-06-17 19:41:05', '1000000000013', null);
INSERT INTO `location` VALUES ('125', '10000000006', '120.053095', '30.383479', '2017-06-17 20:44:46', '1000000000013', '中国浙江省杭州市余杭区西南山西路靠近王家门小区');
INSERT INTO `location` VALUES ('126', '10000000006', '120.089342', '30.415743', '2017-06-18 08:44:38', null, '中国浙江省杭州市余杭区西南山西路靠近王家门小区');
INSERT INTO `location` VALUES ('127', '10000000001', '120.07652', '30.317054', '2017-06-19 09:04:45', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('128', '10000000005', '120.076406', '30.317144', '2017-06-19 09:07:48', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('129', '10000000001', '120.07632', '30.316966', '2017-06-19 09:17:31', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('130', '10000000001', '120.07613', '30.317098', '2017-06-19 09:30:07', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('131', '10000000003', '120.076181', '30.316697', '2017-06-19 09:31:38', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('132', '10000000006', '120.075979', '30.317123', '2017-06-19 09:32:13', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('133', '10000000006', '120.076312', '30.317002', '2017-06-19 09:33:23', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('134', '10000000002', '120.031616', '30.336353', '2017-06-19 09:35:32', null, '中国浙江省杭州市西湖区方蒋段靠近广大驾校(三墩分校)');
INSERT INTO `location` VALUES ('135', '10000000001', '120.076295', '30.317057', '2017-06-19 09:35:52', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('136', '10000000001', '120.076545', '30.316979', '2017-06-19 09:43:38', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('137', '10000000003', '120.076175', '30.316701', '2017-06-19 09:44:03', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('138', '10000000003', '120.076191', '30.316696', '2017-06-19 09:47:23', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('139', '10000000003', '120.076191', '30.316696', '2017-06-19 09:50:49', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('140', '10000000003', '120.076127', '30.3167', '2017-06-19 09:52:58', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('141', '10000000001', '120.076443', '30.316965', '2017-06-19 09:54:57', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('142', '10000000003', '120.076139', '30.316711', '2017-06-19 09:57:20', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('143', '10000000003', '120.076139', '30.316711', '2017-06-19 09:57:56', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('144', '10000000003', '120.076034', '30.316732', '2017-06-19 10:02:06', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('145', '10000000003', '120.076182', '30.316703', '2017-06-19 10:15:11', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('146', '10000000000', '120.076055', '30.316704', '2017-06-19 10:21:57', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('147', '10000000000', '120.076055', '30.316704', '2017-06-19 10:21:59', '1000000000013', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('148', '10000000003', '120.076159', '30.316719', '2017-06-19 10:24:44', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('149', '10000000000', '120.076177', '30.316697', '2017-06-19 10:26:58', '1000000000014', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('150', '10000000000', '120.076177', '30.316697', '2017-06-19 10:27:02', '1000000000014', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('151', '10000000000', '120.076177', '30.316697', '2017-06-19 10:27:10', '1000000000014', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('152', '10000000003', '120.076199', '30.316696', '2017-06-19 10:28:10', '1000000000014', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('153', '10000000003', '120.076195', '30.316699', '2017-06-19 10:40:43', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('154', '10000000003', '120.076168', '30.316712', '2017-06-19 10:41:22', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('155', '10000000000', '120.076169', '30.316696', '2017-06-19 10:53:04', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('156', '10000000003', '120.076176', '30.316697', '2017-06-19 10:59:56', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('157', '10000000005', '120.074829', '30.31708', '2017-06-19 11:58:34', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('158', '10000000005', '120.074829', '30.31708', '2017-06-19 11:59:01', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('159', '10000000006', '120.076187', '30.316938', '2017-06-19 12:13:37', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('160', '10000000005', '120.074829', '30.31708', '2017-06-19 12:20:33', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('161', '10000000003', '120.076158', '30.316698', '2017-06-19 13:36:23', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('162', '10000000006', '120.075951', '30.317277', '2017-06-19 14:03:00', null, '中国浙江省杭州市西湖区紫萱路靠近西城博司');
INSERT INTO `location` VALUES ('163', '10000000003', '120.076197', '30.316695', '2017-06-19 14:09:36', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('164', '10000000003', '120.076197', '30.316695', '2017-06-19 14:14:21', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('165', '10000000003', '120.076178', '30.316697', '2017-06-19 14:18:30', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('166', '10000000003', '120.076174', '30.316696', '2017-06-19 14:51:08', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('167', '10000000003', '120.075314', '30.317086', '2017-06-19 14:53:20', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号)');
INSERT INTO `location` VALUES ('168', '10000000002', '120.076199', '30.317025', '2017-06-19 14:53:30', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('169', '10000000000', '120.076144', '30.316718', '2017-06-19 14:58:46', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('170', '10000000003', '120.076164', '30.316705', '2017-06-19 15:00:37', '1000000000019', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('171', '10000000004', '120.076146', '30.316698', '2017-06-19 16:24:21', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('172', '10000000004', '120.076146', '30.316698', '2017-06-19 16:25:51', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('173', '10000000000', '120.076052', '30.316714', '2017-06-19 19:59:36', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('174', '10000000000', '120.076116', '30.316719', '2017-06-19 20:04:44', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('175', '10000000000', '120.076133', '30.3167', '2017-06-19 20:27:50', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('176', '10000000000', '120.076052', '30.316705', '2017-06-19 20:33:51', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('177', '10000000000', '120.076124', '30.316713', '2017-06-19 20:34:41', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('178', '10000000010', '120.07619', '30.316698', '2017-06-19 20:46:50', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('179', '10000000010', '120.07619', '30.316698', '2017-06-19 20:49:43', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('180', '10000000010', '120.076158', '30.3167', '2017-06-19 20:55:07', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('181', '10000000010', '120.076154', '30.316702', '2017-06-19 20:57:49', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('182', '10000000000', '120.076142', '30.316699', '2017-06-19 21:12:03', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('183', '10000000000', '120.076142', '30.316699', '2017-06-19 21:13:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('184', '10000000003', '120.076205', '30.316698', '2017-06-20 09:20:06', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('185', '10000000002', '120.073689', '30.314691', '2017-06-20 09:23:37', null, '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('186', '10000000003', '120.076194', '30.316707', '2017-06-20 09:27:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('187', '10000000000', '120.076079', '30.316726', '2017-06-20 10:01:42', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('188', '10000000003', '120.076126', '30.316717', '2017-06-20 10:07:33', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('189', '10000000001', '120.076657', '30.316945', '2017-06-20 10:11:41', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('190', '10000000003', '120.076192', '30.316696', '2017-06-20 10:13:23', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('191', '10000000001', '120.076163', '30.317089', '2017-06-20 10:17:52', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('192', '10000000001', '120.076139', '30.31709', '2017-06-20 10:20:04', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('193', '10000000003', '120.076208', '30.316747', '2017-06-20 10:22:40', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('194', '10000000003', '120.076175', '30.316709', '2017-06-20 10:23:09', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('195', '10000000001', '120.076359', '30.31708', '2017-06-20 10:25:39', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('196', '10000000003', '120.076192', '30.316695', '2017-06-20 10:34:47', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('197', '10000000001', '120.076297', '30.317051', '2017-06-20 10:36:03', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('198', '10000000001', '120.076397', '30.316996', '2017-06-20 10:39:06', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('199', '10000000000', '120.076187', '30.316697', '2017-06-20 10:41:02', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('200', '10000000001', '120.076344', '30.317029', '2017-06-20 10:55:44', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('201', '10000000003', '120.076151', '30.316702', '2017-06-20 10:57:33', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('202', '10000000003', '120.076151', '30.316702', '2017-06-20 11:00:30', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('203', '10000000003', '120.076019', '30.316725', '2017-06-20 11:16:02', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('204', '10000000001', '120.076001', '30.317128', '2017-06-20 11:23:32', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('205', '10000000001', '120.076159', '30.31703', '2017-06-20 11:29:27', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('206', '10000000001', '120.076035', '30.317083', '2017-06-20 11:30:42', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('207', '10000000001', '120.076348', '30.317026', '2017-06-20 11:33:52', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('208', '10000000001', '120.07636', '30.317082', '2017-06-20 11:38:30', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('209', '10000000001', '120.076005', '30.317131', '2017-06-20 11:41:37', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('210', '10000000001', '120.076025', '30.317129', '2017-06-20 11:42:44', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('211', '10000000001', '120.076299', '30.317024', '2017-06-20 11:51:51', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('212', '10000000001', '120.07636', '30.317083', '2017-06-20 11:53:38', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('213', '10000000001', '120.076095', '30.317062', '2017-06-20 11:58:37', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('214', '10000000000', '120.076', '30.31674', '2017-06-20 12:02:13', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('215', '10000000000', '120.076029', '30.316719', '2017-06-20 12:13:26', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('216', '10000000000', '120.075993', '30.316704', '2017-06-20 12:37:26', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('217', '10000000000', '120.075993', '30.316704', '2017-06-20 12:38:59', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('218', '10000000006', '120.076523', '30.317084', '2017-06-20 13:12:59', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('219', '10000000000', '120.076145', '30.316706', '2017-06-20 13:13:42', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('220', '10000000001', '120.076', '30.317131', '2017-06-20 13:21:21', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('221', '10000000000', '120.076142', '30.316698', '2017-06-20 13:23:00', '1000000000020', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('222', '10000000000', '120.076142', '30.316698', '2017-06-20 13:23:16', '1000000000020', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('223', '10000000001', '120.080969', '30.315355', '2017-06-20 13:30:31', '1000000000020', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('224', '10000000000', '120.076192', '30.316701', '2017-06-20 13:31:00', '1000000000020', null);
INSERT INTO `location` VALUES ('225', '10000000001', '120.076288', '30.317083', '2017-06-20 13:33:09', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('226', '10000000001', '120.076114', '30.317041', '2017-06-20 13:34:18', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('227', '10000000003', '120.076158', '30.316722', '2017-06-20 13:35:05', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('228', '10000000003', '120.076158', '30.316722', '2017-06-20 13:35:32', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('229', '10000000001', '120.07629', '30.317016', '2017-06-20 13:47:26', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('230', '10000000001', '120.076196', '30.317029', '2017-06-20 13:48:36', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('231', '10000000001', '120.076139', '30.317114', '2017-06-20 13:52:16', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('232', '10000000001', '120.076426', '30.317021', '2017-06-20 13:57:27', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('233', '10000000003', '120.076195', '30.316696', '2017-06-20 14:00:47', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('234', '10000000010', '120.076346', '30.317128', '2017-06-20 14:00:55', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('235', '10000000001', '120.076244', '30.317015', '2017-06-20 14:01:09', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('236', '10000000001', '120.076175', '30.317164', '2017-06-20 14:04:14', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('237', '10000000001', '120.076372', '30.317002', '2017-06-20 14:05:27', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('238', '10000000001', '120.07615', '30.31712', '2017-06-20 14:07:26', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('239', '10000000001', '120.077463', '30.316568', '2017-06-20 14:08:42', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('240', '10000000001', '120.081189', '30.315221', '2017-06-20 14:09:27', null, '中国浙江省杭州市西湖区西行路靠近杭州市西溪社区学院');
INSERT INTO `location` VALUES ('241', '10000000001', '120.081189', '30.315221', '2017-06-20 14:10:00', '1000000000020', '中国浙江省杭州市西湖区西行路靠近杭州市西溪社区学院');
INSERT INTO `location` VALUES ('242', '10000000001', '120.0763', '30.317017', '2017-06-20 14:10:57', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('243', '10000000001', '120.076142', '30.317081', '2017-06-20 14:11:52', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('244', '10000000010', '120.076126', '30.316717', '2017-06-20 14:11:54', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('245', '10000000003', '120.076119', '30.316713', '2017-06-20 14:14:35', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('246', '10000000001', '120.081', '30.322401', '2017-06-20 14:21:10', '1000000000020', '没有格式化字符串');
INSERT INTO `location` VALUES ('247', '10000000001', '120.081', '30.322401', '2017-06-20 14:21:10', '1000000000020', '没有格式化字符串');
INSERT INTO `location` VALUES ('248', '10000000001', '120.076004', '30.317133', '2017-06-20 14:21:25', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('249', '10000000001', '120.076034', '30.317138', '2017-06-20 14:22:05', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('250', '10000000001', '120.07641', '30.317123', '2017-06-20 14:24:22', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('251', '10000000003', '120.076191', '30.316698', '2017-06-20 14:24:22', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('252', '10000000010', '120.076168', '30.316745', '2017-06-20 14:25:03', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('253', '10000000001', '120.076179', '30.317063', '2017-06-20 14:27:06', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('254', '10000000001', '120.076271', '30.31707', '2017-06-20 14:28:07', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('255', '10000000001', '120.076123', '30.317112', '2017-06-20 14:28:58', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('256', '10000000010', '120.076405', '30.317084', '2017-06-20 14:30:01', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('257', '10000000001', '120.076356', '30.317027', '2017-06-20 14:30:02', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('258', '10000000003', '120.076164', '30.316697', '2017-06-20 14:31:12', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('259', '10000000003', '120.076164', '30.316697', '2017-06-20 14:33:55', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('260', '10000000001', '120.076166', '30.317053', '2017-06-20 14:34:16', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('261', '10000000000', '120.07633', '30.316825', '2017-06-20 14:34:43', '1000000000020', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('262', '10000000000', '120.07633', '30.316825', '2017-06-20 14:34:43', '1000000000020', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('263', '10000000000', '120.07633', '30.316825', '2017-06-20 14:34:43', '1000000000020', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('264', '10000000003', '120.076154', '30.316711', '2017-06-20 14:37:32', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('265', '10000000001', '120.076211', '30.317094', '2017-06-20 14:49:28', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('266', '10000000001', '120.0763', '30.317019', '2017-06-20 14:54:59', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('267', '10000000001', '120.076195', '30.317078', '2017-06-20 14:55:57', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('268', '10000000001', '120.076348', '30.317012', '2017-06-20 15:00:24', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('269', '10000000003', '120.076152', '30.3167', '2017-06-20 15:07:06', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('270', '10000000003', '120.076152', '30.3167', '2017-06-20 15:07:17', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('271', '10000000001', '120.07634', '30.317016', '2017-06-20 15:08:36', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('272', '10000000003', '120.076152', '30.3167', '2017-06-20 15:09:49', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('273', '10000000003', '120.076181', '30.316701', '2017-06-20 15:11:16', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('274', '10000000001', '120.076423', '30.317035', '2017-06-20 15:12:47', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('275', '10000000001', '120.076346', '30.317036', '2017-06-20 15:14:56', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('276', '10000000001', '120.076115', '30.317034', '2017-06-20 15:17:57', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('277', '10000000003', '120.076177', '30.316697', '2017-06-20 15:19:38', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('278', '10000000001', '120.076281', '30.317078', '2017-06-20 15:20:24', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('279', '10000000001', '120.076035', '30.317091', '2017-06-20 15:23:26', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('280', '10000000003', '120.0762', '30.316696', '2017-06-20 15:26:23', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('281', '10000000003', '120.0762', '30.316696', '2017-06-20 15:27:01', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('282', '10000000003', '120.0762', '30.316696', '2017-06-20 15:27:23', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('283', '10000000003', '120.0762', '30.316696', '2017-06-20 15:28:23', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('284', '10000000001', '120.076131', '30.317093', '2017-06-20 15:29:31', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('285', '10000000001', '120.076027', '30.317129', '2017-06-20 15:32:21', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('286', '10000000001', '120.076477', '30.317011', '2017-06-20 15:33:16', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('287', '10000000000', '120.076088', '30.31672', '2017-06-20 15:33:38', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('288', '10000000001', '120.07634', '30.31702', '2017-06-20 15:36:27', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('289', '10000000000', '120.076083', '30.316714', '2017-06-20 15:41:02', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('290', '10000000003', '120.076166', '30.316704', '2017-06-20 15:45:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('291', '10000000000', '120.076014', '30.316722', '2017-06-20 15:46:45', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('292', '10000000001', '120.076096', '30.317046', '2017-06-20 15:46:49', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('293', '10000000001', '120.076148', '30.31706', '2017-06-20 15:47:48', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('294', '10000000000', '120.076071', '30.316704', '2017-06-20 15:51:32', '1000000000020', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('295', '10000000001', '120.076297', '30.317053', '2017-06-20 15:51:39', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('296', '10000000003', '120.07617', '30.316698', '2017-06-20 15:54:35', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('297', '10000000001', '120.076129', '30.317092', '2017-06-20 15:56:05', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('298', '10000000003', '120.07617', '30.316698', '2017-06-20 15:56:34', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('299', '10000000001', '120.076359', '30.31708', '2017-06-20 15:58:49', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('300', '10000000001', '120.076337', '30.317006', '2017-06-20 16:00:42', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('301', '10000000006', '120.076233', '30.317027', '2017-06-20 16:05:02', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('302', '10000000006', '120.076243', '30.317265', '2017-06-20 16:13:03', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('303', '10000000005', '120.074829', '30.31708', '2017-06-20 16:13:04', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('304', '10000000001', '120.076147', '30.317078', '2017-06-20 16:15:51', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('305', '10000000001', '120.080729', '30.32211', '2017-06-20 16:16:46', null, '中国浙江省杭州市西湖区厚仁路靠近品臣·海贝教育');
INSERT INTO `location` VALUES ('306', '10000000006', '120.076415', '30.31729', '2017-06-20 16:25:01', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('307', '10000000006', '120.07635', '30.317282', '2017-06-20 16:26:39', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('308', '10000000005', '120.074829', '30.31708', '2017-06-20 16:27:28', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('309', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:04', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('310', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:06', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('311', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:06', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('312', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:07', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('313', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:07', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('314', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:07', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('315', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:07', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('316', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:08', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('317', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:08', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('318', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:08', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('319', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:09', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('320', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:09', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('321', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:09', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('322', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:10', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('323', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:10', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('324', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:10', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('325', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:10', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('326', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:11', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('327', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:11', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('328', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:11', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('329', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:11', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('330', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:11', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('331', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:12', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('332', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:12', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('333', '10000000005', '120.074829', '30.31708', '2017-06-20 16:29:12', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('334', '10000000010', '120.076221', '30.316881', '2017-06-20 16:30:42', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('335', '10000000010', '120.076221', '30.316881', '2017-06-20 16:31:04', '1000000000023', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('336', '10000000010', '120.076384', '30.317111', '2017-06-20 16:31:07', '1000000000023', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('337', '10000000005', '120.074829', '30.31708', '2017-06-20 16:31:48', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('338', '10000000001', '120.076466', '30.317068', '2017-06-20 16:33:31', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('339', '10000000005', '120.074829', '30.31708', '2017-06-20 16:34:57', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('340', '10000000001', '120.076096', '30.317055', '2017-06-20 16:35:07', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('341', '10000000005', '120.074829', '30.31708', '2017-06-20 16:35:38', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('342', '10000000005', '120.074829', '30.31708', '2017-06-20 16:35:44', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('343', '10000000005', '120.074829', '30.31708', '2017-06-20 16:36:30', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('344', '10000000005', '120.074829', '30.31708', '2017-06-20 16:36:44', '1000000000023', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('345', '10000000005', '120.074829', '30.31708', '2017-06-20 16:38:57', '1000000000024', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('346', '10000000000', '120.076056', '30.316719', '2017-06-20 16:39:15', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('347', '10000000001', '120.076362', '30.317086', '2017-06-20 16:39:46', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('348', '10000000006', '120.076107', '30.31729', '2017-06-20 16:41:52', '1000000000024', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('349', '10000000005', '120.074829', '30.31708', '2017-06-20 16:41:59', '1000000000024', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('350', '10000000005', '120.074829', '30.31708', '2017-06-20 16:43:23', '1000000000024', null);
INSERT INTO `location` VALUES ('351', '10000000005', '120.074829', '30.31708', '2017-06-20 16:43:50', '1000000000024', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('352', '10000000005', '120.074829', '30.31708', '2017-06-20 16:43:50', '1000000000024', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('353', '10000000005', '120.074829', '30.31708', '2017-06-20 16:43:50', '1000000000024', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('354', '10000000005', '120.074829', '30.31708', '2017-06-20 16:43:51', '1000000000024', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('355', '10000000005', '120.074829', '30.31708', '2017-06-20 16:43:51', '1000000000024', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('356', '10000000005', '120.074829', '30.31708', '2017-06-20 16:46:13', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('357', '10000000003', '120.076119', '30.316717', '2017-06-20 16:46:47', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('358', '10000000010', '120.076384', '30.317114', '2017-06-20 16:47:16', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('359', '10000000010', '120.076384', '30.317114', '2017-06-20 16:47:35', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('360', '10000000000', '120.076047', '30.316712', '2017-06-20 16:48:07', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('361', '10000000010', '120.076213', '30.317307', '2017-06-20 16:48:25', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('362', '10000000010', '120.076213', '30.317307', '2017-06-20 16:48:35', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('363', '10000000003', '120.076119', '30.316717', '2017-06-20 16:49:50', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('364', '10000000006', '120.076321', '30.317326', '2017-06-20 16:50:00', '1000000000024', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('365', '10000000006', '120.076321', '30.317326', '2017-06-20 16:50:00', '1000000000024', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('366', '10000000001', '120.076136', '30.317092', '2017-06-20 16:53:12', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('367', '10000000003', '120.076156', '30.316705', '2017-06-20 16:56:33', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('368', '10000000004', '120.076156', '30.316705', '2017-06-20 16:58:26', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('369', '10000000004', '120.076198', '30.316696', '2017-06-20 17:01:42', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('370', '10000000001', '120.076236', '30.317088', '2017-06-20 17:03:10', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('371', '10000000005', '120.074829', '30.31708', '2017-06-20 17:03:19', '1000000000024', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('372', '10000000004', '120.076139', '30.316707', '2017-06-20 17:03:26', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('373', '10000000001', '120.080739', '30.322019', '2017-06-20 17:05:39', null, '没有格式化字符串');
INSERT INTO `location` VALUES ('374', '10000000004', '120.076139', '30.316707', '2017-06-20 17:06:45', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('375', '10000000001', '120.076278', '30.317005', '2017-06-20 17:07:39', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('376', '10000000001', '120.07635', '30.317029', '2017-06-20 17:08:47', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('377', '10000000005', '120.074829', '30.31708', '2017-06-20 17:10:28', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('378', '10000000001', '120.076297', '30.317053', '2017-06-20 17:16:22', null, '没有格式化字符串');
INSERT INTO `location` VALUES ('379', '10000000003', '120.07618', '30.316697', '2017-06-20 17:18:15', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('380', '10000000005', '120.074829', '30.31708', '2017-06-20 17:21:34', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('381', '10000000002', '120.076086', '30.317087', '2017-06-20 17:22:00', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('382', '10000000001', '120.076486', '30.317052', '2017-06-20 17:23:58', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('383', '10000000003', '120.076168', '30.316703', '2017-06-20 17:25:18', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('384', '10000000006', '120.076252', '30.317054', '2017-06-20 17:25:47', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('385', '10000000006', '120.076234', '30.317092', '2017-06-20 17:40:19', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('386', '10000000006', '120.076156', '30.317131', '2017-06-20 17:44:24', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('387', '10000000004', '120.075747', '30.317108', '2017-06-20 17:56:16', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街194号)');
INSERT INTO `location` VALUES ('388', '10000000000', '120.07616', '30.316699', '2017-06-20 18:15:52', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('389', '10000000003', '120.07607', '30.31672', '2017-06-20 18:16:00', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('390', '10000000003', '120.07607', '30.31672', '2017-06-20 18:16:42', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('391', '10000000002', '120.073689', '30.314691', '2017-06-20 18:16:42', null, '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('392', '10000000010', '120.074829', '30.31708', '2017-06-20 18:16:54', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('393', '10000000010', '120.074829', '30.31708', '2017-06-20 18:17:00', '1000000000029', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('394', '10000000004', '120.07617', '30.316699', '2017-06-20 18:17:16', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('395', '10000000000', '120.07616', '30.316699', '2017-06-20 18:17:28', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('396', '10000000002', '120.073689', '30.314691', '2017-06-20 18:19:50', '1000000000029', null);
INSERT INTO `location` VALUES ('397', '10000000000', '120.07609', '30.316723', '2017-06-20 18:19:54', '1000000000029', null);
INSERT INTO `location` VALUES ('398', '10000000004', '120.07617', '30.316699', '2017-06-20 18:19:56', '1000000000029', null);
INSERT INTO `location` VALUES ('399', '10000000001', '120.076925', '30.317957', '2017-06-20 18:20:00', '1000000000029', '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('400', '10000000002', '120.073689', '30.314691', '2017-06-20 18:20:01', '1000000000029', '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('401', '10000000004', '120.07617', '30.316699', '2017-06-20 18:20:01', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('402', '10000000000', '120.07609', '30.316723', '2017-06-20 18:20:01', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('403', '10000000010', '120.074829', '30.31708', '2017-06-20 18:20:01', '1000000000029', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('404', '10000000003', '120.07607', '30.31672', '2017-06-20 18:20:19', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('405', '10000000003', '120.07607', '30.31672', '2017-06-20 18:20:20', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('406', '10000000003', '120.076181', '30.31671', '2017-06-20 18:20:37', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('407', '10000000003', '120.076181', '30.31671', '2017-06-20 18:20:44', '1000000000029', null);
INSERT INTO `location` VALUES ('408', '10000000003', '120.076181', '30.31671', '2017-06-20 18:20:52', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('409', '10000000003', '120.076181', '30.31671', '2017-06-20 18:20:53', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('410', '10000000003', '120.076181', '30.31671', '2017-06-20 18:20:54', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('411', '10000000003', '120.076181', '30.31671', '2017-06-20 18:20:55', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('412', '10000000003', '120.076181', '30.31671', '2017-06-20 18:20:56', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('413', '10000000003', '120.076181', '30.31671', '2017-06-20 18:20:56', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('414', '10000000003', '120.076181', '30.31671', '2017-06-20 18:20:56', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('415', '10000000003', '120.076181', '30.31671', '2017-06-20 18:20:56', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('416', '10000000003', '120.076181', '30.31671', '2017-06-20 18:20:56', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('417', '10000000002', '120.076431', '30.317225', '2017-06-20 18:21:31', '1000000000029', '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('418', '10000000006', '120.074908', '30.315757', '2017-06-20 18:23:21', '1000000000029', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('419', '10000000006', '120.076393', '30.317121', '2017-06-20 18:23:32', '1000000000029', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('420', '10000000006', '120.076329', '30.317095', '2017-06-20 18:23:42', '1000000000029', null);
INSERT INTO `location` VALUES ('421', '10000000010', '120.074829', '30.31708', '2017-06-20 18:23:44', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('422', '10000000010', '120.074829', '30.31708', '2017-06-20 18:24:03', '1000000000029', null);
INSERT INTO `location` VALUES ('423', '10000000000', '120.07609', '30.316723', '2017-06-20 18:24:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('424', '10000000003', '120.076204', '30.316703', '2017-06-20 18:30:01', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('425', '10000000003', '120.076204', '30.316703', '2017-06-20 18:30:01', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('426', '10000000004', '120.075745', '30.317068', '2017-06-20 18:30:03', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街194号)');
INSERT INTO `location` VALUES ('427', '10000000004', '120.075745', '30.317068', '2017-06-20 18:30:03', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街194号)');
INSERT INTO `location` VALUES ('428', '10000000006', '120.075716', '30.317234', '2017-06-20 18:31:19', '1000000000029', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('429', '10000000006', '120.075716', '30.317234', '2017-06-20 18:31:19', '1000000000029', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('430', '10000000000', '120.075355', '30.317306', '2017-06-20 18:31:47', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街198号)');
INSERT INTO `location` VALUES ('431', '10000000000', '120.075355', '30.317306', '2017-06-20 18:31:48', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街198号)');
INSERT INTO `location` VALUES ('432', '10000000000', '120.075355', '30.317306', '2017-06-20 18:31:48', '1000000000029', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街198号)');
INSERT INTO `location` VALUES ('433', '10000000000', '120.063834', '30.358877', '2017-06-20 18:51:07', null, '浙江省杭州市余杭区古墩路靠近童旺儿童艺术培育(古墩路1888号)');
INSERT INTO `location` VALUES ('434', '10000000010', '120.090218', '30.395203', '2017-06-20 19:02:26', null, '浙江省杭州市余杭区疏港公路靠近栅庄桥村文化礼堂(疏港公路236县)');
INSERT INTO `location` VALUES ('435', '10000000010', '120.090218', '30.395203', '2017-06-20 19:02:27', '1000000000029', '浙江省杭州市余杭区疏港公路靠近栅庄桥村文化礼堂(疏港公路236县)');
INSERT INTO `location` VALUES ('436', '10000000010', '120.090218', '30.395203', '2017-06-20 19:02:27', '1000000000029', '浙江省杭州市余杭区疏港公路靠近栅庄桥村文化礼堂(疏港公路236县)');
INSERT INTO `location` VALUES ('437', '10000000004', '120.073298', '30.311434', '2017-06-20 19:18:23', null, '浙江省杭州市西湖区西园三路靠近乾成园(西园三路1号)');
INSERT INTO `location` VALUES ('438', '10000000004', '120.073299', '30.311434', '2017-06-20 19:18:50', null, '浙江省杭州市西湖区西园三路靠近乾成园(西园三路1号)');
INSERT INTO `location` VALUES ('439', '10000000004', '120.073297', '30.311452', '2017-06-20 20:18:54', null, '浙江省杭州市西湖区西园三路靠近乾成园(西园三路1号)');
INSERT INTO `location` VALUES ('440', '10000000004', '120.073155', '30.311491', '2017-06-20 20:20:24', null, '浙江省杭州市西湖区西园三路靠近乾成园(西园三路1号)');
INSERT INTO `location` VALUES ('441', '10000000004', '120.073155', '30.311491', '2017-06-20 20:20:49', null, '浙江省杭州市西湖区西园三路靠近乾成园(西园三路1号)');
INSERT INTO `location` VALUES ('442', '10000000004', '120.073155', '30.311491', '2017-06-20 20:21:19', null, '浙江省杭州市西湖区西园三路靠近乾成园(西园三路1号)');
INSERT INTO `location` VALUES ('443', '10000000004', '120.073303', '30.311406', '2017-06-20 20:36:35', null, '浙江省杭州市西湖区西园三路靠近乾成园(西园三路1号)');
INSERT INTO `location` VALUES ('444', '10000000000', '120.108317', '30.412038', '2017-06-20 21:42:16', null, '浙江省杭州市余杭区木桥路靠近浙江德洛电力设备股份有限公司(木桥路72-2号)');
INSERT INTO `location` VALUES ('445', '10000000001', '120.076142', '30.317045', '2017-06-21 08:54:43', '1000000000029', '没有格式化字符串');
INSERT INTO `location` VALUES ('446', '10000000001', '120.076142', '30.317045', '2017-06-21 08:54:43', '1000000000029', '没有格式化字符串');
INSERT INTO `location` VALUES ('447', '10000000001', '120.07642', '30.31696', '2017-06-21 08:54:58', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('448', '10000000002', '120.076667', '30.319671', '2017-06-21 09:03:10', '1000000000029', '没有格式化字符串');
INSERT INTO `location` VALUES ('449', '10000000002', '120.076667', '30.319671', '2017-06-21 09:03:10', '1000000000029', '没有格式化字符串');
INSERT INTO `location` VALUES ('450', '10000000002', '120.076166', '30.317038', '2017-06-21 09:03:24', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('451', '10000000001', '120.075863', '30.317126', '2017-06-21 09:11:57', null, '中国浙江省杭州市西湖区紫萱路靠近西城博司');
INSERT INTO `location` VALUES ('452', '10000000005', '120.076503', '30.317135', '2017-06-21 09:12:38', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('453', '10000000002', '120.076214', '30.31703', '2017-06-21 09:20:28', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('454', '10000000001', '120.076498', '30.317014', '2017-06-21 09:22:36', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('455', '10000000002', '120.076603', '30.317121', '2017-06-21 09:24:50', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('456', '10000000002', '120.076307', '30.317026', '2017-06-21 09:26:19', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('457', '10000000003', '120.076195', '30.316697', '2017-06-21 09:29:25', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('458', '10000000004', '120.075559', '30.316702', '2017-06-21 09:37:13', null, '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('459', '10000000003', '120.076172', '30.316702', '2017-06-21 10:07:58', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('460', '10000000003', '120.076175', '30.316701', '2017-06-21 10:08:59', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('461', '10000000003', '120.076175', '30.316701', '2017-06-21 10:10:49', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('462', '10000000003', '120.07618', '30.316698', '2017-06-21 10:15:36', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('463', '10000000002', '120.076205', '30.317046', '2017-06-21 10:27:46', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('464', '10000000001', '120.077232', '30.317995', '2017-06-21 10:30:25', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('465', '10000000001', '120.081246', '30.3152', '2017-06-21 10:55:08', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('466', '10000000003', '120.076191', '30.316697', '2017-06-21 10:56:12', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('467', '10000000003', '120.076191', '30.316697', '2017-06-21 10:58:31', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('468', '10000000001', '120.07619', '30.317043', '2017-06-21 10:59:02', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('469', '10000000001', '120.076', '30.317132', '2017-06-21 11:22:13', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('470', '10000000005', '120.074829', '30.31708', '2017-06-21 11:34:37', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('471', '10000000004', '120.076185', '30.316698', '2017-06-21 11:36:58', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('472', '10000000005', '120.074829', '30.31708', '2017-06-21 11:40:33', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('473', '10000000001', '120.076213', '30.317028', '2017-06-21 11:43:30', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('474', '10000000001', '120.076062', '30.317075', '2017-06-21 11:47:50', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('475', '10000000003', '120.076135', '30.316719', '2017-06-21 11:50:00', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('476', '10000000001', '120.076325', '30.317083', '2017-06-21 11:51:41', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('477', '10000000003', '120.076172', '30.316706', '2017-06-21 11:57:57', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('478', '10000000003', '120.076172', '30.316706', '2017-06-21 12:02:26', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('479', '10000000001', '120.076309', '30.317076', '2017-06-21 12:03:02', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('480', '10000000001', '120.076665', '30.31718', '2017-06-21 12:05:12', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('481', '10000000006', '120.1426', '30.31685', '2017-06-21 13:14:38', null, '中国浙江省杭州市拱墅区金华路靠近银河嘉园');
INSERT INTO `location` VALUES ('482', '10000000001', '120.07636', '30.31702', '2017-06-21 13:22:27', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('483', '10000000001', '120.076371', '30.31701', '2017-06-21 13:40:00', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('484', '10000000001', '120.076303', '30.317002', '2017-06-21 13:42:11', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('485', '10000000001', '120.076107', '30.317042', '2017-06-21 13:46:12', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('486', '10000000001', '120.076297', '30.317056', '2017-06-21 13:53:26', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('487', '10000000001', '120.076513', '30.317117', '2017-06-21 13:58:19', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('488', '10000000003', '120.076114', '30.316712', '2017-06-21 14:11:20', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('489', '10000000003', '120.07611', '30.316711', '2017-06-21 14:14:49', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('490', '10000000001', '120.07639', '30.31708', '2017-06-21 14:14:52', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('491', '10000000001', '120.076383', '30.317031', '2017-06-21 14:17:24', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('492', '10000000003', '120.076127', '30.316715', '2017-06-21 14:17:28', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('493', '10000000003', '120.076127', '30.316715', '2017-06-21 14:17:56', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('494', '10000000003', '120.076127', '30.316715', '2017-06-21 14:18:41', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('495', '10000000003', '120.076127', '30.316715', '2017-06-21 14:20:07', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('496', '10000000001', '120.076397', '30.316954', '2017-06-21 14:26:26', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('497', '10000000001', '120.076201', '30.317064', '2017-06-21 14:35:34', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('498', '10000000001', '120.076037', '30.317088', '2017-06-21 14:46:13', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('499', '10000000001', '120.076372', '30.317012', '2017-06-21 14:47:43', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('500', '10000000001', '120.076611', '30.317093', '2017-06-21 15:06:34', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('501', '10000000004', '120.076168', '30.316702', '2017-06-21 15:06:35', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('502', '10000000004', '120.076132', '30.316711', '2017-06-21 15:10:04', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('503', '10000000004', '120.076174', '30.316698', '2017-06-21 15:14:00', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('504', '10000000001', '120.076381', '30.317029', '2017-06-21 15:16:42', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('505', '10000000001', '120.076487', '30.31707', '2017-06-21 15:33:34', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('506', '10000000001', '120.076111', '30.317087', '2017-06-21 15:37:34', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('507', '10000000001', '120.076371', '30.31701', '2017-06-21 15:42:47', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('508', '10000000001', '120.076138', '30.317121', '2017-06-21 15:46:17', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('509', '10000000001', '120.076589', '30.317122', '2017-06-21 15:47:34', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('510', '10000000004', '120.075936', '30.31714', '2017-06-21 16:25:40', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街194号)');
INSERT INTO `location` VALUES ('511', '10000000001', '120.07633', '30.317045', '2017-06-21 16:43:29', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('512', '10000000001', '120.076344', '30.317075', '2017-06-21 16:45:04', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('513', '10000000001', '120.07614', '30.317045', '2017-06-21 17:01:03', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('514', '10000000003', '120.076131', '30.316698', '2017-06-21 17:08:01', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('515', '10000000001', '120.07621', '30.31703', '2017-06-21 17:11:56', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('516', '10000000001', '120.076451', '30.31702', '2017-06-21 17:14:11', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('517', '10000000001', '120.076428', '30.31706', '2017-06-21 17:15:34', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('518', '10000000003', '120.076178', '30.316696', '2017-06-21 17:29:29', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('519', '10000000003', '120.076178', '30.316696', '2017-06-21 17:33:13', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('520', '10000000006', '120.076279', '30.317268', '2017-06-21 18:30:29', null, '中国浙江省杭州市拱墅区金华路靠近银河嘉园');
INSERT INTO `location` VALUES ('521', '10000000001', '120.076331', '30.317071', '2017-06-22 08:34:59', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('522', '10000000006', '120.080321', '30.3428', '2017-06-22 08:42:01', null, '中国浙江省杭州市余杭区古墩路靠近浙江交通职业技术学院水运经济研究所');
INSERT INTO `location` VALUES ('523', '10000000001', '120.076172', '30.317043', '2017-06-22 08:55:20', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('524', '10000000001', '120.076391', '30.317083', '2017-06-22 09:03:52', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('525', '10000000003', '120.076139', '30.316711', '2017-06-22 09:15:01', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('526', '10000000001', '120.076269', '30.317074', '2017-06-22 09:17:57', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('527', '10000000002', '120.07611', '30.317067', '2017-06-22 09:18:16', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('528', '10000000003', '120.076208', '30.316731', '2017-06-22 09:20:18', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('529', '10000000001', '120.076403', '30.317009', '2017-06-22 09:26:59', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('530', '10000000001', '120.076117', '30.317057', '2017-06-22 09:36:56', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('531', '10000000001', '120.076021', '30.317129', '2017-06-22 09:40:11', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('532', '10000000004', '120.076172', '30.316695', '2017-06-22 09:52:59', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('533', '10000000013', '120.163384', '30.24253', '2017-06-22 09:53:42', null, '中国浙江省杭州市上城区府前街靠近浙江省杭州第四中学');
INSERT INTO `location` VALUES ('534', '10000000000', '120.076172', '30.316704', '2017-06-22 09:54:01', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('535', '10000000000', '120.076172', '30.316704', '2017-06-22 09:54:07', '1000000000035', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('536', '10000000004', '120.07618', '30.3167', '2017-06-22 09:55:21', '1000000000035', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('537', '10000000001', '120.076451', '30.317087', '2017-06-22 09:56:34', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('538', '10000000004', '120.076146', '30.316711', '2017-06-22 09:58:11', '1000000000035', null);
INSERT INTO `location` VALUES ('539', '10000000004', '120.076146', '30.316711', '2017-06-22 09:59:19', '1000000000035', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('540', '10000000004', '120.076146', '30.316711', '2017-06-22 09:59:20', '1000000000035', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('541', '10000000000', '120.076185', '30.316702', '2017-06-22 10:00:01', '1000000000035', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('542', '10000000004', '120.076146', '30.316711', '2017-06-22 10:00:01', '1000000000035', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('543', '10000000005', '120.07774', '30.316726', '2017-06-22 10:01:17', null, '浙江省杭州市西湖区S14杭长高速靠近西城博司展示中心(S14杭长高速187号)');
INSERT INTO `location` VALUES ('544', '10000000001', '120.076131', '30.317091', '2017-06-22 10:02:01', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('545', '10000000001', '120.076386', '30.317084', '2017-06-22 10:06:29', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('546', '10000000003', '120.076126', '30.316709', '2017-06-22 10:07:19', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('547', '10000000003', '120.076126', '30.316709', '2017-06-22 10:09:13', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('548', '10000000000', '120.076021', '30.31671', '2017-06-22 10:10:01', '1000000000035', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('549', '10000000001', '120.076118', '30.31704', '2017-06-22 10:10:22', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('550', '10000000003', '120.076126', '30.316709', '2017-06-22 10:11:09', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('551', '10000000004', '120.076036', '30.316705', '2017-06-22 10:12:34', '1000000000035', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('552', '10000000003', '120.076174', '30.316708', '2017-06-22 10:12:37', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('553', '10000000005', '120.074829', '30.31708', '2017-06-22 10:13:15', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('554', '10000000005', '120.074829', '30.31708', '2017-06-22 10:13:23', '1000000000036', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('555', '10000000010', '120.076071', '30.316734', '2017-06-22 10:13:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('556', '10000000001', '120.076376', '30.317292', '2017-06-22 10:13:28', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('557', '10000000010', '120.076071', '30.316734', '2017-06-22 10:13:35', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('558', '10000000010', '120.076071', '30.316734', '2017-06-22 10:13:41', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('559', '10000000010', '120.076071', '30.316734', '2017-06-22 10:14:14', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('560', '10000000003', '120.076174', '30.316708', '2017-06-22 10:14:38', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('561', '10000000010', '120.076117', '30.31673', '2017-06-22 10:16:43', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('562', '10000000004', '120.076139', '30.316722', '2017-06-22 10:16:46', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('563', '10000000004', '120.076139', '30.316722', '2017-06-22 10:16:52', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('564', '10000000004', '120.076139', '30.316722', '2017-06-22 10:16:55', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('565', '10000000004', '120.076139', '30.316722', '2017-06-22 10:18:08', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('566', '10000000000', '120.076041', '30.316718', '2017-06-22 10:18:54', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('567', '10000000001', '120.07636', '30.317119', '2017-06-22 10:21:13', '1000000000036', null);
INSERT INTO `location` VALUES ('568', '10000000010', '120.0764', '30.317093', '2017-06-22 10:21:16', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('569', '10000000002', '120.076136', '30.31705', '2017-06-22 10:21:24', '1000000000036', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('570', '10000000010', '120.0764', '30.317093', '2017-06-22 10:21:24', '1000000000036', null);
INSERT INTO `location` VALUES ('571', '10000000010', '120.0764', '30.317093', '2017-06-22 10:21:26', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('572', '10000000010', '120.0764', '30.317093', '2017-06-22 10:21:28', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('573', '10000000010', '120.0764', '30.317093', '2017-06-22 10:21:29', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('574', '10000000010', '120.0764', '30.317093', '2017-06-22 10:21:31', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('575', '10000000004', '120.076468', '30.317104', '2017-06-22 10:21:33', '1000000000036', null);
INSERT INTO `location` VALUES ('576', '10000000010', '120.0764', '30.317093', '2017-06-22 10:21:33', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('577', '10000000001', '120.080985', '30.314946', '2017-06-22 10:21:34', '1000000000036', '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('578', '10000000010', '120.0764', '30.317093', '2017-06-22 10:21:34', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('579', '10000000002', '120.076136', '30.31705', '2017-06-22 10:21:36', '1000000000036', null);
INSERT INTO `location` VALUES ('580', '10000000010', '120.0764', '30.317093', '2017-06-22 10:21:36', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('581', '10000000010', '120.0764', '30.317093', '2017-06-22 10:21:37', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('582', '10000000010', '120.0764', '30.317093', '2017-06-22 10:21:38', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('583', '10000000005', '120.074829', '30.31708', '2017-06-22 10:21:46', '1000000000036', null);
INSERT INTO `location` VALUES ('584', '10000000003', '120.076157', '30.31671', '2017-06-22 10:22:28', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('585', '10000000003', '120.076157', '30.31671', '2017-06-22 10:22:41', '1000000000036', null);
INSERT INTO `location` VALUES ('586', '10000000003', '120.076157', '30.31671', '2017-06-22 10:24:50', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('587', '10000000003', '120.076179', '30.316703', '2017-06-22 10:27:26', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('588', '10000000001', '120.076192', '30.317058', '2017-06-22 10:29:05', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('589', '10000000003', '120.076153', '30.3167', '2017-06-22 10:29:22', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('590', '10000000005', '120.074829', '30.31708', '2017-06-22 10:29:36', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('591', '10000000001', '120.079181', '30.318518', '2017-06-22 10:30:00', '1000000000036', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('592', '10000000006', '120.076206', '30.317184', '2017-06-22 10:30:00', '1000000000036', '中国浙江省杭州市余杭区古墩路靠近浙江交通职业技术学院水运经济研究所');
INSERT INTO `location` VALUES ('593', '10000000003', '120.075552', '30.316698', '2017-06-22 10:30:01', '1000000000036', '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('594', '10000000004', '120.076198', '30.316696', '2017-06-22 10:30:01', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('595', '10000000005', '120.074829', '30.31708', '2017-06-22 10:30:01', '1000000000036', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('596', '10000000010', '120.076184', '30.316697', '2017-06-22 10:30:01', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('597', '10000000005', '120.074829', '30.31708', '2017-06-22 10:30:05', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('598', '10000000006', '120.076299', '30.317214', '2017-06-22 10:30:30', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('599', '10000000002', '120.076136', '30.31705', '2017-06-22 10:30:30', '1000000000036', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('600', '10000000001', '120.076258', '30.317082', '2017-06-22 10:31:04', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('601', '10000000002', '120.076136', '30.31705', '2017-06-22 10:31:12', '1000000000036', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('602', '10000000003', '120.075552', '30.316698', '2017-06-22 10:31:47', null, '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('603', '10000000010', '120.076312', '30.3171', '2017-06-22 10:32:59', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('604', '10000000001', '120.076504', '30.317052', '2017-06-22 10:33:48', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('605', '10000000000', '120.076011', '30.316711', '2017-06-22 10:33:57', '1000000000036', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('606', '10000000003', '120.076164', '30.3167', '2017-06-22 10:36:20', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('607', '10000000003', '120.076202', '30.316698', '2017-06-22 10:38:18', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('608', '10000000005', '120.074829', '30.31708', '2017-06-22 10:41:02', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('609', '10000000003', '120.076182', '30.316698', '2017-06-22 10:41:58', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('610', '10000000005', '120.074829', '30.31708', '2017-06-22 10:42:04', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('611', '10000000001', '120.076299', '30.31707', '2017-06-22 10:43:06', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('612', '10000000003', '120.076182', '30.316698', '2017-06-22 10:44:18', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('613', '10000000003', '120.076187', '30.316699', '2017-06-22 10:55:35', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('614', '10000000001', '120.076295', '30.317109', '2017-06-22 10:57:52', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('615', '10000000001', '120.076513', '30.317103', '2017-06-22 11:00:12', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('616', '10000000000', '120.076033', '30.316739', '2017-06-22 11:00:18', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('617', '10000000003', '120.075559', '30.316715', '2017-06-22 11:01:07', null, '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('618', '10000000005', '120.074829', '30.31708', '2017-06-22 11:01:09', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('619', '10000000004', '120.076179', '30.316699', '2017-06-22 11:01:55', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('620', '10000000001', '120.076587', '30.317128', '2017-06-22 11:03:08', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('621', '10000000003', '120.075559', '30.316715', '2017-06-22 11:04:05', null, '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('622', '10000000001', '120.076309', '30.317084', '2017-06-22 11:05:15', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('623', '10000000001', '120.076313', '30.317053', '2017-06-22 11:10:26', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('624', '10000000012', '115.691244', '32.181306', '2017-06-22 11:13:31', null, '河南省信阳市固始县蓼北路靠近固始一中(蓼北路140号)');
INSERT INTO `location` VALUES ('625', '10000000000', '120.076011', '30.316722', '2017-06-22 11:13:42', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('626', '10000000003', '120.07617', '30.316697', '2017-06-22 11:15:04', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('627', '10000000004', '120.076046', '30.316705', '2017-06-22 11:20:41', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('628', '10000000001', '120.07646', '30.317074', '2017-06-22 11:20:41', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('629', '10000000001', '120.076478', '30.317021', '2017-06-22 11:25:19', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('630', '10000000003', '120.076181', '30.316705', '2017-06-22 11:30:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('631', '10000000002', '120.076213', '30.317043', '2017-06-22 11:30:55', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('632', '10000000003', '120.076174', '30.316706', '2017-06-22 11:31:37', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('633', '10000000001', '120.076236', '30.317062', '2017-06-22 11:36:31', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('634', '10000000003', '120.076145', '30.316705', '2017-06-22 11:36:32', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('635', '10000000003', '120.076179', '30.316697', '2017-06-22 11:37:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('636', '10000000003', '120.076175', '30.3167', '2017-06-22 11:38:40', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('637', '10000000003', '120.076181', '30.3167', '2017-06-22 11:41:12', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('638', '10000000001', '120.076385', '30.317081', '2017-06-22 11:48:46', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('639', '10000000004', '120.076196', '30.316698', '2017-06-22 11:49:01', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('640', '10000000004', '120.076196', '30.316698', '2017-06-22 11:49:06', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('641', '10000000001', '120.076573', '30.316957', '2017-06-22 11:57:17', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('642', '10000000003', '120.076183', '30.316697', '2017-06-22 11:58:26', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('643', '10000000005', '120.074829', '30.31708', '2017-06-22 11:58:34', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('644', '10000000001', '120.076179', '30.317038', '2017-06-22 12:00:19', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('645', '10000000004', '120.074647', '30.316429', '2017-06-22 12:10:27', null, '浙江省杭州市西湖区紫萱路靠近浙江度豪大酒店(紫萱路188号)');
INSERT INTO `location` VALUES ('646', '10000000004', '120.074652', '30.3164', '2017-06-22 12:13:49', null, '浙江省杭州市西湖区紫萱路靠近浙江度豪大酒店(紫萱路188号)');
INSERT INTO `location` VALUES ('647', '10000000005', '120.076384', '30.317125', '2017-06-22 12:14:01', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('648', '10000000004', '120.074652', '30.3164', '2017-06-22 12:14:03', '1000000000039', '浙江省杭州市西湖区紫萱路靠近浙江度豪大酒店(紫萱路188号)');
INSERT INTO `location` VALUES ('649', '10000000004', '120.07459', '30.316332', '2017-06-22 12:20:07', null, '浙江省杭州市西湖区紫萱路靠近浙江度豪大酒店(紫萱路188号)');
INSERT INTO `location` VALUES ('650', '10000000004', '120.074679', '30.316326', '2017-06-22 12:20:52', null, '浙江省杭州市西湖区紫萱路靠近浙江度豪大酒店(紫萱路188号)');
INSERT INTO `location` VALUES ('651', '10000000005', '120.073936', '30.317115', '2017-06-22 12:27:02', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路200号)');
INSERT INTO `location` VALUES ('652', '10000000005', '120.074516', '30.317158', '2017-06-22 12:29:42', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路198号)');
INSERT INTO `location` VALUES ('653', '10000000005', '120.07393', '30.317118', '2017-06-22 12:40:16', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路200号)');
INSERT INTO `location` VALUES ('654', '10000000004', '120.075996', '30.316735', '2017-06-22 12:54:44', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('656', '10000000002', '120.075962', '30.317081', '2017-06-22 13:16:25', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('657', '10000000000', '120.076171', '30.316708', '2017-06-22 13:16:52', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('658', '10000000004', '120.076046', '30.316705', '2017-06-22 13:18:35', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('659', '10000000003', '120.076175', '30.316698', '2017-06-22 13:19:15', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('660', '10000000004', '120.076193', '30.316701', '2017-06-22 13:19:20', '1000000000040', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('661', '10000000003', '120.07555', '30.316695', '2017-06-22 13:19:29', '1000000000040', '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('662', '10000000000', '120.076172', '30.316715', '2017-06-22 13:19:38', '1000000000040', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('663', '10000000002', '120.076148', '30.31704', '2017-06-22 13:21:45', '1000000000040', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('664', '10000000002', '120.076137', '30.31704', '2017-06-22 13:22:04', '1000000000040', null);
INSERT INTO `location` VALUES ('665', '10000000000', '120.076141', '30.316702', '2017-06-22 13:22:07', '1000000000040', null);
INSERT INTO `location` VALUES ('666', '10000000004', '120.075774', '30.317079', '2017-06-22 13:22:08', '1000000000040', null);
INSERT INTO `location` VALUES ('667', '10000000001', '120.076299', '30.317223', '2017-06-22 13:22:10', '1000000000040', null);
INSERT INTO `location` VALUES ('668', '10000000003', '120.076182', '30.316701', '2017-06-22 13:22:10', '1000000000040', null);
INSERT INTO `location` VALUES ('669', '10000000001', '120.076299', '30.317223', '2017-06-22 13:22:13', '1000000000040', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('670', '10000000003', '120.076196', '30.316697', '2017-06-22 13:29:45', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('671', '10000000000', '120.076115', '30.316711', '2017-06-22 13:30:00', '1000000000040', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('672', '10000000003', '120.076196', '30.316697', '2017-06-22 13:31:48', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('673', '10000000003', '120.076189', '30.316699', '2017-06-22 13:32:09', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('674', '10000000001', '120.076587', '30.317125', '2017-06-22 13:34:16', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('675', '10000000003', '120.076136', '30.316718', '2017-06-22 13:38:16', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('676', '10000000003', '120.076136', '30.316718', '2017-06-22 13:39:44', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('677', '10000000001', '120.076165', '30.317044', '2017-06-22 13:40:26', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('678', '10000000004', '120.076161', '30.316701', '2017-06-22 13:44:15', '1000000000041', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('679', '10000000004', '120.076189', '30.3167', '2017-06-22 13:46:22', '1000000000041', null);
INSERT INTO `location` VALUES ('680', '10000000001', '120.076273', '30.317051', '2017-06-22 13:46:24', '1000000000041', null);
INSERT INTO `location` VALUES ('681', '10000000002', '120.076006', '30.317064', '2017-06-22 13:46:24', '1000000000041', null);
INSERT INTO `location` VALUES ('682', '10000000001', '120.076308', '30.317077', '2017-06-22 13:49:45', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('683', '10000000002', '120.075988', '30.317037', '2017-06-22 13:50:00', '1000000000041', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('684', '10000000001', '120.076308', '30.317077', '2017-06-22 13:50:00', '1000000000041', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('685', '10000000004', '120.076175', '30.3167', '2017-06-22 13:51:54', '1000000000041', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('686', '10000000004', '120.076175', '30.3167', '2017-06-22 13:51:54', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('687', '10000000004', '120.076175', '30.3167', '2017-06-22 13:53:14', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('688', '10000000001', '120.076169', '30.317121', '2017-06-22 13:53:35', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('689', '10000000001', '120.076054', '30.317089', '2017-06-22 13:59:16', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('690', '10000000001', '120.076159', '30.317087', '2017-06-22 14:00:00', '1000000000041', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('691', '10000000004', '120.076151', '30.316711', '2017-06-22 14:00:01', '1000000000041', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('692', '10000000004', '120.076151', '30.316711', '2017-06-22 14:00:06', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('693', '10000000001', '120.076085', '30.317074', '2017-06-22 14:02:48', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('694', '10000000003', '120.076178', '30.316697', '2017-06-22 14:03:02', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('695', '10000000002', '120.076208', '30.317024', '2017-06-22 14:03:12', '1000000000041', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('696', '10000000002', '120.076208', '30.317024', '2017-06-22 14:03:56', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('697', '10000000001', '120.076474', '30.317131', '2017-06-22 14:05:21', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('698', '10000000003', '120.076178', '30.316697', '2017-06-22 14:06:44', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('699', '10000000004', '120.076125', '30.316701', '2017-06-22 14:10:09', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('700', '10000000004', '120.076125', '30.316701', '2017-06-22 14:11:44', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('701', '10000000003', '120.076186', '30.316696', '2017-06-22 14:14:26', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('702', '10000000000', '120.076046', '30.316723', '2017-06-22 14:17:59', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('703', '10000000003', '120.076205', '30.316716', '2017-06-22 14:19:35', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('704', '10000000001', '120.076435', '30.317023', '2017-06-22 14:23:20', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('705', '10000000001', '120.076173', '30.317122', '2017-06-22 14:24:59', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('706', '10000000001', '120.076475', '30.317181', '2017-06-22 14:31:16', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('707', '10000000001', '120.076224', '30.317096', '2017-06-22 14:34:15', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('708', '10000000001', '120.076277', '30.317007', '2017-06-22 14:36:46', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('709', '10000000003', '120.075323', '30.317101', '2017-06-22 14:36:46', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号)');
INSERT INTO `location` VALUES ('710', '10000000001', '120.076155', '30.317124', '2017-06-22 14:38:18', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('711', '10000000001', '120.076131', '30.317097', '2017-06-22 14:47:22', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('712', '10000000004', '120.076161', '30.316701', '2017-06-22 14:53:07', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('713', '10000000004', '120.076161', '30.316701', '2017-06-22 14:54:07', '1000000000043', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('714', '10000000003', '120.076027', '30.316711', '2017-06-22 15:06:36', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('715', '10000000003', '120.076027', '30.316711', '2017-06-22 15:08:44', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('716', '10000000004', '120.076192', '30.316701', '2017-06-22 15:16:54', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('717', '10000000001', '120.076184', '30.317051', '2017-06-22 15:35:32', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('718', '10000000003', '120.076177', '30.31671', '2017-06-22 15:36:09', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('719', '10000000003', '120.076185', '30.316708', '2017-06-22 15:43:25', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('720', '10000000001', '120.076514', '30.317029', '2017-06-22 15:52:51', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('721', '10000000003', '120.076158', '30.316708', '2017-06-22 15:53:04', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('722', '10000000001', '120.076395', '30.317012', '2017-06-22 15:54:46', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('723', '10000000000', '120.076091', '30.316713', '2017-06-22 15:55:38', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('724', '10000000001', '120.07632', '30.317027', '2017-06-22 15:58:57', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('725', '10000000001', '120.076192', '30.317043', '2017-06-22 16:00:12', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('726', '10000000001', '120.076313', '30.317049', '2017-06-22 16:01:12', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('727', '10000000003', '120.076193', '30.3167', '2017-06-22 16:08:27', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('728', '10000000003', '120.076193', '30.3167', '2017-06-22 16:09:30', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('729', '10000000003', '120.076193', '30.3167', '2017-06-22 16:12:52', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('730', '10000000001', '120.076367', '30.317014', '2017-06-22 16:19:53', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('731', '10000000001', '120.076372', '30.317031', '2017-06-22 16:21:41', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('732', '10000000000', '120.076075', '30.316754', '2017-06-22 16:27:05', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('733', '10000000001', '120.076291', '30.317081', '2017-06-22 16:47:15', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('734', '10000000001', '120.076464', '30.317082', '2017-06-22 16:48:55', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('735', '10000000002', '120.076057', '30.317065', '2017-06-22 16:51:10', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('736', '10000000001', '120.076374', '30.31709', '2017-06-22 16:54:43', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('737', '10000000001', '120.076251', '30.317061', '2017-06-22 17:08:23', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('738', '10000000001', '120.076521', '30.317036', '2017-06-22 17:22:24', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('739', '10000000001', '120.07616', '30.317103', '2017-06-22 17:28:15', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('740', '10000000000', '120.07609', '30.316733', '2017-06-22 19:20:02', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('741', '10000000006', '120.076618', '30.317537', '2017-06-22 20:00:40', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('742', '10000000000', '120.076123', '30.31671', '2017-06-22 20:04:11', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('743', '10000000000', '120.076123', '30.31671', '2017-06-22 20:07:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('744', '10000000000', '120.074214', '30.317095', '2017-06-22 21:31:49', '1000000000046', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路198号)');
INSERT INTO `location` VALUES ('745', '10000000010', '120.077221', '30.334573', '2017-06-22 21:37:30', null, '浙江省杭州市西湖区池华街靠近杭州联合银行(新世纪支行)(池华街369号-303)');
INSERT INTO `location` VALUES ('746', '10000000010', '120.078876', '30.335859', '2017-06-22 21:37:42', '1000000000048', '浙江省杭州市西湖区池华街靠近五洞新桥(池华街408号)');
INSERT INTO `location` VALUES ('747', '10000000000', '120.082781', '30.340576', '2017-06-22 21:38:47', '1000000000048', '浙江省杭州市余杭区古墩路靠近东方本田汽车有限公司杭州培训中心(古墩路1530号)');
INSERT INTO `location` VALUES ('748', '10000000006', '120.058482', '30.372254', '2017-06-22 21:47:47', '1000000000048', '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('749', '10000000006', '120.103911', '30.399624', '2017-06-22 21:56:21', '1000000000048', '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('750', '10000000006', '120.108331', '30.411424', '2017-06-22 22:00:00', '1000000000048', '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('751', '10000000000', '120.108665', '30.411559', '2017-06-22 22:12:50', null, '浙江省杭州市余杭区木桥路靠近东港漾(木桥路72-2号)');
INSERT INTO `location` VALUES ('752', '10000000000', '120.108665', '30.411559', '2017-06-22 22:12:51', '1000000000048', '浙江省杭州市余杭区木桥路靠近东港漾(木桥路72-2号)');
INSERT INTO `location` VALUES ('753', '10000000000', '120.108665', '30.411559', '2017-06-22 22:12:51', '1000000000048', '浙江省杭州市余杭区木桥路靠近东港漾(木桥路72-2号)');
INSERT INTO `location` VALUES ('754', '10000000000', '120.108665', '30.411559', '2017-06-22 22:13:15', '1000000000048', '浙江省杭州市余杭区木桥路靠近东港漾(木桥路72-2号)');
INSERT INTO `location` VALUES ('755', '10000000000', '120.108665', '30.411559', '2017-06-22 22:13:18', '1000000000048', '浙江省杭州市余杭区木桥路靠近东港漾(木桥路72-2号)');
INSERT INTO `location` VALUES ('756', '10000000000', '120.108552', '30.412248', '2017-06-22 22:27:40', null, '浙江省杭州市余杭区木桥路靠近浙江德洛电力设备股份有限公司(木桥路72-2号)');
INSERT INTO `location` VALUES ('757', '10000000000', '120.108552', '30.412248', '2017-06-22 22:30:05', null, '浙江省杭州市余杭区木桥路靠近浙江德洛电力设备股份有限公司(木桥路72-2号)');
INSERT INTO `location` VALUES ('758', '10000000002', '120.110142', '30.332739', '2017-06-22 22:47:43', null, '中国浙江省杭州市拱墅区祥盛路靠近拱墅科创中心智汇园');
INSERT INTO `location` VALUES ('759', '10000000001', '120.076308', '30.317063', '2017-06-23 08:54:45', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('760', '10000000000', '120.076062', '30.316721', '2017-06-23 09:18:07', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('761', '10000000004', '120.076048', '30.316706', '2017-06-23 09:25:15', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('762', '10000000003', '120.076126', '30.3167', '2017-06-23 09:25:17', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('763', '10000000004', '120.076181', '30.316698', '2017-06-23 09:25:41', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('764', '10000000004', '120.076181', '30.316698', '2017-06-23 09:26:47', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('765', '10000000004', '120.076181', '30.316698', '2017-06-23 09:27:00', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('766', '10000000004', '120.076181', '30.316698', '2017-06-23 09:27:26', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('767', '10000000004', '120.076194', '30.316697', '2017-06-23 09:27:32', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('768', '10000000000', '120.076051', '30.316727', '2017-06-23 09:27:33', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('769', '10000000000', '120.076051', '30.316727', '2017-06-23 09:28:38', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('770', '10000000004', '120.076194', '30.316697', '2017-06-23 09:28:53', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('771', '10000000003', '120.075549', '30.316696', '2017-06-23 09:30:55', '1000000000052', '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('772', '10000000003', '120.075549', '30.316696', '2017-06-23 09:31:45', '1000000000052', '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('773', '10000000004', '120.076117', '30.316709', '2017-06-23 09:31:47', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('774', '10000000004', '120.076117', '30.316709', '2017-06-23 09:32:06', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('775', '10000000000', '120.076081', '30.3167', '2017-06-23 09:32:11', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('776', '10000000003', '120.075549', '30.316696', '2017-06-23 09:32:15', '1000000000052', '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('777', '10000000000', '120.076081', '30.3167', '2017-06-23 09:32:17', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('778', '10000000000', '120.076081', '30.3167', '2017-06-23 09:33:14', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('779', '10000000000', '120.076016', '30.316704', '2017-06-23 09:34:23', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('780', '10000000001', '120.076406', '30.317057', '2017-06-23 09:36:24', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('781', '10000000004', '120.07604', '30.316704', '2017-06-23 09:37:39', '1000000000052', null);
INSERT INTO `location` VALUES ('782', '10000000001', '120.079791', '30.317028', '2017-06-23 09:40:01', '1000000000052', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('783', '10000000000', '120.076019', '30.316719', '2017-06-23 09:40:01', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('784', '10000000004', '120.076171', '30.316703', '2017-06-23 09:40:01', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('785', '10000000003', '120.076173', '30.31671', '2017-06-23 09:40:01', '1000000000052', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('786', '10000000002', '120.076174', '30.317036', '2017-06-23 09:40:15', '1000000000052', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('787', '10000000001', '120.07616', '30.317125', '2017-06-23 09:46:29', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('788', '10000000002', '120.076117', '30.317074', '2017-06-23 09:50:39', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('789', '10000000001', '120.076025', '30.317094', '2017-06-23 10:06:55', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('790', '10000000000', '120.076049', '30.316725', '2017-06-23 10:09:13', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('791', '10000000001', '120.076449', '30.317185', '2017-06-23 10:11:07', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('792', '10000000003', '120.076201', '30.316702', '2017-06-23 10:11:22', '1000000000053', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('793', '10000000003', '120.076201', '30.316702', '2017-06-23 10:12:04', '1000000000053', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('794', '10000000004', '120.076173', '30.316704', '2017-06-23 10:14:01', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('795', '10000000000', '120.076094', '30.316707', '2017-06-23 10:19:51', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('796', '10000000001', '120.076396', '30.317033', '2017-06-23 10:23:07', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('797', '10000000003', '120.076178', '30.316697', '2017-06-23 10:27:52', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('798', '10000000014', '120.093303', '30.305194', '2017-06-23 10:28:09', null, '中国浙江省杭州市西湖区紫荆花北路靠近剑桥公社');
INSERT INTO `location` VALUES ('799', '10000000001', '120.076136', '30.317125', '2017-06-23 10:31:43', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('800', '10000000003', '120.076187', '30.316697', '2017-06-23 10:44:53', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('801', '10000000004', '120.076182', '30.316697', '2017-06-23 10:45:16', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('802', '10000000003', '120.076187', '30.316697', '2017-06-23 10:45:53', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('803', '10000000001', '120.076042', '30.317099', '2017-06-23 10:47:07', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('804', '10000000003', '120.076187', '30.316697', '2017-06-23 10:48:35', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('805', '10000000001', '120.07632', '30.317022', '2017-06-23 10:51:15', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('806', '10000000003', '120.076129', '30.316713', '2017-06-23 10:51:56', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('807', '10000000001', '120.076134', '30.317086', '2017-06-23 10:53:53', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('808', '10000000014', '120.093345', '30.305192', '2017-06-23 10:59:13', null, '中国浙江省杭州市西湖区紫荆花北路靠近剑桥公社');
INSERT INTO `location` VALUES ('809', '10000000001', '120.0764', '30.317057', '2017-06-23 11:01:28', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('810', '10000000003', '120.076168', '30.316707', '2017-06-23 11:16:51', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('811', '10000000001', '120.076255', '30.317042', '2017-06-23 11:17:14', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('812', '10000000000', '120.076027', '30.316704', '2017-06-23 11:17:26', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('813', '10000000011', '0', '0', '2017-06-23 11:18:15', null, '()');
INSERT INTO `location` VALUES ('814', '10000000005', '120.074829', '30.31708', '2017-06-23 11:20:00', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('815', '10000000010', '120.074829', '30.31708', '2017-06-23 11:21:25', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('816', '10000000010', '120.074829', '30.31708', '2017-06-23 11:21:26', '1000000000048', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('817', '10000000010', '120.074829', '30.31708', '2017-06-23 11:21:26', '1000000000048', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('818', '10000000001', '120.076213', '30.317033', '2017-06-23 11:22:11', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('819', '10000000003', '120.076087', '30.316712', '2017-06-23 11:27:02', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('820', '10000000000', '120.076029', '30.316719', '2017-06-23 11:28:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('821', '10000000001', '120.076449', '30.317035', '2017-06-23 11:28:58', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('822', '10000000001', '120.07615', '30.317124', '2017-06-23 11:30:22', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('823', '10000000000', '120.076029', '30.316719', '2017-06-23 11:37:36', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('824', '10000000000', '120.076005', '30.316717', '2017-06-23 11:38:11', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('825', '10000000000', '120.076005', '30.316717', '2017-06-23 11:39:07', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('826', '10000000000', '120.076057', '30.316704', '2017-06-23 11:42:03', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('827', '10000000000', '120.076057', '30.316704', '2017-06-23 11:42:53', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('828', '10000000001', '120.076232', '30.317041', '2017-06-23 11:43:55', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('829', '10000000000', '120.076019', '30.316703', '2017-06-23 11:48:23', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('830', '10000000000', '120.076055', '30.316713', '2017-06-23 11:55:37', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('831', '10000000000', '120.076055', '30.316713', '2017-06-23 11:57:17', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('832', '10000000013', '120.163368', '30.243112', '2017-06-23 11:58:35', null, '中国浙江省杭州市上城区嘉禾里靠近浙江省杭州第四中学');
INSERT INTO `location` VALUES ('833', '10000000000', '120.076055', '30.316713', '2017-06-23 11:59:35', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('834', '10000000002', '120.076256', '30.317048', '2017-06-23 12:03:14', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('835', '10000000001', '120.076365', '30.317054', '2017-06-23 12:05:27', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('836', '10000000000', '120.07614', '30.316697', '2017-06-23 12:06:31', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('837', '10000000000', '120.076054', '30.316713', '2017-06-23 12:13:41', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('838', '10000000000', '120.076054', '30.316713', '2017-06-23 12:15:16', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('839', '10000000000', '120.075992', '30.316703', '2017-06-23 12:20:47', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('840', '10000000000', '120.075992', '30.316703', '2017-06-23 12:22:21', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('841', '10000000000', '120.076068', '30.316704', '2017-06-23 12:26:44', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('842', '10000000000', '120.076183', '30.316696', '2017-06-23 12:33:36', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('843', '10000000002', '120.076266', '30.317028', '2017-06-23 13:17:22', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('844', '10000000000', '120.076062', '30.316733', '2017-06-23 13:20:28', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('845', '10000000014', '120.076375', '30.317109', '2017-06-23 13:20:46', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('846', '10000000003', '120.076038', '30.316713', '2017-06-23 13:24:19', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('847', '10000000001', '120.076278', '30.317055', '2017-06-23 13:42:52', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('848', '10000000001', '120.07649', '30.317036', '2017-06-23 13:43:49', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('849', '10000000006', '120.076222', '30.316726', '2017-06-23 13:51:11', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('850', '10000000003', '120.076181', '30.316701', '2017-06-23 13:54:06', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('851', '10000000003', '120.07619', '30.316697', '2017-06-23 14:03:50', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('852', '10000000001', '120.076362', '30.317039', '2017-06-23 14:05:36', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('853', '10000000003', '120.07618', '30.3167', '2017-06-23 14:08:50', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('854', '10000000001', '120.076175', '30.317054', '2017-06-23 14:13:12', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('855', '10000000003', '120.07617', '30.316698', '2017-06-23 14:14:19', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('856', '10000000001', '120.076166', '30.317036', '2017-06-23 14:15:13', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('857', '10000000003', '120.07617', '30.316698', '2017-06-23 14:16:17', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('858', '10000000001', '120.076306', '30.317059', '2017-06-23 14:20:03', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('859', '10000000001', '120.076273', '30.317096', '2017-06-23 14:24:05', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('860', '10000000001', '120.076392', '30.317038', '2017-06-23 14:27:36', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('861', '10000000001', '120.076464', '30.317077', '2017-06-23 14:30:21', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('862', '10000000001', '120.07612', '30.317068', '2017-06-23 14:33:42', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('863', '10000000003', '120.076175', '30.316698', '2017-06-23 14:37:55', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('864', '10000000001', '120.076255', '30.317016', '2017-06-23 14:39:38', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('865', '10000000003', '120.076175', '30.316698', '2017-06-23 14:39:46', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('866', '10000000000', '120.076377', '30.317049', '2017-06-23 14:41:07', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('867', '10000000001', '120.076443', '30.317039', '2017-06-23 14:44:39', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('868', '10000000015', '120.076122', '30.316719', '2017-06-23 14:46:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('869', '10000000001', '120.076481', '30.317026', '2017-06-23 14:47:05', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('870', '10000000015', '120.076176', '30.316702', '2017-06-23 14:48:29', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('871', '10000000001', '120.076125', '30.317067', '2017-06-23 14:50:39', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('872', '10000000003', '120.076127', '30.316709', '2017-06-23 14:54:51', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('873', '10000000003', '120.076154', '30.316706', '2017-06-23 14:55:41', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('874', '10000000001', '120.076037', '30.317092', '2017-06-23 14:55:54', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('875', '10000000003', '120.076158', '30.316707', '2017-06-23 14:57:56', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('876', '10000000003', '120.076193', '30.316696', '2017-06-23 14:59:43', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('877', '10000000001', '120.076334', '30.317059', '2017-06-23 15:01:07', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('878', '10000000003', '120.076193', '30.316696', '2017-06-23 15:04:15', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('879', '10000000004', '120.076145', '30.316698', '2017-06-23 15:05:16', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('880', '10000000003', '120.07619', '30.3167', '2017-06-23 15:20:03', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('881', '10000000003', '120.07619', '30.3167', '2017-06-23 15:21:31', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('882', '10000000001', '120.076175', '30.317048', '2017-06-23 15:21:39', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('883', '10000000001', '120.076324', '30.317056', '2017-06-23 15:24:18', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('884', '10000000001', '120.076178', '30.317058', '2017-06-23 15:27:41', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('885', '10000000000', '120.076004', '30.316707', '2017-06-23 15:27:44', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('886', '10000000001', '120.076472', '30.317091', '2017-06-23 15:29:56', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('887', '10000000003', '120.076157', '30.316698', '2017-06-23 15:34:14', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('888', '10000000003', '120.076157', '30.316698', '2017-06-23 15:35:33', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('889', '10000000001', '120.076562', '30.317129', '2017-06-23 15:38:27', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('890', '10000000001', '120.076345', '30.317043', '2017-06-23 15:47:44', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('891', '10000000002', '120.076215', '30.317048', '2017-06-23 15:48:31', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('892', '10000000003', '120.076162', '30.3167', '2017-06-23 15:49:01', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('893', '10000000001', '120.076168', '30.317048', '2017-06-23 15:54:27', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('894', '10000000003', '120.07612', '30.316719', '2017-06-23 15:55:54', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('895', '10000000003', '120.07612', '30.316719', '2017-06-23 15:57:52', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('896', '10000000002', '120.076108', '30.317054', '2017-06-23 15:59:43', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('897', '10000000001', '120.076225', '30.317034', '2017-06-23 16:00:14', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('898', '10000000003', '120.076159', '30.316718', '2017-06-23 16:03:21', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('899', '10000000001', '120.076147', '30.317126', '2017-06-23 16:03:28', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('900', '10000000003', '120.076159', '30.316718', '2017-06-23 16:03:35', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('901', '10000000003', '120.076159', '30.316718', '2017-06-23 16:05:00', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('902', '10000000001', '120.076194', '30.317059', '2017-06-23 16:06:17', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('903', '10000000003', '120.076159', '30.316718', '2017-06-23 16:06:49', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('904', '10000000003', '120.076181', '30.316696', '2017-06-23 16:10:49', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('905', '10000000001', '120.07637', '30.317043', '2017-06-23 16:11:01', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('906', '10000000001', '120.076321', '30.317057', '2017-06-23 16:12:18', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('907', '10000000001', '120.076364', '30.317025', '2017-06-23 16:13:16', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('908', '10000000001', '120.076441', '30.317022', '2017-06-23 16:16:03', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('909', '10000000001', '120.076228', '30.317034', '2017-06-23 16:23:17', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('910', '10000000001', '120.076264', '30.317092', '2017-06-23 16:24:45', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('911', '10000000001', '120.0762', '30.317046', '2017-06-23 16:25:19', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('912', '10000000001', '120.076181', '30.317089', '2017-06-23 16:26:18', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('913', '10000000003', '120.076161', '30.316713', '2017-06-23 16:33:34', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('914', '10000000000', '120.076422', '30.317068', '2017-06-23 16:50:30', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('915', '10000000000', '120.075981', '30.316757', '2017-06-23 16:52:38', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('916', '10000000000', '120.076068', '30.316783', '2017-06-23 16:52:57', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('917', '10000000001', '120.076176', '30.31706', '2017-06-23 16:58:29', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('918', '10000000000', '120.076121', '30.31671', '2017-06-23 16:59:27', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('919', '10000000003', '120.076162', '30.31671', '2017-06-23 17:00:29', '1000000000056', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('920', '10000000004', '120.076166', '30.316696', '2017-06-23 17:01:11', '1000000000056', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('921', '10000000001', '120.076393', '30.317023', '2017-06-23 17:02:46', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('922', '10000000000', '120.076151', '30.316715', '2017-06-23 17:03:26', '1000000000056', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('923', '10000000000', '120.076151', '30.316715', '2017-06-23 17:04:16', '1000000000056', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('924', '10000000000', '120.076151', '30.316715', '2017-06-23 17:04:19', '1000000000056', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('925', '10000000001', '120.076219', '30.317035', '2017-06-23 17:12:27', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('926', '10000000005', '120.07619', '30.316698', '2017-06-23 17:30:27', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('927', '10000000005', '120.076229', '30.31673', '2017-06-23 17:32:38', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('928', '10000000005', '120.076591', '30.317219', '2017-06-23 17:32:54', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街187号)');
INSERT INTO `location` VALUES ('929', '10000000005', '120.076591', '30.317219', '2017-06-23 17:33:39', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街187号)');
INSERT INTO `location` VALUES ('930', '10000000005', '120.076653', '30.317265', '2017-06-23 17:34:34', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街187号)');
INSERT INTO `location` VALUES ('931', '10000000007', '-121.999454', '37.509965', '2017-06-23 17:40:46', null, '没有格式化字符串');
INSERT INTO `location` VALUES ('932', '10000000007', '-121.999406', '37.509979', '2017-06-23 17:57:37', null, '没有格式化字符串');
INSERT INTO `location` VALUES ('933', '10000000005', '120.054784', '30.358843', '2017-06-23 18:06:56', null, '浙江省杭州市余杭区古墩路靠近起梦公园(建设中)(古墩路1888号)');
INSERT INTO `location` VALUES ('934', '10000000000', '120.076009', '30.316716', '2017-06-23 19:08:02', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('935', '10000000011', '0', '0', '2017-06-23 19:19:04', null, '()');
INSERT INTO `location` VALUES ('936', '10000000006', '120.076336', '30.317452', '2017-06-23 20:30:31', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('937', '10000000005', '119.999788', '30.245882', '2017-06-23 20:32:59', null, '浙江省杭州市余杭区王家畈路靠近九曲湾(王家畈路1号)');
INSERT INTO `location` VALUES ('938', '10000000000', '120.076001', '30.316749', '2017-06-23 20:37:33', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('939', '10000000000', '120.076001', '30.316749', '2017-06-23 20:39:17', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('940', '10000000000', '120.076021', '30.316747', '2017-06-23 21:01:48', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('941', '10000000000', '120.076021', '30.316747', '2017-06-23 21:06:12', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('942', '10000000000', '120.076005', '30.316744', '2017-06-23 21:09:49', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('943', '10000000000', '120.076038', '30.316753', '2017-06-23 21:24:06', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('944', '10000000006', '120.076126', '30.317331', '2017-06-23 21:31:05', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('945', '10000000000', '120.076047', '30.316787', '2017-06-23 21:31:56', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('946', '10000000010', '120.076063', '30.316709', '2017-06-23 21:32:39', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('947', '10000000000', '120.076041', '30.316725', '2017-06-23 21:48:27', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('948', '10000000000', '120.076045', '30.316754', '2017-06-23 21:49:24', '1000000000060', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('949', '10000000000', '120.076045', '30.316754', '2017-06-23 21:52:09', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('950', '10000000010', '120.076256', '30.31715', '2017-06-23 21:52:26', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('951', '10000000010', '120.076183', '30.316866', '2017-06-23 21:52:40', '1000000000061', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('952', '10000000000', '120.076699', '30.334284', '2017-06-23 22:06:30', null, '浙江省杭州市西湖区池华街靠近杭州联合银行(新世纪支行)(池华街369号-303)');
INSERT INTO `location` VALUES ('953', '10000000000', '120.083101', '30.338784', '2017-06-23 22:10:08', null, '浙江省杭州市余杭区池华街靠近铭雅苑文体大楼(池华街1542号)');
INSERT INTO `location` VALUES ('954', '10000000010', '120.060237', '30.359749', '2017-06-23 22:14:34', null, '浙江省杭州市余杭区网周路靠近严村里南区(网周路1888号)');
INSERT INTO `location` VALUES ('955', '10000000007', '-122.041514', '37.393974', '2017-06-24 09:35:05', null, '没有格式化字符串');
INSERT INTO `location` VALUES ('956', '10000000006', '120.090278', '30.414456', '2017-06-24 09:54:36', null, '中国浙江省杭州市余杭区西南山西路靠近王家门小区');
INSERT INTO `location` VALUES ('957', '10000000012', '115.530964', '32.039568', '2017-06-24 14:28:24', null, '河南省信阳市固始县002县道靠近万糟坊(002县道)');
INSERT INTO `location` VALUES ('958', '10000000005', '119.999772', '30.245871', '2017-06-24 15:11:28', null, '浙江省杭州市余杭区王家畈路靠近九曲湾(王家畈路1号)');
INSERT INTO `location` VALUES ('959', '10000000005', '119.999772', '30.245871', '2017-06-24 15:12:09', '1000000000032', '浙江省杭州市余杭区王家畈路靠近九曲湾(王家畈路1号)');
INSERT INTO `location` VALUES ('960', '10000000002', '120.195184', '29.724985', '2017-06-24 19:48:30', null, '中国浙江省绍兴市诸暨市宝兴路靠近新杰·新泽苑');
INSERT INTO `location` VALUES ('961', '10000000000', '120.108437', '30.412137', '2017-06-24 22:31:03', null, '浙江省杭州市余杭区木桥路靠近浙江德洛电力设备股份有限公司(木桥路72-2号)');
INSERT INTO `location` VALUES ('962', '10000000005', '119.815967', '30.444984', '2017-06-25 12:06:36', null, '浙江省杭州市余杭区横湖路靠近法凯涞玛(横湖路11号)');
INSERT INTO `location` VALUES ('963', '10000000004', '120.073298', '30.311443', '2017-06-25 14:21:44', null, '浙江省杭州市西湖区西园三路靠近乾成园(西园三路1号)');
INSERT INTO `location` VALUES ('964', '10000000003', '120.105939', '30.299536', '2017-06-25 14:36:13', null, '中国浙江省杭州市拱墅区丰潭路靠近城西银泰城');
INSERT INTO `location` VALUES ('965', '10000000004', '120.073294', '30.311448', '2017-06-25 14:59:26', null, '浙江省杭州市西湖区西园三路靠近乾成园(西园三路1号)');
INSERT INTO `location` VALUES ('966', '10000000004', '120.073313', '30.311277', '2017-06-25 15:23:38', null, '浙江省杭州市西湖区西园三路靠近乾成园(西园三路1号)');
INSERT INTO `location` VALUES ('967', '10000000000', '120.075875', '30.31675', '2017-06-25 16:19:25', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('968', '10000000003', '120.112859', '30.305212', '2017-06-25 17:14:25', null, '中国浙江省杭州市拱墅区水月街靠近欣盛·东方福邸');
INSERT INTO `location` VALUES ('969', '10000000006', '120.049519', '30.24759', '2017-06-25 17:38:36', null, '中国浙江省杭州市余杭区五常大道靠近西溪印象城');
INSERT INTO `location` VALUES ('970', '10000000006', '120.049517', '30.247591', '2017-06-25 17:39:13', null, '中国浙江省杭州市余杭区五常大道靠近西溪印象城');
INSERT INTO `location` VALUES ('971', '10000000000', '120.135004', '30.217005', '2017-06-25 18:14:30', null, '浙江省杭州市西湖区满觉陇路靠近杭州少年儿童公园(满觉陇路1-1号)');
INSERT INTO `location` VALUES ('972', '10000000003', '120.112824', '30.304969', '2017-06-25 22:39:10', null, '中国浙江省杭州市拱墅区水月街靠近欣盛·东方福邸');
INSERT INTO `location` VALUES ('973', '10000000003', '120.076227', '30.317066', '2017-06-26 08:23:19', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('974', '10000000001', '120.076401', '30.317094', '2017-06-26 08:38:43', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('975', '10000000001', '120.07644', '30.317077', '2017-06-26 08:41:17', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('976', '10000000001', '120.076282', '30.316874', '2017-06-26 09:02:33', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('977', '10000000000', '120.076078', '30.316707', '2017-06-26 09:07:12', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('978', '10000000001', '120.080308', '30.315866', '2017-06-26 09:08:42', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('979', '10000000001', '120.07608', '30.316975', '2017-06-26 09:09:22', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('980', '10000000003', '120.076133', '30.316711', '2017-06-26 09:11:43', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('981', '10000000016', '120.076196', '30.317036', '2017-06-26 09:12:35', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('982', '10000000016', '120.076196', '30.317036', '2017-06-26 09:12:36', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('983', '10000000003', '120.076156', '30.316711', '2017-06-26 09:18:09', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('984', '10000000003', '120.076156', '30.316711', '2017-06-26 09:19:14', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('985', '10000000001', '120.076428', '30.317078', '2017-06-26 09:24:59', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('986', '10000000003', '120.076191', '30.317081', '2017-06-26 09:27:08', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('987', '10000000004', '120.076171', '30.316704', '2017-06-26 09:27:30', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('988', '10000000016', '120.076446', '30.317072', '2017-06-26 09:27:32', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('989', '10000000005', '120.076431', '30.317076', '2017-06-26 09:27:51', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('990', '10000000005', '120.076419', '30.316964', '2017-06-26 09:28:11', '1000000000063', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('991', '10000000002', '120.076246', '30.317079', '2017-06-26 09:29:54', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('992', '10000000000', '120.076136', '30.31671', '2017-06-26 09:38:01', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('993', '10000000016', '120.076125', '30.317091', '2017-06-26 09:39:35', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('994', '10000000005', '120.074829', '30.31708', '2017-06-26 09:42:42', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('995', '10000000000', '120.07602', '30.316714', '2017-06-26 09:47:18', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('996', '10000000005', '120.074829', '30.31708', '2017-06-26 09:47:36', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('997', '10000000001', '120.076068', '30.317133', '2017-06-26 09:47:57', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('998', '10000000001', '120.076088', '30.31715', '2017-06-26 09:48:22', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('999', '10000000016', '120.076214', '30.317103', '2017-06-26 09:51:31', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1000', '10000000017', '120.076627', '30.317244', '2017-06-26 09:53:08', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1001', '10000000017', '120.076081', '30.317015', '2017-06-26 09:54:24', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1002', '10000000018', '120.076176', '30.317146', '2017-06-26 09:55:11', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1003', '10000000018', '120.076239', '30.317265', '2017-06-26 09:55:44', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1004', '10000000016', '120.076392', '30.317132', '2017-06-26 09:57:04', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1005', '10000000005', '120.074829', '30.31708', '2017-06-26 10:01:23', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('1006', '10000000004', '120.076157', '30.316701', '2017-06-26 10:01:38', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1007', '10000000000', '120.07609', '30.3167', '2017-06-26 10:02:04', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1008', '10000000003', '120.076226', '30.317066', '2017-06-26 10:04:17', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1009', '10000000003', '120.076293', '30.317088', '2017-06-26 10:04:39', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1010', '10000000003', '120.076452', '30.317112', '2017-06-26 10:05:29', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('1011', '10000000003', '120.076239', '30.317071', '2017-06-26 10:06:03', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1012', '10000000000', '120.076208', '30.316696', '2017-06-26 10:12:50', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1013', '10000000016', '120.076358', '30.317053', '2017-06-26 10:14:15', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1014', '10000000003', '120.076232', '30.317023', '2017-06-26 10:17:07', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1015', '10000000003', '120.076113', '30.317091', '2017-06-26 10:20:53', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1016', '10000000003', '120.076349', '30.317015', '2017-06-26 10:22:44', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1017', '10000000003', '120.076326', '30.316986', '2017-06-26 10:23:47', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1018', '10000000001', '120.076437', '30.317039', '2017-06-26 10:28:02', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1019', '10000000001', '120.076162', '30.317081', '2017-06-26 10:40:16', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1020', '10000000000', '120.076088', '30.31672', '2017-06-26 10:41:43', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1021', '10000000001', '120.076245', '30.317038', '2017-06-26 10:49:12', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1022', '10000000001', '120.076216', '30.317074', '2017-06-26 10:50:56', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1023', '10000000000', '120.075981', '30.316723', '2017-06-26 10:56:07', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1024', '10000000001', '120.076374', '30.317091', '2017-06-26 10:58:48', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1025', '10000000001', '120.076216', '30.317098', '2017-06-26 11:01:14', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1026', '10000000003', '120.076183', '30.316697', '2017-06-26 11:06:09', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1027', '10000000003', '120.075323', '30.317094', '2017-06-26 11:07:42', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号)');
INSERT INTO `location` VALUES ('1028', '10000000004', '120.076159', '30.316699', '2017-06-26 11:11:47', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1029', '10000000001', '120.07639', '30.317066', '2017-06-26 11:13:21', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1030', '10000000001', '120.076065', '30.317125', '2017-06-26 11:14:19', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1031', '10000000003', '120.076193', '30.316698', '2017-06-26 11:15:14', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1032', '10000000000', '120.076164', '30.316701', '2017-06-26 11:18:07', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1033', '10000000003', '120.076193', '30.316697', '2017-06-26 11:19:04', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1034', '10000000003', '120.076157', '30.3167', '2017-06-26 11:20:57', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1035', '10000000000', '120.076164', '30.316701', '2017-06-26 11:21:00', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1036', '10000000003', '120.076157', '30.3167', '2017-06-26 11:23:47', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1037', '10000000003', '120.07617', '30.316701', '2017-06-26 11:33:21', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1038', '10000000000', '120.076033', '30.316736', '2017-06-26 11:35:01', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1039', '10000000001', '120.076226', '30.317051', '2017-06-26 11:37:30', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1040', '10000000000', '120.076033', '30.316736', '2017-06-26 11:37:48', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1041', '10000000000', '120.076067', '30.316724', '2017-06-26 11:38:45', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1042', '10000000016', '120.076886', '30.317437', '2017-06-26 11:38:54', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('1043', '10000000000', '120.076067', '30.316724', '2017-06-26 11:42:23', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1044', '10000000003', '120.076162', '30.316719', '2017-06-26 11:45:19', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1045', '10000000001', '120.076209', '30.31704', '2017-06-26 11:49:41', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1046', '10000000000', '120.076048', '30.316709', '2017-06-26 11:51:49', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1047', '10000000003', '120.076091', '30.316705', '2017-06-26 11:52:49', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1048', '10000000001', '120.076151', '30.317085', '2017-06-26 11:59:49', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1049', '10000000003', '120.076162', '30.316709', '2017-06-26 12:02:42', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1050', '10000000006', '120.076317', '30.316969', '2017-06-26 12:20:56', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1051', '10000000004', '120.076207', '30.316703', '2017-06-26 12:47:50', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1052', '10000000004', '120.076142', '30.316716', '2017-06-26 12:58:55', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1053', '10000000004', '120.076196', '30.316706', '2017-06-26 13:04:09', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1054', '10000000000', '120.075994', '30.316748', '2017-06-26 13:13:15', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1055', '10000000000', '120.075994', '30.316748', '2017-06-26 13:14:37', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1056', '10000000001', '120.076141', '30.317033', '2017-06-26 13:39:47', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1057', '10000000001', '120.076179', '30.317016', '2017-06-26 13:46:07', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1058', '10000000003', '120.076184', '30.316696', '2017-06-26 13:46:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1059', '10000000001', '120.076395', '30.317042', '2017-06-26 13:48:31', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1060', '10000000003', '120.076184', '30.316696', '2017-06-26 13:49:33', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1061', '10000000000', '120.076006', '30.3167', '2017-06-26 13:51:51', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1062', '10000000000', '120.076006', '30.3167', '2017-06-26 13:53:32', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1063', '10000000001', '120.076189', '30.317014', '2017-06-26 13:57:26', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1064', '10000000001', '120.076144', '30.317067', '2017-06-26 14:00:52', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1065', '10000000000', '120.076026', '30.31673', '2017-06-26 14:03:07', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1066', '10000000001', '120.076383', '30.317053', '2017-06-26 14:04:51', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1067', '10000000000', '120.076116', '30.316706', '2017-06-26 14:07:07', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1068', '10000000000', '120.076116', '30.316706', '2017-06-26 14:12:03', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1069', '10000000000', '120.076025', '30.316717', '2017-06-26 14:15:08', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1070', '10000000001', '120.076104', '30.317043', '2017-06-26 14:15:21', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1071', '10000000011', '0', '0', '2017-06-26 14:24:54', null, '()');
INSERT INTO `location` VALUES ('1072', '10000000001', '120.07621', '30.317032', '2017-06-26 14:25:06', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1073', '10000000001', '120.076226', '30.31704', '2017-06-26 14:27:02', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1074', '10000000001', '120.080146', '30.315024', '2017-06-26 14:28:00', null, '中国浙江省杭州市西湖区西行路靠近杭州市西溪社区学院');
INSERT INTO `location` VALUES ('1075', '10000000002', '120.076135', '30.317051', '2017-06-26 14:33:43', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1076', '10000000001', '120.076333', '30.317034', '2017-06-26 14:43:07', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1077', '10000000001', '-122.406417', '37.785834', '2017-06-26 14:43:40', null, '没有格式化字符串');
INSERT INTO `location` VALUES ('1078', '10000000003', '120.076183', '30.316699', '2017-06-26 14:50:32', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1079', '10000000003', '120.076183', '30.316699', '2017-06-26 14:52:23', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1080', '10000000001', '-122.406417', '37.785834', '2017-06-26 14:53:33', null, '没有格式化字符串');
INSERT INTO `location` VALUES ('1081', '10000000003', '120.07615', '30.316705', '2017-06-26 15:02:51', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1082', '10000000003', '120.07615', '30.316705', '2017-06-26 15:07:42', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1083', '10000000003', '120.076193', '30.316697', '2017-06-26 15:09:46', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1084', '10000000003', '120.076159', '30.316707', '2017-06-26 15:11:31', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1085', '10000000003', '120.076189', '30.316696', '2017-06-26 16:16:53', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1086', '10000000003', '120.076189', '30.316696', '2017-06-26 16:21:17', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1087', '10000000003', '120.076188', '30.316698', '2017-06-26 16:22:16', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1088', '10000000001', '120.07664', '30.317089', '2017-06-26 16:29:20', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1089', '10000000003', '120.076205', '30.316696', '2017-06-26 16:36:05', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1090', '10000000001', '120.076118', '30.31708', '2017-06-26 16:43:37', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1091', '10000000019', '121.594461', '31.188261', '2017-06-26 16:52:47', null, '中国上海市浦东新区张衡路靠近高科苑');
INSERT INTO `location` VALUES ('1092', '10000000003', '120.076086', '30.316709', '2017-06-26 16:53:57', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1093', '10000000001', '120.07605', '30.317056', '2017-06-26 16:54:37', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1094', '10000000003', '120.076086', '30.316709', '2017-06-26 16:57:21', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1095', '10000000003', '120.07618', '30.316703', '2017-06-26 16:58:58', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1096', '10000000003', '120.07618', '30.316703', '2017-06-26 17:00:14', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1097', '10000000003', '120.07618', '30.316703', '2017-06-26 17:01:45', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1098', '10000000003', '120.07618', '30.316703', '2017-06-26 17:03:16', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1099', '10000000003', '120.076152', '30.316715', '2017-06-26 17:04:41', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1100', '10000000003', '120.076152', '30.316715', '2017-06-26 17:06:12', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1101', '10000000003', '120.076203', '30.316707', '2017-06-26 17:07:21', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1102', '10000000020', '121.450467', '29.300268', '2017-06-26 17:09:17', null, '中国浙江省宁波市宁海县兴海中路靠近御华府');
INSERT INTO `location` VALUES ('1103', '10000000003', '120.076185', '30.316698', '2017-06-26 17:11:18', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1104', '10000000019', '121.594418', '31.188318', '2017-06-26 17:13:45', '1000000000072', '中国上海市浦东新区张衡路靠近高科苑');
INSERT INTO `location` VALUES ('1105', '10000000003', '120.076185', '30.316698', '2017-06-26 17:14:00', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1106', '10000000003', '120.076187', '30.316699', '2017-06-26 17:15:05', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1107', '10000000003', '120.07555', '30.316698', '2017-06-26 17:17:45', '1000000000071', '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('1108', '10000000003', '120.07555', '30.316698', '2017-06-26 17:18:25', '1000000000071', '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('1109', '10000000003', '120.07555', '30.316698', '2017-06-26 17:18:37', '1000000000071', '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('1110', '10000000001', '120.076176', '30.317066', '2017-06-26 17:18:42', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1111', '10000000019', '121.594489', '31.188326', '2017-06-26 17:20:00', '1000000000072', '中国上海市浦东新区张衡路靠近高科苑');
INSERT INTO `location` VALUES ('1112', '10000000003', '120.076149', '30.316715', '2017-06-26 17:21:37', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1113', '10000000003', '120.076149', '30.316715', '2017-06-26 17:23:12', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1114', '10000000003', '120.076182', '30.316697', '2017-06-26 17:23:46', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1115', '10000000001', '120.076369', '30.317035', '2017-06-26 17:26:44', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1116', '10000000019', '121.594431', '31.188296', '2017-06-26 17:26:50', '1000000000072', '中国上海市浦东新区张衡路靠近高科苑');
INSERT INTO `location` VALUES ('1117', '10000000019', '121.594431', '31.188296', '2017-06-26 17:26:52', '1000000000072', '中国上海市浦东新区张衡路靠近高科苑');
INSERT INTO `location` VALUES ('1118', '10000000019', '121.594431', '31.188296', '2017-06-26 17:26:53', '1000000000072', '中国上海市浦东新区张衡路靠近高科苑');
INSERT INTO `location` VALUES ('1119', '10000000019', '121.594431', '31.188296', '2017-06-26 17:26:53', '1000000000072', '中国上海市浦东新区张衡路靠近高科苑');
INSERT INTO `location` VALUES ('1120', '10000000019', '121.594431', '31.188296', '2017-06-26 17:26:53', '1000000000072', '中国上海市浦东新区张衡路靠近高科苑');
INSERT INTO `location` VALUES ('1121', '10000000003', '120.076182', '30.316697', '2017-06-26 17:27:58', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1122', '10000000003', '120.076189', '30.316698', '2017-06-26 17:29:49', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1123', '10000000001', '120.076125', '30.317111', '2017-06-26 17:35:28', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1124', '10000000004', '120.076012', '30.316738', '2017-06-26 17:47:54', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1125', '10000000004', '120.076012', '30.316738', '2017-06-26 17:48:12', '1000000000071', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1126', '10000000004', '120.076214', '30.316696', '2017-06-26 17:48:22', '1000000000071', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1127', '10000000004', '120.076214', '30.316696', '2017-06-26 17:48:26', '1000000000071', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1128', '10000000004', '120.076214', '30.316696', '2017-06-26 17:49:47', '1000000000071', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1129', '10000000004', '120.076214', '30.316696', '2017-06-26 17:49:49', '1000000000071', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1130', '10000000019', '121.594463', '31.188299', '2017-06-26 18:25:23', '1000000000072', '没有格式化字符串');
INSERT INTO `location` VALUES ('1131', '10000000019', '121.594745', '31.191027', '2017-06-26 18:25:39', null, '中国上海市浦东新区华佗路靠近复旦大学张江校区');
INSERT INTO `location` VALUES ('1132', '10000000006', '120.0772', '30.322319', '2017-06-26 18:43:17', '1000000000072', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1133', '10000000006', '120.0772', '30.322319', '2017-06-26 18:43:17', '1000000000072', '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1134', '10000000016', '120.07813', '30.326862', '2017-06-26 18:47:59', null, '中国浙江省杭州市西湖区嘉仁路靠近同仁家园金涛港');
INSERT INTO `location` VALUES ('1135', '10000000006', '120.083239', '30.339871', '2017-06-27 08:52:10', null, '中国浙江省杭州市余杭区古墩路靠近协安蓝郡');
INSERT INTO `location` VALUES ('1136', '10000000001', '120.07635', '30.317083', '2017-06-27 09:11:37', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1137', '10000000002', '120.073689', '30.314691', '2017-06-27 09:15:55', null, '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('1138', '10000000001', '120.076172', '30.317035', '2017-06-27 09:16:46', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1139', '10000000002', '120.073689', '30.314691', '2017-06-27 09:21:22', null, '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('1140', '10000000001', '120.076226', '30.317098', '2017-06-27 09:21:29', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1141', '10000000000', '120.076059', '30.316722', '2017-06-27 09:26:12', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1142', '10000000002', '120.073689', '30.314691', '2017-06-27 09:31:03', null, '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('1143', '10000000002', '120.073689', '30.314691', '2017-06-27 09:33:12', null, '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('1144', '10000000004', '120.076218', '30.316695', '2017-06-27 09:35:43', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1145', '10000000002', '120.073689', '30.314691', '2017-06-27 09:37:32', null, '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('1146', '10000000000', '120.076091', '30.316703', '2017-06-27 09:37:48', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1147', '10000000002', '120.073689', '30.314691', '2017-06-27 09:43:18', null, '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('1148', '10000000002', '120.073689', '30.314691', '2017-06-27 09:45:19', null, '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('1149', '10000000002', '120.073689', '30.314691', '2017-06-27 09:46:57', null, '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('1150', '10000000002', '120.073689', '30.314691', '2017-06-27 09:48:47', null, '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('1151', '10000000002', '120.073689', '30.314691', '2017-06-27 09:50:19', null, '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('1152', '10000000002', '120.073689', '30.314691', '2017-06-27 09:52:14', null, '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('1153', '10000000002', '120.073689', '30.314691', '2017-06-27 09:55:19', null, '中国浙江省杭州市西湖区振华路靠近瑞鼎大厦');
INSERT INTO `location` VALUES ('1154', '10000000002', '120.075806', '30.316743', '2017-06-27 09:58:48', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1155', '10000000004', '120.076195', '30.316696', '2017-06-27 10:01:28', '1000000000075', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1156', '10000000004', '120.076195', '30.316696', '2017-06-27 10:01:43', '1000000000075', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1157', '10000000002', '120.076357', '30.31724', '2017-06-27 10:02:38', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1158', '10000000002', '120.076297', '30.317183', '2017-06-27 10:05:16', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1159', '10000000002', '120.073956', '30.31492', '2017-06-27 10:14:13', null, '中国浙江省杭州市西湖区振华路靠近浙江度豪大酒店');
INSERT INTO `location` VALUES ('1160', '10000000002', '120.076179', '30.31627', '2017-06-27 10:15:47', null, '中国浙江省杭州市西湖区振华路靠近裕华大厦');
INSERT INTO `location` VALUES ('1161', '10000000001', '120.080902', '30.321721', '2017-06-27 10:16:01', null, '中国浙江省杭州市西湖区厚仁路靠近品臣·海贝教育');
INSERT INTO `location` VALUES ('1162', '10000000002', '120.0739', '30.314825', '2017-06-27 10:16:51', null, '中国浙江省杭州市西湖区振华路靠近浙江度豪大酒店');
INSERT INTO `location` VALUES ('1163', '10000000001', '120.076143', '30.317119', '2017-06-27 10:22:21', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1164', '10000000000', '120.076028', '30.316706', '2017-06-27 10:22:27', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1165', '10000000001', '120.076375', '30.317039', '2017-06-27 10:23:19', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1166', '10000000002', '120.076188', '30.317046', '2017-06-27 10:23:33', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1167', '10000000002', '120.076291', '30.317085', '2017-06-27 10:27:49', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1168', '10000000002', '120.076206', '30.317045', '2017-06-27 10:29:07', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1169', '10000000002', '120.076067', '30.317056', '2017-06-27 10:29:39', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1170', '10000000019', '121.851469', '30.886403', '2017-06-27 10:32:36', null, '中国上海市浦东新区老芦公路靠近上海良东机械设备有限公司');
INSERT INTO `location` VALUES ('1171', '10000000005', '120.074829', '30.31708', '2017-06-27 10:39:12', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('1172', '10000000000', '120.076007', '30.316713', '2017-06-27 10:45:44', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1173', '10000000016', '120.076244', '30.31709', '2017-06-27 10:49:07', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1174', '10000000001', '120.076018', '30.317073', '2017-06-27 10:50:48', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1175', '10000000012', '115.69144', '32.18065', '2017-06-27 10:51:53', null, '河南省信阳市固始县蓼北路靠近固始一中(蓼北路140号)');
INSERT INTO `location` VALUES ('1176', '10000000003', '120.075776', '30.317085', '2017-06-27 10:52:16', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街194号)');
INSERT INTO `location` VALUES ('1177', '10000000010', '120.076044', '30.3167', '2017-06-27 10:52:39', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1178', '10000000003', '120.075776', '30.317085', '2017-06-27 10:57:07', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街194号)');
INSERT INTO `location` VALUES ('1179', '10000000003', '120.076191', '30.316697', '2017-06-27 10:57:24', '1000000000075', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1180', '10000000003', '120.076106', '30.316713', '2017-06-27 10:58:08', '1000000000074', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1181', '10000000003', '120.076106', '30.316713', '2017-06-27 10:58:24', '1000000000074', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1182', '10000000001', '120.076185', '30.317026', '2017-06-27 11:05:20', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1183', '10000000003', '120.07609', '30.31671', '2017-06-27 11:06:52', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1184', '10000000000', '120.076019', '30.316704', '2017-06-27 11:08:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1185', '10000000001', '120.076345', '30.317022', '2017-06-27 11:17:56', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1186', '10000000001', '120.076466', '30.317167', '2017-06-27 11:19:32', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('1187', '10000000001', '120.076187', '30.317066', '2017-06-27 11:26:28', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1188', '10000000001', '120.076284', '30.317077', '2017-06-27 11:28:34', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1189', '10000000001', '120.076288', '30.317017', '2017-06-27 11:30:19', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1190', '10000000001', '120.076147', '30.317118', '2017-06-27 11:33:30', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1191', '10000000000', '120.076008', '30.316713', '2017-06-27 11:35:39', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1192', '10000000001', '120.076196', '30.317026', '2017-06-27 11:42:48', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1193', '10000000000', '120.07608', '30.316716', '2017-06-27 11:44:19', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1194', '10000000001', '120.076216', '30.317034', '2017-06-27 11:52:57', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1195', '10000000010', '120.077739', '30.316733', '2017-06-27 12:03:32', null, '浙江省杭州市西湖区S14杭长高速靠近西城博司展示中心(S14杭长高速187号)');
INSERT INTO `location` VALUES ('1196', '10000000000', '120.076041', '30.316705', '2017-06-27 12:53:43', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1197', '10000000004', '120.076185', '30.316697', '2017-06-27 13:22:39', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1198', '10000000004', '120.076185', '30.316697', '2017-06-27 13:22:42', '1000000000077', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1199', '10000000000', '120.076016', '30.316734', '2017-06-27 13:29:04', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1200', '10000000000', '120.076028', '30.316746', '2017-06-27 13:40:25', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1201', '10000000001', '120.076537', '30.317073', '2017-06-27 13:46:37', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('1202', '10000000000', '120.076024', '30.316745', '2017-06-27 13:59:09', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1203', '10000000000', '120.076024', '30.316745', '2017-06-27 13:59:53', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1204', '10000000001', '120.076209', '30.317039', '2017-06-27 14:01:57', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1205', '10000000001', '120.076172', '30.317039', '2017-06-27 14:03:31', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1206', '10000000001', '120.076161', '30.317033', '2017-06-27 14:04:23', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1207', '10000000001', '120.076309', '30.317031', '2017-06-27 14:05:08', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1208', '10000000001', '120.07622', '30.317041', '2017-06-27 14:06:30', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1209', '10000000001', '120.076326', '30.317049', '2017-06-27 14:07:14', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1210', '10000000001', '120.076266', '30.317059', '2017-06-27 14:07:57', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1211', '10000000001', '120.076245', '30.317064', '2017-06-27 14:08:46', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1212', '10000000001', '120.076382', '30.317048', '2017-06-27 14:09:24', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1213', '10000000001', '120.076188', '30.31707', '2017-06-27 14:10:53', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1214', '10000000001', '120.076152', '30.31707', '2017-06-27 14:12:13', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1215', '10000000001', '120.076387', '30.317053', '2017-06-27 14:13:00', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1216', '10000000001', '120.07622', '30.317053', '2017-06-27 14:23:32', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1217', '10000000000', '120.076187', '30.316696', '2017-06-27 14:29:52', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1218', '10000000001', '120.076374', '30.317091', '2017-06-27 14:36:24', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1219', '10000000003', '120.075316', '30.317089', '2017-06-27 14:38:32', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号)');
INSERT INTO `location` VALUES ('1220', '10000000003', '120.076133', '30.316709', '2017-06-27 14:38:57', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1221', '10000000003', '120.076068', '30.31671', '2017-06-27 14:40:19', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1222', '10000000001', '120.076207', '30.317035', '2017-06-27 14:40:27', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1223', '10000000002', '120.076112', '30.317068', '2017-06-27 14:40:57', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1224', '10000000004', '120.076124', '30.316713', '2017-06-27 14:41:43', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1225', '10000000004', '120.07619', '30.316698', '2017-06-27 14:41:54', '1000000000078', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1226', '10000000004', '120.07619', '30.316698', '2017-06-27 14:42:55', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1227', '10000000003', '120.076196', '30.316706', '2017-06-27 14:44:01', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1228', '10000000003', '120.076199', '30.316696', '2017-06-27 14:44:49', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1229', '10000000003', '120.076199', '30.316696', '2017-06-27 14:45:52', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1230', '10000000000', '120.076028', '30.316727', '2017-06-27 14:46:38', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1231', '10000000001', '120.076303', '30.317061', '2017-06-27 14:46:44', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1232', '10000000003', '120.076157', '30.316707', '2017-06-27 14:47:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1233', '10000000000', '120.07605', '30.316708', '2017-06-27 14:47:48', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1234', '10000000000', '120.076087', '30.316729', '2017-06-27 14:49:05', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1235', '10000000003', '120.075545', '30.316694', '2017-06-27 14:49:06', null, '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('1236', '10000000000', '120.076087', '30.316729', '2017-06-27 14:49:20', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1237', '10000000001', '120.076396', '30.317045', '2017-06-27 14:49:46', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1238', '10000000003', '120.076176', '30.316698', '2017-06-27 14:50:49', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1239', '10000000003', '120.076162', '30.316705', '2017-06-27 14:51:19', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1240', '10000000003', '120.076129', '30.316698', '2017-06-27 14:51:42', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1241', '10000000003', '120.076151', '30.316708', '2017-06-27 14:55:13', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1242', '10000000001', '120.076219', '30.317036', '2017-06-27 14:58:08', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1243', '10000000001', '120.076111', '30.317022', '2017-06-27 15:01:10', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1244', '10000000003', '120.076178', '30.316696', '2017-06-27 15:05:08', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1245', '10000000000', '120.076012', '30.316723', '2017-06-27 15:06:23', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1246', '10000000003', '120.076178', '30.316696', '2017-06-27 15:07:04', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1247', '10000000000', '120.076059', '30.316721', '2017-06-27 15:09:08', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1248', '10000000000', '120.075997', '30.316703', '2017-06-27 15:10:11', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1249', '10000000000', '120.076018', '30.316723', '2017-06-27 15:10:49', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1250', '10000000001', '120.076215', '30.317035', '2017-06-27 15:11:07', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1251', '10000000001', '120.076489', '30.317115', '2017-06-27 15:12:47', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('1252', '10000000000', '120.076007', '30.316731', '2017-06-27 15:13:32', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1253', '10000000000', '120.075996', '30.316719', '2017-06-27 15:14:27', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1254', '10000000003', '120.076064', '30.31673', '2017-06-27 15:18:51', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1255', '10000000003', '120.076141', '30.316713', '2017-06-27 15:22:00', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1256', '10000000003', '120.075548', '30.316696', '2017-06-27 15:23:26', null, '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('1257', '10000000003', '120.075548', '30.316696', '2017-06-27 15:25:18', null, '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('1258', '10000000004', '120.076085', '30.316721', '2017-06-27 15:30:37', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1259', '10000000000', '120.076111', '30.316701', '2017-06-27 15:32:07', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1260', '10000000000', '120.076111', '30.316701', '2017-06-27 15:32:20', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1261', '10000000000', '120.076029', '30.31672', '2017-06-27 15:32:47', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1262', '10000000003', '120.076187', '30.316702', '2017-06-27 15:33:10', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1263', '10000000003', '120.076187', '30.316702', '2017-06-27 15:33:28', '1000000000082', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1264', '10000000010', '120.074829', '30.31708', '2017-06-27 15:35:34', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('1265', '10000000001', '120.076243', '30.316991', '2017-06-27 15:36:06', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1266', '10000000005', '120.074829', '30.31708', '2017-06-27 15:36:40', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('1267', '10000000001', '120.076161', '30.317081', '2017-06-27 15:40:39', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1268', '10000000003', '120.075549', '30.316697', '2017-06-27 15:42:14', null, '浙江省杭州市西湖区紫萱路靠近西城博司展示中心(紫萱路190号)');
INSERT INTO `location` VALUES ('1269', '10000000010', '120.074829', '30.31708', '2017-06-27 15:44:42', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('1270', '10000000001', '120.076034', '30.317152', '2017-06-27 15:44:55', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1271', '10000000016', '120.076531', '30.317397', '2017-06-27 15:48:45', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1272', '10000000003', '120.076128', '30.316705', '2017-06-27 15:53:54', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1273', '10000000003', '120.076128', '30.316705', '2017-06-27 15:56:21', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1274', '10000000005', '120.074829', '30.31708', '2017-06-27 15:57:28', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('1275', '10000000003', '120.076212', '30.316693', '2017-06-27 15:58:16', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1276', '10000000005', '120.074829', '30.31708', '2017-06-27 16:02:52', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('1277', '10000000005', '120.074829', '30.31708', '2017-06-27 16:03:50', '1000000000066', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('1278', '10000000001', '120.076125', '30.317071', '2017-06-27 16:05:34', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1279', '10000000016', '120.076481', '30.317481', '2017-06-27 16:06:02', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1280', '10000000006', '120.075242', '30.316949', '2017-06-27 16:06:10', null, '中国浙江省杭州市余杭区古墩路靠近协安蓝郡');
INSERT INTO `location` VALUES ('1281', '10000000005', '120.074829', '30.31708', '2017-06-27 16:06:46', '1000000000066', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('1282', '10000000006', '120.075981', '30.31709', '2017-06-27 16:06:49', null, '中国浙江省杭州市余杭区古墩路靠近协安蓝郡');
INSERT INTO `location` VALUES ('1283', '10000000006', '120.076277', '30.317098', '2017-06-27 16:08:03', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1284', '10000000005', '120.074829', '30.31708', '2017-06-27 16:08:21', '1000000000066', '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('1285', '10000000006', '120.076383', '30.317085', '2017-06-27 16:08:43', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1286', '10000000005', '120.074829', '30.31708', '2017-06-27 16:08:52', null, '浙江省杭州市西湖区紫萱路靠近三墩工商所(紫萱路196号)');
INSERT INTO `location` VALUES ('1287', '10000000001', '120.076383', '30.317081', '2017-06-27 16:09:09', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1288', '10000000001', '120.076195', '30.31702', '2017-06-27 16:09:35', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1289', '10000000005', '120.076371', '30.316916', '2017-06-27 16:10:32', '1000000000066', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1290', '10000000005', '120.076303', '30.317441', '2017-06-27 16:13:37', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1291', '10000000001', '120.076102', '30.317068', '2017-06-27 16:13:39', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1292', '10000000001', '120.076274', '30.317049', '2017-06-27 16:15:50', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1293', '10000000004', '120.075243', '30.317293', '2017-06-27 16:17:58', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街198号)');
INSERT INTO `location` VALUES ('1294', '10000000001', '120.076102', '30.317048', '2017-06-27 16:22:31', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1295', '10000000004', '120.076167', '30.317044', '2017-06-27 16:22:52', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1296', '10000000000', '120.076066', '30.316722', '2017-06-27 16:26:18', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1297', '10000000003', '120.07613', '30.31672', '2017-06-27 16:28:00', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1298', '10000000003', '120.076174', '30.316701', '2017-06-27 16:38:59', '1000000000085', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1299', '10000000003', '120.076174', '30.316701', '2017-06-27 16:40:17', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1300', '10000000001', '120.076291', '30.317082', '2017-06-27 16:42:49', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1301', '10000000000', '120.076074', '30.316738', '2017-06-27 16:44:31', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1302', '10000000001', '120.076313', '30.317033', '2017-06-27 16:47:12', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1303', '10000000001', '120.076391', '30.317053', '2017-06-27 16:48:07', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1304', '10000000000', '120.076199', '30.31671', '2017-06-27 16:49:00', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1305', '10000000001', '120.07617', '30.317052', '2017-06-27 16:50:13', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1306', '10000000002', '120.076118', '30.317077', '2017-06-27 16:53:09', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1307', '10000000001', '120.076364', '30.31703', '2017-06-27 17:00:17', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1308', '10000000000', '120.076052', '30.316713', '2017-06-27 17:03:15', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1309', '10000000002', '120.0763', '30.317063', '2017-06-27 17:03:18', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1310', '10000000002', '120.076192', '30.317062', '2017-06-27 17:06:56', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1311', '10000000000', '120.076036', '30.316767', '2017-06-27 17:07:19', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1312', '10000000000', '120.076036', '30.316767', '2017-06-27 17:07:41', '1000000000066', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1313', '10000000000', '120.076036', '30.316767', '2017-06-27 17:07:42', '1000000000066', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1314', '10000000000', '120.076036', '30.316767', '2017-06-27 17:07:43', '1000000000066', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1315', '10000000000', '120.076036', '30.316767', '2017-06-27 17:07:43', '1000000000066', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1316', '10000000002', '120.076183', '30.317069', '2017-06-27 17:08:28', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1317', '10000000002', '120.076207', '30.317064', '2017-06-27 17:16:45', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1318', '10000000003', '120.076094', '30.316706', '2017-06-27 17:16:53', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1319', '10000000003', '120.076094', '30.316706', '2017-06-27 17:18:22', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1320', '10000000002', '120.076204', '30.317061', '2017-06-27 17:20:50', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1321', '10000000003', '120.076094', '30.316706', '2017-06-27 17:21:33', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1322', '10000000002', '120.076239', '30.317076', '2017-06-27 17:25:45', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1323', '10000000000', '120.076144', '30.31673', '2017-06-27 17:27:37', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1324', '10000000000', '120.076201', '30.3167', '2017-06-27 17:29:06', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1325', '10000000000', '120.076201', '30.3167', '2017-06-27 17:29:43', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1326', '10000000000', '120.076014', '30.316732', '2017-06-27 17:30:27', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1327', '10000000000', '120.076052', '30.316715', '2017-06-27 17:31:49', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1328', '10000000000', '120.075977', '30.316745', '2017-06-27 17:33:12', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1329', '10000000002', '120.076278', '30.317056', '2017-06-27 17:33:15', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1330', '10000000000', '120.076007', '30.316732', '2017-06-27 17:33:19', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1331', '10000000000', '120.076007', '30.316732', '2017-06-27 17:33:42', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1332', '10000000002', '120.076166', '30.31707', '2017-06-27 17:35:29', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1333', '10000000000', '120.076021', '30.316732', '2017-06-27 17:35:50', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1334', '10000000002', '120.076209', '30.317062', '2017-06-27 17:38:42', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1335', '10000000000', '120.076015', '30.316721', '2017-06-27 17:39:04', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1336', '10000000000', '120.076006', '30.316729', '2017-06-27 17:42:04', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1337', '10000000002', '120.076152', '30.317083', '2017-06-27 17:42:09', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1338', '10000000003', '120.076172', '30.316713', '2017-06-27 17:44:50', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1339', '10000000002', '120.076289', '30.316902', '2017-06-27 17:45:49', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1340', '10000000002', '120.076516', '30.317009', '2017-06-27 17:47:20', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('1341', '10000000003', '120.076172', '30.316713', '2017-06-27 17:48:25', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1342', '10000000000', '120.076081', '30.316759', '2017-06-27 17:49:34', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1343', '10000000002', '120.07628', '30.317044', '2017-06-27 17:50:43', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1344', '10000000000', '120.076023', '30.31671', '2017-06-27 17:51:31', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1345', '10000000002', '120.076158', '30.317083', '2017-06-27 17:52:11', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1346', '10000000000', '120.07603', '30.316717', '2017-06-27 17:52:30', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1347', '10000000001', '120.078019', '30.316272', '2017-06-27 17:53:44', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('1348', '10000000000', '120.076008', '30.316728', '2017-06-27 17:55:42', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1349', '10000000000', '120.076031', '30.316741', '2017-06-27 18:01:01', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1350', '10000000000', '120.076139', '30.316697', '2017-06-27 18:01:54', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1351', '10000000000', '120.076082', '30.316733', '2017-06-27 18:08:20', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1352', '10000000000', '120.07609', '30.316715', '2017-06-27 18:11:04', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1353', '10000000000', '120.076025', '30.316728', '2017-06-27 18:14:00', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1354', '10000000000', '120.076043', '30.316722', '2017-06-27 18:16:42', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1355', '10000000002', '120.076346', '30.317114', '2017-06-27 18:18:25', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1356', '10000000000', '120.076118', '30.316698', '2017-06-27 18:20:46', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1357', '10000000000', '120.076049', '30.316721', '2017-06-27 18:21:23', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1358', '10000000000', '120.076129', '30.316712', '2017-06-27 18:22:29', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1359', '10000000000', '120.076023', '30.316702', '2017-06-27 18:28:09', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1360', '10000000004', '120.0762', '30.316697', '2017-06-27 18:35:47', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1361', '10000000004', '120.0762', '30.316697', '2017-06-27 18:35:54', '1000000000066', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1362', '10000000004', '120.0762', '30.316697', '2017-06-27 18:36:00', '1000000000063', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1363', '10000000004', '33', '33', '2017-06-27 18:36:37', '1000000000063', '杭州市西城博司');
INSERT INTO `location` VALUES ('1364', '10000000000', '120.076059', '30.316731', '2017-06-27 18:36:52', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1365', '10000000004', '44', '44', '2017-06-27 18:37:08', '1000000000063', null);
INSERT INTO `location` VALUES ('1366', '10000000000', '120.076125', '30.316754', '2017-06-27 18:48:55', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1367', '10000000000', '120.076051', '30.316713', '2017-06-27 19:02:05', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1368', '10000000000', '120.076118', '30.316704', '2017-06-27 19:06:57', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1369', '10000000000', '120.076072', '30.316723', '2017-06-27 19:09:33', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1370', '10000000000', '120.075999', '30.316703', '2017-06-27 19:48:45', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1371', '10000000003', '120.112252', '30.305159', '2017-06-27 20:22:36', null, '中国浙江省杭州市拱墅区水月街靠近万家花城1期');
INSERT INTO `location` VALUES ('1372', '10000000003', '120.112823', '30.304893', '2017-06-27 20:24:29', null, '中国浙江省杭州市拱墅区水月街靠近万家花城1期');
INSERT INTO `location` VALUES ('1373', '10000000003', '120.112759', '30.304863', '2017-06-27 20:24:56', null, '中国浙江省杭州市拱墅区水月街靠近万家花城1期');
INSERT INTO `location` VALUES ('1374', '10000000003', '120.11273', '30.305059', '2017-06-27 20:26:28', null, '中国浙江省杭州市拱墅区水月街靠近欣盛·东方福邸');
INSERT INTO `location` VALUES ('1375', '10000000003', '120.112765', '30.304801', '2017-06-27 20:27:18', null, '中国浙江省杭州市拱墅区水月街靠近万家花城1期');
INSERT INTO `location` VALUES ('1376', '10000000003', '120.112718', '30.304981', '2017-06-27 20:27:51', null, '中国浙江省杭州市拱墅区水月街靠近欣盛·东方福邸');
INSERT INTO `location` VALUES ('1377', '10000000003', '120.112779', '30.304991', '2017-06-27 20:29:30', null, '中国浙江省杭州市拱墅区水月街靠近欣盛·东方福邸');
INSERT INTO `location` VALUES ('1378', '10000000004', '120.073296', '30.311448', '2017-06-27 20:30:08', null, '浙江省杭州市西湖区西园三路靠近乾成园(西园三路1号)');
INSERT INTO `location` VALUES ('1379', '10000000003', '120.112837', '30.304964', '2017-06-27 20:34:29', null, '中国浙江省杭州市拱墅区水月街靠近欣盛·东方福邸');
INSERT INTO `location` VALUES ('1380', '10000000003', '120.112839', '30.304802', '2017-06-27 20:37:48', null, '中国浙江省杭州市拱墅区水月街靠近万家花城1期');
INSERT INTO `location` VALUES ('1381', '10000000003', '120.112798', '30.304998', '2017-06-27 20:49:25', null, '中国浙江省杭州市拱墅区水月街靠近欣盛·东方福邸');
INSERT INTO `location` VALUES ('1382', '10000000000', '120.075847', '30.317079', '2017-06-27 21:10:29', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街194号)');
INSERT INTO `location` VALUES ('1383', '10000000000', '120.075847', '30.317079', '2017-06-27 21:12:12', '1000000000063', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街194号)');
INSERT INTO `location` VALUES ('1384', '10000000000', '120.07602', '30.316705', '2017-06-27 21:17:47', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1385', '10000000016', '120.078343', '30.315737', '2017-06-27 21:25:31', null, '中国浙江省杭州市西湖区振华路靠近爱尚里');
INSERT INTO `location` VALUES ('1386', '10000000021', '120.101912', '30.277426', '2017-06-27 21:26:45', null, '中国浙江省杭州市西湖区古墩路靠近康乐新村');
INSERT INTO `location` VALUES ('1387', '10000000000', '120.076038', '30.316735', '2017-06-27 21:35:32', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1388', '10000000000', '120.075993', '30.31671', '2017-06-27 22:10:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1389', '10000000000', '120.075998', '30.316696', '2017-06-27 22:21:52', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1390', '10000000000', '120.075998', '30.316696', '2017-06-27 22:25:11', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1391', '10000000000', '120.076024', '30.316704', '2017-06-27 22:28:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1392', '10000000000', '120.076002', '30.316703', '2017-06-27 22:31:14', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1393', '10000000000', '120.076002', '30.316703', '2017-06-27 22:32:43', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1394', '10000000000', '120.083398', '30.338988', '2017-06-27 22:44:49', null, '浙江省杭州市余杭区池华街靠近铭雅苑文体大楼(池华街1542号)');
INSERT INTO `location` VALUES ('1395', '10000000013', '120.163384', '30.242625', '2017-06-27 23:02:37', null, '中国浙江省杭州市上城区府前街靠近浙江省杭州第四中学');
INSERT INTO `location` VALUES ('1396', '10000000006', '120.094227', '30.416488', '2017-06-28 08:25:16', null, '中国浙江省杭州市余杭区西南山南路靠近云会村综合办公楼');
INSERT INTO `location` VALUES ('1397', '10000000003', '120.076188', '30.3167', '2017-06-28 09:18:23', '1000000000087', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1398', '10000000001', '120.076565', '30.317102', '2017-06-28 09:18:26', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('1399', '10000000000', '120.07606', '30.316753', '2017-06-28 09:19:47', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1400', '10000000004', '120.075323', '30.317086', '2017-06-28 09:23:15', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号)');
INSERT INTO `location` VALUES ('1401', '10000000003', '120.076174', '30.316703', '2017-06-28 09:26:43', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1402', '10000000003', '120.076174', '30.316703', '2017-06-28 09:28:03', '1000000000087', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1403', '10000000001', '120.076155', '30.317066', '2017-06-28 09:29:49', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1404', '10000000001', '120.076208', '30.317052', '2017-06-28 09:35:30', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1405', '10000000001', '120.076177', '30.317054', '2017-06-28 09:42:00', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1406', '10000000000', '120.07605', '30.316716', '2017-06-28 09:44:00', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1407', '10000000002', '120.076165', '30.317065', '2017-06-28 09:46:17', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1408', '10000000001', '120.076275', '30.317029', '2017-06-28 10:29:07', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1409', '10000000003', '120.076139', '30.316733', '2017-06-28 10:29:24', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1410', '10000000001', '120.076509', '30.317031', '2017-06-28 10:31:16', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('1411', '10000000001', '120.076124', '30.317045', '2017-06-28 10:32:43', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1412', '10000000001', '120.076229', '30.317073', '2017-06-28 10:34:13', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1413', '10000000001', '120.076376', '30.317056', '2017-06-28 10:36:29', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1414', '10000000001', '120.076221', '30.317041', '2017-06-28 10:37:23', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1415', '10000000001', '120.076112', '30.317098', '2017-06-28 10:38:56', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1416', '10000000001', '120.076394', '30.317037', '2017-06-28 10:46:56', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1417', '10000000003', '120.07612', '30.316716', '2017-06-28 10:51:43', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1418', '10000000001', '120.076146', '30.317089', '2017-06-28 10:54:33', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1419', '10000000001', '120.083795', '30.323761', '2017-06-28 11:01:25', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1420', '10000000001', '120.076156', '30.31704', '2017-06-28 11:06:40', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1421', '10000000000', '120.076003', '30.316723', '2017-06-28 11:07:21', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1422', '10000000001', '120.076392', '30.31703', '2017-06-28 11:11:00', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1423', '10000000000', '120.076004', '30.316735', '2017-06-28 11:17:44', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1424', '10000000001', '120.076007', '30.317128', '2017-06-28 11:18:46', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1425', '10000000000', '120.076004', '30.316735', '2017-06-28 11:19:43', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1426', '10000000000', '120.07605', '30.316715', '2017-06-28 11:31:36', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1427', '10000000003', '120.076165', '30.316699', '2017-06-28 11:37:22', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1428', '10000000000', '120.07603', '30.316705', '2017-06-28 11:37:29', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1429', '10000000001', '120.076373', '30.317088', '2017-06-28 11:38:10', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1430', '10000000003', '120.076165', '30.316699', '2017-06-28 11:39:23', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1431', '10000000003', '120.076168', '30.3167', '2017-06-28 11:42:36', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1432', '10000000003', '120.07612', '30.316711', '2017-06-28 11:44:37', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1433', '10000000001', '120.076184', '30.317036', '2017-06-28 12:00:18', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1434', '10000000003', '120.076147', '30.316707', '2017-06-28 12:07:12', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1435', '10000000000', '120.076034', '30.316722', '2017-06-28 12:07:41', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1436', '10000000000', '120.075992', '30.316731', '2017-06-28 12:14:56', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1437', '10000000005', '120.076444', '30.317083', '2017-06-28 13:36:56', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1438', '10000000016', '120.076822', '30.317323', '2017-06-28 13:37:42', null, '中国浙江省杭州市西湖区振华路靠近西城博司展示中心');
INSERT INTO `location` VALUES ('1439', '10000000016', '120.076124', '30.317301', '2017-06-28 13:44:01', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1440', '10000000016', '120.076192', '30.317409', '2017-06-28 13:44:22', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1441', '10000000003', '120.076147', '30.316714', '2017-06-28 13:45:31', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1442', '10000000023', '120.076248', '30.31674', '2017-06-28 13:45:34', '1000000000090', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1443', '10000000023', '120.076248', '30.31674', '2017-06-28 13:45:35', '1000000000090', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1444', '10000000001', '120.07637', '30.317044', '2017-06-28 13:45:36', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1445', '10000000023', '120.076248', '30.31674', '2017-06-28 13:45:39', '1000000000090', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1446', '10000000023', '120.076266', '30.317094', '2017-06-28 13:47:20', '1000000000090', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1447', '10000000023', '120.076266', '30.317094', '2017-06-28 13:47:27', '1000000000090', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1448', '10000000023', '120.076266', '30.317094', '2017-06-28 13:47:27', '1000000000090', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1449', '10000000023', '120.076266', '30.317094', '2017-06-28 13:47:28', '1000000000090', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1450', '10000000023', '120.075865', '30.317086', '2017-06-28 13:48:00', '1000000000090', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街194号)');
INSERT INTO `location` VALUES ('1451', '10000000023', '120.075865', '30.317086', '2017-06-28 13:49:04', '1000000000090', '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街194号)');
INSERT INTO `location` VALUES ('1452', '10000000003', '120.076028', '30.316752', '2017-06-28 13:51:08', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1453', '10000000003', '120.076028', '30.316752', '2017-06-28 13:54:31', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1454', '10000000003', '120.076213', '30.316698', '2017-06-28 14:01:01', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1455', '10000000008', '120.077745', '30.316176', '2017-06-28 14:03:44', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1456', '10000000003', '120.076213', '30.316698', '2017-06-28 14:04:27', null, '浙江省杭州市西湖区五里堂街靠近西城博司展示中心(五里堂街196号2幢)');
INSERT INTO `location` VALUES ('1457', '10000000001', '120.08086', '30.321779', '2017-06-28 14:04:45', null, '中国浙江省杭州市西湖区振华路靠近西城博司');
INSERT INTO `location` VALUES ('1458', '10000000008', '120.080173', '30.315025', '2017-06-28 14:05:51', null, '中国浙江省杭州市西湖区振华路靠近西城博司');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` bigint(20) DEFAULT NULL,
  `receiver` bigint(20) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL COMMENT '内容',
  `create_time` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '0为未读，1为收藏，2为扔掉。',
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`) USING BTREE,
  KEY `receiver` (`receiver`) USING BTREE,
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `user` (`id`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender_id` bigint(20) NOT NULL,
  `receiver_id` bigint(20) NOT NULL,
  `state` int(11) DEFAULT '0' COMMENT '状态，0为未读，1为已读',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_ibfk_1` (`sender_id`),
  KEY `notes_ibfk_2` (`receiver_id`),
  CONSTRAINT `note_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`),
  CONSTRAINT `note_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('10', '10000000000', '10000000006', '0', '2017-06-20 21:54:56', '来！！！');
INSERT INTO `note` VALUES ('11', '10000000000', '10000000003', '1', '2017-06-20 21:56:53', '我刚刚为了测试多行，打了很多字，但是因为没有小纸条，直接没了，全都白发了，没有的时候提示购买，不要直接消失');
INSERT INTO `note` VALUES ('12', '10000000000', '10000000003', '1', '2017-06-20 21:57:40', '再测试下emoji😮😕😩😔😠😔😮😕😠😱😕😣😕😮😕😪😵😪😵😪😧😰🤒😧😨😦😨👹💤👿💀😽😻👽💀🤖💀😸😺👊👏😿👏😿😾🙏💪☝💪👌👊👇🖐✍☝💪✋💪☝👎👤👁👅👃👳👱👨💂🎅👴👬💁👬💃👨‍👩‍👦‍👦👪👨‍👩‍👦‍👦👪👪👨‍❤️‍👨👡👖👨‍👨‍👧‍👧👨‍👨‍👦👠💋👛⛑⛑🎓💍👓🐮🐨🐰🐨🐵🐨🐗🐣🐧🐌🐣🐎🐩🐎🐁🐎');
INSERT INTO `note` VALUES ('13', '10000000006', '10000000000', '1', '2017-06-21 13:14:41', '浪费');
INSERT INTO `note` VALUES ('14', '10000000004', '10000000003', '1', '2017-06-21 16:26:31', '哈哈');
INSERT INTO `note` VALUES ('18', '10000000001', '10000000000', '1', '2017-06-22 08:53:27', 'e额度达到');
INSERT INTO `note` VALUES ('19', '10000000000', '10000000006', '0', '2017-06-22 22:31:30', '我不怕浪费');
INSERT INTO `note` VALUES ('20', '10000000006', '10000000000', '1', '2017-06-22 22:32:14', '你麻痹');
INSERT INTO `note` VALUES ('21', '10000000000', '10000000006', '0', '2017-06-22 22:32:34', '干嘛？');
INSERT INTO `note` VALUES ('22', '10000000000', '10000000006', '0', '2017-06-22 22:33:00', '你是不是快没钱了？刷不动了？');
INSERT INTO `note` VALUES ('23', '10000000000', '10000000005', '1', '2017-06-22 22:33:49', '美女，约吗？');
INSERT INTO `note` VALUES ('24', '10000000000', '10000000010', '0', '2017-06-22 22:34:08', '你的性别怎么是男？');
INSERT INTO `note` VALUES ('25', '10000000010', '10000000000', '1', '2017-06-23 11:22:29', '。。。');
INSERT INTO `note` VALUES ('26', '10000000005', '10000000000', '1', '2017-06-23 11:23:28', '约');
INSERT INTO `note` VALUES ('27', '10000000006', '10000000000', '1', '2017-06-23 13:02:11', '滚滚滚滚滚');
INSERT INTO `note` VALUES ('28', '10000000001', '10000000002', '0', '2017-06-23 16:01:53', 'a啊啊啊');
INSERT INTO `note` VALUES ('29', '10000000001', '10000000002', '0', '2017-06-23 16:03:25', 's世世代代说');
INSERT INTO `note` VALUES ('30', '10000000001', '10000000003', '1', '2017-06-27 11:22:33', 's射手座');
INSERT INTO `note` VALUES ('31', '10000000000', '10000000001', '0', '2017-06-27 11:44:42', '恩');
INSERT INTO `note` VALUES ('32', '10000000005', '10000000000', '1', '2017-06-27 15:45:35', '我不是美女   约吗');
INSERT INTO `note` VALUES ('33', '10000000000', '10000000005', '0', '2017-06-27 16:55:56', '不约');

-- ----------------------------
-- Table structure for pay_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_order`;
CREATE TABLE `pay_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notify_time` datetime DEFAULT NULL COMMENT '通知时间',
  `trade_no` varchar(64) DEFAULT NULL COMMENT '支付宝交易凭证号,如果是微信则是transaction_id',
  `out_trade_no` varchar(64) DEFAULT NULL COMMENT '原支付请求的商户订单号',
  `total_amount` int(11) DEFAULT '0' COMMENT '订单金额,单位(元)',
  `refund_amount` int(11) DEFAULT '0' COMMENT '已退款的金额',
  `type` varchar(255) DEFAULT NULL COMMENT '支付方式，alipay，weixin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pay_order
-- ----------------------------
INSERT INTO `pay_order` VALUES ('25', '2017-06-16 09:49:02', '2017061621001004230258225942', '10000000001a1497577734268', '100', '100', '支付宝');
INSERT INTO `pay_order` VALUES ('26', '2017-06-16 10:13:17', '2017061621001004230258225942', '10000000001b1497579195884', '0', '100', '支付宝');
INSERT INTO `pay_order` VALUES ('27', '2017-06-16 11:19:20', '2017061621001004230258386630', '10000000001a1497583155200', '5', '5', '支付宝');
INSERT INTO `pay_order` VALUES ('28', '2017-06-16 11:19:48', '2017061621001004230258386630', '10000000001b1497583187455', '0', '3', '支付宝');
INSERT INTO `pay_order` VALUES ('29', '2017-06-16 11:20:21', '4008572001201706165947319915', '10000000001a1497583200775', '2', '2', '微信');
INSERT INTO `pay_order` VALUES ('30', '2017-06-16 11:20:37', '4008572001201706165947319915', '10000000001b1497583200775', '0', '2', '微信');
INSERT INTO `pay_order` VALUES ('31', '2017-06-16 11:23:51', '2017061621001004230258386630', '10000000001b1497583430070', '0', '2', '支付宝');
INSERT INTO `pay_order` VALUES ('32', '2017-06-16 16:37:25', '4007472001201706165993185674', '10000000006a1497602233787', '1', '1', '微信');
INSERT INTO `pay_order` VALUES ('33', '2017-06-16 16:37:54', '2017061621001004340276171193', '10000000006a1497602270555', '1', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('34', '2017-06-16 16:38:26', '4007472001201706165993185674', '10000000006b1497602233787', '0', '1', '微信');
INSERT INTO `pay_order` VALUES ('35', '2017-06-16 16:38:33', '2017061621001004340276171193', '10000000006b1497602312103', '0', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('36', '2017-06-16 16:51:48', '2017061621001004230258979329', '10000000001a1497603103098', '1', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('37', '2017-06-16 16:52:08', '4008572001201706165992206553', '10000000001a1497603118979', '2', '2', '微信');
INSERT INTO `pay_order` VALUES ('38', '2017-06-16 16:52:26', '4008572001201706165992206553', '10000000001b1497603118979', '0', '2', '微信');
INSERT INTO `pay_order` VALUES ('39', '2017-06-16 16:52:35', '2017061621001004230258979329', '10000000001b1497603154318', '0', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('40', '2017-06-16 16:53:28', '2017061621001004340276179529', '10000000006a1497603205534', '100', '100', '支付宝');
INSERT INTO `pay_order` VALUES ('41', '2017-06-16 16:54:19', '4005282001201706165993744511', '10000000005a1497603251042', '100', '0', '微信');
INSERT INTO `pay_order` VALUES ('42', '2017-06-17 17:11:15', '2017061721001004340277917408', '10000000006a1497690667702', '10000', '0', '支付宝');
INSERT INTO `pay_order` VALUES ('43', '2017-06-17 17:31:59', '4001272001201706176156820015', '10000000000a1497691913702', '100', '100', '微信');
INSERT INTO `pay_order` VALUES ('44', '2017-06-19 10:03:31', '2017061921001004610258253830', '10000000003a1497837745586', '123', '123', '支付宝');
INSERT INTO `pay_order` VALUES ('45', '2017-06-19 10:04:11', '2017061921001004610258256777', '10000000003a1497837830896', '12', '12', '支付宝');
INSERT INTO `pay_order` VALUES ('46', '2017-06-19 12:06:13', '4005282001201706196425432351', '10000000005a1497845166146', '100', '100', '微信');
INSERT INTO `pay_order` VALUES ('47', '2017-06-19 12:10:09', '4005282001201706196427136114', '10000000005a1497845402629', '100', '0', '微信');
INSERT INTO `pay_order` VALUES ('48', '2017-06-19 12:10:22', '4001272001201706176156820015', '10000000000b1497691913702', '0', '100', '微信');
INSERT INTO `pay_order` VALUES ('49', '2017-06-19 12:12:20', '4005282001201706196425432351', '10000000005b1497845166146', '0', '99', '微信');
INSERT INTO `pay_order` VALUES ('50', '2017-06-19 12:12:43', '4005282001201706196425432351', '10000000005b1497845166146', '0', '1', '微信');
INSERT INTO `pay_order` VALUES ('51', '2017-06-19 14:03:09', '2017061921001004340282537970', '10000000006a1497852185453', '5', '0', '支付宝');
INSERT INTO `pay_order` VALUES ('52', '2017-06-19 14:03:25', '2017061921001004340282541180', '10000000006a1497852200109', '10', '0', '支付宝');
INSERT INTO `pay_order` VALUES ('53', '2017-06-19 14:31:43', '2017061921001004340282572004', '10000000006a1497853900110', '20', '0', '支付宝');
INSERT INTO `pay_order` VALUES ('54', '2017-06-19 14:42:03', '2017061921001004340282612958', '10000000006a1497854518271', '80', '0', '支付宝');
INSERT INTO `pay_order` VALUES ('55', '2017-06-19 14:42:17', '2017061921001004340282603612', '10000000006a1497854532465', '170', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('56', '2017-06-19 14:51:25', '2017061921001004340282603612', '10000000006b1497855084156', '0', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('57', '2017-06-19 16:18:41', '2017061921001004070221432531', '10000000004a1497860316060', '1', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('58', '2017-06-19 16:18:55', '2017061921001004070221432531', '10000000004b1497860334070', '0', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('59', '2017-06-19 16:21:14', '4009792001201706196461170892', '10000000004a1497860467622', '1', '1', '微信');
INSERT INTO `pay_order` VALUES ('60', '2017-06-19 16:21:25', '4009792001201706196461170892', '10000000004b1497860467622', '0', '1', '微信');
INSERT INTO `pay_order` VALUES ('61', '2017-06-20 09:20:18', '2017061921001004610258253830', '10000000003b1497921617477', '0', '123', '支付宝');
INSERT INTO `pay_order` VALUES ('62', '2017-06-20 09:20:40', '2017061921001004610258256777', '10000000003b1497921639662', '0', '12', '支付宝');
INSERT INTO `pay_order` VALUES ('63', '2017-06-20 10:01:24', '2017062021001004610260336984', '10000000003c1497924084813', '0', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('64', '2017-06-20 10:01:24', '2017062021001004610260336984', '10000000003a1497924065807', '100', '100', '支付宝');
INSERT INTO `pay_order` VALUES ('65', '2017-06-20 10:02:54', '2017062021001004610260340890', '10000000003c1497924174922', '0', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('66', '2017-06-20 10:02:54', '2017062021001004610260340890', '10000000003a1497924103282', '123', '123', '支付宝');
INSERT INTO `pay_order` VALUES ('67', '2017-06-20 10:03:14', '2017062021001004610260336984', '10000000003b1497924193203', '0', '99', '支付宝');
INSERT INTO `pay_order` VALUES ('68', '2017-06-20 10:03:18', '2017062021001004610260340890', '10000000003b1497924197678', '0', '122', '支付宝');
INSERT INTO `pay_order` VALUES ('69', '2017-06-20 16:31:03', '2017062021001004010281895286', '10000000005c1497947463151', '0', '10', '支付宝');
INSERT INTO `pay_order` VALUES ('70', '2017-06-20 16:31:03', '2017062021001004010281895286', '10000000005a1497947422339', '1000', '10', '支付宝');
INSERT INTO `pay_order` VALUES ('71', '2017-06-21 14:12:44', '2017062121001004610263172310', '10000000003c1498025564944', '0', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('72', '2017-06-21 14:12:44', '2017062121001004610263172310', '10000000003a1498025513087', '100', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('73', '2017-06-21 15:09:24', '2017062121001004230269429195', '10000000001a1498028943989', '1', '0', '支付宝');
INSERT INTO `pay_order` VALUES ('74', '2017-06-21 15:16:50', '2017062121001004230269451465', '10000000001a1498029405106', '1', '0', '支付宝');
INSERT INTO `pay_order` VALUES ('75', '2017-06-21 15:18:54', '2017062121001004230269458657', '10000000001a1498029528922', '1', '0', '支付宝');
INSERT INTO `pay_order` VALUES ('76', '2017-06-22 09:57:14', '2017062221001004610264474716', '10000000003a1498096567780', '1', '0', '支付宝');
INSERT INTO `pay_order` VALUES ('77', '2017-06-22 10:02:11', '4001272001201706226854543036', '10000000000a1498096924516', '1000', '0', '微信');
INSERT INTO `pay_order` VALUES ('78', '2017-06-22 10:12:14', '2017062221001004230270559143', '10000000001c1498097534685', '0', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('79', '2017-06-22 10:12:14', '2017062221001004230270559143', '10000000001a1498097527478', '100', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('80', '2017-06-22 10:12:39', '4002802001201706226854830102', '10000000002a1498097551574', '100', '0', '微信');
INSERT INTO `pay_order` VALUES ('81', '2017-06-22 10:16:24', '4008912001201706226853299860', '10000000010a1498097777376', '100', '0', '微信');
INSERT INTO `pay_order` VALUES ('82', '2017-06-22 10:17:26', '2017062221001004070226906050', '10000000004c1498097847210', '0', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('83', '2017-06-22 10:17:26', '2017062221001004070226906050', '10000000004a1498097840944', '100', '100', '支付宝');
INSERT INTO `pay_order` VALUES ('84', '2017-06-22 10:17:48', '2017062221001004070226908956', '10000000004a1498097864466', '1', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('85', '2017-06-22 11:26:26', '2017062221001004610264643491', '10000000003a1498101915824', '3', '3', '支付宝');
INSERT INTO `pay_order` VALUES ('86', '2017-06-22 12:11:17', '2017062221001004070226906050', '10000000004b1498104676433', '0', '99', '支付宝');
INSERT INTO `pay_order` VALUES ('87', '2017-06-22 12:11:24', '2017062221001004070226908956', '10000000004b1498104683042', '0', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('88', '2017-06-23 19:13:36', '2017061621001004340276179529', '10000000006b1498216415449', '0', '100', '支付宝');
INSERT INTO `pay_order` VALUES ('89', '2017-06-26 09:51:16', '4007472001201706267466963221', '10000000006a1498441868302', '100', '0', '微信');
INSERT INTO `pay_order` VALUES ('90', '2017-06-26 12:48:28', '4009792001201706267491965485', '10000000004a1498452501256', '100', '100', '微信');
INSERT INTO `pay_order` VALUES ('91', '2017-06-26 12:48:47', '4009792001201706267491965485', '10000000004b1498452501256', '0', '100', '微信');
INSERT INTO `pay_order` VALUES ('92', '2017-06-26 00:49:07', '2017062621001004070234784145', '10000000004c1498452547694', '0', '1', '支付宝');
INSERT INTO `pay_order` VALUES ('93', '2017-06-26 00:49:07', '2017062621001004070234784145', '10000000004a1498452543467', '100', '100', '支付宝');
INSERT INTO `pay_order` VALUES ('94', '2017-06-26 12:49:19', '2017062621001004070234784145', '10000000004b1498452557698', '0', '99', '支付宝');
INSERT INTO `pay_order` VALUES ('95', '2017-06-26 17:23:27', '2017062221001004610264643491', '10000000003b1498469006202', '0', '3', '支付宝');
INSERT INTO `pay_order` VALUES ('96', '2017-06-28 10:54:46', '4008572001201706287788305936', '10000000001a1498618468221', '9900', '0', '微信');

-- ----------------------------
-- Table structure for prop
-- ----------------------------
DROP TABLE IF EXISTS `prop`;
CREATE TABLE `prop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note_count` int(11) NOT NULL DEFAULT '0' COMMENT '小纸条数量',
  `label_clear_count` int(11) NOT NULL DEFAULT '0' COMMENT '标签消除卡',
  `change_nickname_count` int(11) NOT NULL DEFAULT '0' COMMENT '改名卡',
  `vip_expire_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '会员失效时间',
  `user_id` bigint(20) NOT NULL,
  `sign_count` int(11) NOT NULL DEFAULT '0' COMMENT '补签卡',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `prop_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of prop
-- ----------------------------
INSERT INTO `prop` VALUES ('1', '0', '0', '0', '2017-07-22 14:47:22', '10000000001', '1');
INSERT INTO `prop` VALUES ('2', '2', '1', '0', '2017-06-17 10:18:29', '10000000005', '1');
INSERT INTO `prop` VALUES ('3', '3', '0', '1', '2017-07-22 15:06:54', '10000000003', '1');
INSERT INTO `prop` VALUES ('4', '6', '2', '1', '2018-06-22 15:58:31', '10000000000', '1');
INSERT INTO `prop` VALUES ('5', '1', '1', '0', '2017-07-21 16:13:31', '10000000006', '1');
INSERT INTO `prop` VALUES ('6', '0', '1', '1', '2017-06-21 16:31:42', '10000000010', '1');
INSERT INTO `prop` VALUES ('7', '1', '1', '1', '2017-06-21 18:05:23', '10000000002', '1');
INSERT INTO `prop` VALUES ('8', '0', '1', '0', '2017-06-21 20:37:06', '10000000004', '1');
INSERT INTO `prop` VALUES ('9', '1', '1', '1', '2017-06-24 11:27:54', '10000000014', '1');
INSERT INTO `prop` VALUES ('10', '1', '1', '1', '2017-06-27 09:43:05', '10000000016', '1');
INSERT INTO `prop` VALUES ('11', '1', '1', '1', '2017-06-27 16:56:41', '10000000019', '1');
INSERT INTO `prop` VALUES ('12', '1', '1', '1', '2017-06-29 13:49:53', '10000000023', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `game_id` (`game_id`) USING BTREE,
  CONSTRAINT `role_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '6', '平民');
INSERT INTO `role` VALUES ('2', '6', '预言家');
INSERT INTO `role` VALUES ('3', '6', '女巫');
INSERT INTO `role` VALUES ('4', '6', '猎人');
INSERT INTO `role` VALUES ('5', '6', '白痴');
INSERT INTO `role` VALUES ('6', '6', '守卫');
INSERT INTO `role` VALUES ('7', '6', '长老');
INSERT INTO `role` VALUES ('8', '6', '狼人');
INSERT INTO `role` VALUES ('9', '6', '野孩子');
INSERT INTO `role` VALUES ('10', '6', '丘比特');
INSERT INTO `role` VALUES ('11', '6', '盗贼');
INSERT INTO `role` VALUES ('12', '6', '混血儿');
INSERT INTO `role` VALUES ('13', '6', '法官');
INSERT INTO `role` VALUES ('14', '6', '白狼王');
INSERT INTO `role` VALUES ('15', '7', '主公');
INSERT INTO `role` VALUES ('16', '7', '忠臣');
INSERT INTO `role` VALUES ('17', '7', '反贼');
INSERT INTO `role` VALUES ('18', '7', '内奸');
INSERT INTO `role` VALUES ('20', '0', '默认');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '状态\nstate 新建:0，准备:1，进行中:2，待评价3，结束4',
  `name` varchar(64) DEFAULT NULL COMMENT '房间名称',
  `belong_circle` bigint(20) DEFAULT NULL COMMENT '所属圈子',
  `manager` bigint(20) DEFAULT NULL COMMENT '创建者',
  `place` varchar(255) DEFAULT NULL,
  `begin_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `evaluate_time` datetime DEFAULT NULL COMMENT '评价时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `password` varchar(128) DEFAULT NULL COMMENT '房间加密',
  `game` int(11) DEFAULT NULL COMMENT '活动类型',
  `money` int(11) DEFAULT '0' COMMENT '保证金',
  `member_count` int(11) DEFAULT '0' COMMENT '人数',
  `man_count` int(11) DEFAULT '0' COMMENT '男子人数',
  `woman_count` int(11) DEFAULT '0' COMMENT '女子人数',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  `join_member` int(11) DEFAULT '0' COMMENT '已经加入的人数',
  `join_man_member` int(11) DEFAULT '0' COMMENT '已经加入的男生人数',
  `join_woman_member` int(11) DEFAULT '0' COMMENT '已经加入的女生的人数',
  `longitude` double DEFAULT '0' COMMENT '经度',
  `latitude` double DEFAULT '0' COMMENT '纬度',
  `locked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有密码',
  `city` varchar(255) DEFAULT '',
  `prepare_time` timestamp NULL DEFAULT NULL COMMENT '房主点击开始的时间',
  `open` tinyint(1) DEFAULT '1' COMMENT '是否在组队大厅中显示',
  `game_mode` int(11) DEFAULT '0' COMMENT '模式，0为娱乐模式，1为竞技模式。',
  `remaining_money` int(11) DEFAULT '0' COMMENT '活动结束后剩余的资金(从缺席的人中扣除)',
  PRIMARY KEY (`id`),
  KEY `creator` (`manager`) USING BTREE,
  KEY `game` (`game`) USING BTREE,
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`manager`) REFERENCES `user` (`id`),
  CONSTRAINT `room_ibfk_2` FOREIGN KEY (`game`) REFERENCES `game` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000000091 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1000000000003', '4', '狼人杀一', null, '10000000001', '振华路7号教师宿舍楼', '2017-05-20 10:10:00', '2017-06-16 21:56:42', '2017-05-20 11:10:00', '2017-05-19 09:09:33', null, '6', '0', '2', '0', '0', '呃点点滴滴', '2', '2', '0', '120.083683', '30.317144', '0', '杭州市', '2017-05-19 11:28:28', '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000006', '4', '狼人杀', null, '10000000005', '永久广告设计部', '2017-06-16 16:40:00', '2017-06-16 23:00:00', '2017-06-16 17:00:00', '2017-06-16 16:26:47', null, '6', '0', '2', '0', '0', '暂无介绍', '2', '2', '0', '120.0785', '30.318006', '0', '杭州市', '2017-06-16 16:37:58', '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000008', '4', '乒乓球', null, '10000000005', '大朵餐厅', '2017-06-16 17:10:00', '2017-06-16 23:20:00', '2017-06-16 17:20:00', '2017-06-16 16:57:43', null, '16', '100', '2', '0', '0', '暂无介绍', '2', '2', '0', '120.074829', '30.316986', '0', '杭州市', '2017-06-16 17:00:34', '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000009', '4', '来吧狼人杀', null, '10000000001', '西城博司', '2017-06-16 18:10:00', '2017-06-17 14:00:00', '2017-06-16 19:10:00', '2017-06-16 17:02:32', null, '6', '0', '3', '0', '0', '暂无介绍', '3', '3', '0', '120.076294', '30.317108', '0', '杭州市', '2017-06-16 17:38:16', '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000013', '4', '追忆狼人杀', null, '10000000006', '追忆咖啡', '2017-06-17 20:30:00', '2017-06-18 14:00:00', '2017-06-17 23:00:00', '2017-06-17 17:13:25', null, '6', '100', '2', '0', '0', '不来是狗', '2', '2', '0', '120.054872', '30.382838', '0', '杭州市', '2017-06-17 17:36:40', '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000020', '4', '狼人杀吧', null, '10000000001', '兰州拉面', '2017-06-20 14:20:00', '2017-06-21 00:30:00', '2017-06-20 18:30:00', '2017-06-20 13:22:17', null, '6', '0', '2', '0', '0', '', '2', '2', '0', '120.075948', '30.317687', '0', '杭州市', '2017-06-20 13:25:20', '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000024', '4', '象棋', null, '10000000005', '大朵餐厅', '2017-06-20 16:50:00', '2017-06-20 23:10:00', '2017-06-20 17:10:00', '2017-06-20 16:38:18', null, '10', '1000', '2', '0', '0', '暂无介绍', '2', '2', '0', '120.074829', '30.316986', '0', '杭州市', '2017-06-20 16:40:57', '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000029', '4', '足球', null, '10000000000', '汉承装饰', '2017-06-20 18:30:00', '2017-06-21 00:50:00', '2017-06-20 18:50:00', '2017-06-20 18:16:20', null, '13', '0', '7', '0', '0', '暂无介绍', '7', '5', '2', '120.075989', '30.316461', '0', '杭州市', '2017-06-20 18:19:27', '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000031', '0', '欧洲度假一周', null, '10000000000', '杭州萧山国际机场', '2017-10-01 10:00:00', '2017-10-08 08:00:00', '2017-10-07 19:00:00', '2017-06-20 21:51:30', null, '29', '0', '2', '1', '1', '萌萌哒小妹妹呢？', '2', '1', '1', '120.435079', '30.234366', '0', '杭州市', null, '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000035', '4', '象棋', null, '10000000004', '西城博司', '2017-06-22 10:10:00', '2017-06-22 16:20:00', '2017-06-22 10:20:00', '2017-06-22 09:53:49', null, '10', '0', '2', '0', '0', '暂无介绍', '2', '2', '0', '120.075389', '30.316934', '0', '杭州市', '2017-06-22 09:57:21', '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000036', '4', '八人生推狼人杀', null, '10000000000', '汉承装饰', '2017-06-22 10:30:00', '2017-06-22 16:20:00', '2017-06-22 12:10:00', '2017-06-22 10:11:20', null, '6', '100', '8', '0', '0', '暂无介绍', '8', '6', '2', '120.075989', '30.316461', '0', '杭州市', '2017-06-22 10:20:54', '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000040', '4', '五人斗地主', null, '10000000000', '汉承装饰', '2017-06-22 13:30:00', '2017-06-22 19:40:00', '2017-06-22 13:40:00', '2017-06-22 13:19:14', null, '8', '0', '5', '0', '0', '暂无介绍哈哈哈哈哈哈', '1', '1', '0', '120.075989', '30.316461', '0', '杭州市', '2017-06-22 13:21:38', '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000041', '4', '测试麻将', null, '10000000004', '西城博司', '2017-06-22 14:00:00', '2017-06-22 20:10:00', '2017-06-22 14:10:00', '2017-06-22 13:43:54', null, '9', '0', '3', '0', '0', '暂无介绍', '3', '2', '1', '120.075389', '30.316934', '0', '杭州市', '2017-06-22 13:46:15', '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000048', '4', '三人象棋顺便剃头', null, '10000000000', '阿美理发(西南山东路)', '2017-06-22 22:00:00', '2017-06-23 08:00:00', '2017-06-22 22:30:00', '2017-06-22 21:37:18', null, '10', '1', '3', '0', '0', '暂无介绍', '3', '2', '1', '120.094208', '30.416533', '0', '杭州市', '2017-06-22 21:40:47', '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000052', '4', '五人象棋', null, '10000000000', '西城博司', '2017-06-23 09:40:00', '2017-06-23 10:20:00', '2017-06-23 09:40:00', '2017-06-23 09:24:58', 'E10ADC3949BA59ABBE56E057F20F883E', '10', '0', '5', '0', '0', '暂无介绍，。？！～？。。', '5', '4', '1', '120.075389', '30.316934', '1', '杭州市', '2017-06-23 09:36:23', '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000063', '0', '狼人杀好玩吗？', null, '10000000000', '竹径云山', '2017-06-29 22:00:00', '2017-07-01 08:00:00', '2017-06-30 22:00:00', '2017-06-24 22:34:06', null, '6', '0', '5', '0', '0', '暂无介绍', '2', '2', '0', '120.004952', '30.352088', '0', '杭州市', null, '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000070', '0', '篮球', '100000000001', '10000000003', '刻度标识', '2017-06-30 18:00:00', '2017-07-01 21:00:00', '2017-07-01 15:00:00', '2017-06-26 15:04:38', null, '12', '0', '2', '0', '0', '暂无介绍', '2', '2', '0', '120.076083', '30.317106', '0', '杭州市', null, '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000072', '4', '一起哈啤', null, '10000000019', '天屿山顶别墅(北山街)', '2017-06-26 17:30:00', '2017-06-27 20:00:00', '2017-06-27 14:00:00', '2017-06-26 17:05:06', null, '21', '0', '2', '0', '0', '暂无介绍', '2', '2', '0', '120.138846', '30.253121', '0', '杭州', '2017-06-26 17:09:47', '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000087', '0', '明年去欧洲住一年吧', null, '10000000000', '杭州萧山国际机场', '2018-10-01 00:00:00', '2019-10-01 08:00:00', '2019-10-01 00:00:00', '2017-06-27 21:45:06', null, '29', '50', '2', '1', '1', '🙄', '1', '1', '0', '120.437104', '30.23521', '0', '杭州市', null, '1', '0', '0');
INSERT INTO `room` VALUES ('1000000000090', '0', '1', null, '10000000006', '兰州拉面', '2017-06-28 14:40:00', '2017-06-28 23:40:00', '2017-06-28 17:40:00', '2017-06-28 13:39:51', null, '6', '10000', '12', '0', '0', '暂无介绍', '2', '2', '0', '120.075948', '30.317687', '0', '杭州市', null, '1', '0', '0');

-- ----------------------------
-- Table structure for room_evalutation
-- ----------------------------
DROP TABLE IF EXISTS `room_evalutation`;
CREATE TABLE `room_evalutation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_id` bigint(20) NOT NULL,
  `other_id` bigint(20) NOT NULL,
  `point` double NOT NULL COMMENT '给成员在游戏中表现的评价分数',
  `room_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_id` (`owner_id`,`other_id`,`room_id`),
  KEY `other_id` (`other_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `room_evalutation_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  CONSTRAINT `room_evalutation_ibfk_2` FOREIGN KEY (`other_id`) REFERENCES `user` (`id`),
  CONSTRAINT `room_evalutation_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of room_evalutation
-- ----------------------------

-- ----------------------------
-- Table structure for room_member
-- ----------------------------
DROP TABLE IF EXISTS `room_member`;
CREATE TABLE `room_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room` bigint(20) NOT NULL COMMENT '房间',
  `member` bigint(20) NOT NULL COMMENT '成员',
  `point` int(11) NOT NULL DEFAULT '0' COMMENT '用户在房间表现的最终得分',
  `result` int(11) NOT NULL DEFAULT '0' COMMENT '如果是三国杀或狼人杀,围棋和象棋,胜为3,平为2,负为1;如果是麻将或扑克,A为7,B为6,C为5,D为4',
  `game` int(11) NOT NULL COMMENT '游戏分类',
  `nickname` varchar(64) DEFAULT '',
  `ready` tinyint(1) DEFAULT NULL COMMENT '是否准备开始',
  `longitude` double DEFAULT '0',
  `latitude` double DEFAULT '0',
  `is_evaluated` tinyint(1) NOT NULL DEFAULT '0',
  `is_attend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否出发',
  `is_signed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否签到过',
  `request_not_late` tinyint(1) NOT NULL DEFAULT '0' COMMENT '请求没有迟到',
  `deal_state` int(1) NOT NULL DEFAULT '0' COMMENT '管理员处理为迟到的余额。0为未处理，1为分发，2为返回到账户',
  `is_lock_money` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否冻结金额',
  `is_online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在线',
  PRIMARY KEY (`id`),
  UNIQUE KEY `room` (`room`,`member`) USING BTREE,
  KEY `member` (`member`) USING BTREE,
  KEY `room_member_ibfk_4` (`game`) USING BTREE,
  CONSTRAINT `room_member_ibfk_2` FOREIGN KEY (`member`) REFERENCES `user` (`id`),
  CONSTRAINT `room_member_ibfk_4` FOREIGN KEY (`game`) REFERENCES `game` (`id`),
  CONSTRAINT `room_member_ibfk_5` FOREIGN KEY (`room`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1197 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of room_member
-- ----------------------------
INSERT INTO `room_member` VALUES ('700', '1000000000003', '10000000001', '0', '0', '6', '张国文', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('707', '1000000000003', '10000000000', '0', '0', '6', 'Key', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('716', '1000000000006', '10000000005', '0', '0', '6', '鹏杰', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('717', '1000000000006', '10000000006', '0', '0', '6', '呵呵', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('719', '1000000000008', '10000000005', '0', '0', '16', '鹏杰', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('720', '1000000000008', '10000000006', '0', '0', '16', '呵呵', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('721', '1000000000009', '10000000001', '-5', '0', '6', '张国文', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('727', '1000000000009', '10000000006', '15', '0', '6', '呵呵', '1', '120.076452', '30.317369', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('728', '1000000000009', '10000000005', '5', '0', '6', '鹏杰', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('733', '1000000000013', '10000000006', '0', '0', '6', '呵呵', '1', '120.054622', '30.382813', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('735', '1000000000013', '10000000000', '0', '0', '6', 'Key', '1', '120.054813', '30.382911', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('756', '1000000000020', '10000000001', '0', '0', '6', '张国文', '1', '120.080969', '30.315355', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('758', '1000000000020', '10000000000', '0', '0', '6', 'Key', '1', '120.076192', '30.316701', '1', '1', '1', '1', '2', '0', '0');
INSERT INTO `room_member` VALUES ('768', '1000000000024', '10000000005', '0', '0', '10', '鹏杰', '1', '120.074829', '30.31708', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('770', '1000000000024', '10000000006', '0', '0', '10', '呵呵', '1', '0', '0', '1', '1', '0', '1', '2', '0', '0');
INSERT INTO `room_member` VALUES ('779', '1000000000029', '10000000000', '15', '0', '13', 'Key', '1', '120.07609', '30.316723', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('780', '1000000000029', '10000000002', '-15', '0', '13', 'xml', '1', '120.073689', '30.314691', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('781', '1000000000029', '10000000003', '5', '0', '13', '徐强', '1', '120.076181', '30.31671', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('782', '1000000000029', '10000000006', '-5', '0', '13', '呵呵', '1', '120.076329', '30.317095', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('783', '1000000000029', '10000000010', '35', '0', '13', '小丸子', '1', '120.074829', '30.31708', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('784', '1000000000029', '10000000004', '25', '0', '13', '马健原', '1', '120.07617', '30.316699', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('785', '1000000000029', '10000000001', '-25', '0', '13', '张国文', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('787', '1000000000031', '10000000000', '0', '0', '29', 'Key', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('822', '1000000000035', '10000000004', '0', '0', '10', '马健原-测试', '1', '120.076146', '30.316711', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('823', '1000000000035', '10000000000', '0', '0', '10', 'Key', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('827', '1000000000036', '10000000000', '30', '0', '6', 'Key', '1', '0', '0', '1', '0', '0', '1', '2', '0', '0');
INSERT INTO `room_member` VALUES ('832', '1000000000036', '10000000003', '-10', '0', '6', '徐强', '1', '120.076157', '30.31671', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('833', '1000000000036', '10000000002', '0', '0', '6', 'xml', '1', '120.076136', '30.31705', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('834', '1000000000036', '10000000001', '20', '0', '6', '低调 赵瑞龙', '1', '120.07636', '30.317119', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('835', '1000000000036', '10000000005', '10', '0', '6', '鹏杰', '1', '120.074829', '30.31708', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('837', '1000000000036', '10000000006', '-30', '0', '6', '呵呵', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('838', '1000000000036', '10000000010', '40', '0', '6', '小丸子', '1', '120.0764', '30.317093', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('840', '1000000000036', '10000000004', '-20', '0', '6', '马健原-测试', '1', '120.076468', '30.317104', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('865', '1000000000040', '10000000000', '0', '0', '8', 'Key', '1', '120.076141', '30.316702', '0', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('875', '1000000000041', '10000000004', '-5', '0', '9', '马健原-测试', '1', '120.076189', '30.3167', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('876', '1000000000041', '10000000002', '15', '0', '9', 'xml', '1', '120.076006', '30.317064', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('877', '1000000000041', '10000000001', '5', '0', '9', '低调 赵瑞龙', '1', '120.076273', '30.317051', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('894', '1000000000048', '10000000000', '5', '0', '10', 'Key', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('895', '1000000000048', '10000000010', '15', '0', '10', '小丸子', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('896', '1000000000048', '10000000006', '-5', '0', '10', '呵呵', '1', '120.109484', '30.411057', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('901', '1000000000052', '10000000000', '5', '0', '10', 'Key', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('907', '1000000000052', '10000000002', '-15', '0', '10', 'xml', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('908', '1000000000052', '10000000001', '-5', '0', '10', '低调 赵瑞龙', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('909', '1000000000052', '10000000003', '15', '0', '10', '徐强', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('910', '1000000000052', '10000000004', '25', '0', '10', '马健原-测试', '1', '120.07604', '30.316704', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('944', '1000000000031', '10000000002', '0', '0', '29', 'xml', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('947', '1000000000063', '10000000000', '0', '0', '6', 'Key', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('1001', '1000000000070', '10000000003', '0', '0', '12', '徐强', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('1022', '1000000000072', '10000000019', '0', '0', '21', '陈属', '1', '121.594466', '31.188314', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('1024', '1000000000072', '10000000006', '0', '0', '21', '天天', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('1102', '1000000000070', '10000000000', '0', '0', '12', 'Key', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `room_member` VALUES ('1178', '1000000000087', '10000000000', '0', '0', '29', 'Key', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `room_member` VALUES ('1185', '1000000000063', '10000000003', '0', '0', '6', '徐强', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `room_member` VALUES ('1190', '1000000000090', '10000000006', '0', '0', '6', '天天', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `room_member` VALUES ('1196', '1000000000090', '10000000008', '0', '0', '6', '原来我不帅', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for smscode
-- ----------------------------
DROP TABLE IF EXISTS `smscode`;
CREATE TABLE `smscode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone` varchar(16) NOT NULL,
  `smscode` varchar(16) DEFAULT NULL,
  `expiration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of smscode
-- ----------------------------
INSERT INTO `smscode` VALUES ('25', '18698569593', '158544', '2017-05-12 19:52:33');
INSERT INTO `smscode` VALUES ('26', '15516517017', '405247', '2017-05-23 16:24:19');
INSERT INTO `smscode` VALUES ('27', '17702525841', '603270', '2017-06-27 16:34:57');
INSERT INTO `smscode` VALUES ('28', '15869173715', '494994', '2017-05-19 14:11:37');
INSERT INTO `smscode` VALUES ('29', '18758183175', '746196', '2017-06-27 16:37:47');
INSERT INTO `smscode` VALUES ('31', '18888970265', '308741', '2017-06-27 16:32:06');
INSERT INTO `smscode` VALUES ('32', '18066823366', '732615', '2017-05-19 14:57:42');
INSERT INTO `smscode` VALUES ('33', '18069823366', '298062', '2017-06-21 18:59:59');
INSERT INTO `smscode` VALUES ('34', '13148473941', '621501', '2017-06-16 10:53:09');
INSERT INTO `smscode` VALUES ('35', '18768198055', '269575', '2017-06-27 11:27:32');
INSERT INTO `smscode` VALUES ('36', '17630913798', '317439', '2017-06-21 06:48:12');
INSERT INTO `smscode` VALUES ('37', '13645818682', '128527', '2017-06-22 10:22:21');
INSERT INTO `smscode` VALUES ('38', '18606756766', '589255', '2017-06-23 10:55:11');
INSERT INTO `smscode` VALUES ('39', '13858195001', '746240', '2017-06-26 10:22:01');
INSERT INTO `smscode` VALUES ('40', '18201738382', '219180', '2017-06-26 17:20:59');
INSERT INTO `smscode` VALUES ('42', '13780063733', '481846', '2017-06-26 17:37:22');
INSERT INTO `smscode` VALUES ('43', '13646738966', '640393', '2017-06-28 11:34:39');

-- ----------------------------
-- Table structure for suggestion
-- ----------------------------
DROP TABLE IF EXISTS `suggestion`;
CREATE TABLE `suggestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(256) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `suggestion_ibfk_1` (`user`) USING BTREE,
  CONSTRAINT `suggestion_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of suggestion
-- ----------------------------
INSERT INTO `suggestion` VALUES ('8', '杭州', '2017-05-19 14:47:29', '10000000001');
INSERT INTO `suggestion` VALUES ('9', '小计', '2017-06-28 13:46:28', '10000000023');

-- ----------------------------
-- Table structure for transaction_details
-- ----------------------------
DROP TABLE IF EXISTS `transaction_details`;
CREATE TABLE `transaction_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `money` int(11) DEFAULT NULL COMMENT '交易金额',
  `create_time` datetime DEFAULT NULL,
  `user` bigint(20) NOT NULL,
  `is_calc` tinyint(4) DEFAULT '1' COMMENT '是否参与计算(从冻结余额中扣除的部分不计算)',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `transaction_details_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of transaction_details
-- ----------------------------
INSERT INTO `transaction_details` VALUES ('28', '支付宝充值', '100', '2017-06-16 09:49:03', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('29', '支付宝退款', '-100', '2017-06-16 10:13:17', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('30', '支付宝充值', '5', '2017-06-16 11:19:21', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('31', '支付宝退款', '-3', '2017-06-16 11:19:48', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('32', '微信充值', '2', '2017-06-16 11:20:21', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('33', '微信退款', '-2', '2017-06-16 11:20:37', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('34', '支付宝退款', '-2', '2017-06-16 11:23:51', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('35', '微信充值', '1', '2017-06-16 16:37:25', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('36', '支付宝充值', '1', '2017-06-16 16:37:54', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('37', '微信退款', '-1', '2017-06-16 16:38:26', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('38', '支付宝退款', '-1', '2017-06-16 16:38:33', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('39', '支付宝充值', '1', '2017-06-16 16:51:49', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('40', '微信充值', '2', '2017-06-16 16:52:08', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('41', '微信退款', '-2', '2017-06-16 16:52:26', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('42', '支付宝退款', '-1', '2017-06-16 16:52:35', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('43', '支付宝充值', '100', '2017-06-16 16:53:29', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('44', '微信充值', '100', '2017-06-16 16:54:19', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('45', '成为房主，冻结保证金。', '-100', '2017-06-16 16:57:43', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('46', '准备开始，冻结保证金。', '-100', '2017-06-16 16:58:08', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('47', '活动结束，因缺席扣除保证金。', '-100', '2017-06-23 17:46:43', '10000000005', '0');
INSERT INTO `transaction_details` VALUES ('48', '活动结束，因缺席扣除保证金。', '-100', '2017-06-23 17:46:43', '10000000006', '0');
INSERT INTO `transaction_details` VALUES ('49', '支付宝充值', '10000', '2017-06-17 17:11:15', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('50', '成为房主，冻结保证金。', '-100', '2017-06-17 17:13:25', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('51', '微信充值', '100', '2017-06-17 17:31:59', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('52', '准备开始，冻结保证金。', '-100', '2017-06-17 17:32:10', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('53', '活动结束，解冻保证金', '100', '2017-06-17 23:00:00', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('54', '活动结束，解冻保证金', '100', '2017-06-17 23:00:00', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('55', '支付宝充值', '123', '2017-06-19 10:03:32', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('56', '支付宝充值', '12', '2017-06-19 10:04:11', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('57', '成为房主，冻结保证金。', '-100', '2017-06-19 10:11:56', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('58', '准备开始，冻结保证金。', '-100', '2017-06-19 10:26:58', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('59', '取消准备，解冻保证金', '100', '2017-06-19 10:27:06', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('60', '准备开始，冻结保证金。', '-100', '2017-06-19 10:27:10', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('61', '取消准备，解冻保证金。', '100', '2017-06-19 10:50:00', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('62', '取消准备，解冻保证金。', '100', '2017-06-19 10:50:00', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('63', '微信充值', '100', '2017-06-19 12:06:13', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('64', '微信充值', '100', '2017-06-19 12:10:09', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('65', '微信退款', '-100', '2017-06-19 12:10:22', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('66', '微信退款', '-99', '2017-06-19 12:12:20', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('67', '微信退款', '-1', '2017-06-19 12:12:43', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('68', '支付宝充值', '5', '2017-06-19 14:03:09', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('69', '支付宝充值', '10', '2017-06-19 14:03:25', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('70', '支付宝充值', '20', '2017-06-19 14:31:44', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('71', '支付宝充值', '80', '2017-06-19 14:42:03', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('72', '支付宝充值', '170', '2017-06-19 14:42:17', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('73', '支付宝退款', '-1', '2017-06-19 14:51:25', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('74', '支付宝充值', '1', '2017-06-19 16:18:42', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('75', '支付宝退款', '-1', '2017-06-19 16:18:55', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('76', '微信充值', '1', '2017-06-19 16:21:14', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('77', '微信退款', '-1', '2017-06-19 16:21:25', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('78', '支付宝退款', '-123', '2017-06-20 09:20:18', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('79', '支付宝退款', '-12', '2017-06-20 09:20:40', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('80', '支付宝充值', '100', '2017-06-20 10:01:25', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('81', '支付宝服务费', '-1', '2017-06-20 10:01:25', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('82', '支付宝充值', '123', '2017-06-20 10:02:55', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('83', '支付宝服务费', '-1', '2017-06-20 10:02:55', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('84', '支付宝退款', '-99', '2017-06-20 10:03:14', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('85', '支付宝退款', '-122', '2017-06-20 10:03:18', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('86', '成为房主，冻结保证金。', '-1000', '2017-06-20 16:27:20', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('87', '支付宝充值', '1000', '2017-06-20 16:31:03', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('88', '支付宝服务费', '-10', '2017-06-20 16:31:03', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('89', '准备开始，冻结保证金。', '-1000', '2017-06-20 16:31:48', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('90', '取消准备，冻结保证金。', '1000', '2017-06-20 16:34:03', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('91', '准备开始，冻结保证金。', '-1000', '2017-06-20 16:35:43', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('92', '取消准备，解冻保证金', '1000', '2017-06-20 16:36:36', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('93', '准备开始，冻结保证金。', '-1000', '2017-06-20 16:36:43', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('94', '取消准备，解冻保证金', '1000', '2017-06-20 16:36:51', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('95', '取消准备，解冻保证金。', '1000', '2017-06-20 16:37:29', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('96', '成为房主，冻结保证金。', '-1000', '2017-06-20 16:38:18', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('97', '准备开始，冻结保证金。', '-1000', '2017-06-20 16:38:55', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('98', '活动结束，解冻保证金', '1000', '2017-06-20 17:10:00', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('100', '支付宝充值', '100', '2017-06-21 14:12:45', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('101', '支付宝服务费', '-1', '2017-06-21 14:12:45', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('102', '支付宝充值', '1', '2017-06-21 15:09:27', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('103', '提现处理中', '1', '2017-06-21 15:10:00', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('104', '支付宝充值', '1', '2017-06-21 15:16:50', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('105', '提现处理中', '1', '2017-06-21 15:17:07', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('106', '支付宝充值', '1', '2017-06-21 15:18:54', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('107', '提现处理中', '1', '2017-06-21 15:19:13', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('108', '支付宝提现失败', '1', '2017-06-21 15:19:38', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('109', '支付宝提现失败', '1', '2017-06-21 15:19:41', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('110', '支付宝提现失败', '1', '2017-06-21 15:19:44', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('111', '提现处理中', '1', '2017-06-21 15:20:16', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('112', '支付宝提现失败', '1', '2017-06-21 16:22:20', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('113', '支付宝充值', '1', '2017-06-22 09:57:16', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('114', '微信充值', '1000', '2017-06-22 10:02:11', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('115', '成为房主，冻结保证金。', '-100', '2017-06-22 10:11:20', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('116', '支付宝充值', '100', '2017-06-22 10:12:15', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('117', '支付宝服务费', '-1', '2017-06-22 10:12:15', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('118', '准备开始，冻结保证金。', '-100', '2017-06-22 10:12:36', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('119', '微信充值', '100', '2017-06-22 10:12:39', '10000000002', '1');
INSERT INTO `transaction_details` VALUES ('120', '准备开始，冻结保证金。', '-100', '2017-06-22 10:12:51', '10000000002', '1');
INSERT INTO `transaction_details` VALUES ('121', '准备开始，冻结保证金。', '-100', '2017-06-22 10:13:22', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('122', '准备开始，冻结保证金。', '-100', '2017-06-22 10:13:22', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('123', '准备开始，冻结保证金。', '-100', '2017-06-22 10:13:43', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('124', '微信充值', '100', '2017-06-22 10:16:24', '10000000010', '1');
INSERT INTO `transaction_details` VALUES ('125', '准备开始，冻结保证金。', '-100', '2017-06-22 10:16:43', '10000000010', '1');
INSERT INTO `transaction_details` VALUES ('126', '支付宝充值', '100', '2017-06-22 10:17:27', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('127', '支付宝服务费', '-1', '2017-06-22 10:17:27', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('128', '支付宝充值', '1', '2017-06-22 10:17:48', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('129', '准备开始，冻结保证金', '-100', '2017-06-23 18:19:23', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('136', '后台处理，解冻保证金。', '1000', '2017-06-22 10:52:12', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('143', '支付宝充值', '3', '2017-06-22 11:26:28', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('144', '成为房主，冻结保证金。', '-2', '2017-06-22 11:41:46', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('145', '取消准备，解冻保证金。', '2', '2017-06-22 11:58:19', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('146', '成为房主，冻结保证金。', '-2', '2017-06-22 11:59:05', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('147', '准备开始，冻结保证金。', '-2', '2017-06-22 12:00:41', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('148', '成为房主，冻结保证金。', '-1', '2017-06-22 12:01:29', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('149', '活动结束，解冻保证金', '100', '2017-06-22 12:10:17', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('150', '活动结束，解冻保证金', '100', '2017-06-22 12:10:17', '10000000002', '1');
INSERT INTO `transaction_details` VALUES ('151', '活动结束，解冻保证金', '100', '2017-06-22 12:10:17', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('152', '活动结束，解冻保证金', '100', '2017-06-22 12:10:17', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('153', '活动结束，解冻保证金', '100', '2017-06-22 12:10:17', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('154', '活动结束，因缺席扣除保证金', '-100', '2017-06-23 17:46:43', '10000000006', '0');
INSERT INTO `transaction_details` VALUES ('155', '活动结束，解冻保证金', '100', '2017-06-22 12:10:17', '10000000010', '1');
INSERT INTO `transaction_details` VALUES ('156', '活动结束，分得保证金', '16', '2017-06-22 12:10:17', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('157', '活动结束，分得保证金', '16', '2017-06-22 12:10:17', '10000000002', '1');
INSERT INTO `transaction_details` VALUES ('158', '活动结束，分得保证金', '16', '2017-06-22 12:10:17', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('159', '【狼人杀】活动【Key】【马健原】迟到获得', '16', '2017-06-23 18:23:36', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('160', '活动结束，分得保证金', '16', '2017-06-22 12:10:17', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('161', '活动结束，分得保证金', '16', '2017-06-22 12:10:17', '10000000010', '1');
INSERT INTO `transaction_details` VALUES ('162', '支付宝退款', '-99', '2017-06-22 12:11:17', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('163', '支付宝退款', '-1', '2017-06-22 12:11:24', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('164', '【狼人杀】冻结保证金', '-1', '2017-06-23 18:19:24', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('165', '取消准备，解冻保证金。', '2', '2017-06-22 13:00:00', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('166', '取消准备，解冻保证金。', '2', '2017-06-22 13:00:00', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('167', '【狼人杀】解冻保证金', '1', '2017-06-22 13:55:10', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('168', '后台处理，解冻保证金。', '0', '2017-06-22 14:12:54', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('169', '后台处理，解冻保证金。', '100', '2017-06-22 14:20:30', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('170', '取消准备，解冻保证金。', '1', '2017-06-22 15:00:00', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('171', '成为房主，冻结保证金', '-3', '2017-06-22 17:09:43', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('172', '准备开始，冻结保证金。', '-3', '2017-06-22 21:31:49', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('173', '成为房主，冻结保证金', '-1', '2017-06-22 21:37:18', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('174', '准备开始，冻结保证金。', '-1', '2017-06-22 21:37:41', '10000000010', '1');
INSERT INTO `transaction_details` VALUES ('175', '准备开始，冻结保证金。', '-1', '2017-06-22 21:38:43', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('176', '活动结束，因缺席扣除保证金', '-1', '2017-06-23 17:46:43', '10000000000', '0');
INSERT INTO `transaction_details` VALUES ('177', '活动结束，因缺席扣除保证金', '-1', '2017-06-23 17:46:43', '10000000006', '0');
INSERT INTO `transaction_details` VALUES ('178', '活动结束，因缺席扣除保证金', '-1', '2017-06-23 17:46:43', '10000000010', '0');
INSERT INTO `transaction_details` VALUES ('179', '取消准备，解冻保证金', '3', '2017-06-23 08:00:00', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('180', '取消准备，解冻保证金', '3', '2017-06-23 08:00:00', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('181', '成为房主，冻结保证金', '-5', '2017-06-23 08:57:03', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('182', '成为房主，冻结保证金', '-100', '2017-06-23 09:16:29', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('183', '取消准备，解冻保证金', '100', '2017-06-23 10:00:00', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('184', '取消准备，解冻保证金', '5', '2017-06-23 10:10:00', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('185', '成为房主，冻结保证金', '-1', '2017-06-23 10:11:07', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('186', '准备开始，冻结保证金。', '-1', '2017-06-23 10:11:22', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('187', '准备开始，冻结保证金。', '-1', '2017-06-23 10:11:22', '10000000002', '1');
INSERT INTO `transaction_details` VALUES ('188', '取消准备，解冻保证金', '1', '2017-06-23 10:11:23', '10000000002', '1');
INSERT INTO `transaction_details` VALUES ('189', '取消准备，解冻保证金', '1', '2017-06-23 10:11:23', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('190', '准备开始，冻结保证金。', '-1', '2017-06-23 10:11:27', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('191', '准备开始，冻结保证金。', '-1', '2017-06-23 10:11:36', '10000000002', '1');
INSERT INTO `transaction_details` VALUES ('192', '取消准备，解冻保证金', '1', '2017-06-23 10:11:43', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('193', '准备开始，冻结保证金。', '-1', '2017-06-23 10:11:44', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('194', '准备开始，冻结保证金。', '-1', '2017-06-23 10:12:04', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('195', '取消准备，解冻保证金', '1', '2017-06-23 10:20:00', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('196', '取消准备，解冻保证金', '1', '2017-06-23 10:20:00', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('197', '取消准备，解冻保证金', '1', '2017-06-23 10:20:00', '10000000002', '1');
INSERT INTO `transaction_details` VALUES ('198', '取消准备，解冻保证金', '1', '2017-06-23 10:20:00', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('199', '成为房主，冻结保证金', '-100', '2017-06-23 10:45:33', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('200', '取消准备，解冻保证金', '100', '2017-06-23 12:00:00', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('201', '成为房主，冻结保证金', '-6', '2017-06-23 14:24:45', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('202', '取消准备，解冻保证金', '6', '2017-06-23 16:30:00', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('203', '成为房主，冻结保证金', '-1', '2017-06-23 17:00:10', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('204', '准备开始，冻结保证金。', '-1', '2017-06-23 17:00:19', '10000000002', '1');
INSERT INTO `transaction_details` VALUES ('205', '准备开始，冻结保证金。', '-1', '2017-06-23 17:00:28', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('206', '准备开始，冻结保证金', '-1', '2017-06-23 18:19:31', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('207', '准备开始，冻结保证金。', '-1', '2017-06-23 17:03:25', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('208', '取消准备，解冻保证金', '1', '2017-06-23 17:03:59', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('209', '取消准备，解冻保证金', '1', '2017-06-23 17:03:59', '10000000002', '1');
INSERT INTO `transaction_details` VALUES ('210', '取消准备，解冻保证金', '1', '2017-06-23 17:03:59', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('211', '取消准备，解冻保证金', '1', '2017-06-23 17:03:59', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('212', '准备开始，冻结保证金。', '-1', '2017-06-23 17:04:30', '10000000002', '1');
INSERT INTO `transaction_details` VALUES ('213', '取消准备，解冻保证金', '1', '2017-06-23 17:10:01', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('214', '取消准备，解冻保证金', '1', '2017-06-23 17:10:01', '10000000002', '1');
INSERT INTO `transaction_details` VALUES ('215', '成为房主，冻结保证金', '-1', '2017-06-23 18:10:46', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('216', '取消准备，解冻保证金', '1', '2017-06-23 19:00:00', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('217', '提现处理中', '100', '2017-06-23 19:04:46', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('218', '支付宝退款', '-100', '2017-06-23 19:13:36', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('219', '成为房主，冻结保证金', '-1', '2017-06-23 21:10:58', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('220', '取消准备，解冻保证金', '1', '2017-06-23 21:11:43', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('221', '成为房主，冻结保证金', '-50', '2017-06-25 18:15:29', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('222', '微信充值', '100', '2017-06-26 09:51:16', '10000000006', '1');
INSERT INTO `transaction_details` VALUES ('223', '微信充值', '100', '2017-06-26 12:48:28', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('224', '微信退款', '-100', '2017-06-26 12:48:47', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('225', '支付宝充值', '100', '2017-06-26 12:49:08', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('226', '支付宝充值服务费', '-1', '2017-06-26 12:49:08', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('227', '支付宝退款', '-99', '2017-06-26 12:49:19', '10000000004', '1');
INSERT INTO `transaction_details` VALUES ('228', '支付宝退款', '-3', '2017-06-26 17:23:27', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('229', '提现处理中', '16', '2017-06-26 17:24:26', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('230', '准备开始，冻结保证金。', '-50', '2017-06-27 16:03:50', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('231', '取消准备，解冻保证金', '50', '2017-06-27 16:06:46', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('232', '准备开始，冻结保证金。', '-50', '2017-06-27 16:08:21', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('233', '取消准备，解冻保证金', '50', '2017-06-27 16:10:32', '10000000005', '1');
INSERT INTO `transaction_details` VALUES ('234', '取消准备，解冻保证金', '50', '2017-06-27 19:00:00', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('235', '成为房主，冻结保证金', '-50', '2017-06-27 21:45:06', '10000000000', '1');
INSERT INTO `transaction_details` VALUES ('236', '准备开始，冻结保证金。', '-50', '2017-06-28 09:18:23', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('237', '取消准备，解冻保证金', '50', '2017-06-28 09:28:03', '10000000003', '1');
INSERT INTO `transaction_details` VALUES ('238', '微信充值', '9900', '2017-06-28 10:54:46', '10000000001', '1');
INSERT INTO `transaction_details` VALUES ('239', '成为房主，冻结保证金', '-10000', '2017-06-28 13:39:51', '10000000006', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nickname` varchar(64) NOT NULL DEFAULT '',
  `token` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户token',
  `amount` int(11) NOT NULL DEFAULT '0' COMMENT '保证金',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `qq_uid` varchar(64) DEFAULT NULL COMMENT 'qq的uid',
  `wx_uid` varchar(64) DEFAULT NULL COMMENT '微信的uid',
  `xlwb_uid` varchar(64) DEFAULT NULL COMMENT '新浪微博的uid',
  `gender` tinyint(1) DEFAULT '1' COMMENT '性别',
  `is_init` tinyint(1) DEFAULT '0' COMMENT '是否完成初始化',
  `lock_amount` int(11) NOT NULL DEFAULT '0' COMMENT '冻结金额',
  `badge` int(11) NOT NULL DEFAULT '0' COMMENT '徽章',
  `labels` varchar(1024) DEFAULT NULL,
  `real_name` varchar(64) DEFAULT NULL,
  `authorized` tinyint(255) DEFAULT '0' COMMENT '是否实名认证(实名和身份证)',
  `avatar_signature` varchar(255) DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickname` (`nickname`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10000000024 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('888888', '后会有期', null, '207', null, null, null, null, null, '1', '0', '0', '0', null, null, '0', '', null);
INSERT INTO `user` VALUES ('10000000000', 'Key', 'p140Oq2awvUHZjRhhX0o9bz6Koau+zb6avb5p6TxlowsSYvkXwr7E2JlmGH2C2UEdP3x5YPHSeeP8QZR5J6DY1wf3atkb+tO', '949', null, '18698569593', null, 'og8dCv15eq9AefyahK8TFdy3oyqo', null, '1', '1', '50', '53', '[\"国服第一假女巫\",\"颜值爆表\",\"漂亮的小姐姐\"]', null, '0', '1494588234118', 'D8578EDF8458CE06FBC5BB76A58C5CA4');
INSERT INTO `user` VALUES ('10000000001', '低调 赵瑞龙', 'v2iIhYpB+m8s0OSo83JU5zMcmI9C4tVj1kvfRptGkzfMmMSP7OxBNxL9Ec4j0GSEpMJ8fM7j2J4+WB/M+IGBWJKQSm21jCDt', '10026', '410782199411080958', '15516517017', 'BC31242A86599D7E3FDDB6CAEBA760B7', null, null, '1', '1', '0', '75', '[\"a\",\"b\",\"c\",\"d\",\"e\",\"低调奢华有内涵\",\"神准时\"]', '张国文一', '1', '1498198535868', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `user` VALUES ('10000000002', 'xml', 'ifWqMF1SAzDjVzMTMMjwPjMcmI9C4tVj1kvfRptGkzfMmMSP7OxBN4AQC02nJddnBFHaY2wJZcM+WB/M+IGBWCGXFOtvDmwP', '116', null, '15869173715', null, null, null, '0', '1', '0', '7', '[\"萌妹纸\",\"低调奢华有内涵\"]', null, '0', '1498099367879', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `user` VALUES ('10000000003', '徐强', 'QXoKiAxKCVQMakKsXxbOe+WkAErl7NYSiwDRR+Iok8HxEbNjT1YE+V56VpvqxttJTMnXX+34zXHaYvtU+0wKW+DYF0GPsy/X', '100', '330522196701206534', '18758183175', '01362080ECB004FE57F9AADF51EE730D', 'og8dCv5HYixIf6iLsA0mdnk2EphY', null, '1', '1', '16', '0', '[\"漂亮的小姐姐\",\"颜值爆表\"]', '徐强', '1', '1498566498795', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `user` VALUES ('10000000004', '马健原-测试', '6MNrXDIxHWt99enouW9Q2zMcmI9C4tVj1kvfRptGkzfMmMSP7OxBNx+sRRq1nvpRwprAarhwEhE+WB/M+IGBWGjEJ0QR+VDP', '16', null, '17702525841', null, null, null, '1', '1', '0', '3', '[\"漂亮的小姐姐\",\"低调奢华有内涵\"]', null, '0', '1495175242030', '670B14728AD9902AECBA32E22FA4F6BD');
INSERT INTO `user` VALUES ('10000000005', '鹏杰', 'JK/T4MG3a5JDCDLcsK3pP7z6Koau+zb6avb5p6Txlox15H9eXwfktCub0v4lMXpldP3x5YPHSeeP8QZR5J6DY785LrXuozom', '1106', null, '18888970265', null, null, null, '1', '1', '0', '8', '[\"低调奢华有内涵\"]', null, '0', '1495175242030', 'D0970714757783E6CF17B26FB8E2298F');
INSERT INTO `user` VALUES ('10000000006', '天天', 'SKtPDgHHJJ3rh3MXVciPjDMcmI9C4tVj1kvfRptGkzfMmMSP7OxBN81NM9WlhjnlCg3+6gklRmI+WB/M+IGBWNfxOngq0IL8', '83', '330184199009102856', '18069823366', '7CA3ED91B886651F2BD193757A999356', 'og8dCvwgtquiwa3vJI_GjPECHpxI', null, '1', '1', '10100', '85', '[\"低调奢华有内涵\"]', '九龙', '1', '1497950761139', 'C46DC11615F6AAC951C07E255135DB83');
INSERT INTO `user` VALUES ('10000000007', '游戏测试员', 'O7uizMa+cHHpJ9XU+sSSWTMcmI9C4tVj1kvfRptGkzfMmMSP7OxBN5PAKHMJdYYrz0OylDDtK+0+WB/M+IGBWKT+YYnEDbeU', '0', null, '13148473941', null, null, null, '0', '1', '0', '9', null, null, '0', '1497579920512', '25D55AD283AA400AF464C76D713C07AD');
INSERT INTO `user` VALUES ('10000000008', '原来我不帅', 'cmToxXKaMYU3hyptrn5GY+WkAErl7NYSiwDRR+Iok8HxEbNjT1YE+XmvBx0KmLCziI1gDPgTCfbaYvtU+0wKW3Bww4sH6+bw', '0', null, null, null, 'og8dCv7MON2WMFQtDD3yfgfB9gCA', null, '1', '1', '0', '10', null, null, '0', '', 'D9D3CCCC0098B04EE66E72BE2D8DA319');
INSERT INTO `user` VALUES ('10000000009', '人间失格', 'UVDYo2Byudjrh3MXVciPjDMcmI9C4tVj1kvfRptGkzcMG1HmOo7hB1GaXOF8xW3eBFHaY2wJZcM+WB/M+IGBWChy2gflpawb', '0', null, null, 'DD04A59ADBDEF7BCAA76440D7D4AA835', null, null, '1', '1', '0', '10', null, null, '0', '1497795186886', 'FDD93833A24CB64034D7CB2B9663D2CE');
INSERT INTO `user` VALUES ('10000000010', '小丸子', 'MqGC2JlBtexlkM0A9/ofULz6Koau+zb6avb5p6Txlox15H9eXwfktPBadzGEz2lsdP3x5YPHSeeP8QZR5J6DY9ZSQzhJckDS', '115', null, '18768198055', null, null, null, '0', '1', '0', '11', '[\"漂亮的小姐姐\",\"萌妹纸\",\"低调奢华有内涵\"]', null, '0', '1497876614047', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `user` VALUES ('10000000011', '张国文b3122', 'GXgyBpYv3uY2lqczMMYqAzMcmI9C4tVj1kvfRptGkzcMG1HmOo7hBzlRrZsuZDEFCg3+6gklRmI+WB/M+IGBWOcrUyt+HIX9', '0', null, null, 'A1355A0151F6E3E6F6C5D78FEBB5BB6F', null, null, '1', '1', '0', '9', null, null, '0', '1497944181404', '64C912F9DE3C8DDCEE6BEF428BC73824');
INSERT INTO `user` VALUES ('10000000012', '浮光笙箫度', 'jQ5uFtoAzRU92PR5kclBoTMcmI9C4tVj1kvfRptGkzcMG1HmOo7hB2YpW8RhL0HdGEY4WoRrs8I+WB/M+IGBWCgulWE6V1FY', '0', null, '17630913798', null, null, null, '1', '1', '0', '10', null, null, '0', '1497997138707', '0E09EFC38A13AE92ABA6541ABF66C7F6');
INSERT INTO `user` VALUES ('10000000013', 'Z', '2TtjkhNeMl6tP7ESqeYJlOWkAErl7NYSiwDRR+Iok8HxEbNjT1YE+QxLiaSUAQkSclJzl7RT7QraYvtU+0wKW5mN4rMKUEKu', '0', null, '13645818682', null, null, null, '1', '1', '0', '10', null, null, '0', '', '639FDF6A1CE3E8CB4CA79BFB42FDEE8E');
INSERT INTO `user` VALUES ('10000000014', '口十永日', 'ptofq3wImw5nPKXLn7xDdzMcmI9C4tVj1kvfRptGkzfMmMSP7OxBNxxSjmurMlkGwprAarhwEhE+WB/M+IGBWPHuklq3iEUL', '0', null, '18606756766', null, null, null, '1', '1', '0', '10', null, null, '0', '', '693E3A0C5E391C5A06F462731C337631');
INSERT INTO `user` VALUES ('10000000015', 'Android开发工程师', 'n7tTkLnjEdPGtaznYpbu4OWkAErl7NYSiwDRR+Iok8HxEbNjT1YE+ZLDV16K/GQywLOZItXj4yLaYvtU+0wKW0GsQDdhs2Ga', '0', null, null, '74F932B0162E9053147AEA0CCB984C28', null, null, '1', '1', '0', '10', null, null, '0', '1498200198513', '3123335C6BEE2D590AC60A66E1EF7736');
INSERT INTO `user` VALUES ('10000000016', 'Jjun', 'EtVtIvnrs2hDCDLcsK3pP7z6Koau+zb6avb5p6Txlox15H9eXwfktKjWY9nDLojsdP3x5YPHSeeP8QZR5J6DY/XcMj8pAhrw', '0', '', null, null, 'og8dCv6hp_3lszvs-_o69Z7Z2dXc', null, '0', '1', '0', '7', null, '', '0', '1498628641775', 'E9E1014D0E5692A14009365EB1F44B0D');
INSERT INTO `user` VALUES ('10000000017', '啊', 'rQqvkMW2shR0aibuRNpXTOWkAErl7NYSiwDRR+Iok8HxEbNjT1YE+UbaJm0suZbUD6quAlg0JLLaYvtU+0wKW4QrrWjiSK2N', '0', '', '13858195001', null, null, null, '1', '1', '0', '10', null, '', '0', '', '252DA2D4394714E747A82441FB64FF7E');
INSERT INTO `user` VALUES ('10000000018', 'Jjunb0489', '2e5oYD4CkhhCCoGFZuHyNOWkAErl7NYSiwDRR+Iok8HxEbNjT1YE+fNZV21/+XzeGinegzcfqPXaYvtU+0wKW9hkFHqiNyyH', '0', '', null, 'B94242ACBF02D68F771E22DF4CF0B31F', null, null, '1', '1', '0', '10', null, '', '0', '', '027CA7AEB1F8B3AE0826BEF6B9FC01AE');
INSERT INTO `user` VALUES ('10000000019', '陈属', 'cbW/h9iuiSHrh3MXVciPjDMcmI9C4tVj1kvfRptGkzfMmMSP7OxBN0PYb19U6FvzGEY4WoRrs8I+WB/M+IGBWFdwBl2jk8Ks', '0', null, '18201738382', null, null, null, '1', '1', '0', '11', '[\"好厉害\"]', null, '0', '', '733D7BE2196FF70EFAF6913FC8BDCABF');
INSERT INTO `user` VALUES ('10000000020', 'BiemoWo', 'IRHbch8Gxscd3ELkqmIeZrz6Koau+zb6avb5p6TxloyvY5QL8q4nePrF5E5i8bGadP3x5YPHSeeP8QZR5J6DY0tiBpmm3HvC', '0', null, '13780063733', null, null, null, '1', '1', '0', '10', null, null, '0', '', '77648DDFC9FFAF34B2E7AF3E912F0C3A');
INSERT INTO `user` VALUES ('10000000021', '🐍Gorgon', 'dzLXRFOy6ENXP4dQL9rtHjMcmI9C4tVj1kvfRptGkzfMmMSP7OxBN/0/bbucQ/0Uf5U75Y0Qbd8+WB/M+IGBWAvzrho8nDx0', '0', null, null, null, 'og8dCvyOcB7tUHbbQxeuhdmdWxCk', null, '0', '1', '0', '10', null, null, '0', '', '9FBFAAC5280B221C44324B01DB141C6E');
INSERT INTO `user` VALUES ('10000000022', '用户13646738966', 'gli+ZB8pNAU0HCNcexlJPOWkAErl7NYSiwDRR+Iok8HxEbNjT1YE+U1d+NygsdhUNoWPBJfPgmLaYvtU+0wKW+sXFN2rYVh9', '0', null, '13646738966', null, null, null, null, '0', '0', '10', null, null, '0', '', '00B0C08F23A2947991413FC41216E813');
INSERT INTO `user` VALUES ('10000000023', 'Napoleon爱机械', 'Kpzsd1q9MNm+qnXXXDNv7jMcmI9C4tVj1kvfRptGkzfMmMSP7OxBN9xyfPw7BFomz0OylDDtK+0+WB/M+IGBWBEJbfUQtTi3', '0', null, null, null, 'og8dCv24JHHffFv7FUUxap27W2To', null, '1', '1', '0', '9', null, null, '0', '1498628692964', '81CAAA4431D86115DA3D9EEB27945931');

-- ----------------------------
-- Table structure for user_circle
-- ----------------------------
DROP TABLE IF EXISTS `user_circle`;
CREATE TABLE `user_circle` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) NOT NULL,
  `circle` bigint(20) NOT NULL,
  `experience` int(11) DEFAULT '0',
  `create_count` int(11) DEFAULT '0' COMMENT '创建活动的次数',
  `is_sign` tinyint(1) DEFAULT '0' COMMENT '是否签到过',
  `join_count` int(11) DEFAULT '0' COMMENT '加入活动的次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`,`circle`) USING BTREE,
  KEY `circle` (`circle`) USING BTREE,
  CONSTRAINT `user_circle_ibfk_2` FOREIGN KEY (`circle`) REFERENCES `circle` (`id`),
  CONSTRAINT `user_circle_ibfk_3` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_circle
-- ----------------------------
INSERT INTO `user_circle` VALUES ('46', '10000000003', '100000000000', '22', '0', '0', '0');
INSERT INTO `user_circle` VALUES ('47', '10000000011', '100000000000', '10', '0', '0', '0');
INSERT INTO `user_circle` VALUES ('49', '10000000002', '100000000000', '10', '0', '0', '0');
INSERT INTO `user_circle` VALUES ('50', '10000000006', '100000000001', '14', '0', '0', '0');
INSERT INTO `user_circle` VALUES ('51', '10000000000', '100000000001', '656', '0', '0', '0');
INSERT INTO `user_circle` VALUES ('52', '10000000000', '100000000000', '572', '0', '0', '0');
INSERT INTO `user_circle` VALUES ('53', '10000000003', '100000000001', '12', '0', '0', '0');
INSERT INTO `user_circle` VALUES ('54', '10000000016', '100000000001', '12', '0', '0', '0');
INSERT INTO `user_circle` VALUES ('55', '10000000016', '100000000000', '12', '0', '0', '0');
INSERT INTO `user_circle` VALUES ('74', '10000000002', '100000000001', '100', '0', '0', '0');
INSERT INTO `user_circle` VALUES ('75', '10000000001', '100000000001', '100', '0', '0', '0');
INSERT INTO `user_circle` VALUES ('76', '10000000006', '100000000000', '102', '0', '0', '0');
INSERT INTO `user_circle` VALUES ('77', '10000000004', '100000000000', '100', '0', '0', '0');
INSERT INTO `user_circle` VALUES ('78', '10000000004', '100000000001', '100', '0', '0', '0');
INSERT INTO `user_circle` VALUES ('79', '10000000001', '100000000002', '200', '0', '0', '0');
INSERT INTO `user_circle` VALUES ('80', '10000000001', '100000000003', '200', '0', '0', '0');

-- ----------------------------
-- Table structure for withdrawals
-- ----------------------------
DROP TABLE IF EXISTS `withdrawals`;
CREATE TABLE `withdrawals` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) NOT NULL,
  `alipay_account` varchar(255) NOT NULL,
  `real_name` varchar(255) NOT NULL,
  `money` int(11) DEFAULT '0' COMMENT '传入提现金额',
  `state` int(11) DEFAULT '0' COMMENT '0:审核中，1:同意，2:拒绝',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deal_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deal_money` int(11) DEFAULT '0' COMMENT '实际获得金额',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `withdrawals_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of withdrawals
-- ----------------------------
INSERT INTO `withdrawals` VALUES ('1', '10000000001', '15516517017', '张国文一', '1', '2', '2017-06-21 15:10:00', '2017-06-21 15:19:44', '0');
INSERT INTO `withdrawals` VALUES ('2', '10000000001', '1383848', '张国文一', '1', '2', '2017-06-21 15:17:07', '2017-06-21 15:19:41', '0');
INSERT INTO `withdrawals` VALUES ('3', '10000000001', '15516517017', '张国文一', '1', '2', '2017-06-21 15:19:13', '2017-06-21 15:19:38', '0');
INSERT INTO `withdrawals` VALUES ('4', '10000000001', '15516517017', '张国文一', '1', '2', '2017-06-21 15:20:16', '2017-06-21 16:22:20', '0');
INSERT INTO `withdrawals` VALUES ('5', '10000000006', 'yhcs@163.com', '九龙', '100', '0', '2017-06-23 19:04:46', null, '0');
INSERT INTO `withdrawals` VALUES ('6', '10000000003', '1351248938@qq.com', '徐强', '16', '0', '2017-06-26 17:24:26', null, '0');
SET FOREIGN_KEY_CHECKS=1;
