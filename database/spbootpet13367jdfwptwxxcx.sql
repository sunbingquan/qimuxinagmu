/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : spbootpet13367jdfwptwxxcx

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2022-05-26 06:56:19
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cx` varchar(50) NOT NULL COMMENT '权限',
  `username` varchar(50) NOT NULL COMMENT '帐号',
  `pwd` varchar(128) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员';

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', '管理员', 'admin', '$2y$10$7nin9X3L8GggRlAwA4JJ2.A5eA1zzV8tDD9W7/h0JjnOblwXaoNzK');

-- ----------------------------
-- Table structure for `dingdan`
-- ----------------------------
DROP TABLE IF EXISTS `dingdan`;
CREATE TABLE `dingdan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dingdanhao` varchar(50) NOT NULL COMMENT '订单号',
  `shangpin` text NOT NULL COMMENT '商品',
  `jine` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `zhuangtai` varchar(50) NOT NULL COMMENT '状态',
  `shouhuoxinxi` int(10) unsigned NOT NULL COMMENT '收货信息ID',
  `shouhuoren` varchar(50) NOT NULL COMMENT '收货人',
  `lianxidianhua` varchar(50) NOT NULL COMMENT '联系电话',
  `xiangxidizhi` varchar(50) NOT NULL COMMENT '详细地址',
  `beizhu` text NOT NULL COMMENT '备注',
  `xiadanren` varchar(50) NOT NULL COMMENT '下单人',
  `iszf` varchar(10) NOT NULL DEFAULT '否' COMMENT '是否支付',
  PRIMARY KEY (`id`),
  KEY `dingdan_shouhuoxinxi_index` (`shouhuoxinxi`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='订单';

-- ----------------------------
-- Records of dingdan
-- ----------------------------
INSERT INTO `dingdan` VALUES ('4', '052606515507', '', '27600.00', '已收货', '4', '啦啦啦', '13666666666', 'XXX路XXXX号', '测试', '2', '是');

-- ----------------------------
-- Table structure for `dingdanshangpin`
-- ----------------------------
DROP TABLE IF EXISTS `dingdanshangpin`;
CREATE TABLE `dingdanshangpin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dingdanid` int(10) unsigned NOT NULL COMMENT '订单id',
  `jiajuid` int(10) unsigned NOT NULL COMMENT '家具id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `pinpai` varchar(50) NOT NULL COMMENT '品牌',
  `tupian` text NOT NULL COMMENT '图片',
  `jiage` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `shuliang` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `xiaoji` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '小计',
  `goumairen` varchar(50) NOT NULL COMMENT '购买人',
  PRIMARY KEY (`id`),
  KEY `dingdanshangpin_dingdanid_index` (`dingdanid`),
  KEY `dingdanshangpin_jiajuid_index` (`jiajuid`),
  KEY `dingdanshangpin_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='订单商品';

-- ----------------------------
-- Records of dingdanshangpin
-- ----------------------------
INSERT INTO `dingdanshangpin` VALUES ('1', '1', '1', '032700547418', '格力（GREE）空调 京东小家智能生态 3匹', '1', '格力（GREE）', '/upload/ef64f098ac964676a238248de7ab7619.png,/upload/b0d7848c1d80465d8585acd9b5e260cb.png,/upload/15e674e66f494963bdf8bb766e071585.png,/upload/b5397bee692e45328e9e2c22f973d942.png', '7599.00', '1', '7599.00', '1');
INSERT INTO `dingdanshangpin` VALUES ('2', '1', '7', '032701332843', '佳尼特 60升电热水器 A.O.史密斯家族年轻时尚', '1', '佳尼特', '/upload/4d0a9adbdedf4d2fbf3a68bf75ecc629.png,/upload/1b21f0349df3471f983928d7e7726f4b.png,/upload/cbccefd8ccc44abb97410fceb1f40937.png,/upload/a6e139b399ee4cf7a4743d692f496e10.png', '2798.00', '1', '2798.00', '1');
INSERT INTO `dingdanshangpin` VALUES ('4', '2', '7', '032701332843', '佳尼特 60升电热水器 A.O.史密斯家族年轻时尚', '1', '佳尼特', '/upload/4d0a9adbdedf4d2fbf3a68bf75ecc629.png,/upload/1b21f0349df3471f983928d7e7726f4b.png,/upload/cbccefd8ccc44abb97410fceb1f40937.png,/upload/a6e139b399ee4cf7a4743d692f496e10.png', '2798.00', '1', '2798.00', '1');
INSERT INTO `dingdanshangpin` VALUES ('5', '3', '7', '032701332843', '佳尼特 60升电热水器 A.O.史密斯家族年轻时尚', '1', '佳尼特', '/upload/4d0a9adbdedf4d2fbf3a68bf75ecc629.png,/upload/1b21f0349df3471f983928d7e7726f4b.png,/upload/cbccefd8ccc44abb97410fceb1f40937.png,/upload/a6e139b399ee4cf7a4743d692f496e10.png', '2798.00', '1', '2798.00', '1');
INSERT INTO `dingdanshangpin` VALUES ('6', '3', '8', '032701345889', '美的（Midea）16套大容量 嵌入式 五臂飓风洗 双驱变频 三星消毒 分层洗', '2', '美的（Midea）', '/upload/85451524daa44191b12c99d62bd80654.png,/upload/e4128556c8164974b95ece213c567075.png,/upload/274dea3fdbf442858cc978406f0b91f3.png,/upload/3603107eb6da4b81ba3f59eac9631597.png', '9999.00', '1', '9999.00', '1');
INSERT INTO `dingdanshangpin` VALUES ('8', '4', '3', '032701267650', '亿田（entive）D2ZK 集成灶蒸烤一体 家用蒸箱烤箱', '2', '亿田（entive）', '/upload/9201a417bfdc4af489b26c8c0b4e0107.png,/upload/c568f1fa2e234b17b89003dbaba8a623.png,/upload/95b995cbf873422d8b154acbd768c471.png,/upload/30e8538a1db44b7291c47f29b94107eb.png', '13800.00', '2', '27600.00', '2');

