/*
 Navicat Premium Data Transfer

 Source Server         : 虚拟机MySQL测试
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : 192.168.232.132:3306
 Source Schema         : db3

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 06/09/2018 15:18:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb4  NOT NULL COMMENT '用户名',
  `password` varchar(30) CHARACTER SET utf8mb4  NOT NULL COMMENT '密码',
  `tel` varchar(66) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '电话',
  `gender` int(11) NULL DEFAULT NULL COMMENT '性别(男1，女0)',
  `createTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `lastLoginTime` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `lastUpdateTime` datetime(0) NULL DEFAULT NULL COMMENT '上次修改时间',
  `email` varchar(50) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(100) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '住址',
  `job` varchar(20) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '职业',
  `photoURL` varchar(60) CHARACTER SET utf8mb4  NULL DEFAULT 'default.jpg' COMMENT '头像',
  `school` varchar(50) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '学校',
  `qq` varchar(50) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT 'QQ',
  `company` varchar(50) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '公司',
  `country` varchar(30) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '国家',
  `info` varchar(300) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4  ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
