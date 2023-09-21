/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : onepiece

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 21/09/2023 12:32:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mayday_article
-- ----------------------------
DROP TABLE IF EXISTS `mayday_article`;
CREATE TABLE `mayday_article`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT NULL COMMENT '发表用户',
  `article_content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '文章内容html格式',
  `article_content_md` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '文章内容Markdown格式',
  `article_newstime` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `article_status` int(0) NULL DEFAULT NULL COMMENT '文章状态 0已发布1草稿2回收站',
  `article_summary` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文章摘要',
  `article_thumbnail` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '略缩图',
  `article_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `article_type` int(0) NULL DEFAULT NULL COMMENT '文章类型0原创1转载',
  `article_post` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'post文章 page页面',
  `article_comment` int(0) NULL DEFAULT NULL COMMENT '是否开启评论 0开启1不开启',
  `article_updatetime` datetime(0) NULL DEFAULT NULL COMMENT '文章最后修改时间',
  `article_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文章路径',
  `article_views` bigint(0) NULL DEFAULT 0 COMMENT '访问量统计',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `MAYDAY_ARTICLE_URL`(`article_url`) USING BTREE,
  INDEX `MAYDAY_ARTICLE_USERID`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mayday_article
-- ----------------------------
INSERT INTO `mayday_article` VALUES (147, 9, '测试hhhh\r\njjj\r\njj\r\njjj\r\njjjj', '> 测试\r\n> `hhhh`\r\n# jjj\r\n## jj\r\n###### jjj\r\n#### jjjj', '2023-09-18 12:39:26', 0, '测试hhhhjjjjjjjjjjjj', '/upload/2023/9/图层_220230918123915596.png', 'test', 0, 'post', 0, '2023-09-18 12:39:26', '测试', NULL);
INSERT INTO `mayday_article` VALUES (149, 9, '1\r\n2', '# 1\r\n## 2', '2023-09-18 15:18:00', 0, NULL, '/static/img/rand/4.jpg', 'test', NULL, 'page', 0, '2023-09-18 15:18:00', 'test', NULL);
INSERT INTO `mayday_article` VALUES (150, 9, 'test', 'test', '2023-09-21 12:02:03', 0, 'test', '/static/img/rand/14.jpg', 'test2', 0, 'post', 0, '2023-09-21 12:02:03', '1695268922', NULL);

-- ----------------------------
-- Table structure for mayday_article_category
-- ----------------------------
DROP TABLE IF EXISTS `mayday_article_category`;
CREATE TABLE `mayday_article_category`  (
  `article_id` int(0) NOT NULL,
  `category_id` bigint(0) NOT NULL,
  INDEX `MAYDAY_ARTILE_ID`(`article_id`) USING BTREE,
  INDEX `MAYDAY_ARTILE_CATEGORY_ID`(`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mayday_article_category
-- ----------------------------
INSERT INTO `mayday_article_category` VALUES (150, 20);