-- ----------------------------
-- Table structure for `fahuo`
-- ----------------------------
DROP TABLE IF EXISTS `fahuo`;
CREATE TABLE `fahuo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dingdanid` int(10) unsigned NOT NULL COMMENT '订单id',
  `dingdanhao` varchar(50) NOT NULL COMMENT '订单号',
  `shangpin` text NOT NULL COMMENT '商品',
  `shouhuoren` varchar(50) NOT NULL COMMENT '收货人',
  `lianxidianhua` varchar(50) NOT NULL COMMENT '联系电话',
  `xiangxidizhi` varchar(50) NOT NULL COMMENT '详细地址',
  `xiadanren` varchar(50) NOT NULL COMMENT '下单人',
  `kuaididanhao` varchar(50) NOT NULL COMMENT '快递单号',
  `kuaidigongsi` varchar(50) NOT NULL COMMENT '快递公司',
  `kuaididianhua` varchar(50) NOT NULL COMMENT '快递电话',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发货时间',
  PRIMARY KEY (`id`),
  KEY `fahuo_dingdanid_index` (`dingdanid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='发货';

-- ----------------------------
-- Records of fahuo
-- ----------------------------
INSERT INTO `fahuo` VALUES ('3', '4', '052606515507', '', '啦啦啦', '13666666666', 'XXX路XXXX号', '2', 'SF432543', '顺丰', '13333333333', '2022-05-26 06:52:21');

-- ----------------------------
-- Table structure for `fahuoshangpin`
-- ----------------------------
DROP TABLE IF EXISTS `fahuoshangpin`;
CREATE TABLE `fahuoshangpin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fahuoid` int(10) unsigned NOT NULL COMMENT '发货id',
  `jiajuid` int(10) unsigned NOT NULL COMMENT '家具id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `pinpai` varchar(50) NOT NULL COMMENT '品牌',
  `tupian` text NOT NULL COMMENT '图片',
  `jiage` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `shuliang` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `xiaoji` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '小计',
  `goumairen` varchar(50) NOT NULL COMMENT '购买人',
  PRIMARY KEY (`id`),
  KEY `fahuoshangpin_fahuoid_index` (`fahuoid`),
  KEY `fahuoshangpin_jiajuid_index` (`jiajuid`),
  KEY `fahuoshangpin_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='发货商品';

-- ----------------------------
-- Records of fahuoshangpin
-- ----------------------------
INSERT INTO `fahuoshangpin` VALUES ('1', '1', '1', '032700547418', '格力（GREE）空调 京东小家智能生态 3匹', '1', '格力（GREE）', '/upload/ef64f098ac964676a238248de7ab7619.png,/upload/b0d7848c1d80465d8585acd9b5e260cb.png,/upload/15e674e66f494963bdf8bb766e071585.png,/upload/b5397bee692e45328e9e2c22f973d942.png', '7599.00', '1', '7599.00', '1');
INSERT INTO `fahuoshangpin` VALUES ('2', '1', '7', '032701332843', '佳尼特 60升电热水器 A.O.史密斯家族年轻时尚', '1', '佳尼特', '/upload/4d0a9adbdedf4d2fbf3a68bf75ecc629.png,/upload/1b21f0349df3471f983928d7e7726f4b.png,/upload/cbccefd8ccc44abb97410fceb1f40937.png,/upload/a6e139b399ee4cf7a4743d692f496e10.png', '2798.00', '1', '2798.00', '1');
INSERT INTO `fahuoshangpin` VALUES ('4', '2', '7', '032701332843', '佳尼特 60升电热水器 A.O.史密斯家族年轻时尚', '1', '佳尼特', '/upload/4d0a9adbdedf4d2fbf3a68bf75ecc629.png,/upload/1b21f0349df3471f983928d7e7726f4b.png,/upload/cbccefd8ccc44abb97410fceb1f40937.png,/upload/a6e139b399ee4cf7a4743d692f496e10.png', '2798.00', '1', '2798.00', '1');
INSERT INTO `fahuoshangpin` VALUES ('5', '2', '8', '032701345889', '美的（Midea）16套大容量 嵌入式 五臂飓风洗 双驱变频 三星消毒 分层洗', '2', '美的（Midea）', '/upload/85451524daa44191b12c99d62bd80654.png,/upload/e4128556c8164974b95ece213c567075.png,/upload/274dea3fdbf442858cc978406f0b91f3.png,/upload/3603107eb6da4b81ba3f59eac9631597.png', '9999.00', '1', '9999.00', '1');
INSERT INTO `fahuoshangpin` VALUES ('7', '3', '3', '032701267650', '亿田（entive）D2ZK 集成灶蒸烤一体 家用蒸箱烤箱', '2', '亿田（entive）', '/upload/9201a417bfdc4af489b26c8c0b4e0107.png,/upload/c568f1fa2e234b17b89003dbaba8a623.png,/upload/95b995cbf873422d8b154acbd768c471.png,/upload/30e8538a1db44b7291c47f29b94107eb.png', '13800.00', '2', '27600.00', '2');

-- ----------------------------
-- Table structure for `fenlei`
-- ----------------------------
DROP TABLE IF EXISTS `fenlei`;
CREATE TABLE `fenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fenleiming` varchar(50) NOT NULL COMMENT '分类名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='分类';

-- ----------------------------
-- Records of fenlei
-- ----------------------------
INSERT INTO `fenlei` VALUES ('1', '家居电器');
INSERT INTO `fenlei` VALUES ('2', '厨卫电器');

-- ----------------------------
-- Table structure for `gouwuche`
-- ----------------------------
DROP TABLE IF EXISTS `gouwuche`;
CREATE TABLE `gouwuche` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jiajuid` int(10) unsigned NOT NULL COMMENT '家具id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `pinpai` varchar(50) NOT NULL COMMENT '品牌',
  `tupian` text NOT NULL COMMENT '图片',
  `jiage` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `shuliang` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `xiaoji` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '小计',
  `goumairen` varchar(50) NOT NULL COMMENT '购买人',
  PRIMARY KEY (`id`),
  KEY `gouwuche_jiajuid_index` (`jiajuid`),
  KEY `gouwuche_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='购物车';

-- ----------------------------
-- Records of gouwuche
-- ----------------------------

-- ----------------------------
-- Table structure for `jiaju`
-- ----------------------------
DROP TABLE IF EXISTS `jiaju`;
CREATE TABLE `jiaju` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `pinpai` varchar(50) NOT NULL COMMENT '品牌',
  `tupian` text NOT NULL COMMENT '图片',
  `jiage` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `kucun` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `xiaoliang` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `xiangqing` longtext NOT NULL COMMENT '详情',
  `tianjiaren` varchar(50) NOT NULL COMMENT '添加人',
  PRIMARY KEY (`id`),
  KEY `jiaju_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='家具';

-- ----------------------------
-- Records of jiaju
-- ----------------------------
INSERT INTO `jiaju` VALUES ('1', '032700547418', '格力（GREE）空调 京东小家智能生态 3匹', '1', '格力（GREE）', '/upload/ef64f098ac964676a238248de7ab7619.png,/upload/b0d7848c1d80465d8585acd9b5e260cb.png,/upload/15e674e66f494963bdf8bb766e071585.png,/upload/b5397bee692e45328e9e2c22f973d942.png', '7599.00', '100', '0', '<ul class=\"parameter2 p-parameter-list\">\n<li title=\"格力KFR-72LW/(72587)FNhAd-B1(JDWIFI)\">商品名称：格力KFR-72LW/(72587)FNhAd-B1(JDWIFI)</li>\n<li title=\"37.5kg\">商品毛重：37.5kg</li>\n<li title=\"中国大陆\">商品产地：中国大陆</li>\n<li title=\"键控/遥控，APP操控\">操控方式：键控/遥控，APP操控</li>\n<li title=\"一级能效\">能效等级：一级能效</li>\n<li title=\"变频\">变频/定频：变频</li>\n<li title=\"无\">净化类型：无</li>\n<li title=\"圆柱式\">类型：圆柱式</li>\n<li title=\"冷暖\">冷暖类型：冷暖</li>\n<li title=\"3匹\">匹数：3匹</li>\n<li title=\"自清洁，独立除湿\">功能：自清洁，独立除湿</li>\n</ul>\n<p><img src=\"http://localhost:8088/upload/866b975fbe584d47879a4a9874210135.png\" /><img src=\"http://localhost:8088/upload/690432de4189412d970c79b8924882c4.png\" /><img src=\"http://localhost:8088/upload/1624b39a38534c318f4277d9c901968f.png\" /><img src=\"http://localhost:8088/upload/d8ee769d723f46cd825d2dccc97ded05.png\" /></p>', 'admin');
INSERT INTO `jiaju` VALUES ('2', '032701248850', '海尔（Haier）新一级能效 静悦 1.5匹 变频 冷暖挂式空调挂机', '1', '海尔（Haier）', '/upload/2c653ff62206426f97aed64e68ce93f7.png,/upload/a8f6609c14a548649cb369bbaca412eb.png,/upload/726c6d3780344512a16ef00410a9763a.png,/upload/1a03907d29f94b79899d5ded07503953.png', '2799.00', '100', '0', '<ul class=\"parameter2 p-parameter-list\">\n<li title=\"海尔KFR-35GW/01KBB81U1\">商品名称：海尔KFR-35GW/01KBB81U1</li>\n<li title=\"12.0kg\">商品毛重：12.0kg</li>\n<li title=\"中国大陆\">商品产地：中国大陆</li>\n<li title=\"键控/遥控，APP操控\">操控方式：键控/遥控，APP操控</li>\n<li title=\"一级能效\">能效等级：一级能效</li>\n<li title=\"变频\">变频/定频：变频</li>\n<li title=\"壁挂式\">类型：壁挂式</li>\n<li title=\"冷暖\">冷暖类型：冷暖</li>\n<li title=\"智能调节，自清洁，独立除湿\">功能：智能调节，自清洁，独立除湿</li>\n<li title=\"净化除菌，舒适风\">用户优选：净化除菌，舒适风</li>\n<li title=\"抗菌，除菌\">净化类型：抗菌，除菌</li>\n<li title=\"1.5匹\">匹数：1.5匹</li>\n</ul>\n<p><img src=\"http://localhost:8088/upload/2316d20eddf942f6901f5d846cfb98c8.png\" /><img src=\"http://localhost:8088/upload/5a515eae4fa149f3990801f0053cc35e.png\" /><img src=\"http://localhost:8088/upload/c20ad2d60e804530b7b95f3341d1f8fb.png\" /><img src=\"http://localhost:8088/upload/dc3b5c5011964489a8fd1e864eb1d119.png\" /></p>', 'admin');
INSERT INTO `jiaju` VALUES ('3', '032701267650', '亿田（entive）D2ZK 集成灶蒸烤一体 家用蒸箱烤箱', '2', '亿田（entive）', '/upload/9201a417bfdc4af489b26c8c0b4e0107.png,/upload/c568f1fa2e234b17b89003dbaba8a623.png,/upload/95b995cbf873422d8b154acbd768c471.png,/upload/30e8538a1db44b7291c47f29b94107eb.png', '13800.00', '98', '2', '<ul class=\"parameter2 p-parameter-list\">\n<li title=\"亿田D2ZK\">商品名称：亿田D2ZK</li>\n<li title=\"123.0kg\">商品毛重：123.0kg</li>\n<li title=\"中国大陆\">商品产地：中国大陆</li>\n<li title=\"双眼\">灶眼数量：双眼</li>\n<li title=\"17m&sup3;/min\">烟机排风量：17m&sup3;/min</li>\n<li title=\"钢化玻璃\">灶具面板材质：钢化玻璃</li>\n<li title=\"集成蒸烤箱\">类型：集成蒸烤箱</li>\n<li title=\"有保温置物台\">保温置物台：有保温置物台</li>\n<li title=\"预约功能\">功能：预约功能</li>\n<li title=\"上下进风\">灶具进风：上下进风</li>\n<li title=\"5kW及以上\">火力大小：5kW及以上</li>\n<li title=\"59-69cm\">宽度：59-69cm</li>\n<li title=\"可拆卸\">吸烟腔工艺：可拆卸</li>\n<li title=\"341-400Pa\">风压：341-400Pa</li>\n<li title=\"天然气(12T)\">气源：天然气(12T)</li>\n<li title=\"66-70L\">烤箱容量：66-70L</li>\n<li title=\"66-70L\">蒸箱容量：66-70L</li>\n<li title=\"一级能效\">能效等级：一级能效</li>\n</ul>\n<p><img src=\"http://localhost:8088/upload/58073603b2dd4b5a9979d3e89016c3e2.png\" /><img src=\"http://localhost:8088/upload/8a7283ee3e1a47bfaa799ae0ddc05d30.png\" /><img src=\"http://localhost:8088/upload/647cb72301c344c19882c102847af9bf.png\" /><img src=\"http://localhost:8088/upload/f152b4ee2a514db4b50902f47514b988.png\" /></p>', 'admin');
INSERT INTO `jiaju` VALUES ('4', '032701271654', '能率（NORITZ）燃气热水器16升 智能精控恒温', '2', '能率（NORITZ）', '/upload/36aab4dbe6c14406b35f5796f0990f18.png,/upload/b738866c438743e0a2d954d38a4d0672.png,/upload/9bc15d8aa6fa43dc9193d9bac97c9c1c.png,/upload/356eb50bbc2c4b4ab70d3f9e69928281.png', '3998.00', '100', '0', '<ul class=\"parameter2 p-parameter-list\">\n<li title=\"能率16E4AFEX\">商品名称：能率16E4AFEX</li>\n<li title=\"18.0kg\">商品毛重：18.0kg</li>\n<li title=\"中国大陆\">商品产地：中国大陆</li>\n<li title=\"16E4AFEX\">货号：16E4AFEX</li>\n<li title=\"按键式\">操控方式：按键式</li>\n<li title=\"二级能效\">能效等级：二级能效</li>\n<li title=\"强排式\">类型：强排式</li>\n<li title=\"水量伺服器\">控温方式：水量伺服器</li>\n<li title=\"节能省气，大出水量，低压启动，水量伺服器，高清大屏\">特征特质：节能省气，大出水量，低压启动，水量伺服器，高清大屏</li>\n<li title=\"电辅防冻\">是否防冻：电辅防冻</li>\n<li title=\"天然气(12T)\">气源：天然气(12T)</li>\n<li title=\"300元封顶\">安装费用：300元封顶</li>\n<li title=\"16L\">燃热出水量：16L</li>\n<li title=\"全屋多点供水\">适用户型：全屋多点供水</li>\n</ul>\n<p><img src=\"http://localhost:8088/upload/1be3017ad0a245a297631f1c157cd35c.png\" /><img src=\"http://localhost:8088/upload/e545426c39684ee3b1b0c3d7bf739f85.png\" /><img src=\"http://localhost:8088/upload/2f898823535a471b8d56efc81566f60d.png\" /><img src=\"http://localhost:8088/upload/35220aa47e8348dd9395af476ec5bc3d.png\" /></p>', 'admin');
INSERT INTO `jiaju` VALUES ('5', '032701308754', '索尼（SONY）XR-75X90J 75英寸 全面屏 游戏电视 4K', '1', '索尼（SONY）', '/upload/4798c0d32a96447697df3fb48a729d4b.png,/upload/fc788281cd9a4ecb9cb5fbe889a320d9.png,/upload/af15f62e537a49afba153f34737f907c.png,/upload/ea5319853c0d46819aa2b5ccf1922076.png', '10999.00', '100', '0', '<ul class=\"parameter2 p-parameter-list\">\n<li title=\"索尼XR-75X90J\">商品名称：索尼XR-75X90J</li>\n<li title=\"49.0kg\">商品毛重：49.0kg</li>\n<li title=\"中国\">商品产地：中国</li>\n<li title=\"4K超清，游戏电视\">电视类型：4K超清，游戏电视</li>\n<li title=\"3840*2160\">分辨率：3840*2160</li>\n<li title=\"三级能效\">能效等级：三级能效</li>\n</ul>\n<p><img src=\"http://localhost:8088/upload/06b3f80dac144fb5ac635b7fa3ee8e7d.png\" /><img src=\"http://localhost:8088/upload/2518f832c69b4488b4c68b6305dee03d.png\" /><img src=\"http://localhost:8088/upload/0fe104d69e9a4e1eab12e173d6b8ef39.png\" /><img src=\"http://localhost:8088/upload/a4f06624c47141d5a289d4f169d1b7fc.png\" /></p>', 'admin');
INSERT INTO `jiaju` VALUES ('6', '03270131239', '美的(Midea)606升变频一级能效对开双门家用冰箱', '1', '美的(Midea)', '/upload/b82f9b4ed4334b66ae973cbf89b9a3bd.png,/upload/10293f7d75d24af89d845ecf70932ce7.png,/upload/877cde45be2946888705339386289a70.png,/upload/71fea333521348459110315fda72b7f7.png', '3199.00', '100', '0', '<ul class=\"parameter2 p-parameter-list\">\n<li title=\"美的BCD-606WKPZM(E)\">商品名称：美的BCD-606WKPZM(E)</li>\n<li title=\"100.0kg\">商品毛重：100.0kg</li>\n<li title=\"中国大陆\">商品产地：中国大陆</li>\n<li title=\"一级能效\">能效等级：一级能效</li>\n<li title=\"变频\">变频/定频：变频</li>\n<li title=\"对开门\">门款式：对开门</li>\n<li title=\"PCM彩涂板\">面板材质：PCM彩涂板</li>\n<li title=\"风冷\">制冷方式：风冷</li>\n<li title=\"90.1-95cm\">宽度：90.1-95cm</li>\n<li title=\"600L及以上\">总容积：600L及以上</li>\n<li title=\"170.1-180cm\">高度：170.1-180cm</li>\n<li title=\"独立式\">放置方式：独立式</li>\n<li title=\"灰色系\">主色系：灰色系</li>\n<li title=\"70.1-75cm\">深度：70.1-75cm</li>\n</ul>\n<p><img src=\"http://localhost:8088/upload/98f4d6a6d32c48ee9570c59fa4313346.png\" /><img src=\"http://localhost:8088/upload/a3008c43f51a4588a08966b0357db904.png\" /><img src=\"http://localhost:8088/upload/44fe15f3495f4afd9180c9bcb54d10e8.png\" /><img src=\"http://localhost:8088/upload/bb58baaf9e2d4c9dad22bdb1f423367e.png\" /></p>', 'admin');
INSERT INTO `jiaju` VALUES ('7', '032701332843', '佳尼特 60升电热水器 A.O.史密斯家族年轻时尚', '1', '佳尼特', '/upload/4d0a9adbdedf4d2fbf3a68bf75ecc629.png,/upload/1b21f0349df3471f983928d7e7726f4b.png,/upload/cbccefd8ccc44abb97410fceb1f40937.png,/upload/a6e139b399ee4cf7a4743d692f496e10.png', '2798.00', '98', '2', '<ul class=\"parameter2 p-parameter-list\">\n<li title=\"佳尼特CTE-60KB\">商品名称：佳尼特CTE-60KB</li>\n<li title=\"28.0kg\">商品毛重：28.0kg</li>\n<li title=\"中国大陆\">商品产地：中国大陆</li>\n<li title=\"CTE-60KB\">货号：CTE-60KB</li>\n<li title=\"遥控器控制\">操控方式：遥控器控制</li>\n<li title=\"一级能效\">能效等级：一级能效</li>\n<li title=\"60-79L\">容量：60-79L</li>\n<li title=\"储水式电热水器\">类型：储水式电热水器</li>\n<li title=\"圆筒型\">外观设计：圆筒型</li>\n</ul>\n<p><img src=\"http://localhost:8088/upload/f1c82e42258547c884d8b15fcba1e096.png\" /><img src=\"http://localhost:8088/upload/c4a03e70580d48c9835b5593a425959b.png\" /><img src=\"http://localhost:8088/upload/73fa289ef1c444a9ac07e07f3e89b950.png\" /><img src=\"http://localhost:8088/upload/c22e425516c54a468ff5f3f49c9b16ab.png\" /></p>', 'admin');
INSERT INTO `jiaju` VALUES ('8', '032701345889', '美的（Midea）16套大容量 嵌入式 五臂飓风洗 双驱变频 三星消毒 分层洗', '2', '美的（Midea）', '/upload/85451524daa44191b12c99d62bd80654.png,/upload/e4128556c8164974b95ece213c567075.png,/upload/274dea3fdbf442858cc978406f0b91f3.png,/upload/3603107eb6da4b81ba3f59eac9631597.png', '9999.00', '99', '1', '<ul class=\"parameter2 p-parameter-list\">\n<li title=\"美的GX1000\">商品名称：美的GX1000</li>\n<li title=\"54.3kg\">商品毛重：54.3kg</li>\n<li title=\"中国大陆\">商品产地：中国大陆</li>\n<li title=\"触控式\">操控方式：触控式</li>\n<li title=\"13套及以上\">总容积：13套及以上</li>\n<li title=\"喷淋式\">洗涤方式：喷淋式</li>\n<li title=\"嵌入式\">类型：嵌入式</li>\n<li title=\"前开式\">开门方式：前开式</li>\n<li title=\"高温除菌，烘干，LED屏显\">功能：高温除菌，烘干，LED屏显</li>\n</ul>\n<p><img src=\"http://localhost:8088/upload/3df722de24104ccaad1206d6908fc0c8.png\" /><img src=\"http://localhost:8088/upload/b062fb8d460f4449990feb6620d32303.png\" /><img src=\"http://localhost:8088/upload/a0edbacf6c284bf795c31c6940d03aea.png\" /><img src=\"http://localhost:8088/upload/d0d6daaec3064865a74a5f63cf109642.png\" /></p>', 'admin');

-- ----------------------------
-- Table structure for `liuyanban`
-- ----------------------------
DROP TABLE IF EXISTS `liuyanban`;
CREATE TABLE `liuyanban` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `lianxidianhua` varchar(50) NOT NULL COMMENT '联系电话',
  `liuyanneirong` text NOT NULL COMMENT '留言内容',
  `liuyanren` varchar(50) NOT NULL COMMENT '留言人',
  `huifuneirong` text NOT NULL COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='留言板';

-- ----------------------------
-- Records of liuyanban
-- ----------------------------
INSERT INTO `liuyanban` VALUES ('3', '啦啦啦', '13333333333', '需要安装服务，地址是XXXXXXX', '2', '已经安排师傅上门，时间是XXXX');

-- ----------------------------
-- Table structure for `lunbotu`
-- ----------------------------
DROP TABLE IF EXISTS `lunbotu`;
CREATE TABLE `lunbotu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `image` varchar(255) NOT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='轮播图';

-- ----------------------------
-- Records of lunbotu
-- ----------------------------
INSERT INTO `lunbotu` VALUES ('1', '111', '/upload/331e000866c248b482ec95a7230a8b89.png');
INSERT INTO `lunbotu` VALUES ('2', '222', '/upload/160cec0a78e04ba8ac1e5b27bc323dad.png');
INSERT INTO `lunbotu` VALUES ('3', '333', '/upload/1d72b57774e14c8caf6a8ee1169639ae.png');

-- ----------------------------
-- Table structure for `pinglun`
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `biao` varchar(50) NOT NULL COMMENT '表',
  `biaoid` int(11) NOT NULL DEFAULT '0' COMMENT '表id',
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `pingfen` varchar(255) NOT NULL COMMENT '评分',
  `pinglunneirong` text NOT NULL COMMENT '评论内容',
  `pinglunren` varchar(50) NOT NULL COMMENT '评论人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='评论';

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES ('4', 'jiaju', '3', '亿田（entive）D2ZK 集成灶蒸烤一体 家用蒸箱烤箱', '5', '6666', '2', '2022-05-26 06:44:25');
INSERT INTO `pinglun` VALUES ('5', 'jiaju', '3', '亿田（entive）D2ZK 集成灶蒸烤一体 家用蒸箱烤箱', '5', '88888', '2', '2022-05-26 06:53:25');

-- ----------------------------
-- Table structure for `shoucang`
-- ----------------------------
DROP TABLE IF EXISTS `shoucang`;
CREATE TABLE `shoucang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户',
  `xwid` int(11) NOT NULL DEFAULT '0' COMMENT '关联表id',
  `biao` varchar(50) NOT NULL COMMENT '关联表',
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='收藏';

-- ----------------------------
-- Records of shoucang
-- ----------------------------
INSERT INTO `shoucang` VALUES ('1', '1', '1', 'jiaju', '格力（GREE）空调 京东小家智能生态 3匹', '2022-03-27 01:48:38');
INSERT INTO `shoucang` VALUES ('2', '1', '7', 'jiaju', '佳尼特 60升电热水器 A.O.史密斯家族年轻时尚', '2022-03-27 01:49:09');
INSERT INTO `shoucang` VALUES ('4', '2', '3', 'jiaju', '亿田（entive）D2ZK 集成灶蒸烤一体 家用蒸箱烤箱', '2022-05-26 06:50:45');

-- ----------------------------
-- Table structure for `shouhuo`
-- ----------------------------
DROP TABLE IF EXISTS `shouhuo`;
CREATE TABLE `shouhuo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fahuoid` int(10) unsigned NOT NULL COMMENT '发货id',
  `dingdanhao` varchar(50) NOT NULL COMMENT '订单号',
  `shangpin` text NOT NULL COMMENT '商品',
  `shouhuoren` varchar(50) NOT NULL COMMENT '收货人',
  `xiadanren` varchar(50) NOT NULL COMMENT '下单人',
  `kuaididanhao` varchar(50) NOT NULL COMMENT '快递单号',
  `kuaidigongsi` varchar(50) NOT NULL COMMENT '快递公司',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收货时间',
  PRIMARY KEY (`id`),
  KEY `shouhuo_fahuoid_index` (`fahuoid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='收货';

-- ----------------------------
-- Records of shouhuo
-- ----------------------------
INSERT INTO `shouhuo` VALUES ('3', '3', '052606515507', '', '啦啦啦', '2', 'SF432543', '顺丰', '2022-05-26 06:53:04');

-- ----------------------------
-- Table structure for `shouhuodizhi`
-- ----------------------------
DROP TABLE IF EXISTS `shouhuodizhi`;
CREATE TABLE `shouhuodizhi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shouhuoren` varchar(50) NOT NULL COMMENT '收货人',
  `lianxidianhua` varchar(50) NOT NULL COMMENT '联系电话',
  `xiangxidizhi` varchar(50) NOT NULL COMMENT '详细地址',
  `tianjiaren` varchar(50) NOT NULL COMMENT '添加人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='收货地址';

-- ----------------------------
-- Records of shouhuodizhi
-- ----------------------------
INSERT INTO `shouhuodizhi` VALUES ('1', '张三', '13800138001', '北京市朝阳区朝阳路1号', '1');
INSERT INTO `shouhuodizhi` VALUES ('2', '张老三', '13800138111', '北京市朝阳区朝阳路111号', '1');
INSERT INTO `shouhuodizhi` VALUES ('3', '测试收货人', '13800138888', '测试收货详细地址', '1');
INSERT INTO `shouhuodizhi` VALUES ('4', '啦啦啦', '13666666666', 'XXX路XXXX号', '2');

-- ----------------------------
-- Table structure for `shouhuoshangpin`
-- ----------------------------
DROP TABLE IF EXISTS `shouhuoshangpin`;
CREATE TABLE `shouhuoshangpin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shouhuoid` int(10) unsigned NOT NULL COMMENT '收货id',
  `jiajuid` int(10) unsigned NOT NULL COMMENT '家具id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `pinpai` varchar(50) NOT NULL COMMENT '品牌',
  `tupian` text NOT NULL COMMENT '图片',
  `jiage` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `shuliang` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `xiaoji` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '小计',
  `goumairen` varchar(50) NOT NULL COMMENT '购买人',
  PRIMARY KEY (`id`),
  KEY `shouhuoshangpin_shouhuoid_index` (`shouhuoid`),
  KEY `shouhuoshangpin_jiajuid_index` (`jiajuid`),
  KEY `shouhuoshangpin_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='收货商品';

-- ----------------------------
-- Records of shouhuoshangpin
-- ----------------------------
INSERT INTO `shouhuoshangpin` VALUES ('1', '1', '1', '032700547418', '格力（GREE）空调 京东小家智能生态 3匹', '1', '格力（GREE）', '/upload/ef64f098ac964676a238248de7ab7619.png,/upload/b0d7848c1d80465d8585acd9b5e260cb.png,/upload/15e674e66f494963bdf8bb766e071585.png,/upload/b5397bee692e45328e9e2c22f973d942.png', '7599.00', '1', '7599.00', '1');
INSERT INTO `shouhuoshangpin` VALUES ('2', '1', '7', '032701332843', '佳尼特 60升电热水器 A.O.史密斯家族年轻时尚', '1', '佳尼特', '/upload/4d0a9adbdedf4d2fbf3a68bf75ecc629.png,/upload/1b21f0349df3471f983928d7e7726f4b.png,/upload/cbccefd8ccc44abb97410fceb1f40937.png,/upload/a6e139b399ee4cf7a4743d692f496e10.png', '2798.00', '1', '2798.00', '1');
INSERT INTO `shouhuoshangpin` VALUES ('4', '2', '7', '032701332843', '佳尼特 60升电热水器 A.O.史密斯家族年轻时尚', '1', '佳尼特', '/upload/4d0a9adbdedf4d2fbf3a68bf75ecc629.png,/upload/1b21f0349df3471f983928d7e7726f4b.png,/upload/cbccefd8ccc44abb97410fceb1f40937.png,/upload/a6e139b399ee4cf7a4743d692f496e10.png', '2798.00', '1', '2798.00', '1');
INSERT INTO `shouhuoshangpin` VALUES ('5', '2', '8', '032701345889', '美的（Midea）16套大容量 嵌入式 五臂飓风洗 双驱变频 三星消毒 分层洗', '2', '美的（Midea）', '/upload/85451524daa44191b12c99d62bd80654.png,/upload/e4128556c8164974b95ece213c567075.png,/upload/274dea3fdbf442858cc978406f0b91f3.png,/upload/3603107eb6da4b81ba3f59eac9631597.png', '9999.00', '1', '9999.00', '1');
INSERT INTO `shouhuoshangpin` VALUES ('7', '3', '3', '032701267650', '亿田（entive）D2ZK 集成灶蒸烤一体 家用蒸箱烤箱', '2', '亿田（entive）', '/upload/9201a417bfdc4af489b26c8c0b4e0107.png,/upload/c568f1fa2e234b17b89003dbaba8a623.png,/upload/95b995cbf873422d8b154acbd768c471.png,/upload/30e8538a1db44b7291c47f29b94107eb.png', '13800.00', '2', '27600.00', '2');

-- ----------------------------
-- Table structure for `wxuser`
-- ----------------------------
DROP TABLE IF EXISTS `wxuser`;
CREATE TABLE `wxuser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL COMMENT '用户',
  `nickName` varchar(50) NOT NULL COMMENT '昵称',
  `avatarUrl` varchar(255) NOT NULL COMMENT '头像',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `xingbie` varchar(10) NOT NULL COMMENT '性别',
  `nianling` int(11) NOT NULL DEFAULT '0' COMMENT '年龄',
  `shouji` varchar(50) NOT NULL COMMENT '手机',
  `youxiang` varchar(50) NOT NULL COMMENT '邮箱',
  `zhuzhi` varchar(50) NOT NULL COMMENT '住址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='微信用户';

-- ----------------------------
-- Records of wxuser
-- ----------------------------
INSERT INTO `wxuser` VALUES ('1', 'o5Smh5ZGiF8P3TeJJwhczZMqABCo', 'Change', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epLt9h274tXBtER9233mlJ5IZLTAicZBr5QibIC4hv0ibtDADiahAsE6SKPAjqDz43Soiarbk9SYHibhxlg/132', '张三', '男', '22', '13800138001', '123456001@qq.com', '北京市朝阳区朝阳路1号');
INSERT INTO `wxuser` VALUES ('2', 'oiRZG5cVz3CCPKlKRSLtZYcnj6IE', '朝歌夜弦', 'https://thirdwx.qlogo.cn/mmopen/vi_32/XqDBrqCY3DW9oqTbDm2fJdH1eIlx067M8XBsXAgMVJr8Epqt29ibaqhibcG3V1vRayza2n0YRnXPhsVNXRlcfBWw/132', '', '', '0', '', '', '');

-- ----------------------------
-- Table structure for `xinwenfenlei`
-- ----------------------------
DROP TABLE IF EXISTS `xinwenfenlei`;
CREATE TABLE `xinwenfenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fenleimingcheng` varchar(50) NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='新闻分类';

-- ----------------------------
-- Records of xinwenfenlei
-- ----------------------------
INSERT INTO `xinwenfenlei` VALUES ('1', '站内新闻');
INSERT INTO `xinwenfenlei` VALUES ('2', '行业资讯');
INSERT INTO `xinwenfenlei` VALUES ('3', '测试');

-- ----------------------------
-- Table structure for `xinwenxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `xinwenxinxi`;
CREATE TABLE `xinwenxinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `dianjilv` int(11) NOT NULL DEFAULT '0' COMMENT '点击率',
  `neirong` longtext NOT NULL COMMENT '内容',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`id`),
  KEY `xinwenxinxi_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='新闻信息';

-- ----------------------------
-- Records of xinwenxinxi
-- ----------------------------
INSERT INTO `xinwenxinxi` VALUES ('1', '中国电商行业的发展现状及未来趋势', '2', '/upload/1f1c7d7c958340509d4de05ed0c53cd5.png', 'admin', '1', '<p>世界一直在变化，尤其是依靠互联网技术快速发展的电子商务行业。21世纪初，中国的电子商务平台还处于起步阶段。2003年，淘宝正式成立。在接下来的十年里，各大电商平台都顺势而为，出现在大众的视野中。到目前为止，中国电子商务已经发展了20多年，已经形成了一个完整的产业体系，并通过创新和协调的发展方案渗透到人们生活的方方面面。接下来，我将简要谈谈中国电子商务的现状和未来发展趋势。</p>\n<p>&nbsp;</p>\n<p>一、发展现状总体而言，中国电子商务行业仍在稳步发展。随着互联网技术的不断完善，各大电商服务商都致力于为平台用户提供更专业的服务，从而将交易过程中所需的成本降到最低。此外，随着电商技术的不断进步，越来越多的线下企业选择转型发展，积极走上电商发展之路。虽然中国电商行业仍在稳步发展，但近年来增速有所放缓，这意味着电商行业的竞争将更加激烈。</p>\n<p><img src=\"http://localhost:8088/upload/377b9e3aa2664f07ab9480d1585bde7c.png\" /></p>\n<p>二 .未来发展</p>\n<p>社交电商将成为大势所趋。社交电商的兴起以拼多多在美国正式上市为标志，越来越多的消费者选择在社交平台购物。因此，未来的社交平台将不仅用于娱乐和媒体推广，还将是人们生活中不可或缺的电子商务平台之一。同时，各大社交平台也加大了电商的投资成本。比如在平台上直接开设微店，用户可以直接在平台下单，有效避免了跨平台购物带来的不便和麻烦，可以进一步促进消费，扩大市场份额。</p>\n<p>&nbsp;</p>\n<p>2.核心竞争力成为决胜的关键点。网红经济是近年来的热门词汇之一。涌现出一大批网红、段子手。各大社交平台和电商平台都邀请了有一定粉丝基础的网红，直播带货，粉丝愿意为此买单。然而，随着社会的不断发展，网红仅靠站出来是无法让人发笑的。如果他想生存，他必须有好的内容。他要想形成自己的核心竞争力，就不能只靠颜值和搞笑。这些特点远远不足以维持他的长期发展。</p>\n<p>&nbsp;</p>\n<p>3.农村电商市场空间广阔。纵观中国整体电商市场，城市覆盖率极高。此时，各大电商平台持续保持用户数据增长的最佳方式之一，就是大力拓展农村电商。与城市相比，农村有更大的发展空间。未来农村电商发展将逐步走向标准化，在生产、包装、销售、运输等环节严格按照标准执行，为规模化发展铺平道路。而且要与时俱进，将传统手工艺品等产品与先进的媒体推广方式有机结合，为受众提供更好的消费体验，同时为农村经济的进一步发展贡献力量。综上所述，虽然中国电商行业的竞争日趋激烈，但只要找到正确的发展方向和正确的起点，努力打造专属的核心竞争力，自然可以实现长远发展。</p>', '2022-03-27 00:30:03');
INSERT INTO `xinwenxinxi` VALUES ('2', '跨境卖家布局独立站的应该注意哪些？', '2', '/upload/3ce71f0ca6fb4979837ea5cd09ad6dca.png', 'admin', '0', '<p>相比过去对电商平台的过度依赖，跨境电商卖家的自主品牌意识正在逐渐觉醒，尤其是对于已经拥有跨境电商销售渠道的卖家，开设独立站的意愿明显更高。鉴于建设独立车站的需求，以下是对独立车站布局的几点建议：</p>\n<p>&nbsp;</p>\n<p><strong>1、多渠道布局，协同拓展</strong></p>\n<p>亚马逊封号事件无疑是今年跨境圈的&ldquo;头条&rdquo;。据统计，自5月大规模封号事件以来，已有近5万名中国卖家在亚马逊平台被封杀，其中不乏头部卖家。虽然亚马逊对&ldquo;封号event&rdquo;的回应并非针对中国卖家，但这波封号潮带来的巨大蝴蝶效应，也对市场情绪产生了重大负面影响。</p>\n<p>卖家越来越意识到多元化布局的必要性，从亚马逊之外挖掘流量，加大对社交电商的投资，在多个平台上发展。但是，多渠道布局不是简单地把鸡蛋分成几个篮子，而是被动地防御某个渠道可能出现的风险。更主动的逻辑是：自力更生，掌握自己的规则和流量</p>\n<p><strong>2、选择细分类的商品</strong></p>\n<p>独立站没有平台广告的竞价排名，没有价格排名，对服装、玩具、工具、户外用品等产品非常友好。但是在具体的选择上，还是需要注意产品的独特性和精细度，一旦细分产品就可以让引流更加精准。</p>\n<p><img src=\"http://localhost:8088/upload/fe26f621d2054331a72b83f2a0f7fb46.png\" /></p>\n<p><strong>3、充分利用社交媒体流量红利</strong></p>\n<p>如今，与10年前相比，随着移动互联网的发展，全球互联网用户数量呈现出惊人的增长趋势，未来这一数字还将继续上升。网民数量的增长带动了流量平台的出现，流量的搜索带动了独立站电商，独立站保持增长的市场蛋糕越来越大。</p>\n<p><strong>4、优先发展</strong><strong>DTC</strong><strong>模式</strong></p>\n<p>正如电商平台分为&ldquo;分销&rdquo;和&ldquo;精品&rdquo;运营模式一样，独立站也有各自不同的发展方向。目前市场主要分为两种：站组模式和DTC模式。</p>\n<p>采用站群模式的独立站卖家通常会开多个独立站，专注于营销驱动，重视选品，在搜索引擎和社交媒体中选择最好的方式选择爆款产品。这种模式比较粗放，缺乏产品的后续研究和培训。一旦产品和服务跟不上引流，流量，就很容易失去原有的客户群。</p>\n<p>DTC模式是将细节剪切到垂直区域。这类卖家主要以产品为发展动力，深度涉足产品管理细分领域。这种发展模式由于更专业、更好的产品开发，能够实现相对稳定的长期发展，能够在流量沉淀和品牌建设中发挥独立站的作用。</p>', '2022-03-27 00:31:49');
INSERT INTO `xinwenxinxi` VALUES ('4', '跨境电商独立站的运营技巧有哪些', '2', '/upload/7db12b3c534a460eb18d8e2ae3df983b.png', 'admin', '0', '<p>其实独立站是卖家的，但是在第三方平台上，是要在大平台的基础上建设自己的网站，需要不断的努力，否则网站很难建设和维护，因为到时候会出现问题，里面所有的内容和数据都不属于你。那么在实际应用中，卖家应该如何操作，少走弯路呢？</p>\n<p><strong>1.类目</strong></p>\n<p>和国内电商平台一样，用户进入卖家网站是有一定目的的，所以卖家要做好分类，让用户直观地看到哪些产品，快速找到自己需要的产品。如果你没有这方面的经验，也可以参考其他成熟的平台，选择与卖家本身相关的，结合实际产品来组织品类。一般建议你做三级品类。</p>\n<p><strong>2.标题</strong></p>\n<p>在产品名称中，标题不仅仅是一个名称，一个不好的标题甚至可能导致卖家大量订单的流失。很多创业公司的标题过于模糊，或者所有内容都塞进去，极其复杂，会导致用户无法准确接收到卖家想要表达的促销思路。事实也是如此。如果不知道怎么学，参考行业内的精品，模仿而不抄袭，自然会学到更多。</p>\n<p>但标题中应该包含哪些核心词：风格、材料、核心词(宣传特点，如轻便、轻便、柔软等。)，加上一些修饰词使整个标题连贯。简而言之，标题意味着简单而准确地向客户介绍卖方的产品。</p>\n<p><img src=\"http://localhost:8088/upload/9fb6d1eae472415098d4ef5d19d76cd0.png\" /></p>\n<p><strong>3.价格设置</strong></p>\n<p>有一个公认的算法，就是按照产品、运输成本、广告成本和利润，各取24%。如果早期产品数量不足，最简单的定价方法是产品和运输总成本的两倍。一段时间后，卖家不断丰富产品，要根据自身属性进行调整。或者参考同行的定价注意，卖家是做广告的。如果定价过高，买家群体就会减少。</p>\n<p><strong>4.运费</strong></p>\n<p>运输成本取决于卖方的产品。大量的产品都算好了，单件的重量和数量都是一样的，只是数量上会有变化。如果是定制的，体积重量不固定，需要联系国际快递，你有大概的总结。进行重大计算而不亏损。很大很重，只能考虑专线或者海运。</p>\n<p><strong>5.图片设置</strong></p>\n<p>不需要更改域名，可以把产品LOGO放在上面，尽量选择白色或者浅色作为主图中干净的背景色。图后可以放大显示产品详情、实际应用场景，突出卖家产品的优势。注意不要在所有书面文字中出现英语错误，这会让买家非常不舒服。</p>\n<p><strong>6.主题</strong></p>\n<p>不同的行业，不同的产品，要选择不同的主题，比如母婴产品，那么就要选择明亮柔和的颜色，杏仁饼的色系是比较好的配色，电子产品可以更加科技化。主题的整体规划会给用户很好的体验感。配色不统一，版式大小不一，甚至卖家自己的浏览观感也不好。</p>\n<p>总而言之，独立站靠的是卖家自己的持续运营。即使在初期做得很好，也需要不断的优化和学习。毕竟大牛还是比卖家学得好，大家都知道落后就要挨打。因此，谨慎和耐心是成功操作的必要条件。</p>', '2022-03-27 00:34:12');
