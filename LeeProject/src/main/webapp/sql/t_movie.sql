/*
 Navicat Premium Data Transfer

 Source Server         : 本机MySQL
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : db1

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 10/09/2018 09:51:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_movie
-- ----------------------------
DROP TABLE IF EXISTS `t_movie`;
CREATE TABLE `t_movie`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `movie_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `movie_name2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名2',
  `movie_name3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名3',
  `movie_director` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导演',
  `movie_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `movie_scriptwriter` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编剧',
  `movie_productionDirector` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监制',
  `movie_producer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '制片人',
  `movie_length` int(3) NULL DEFAULT NULL COMMENT '长度',
  `movie_year` int(4) NULL DEFAULT NULL COMMENT '年份',
  `movie_date` date NULL DEFAULT NULL COMMENT '上映日期',
  `movie_actors` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '演员表',
  `movie_info` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情',
  `movie_area` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家地区',
  `movie_poster` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '海报',
  `movie_downloadLink1` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载链接1',
  `movie_downloadLink1Info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载链接1说明',
  `movie_downloadLink2` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载链接2',
  `movie_downloadLink2Info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载链接2说明',
  `movie_downloadLink3` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载链接3',
  `movie_downloadLink3Info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载链接3说明',
  `movie_downloadLink4` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载链接4',
  `movie_downloadLink4Info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载链接4说明',
  `movie_downloadLink5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载链接5',
  `movie_downloadLink5Info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载链接5说明',
  `movie_screenshot1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '截图1',
  `movie_screenshot2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '截图2',
  `movie_screenshot3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '截图3',
  `movie_screenshot4` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '截图4',
  `movie_screenshot5` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '截图5',
  `movie_screenshot6` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '截图6',
  `movie_uploadTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_movie
-- ----------------------------
INSERT INTO `t_movie` VALUES (1, '狄仁杰之四大天王', 'Detective Dee: The Four Heavenly Kings', '狄仁杰3', '徐克', '动作、奇幻、古装', '徐克、张家鲁', '陈国富、施南生', '徐克、陈国富、施南生', 132, 2018, '2018-07-27', '赵又廷 / 冯绍峰 / 林更新 / 阮经天 / 马思纯 / 刘嘉玲 / 盛鉴 / 杨一威 / 宝日夫 / \r\n张傲月 / 孙蛟龙 / 汪汐潮 / 释胜钢 / 李炳雷 / 许明虎', '狄仁杰（赵又廷 饰）大破神都龙王案后，高宗（盛鉴 饰）御赐神器亢龙锏，遭天后武则天（刘嘉玲 饰）嫉妒，天后为盗取亢龙锏陷害狄仁杰，召集了一帮会方术的“异人组”图谋不轨，并命令尉迟真金（冯绍峰 饰）带队。狄仁杰在医官沙陀忠（林更新 饰）的帮助下成功摆脱“异人组”迫害，并和尉迟真金商议和解，与此同时“异人组”刺客水月（马思纯 饰）却发现都城出现不明势力，在狄仁杰周旋于武则天的埋伏时，大唐陷入更深的危机，“封魔族”携异术登场，一场“屠魔”大战即将爆发……', '中国大陆、中国香港、中国台湾', '狄仁杰之四大天王.jpg', 'magnet:?xt=urn:btih:OOFMETLGSBYB3SUUMZPCL42GOY72PLXK&dn=1080p%E6%97%A0%E6%B0%B4%E5%8D%B0%5B%E6%9C%80%E6%96%B0%E7%94%B5%E5%BD%B1www.66ys.tv%5D.mp4&tr=udp%3A%2F%2F9.rarbg.to%3A2710%2Fannounce&tr=udp%3A%2F%2F9.rarbg.me%3A2710%2Fannounce&tr=http%3A%2F%2Ftracker.trackerfix.com%2Fannounce&tr=udp%3A%2F%2Fopen.demonii.com%3A1337&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Fp4p.arenabg.com%3A1337&tr=wss%3A%2F%2Ftracker.openwebtorrent.com&tr=wss%3A%2F%2Ftracker.btorrent.xyz&tr=wss%3A%2F%2Ftracker.fastcast.nz&tr=udp%3A%2F%2F10.rarbg.com%2Fannounce&tr=udp%3A%2F%2F10.rarbg.me%3A80%2Fannounce&tr=udp%3A%2F%2F11.rarbg.com%3A80%2Fannounce&tr=udp%3A%2F%2F11.rarbg.me%3A80%2Fannounce&xl=3020694876', '磁力：1080p无水印.HD国语中字.mp4', 'magnet:?xt=urn:btih:WWXHWO6KHVMIRW2WIFUKASUI47AQPHQE&dn=4K%E6%97%A0%E6%B0%B4%E5%8D%B0%5B%E6%9C%80%E6%96%B0%E7%94%B5%E5%BD%B1www.66ys.tv%5D.mp4&tr=udp%3A%2F%2F9.rarbg.to%3A2710%2Fannounce&tr=udp%3A%2F%2F9.rarbg.me%3A2710%2Fannounce&tr=http%3A%2F%2Ftracker.trackerfix.com%2Fannounce&tr=udp%3A%2F%2Fopen.demonii.com%3A1337&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Fp4p.arenabg.com%3A1337&tr=wss%3A%2F%2Ftracker.openwebtorrent.com&tr=wss%3A%2F%2Ftracker.btorrent.xyz&tr=wss%3A%2F%2Ftracker.fastcast.nz&tr=udp%3A%2F%2F10.rarbg.com%2Fannounce&tr=udp%3A%2F%2F10.rarbg.me%3A80%2Fannounce&tr=udp%3A%2F%2F11.rarbg.com%3A80%2Fannounce&tr=udp%3A%2F%2F11.rarbg.me%3A80%2Fannounce&xl=6388303013', '磁力：4K无水印.HD国语中字.mp4', 'ed2k://|file|1080p%E6%97%A0%E6%B0%B4%E5%8D%B0[%E6%9C%80%E6%96%B0%E7%94%B5%E5%BD%B1www.66ys.tv].mp4|3020694876|1C8AFF9371F1862A059C9418056279EC|h=FXPWPSZVORBEJOSIB7KMNC7LPBURBOAZ|/', '电驴：1080p无水印.HD国语中字.mp4', 'ed2k://|file|4K%E6%97%A0%E6%B0%B4%E5%8D%B0[%E6%9C%80%E6%96%B0%E7%94%B5%E5%BD%B1www.66ys.tv].mp4|6388303013|62207CCC4E0CD8E597A51FEF0CF10696|h=CQCM3O6TGCWUS3QG5MPUCLZMCYDYTAM6|/', '电驴：4K无水印.HD国语中字.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-08 09:49:49');
INSERT INTO `t_movie` VALUES (2, '大师兄', 'Big Brother', NULL, '阚家伟', '动作、喜剧', '阚家伟', '甄子丹、王晶', '甄子丹', 100, 2018, '2018-09-07', '甄子丹 / 陈乔恩 / 喻亢 / 骆明劼 / 汤君慈 / 汤君耀 / 李靖筠 / 刘朝健 / 林秋楠 / 云千千 / 林嘉华 / 张坚庭 / 骆应钧 / 李枫 / 欧阳伟豪 / 楼南光 / 张文杰', '新当老师的陈侠（甄子丹饰），一入职便遇上学校杀校危机，又要面对一众品学皆劣的问题学生，包括好勇斗狠的李伟聪（骆明劼饰）、印巴籍项祖发（刘朝健饰）、男人头王得男（李靖筠饰）、专注力不足的启程（汤君慈饰）及只会打游戏机的启贤（汤君耀饰）。\r\n陈侠运用非常教学的手法，化解每位学生的问题，终把全班学生收服。正当一切渐入佳境时，班内却发生严重事故，班主任陈侠成为公审对象。陈侠的教师资格更面临被教育局吊销。当师生上下为前途、为学校努力之际，却不知有不法商人看准学校的地皮，阴谋正悄悄酝酿。身经百战的陈侠，被逼再次放下教师身份，与一众师生合力展开一场学校守护战', '中国大陆、中国香港、中国台湾', '大师兄.jpg', 'http://222.186.37.46:808/bt1/%E5%A4%A7%E5%B8%88%E5%85%84.Big.Brother.2018.1080p.HDTC.X264.AAC-%E5%9B%BD%E8%AF%AD%E4%B8%AD%E5%AD%97-MP4BA.torrent\" title=\"大师兄.Big.BrotherBT种子下载', '高清TC版种子', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-09 09:49:49');
INSERT INTO `t_movie` VALUES (3, '侏罗纪世界2', 'Jurassic World：Fallen Kingdom', '侏罗纪公园5', '胡安·安东尼奥·巴亚纳', '科幻、冒险', '科林·特莱沃若', NULL, '史蒂文·斯皮尔伯格', 128, 2018, '2018-06-22', '克里斯·帕拉特，布莱丝·达拉斯·霍华德', '侏罗纪世界主题公园及豪华度假村被失控的恐龙们摧毁已有三年，现在纳布拉尔岛上幸存的恐龙们在丛林中自给自足。当岛上的休眠火山开始活跃以后，欧文（克里斯·帕拉特饰）与克莱尔（布莱丝·达拉斯·霍华德饰）发起了一场运动，想要保护岛上幸存的恐龙们免于灭绝，他们的冒险也揭开了一个可能让地球回到史前时代般混乱秩序的阴谋', '美国', '侏罗纪世界2.jpg', 'https://pan.baidu.com/s/1y9Feh831mENrm5X_J2H2PQ 密码：q2p4', '百度网盘', 'ed2k://|file|%E4%BE%8FL%E7%BA%AAs%E7%95%8C2.720p.HD%E4%B8%AD%E8%8B%B1%E5%8F%8C%E5%AD%97[%E6%9C%80%E6%96%B0%E7%94%B5%E5%BD%B1www.66ys.tv].mp4|1521390556|4951974DA0B9A3E627F8400F96DF291D|h=NCN5JDUKQ5ODYPLJEBHVH4HEDLS2WLAY|/', '电驴', 'magnet:?xt=urn:btih:MIDFD5U6SQJ6WIXFJCGG2I6LUF3HIGZ4&dn=%e4%be%8fL%e7%ba%aas%e7%95%8c2%2e720p%2eHD%e4%b8%ad%e8%8b%b1%e5%8f%8c%e5%ad%97%5b%e6%9c%80%e6%96%b0%e7%94%b5%e5%bd%b1www%2e66ys%2etv%5d%2emp4&tr=udp%3a%2f%2f9%2erarbg%2eto%3a2710%2fannounce&tr=udp%3a%2f%2f9%2erarbg%2eme%3a2710%2fannounce&tr=http%3a%2f%2ftr%2ecili001%2ecom%3a8070%2fannounce&tr=http%3a%2f%2ftracker%2etrackerfix%2ecom%3a80%2fannounce&tr=udp%3a%2f%2fopen%2edemonii%2ecom%3a1337&tr=udp%3a%2f%2ftracker%2eopentrackr%2eorg%3a1337%2fannounce&tr=udp%3a%2f%2fp4p%2earenabg%2ecom%3a1337', '磁力', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-09 09:55:49');
INSERT INTO `t_movie` VALUES (4, '新乌龙院之笑闹江湖', '新乌龙院', NULL, '朱延平', '喜剧、动作', '张耀升、朱凌峰、牛欣炜', NULL, NULL, 103, 2018, '2018-08-17', '王宁，王智，吴孟达，孔连顺，郝劭文', '又到一年乌龙院招生季，一心想要当坏人的阿威（王宁饰）和程明星（孔连顺饰）心怀不轨地进入到乌龙院中学武术。虽然二人成功骗取了长眉师父（吴孟达饰）的信任，但行为怪诞的他们招来了乌龙院众弟子的怀疑，一系列斗智斗勇的荒唐囧事开始发生。', '中国大陆、中国香港、中国台湾', '新乌龙院之笑闹江湖.jpg', 'ed2k://|file|%E6%96%B0w%E9%BE%99%E9%99%A2%E4%B9%8B%E7%AC%91n%E6%B1%9F%E6%B9%96.1080p%E6%97%A0%E6%B0%B4%E5%8D%B0[%E6%9C%80%E6%96%B0%E7%94%B5%E5%BD%B1www.66ys.tv].mp4|1844516794|C1379C52C0EC4F8E48EBD7E8DA5D547C|h=43AF3A24DPXESKLKPSGRTR3R77CIFOFS|/', '新乌龙院之笑闹江湖.1080p无水印.HD国语中字.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-10 09:49:49');
INSERT INTO `t_movie` VALUES (5, '爱情公寓电影版', '爱情公寓2018', '穿越时空的守护者', '韦正', '爱情、喜剧', '汪远', NULL, '	陈洪伟', 115, 2018, '2018-08-10', '袁弘，陈赫，娄艺潇，孙艺洲，李金铭，邓家佳，李佳航，刘天佐，赵志伟', '曾小贤、胡一菲、吕子乔、张伟、唐悠悠、陈美嘉的故事继续展开，“最好的朋友在身边，最爱的人就在对面”。不过这一次，他们打算搞个大事情。你的月亮我的心电台被临时改成了盗墓笔记深夜广播剧，曾小贤（陈赫饰）也不得不去读盗墓笔记。在曾小贤的一次梦中，他与爱情公寓的伙伴们误打误撞进入了盗墓笔记的世界。之后他们与盗墓笔记的三人组一起对抗反派黄黑红，保护青铜门', '中国大陆', '爱情公寓电影版.jpg', 'ed2k://|file|%E7%88%B1q%E5%85%AC%E5%AF%93%E7%94%B5%E5%BD%B1%E7%89%88.1080p%E6%97%A0%E6%B0%B4%E5%8D%B0[%E6%9C%80%E6%96%B0%E7%94%B5%E5%BD%B1www.66ys.tv].mp4|1651812620|EA0FD8BA66C4529191A813996F596E5F|h=JWDKV34UF33SPSFHDXZLC3GAFFWSP5G5|/', '爱情公寓.1080p无水印.HD国语中字.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-10 09:49:49');

SET FOREIGN_KEY_CHECKS = 1;
