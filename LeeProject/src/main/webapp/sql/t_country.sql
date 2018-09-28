SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_country`
-- ----------------------------
DROP TABLE IF EXISTS `t_country`;
CREATE TABLE `t_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL COMMENT '简写(2)',
  `iso3` char(3) DEFAULT NULL  COMMENT '简写(3)',
  `name` varchar(80) NOT NULL COMMENT '国家英文名',
  `name_zh` varchar(80) DEFAULT NULL COMMENT '国家中文名',
  `nicename` varchar(80) NOT NULL COMMENT '别名',
  `numcode` smallint(6) DEFAULT NULL COMMENT '国际代码',
  `phonecode` int(5) NOT NULL COMMENT '电话区号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_country
-- ----------------------------
INSERT INTO `t_country` VALUES ('1', 'AF', 'AFG', 'AFGHANISTAN', '阿富汗', 'Afghanistan', '4', '93');
INSERT INTO `t_country` VALUES ('2', 'AL', 'ALB', 'ALBANIA', '阿尔巴尼亚', 'Albania', '8', '355');
INSERT INTO `t_country` VALUES ('3', 'DZ', 'DZA', 'ALGERIA', '阿尔及利亚', 'Algeria', '12', '213');
INSERT INTO `t_country` VALUES ('4', 'AS', 'ASM', 'AMERICAN SAMOA', '美属萨摩亚', 'American Samoa', '16', '1684');
INSERT INTO `t_country` VALUES ('5', 'AD', 'AND', 'ANDORRA', '安道尔', 'Andorra', '20', '376');
INSERT INTO `t_country` VALUES ('6', 'AO', 'AGO', 'ANGOLA', '安哥拉', 'Angola', '24', '244');
INSERT INTO `t_country` VALUES ('7', 'AI', 'AIA', 'ANGUILLA', '安圭拉岛', 'Anguilla', '660', '1264');
INSERT INTO `t_country` VALUES ('8', 'AQ', null, 'ANTARCTICA', '南极洲', 'Antarctica', null, '0');
INSERT INTO `t_country` VALUES ('9', 'AG', 'ATG', 'ANTIGUA AND BARBUDA', '安提瓜岛和巴布达', 'Antigua and Barbuda', '28', '1268');
INSERT INTO `t_country` VALUES ('10', 'AR', 'ARG', 'ARGENTINA', '阿根廷', 'Argentina', '32', '54');
INSERT INTO `t_country` VALUES ('11', 'AM', 'ARM', 'ARMENIA', '亚美尼亚', 'Armenia', '51', '374');
INSERT INTO `t_country` VALUES ('12', 'AW', 'ABW', 'ARUBA', '阿鲁巴岛', 'Aruba', '533', '297');
INSERT INTO `t_country` VALUES ('13', 'AU', 'AUS', 'AUSTRALIA', '澳大利亚', 'Australia', '36', '61');
INSERT INTO `t_country` VALUES ('14', 'AT', 'AUT', 'AUSTRIA', '奥地利', 'Austria', '40', '43');
INSERT INTO `t_country` VALUES ('15', 'AZ', 'AZE', 'AZERBAIJAN', '阿塞拜疆', 'Azerbaijan', '31', '994');
INSERT INTO `t_country` VALUES ('16', 'BS', 'BHS', 'BAHAMAS', '巴哈马群岛', 'Bahamas', '44', '1242');
INSERT INTO `t_country` VALUES ('17', 'BH', 'BHR', 'BAHRAIN', '巴林', 'Bahrain', '48', '973');
INSERT INTO `t_country` VALUES ('18', 'BD', 'BGD', 'BANGLADESH', '孟加拉国', 'Bangladesh', '50', '880');
INSERT INTO `t_country` VALUES ('19', 'BB', 'BRB', 'BARBADOS', '巴巴多斯', 'Barbados', '52', '1246');
INSERT INTO `t_country` VALUES ('20', 'BY', 'BLR', 'BELARUS', '白俄罗斯', 'Belarus', '112', '375');
INSERT INTO `t_country` VALUES ('21', 'BE', 'BEL', 'BELGIUM', '比利时', 'Belgium', '56', '32');
INSERT INTO `t_country` VALUES ('22', 'BZ', 'BLZ', 'BELIZE', '伯利兹', 'Belize', '84', '501');
INSERT INTO `t_country` VALUES ('23', 'BJ', 'BEN', 'BENIN', '贝宁', 'Benin', '204', '229');
INSERT INTO `t_country` VALUES ('24', 'BM', 'BMU', 'BERMUDA', '百慕大', 'Bermuda', '60', '1441');
INSERT INTO `t_country` VALUES ('25', 'BT', 'BTN', 'BHUTAN', '不丹', 'Bhutan', '64', '975');
INSERT INTO `t_country` VALUES ('26', 'BO', 'BOL', 'BOLIVIA', '玻利维亚', 'Bolivia', '68', '591');
INSERT INTO `t_country` VALUES ('27', 'BA', 'BIH', 'BOSNIA AND HERZEGOVINA', '波斯尼亚和黑塞哥维那', 'Bosnia and Herzegovina', '70', '387');
INSERT INTO `t_country` VALUES ('28', 'BW', 'BWA', 'BOTSWANA', '博茨瓦纳', 'Botswana', '72', '267');
INSERT INTO `t_country` VALUES ('29', 'BV', null, 'BOUVET ISLAND', '布维岛', 'Bouvet Island', null, '0');
INSERT INTO `t_country` VALUES ('30', 'BR', 'BRA', 'BRAZIL', '巴西', 'Brazil', '76', '55');
INSERT INTO `t_country` VALUES ('31', 'IO', null, 'BRITISH INDIAN OCEAN TERRITORY', '英属印度洋领地', 'British Indian Ocean Territory', null, '246');
INSERT INTO `t_country` VALUES ('32', 'BN', 'BRN', 'BRUNEI DARUSSALAM', '文莱达鲁萨兰国', 'Brunei Darussalam', '96', '673');
INSERT INTO `t_country` VALUES ('33', 'BG', 'BGR', 'BULGARIA', '保加利亚', 'Bulgaria', '100', '359');
INSERT INTO `t_country` VALUES ('34', 'BF', 'BFA', 'BURKINA FASO', '布吉纳法索', 'Burkina Faso', '854', '226');
INSERT INTO `t_country` VALUES ('35', 'BI', 'BDI', 'BURUNDI', '布隆迪', 'Burundi', '108', '257');
INSERT INTO `t_country` VALUES ('36', 'KH', 'KHM', 'CAMBODIA', '柬埔寨', 'Cambodia', '116', '855');
INSERT INTO `t_country` VALUES ('37', 'CM', 'CMR', 'CAMEROON', '喀麦隆', 'Cameroon', '120', '237');
INSERT INTO `t_country` VALUES ('38', 'CA', 'CAN', 'CANADA', '加拿大', 'Canada', '124', '1');
INSERT INTO `t_country` VALUES ('39', 'CV', 'CPV', 'CAPE VERDE', '佛得角', 'Cape Verde', '132', '238');
INSERT INTO `t_country` VALUES ('40', 'KY', 'CYM', 'CAYMAN ISLANDS', '开曼群岛', 'Cayman Islands', '136', '1345');
INSERT INTO `t_country` VALUES ('41', 'CF', 'CAF', 'CENTRAL AFRICAN REPUBLIC', '中非共和国', 'Central African Republic', '140', '236');
INSERT INTO `t_country` VALUES ('42', 'TD', 'TCD', 'CHAD', '乍得', 'Chad', '148', '235');
INSERT INTO `t_country` VALUES ('43', 'CL', 'CHL', 'CHILE', '智利', 'Chile', '152', '56');
INSERT INTO `t_country` VALUES ('44', 'CN', 'CHN', 'CHINA', '中国', 'China', '156', '86');
INSERT INTO `t_country` VALUES ('45', 'CX', null, 'CHRISTMAS ISLAND', '圣诞岛', 'Christmas Island', null, '61');
INSERT INTO `t_country` VALUES ('46', 'CC', null, 'COCOS (KEELING) ISLANDS', 'COCOS(KEELING)岛', 'Cocos (Keeling) Islands', null, '672');
INSERT INTO `t_country` VALUES ('47', 'CO', 'COL', 'COLOMBIA', '哥伦比亚', 'Colombia', '170', '57');
INSERT INTO `t_country` VALUES ('48', 'KM', 'COM', 'COMOROS', '科摩罗', 'Comoros', '174', '269');
INSERT INTO `t_country` VALUES ('49', 'CG', 'COG', 'CONGO', '刚果', 'Congo', '178', '242');
INSERT INTO `t_country` VALUES ('50', 'CD', 'COD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', '刚果民主共和国的', 'Congo, the Democratic Republic of the', '180', '242');
INSERT INTO `t_country` VALUES ('51', 'CK', 'COK', 'COOK ISLANDS', '库克群岛', 'Cook Islands', '184', '682');
INSERT INTO `t_country` VALUES ('52', 'CR', 'CRI', 'COSTA RICA', '哥斯达黎加', 'Costa Rica', '188', '506');
INSERT INTO `t_country` VALUES ('53', 'CI', 'CIV', 'COTE D\'IVOIRE', '科特迪瓦', 'Cote D\'Ivoire', '384', '225');
INSERT INTO `t_country` VALUES ('54', 'HR', 'HRV', 'CROATIA', '克罗地亚', 'Croatia', '191', '385');
INSERT INTO `t_country` VALUES ('55', 'CU', 'CUB', 'CUBA', '古巴', 'Cuba', '192', '53');
INSERT INTO `t_country` VALUES ('56', 'CY', 'CYP', 'CYPRUS', '塞浦路斯', 'Cyprus', '196', '357');
INSERT INTO `t_country` VALUES ('57', 'CZ', 'CZE', 'CZECH REPUBLIC', '捷克共和国', 'Czech Republic', '203', '420');
INSERT INTO `t_country` VALUES ('58', 'DK', 'DNK', 'DENMARK', '丹麦', 'Denmark', '208', '45');
INSERT INTO `t_country` VALUES ('59', 'DJ', 'DJI', 'DJIBOUTI', '吉布提', 'Djibouti', '262', '253');
INSERT INTO `t_country` VALUES ('60', 'DM', 'DMA', 'DOMINICA', '多米尼加', 'Dominica', '212', '1767');
INSERT INTO `t_country` VALUES ('61', 'DO', 'DOM', 'DOMINICAN REPUBLIC', '多米尼加共和国', 'Dominican Republic', '214', '1809');
INSERT INTO `t_country` VALUES ('62', 'EC', 'ECU', 'ECUADOR', '厄瓜多尔', 'Ecuador', '218', '593');
INSERT INTO `t_country` VALUES ('63', 'EG', 'EGY', 'EGYPT', '埃及', 'Egypt', '818', '20');
INSERT INTO `t_country` VALUES ('64', 'SV', 'SLV', 'EL SALVADOR', '萨尔瓦多', 'El Salvador', '222', '503');
INSERT INTO `t_country` VALUES ('65', 'GQ', 'GNQ', 'EQUATORIAL GUINEA', '赤道几内亚', 'Equatorial Guinea', '226', '240');
INSERT INTO `t_country` VALUES ('66', 'ER', 'ERI', 'ERITREA', '厄立特里亚', 'Eritrea', '232', '291');
INSERT INTO `t_country` VALUES ('67', 'EE', 'EST', 'ESTONIA', '爱沙尼亚', 'Estonia', '233', '372');
INSERT INTO `t_country` VALUES ('68', 'ET', 'ETH', 'ETHIOPIA', '埃塞俄比亚', 'Ethiopia', '231', '251');
INSERT INTO `t_country` VALUES ('69', 'FK', 'FLK', 'FALKLAND ISLANDS (MALVINAS)', '福克兰群岛(马尔维纳斯)', 'Falkland Islands (Malvinas)', '238', '500');
INSERT INTO `t_country` VALUES ('70', 'FO', 'FRO', 'FAROE ISLANDS', '法罗群岛', 'Faroe Islands', '234', '298');
INSERT INTO `t_country` VALUES ('71', 'FJ', 'FJI', 'FIJI', '斐济', 'Fiji', '242', '679');
INSERT INTO `t_country` VALUES ('72', 'FI', 'FIN', 'FINLAND', '芬兰', 'Finland', '246', '358');
INSERT INTO `t_country` VALUES ('73', 'FR', 'FRA', 'FRANCE', '法国', 'France', '250', '33');
INSERT INTO `t_country` VALUES ('74', 'GF', 'GUF', 'FRENCH GUIANA', '法属圭亚那', 'French Guiana', '254', '594');
INSERT INTO `t_country` VALUES ('75', 'PF', 'PYF', 'FRENCH POLYNESIA', '法属波利尼西亚', 'French Polynesia', '258', '689');
INSERT INTO `t_country` VALUES ('76', 'TF', null, 'FRENCH SOUTHERN TERRITORIES', '法国南部地区', 'French Southern Territories', null, '0');
INSERT INTO `t_country` VALUES ('77', 'GA', 'GAB', 'GABON', '加蓬', 'Gabon', '266', '241');
INSERT INTO `t_country` VALUES ('78', 'GM', 'GMB', 'GAMBIA', '冈比亚', 'Gambia', '270', '220');
INSERT INTO `t_country` VALUES ('79', 'GE', 'GEO', 'GEORGIA', '乔治亚州', 'Georgia', '268', '995');
INSERT INTO `t_country` VALUES ('80', 'DE', 'DEU', 'GERMANY', '德国', 'Germany', '276', '49');
INSERT INTO `t_country` VALUES ('81', 'GH', 'GHA', 'GHANA', '加纳', 'Ghana', '288', '233');
INSERT INTO `t_country` VALUES ('82', 'GI', 'GIB', 'GIBRALTAR', '直布罗陀', 'Gibraltar', '292', '350');
INSERT INTO `t_country` VALUES ('83', 'GR', 'GRC', 'GREECE', '希腊', 'Greece', '300', '30');
INSERT INTO `t_country` VALUES ('84', 'GL', 'GRL', 'GREENLAND', '格陵兰岛', 'Greenland', '304', '299');
INSERT INTO `t_country` VALUES ('85', 'GD', 'GRD', 'GRENADA', '格林纳达', 'Grenada', '308', '1473');
INSERT INTO `t_country` VALUES ('86', 'GP', 'GLP', 'GUADELOUPE', '瓜德罗普岛', 'Guadeloupe', '312', '590');
INSERT INTO `t_country` VALUES ('87', 'GU', 'GUM', 'GUAM', '关岛', 'Guam', '316', '1671');
INSERT INTO `t_country` VALUES ('88', 'GT', 'GTM', 'GUATEMALA', '危地马拉', 'Guatemala', '320', '502');
INSERT INTO `t_country` VALUES ('89', 'GN', 'GIN', 'GUINEA', '几内亚', 'Guinea', '324', '224');
INSERT INTO `t_country` VALUES ('90', 'GW', 'GNB', 'GUINEA-BISSAU', '几内亚比绍', 'Guinea-Bissau', '624', '245');
INSERT INTO `t_country` VALUES ('91', 'GY', 'GUY', 'GUYANA', '圭亚那', 'Guyana', '328', '592');
INSERT INTO `t_country` VALUES ('92', 'HT', 'HTI', 'HAITI', '海地', 'Haiti', '332', '509');
INSERT INTO `t_country` VALUES ('93', 'HM', null, 'HEARD ISLAND AND MCDONALD ISLANDS', '听到岛和麦当劳的岛屿', 'Heard Island and Mcdonald Islands', null, '0');
INSERT INTO `t_country` VALUES ('94', 'VA', 'VAT', 'HOLY SEE (VATICAN CITY STATE)', '教廷(梵蒂冈)', 'Holy See (Vatican City State)', '336', '39');
INSERT INTO `t_country` VALUES ('95', 'HN', 'HND', 'HONDURAS', '洪都拉斯', 'Honduras', '340', '504');
INSERT INTO `t_country` VALUES ('96', 'HK', 'HKG', 'HONG KONG', '香港', 'Hong Kong', '344', '852');
INSERT INTO `t_country` VALUES ('97', 'HU', 'HUN', 'HUNGARY', '匈牙利', 'Hungary', '348', '36');
INSERT INTO `t_country` VALUES ('98', 'IS', 'ISL', 'ICELAND', '冰岛', 'Iceland', '352', '354');
INSERT INTO `t_country` VALUES ('99', 'IN', 'IND', 'INDIA', '印度', 'India', '356', '91');
INSERT INTO `t_country` VALUES ('100', 'ID', 'IDN', 'INDONESIA', '印尼', 'Indonesia', '360', '62');
INSERT INTO `t_country` VALUES ('101', 'IR', 'IRN', 'IRAN, ISLAMIC REPUBLIC OF', '伊朗伊斯兰共和国', 'Iran, Islamic Republic of', '364', '98');
INSERT INTO `t_country` VALUES ('102', 'IQ', 'IRQ', 'IRAQ', '伊拉克', 'Iraq', '368', '964');
INSERT INTO `t_country` VALUES ('103', 'IE', 'IRL', 'IRELAND', '爱尔兰', 'Ireland', '372', '353');
INSERT INTO `t_country` VALUES ('104', 'IL', 'ISR', 'ISRAEL', '以色列', 'Israel', '376', '972');
INSERT INTO `t_country` VALUES ('105', 'IT', 'ITA', 'ITALY', '意大利', 'Italy', '380', '39');
INSERT INTO `t_country` VALUES ('106', 'JM', 'JAM', 'JAMAICA', '牙买加', 'Jamaica', '388', '1876');
INSERT INTO `t_country` VALUES ('107', 'JP', 'JPN', 'JAPAN', '日本', 'Japan', '392', '81');
INSERT INTO `t_country` VALUES ('108', 'JO', 'JOR', 'JORDAN', '约旦', 'Jordan', '400', '962');
INSERT INTO `t_country` VALUES ('109', 'KZ', 'KAZ', 'KAZAKHSTAN', '哈萨克斯坦', 'Kazakhstan', '398', '7');
INSERT INTO `t_country` VALUES ('110', 'KE', 'KEN', 'KENYA', '肯尼亚', 'Kenya', '404', '254');
INSERT INTO `t_country` VALUES ('111', 'KI', 'KIR', 'KIRIBATI', '基里巴斯', 'Kiribati', '296', '686');
INSERT INTO `t_country` VALUES ('112', 'KP', 'PRK', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', '朝鲜民主主义人民共和国', 'Korea, Democratic People\'s Republic of', '408', '850');
INSERT INTO `t_country` VALUES ('113', 'KR', 'KOR', 'KOREA, REPUBLIC OF', '朝鲜共和国', 'Korea, Republic of', '410', '82');
INSERT INTO `t_country` VALUES ('114', 'KW', 'KWT', 'KUWAIT', '科威特', 'Kuwait', '414', '965');
INSERT INTO `t_country` VALUES ('115', 'KG', 'KGZ', 'KYRGYZSTAN', '吉尔吉斯斯坦', 'Kyrgyzstan', '417', '996');
INSERT INTO `t_country` VALUES ('116', 'LA', 'LAO', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', '老挝人民民主共和国', 'Lao People\'s Democratic Republic', '418', '856');
INSERT INTO `t_country` VALUES ('117', 'LV', 'LVA', 'LATVIA', '拉脱维亚', 'Latvia', '428', '371');
INSERT INTO `t_country` VALUES ('118', 'LB', 'LBN', 'LEBANON', '黎巴嫩', 'Lebanon', '422', '961');
INSERT INTO `t_country` VALUES ('119', 'LS', 'LSO', 'LESOTHO', '莱索托', 'Lesotho', '426', '266');
INSERT INTO `t_country` VALUES ('120', 'LR', 'LBR', 'LIBERIA', '利比里亚', 'Liberia', '430', '231');
INSERT INTO `t_country` VALUES ('121', 'LY', 'LBY', 'LIBYAN ARAB JAMAHIRIYA', '阿拉伯利比亚民众国', 'Libyan Arab Jamahiriya', '434', '218');
INSERT INTO `t_country` VALUES ('122', 'LI', 'LIE', 'LIECHTENSTEIN', '列支敦斯登', 'Liechtenstein', '438', '423');
INSERT INTO `t_country` VALUES ('123', 'LT', 'LTU', 'LITHUANIA', '立陶宛', 'Lithuania', '440', '370');
INSERT INTO `t_country` VALUES ('124', 'LU', 'LUX', 'LUXEMBOURG', '卢森堡', 'Luxembourg', '442', '352');
INSERT INTO `t_country` VALUES ('125', 'MO', 'MAC', 'MACAO', '澳门', 'Macao', '446', '853');
INSERT INTO `t_country` VALUES ('126', 'MK', 'MKD', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', '前南斯拉夫马其顿共和国', 'Macedonia, the Former Yugoslav Republic of', '807', '389');
INSERT INTO `t_country` VALUES ('127', 'MG', 'MDG', 'MADAGASCAR', '马达加斯加', 'Madagascar', '450', '261');
INSERT INTO `t_country` VALUES ('128', 'MW', 'MWI', 'MALAWI', '马拉维', 'Malawi', '454', '265');
INSERT INTO `t_country` VALUES ('129', 'MY', 'MYS', 'MALAYSIA', '马来西亚', 'Malaysia', '458', '60');
INSERT INTO `t_country` VALUES ('130', 'MV', 'MDV', 'MALDIVES', '马尔代夫', 'Maldives', '462', '960');
INSERT INTO `t_country` VALUES ('131', 'ML', 'MLI', 'MALI', '马里', 'Mali', '466', '223');
INSERT INTO `t_country` VALUES ('132', 'MT', 'MLT', 'MALTA', '马耳他', 'Malta', '470', '356');
INSERT INTO `t_country` VALUES ('133', 'MH', 'MHL', 'MARSHALL ISLANDS', '马绍尔群岛', 'Marshall Islands', '584', '692');
INSERT INTO `t_country` VALUES ('134', 'MQ', 'MTQ', 'MARTINIQUE', '马提尼克岛', 'Martinique', '474', '596');
INSERT INTO `t_country` VALUES ('135', 'MR', 'MRT', 'MAURITANIA', '毛利塔尼亚', 'Mauritania', '478', '222');
INSERT INTO `t_country` VALUES ('136', 'MU', 'MUS', 'MAURITIUS', '毛里求斯', 'Mauritius', '480', '230');
INSERT INTO `t_country` VALUES ('137', 'YT', null, 'MAYOTTE', '马约特岛', 'Mayotte', null, '269');
INSERT INTO `t_country` VALUES ('138', 'MX', 'MEX', 'MEXICO', '墨西哥', 'Mexico', '484', '52');
INSERT INTO `t_country` VALUES ('139', 'FM', 'FSM', 'MICRONESIA, FEDERATED STATES OF', '密克罗尼西亚联邦', 'Micronesia, Federated States of', '583', '691');
INSERT INTO `t_country` VALUES ('140', 'MD', 'MDA', 'MOLDOVA, REPUBLIC OF', '摩尔多瓦共和国', 'Moldova, Republic of', '498', '373');
INSERT INTO `t_country` VALUES ('141', 'MC', 'MCO', 'MONACO', '摩纳哥', 'Monaco', '492', '377');
INSERT INTO `t_country` VALUES ('142', 'MN', 'MNG', 'MONGOLIA', '蒙古', 'Mongolia', '496', '976');
INSERT INTO `t_country` VALUES ('143', 'MS', 'MSR', 'MONTSERRAT', '蒙特塞拉特', 'Montserrat', '500', '1664');
INSERT INTO `t_country` VALUES ('144', 'MA', 'MAR', 'MOROCCO', '摩洛哥', 'Morocco', '504', '212');
INSERT INTO `t_country` VALUES ('145', 'MZ', 'MOZ', 'MOZAMBIQUE', 'MOZAMBIQUE', 'Mozambique', '508', '258');
INSERT INTO `t_country` VALUES ('146', 'MM', 'MMR', 'MYANMAR', '缅甸', 'Myanmar', '104', '95');
INSERT INTO `t_country` VALUES ('147', 'NA', 'NAM', 'NAMIBIA', '纳米比亚', 'Namibia', '516', '264');
INSERT INTO `t_country` VALUES ('148', 'NR', 'NRU', 'NAURU', '瑙鲁', 'Nauru', '520', '674');
INSERT INTO `t_country` VALUES ('149', 'NP', 'NPL', 'NEPAL', '尼泊尔', 'Nepal', '524', '977');
INSERT INTO `t_country` VALUES ('150', 'NL', 'NLD', 'NETHERLANDS', '荷兰', 'Netherlands', '528', '31');
INSERT INTO `t_country` VALUES ('151', 'AN', 'ANT', 'NETHERLANDS ANTILLES', '荷属安的列斯群岛', 'Netherlands Antilles', '530', '599');
INSERT INTO `t_country` VALUES ('152', 'NC', 'NCL', 'NEW CALEDONIA', '新喀里多尼亚', 'New Caledonia', '540', '687');
INSERT INTO `t_country` VALUES ('153', 'NZ', 'NZL', 'NEW ZEALAND', '新西兰', 'New Zealand', '554', '64');
INSERT INTO `t_country` VALUES ('154', 'NI', 'NIC', 'NICARAGUA', '尼加拉瓜', 'Nicaragua', '558', '505');
INSERT INTO `t_country` VALUES ('155', 'NE', 'NER', 'NIGER', '尼日尔', 'Niger', '562', '227');
INSERT INTO `t_country` VALUES ('156', 'NG', 'NGA', 'NIGERIA', '尼日利亚', 'Nigeria', '566', '234');
INSERT INTO `t_country` VALUES ('157', 'NU', 'NIU', 'NIUE', '纽埃岛', 'Niue', '570', '683');
INSERT INTO `t_country` VALUES ('158', 'NF', 'NFK', 'NORFOLK ISLAND', '诺福克岛', 'Norfolk Island', '574', '672');
INSERT INTO `t_country` VALUES ('159', 'MP', 'MNP', 'NORTHERN MARIANA ISLANDS', '北马里亚纳群岛', 'Northern Mariana Islands', '580', '1670');
INSERT INTO `t_country` VALUES ('160', 'NO', 'NOR', 'NORWAY', '挪威', 'Norway', '578', '47');
INSERT INTO `t_country` VALUES ('161', 'OM', 'OMN', 'OMAN', '阿曼', 'Oman', '512', '968');
INSERT INTO `t_country` VALUES ('162', 'PK', 'PAK', 'PAKISTAN', '巴基斯坦', 'Pakistan', '586', '92');
INSERT INTO `t_country` VALUES ('163', 'PW', 'PLW', 'PALAU', '帕劳', 'Palau', '585', '680');
INSERT INTO `t_country` VALUES ('164', 'PS', null, 'PALESTINIAN TERRITORY, OCCUPIED', '巴勒斯坦的领土,占领', 'Palestinian Territory, Occupied', null, '970');
INSERT INTO `t_country` VALUES ('165', 'PA', 'PAN', 'PANAMA', '巴拿马', 'Panama', '591', '507');
INSERT INTO `t_country` VALUES ('166', 'PG', 'PNG', 'PAPUA NEW GUINEA', '巴布新几内亚', 'Papua New Guinea', '598', '675');
INSERT INTO `t_country` VALUES ('167', 'PY', 'PRY', 'PARAGUAY', '巴拉圭', 'Paraguay', '600', '595');
INSERT INTO `t_country` VALUES ('168', 'PE', 'PER', 'PERU', '秘鲁', 'Peru', '604', '51');
INSERT INTO `t_country` VALUES ('169', 'PH', 'PHL', 'PHILIPPINES', '菲律宾', 'Philippines', '608', '63');
INSERT INTO `t_country` VALUES ('170', 'PN', 'PCN', 'PITCAIRN', '皮特克恩', 'Pitcairn', '612', '0');
INSERT INTO `t_country` VALUES ('171', 'PL', 'POL', 'POLAND', '波兰', 'Poland', '616', '48');
INSERT INTO `t_country` VALUES ('172', 'PT', 'PRT', 'PORTUGAL', '葡萄牙', 'Portugal', '620', '351');
INSERT INTO `t_country` VALUES ('173', 'PR', 'PRI', 'PUERTO RICO', '波多黎各', 'Puerto Rico', '630', '1787');
INSERT INTO `t_country` VALUES ('174', 'QA', 'QAT', 'QATAR', '卡塔尔', 'Qatar', '634', '974');
INSERT INTO `t_country` VALUES ('175', 'RE', 'REU', 'REUNION', '团聚', 'Reunion', '638', '262');
INSERT INTO `t_country` VALUES ('176', 'RO', 'ROM', 'ROMANIA', '罗马尼亚', 'Romania', '642', '40');
INSERT INTO `t_country` VALUES ('177', 'RU', 'RUS', 'RUSSIAN FEDERATION', '俄罗斯联邦', 'Russian Federation', '643', '70');
INSERT INTO `t_country` VALUES ('178', 'RW', 'RWA', 'RWANDA', '卢旺达', 'Rwanda', '646', '250');
INSERT INTO `t_country` VALUES ('179', 'SH', 'SHN', 'SAINT HELENA', '圣赫勒拿', 'Saint Helena', '654', '290');
INSERT INTO `t_country` VALUES ('180', 'KN', 'KNA', 'SAINT KITTS AND NEVIS', '圣基茨和尼维斯', 'Saint Kitts and Nevis', '659', '1869');
INSERT INTO `t_country` VALUES ('181', 'LC', 'LCA', 'SAINT LUCIA', '圣卢西亚岛', 'Saint Lucia', '662', '1758');
INSERT INTO `t_country` VALUES ('182', 'PM', 'SPM', 'SAINT PIERRE AND MIQUELON', '圣皮埃尔和MIQUELON', 'Saint Pierre and Miquelon', '666', '508');
INSERT INTO `t_country` VALUES ('183', 'VC', 'VCT', 'SAINT VINCENT AND THE GRENADINES', '圣文森特和格林纳丁斯', 'Saint Vincent and the Grenadines', '670', '1784');
INSERT INTO `t_country` VALUES ('184', 'WS', 'WSM', 'SAMOA', '萨摩亚', 'Samoa', '882', '684');
INSERT INTO `t_country` VALUES ('185', 'SM', 'SMR', 'SAN MARINO', '圣马力诺', 'San Marino', '674', '378');
INSERT INTO `t_country` VALUES ('186', 'ST', 'STP', 'SAO TOME AND PRINCIPE', '圣多美和王子', 'Sao Tome and Principe', '678', '239');
INSERT INTO `t_country` VALUES ('187', 'SA', 'SAU', 'SAUDI ARABIA', '沙特阿拉伯', 'Saudi Arabia', '682', '966');
INSERT INTO `t_country` VALUES ('188', 'SN', 'SEN', 'SENEGAL', '塞内加尔', 'Senegal', '686', '221');
INSERT INTO `t_country` VALUES ('189', 'CS', null, 'SERBIA AND MONTENEGRO', '塞尔维亚和黑山', 'Serbia and Montenegro', null, '381');
INSERT INTO `t_country` VALUES ('190', 'SC', 'SYC', 'SEYCHELLES', '塞舌尔', 'Seychelles', '690', '248');
INSERT INTO `t_country` VALUES ('191', 'SL', 'SLE', 'SIERRA LEONE', '塞拉利昂', 'Sierra Leone', '694', '232');
INSERT INTO `t_country` VALUES ('192', 'SG', 'SGP', 'SINGAPORE', '新加坡', 'Singapore', '702', '65');
INSERT INTO `t_country` VALUES ('193', 'SK', 'SVK', 'SLOVAKIA', '斯洛伐克', 'Slovakia', '703', '421');
INSERT INTO `t_country` VALUES ('194', 'SI', 'SVN', 'SLOVENIA', '斯洛文尼亚', 'Slovenia', '705', '386');
INSERT INTO `t_country` VALUES ('195', 'SB', 'SLB', 'SOLOMON ISLANDS', '所罗门群岛', 'Solomon Islands', '90', '677');
INSERT INTO `t_country` VALUES ('196', 'SO', 'SOM', 'SOMALIA', '索马里', 'Somalia', '706', '252');
INSERT INTO `t_country` VALUES ('197', 'ZA', 'ZAF', 'SOUTH AFRICA', '南非', 'South Africa', '710', '27');
INSERT INTO `t_country` VALUES ('198', 'GS', null, 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', '南乔治亚岛和南桑威奇群岛', 'South Georgia and the South Sandwich Islands', null, '0');
INSERT INTO `t_country` VALUES ('199', 'ES', 'ESP', 'SPAIN', '西班牙', 'Spain', '724', '34');
INSERT INTO `t_country` VALUES ('200', 'LK', 'LKA', 'SRI LANKA', '斯里兰卡', 'Sri Lanka', '144', '94');
INSERT INTO `t_country` VALUES ('201', 'SD', 'SDN', 'SUDAN', '苏丹', 'Sudan', '736', '249');
INSERT INTO `t_country` VALUES ('202', 'SR', 'SUR', 'SURINAME', '苏里南', 'Suriname', '740', '597');
INSERT INTO `t_country` VALUES ('203', 'SJ', 'SJM', 'SVALBARD AND JAN MAYEN', '斯瓦尔巴群岛和扬马延岛', 'Svalbard and Jan Mayen', '744', '47');
INSERT INTO `t_country` VALUES ('204', 'SZ', 'SWZ', 'SWAZILAND', '斯威士兰', 'Swaziland', '748', '268');
INSERT INTO `t_country` VALUES ('205', 'SE', 'SWE', 'SWEDEN', '瑞典', 'Sweden', '752', '46');
INSERT INTO `t_country` VALUES ('206', 'CH', 'CHE', 'SWITZERLAND', '瑞士', 'Switzerland', '756', '41');
INSERT INTO `t_country` VALUES ('207', 'SY', 'SYR', 'SYRIAN ARAB REPUBLIC', '阿拉伯叙利亚共和国', 'Syrian Arab Republic', '760', '963');
INSERT INTO `t_country` VALUES ('208', 'TW', 'TWN', 'TAIWAN, PROVINCE OF CHINA', '台湾,中国的省份', 'Taiwan, Province of China', '158', '886');
INSERT INTO `t_country` VALUES ('209', 'TJ', 'TJK', 'TAJIKISTAN', '塔吉克斯坦', 'Tajikistan', '762', '992');
INSERT INTO `t_country` VALUES ('210', 'TZ', 'TZA', 'TANZANIA, UNITED REPUBLIC OF', '坦桑尼亚联合共和国', 'Tanzania, United Republic of', '834', '255');
INSERT INTO `t_country` VALUES ('211', 'TH', 'THA', 'THAILAND', '泰国', 'Thailand', '764', '66');
INSERT INTO `t_country` VALUES ('212', 'TL', null, 'TIMOR-LESTE', '东帝汶', 'Timor-Leste', null, '670');
INSERT INTO `t_country` VALUES ('213', 'TG', 'TGO', 'TOGO', '多哥', 'Togo', '768', '228');
INSERT INTO `t_country` VALUES ('214', 'TK', 'TKL', 'TOKELAU', '托克劳', 'Tokelau', '772', '690');
INSERT INTO `t_country` VALUES ('215', 'TO', 'TON', 'TONGA', '汤加', 'Tonga', '776', '676');
INSERT INTO `t_country` VALUES ('216', 'TT', 'TTO', 'TRINIDAD AND TOBAGO', '特立尼达和多巴哥', 'Trinidad and Tobago', '780', '1868');
INSERT INTO `t_country` VALUES ('217', 'TN', 'TUN', 'TUNISIA', '突尼斯', 'Tunisia', '788', '216');
INSERT INTO `t_country` VALUES ('218', 'TR', 'TUR', 'TURKEY', '土耳其', 'Turkey', '792', '90');
INSERT INTO `t_country` VALUES ('219', 'TM', 'TKM', 'TURKMENISTAN', '土库曼斯坦', 'Turkmenistan', '795', '7370');
INSERT INTO `t_country` VALUES ('220', 'TC', 'TCA', 'TURKS AND CAICOS ISLANDS', '特克斯和凯科斯群岛', 'Turks and Caicos Islands', '796', '1649');
INSERT INTO `t_country` VALUES ('221', 'TV', 'TUV', 'TUVALU', '图瓦卢', 'Tuvalu', '798', '688');
INSERT INTO `t_country` VALUES ('222', 'UG', 'UGA', 'UGANDA', '乌干达', 'Uganda', '800', '256');
INSERT INTO `t_country` VALUES ('223', 'UA', 'UKR', 'UKRAINE', '乌克兰', 'Ukraine', '804', '380');
INSERT INTO `t_country` VALUES ('224', 'AE', 'ARE', 'UNITED ARAB EMIRATES', '阿拉伯联合酋长国', 'United Arab Emirates', '784', '971');
INSERT INTO `t_country` VALUES ('225', 'GB', 'GBR', 'UNITED KINGDOM', '联合王国', 'United Kingdom', '826', '44');
INSERT INTO `t_country` VALUES ('226', 'US', 'USA', 'UNITED STATES', '美国', 'United States', '840', '1');
INSERT INTO `t_country` VALUES ('227', 'UM', null, 'UNITED STATES MINOR OUTLYING ISLANDS', '美国小离岛', 'United States Minor Outlying Islands', null, '1');
INSERT INTO `t_country` VALUES ('228', 'UY', 'URY', 'URUGUAY', '乌拉圭', 'Uruguay', '858', '598');
INSERT INTO `t_country` VALUES ('229', 'UZ', 'UZB', 'UZBEKISTAN', '乌兹别克斯坦', 'Uzbekistan', '860', '998');
INSERT INTO `t_country` VALUES ('230', 'VU', 'VUT', 'VANUATU', '瓦努阿图', 'Vanuatu', '548', '678');
INSERT INTO `t_country` VALUES ('231', 'VE', 'VEN', 'VENEZUELA', '委内瑞拉', 'Venezuela', '862', '58');
INSERT INTO `t_country` VALUES ('232', 'VN', 'VNM', 'VIET NAM', '越南', 'Viet Nam', '704', '84');
INSERT INTO `t_country` VALUES ('233', 'VG', 'VGB', 'VIRGIN ISLANDS, BRITISH', '维尔京群岛,英国', 'Virgin Islands, British', '92', '1284');
INSERT INTO `t_country` VALUES ('234', 'VI', 'VIR', 'VIRGIN ISLANDS, U.S.', '维尔京群岛,美国', 'Virgin Islands, U.s.', '850', '1340');
INSERT INTO `t_country` VALUES ('235', 'WF', 'WLF', 'WALLIS AND FUTUNA', '瓦利斯群岛和富图纳群岛', 'Wallis and Futuna', '876', '681');
INSERT INTO `t_country` VALUES ('236', 'EH', 'ESH', 'WESTERN SAHARA', '西撒哈拉', 'Western Sahara', '732', '212');
INSERT INTO `t_country` VALUES ('237', 'YE', 'YEM', 'YEMEN', '也门', 'Yemen', '887', '967');
INSERT INTO `t_country` VALUES ('238', 'ZM', 'ZMB', 'ZAMBIA', '赞比亚', 'Zambia', '894', '260');
INSERT INTO `t_country` VALUES ('239', 'ZW', 'ZWE', 'ZIMBABWE', '津巴布韦', 'Zimbabwe', '716', '263');

作者：hisenyuan
链接：https://www.jianshu.com/p/dc811a2f6769
來源：简书
简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。