-- ----------------------------
-- Table structure for mayday_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `mayday_article_tag`;
CREATE TABLE `mayday_article_tag`  (
  `article_id` int(0) NOT NULL,
  `tag_id` bigint(0) NOT NULL,
  INDEX `MAYDAY_ARTILE_ID`(`article_id`) USING BTREE,
  INDEX `MAYDAY_ARTILE_TAG_ID`(`tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mayday_attachment
-- ----------------------------
DROP TABLE IF EXISTS `mayday_attachment`;
CREATE TABLE `mayday_attachment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `picture_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `picture_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `picture_small_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '略缩图',
  `picture_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片类型',
  `picture_create_date` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '上传时间',
  `picture_size` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `picture_suffix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '后缀',
  `picture_wh` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '尺寸',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mayday_attachment
-- ----------------------------
INSERT INTO `mayday_attachment` VALUES (245, '图层_220230918123915596.png', '/upload/2023/9/图层_220230918123915596.png', '/upload/2023/9/图层_220230918123915596_small.png', 'image/png', '2023-09-18 12:39:15.146', '293KB', '.png', '635x393');

-- ----------------------------
-- Table structure for mayday_category
-- ----------------------------
DROP TABLE IF EXISTS `mayday_category`;
CREATE TABLE `mayday_category`  (
  `category_id` int(0) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `category_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类路径',
  `category_describe` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mayday_category
-- ----------------------------
INSERT INTO `mayday_category` VALUES (20, 'java', '/java', '');

-- ----------------------------
-- Table structure for mayday_link
-- ----------------------------
DROP TABLE IF EXISTS `mayday_link`;
CREATE TABLE `mayday_link`  (
  `link_id` int(0) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `link_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '路径',
  `link_logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '链接logo',
  `link_describe` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mayday_logs
-- ----------------------------
DROP TABLE IF EXISTS `mayday_logs`;
CREATE TABLE `mayday_logs`  (
  `log_id` int(0) NOT NULL AUTO_INCREMENT,
  `log_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  `log_content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '内容',
  `log_ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `log_date` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 919 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mayday_logs
-- ----------------------------
INSERT INTO `mayday_logs` VALUES (892, '安装MAYDAY', '操作成功', '0:0:0:0:0:0:0:1', '2023-09-18 12:30:40');
INSERT INTO `mayday_logs` VALUES (893, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-18 12:33:24');
INSERT INTO `mayday_logs` VALUES (894, '上传附件', '上传成功', '0:0:0:0:0:0:0:1', '2023-09-18 12:39:15');
INSERT INTO `mayday_logs` VALUES (895, '发表文章', '操作成功', '0:0:0:0:0:0:0:1', '2023-09-18 12:39:26');
INSERT INTO `mayday_logs` VALUES (896, '发布页面', '操作成功', '0:0:0:0:0:0:0:1', '2023-09-18 12:42:31');
INSERT INTO `mayday_logs` VALUES (897, '删除文章', '操作成功', '0:0:0:0:0:0:0:1', '2023-09-18 12:43:19');
INSERT INTO `mayday_logs` VALUES (898, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-18 15:16:48');
INSERT INTO `mayday_logs` VALUES (899, '发布页面', '操作成功', '0:0:0:0:0:0:0:1', '2023-09-18 15:18:00');
INSERT INTO `mayday_logs` VALUES (900, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-18 15:46:16');
INSERT INTO `mayday_logs` VALUES (901, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-18 15:59:03');
INSERT INTO `mayday_logs` VALUES (902, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-18 16:01:16');
INSERT INTO `mayday_logs` VALUES (903, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-18 16:05:04');
INSERT INTO `mayday_logs` VALUES (904, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-18 16:06:08');
INSERT INTO `mayday_logs` VALUES (905, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-18 16:08:29');
INSERT INTO `mayday_logs` VALUES (906, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-18 16:10:55');
INSERT INTO `mayday_logs` VALUES (907, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-18 16:11:41');
INSERT INTO `mayday_logs` VALUES (908, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-18 16:12:33');
INSERT INTO `mayday_logs` VALUES (909, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-18 16:16:24');
INSERT INTO `mayday_logs` VALUES (910, '登录后台', '登录失败', '0:0:0:0:0:0:0:1', '2023-09-21 10:58:50');
INSERT INTO `mayday_logs` VALUES (911, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-21 10:59:29');
INSERT INTO `mayday_logs` VALUES (912, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-21 11:45:46');
INSERT INTO `mayday_logs` VALUES (913, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-21 11:51:55');
INSERT INTO `mayday_logs` VALUES (914, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-21 12:00:36');
INSERT INTO `mayday_logs` VALUES (915, '删除文章', '操作成功', '0:0:0:0:0:0:0:1', '2023-09-21 12:00:53');
INSERT INTO `mayday_logs` VALUES (916, '发表文章', '操作成功', '0:0:0:0:0:0:0:1', '2023-09-21 12:02:03');
INSERT INTO `mayday_logs` VALUES (917, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-21 12:05:19');
INSERT INTO `mayday_logs` VALUES (918, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2023-09-21 12:20:19');

-- ----------------------------
-- Table structure for mayday_menu
-- ----------------------------
DROP TABLE IF EXISTS `mayday_menu`;
CREATE TABLE `mayday_menu`  (
  `menu_id` int(0) NOT NULL AUTO_INCREMENT,
  `menu_icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `menu_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `menu_sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `menu_target` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '打开方式',
  `menu_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mayday_menu
-- ----------------------------
INSERT INTO `mayday_menu` VALUES (34, NULL, '首页', 1, '_self', '/');
INSERT INTO `mayday_menu` VALUES (35, NULL, '归档', 2, '_self', '/archives');
INSERT INTO `mayday_menu` VALUES (36, NULL, '友链', 3, '_self', '/links');
INSERT INTO `mayday_menu` VALUES (37, '', 'test', 4, '_blank', '/test');

-- ----------------------------
-- Table structure for mayday_options
-- ----------------------------
DROP TABLE IF EXISTS `mayday_options`;
CREATE TABLE `mayday_options`  (
  `option_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '设置名',
  `option_value` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '设置内容',
  PRIMARY KEY (`option_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mayday_options
-- ----------------------------
INSERT INTO `mayday_options` VALUES ('attachment_location', 'server');
INSERT INTO `mayday_options` VALUES ('blog_name', 'onepiece');
INSERT INTO `mayday_options` VALUES ('blog_start', '2023-09-18');
INSERT INTO `mayday_options` VALUES ('blog_url', 'localhost');
INSERT INTO `mayday_options` VALUES ('comment_gitalk_admin', '');
INSERT INTO `mayday_options` VALUES ('comment_gitalk_clientid', '');
INSERT INTO `mayday_options` VALUES ('comment_gitalk_clientSecret', '');
INSERT INTO `mayday_options` VALUES ('comment_gitalk_owner', '');
INSERT INTO `mayday_options` VALUES ('comment_gitalk_repo', '');
INSERT INTO `mayday_options` VALUES ('comment_valine_appid', '');
INSERT INTO `mayday_options` VALUES ('comment_valine_appkey', '');
INSERT INTO `mayday_options` VALUES ('comment_valine_hint', '');
INSERT INTO `mayday_options` VALUES ('comment_valine_portrait', 'identicon');
INSERT INTO `mayday_options` VALUES ('email_username', 'chen665775@qq.com');
INSERT INTO `mayday_options` VALUES ('is_install', 'true');
INSERT INTO `mayday_options` VALUES ('platform_comment', 'gitalk');

-- ----------------------------
-- Table structure for mayday_tag
-- ----------------------------
DROP TABLE IF EXISTS `mayday_tag`;
CREATE TABLE `mayday_tag`  (
  `tag_id` int(0) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `tag_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标签路径',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mayday_theme
-- ----------------------------
DROP TABLE IF EXISTS `mayday_theme`;
CREATE TABLE `mayday_theme`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主题名(url)',
  `theme_describe` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主题描述',
  `theme_img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主题预览图',
  `theme_status` int(0) NULL DEFAULT 0 COMMENT '0未启用1已启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mayday_theme
-- ----------------------------
INSERT INTO `mayday_theme` VALUES (26, 'pinghsu', 'pinghsu', '/static/img/pinghsu.jpg', 1, '2023-09-18 12:30:40');

-- ----------------------------
-- Table structure for mayday_user
-- ----------------------------
DROP TABLE IF EXISTS `mayday_user`;
CREATE TABLE `mayday_user`  (
  `user_id` int(0) NOT NULL AUTO_INCREMENT,
  `login_enable` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '是否禁用登录',
  `login_error` int(0) NULL DEFAULT NULL COMMENT '登录失败次数',
  `login_last_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `user_portrait` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `user_explain` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '说明',
  `user_display_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '显示名称',
  `user_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_pwd` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mayday_user
-- ----------------------------
INSERT INTO `mayday_user` VALUES (9, 'false', 0, '2023-09-21 12:20:19', NULL, NULL, 'admin', 'chen665775@qq.com', 'admin', 'e10adc3949ba59abbe56e057f20f883e');

SET FOREIGN_KEY_CHECKS = 1;
