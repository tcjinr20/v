/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : hls_vedio

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 09/04/2018 17:46:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hls_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `hls_advertisement`;
CREATE TABLE `hls_advertisement`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '广告标题',
  `pic` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '广告图片',
  `appid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '要打开的小程序 appId',
  `path` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '打开的页面路径，如果为空则打开首页',
  `store_id` int(11) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hls_advertisement
-- ----------------------------
INSERT INTO `hls_advertisement` VALUES (1, '漳州首页民俗活动排名投票活动', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/d7/d758a9f4a9c5bdcd1ec6e2e8a8be42f7.jpg', 'wx8964fb121ad2bd94', NULL, 1, 1522517562);

-- ----------------------------
-- Table structure for hls_banner
-- ----------------------------
DROP TABLE IF EXISTS `hls_banner`;
CREATE TABLE `hls_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `banner_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `introduce` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '介绍',
  `sort` int(11) DEFAULT NULL COMMENT '100',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hls_banner
-- ----------------------------
INSERT INTO `hls_banner` VALUES (1, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/d7/d758a9f4a9c5bdcd1ec6e2e8a8be42f7.jpg', '', '', 100, 0, 1522485847);
INSERT INTO `hls_banner` VALUES (2, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/26/269aa0d7ddf6c4c9fbbac6004aa3a33a.png', '', '', 100, 1, 1522485853);
INSERT INTO `hls_banner` VALUES (3, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/d7/d758a9f4a9c5bdcd1ec6e2e8a8be42f7.jpg', '', '', 100, 0, 1522640896);
INSERT INTO `hls_banner` VALUES (4, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/26/269aa0d7ddf6c4c9fbbac6004aa3a33a.png', '', '', 100, 0, 1522640910);

-- ----------------------------
-- Table structure for hls_cat
-- ----------------------------
DROP TABLE IF EXISTS `hls_cat`;
CREATE TABLE `hls_cat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `pic_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片地址',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `sort` int(11) DEFAULT 100 COMMENT '排序',
  `is_show` int(11) DEFAULT 0 COMMENT '是否设为首页推荐',
  `cover_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '首页缩略图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hls_cat
-- ----------------------------
INSERT INTO `hls_cat` VALUES (1, 1, '娱乐', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/fe/fe17fd881a802ba17c8df40f79ed8445.png', 0, 1522485715, 1522485984, 100, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/fe/fe17fd881a802ba17c8df40f79ed8445.png');
INSERT INTO `hls_cat` VALUES (2, 1, '新闻', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/7c/7c6d457f254ae4945384830cafa5f52a.png', 0, 1522485766, 1522487011, 100, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/7c/7c6d457f254ae4945384830cafa5f52a.png');
INSERT INTO `hls_cat` VALUES (3, 1, '影视', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/ab/ab7d18464d2865c78485fda5df05b40b.png', 0, 1522485781, 1522519791, 100, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/ab/ab7d18464d2865c78485fda5df05b40b.png');
INSERT INTO `hls_cat` VALUES (4, 1, 'VIP会员', 'http://qn.alaojie.com/uploads/image/d3/d3b984c9ed707e7b2ee24996581c560a.png', 0, 1522518060, 1522606008, 100, 1, 'http://qn.alaojie.com/uploads/image/d3/d3b984c9ed707e7b2ee24996581c560a.png');

