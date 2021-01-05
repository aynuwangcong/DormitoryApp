/*
Navicat MySQL Data Transfer

Source Server         : localhost1
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : dorm

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2021-01-04 22:54:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `absence`
-- ----------------------------
DROP TABLE IF EXISTS `absence`;
CREATE TABLE `absence` (
  `student_id` varchar(255) NOT NULL DEFAULT '',
  `student_name` varchar(255) DEFAULT NULL,
  `apartment_name` varchar(255) DEFAULT NULL,
  `dormitory` varchar(255) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `leave_if` varchar(255) DEFAULT NULL,
  `cause` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of absence
-- ----------------------------
INSERT INTO `absence` VALUES ('111', '李四', '南苑3号楼', '412寝室', '2021-01-04', '已补假', '我偷偷出去玩了');
INSERT INTO `absence` VALUES ('184804266', '王聪聪', '南苑1号楼', '211寝室', '2021-01-04', '否', '未知');
INSERT INTO `absence` VALUES ('184804310', '王聪聪', '北苑1号楼', '406寝室', '2021-01-04', '是', '回家');
INSERT INTO `absence` VALUES ('222', '王聪聪', '兰苑2号楼', '412寝室', '2020-12-30', '否', '未知');
INSERT INTO `absence` VALUES ('333', '王聪聪', '兰苑3号楼', '412寝室', '2020-12-31', '是', '生病');
INSERT INTO `absence` VALUES ('444', '王聪聪', '兰苑1号楼', '412寝室', '2021-01-01', '否', '未知');
INSERT INTO `absence` VALUES ('888', '王聪聪', '兰苑2号楼', '412寝室', '2020-12-22', '否', '未知');
INSERT INTO `absence` VALUES ('999', '李四', '南苑3号楼', '211寝室', '2020-12-30', '否', '未知');

-- ----------------------------
-- Table structure for `apartment`
-- ----------------------------
DROP TABLE IF EXISTS `apartment`;
CREATE TABLE `apartment` (
  `apartment_id` varchar(255) NOT NULL DEFAULT '',
  `apartment_name` varchar(255) DEFAULT NULL,
  `apartment_location` varchar(255) DEFAULT NULL,
  `apartment_nature` varchar(255) DEFAULT NULL,
  `apartment_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`apartment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of apartment
-- ----------------------------
INSERT INTO `apartment` VALUES ('102', '南苑1号楼', '安阳市文峰区文明大道1栋', '男寝', '这是一个始建于1986年的六层中式建筑');
INSERT INTO `apartment` VALUES ('103', '北苑2号楼', '安阳市文峰区文明大道2栋', '男寝', '这是一个始建于1983年的五层欧式建筑');
INSERT INTO `apartment` VALUES ('104', '南苑4号楼', '安阳市文峰区文明大道4栋', '女寝', '这是一个始建于1987年的六层中式建筑');
INSERT INTO `apartment` VALUES ('105', '竹苑3号楼', '安阳市文峰区文明大道3栋', '女寝', '这是一个中世纪修建的六层豪华公寓宿舍');

-- ----------------------------
-- Table structure for `manage`
-- ----------------------------
DROP TABLE IF EXISTS `manage`;
CREATE TABLE `manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manage_id` varchar(255) DEFAULT NULL,
  `manage_name` varchar(255) DEFAULT NULL,
  `manage_age` int(11) DEFAULT NULL,
  `manage_sex` varchar(255) DEFAULT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `nature` varchar(255) DEFAULT NULL,
  `telphone` varchar(255) DEFAULT NULL,
  `apartment_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of manage
-- ----------------------------
INSERT INTO `manage` VALUES ('1', '18480312', '王大聪', '26', '男', '南苑1号楼', '男寝', '18348325647', '104');
INSERT INTO `manage` VALUES ('2', '18480413', '王小聪', '28', '女', '北苑2号楼', '女寝', '18348325648', '105');
INSERT INTO `manage` VALUES ('4', '18480426', '张三', '25', '女', '竹苑2号楼', '女寝', '18348325646', '0');
INSERT INTO `manage` VALUES ('5', '18480428', '王五', '26', '女', '菊苑4号楼', '女寝', '18348325647', '');
INSERT INTO `manage` VALUES ('6', '18480429', '小红', '36', '女', '兰苑6号楼', '男寝', '18348325647', '103');
INSERT INTO `manage` VALUES ('7', '18480510', '小兰', '26', '女', '南苑4号楼', '女寝', '18348325647', '102');
INSERT INTO `manage` VALUES ('9', '18480425', '李四', '36', '男', '竹苑3号楼', '女寝', '18348325647', '0');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(255) DEFAULT NULL,
  `student_name` char(255) DEFAULT NULL,
  `student_age` int(11) DEFAULT NULL,
  `student_sex` char(255) DEFAULT NULL,
  `apartment` char(255) DEFAULT NULL,
  `dormitory` char(255) DEFAULT NULL,
  `telphone` char(255) DEFAULT NULL,
  `classes_id` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '184804311', '王小聪', '20', '男', '南苑1号楼', '406寝室', '18348325642', '2');
INSERT INTO `student` VALUES ('2', '184804312', '王大聪', '19', '男', '南苑3号楼', '410寝室', '18348325643', '3');
INSERT INTO `student` VALUES ('3', '184804313', '王聪明', '18', '女', '竹苑2号楼', '412寝室', '18348325644', '1');
INSERT INTO `student` VALUES ('4', '184804314', '张三', '19', '男', '北苑2号楼', '211寝室', '18348325645', '2');
INSERT INTO `student` VALUES ('5', '184804320', '李四', '18', '女', '竹苑2号楼', '122寝室', '18348325646', '3');
INSERT INTO `student` VALUES ('6', '184804333', '王二', '19', '男', '菊苑4号楼', '520寝室', '18348325647', '1');
INSERT INTO `student` VALUES ('17', '111', '李四', '19', '男', '南苑3号楼', '152寝室', '18348325647', null);
INSERT INTO `student` VALUES ('18', '222', '王五', '18', '男', '梅苑3号楼', '412寝室', '18348325647', null);
INSERT INTO `student` VALUES ('19', '333', '王聪聪', '18', '男', '兰苑6号楼', '520寝室', '18348325647', null);
INSERT INTO `student` VALUES ('24', '184804310', '王聪聪', '12', '男', '梅苑3号楼', '211寝室', '18348325641', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` char(255) NOT NULL DEFAULT '',
  `password` char(255) DEFAULT NULL,
  `name` char(255) DEFAULT NULL,
  `flag` char(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('aaa', '111', '王二', '学生');
INSERT INTO `user` VALUES ('bbb', '111', '小红', '学生');
INSERT INTO `user` VALUES ('ccc', '111', '小兰', '学生');
INSERT INTO `user` VALUES ('cong', '111', '李四', '宿舍管理员');
INSERT INTO `user` VALUES ('ddd', '111', '小米', '学生');
INSERT INTO `user` VALUES ('wang', '123456', '王聪聪', '系统管理员');
INSERT INTO `user` VALUES ('wcc', '111', '小明', '宿舍管理员');
INSERT INTO `user` VALUES ('www', '111', '张三', '宿舍管理员');
