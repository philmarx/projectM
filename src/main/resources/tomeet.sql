/*
Navicat MySQL Data Transfer

Source Server         : 正式环境
Source Server Version : 50715
Source Host           : tomeet-app.mysql.rds.aliyuncs.com:3306
Source Database       : tomeet

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-05-18 11:22:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_current` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of application
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=100000000001 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of circle
-- ----------------------------
INSERT INTO `circle` VALUES ('100000000000', '张国文的圈子一', '1', '杭州市', '西城博司展示中心', '0', '10000000001', '', '30.317123', '', '', '120.075936');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of declaration
-- ----------------------------
INSERT INTO `declaration` VALUES ('10', '10000000001', '张国文喊话一', '杭州市', '2017-05-15 09:14:40');

-- ----------------------------
-- Table structure for declaration_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `declaration_evaluation`;
CREATE TABLE `declaration_evaluation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `declaration_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) DEFAULT NULL,
  `receiver_id` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of declaration_evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for friend_connection
-- ----------------------------
DROP TABLE IF EXISTS `friend_connection`;
CREATE TABLE `friend_connection` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `owner` bigint(11) DEFAULT NULL,
  `friend` bigint(11) DEFAULT NULL,
  `point` double(2,1) DEFAULT '0.0',
  `evaluate_point` int(11) DEFAULT '0',
  `evaluated_point` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner` (`owner`,`friend`) USING BTREE,
  KEY `friend` (`friend`) USING BTREE,
  CONSTRAINT `friend_connection_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `user` (`id`),
  CONSTRAINT `friend_connection_ibfk_2` FOREIGN KEY (`friend`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of friend_connection
-- ----------------------------

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES ('0', '所有游戏', '-1');
INSERT INTO `game` VALUES ('1', '桌游棋牌', '0');
INSERT INTO `game` VALUES ('2', '体育运动', '0');
INSERT INTO `game` VALUES ('3', '聚会交友', '0');
INSERT INTO `game` VALUES ('4', '结伴出游', '0');
INSERT INTO `game` VALUES ('5', '其它活动', '0');
INSERT INTO `game` VALUES ('6', '狼人杀', '1');
INSERT INTO `game` VALUES ('7', '三国杀', '1');
INSERT INTO `game` VALUES ('8', '扑克', '1');
INSERT INTO `game` VALUES ('9', '麻将', '1');
INSERT INTO `game` VALUES ('10', '象棋', '1');
INSERT INTO `game` VALUES ('11', '围棋', '1');
INSERT INTO `game` VALUES ('12', '篮球', '2');
INSERT INTO `game` VALUES ('13', '足球', '2');
INSERT INTO `game` VALUES ('14', '排球', '2');
INSERT INTO `game` VALUES ('15', '网球', '2');
INSERT INTO `game` VALUES ('16', '乒乓球', '2');
INSERT INTO `game` VALUES ('17', '羽毛球', '2');
INSERT INTO `game` VALUES ('18', '密室', '3');
INSERT INTO `game` VALUES ('19', 'KTV', '3');
INSERT INTO `game` VALUES ('20', '酒吧', '3');
INSERT INTO `game` VALUES ('21', '派对', '3');
INSERT INTO `game` VALUES ('22', '电影', '3');
INSERT INTO `game` VALUES ('23', '美食', '3');
INSERT INTO `game` VALUES ('24', '逛街', '3');
INSERT INTO `game` VALUES ('25', '爬山', '4');
INSERT INTO `game` VALUES ('26', '骑车', '4');
INSERT INTO `game` VALUES ('27', '郊游', '4');
INSERT INTO `game` VALUES ('28', '短途旅行', '4');
INSERT INTO `game` VALUES ('29', '长途旅行', '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of game_score
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of image
-- ----------------------------

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
  `sender_id` bigint(20) DEFAULT NULL,
  `receiver_id` bigint(20) DEFAULT NULL,
  `state` int(11) DEFAULT '0' COMMENT '状态，0为未读，1为已读',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_ibfk_1` (`sender_id`),
  KEY `notes_ibfk_2` (`receiver_id`),
  CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`),
  CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of note
-- ----------------------------

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
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `password` varchar(128) DEFAULT NULL COMMENT '房间加密',
  `game` int(11) DEFAULT NULL COMMENT '活动类型',
  `money` int(11) DEFAULT '0' COMMENT '保证金',
  `member_count` decimal(4,0) DEFAULT '0' COMMENT '人数',
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
  PRIMARY KEY (`id`),
  KEY `creator` (`manager`) USING BTREE,
  KEY `game` (`game`) USING BTREE,
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`manager`) REFERENCES `user` (`id`),
  CONSTRAINT `room_ibfk_2` FOREIGN KEY (`game`) REFERENCES `game` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000000003 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of room
-- ----------------------------

-- ----------------------------
-- Table structure for room_evalutation
-- ----------------------------
DROP TABLE IF EXISTS `room_evalutation`;
CREATE TABLE `room_evalutation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_id` bigint(20) NOT NULL,
  `other_id` bigint(20) NOT NULL,
  `point` double NOT NULL,
  `room_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_id` (`owner_id`,`other_id`,`room_id`),
  KEY `other_id` (`other_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `room_evalutation_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  CONSTRAINT `room_evalutation_ibfk_2` FOREIGN KEY (`other_id`) REFERENCES `user` (`id`),
  CONSTRAINT `room_evalutation_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

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
  `point` int(11) NOT NULL DEFAULT '0' COMMENT '分数',
  `result` int(11) NOT NULL DEFAULT '0' COMMENT '如果是三国杀或狼人杀,围棋和象棋,胜为3,平为2,负为1;如果是麻将或扑克,A为7,B为6,C为5,D为4',
  `game` int(11) NOT NULL COMMENT '游戏分类',
  `nickname` varchar(64) DEFAULT '',
  `ready` tinyint(1) DEFAULT NULL COMMENT '是否准备开始',
  `longitude` double DEFAULT '0',
  `latitude` double DEFAULT '0',
  `is_evaluated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `room` (`room`,`member`) USING BTREE,
  KEY `member` (`member`) USING BTREE,
  KEY `room_member_ibfk_4` (`game`) USING BTREE,
  CONSTRAINT `room_member_ibfk_2` FOREIGN KEY (`member`) REFERENCES `user` (`id`),
  CONSTRAINT `room_member_ibfk_4` FOREIGN KEY (`game`) REFERENCES `game` (`id`),
  CONSTRAINT `room_member_ibfk_5` FOREIGN KEY (`room`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=700 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of room_member
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of smscode
-- ----------------------------
INSERT INTO `smscode` VALUES ('25', '18698569593', '158544', '2017-05-12 19:52:33');
INSERT INTO `smscode` VALUES ('26', '15516517017', '413409', '2017-05-15 09:40:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of suggestion
-- ----------------------------

-- ----------------------------
-- Table structure for transaction_details
-- ----------------------------
DROP TABLE IF EXISTS `transaction_details`;
CREATE TABLE `transaction_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `money` int(11) DEFAULT NULL COMMENT '交易金额',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `user` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `transaction_details_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of transaction_details
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nickname` varchar(64) NOT NULL DEFAULT '',
  `token` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户token',
  `amount` int(11) DEFAULT '0' COMMENT '保证金',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `qq_uid` varchar(64) DEFAULT NULL COMMENT 'qq的uid',
  `wx_uid` varchar(64) DEFAULT NULL COMMENT '微信的uid',
  `xlwb_uid` varchar(64) DEFAULT NULL COMMENT '新浪微博的uid',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别',
  `is_init` tinyint(1) DEFAULT '0' COMMENT '是否完成初始化',
  `lock_amount` int(11) DEFAULT '0' COMMENT '冻结金额',
  `badge` int(11) DEFAULT NULL COMMENT '徽章',
  `labels` varchar(1024) DEFAULT NULL,
  `real_name` varchar(64) DEFAULT NULL,
  `authorized` tinyint(255) DEFAULT '0',
  `avatar_signature` varchar(255) DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickname` (`nickname`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10000000002 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10000000000', 'Key', 'hkA7Y3q/piQpsI4/j8ke3zMcmI9C4tVj1kvfRptGkzdR8Tuvg2iXQFZ6YchE7rM0GEY4WoRrs8I+WB/M+IGBWPPAm8LdLHvu', '0', null, '18698569593', null, null, null, '1', '1', '0', '100', null, null, '0', '1494588234118', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `user` VALUES ('10000000001', '张国文', 'TVSNi59eJijIc35NkmDH/+WkAErl7NYSiwDRR+Iok8HxEbNjT1YE+U6TMb7iGyf9ZWPQTh65dL/aYvtU+0wKW2UPXzK9xvrx', '0', '410782199411080958', '15516517017', null, null, null, '1', '1', '0', '9', null, '张国文', '1', '', '670B14728AD9902AECBA32E22FA4F6BD');

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
  `join_count` int(11) DEFAULT '0' COMMENT '加入活动的次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`,`circle`) USING BTREE,
  KEY `circle` (`circle`) USING BTREE,
  CONSTRAINT `user_circle_ibfk_2` FOREIGN KEY (`circle`) REFERENCES `circle` (`id`),
  CONSTRAINT `user_circle_ibfk_3` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_circle
-- ----------------------------
INSERT INTO `user_circle` VALUES ('45', '10000000001', '100000000000', '1', '1', '0');
SET FOREIGN_KEY_CHECKS=1;