-- ----------------------------
-- Table structure for hls_collect
-- ----------------------------
DROP TABLE IF EXISTS `hls_collect`;
CREATE TABLE `hls_collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL COMMENT '视频ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of hls_collect
-- ----------------------------
INSERT INTO `hls_collect` VALUES (9, 1, 26, 5, 0, 1523238304);

-- ----------------------------
-- Table structure for hls_comment
-- ----------------------------
DROP TABLE IF EXISTS `hls_comment`;
CREATE TABLE `hls_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL COMMENT '视频ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '评论内容',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL COMMENT '回复的评论 0--顶级楼层',
  `store_id` int(11) DEFAULT NULL,
  `upload_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `top_id` int(11) DEFAULT NULL COMMENT '顶级楼层ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hls_comment
-- ----------------------------
INSERT INTO `hls_comment` VALUES (3, 31, 6, '', 0, 1523242574, 0, 1, '[\"http://qn.alaojie.com/uploads/image/de/de0803c9860a5427a1173d3e3d55a646.png\"]', 0);

-- ----------------------------
-- Table structure for hls_comment_type
-- ----------------------------
DROP TABLE IF EXISTS `hls_comment_type`;
CREATE TABLE `hls_comment_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL COMMENT '评论ID',
  `type` int(11) DEFAULT NULL COMMENT '类型 0--点赞 1--踩 ',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '操作者ID',
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for hls_count
-- ----------------------------
DROP TABLE IF EXISTS `hls_count`;
CREATE TABLE `hls_count`  (
  `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hls_count
-- ----------------------------
INSERT INTO `hls_count` VALUES (3, 5, 3, '2018-04-04 07:15:17', '120.34.180.116');
INSERT INTO `hls_count` VALUES (4, 2, 3, '2018-04-04 07:15:23', '120.34.180.116');
INSERT INTO `hls_count` VALUES (5, 11, 2, '2018-04-04 07:21:49', '120.34.180.116');
INSERT INTO `hls_count` VALUES (6, 12, 2, '2018-04-04 07:24:48', '120.34.180.116');
INSERT INTO `hls_count` VALUES (7, 12, 2, '2018-04-04 07:24:58', '120.34.180.116');
INSERT INTO `hls_count` VALUES (8, 12, 2, '2018-04-04 07:26:33', '120.34.180.116');
INSERT INTO `hls_count` VALUES (9, 12, 2, '2018-04-04 07:27:47', '120.34.180.116');
INSERT INTO `hls_count` VALUES (10, 14, 2, '2018-04-04 07:47:49', '120.34.180.116');
INSERT INTO `hls_count` VALUES (11, 14, 2, '2018-04-04 07:48:21', '120.34.180.116');
INSERT INTO `hls_count` VALUES (12, 16, 6, '2018-04-04 08:03:38', '120.34.180.116');
INSERT INTO `hls_count` VALUES (13, 17, 6, '2018-04-04 08:09:14', '120.34.180.116');
INSERT INTO `hls_count` VALUES (14, 0, 6, '2018-04-04 08:27:54', '120.34.180.116');
INSERT INTO `hls_count` VALUES (15, 0, 6, '2018-04-04 08:27:54', '120.34.180.116');
INSERT INTO `hls_count` VALUES (16, 24, 6, '2018-04-04 08:54:28', '120.34.180.116');
INSERT INTO `hls_count` VALUES (17, 24, 3, '2018-04-04 08:58:18', '120.34.180.116');
INSERT INTO `hls_count` VALUES (18, 25, 6, '2018-04-04 09:01:01', '120.34.180.116');
INSERT INTO `hls_count` VALUES (19, 25, 6, '2018-04-04 09:01:35', '120.34.180.116');
INSERT INTO `hls_count` VALUES (20, 24, 6, '2018-04-04 09:06:40', '120.34.180.116');
INSERT INTO `hls_count` VALUES (21, 24, 6, '2018-04-04 09:06:42', '120.34.180.116');
INSERT INTO `hls_count` VALUES (22, 24, 6, '2018-04-04 09:06:45', '120.34.180.116');
INSERT INTO `hls_count` VALUES (23, 24, 6, '2018-04-04 09:06:49', '120.34.180.116');
INSERT INTO `hls_count` VALUES (24, 24, 6, '2018-04-04 09:06:52', '120.34.180.116');
INSERT INTO `hls_count` VALUES (25, 24, 6, '2018-04-04 09:06:55', '120.34.180.116');
INSERT INTO `hls_count` VALUES (26, 24, 6, '2018-04-04 09:07:03', '120.34.180.116');
INSERT INTO `hls_count` VALUES (27, 24, 6, '2018-04-04 09:07:07', '120.34.180.116');
INSERT INTO `hls_count` VALUES (28, 25, 6, '2018-04-04 09:07:30', '120.34.180.116');
INSERT INTO `hls_count` VALUES (29, 26, 6, '2018-04-04 09:07:37', '120.34.180.116');
INSERT INTO `hls_count` VALUES (30, 25, 6, '2018-04-04 09:07:45', '120.34.180.116');
INSERT INTO `hls_count` VALUES (31, 24, 6, '2018-04-04 09:10:23', '120.34.180.116');
INSERT INTO `hls_count` VALUES (32, 26, 6, '2018-04-04 09:10:24', '120.34.180.116');
INSERT INTO `hls_count` VALUES (33, 25, 3, '2018-04-04 11:31:15', '120.34.180.116');
INSERT INTO `hls_count` VALUES (34, 25, 3, '2018-04-04 11:31:23', '120.34.180.116');
INSERT INTO `hls_count` VALUES (35, 24, 3, '2018-04-04 11:32:37', '120.34.180.116');
INSERT INTO `hls_count` VALUES (36, 24, 3, '2018-04-08 06:29:35', '120.34.180.149');
INSERT INTO `hls_count` VALUES (37, 26, 6, '2018-04-09 00:45:27', '120.34.180.149');
INSERT INTO `hls_count` VALUES (38, 25, 6, '2018-04-09 00:45:33', '120.34.180.149');
INSERT INTO `hls_count` VALUES (39, 24, 6, '2018-04-09 00:45:36', '120.34.180.149');
INSERT INTO `hls_count` VALUES (40, 28, 5, '2018-04-09 01:02:52', '120.34.180.149');
INSERT INTO `hls_count` VALUES (41, 28, 5, '2018-04-09 01:05:15', '120.34.180.149');

-- ----------------------------
-- Table structure for hls_form
-- ----------------------------
DROP TABLE IF EXISTS `hls_form`;
CREATE TABLE `hls_form`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字段名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字段类型',
  `required` int(11) DEFAULT NULL COMMENT '是否必填',
  `default` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '默认值',
  `tip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '提示语',
  `sort` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hls_form
-- ----------------------------
INSERT INTO `hls_form` VALUES (1, 1, 5, '微信', 'text', 1, '', '微信号', 0, 0, 1522519587);
INSERT INTO `hls_form` VALUES (2, 1, 5, '手机号码', 'text', 1, '', '手机号码', 1, 0, 1522519587);
INSERT INTO `hls_form` VALUES (3, 1, 5, '留言获取最新更新', 'form_name', NULL, '', '', NULL, 0, 1522519587);

-- ----------------------------
-- Table structure for hls_form_id
-- ----------------------------
DROP TABLE IF EXISTS `hls_form_id`;
CREATE TABLE `hls_form_id`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `wechat_open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `form_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '可选值：form_id或prepay_id',
  `send_count` int(11) DEFAULT 0,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hls_level
-- ----------------------------
DROP TABLE IF EXISTS `hls_level`;
CREATE TABLE `hls_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `price` decimal(10, 2) DEFAULT NULL COMMENT '价格',
  `s_price` decimal(10, 2) DEFAULT NULL COMMENT '续费价格',
  `date` int(11) DEFAULT NULL COMMENT '时间（单位：天）',
  `is_groom` int(11) DEFAULT NULL COMMENT '是否设为推荐  0--不是 1--是',
  `sort` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hls_level
-- ----------------------------
INSERT INTO `hls_level` VALUES (1, 1, '月会员', 12.00, 12.00, 30, 1, 100, 0, 1522517826);
INSERT INTO `hls_level` VALUES (2, 1, '年费会员', 120.00, 110.00, 365, 1, 100, 0, 1522517846);
INSERT INTO `hls_level` VALUES (3, 1, '试用会员', 1.00, 100.00, 3, 1, 1, 0, 1522833185);

-- ----------------------------
-- Table structure for hls_member_order
-- ----------------------------
DROP TABLE IF EXISTS `hls_member_order`;
CREATE TABLE `hls_member_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '会员标题',
  `price` decimal(10, 2) DEFAULT NULL COMMENT '支付价格',
  `date` int(11) DEFAULT NULL COMMENT '会员时间',
  `is_pay` int(11) DEFAULT 0 COMMENT '是否支付 0--否 1--是',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hls_member_order
-- ----------------------------
INSERT INTO `hls_member_order` VALUES (1, 1, 5, 'M20180402093939848698', '年费会员', 360.00, 365, 0, 0, 0, 1522633179);
INSERT INTO `hls_member_order` VALUES (2, 1, 4, 'M20180402153125337499', '年费会员', 360.00, 365, 0, 0, 0, 1522654285);
INSERT INTO `hls_member_order` VALUES (3, 1, 4, 'M20180402153129819134', '月会员', 30.00, 30, 0, 0, 0, 1522654289);
INSERT INTO `hls_member_order` VALUES (4, 1, 2, 'M20180402153357787797', '月会员', 30.00, 30, 0, 0, 0, 1522654437);
INSERT INTO `hls_member_order` VALUES (5, 1, 3, 'M20180402210532398327', '年费会员', 360.00, 365, 0, 0, 0, 1522674332);
INSERT INTO `hls_member_order` VALUES (6, 1, 2, 'M20180403145707677371', '年费会员', 360.00, 365, 0, 0, 0, 1522738627);
INSERT INTO `hls_member_order` VALUES (7, 1, 5, 'M20180404154924988819', '年费会员', 360.00, 365, 0, 0, 0, 1522828164);
INSERT INTO `hls_member_order` VALUES (8, 1, 5, 'M20180404154931390476', '月会员', 30.00, 30, 0, 0, 0, 1522828171);
INSERT INTO `hls_member_order` VALUES (9, 1, 6, 'M20180404171621346872', '试用会员', 1.00, 3, 0, 0, 0, 1522833381);
INSERT INTO `hls_member_order` VALUES (10, 1, 6, 'M20180408154710898585', '试用会员', 1.00, 3, 0, 0, 0, 1523173630);
INSERT INTO `hls_member_order` VALUES (11, 1, 6, 'M20180409085027458545', '年费会员', 120.00, 365, 0, 0, 0, 1523235027);

-- ----------------------------
-- Table structure for hls_option
-- ----------------------------
DROP TABLE IF EXISTS `hls_option`;
CREATE TABLE `hls_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hls_option
-- ----------------------------
INSERT INTO `hls_option` VALUES (1, 1, 'home', 'cat_show', 's:1:\"1\";');
INSERT INTO `hls_option` VALUES (2, 1, 'home', 'cat_text', 's:12:\"所有视频\";');
INSERT INTO `hls_option` VALUES (3, 1, 'home', 'cat_pic', 's:101:\"https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/5d/5d5d166106dd835d38ee808468ccb0c2.jpg\";');
INSERT INTO `hls_option` VALUES (4, 1, 'home', 'video_text', 's:6:\"精选\";');
INSERT INTO `hls_option` VALUES (5, 1, 'home', 'video_pic', 's:101:\"https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/6b/6b0567510bbafdc3dbf66c3db61349c5.png\";');
INSERT INTO `hls_option` VALUES (6, 1, 'home', 'index_icon', 's:101:\"https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/0c/0cc066ed301ed61580754498f05e864c.png\";');
INSERT INTO `hls_option` VALUES (7, 1, 'home', 'top_icon', 's:101:\"https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/3b/3b3fba2994590ae958b7f979661b6acd.png\";');

-- ----------------------------
-- Table structure for hls_order
-- ----------------------------
DROP TABLE IF EXISTS `hls_order`;
CREATE TABLE `hls_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号',
  `video_id` int(11) DEFAULT NULL COMMENT '视频ID',
  `user_id` int(11) DEFAULT NULL,
  `is_pay` int(11) DEFAULT NULL COMMENT '是否支付',
  `pay_type` int(11) DEFAULT NULL COMMENT '支付方式',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `is_use` int(11) DEFAULT NULL COMMENT '是否使用 0--未使用 1--已使用 2--退款',
  `use_time` int(11) DEFAULT NULL COMMENT '使用时间',
  `clerk_id` int(11) DEFAULT NULL,
  `price` decimal(10, 2) DEFAULT NULL COMMENT '预定金额',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `is_refund` int(11) DEFAULT 1 COMMENT '是否支持退款 0--不支持 1--支持',
  `type` int(11) DEFAULT 0 COMMENT '订单类型 0--预约 1--购买视频',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hls_order
-- ----------------------------
INSERT INTO `hls_order` VALUES (1, 1, '20180331170412500726', 2, 2, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522487052, 0, 1);
INSERT INTO `hls_order` VALUES (2, 1, '20180331171517537830', 2, 4, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522487717, 0, 1);
INSERT INTO `hls_order` VALUES (3, 1, '20180331171521304063', 2, 4, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522487721, 0, 1);
INSERT INTO `hls_order` VALUES (4, 1, '20180331171522394388', 2, 4, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522487722, 0, 1);
INSERT INTO `hls_order` VALUES (5, 1, '20180331171522757812', 2, 4, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522487722, 0, 1);
INSERT INTO `hls_order` VALUES (6, 1, '20180331171526749576', 2, 4, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522487726, 0, 1);
INSERT INTO `hls_order` VALUES (7, 1, '20180331171526939278', 2, 4, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522487726, 0, 1);
INSERT INTO `hls_order` VALUES (8, 1, '20180331171526997380', 2, 4, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522487726, 0, 1);
INSERT INTO `hls_order` VALUES (9, 1, '20180331171527715777', 2, 4, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522487727, 0, 1);
INSERT INTO `hls_order` VALUES (10, 1, '20180331171527585803', 2, 4, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522487727, 0, 1);
INSERT INTO `hls_order` VALUES (11, 1, '20180331171527418685', 2, 4, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522487727, 0, 1);
INSERT INTO `hls_order` VALUES (12, 1, '20180331171527600372', 2, 4, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522487727, 0, 1);
INSERT INTO `hls_order` VALUES (13, 1, '20180331171527126265', 2, 4, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522487727, 0, 1);
INSERT INTO `hls_order` VALUES (14, 1, '20180331171528348056', 2, 4, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522487728, 0, 1);
INSERT INTO `hls_order` VALUES (15, 1, '20180331171528872177', 2, 4, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522487728, 0, 1);
INSERT INTO `hls_order` VALUES (16, 1, '20180331223814862724', 1, 3, 0, 0, 0, NULL, NULL, NULL, 0.10, 0, 1522507094, 0, 1);
INSERT INTO `hls_order` VALUES (17, 1, '20180401022006595051', 5, 3, 0, 0, 0, NULL, NULL, NULL, 15.00, 0, 1522520406, 0, 1);
INSERT INTO `hls_order` VALUES (18, 1, '20180402091457562136', 5, 2, 0, 0, 0, NULL, NULL, NULL, 15.00, 0, 1522631697, 0, 1);
INSERT INTO `hls_order` VALUES (19, 1, '20180402102848303275', 5, 2, 0, 0, 0, NULL, NULL, NULL, 15.00, 0, 1522636128, 0, 1);
INSERT INTO `hls_order` VALUES (20, 1, '20180402213018839829', 5, 4, 0, 0, 0, NULL, NULL, NULL, 15.00, 0, 1522675818, 0, 1);
INSERT INTO `hls_order` VALUES (21, 1, '20180403145700350537', 5, 2, 0, 0, 0, NULL, NULL, NULL, 15.00, 0, 1522738620, 0, 1);
INSERT INTO `hls_order` VALUES (22, 1, '20180404161421160555', 19, 6, 0, 0, 0, NULL, NULL, NULL, 1000.00, 0, 1522829661, 0, 1);
INSERT INTO `hls_order` VALUES (23, 1, '20180409092233398577', 30, 6, 0, 0, 0, NULL, NULL, NULL, 10.00, 0, 1523236953, 0, 1);
INSERT INTO `hls_order` VALUES (24, 1, '20180409094828572882', 31, 6, 0, 0, 0, NULL, NULL, NULL, 100.00, 0, 1523238508, 0, 1);

-- ----------------------------
-- Table structure for hls_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `hls_order_refund`;
CREATE TABLE `hls_order_refund`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `order_refund_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退款单号',
  `type` int(11) DEFAULT NULL COMMENT '类型 0--退款',
  `refund_price` decimal(10, 2) DEFAULT NULL COMMENT '退款金额',
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '退款说明',
  `status` int(11) DEFAULT NULL COMMENT '处理状态 0--待处理 1--退款成功 2--拒绝退款',
  `refund_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '拒绝理由',
  `response_time` int(11) DEFAULT NULL COMMENT '处理时间',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hls_rebate
-- ----------------------------
DROP TABLE IF EXISTS `hls_rebate`;
CREATE TABLE `hls_rebate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rebate` decimal(10, 2) NOT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pay_user_id` int(11) NOT NULL,
  `get_user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for hls_search
-- ----------------------------
DROP TABLE IF EXISTS `hls_search`;
CREATE TABLE `hls_search`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hls_store
-- ----------------------------
DROP TABLE IF EXISTS `hls_store`;
CREATE TABLE `hls_store`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `wechat_platform_id` int(11) DEFAULT 0,
  `wechat_app_id` int(11) DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '版权文字',
  `copyright_pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '版权图片链接',
  `copyright_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '版权的超链接',
  `contact_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `show_customer_service` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pic_style` int(11) DEFAULT 0 COMMENT '是否开启类型标签0--关闭 1--开启',
  `video_icon` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '视频标签',
  `audio_icon` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '音频标签',
  `refund` int(11) DEFAULT 1 COMMENT '是否开启退款功能 0关闭 1--开启',
  `member` int(11) DEFAULT NULL COMMENT '是否开通会员 0--不开通 1--开通',
  `customer_service_pic` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `kouliang` int(5) NOT NULL DEFAULT 100 COMMENT '扣量比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hls_store
-- ----------------------------
INSERT INTO `hls_store` VALUES (1, 4, 1, 0, 1, '立方房产', '版权没有,翻版不究', '', 'http://www.cubekj.cn/', '12580', '0', 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/1e/1ec7c4f293a359bf1c14dc949a7fe5c1.png', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/a8/a89fdf16321115971a136247e03b103e.png', 1, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/73/735516bb3042d9a76af9c243522241ea.png', 10);

-- ----------------------------
-- Table structure for hls_upload_config
-- ----------------------------
DROP TABLE IF EXISTS `hls_upload_config`;
CREATE TABLE `hls_upload_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `storage_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '存储类型：留空=本地，aliyun=阿里云oss，qcloud=腾讯云cos，qiniu=七牛云存储',
  `aliyun` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '阿里云oss配置，json格式',
  `qcloud` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '腾讯云cos配置，json格式',
  `qiniu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '七牛云存储配置，json格式',
  `addtime` int(11) NOT NULL DEFAULT 0,
  `is_delete` smallint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传方式配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hls_upload_config
-- ----------------------------
INSERT INTO `hls_upload_config` VALUES (1, 0, 'qiniu', '{\"bucket\":\"\",\"domain\":\"\",\"CNAME\":\"0\",\"access_key\":\"\",\"secret_key\":\"\",\"style_api\":\"\"}', '[\"\"]', '{\"bucket\":\"shipin\",\"domain\":\"http:\\/\\/qn.alaojie.com\",\"access_key\":\"sYDMayi0i3EUcg7sQulN05QRAa7DN8WyBQJ8u3lI\",\"secret_key\":\"pbc-hL9CZ_SsxOv3ARmiugCyD5Iu4cl8FtYBrWv9\",\"style_api\":\"\"}', 1522517999, 0);

-- ----------------------------
-- Table structure for hls_upload_file
-- ----------------------------
DROP TABLE IF EXISTS `hls_upload_file`;
CREATE TABLE `hls_upload_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `file_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文件url',
  `extension` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件扩展名',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件类型：',
  `size` int(11) NOT NULL DEFAULT 0 COMMENT '文件大小，字节',
  `addtime` int(11) NOT NULL DEFAULT 0,
  `is_delete` smallint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户上传的文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hls_upload_file
-- ----------------------------
INSERT INTO `hls_upload_file` VALUES (1, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/73/735516bb3042d9a76af9c243522241ea.png', 'png', 'image', 25860, 1522485714, 0);
INSERT INTO `hls_upload_file` VALUES (2, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/a8/a89fdf16321115971a136247e03b103e.png', 'png', 'image', 9490, 1522485763, 0);
INSERT INTO `hls_upload_file` VALUES (3, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/1e/1ec7c4f293a359bf1c14dc949a7fe5c1.png', 'png', 'image', 6829, 1522485780, 0);
INSERT INTO `hls_upload_file` VALUES (4, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/26/269aa0d7ddf6c4c9fbbac6004aa3a33a.png', 'png', 'image', 16718, 1522485843, 0);
INSERT INTO `hls_upload_file` VALUES (5, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/c0/c0a622c71db55f05c4750ddd31fad231.png', 'png', 'image', 15344, 1522485979, 0);
INSERT INTO `hls_upload_file` VALUES (6, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/0f/0f69130705063483b7b617f6ebe06c71.png', 'png', 'image', 14034, 1522486087, 0);
INSERT INTO `hls_upload_file` VALUES (7, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/5d/5d5d166106dd835d38ee808468ccb0c2.jpg', 'jpg', 'image', 11781, 1522517392, 0);
INSERT INTO `hls_upload_file` VALUES (8, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/6b/6b0567510bbafdc3dbf66c3db61349c5.png', 'png', 'image', 9635, 1522517426, 0);
INSERT INTO `hls_upload_file` VALUES (9, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/0c/0cc066ed301ed61580754498f05e864c.png', 'png', 'image', 8493, 1522517448, 0);
INSERT INTO `hls_upload_file` VALUES (10, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/3b/3b3fba2994590ae958b7f979661b6acd.png', 'png', 'image', 6645, 1522517458, 0);
INSERT INTO `hls_upload_file` VALUES (11, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/d7/d758a9f4a9c5bdcd1ec6e2e8a8be42f7.jpg', 'jpg', 'image', 153565, 1522517493, 0);
INSERT INTO `hls_upload_file` VALUES (12, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/fe/fe17fd881a802ba17c8df40f79ed8445.png', 'png', 'image', 9657, 1522517698, 0);
INSERT INTO `hls_upload_file` VALUES (13, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/7c/7c6d457f254ae4945384830cafa5f52a.png', 'png', 'image', 6567, 1522517724, 0);
INSERT INTO `hls_upload_file` VALUES (14, 1, 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/image/ab/ab7d18464d2865c78485fda5df05b40b.png', 'png', 'image', 6615, 1522517768, 0);
INSERT INTO `hls_upload_file` VALUES (15, 1, 'http://qn.alaojie.com/uploads/image/d3/d3b984c9ed707e7b2ee24996581c560a.png', 'png', 'image', 10229, 1522518054, 0);
INSERT INTO `hls_upload_file` VALUES (16, 1, 'http://qn.alaojie.com/uploads/image/dd/dd7627d03f42ad3e49d493c0a621a4d5.jpg', 'jpg', 'image', 56613, 1522606006, 0);
INSERT INTO `hls_upload_file` VALUES (17, 1, 'http://qn.alaojie.com/uploads/image/70/7017e79f6d54d30bb67427d5e9ee0fe0.jpg', 'jpg', 'image', 8432, 1522519689, 0);
INSERT INTO `hls_upload_file` VALUES (18, 1, 'http://qn.alaojie.com/uploads/image/af/affd55575a39f8b333ed95a561e8da86.jpg', 'jpg', 'image', 5900, 1522519774, 0);
INSERT INTO `hls_upload_file` VALUES (19, 1, 'http://qn.alaojie.com/uploads/image/ae/ae8738cd4db8374ef46a11d60ed59177.jpg', 'jpg', 'image', 9931, 1522519777, 0);
INSERT INTO `hls_upload_file` VALUES (20, 1, 'http://qn.alaojie.com/uploads/image/de/de0803c9860a5427a1173d3e3d55a646.png', 'png', 'image', 9474, 1523242574, 0);

-- ----------------------------
-- Table structure for hls_user
-- ----------------------------
DROP TABLE IF EXISTS `hls_user`;
CREATE TABLE `hls_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(1) NOT NULL DEFAULT 1 COMMENT '用户类型：0=管理员，1=普通用户',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auth_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `access_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addtime` int(11) NOT NULL DEFAULT 0,
  `is_delete` smallint(1) NOT NULL DEFAULT 0,
  `wechat_open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信openid',
  `wechat_union_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信用户union id',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像url',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '商城id',
  `is_comment` int(11) DEFAULT NULL COMMENT '是否禁言 0--否 1--是',
  `is_clerk` int(11) DEFAULT 0,
  `is_member` int(11) DEFAULT 0 COMMENT '是否是会员',
  `due_time` int(11) DEFAULT NULL COMMENT '会员到期时间',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级id',
  `balance` int(11) NOT NULL DEFAULT 0 COMMENT '用户余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hls_user
-- ----------------------------
INSERT INTO `hls_user` VALUES (1, 0, 'admin', '$2y$13$NlbUZ.sYiR2ZNfzHFTmfoec6lKSSqYjL07T7iU4T4f8Faawtt9Jmm', '5h0SHbgbLRoA-pKb94-EoP0Y4JHP_qUN', 'YrOdgewgWRvf5sHOOPXf2ZWEMnRoR__b', 1522482589, 0, '', '', 'admin', '0', 0, NULL, 0, 0, NULL, 0, 0);
INSERT INTO `hls_user` VALUES (3, 1, 'oo8rq0EWQnA3P0_RAROpeOcKWerU', '$2y$13$2cP2g2RZdwOdlRsE5su3qur5yYPwKyTo0okqbWOqby7mSJ5FkGSPK', 'ugsoMBevlTpugSjZMubiDWsgTk198qz9', 'QuKukMfmLXi_cqa3Rwm8YAsfkIqBEdkN', 1522486528, 0, 'oo8rq0EWQnA3P0_RAROpeOcKWerU', '', '智慧漳州', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eodGPzUrE8NjUMMQ4ssmO2Zs5g0ibDyKJCpgZ9kTOLsURLu7UUTD9pZAj8JwMcYBgU9wXA5sWmBt2g/0', 1, NULL, 0, 0, NULL, 0, 0);
INSERT INTO `hls_user` VALUES (4, 1, 'oo8rq0NmcD1xrm5RuwXqS9g1Xxoc', '$2y$13$6bAbuNaJG/CIe9n2zpILAukWc84R2L.9cnl8I7QxD.Wo1CJk5Jkti', 'A04FoSVvOzW_WBHiKmeQlUmB5DPVO1mb', 'nZ9XpB4MbPVA3A-e_eB3-iPuKTucpwsP', 1522487626, 0, 'oo8rq0NmcD1xrm5RuwXqS9g1Xxoc', '', '莫莫', 'https://wx.qlogo.cn/mmopen/vi_32/FBRibOc08xqPXMqqia4fl0425PnNu4Tr6jPqkKZZPnNEc91uYe69mcFZz6EaRO0bsyalhP5vTYOv5fZQqP5ObUpA/0', 1, NULL, 0, 0, NULL, 0, 0);
INSERT INTO `hls_user` VALUES (5, 1, 'oo8rq0F2GWsyTH-CDVLR4hu8D7hw', '$2y$13$b4fK6/T9bpxYcS3oXgM6kuEgLjbmJg6.yMwln3P76ZjqoVDklz2rC', 'a2d386-vLaZPtV0Qi1SVzK75BB3E6su4', 'gsDHDGomzQkLGc2LzimazPlHOj_zq4Hs', 1522632051, 0, 'oo8rq0F2GWsyTH-CDVLR4hu8D7hw', '', '凌波微步', 'https://wx.qlogo.cn/mmopen/vi_32/ooViaLgQzOZBFjDAbm8gWDcBLWXdJxlXOOkzFXQGibHS7dMYe4AMbufGAkIVSRZwqyrmlS5uzTr351yqT2LA8jTA/0', 1, NULL, 0, 0, NULL, 0, 0);
INSERT INTO `hls_user` VALUES (6, 1, 'oo8rq0G5nT_QfSw7a8iZePV4TVHM', '$2y$13$5XhzO8Yg.amem17YVm9Mv.n9pnDxooWGAdRL3LLygyX22TYP4kFIO', 'a-bhOSxuiFz2sJKr2dQiBOiT9lnmSHJk', 'xX8BXkQWwRXQNbx_RgYas_TRar6y3VR9', 1522828964, 0, 'oo8rq0G5nT_QfSw7a8iZePV4TVHM', '', '', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eru9QJhWiapa50TkQ00icReTLOXuPraWO55JVLFxfYicoDIpRG3vdIUtnBV6Cp6NcfcS6YTuxKKOQtkA/0', 1, NULL, 0, 0, NULL, 0, 11111);

-- ----------------------------
-- Table structure for hls_user_form
-- ----------------------------
DROP TABLE IF EXISTS `hls_user_form`;
CREATE TABLE `hls_user_form`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hls_video
-- ----------------------------
DROP TABLE IF EXISTS `hls_video`;
CREATE TABLE `hls_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL COMMENT '分类id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `pic_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '封面图片',
  `video_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '视频',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '简介',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0 COMMENT '状态 0--下架 1--上架',
  `is_show` int(11) DEFAULT NULL COMMENT '是否设为轮播 0--否 1--是',
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '简介',
  `banner_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `video_time` decimal(11, 2) DEFAULT NULL COMMENT '时长',
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `order` int(11) DEFAULT NULL COMMENT '是否开启预定',
  `money` decimal(10, 2) DEFAULT NULL COMMENT '预定金额',
  `refund` int(11) DEFAULT 0,
  `page_view` int(11) DEFAULT 1 COMMENT '浏览量',
  `type` int(11) DEFAULT 0 COMMENT '视频来源 0--其他 1--腾讯视频',
  `style` int(11) DEFAULT 0 COMMENT '多媒体类型 0--视频 1--音频',
  `is_pay` int(11) DEFAULT 0 COMMENT '是否开启付费收看',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '上传用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hls_video
-- ----------------------------
INSERT INTO `hls_video` VALUES (24, 1, 3, '只要是雄性', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/video/20180404165401/1522832041a1354f6e84ed04c3.jpg', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/video/20180404165401/1522832041888bf10f1615d974.mp4', '怎样的鱼，怎样的盐。怎样的锅能让米更香粘...', 100, 0, 1522832041, 0, NULL, '', NULL, 30.00, NULL, NULL, NULL, 0, 117, 0, 0, 0, 6);
INSERT INTO `hls_video` VALUES (25, 1, 3, '今天吃了个椰菜味的披萨', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/video/20180404165944/1522832384752c59d8068c88e0.jpg', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/video/20180404165944/1522832384a4aea730b4a17d64.mp4', '怎样的鱼，怎样的盐。怎样的锅能让米更香粘...', 100, 0, 1522832384, 0, NULL, '', NULL, 18.00, NULL, NULL, NULL, 0, 108, 0, 0, 0, 6);
INSERT INTO `hls_video` VALUES (26, 1, 3, '异地恋很辛苦的', 'http://qn.alaojie.com/uploads/image/af/affd55575a39f8b333ed95a561e8da86.jpg', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/video/20180404170444/152283268430e1afeb1f180efe.mp4', '怎样的鱼，怎样的盐。怎样的锅能让米更香粘...', 100, 0, 1522832684, 0, 0, '', NULL, 14.00, '', 0, 0.00, 0, 13, 0, 0, 0, 6);
INSERT INTO `hls_video` VALUES (35, 1, 3, '的点点滴滴多多多多多', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/video/20180409114731/1523245651ee18181fb26f5696.png', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/video/20180409114731/1523245651392dc8800250689f.mp4', '反反复复付付付付', 100, 1, 1523245651, 0, NULL, '', NULL, 12.61, NULL, NULL, NULL, 0, 2, 0, 0, 0, 5);
INSERT INTO `hls_video` VALUES (36, 1, 3, '斤斤计较军军军军军军军', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/video/20180409115759/1523246279ee18181fb26f5696.png', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/video/20180409115759/1523246279392dc8800250689f.mp4', '哈哈哈哈哈哈或或或或或或或或或或或', 100, 0, 1523246279, 0, NULL, '', NULL, 12.61, NULL, NULL, NULL, 0, 1, 0, 0, 0, 5);
INSERT INTO `hls_video` VALUES (37, 1, 3, '新英雄哦', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/video/20180409120529/152324672931fa609fc5b0d1b3.jpg', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/video/20180409120529/1523246729e39920eff209a555.mp4', '新英雄哦', 100, 0, 1523246729, 0, NULL, '', NULL, 2.00, NULL, NULL, NULL, 0, 5, 0, 0, 1, 3);
INSERT INTO `hls_video` VALUES (38, 1, 3, '110', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/video/20180409120848/15232469285271b9bb26a23d26.png', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/video/20180409120848/15232469289c91a9e35006eca0.mp4', '111', 100, 0, 1523246928, 0, NULL, '', NULL, 12.61, NULL, NULL, NULL, 0, 4, 0, 0, 1, 6);
INSERT INTO `hls_video` VALUES (39, 1, 3, '挖矿楼', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/video/20180409121026/15232470268770569fa9729534.jpg', 'https://wx.cubevip.com/addons/hs_video/core/web/uploads/video/20180409121026/1523247026e1dcb7c679d2b157.mp4', '挖矿了', 100, 0, 1523247027, 0, NULL, '', NULL, 8.00, NULL, NULL, NULL, 0, 3, 0, 0, 1, 3);

-- ----------------------------
-- Table structure for hls_video_pay
-- ----------------------------
DROP TABLE IF EXISTS `hls_video_pay`;
CREATE TABLE `hls_video_pay`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL COMMENT '视频ID',
  `type` int(11) DEFAULT NULL COMMENT '付费类型',
  `time` int(11) DEFAULT NULL COMMENT '免费时长',
  `price` decimal(10, 2) DEFAULT NULL COMMENT '收费价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of hls_video_pay
-- ----------------------------
INSERT INTO `hls_video_pay` VALUES (13, 1, 39, 0, 2, 1.00);
INSERT INTO `hls_video_pay` VALUES (12, 1, 38, 0, 3, 11.00);
INSERT INTO `hls_video_pay` VALUES (11, 1, 37, 0, 0, 8.00);

-- ----------------------------
-- Table structure for hls_wechat_app
-- ----------------------------
DROP TABLE IF EXISTS `hls_wechat_app`;
CREATE TABLE `hls_wechat_app`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(11) NOT NULL DEFAULT 0 COMMENT '微擎公众号id',
  `user_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `app_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mch_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cert_pem` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `key_pem` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `addtime` int(11) NOT NULL DEFAULT 0,
  `is_delete` smallint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信小程序' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
