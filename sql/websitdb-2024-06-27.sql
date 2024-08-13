/*
 Navicat Premium Data Transfer

 Source Server         : WebsiteUI
 Source Server Type    : MySQL
 Source Server Version : 50650 (5.6.50-log)
 Source Host           : 124.223.41.220:3306
 Source Schema         : websitdb

 Target Server Type    : MySQL
 Target Server Version : 50650 (5.6.50-log)
 File Encoding         : 65001

 Date: 27/06/2024 21:05:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for favors
-- ----------------------------
DROP TABLE IF EXISTS `favors`;
CREATE TABLE `favors` (
  `favors_id` int(100) NOT NULL AUTO_INCREMENT,
  `favors_name` varchar(100) DEFAULT NULL,
  `favors_money` varchar(100) DEFAULT NULL,
  `favors_backMoney` varchar(100) DEFAULT ' ',
  `favors_timer` varchar(10) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` varchar(100) DEFAULT '2024-04-01',
  `update_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`favors_id`),
  UNIQUE KEY `favors_id` (`favors_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2299 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of favors
-- ----------------------------
BEGIN;
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1, '姜登亮', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (2, '何友强', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (3, '陈章清', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (4, '陈焕才', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (5, '陈文强', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (6, '付先龙', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (7, '张祖万', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (8, '罗培强', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (9, '曹安乾', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (10, '罗德平', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (11, '罗德强', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (12, '罗德恒', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (13, '罗涛', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (14, '陈吉聪', '1200', NULL, '1', '毛毯一床', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (15, '五担沟，陈绍兴', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (16, '何登伦', '120', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (17, '何登文', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (18, '何登军', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (19, '姜成万', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (20, '张玉书', '120', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (21, '熊宗学', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (22, '宋良勇', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (23, '罗毫峰', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (24, '吴常军', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (25, '雷俊', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (26, '罗德寿', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (27, '鱼堡田，陈绍兴', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (28, '吴强书', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (29, '杨绍诚', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (30, '王毕伦', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (31, '吴强友', '120', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (32, '熊友江', '500', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (33, '张祖林', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (34, '杨兴林', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (35, '王德斌', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (36, '解贵龙', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (37, '解贵忠', '70', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (38, '曹安强', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (39, '曹安茂', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (40, '罗培松', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (41, '熊宗贤', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (42, '杨涛', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (43, '杨家龙', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (44, '段国科', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (45, '段国龙', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (46, '徐健', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (47, '张洪书', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (48, '李友桥', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (49, '杨富龙', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (50, '朱家楷', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (51, '卓正禹', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (52, '袁明江', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (53, '晋家洪', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (54, '袁明才', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (55, '石成富', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (56, '王德荣', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (57, '倪玉华', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (58, '刘世万', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (59, '宋诗云', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (60, '叶顶聪', '8000', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (61, '刘兴波', '500', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (62, '陈庆贵', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (63, '卓正礼', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (64, '卓林', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (65, '张金兆', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (66, '段国端', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (67, '魏楚贵', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (68, '卓正义', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (69, '张金柱', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (70, '颜富军', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (71, '姜成忠', '500', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (72, '付雄', '3000', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (73, '雷联科', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (74, '卓正兴', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (75, '卓正贵', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (76, '卓正万', '4000', NULL, '1', '棉被，毛毯，锣鼓，泡，屏1架，大米50斤，粉子面一件', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (77, '王德权', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (78, '卓永红', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (79, '石成方', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (80, '杨传勇', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (81, '宋诗尧', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (82, '李友才', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (83, '郭庭焕', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (84, '颜福勇', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (85, '卓正西', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (86, '陈天波', '500', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (87, '王德方', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (88, '冉玉忠（冉哑巴）', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (89, '罗德文', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (90, '付正先', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (91, '卓正培', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (92, '卓正喜', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (93, '卓正书', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (94, '段贵聪', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (95, '罗德辉', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (96, '谢先波', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (97, '唐科', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (98, '卓加文', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (99, '兰才方', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (100, '卓正雄', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (101, '刘成方', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (102, '吴学开', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (103, '王浩', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (104, '卓家兴', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (105, '段国培', '120', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (106, '童庆贵', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (107, '张仲琴', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (108, '王永书', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (109, '颜富江', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (110, '颜富金', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (111, '卓正远', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (112, '卓家奇', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (113, '卓正海', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (114, '昌正文', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (115, '罗德贵', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (116, '卓正举', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (117, '王波', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (118, '王兴凤', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (119, '袁铭军', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (120, '张兴文', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (121, '李永才', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (122, '陈功宝', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (123, '罗德胜', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (124, '熊宗泰', '250', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (125, '陈吉富', '4000', NULL, '1', '乐队，礼花，屏1架，衣服，大米50斤，毛毯', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (126, '陈吉祥', '6000', NULL, '1', '礼花，屏1架，毛毯，乐队，衣服，大米50斤', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (127, '陈吉才', '8800', NULL, '1', '礼花，屏，棉被，衣服，乐队，大米50斤', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (128, '陈吉银', '2600', NULL, '1', '礼花，屏，毛毯，乐队，衣服，大米50斤', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (129, '解贵远', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (130, '陈吉书', '600', NULL, '1', '毛毯，烟花，火炮，大米50斤', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (131, '姜成江', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (132, '何登才', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (133, '何登波', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (134, '何登云', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (135, '郑少强', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (136, '张仲海', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (137, '罗安雄', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (138, '邓兰东', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (139, '陈功林', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (140, '余德书', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (141, ' 普方远', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (142, '徐楚', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (143, '卓永刚', '1200', NULL, '1', '锣鼓，毛毯，大米50斤，花炮', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (144, '叶昌强', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (145, '吴开权', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (146, '罗德海', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (147, '谢先奇', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (148, '卓正榜', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (149, '邵明强', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (150, '胡光喜', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (151, '徐力军', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (152, '袁明松', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (153, '赵泽军', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (154, '卓加亮', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (155, '周开富', '500', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (156, '卓正超', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (157, '王兴远', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (158, '王永胜', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (159, '罗启明', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (160, '李银', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (161, '胡聪玖', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (162, ' 冉照高', '220', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (163, '刘世贵', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (164, '白庆忠', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (165, '卓加友', '60', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (166, '王张伟？', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (167, '罗德光', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (168, '胡祖海', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (169, '杜永聪', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (170, '何登强', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (171, '何登喜', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (172, '周开伦', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (173, '普加强', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (174, '徐力武', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (175, '卓正虎', '600', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (176, '昌正关', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (177, '罗培宗', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (178, '罗德友', '400', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (179, '黄启柱', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (180, '罗培权', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (181, '杜联伟', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (182, '康古武', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (183, '杜老五', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (184, '卓胜', '600', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (185, '陈明武', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (186, '兰才厚', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (187, '张军海', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (188, '王兴龙', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (189, '罗培元', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (190, '谢太权', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (191, '范超', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (192, '陈焕龙', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (193, '徐禄春', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (194, '罗德林', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (195, '张军华', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (196, '王万才', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (197, '吴常鹏', '100\n', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (198, '\n徐本兴', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (199, '胡志勇', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (200, '罗德禄', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (201, '李启勇', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (202, ' 徐力贵', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (203, '胡世权', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (204, '罗培宣', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (205, '吴合军', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (206, '刘永斌', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (207, '刘永强', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (208, '唐军', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (209, '袁明华', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (210, '袁德彰', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (211, '魏宗阳', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (212, '小闹，胡聪玖', '240', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (213, '温明书', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (214, '范泽贵', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (215, '李文海', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (216, '倪玉贵', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (217, '侯帮勤', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (218, '刘波', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (219, '刘汉云', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (220, '郑方楷', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (221, '姜登强', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (222, '唐莫军', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (223, '姜登洪', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (224, '罗培龙', '80', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (225, '徐其义', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (226, '杜钊兵', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (227, '胡世江', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (228, '郭培炎', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (229, '卓正金', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (230, '罗德远', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (231, '周中华', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (232, '李兴文', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (233, '罗培伦', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (234, '兰润海', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (235, '雷联聪', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (236, '昌西', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (237, '谢先勋', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (238, '熊有国', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (239, '张金玉', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (240, '张建勇', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (241, '张明书', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (242, '张金周', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (243, '冉照权', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (244, '张金友', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (245, '张仲友', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (246, '院子，宋良军', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (247, '卓正巡', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (248, '张宗洪', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (249, '卓正银', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (250, ' 卓正军', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (251, '王廷字', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (252, '袁永贵', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (253, '陈焕伦', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (254, '杜向友', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (255, '徐本银', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (256, '段国喜', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (257, '段国银', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (258, '朱家本', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (259, '周开华', '120', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (260, '杨家远', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (261, '周开丛', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (262, '卓正波', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (263, '卓家华', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (264, '卓正权', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (265, '石成华', '120', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (266, '卓昊', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (267, '邓杰', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (268, '邓申财', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (269, '邓申俊', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (270, '刘代书', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (271, '罗玄义', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (272, '陈绍宗', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (273, '卓正辉', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (274, '唐德勇', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (275, '杨传飞', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (276, '周德云', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (277, '陈功明', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (278, '卓永林', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (279, '卓正湖', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (280, '卓正江', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (281, '  吴道林', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (282, '罗德富', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (283, '罗波', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (284, '兰才文', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (285, '王昌贵', '120', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (286, '袁永书', '260', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (287, '杨家万', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (288, '颜富寿', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (289, '罗德兰', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (290, '王奉文', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (291, '陶余聪', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (292, '洗马塘，同学，陈伟', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (293, '陈功华', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (294, '刘春元', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (295, '段国庆', '240', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (296, '卓家强', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (297, '田正聪', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (298, '熊家坝，熊友贵', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (299, '冉照奇', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (300, '雷学动', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (301, '叶顶贵', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (302, '卓正席', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (303, '卓正周', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (304, '陈富贵', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (305, '艾祖雄', '80', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (306, '卓正坤', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (307, '庄禄章', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (308, '李登尧', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (309, '况昌燕', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (310, '杨绍虎', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (311, '卢云宽', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (312, '刘祖金', '120', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (313, '王兴贵', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (314, '刘德华', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (315, '杨文宣', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (316, '刘川', '500', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (317, '王世雄', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (318, '熊友熬', '500', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (319, '艾显云', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (320, '艾显华', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (321, '李文金', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (322, '卓正宗', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (323, '李文权', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (324, '姜大江', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (325, '赵泽林', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (326, '卓正茂', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (327, '朱家群', '250', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (328, '罗培虎', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (329, '陈传勇', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (330, '庄国义', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (331, '袁永明', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (332, '徐超', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (333, '罗培喜', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (334, '赵开华', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (335, '刘代银', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (336, '昌正平', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (337, '庐山', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (338, '陶余雄', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (339, '桃子坝，刘永贵', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (340, '东风，王兴聪', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (341, '罗培义', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (342, '新场，宋良军', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (343, '罗玄军', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (344, '何友权', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (345, '何友熬', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (346, '杨文江', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (347, '周开松', '50', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (348, '胡纯书', '150', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (349, '刘氏富', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (350, '老板，王朝书', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (351, '黄虎', '300', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (352, '陈余红', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (353, '宋小四', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (354, '武孔会', '120', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (355, '王永银', '100', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (356, '温兴聪', '200', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (357, '张建军', '200\n', NULL, '1', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (358, '******', '100', '', '2', '', '2024-04-01', 'Thu Jun 27 2024 20:58:15 GMT+0800 (中国标准时间)');
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (359, '石成华', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (360, '胡志勇', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (361, '李文海', '600', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (362, '袁德彰', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (363, '袁明华', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (364, '罗培强', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (365, '范超', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (366, '姜成江', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (367, '唐科', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (368, '杜宗洪', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (369, '吴道林', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (370, '周忠华', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (371, '谢晓峰', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (372, '肖发超', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (373, '付先龙', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (374, '张兴奇', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (375, '卓家强', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (376, '付正先', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (377, '杨富龙', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (378, '李友乔', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (379, '李友才', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (380, '徐力武', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (381, '卓正礼', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (382, '魏佐江', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (383, '刘春元', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (384, '李兴洪', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (385, '王朝书', '500', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (386, '王丽', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (387, '王静', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (388, '张军华', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (389, '杜联伟', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (390, '唐漠军', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (391, '颜富金', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (392, '昌品', '200', '200', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (393, '昌正贵', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (394, '昌正才', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (395, '昌俊', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (396, '昌正江', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (397, '昌青鹏', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (398, '昌其', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (399, '杨绍虎', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (400, '张仲友', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (401, '魏仁学', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (402, '谢太全', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (403, '陈功林', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (404, '陈功宝', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (405, '昌正兴', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (406, '昌正开', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (407, '宋诗聪', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (408, '王田洪', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (409, '昌维乾', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (410, '卢山', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (411, '庄国青', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (412, '胡勇', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (413, '陈伟', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (414, '陈明武', '300', NULL, '2', '花圈', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (415, '罗德贵', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (416, '陈天波', '300', NULL, '2', '花圈', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (417, '叶昌龙', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (418, '罗静', '300', NULL, '2', '花圈', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (419, '卓正巡', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (420, '昌维勤', '3000', NULL, '2', '锣鼓、火炮、华伞、被子、花炮、大米2袋', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (421, '大海子、付先龙', '500', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (422, '李世友', '400', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (423, '彭应武', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (424, '况银金', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (425, '昌孟', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (426, '吴开全', '200', NULL, '2', '花圈', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (427, '谢先兵', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (428, '罗德森', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (429, '罗芳', '200', NULL, '2', '花圈', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (430, '谢先敏', '200', '200、200', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (431, '谢先奇', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (432, '罗德海', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (433, '卓正凯', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (434, '胡世权', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (435, '邵大聪', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (436, '卓正金', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (437, '袁永贵', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (438, '卓正香', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (439, '张金照', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (440, '段国庆', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (441, '杨传学', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (442, '卓正伟', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (443, '张成林', '1800', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (444, '李大明', '1000', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (445, '滕俊', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (446, '张国书', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (447, '张洪书', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (448, '张祖万', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (449, '卓正虎', '1000', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (450, '杜永聪', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (451, '杜永强', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (452, '杜招兵', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (453, '宋书贵', '100', '100', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (454, '宋诗云', '100', '100', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (455, '宋良勇', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (456, '周开富', '300', '300', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (457, '张仲玖', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (458, '昌正双', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (459, '邓成聪', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (460, '邓成松', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (461, '邓成群', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (462, '邓成雄', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (463, '张金友', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (464, '张金玉', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (465, '徐力华', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (466, '陈功华', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (467, '柴银', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (468, '卓正友', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (469, '杨永松', '800', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (470, '温明书', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (471, '卓正林', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (472, '卓正玺', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (473, '陈吉伟', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (474, '陈吉贵', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (475, '卓正雄', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (476, '段国龙', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (477, '刘相金', '150', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (478, '何友权', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (479, '何友敖', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (480, '颜福寿', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (481, '卓家富', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (482, '康吉武', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (483, '杨贵应', '1000', '1200', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (484, '罗培炎', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (485, '徐力军', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (486, '庄国义', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (487, '陈勇', '500', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (488, '昌维金', '200', '200', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (489, '胡永涛', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (490, '王兴华', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (491, '罗德远', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (492, '卓加开', '10800', '12800', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (493, '姜登洪', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (494, '卓正席', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (495, '卓正奎', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (496, '侯昌龙', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (497, '罗玄方', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (498, '侯帮琴', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (499, '侯帮强', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (500, '卓正贵', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (501, '陈相权', '200', '200', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (502, '卓永林', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (503, '昌正金', '300', '300', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (504, '段国阳', '300', '200', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (505, '徐力强', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (506, '徐力银', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (507, '卓正超', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (508, '杨文江', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (509, '昌维林', '500', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (510, '昌正学', '50', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (511, '卓正湖', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (512, '卓正新', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (513, '卓家亮', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (514, '康德方', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (515, '曹安强', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (516, '何友强', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (517, '罗德文', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (518, '袁明江', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (519, '卓正军', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (520, '艾祖友', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (521, '段大钱', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (522, '段国科', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (523, '段国奇', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (524, '杨绍成', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (525, '陈余艳', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (526, '王永胜', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (527, '王兴远', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (528, '卓永洪', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (529, '卓正远', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (530, '卓正义', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (531, '黄训勇', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (532, '张祖培', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (533, '卓正怀', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (534, '石成富', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (535, '卓正全', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (536, '昌刚', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (537, '昌青林', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (538, '昌青永', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (539, '昌正强', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (540, '吴道波', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (541, '宋林书', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (542, '张玉书', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (543, '张明书', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (544, '白庆忠', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (545, '罗波', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (546, '黄启从', '200', NULL, '2', '花圈，火炮', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (547, '倪玉贵', '100', '100', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (548, '罗星', '500', NULL, '2', '烟花2桶', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (549, '张祖林', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (550, '胡光喜', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (551, '姜成万', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (552, '胡合义', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (553, '胡合军', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (554, '卓加庆', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (555, '卓正阳', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (556, '曹照强', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (557, '李文全', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (558, '倪玉华', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (559, '刘世万', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (560, '颜富均', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (561, '颜富勇', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (562, '陶余聪', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (563, '卓正坤', '200', '200', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (564, '刘家润', '500', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (565, '邓孟', '200', '200', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (566, '卓家羊', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (567, '付雄', '3500', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (568, '李友刚', '200', NULL, '2', '花圈', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (569, '姜成忠', '500', NULL, '2', '花圈', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (570, '周开华', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (571, '段国银', '150', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (572, '熊宗贤', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (573, '罗培松', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (574, '卓胜', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (575, '卓正举', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (576, '卓正希', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (577, '朱家军', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (578, '熊宗学', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (579, '杨涛', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (580, '胡祖海', '1200', NULL, '2', '毛毯1床、烟花1桶、火炮锣鼓花圈大米1包', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (581, '胡洪', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (582, '胡纯昌', '300', '300', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (583, '罗德强', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (584, '唐发军', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (585, '罗奇恒', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (586, '卓正培', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (587, '王永书', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (588, '罗德平', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (589, '罗德辉', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (590, '罗培林', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (591, '王兴科', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (592, '袁明军', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (593, '王兴刚', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (594, '昌希', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (595, '昌青春', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (596, '王张伟', '200', '200', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (597, '邓申财', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (598, '熊远梦', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (599, '宋良聪', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (600, '卓家文', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (601, '罗培宗', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (602, '陶余雄', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (603, '卓正波', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (604, '雷世凯', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (605, '吴常鹏', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (606, '罗涛', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (607, '罗德晟', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (608, '熊友敖', '600', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (609, '袁明才', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (610, '熊友江', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (611, '况昌余', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (612, '杨兴才', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (613, '李登尧', '400', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (614, '卓正宗', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (615, '张军海', '150', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (616, '王兴龙', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (617, '王兴奉', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (618, '罗培权', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (619, '徐梦', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (620, '罗培元', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (621, '刘兴波', '500', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (622, '罗德恒', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (623, '罗培轩', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (624, '卓家鸿', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (625, '刘成军', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (626, '刘义', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (627, '刘成才', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (628, '刘成方', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (629, '刘波', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (630, '刘代银', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (631, '曹阜曾', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (632, '武邵兵', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (633, '王万才', '150', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (634, '刘家富', '500', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (635, '郭廷福', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (636, '袁永书', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (637, '余华', '50', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (638, '赵泽军', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (639, '卓彪', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (640, '卓皓', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (641, '谢太波', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (642, '王兴平', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (643, '王兴聪', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (644, '卓艳', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (645, '陈焕才', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (646, '罗德香', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (647, '段国聪', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (648, '郭廷焕', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (649, '兰才方', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (650, '赵常均', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (651, '陈焕龙', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (652, '王兴贵', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (653, '卓正海', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (654, '卓家奇', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (655, '段国喜', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (656, '段国端', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (657, '陈文武', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (658, '卓正银', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (659, '罗德兰', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (660, '吴学开', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (661, '姜大江', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (662, '卓正禹', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (663, '大地、胡聪玖', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (664, '王廷自', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (665, '蒋学香', '600', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (666, '五丹沟、陈绍兴', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (667, '卓永刚', '1000', NULL, '2', '大米1包、棉被1床、烟花火炮花篮锣鼓', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (668, '叶昌强', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (669, '卓杰林', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (670, '陈吉聪', '1300', NULL, '2', '烟花、火炮、花圈', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (671, '卓正书', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (672, '解国忠', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (673, '卓家华', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (674, '新场、宋良军', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (675, '何登军', '150', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (676, '何登能', '150', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (677, '何仕勇', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (678, '张宗洪', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (679, '晋家兵', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (680, '罗安雄', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (681, '卓正江', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (682, '袁明松', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (683, '王浩', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (684, '范泽贵', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (685, '杨家龙', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (686, '罗德寿', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (687, '李兴文', '100', '100', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (688, '袁师', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (689, '卓正辉', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (690, '王昌贵', '120', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (691, '杨家万', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (692, '罗德林', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (693, '陈绍宗', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (694, '周开洪', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (695, '段永义', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (696, '黄雄', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (697, '杨传勇', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (698, '张金柱', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (699, '卓正茂', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (700, '罗德禄', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (701, '李启勇', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (702, '谢先海', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (703, '温兴宗', '400', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (704, '晋家强', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (705, '王朝海', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (706, '罗培喜', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (707, '赵开华', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (708, '徐力贵', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (709, '徐禄春', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (710, '卓林', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (711, '陈吉富', '3000', NULL, '2', '大米1包、火纸1件、花炮花圈罗鼓', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (712, '陈吉才', '8000', NULL, '2', '大米1包、火纸1件、毛毯1床、花炮花圈罗鼓', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (713, '陈吉祥', '4000', NULL, '2', '大米1包、火纸1件、毛毯1床、花炮花圈罗鼓', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (714, '陈吉银', '8000', NULL, '2', '大米1包、火纸1件、毛毯1床、花炮花圈罗鼓', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (715, '叶顶聪', '2000', NULL, '2', '大米1包、花炮花圈罗鼓', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (716, '晋方玖', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (717, '解贵远', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (718, '陈祥艳', '600', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (719, '杨举书', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (720, '何登文', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (721, '雷学栋', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (722, '解贵龙', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (723, '何登云', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (724, '何登强', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (725, '何登洪', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (726, '张仲海', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (727, '何登波', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (728, '朱家群', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (729, '兰才厚', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (730, '昌正文', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (731, '陈吉书', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (732, '郑绍强', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (733, '邵付美', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (734, '周开从', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (735, '谢太友', '100', '200', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (736, '杨文军', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (737, '罗培义', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (738, '颜富江', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (739, '晋家洪', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (740, '季永才', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (741, '徐健', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (742, '冉玉忠', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (743, '兰润海', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (744, '昌正关', '300', '300', '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (745, '罗德友', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (746, '吴强友', '150', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (747, '晋家康', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (748, '罗德喜', '300', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (749, '李发贵', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (750, '罗培虎', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (751, '刘华富', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (752, '周开银', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (753, '院子、陈章青', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (754, '卢跃春', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (755, '卢跃阳', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (756, '罗培龙', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (757, '徐其义', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (758, '艾显东', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (759, '院子、雷联学', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (760, '宋良书', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (761, '庄禄章', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (762, '曹安全', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (763, '曹安茂', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (764, '桃子坝、刘永强', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (765, '魏康林', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (766, '魏楚贵', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (767, '韩高照', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (768, '陈功明', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (769, '刘永兵', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (770, '雷联科', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (771, '熊宗泰', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (772, '刘向洪', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (773, '宋小四', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (774, '昌凯', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (775, '陈仁春', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (776, '罗玄义', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (777, '吴川', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (778, '昌正松', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (779, '文川', '500', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (780, '杨文轩', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (781, '昌俊', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (782, '昌正桃', '100', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (783, '刘鹏', '400', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (784, '昌维贵', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (785, '艾显丽', '200', NULL, '2', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (786, '袁明松', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (787, '李文海', '1000', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (788, '陈文波', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (789, '陈吉贵', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (790, '袁明江', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (791, '胡合义', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (792, '胡合均', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (793, '付俊', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (794, '何友权', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (795, '宋良军', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (796, '张均华', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (797, '袁明才', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (798, '姜登洪', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (799, '杨文江', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (800, '杨丽', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (801, '陈功华', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (802, '陈功林', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (803, '王万才', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (804, '罗德文', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (805, '王永胜', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (806, '胡洪', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (807, '吴道强', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (808, '罗德兰', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (809, '刘波', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (810, '昌正官', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (811, '陈功宝', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (812, '卓加开', '12900', NULL, '3', '昙花被，烟花2桶，大米二包，火炮锣鼓', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (813, '陈相全', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (814, '罗培炎', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (815, '李永才', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (816, '卓家华', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (817, '卓家强', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (818, '卓健', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (819, '付正先', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (820, '宋书贵', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (821, '宋书明', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (822, '周开富', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (823, '罗德森', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (824, '罗静', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (825, '陈天波', '500', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (826, '吴开权', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (827, '卓永林', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (828, '李启勇', '400', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (829, '卓正湖', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (830, '陈明武', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (831, '罗德贵', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (832, '袁永书', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (833, '宋良勇', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (834, '袁永贵', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (835, '昌西', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (836, '徐力武', '500', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (837, '陈功明', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (838, '罗德林', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (839, '陈吉伟', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (840, '卓林', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (841, '卓正江', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (842, '昌正文', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (843, '吴开科', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (844, '昌青春', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (845, '昌青虎', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (846, '昌正奇', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (847, '昌维轩', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (848, '罗培元', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (849, '罗德远', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (850, '罗培轩', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (851, '周忠华', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (852, '罗培权', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (853, '徐梦', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (854, '柴银', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (855, '王兴刚', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (856, '罗德友', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (857, '叶昌强', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (858, '张军海', '150', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (859, '江成万', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (860, '团结，王永书', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (861, '王兴华', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (862, '罗德禄', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (863, '熊友江', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (864, '卓永刚', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (865, '卓正希', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (866, '颜富江', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (867, '卓正远', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (868, '卓吉灵', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (869, '卓正超', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (870, '罗德寿', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (871, '姜大江', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (872, '李友刚', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (873, '姜成忠', '600', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (874, '卓标', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (875, '兰华远', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (876, ' 卓正禹', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (877, '杨永松', '800', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (878, '罗培强', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (879, '卢山', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (880, '袁明华', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (881, '周开林', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (882, '曹安乾', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (883, '曹安强', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (884, '曹安茂', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (885, '何友强', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (886, '卓正礼', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (887, '陶余雄', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (888, '卓正坤', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (889, '王兴龙', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (890, '张友聪', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (891, '刘兴波', '500', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (892, '徐禄春', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (893, '徐力贵', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (894, '武元葱', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (895, '王兴聪', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (896, '谢作平', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (897, '颜富寿', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (898, '陶余贵', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (899, '卓正席', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (900, '刘华富', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (901, '王兴奉', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (902, '张祖涛', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (903, '建设，杨少虎', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (904, '两合岩，谢先海', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (905, '颜富金', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (906, '卓振', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (907, ' 卓浩', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (908, '李友才', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (909, '李友桥', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (910, '段国奇', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (911, '段国科', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (912, '徐力华', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (913, '杨国应', '1200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (914, '杜宗洪', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (915, '卓胜', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (916, '卓正雄', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (917, '段国龙', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (918, '卢跃春', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (919, '卢跃阳', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (920, '魏宗阳', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (921, '谢太权', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (922, '谢太友', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (923, '刘相洪', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (924, '宋良书', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (925, '熊宗学', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (926, '陈章清', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (927, '卓家富', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (928, '郭廷焕', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (929, '倪朝金', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (930, '颜富均', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (931, '卓家亮', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (932, '卓正兴', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (933, '颜富勇', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (934, '陈文雄', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (935, '陈勇', '400', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (936, '卓正玺', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (937, '蒿之坝，唐沫军', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (938, '张小波', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (939, '谢太波', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (940, '王兴平', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (941, '付先奉', '300', NULL, '3', '大米二包火炮', '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (942, '郭家沟，王波', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (943, '刘威', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (944, '谢先敏', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (945, '罗培虎', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (946, '庄国义', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (947, '罗德海', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (948, '何友鳌', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (949, '庄国林', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (950, '倪玉华', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (951, '卓正宗', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (952, '卓家洋', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (953, '卓正辉', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (954, '陶余聪', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (955, '卓正虎', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (956, '李兴文', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (957, '温明书', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (958, '陈文武', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (959, '杜永聪', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (960, '罗培义', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (961, '兰才厚', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (962, '李兴东', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (963, '朱家群', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (964, '卓恒', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (965, '段国聪', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (966, '杨富龙', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (967, '白庆忠', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (968, '杨涛', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (969, '罗豪峰', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (970, '罗培松', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (971, '张金玉', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (972, '张金友', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (973, '况昌余', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (974, '卓正巡', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (975, '卓永洪', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (976, '李登尧', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (977, '王昌贵', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (978, '罗培喜', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (979, '罗培龙', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (980, '卓正银', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (981, '胡聪玖', '150', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (982, '陈文强', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (983, '陈文学', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (984, '冉玉忠', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (985, '石成方', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (986, '卓正权', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (987, ' 刘成方', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (988, '康吉武', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (989, '卓家洪', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (990, '熊友敖', '600', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (991, '卓家庆', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (992, '卓艳', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (993, '石成富', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (994, '冉照奇', '150', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (995, '张玉书', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (996, '张洪书', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (997, '张祖万', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (998, '张国书', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (999, '刘春元', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1000, '张明书', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1001, '卓涛', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1002, '曹照强', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1003, '赵开华', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1004, '吴道林', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1005, '胡世权', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1006, '刘成军', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1007, '刘成忠', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1008, '刘成才', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1009, '胡世江', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1010, '卓正波', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1011, '杨传勇', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1012, '张金照', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1013, '杨家龙', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1014, '张金柱', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1015, '段国庆', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1016, '徐其义', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1017, '杜招兵', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1018, '范泽贵', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1019, ' 周开华', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1020, '卓正凯', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1021, '卓正军', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1022, '卓正金', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1023, '赵泽均', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1024, '刘世万', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1025, '杨文均', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1026, '罗德平', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1027, '罗德强', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1028, '唐军', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1029, '肖发超', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1030, '雷联聪', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1031, '庄国青', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1032, '韩高照', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1033, '谢先奇', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1034, '杜联伟', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1035, '何登强', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1036, '卓家文', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1037, '王朝海', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1038, '宋良聪', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1039, '胡光喜', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1040, '熊宗太', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1041, '卓正书', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1042, '罗培宗', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1043, '罗德恒', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1044, '白浪', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1045, '罗德辉', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1046, '陈少宗', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1047, '何德成', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1048, '绍付美', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1049, '袁铭军', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1050, '卓正海', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1051, '卓正举', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1052, '曾孝春', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1053, '卓正茂', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1054, '郑少宽', '500', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1055, '郑少强', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1056, '况昌俊', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1057, '谢贵龙', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1058, '何登文', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1059, '周开丛', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1060, '徐力强', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1061, '徐丽银', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1062, '李林', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1063, '周义', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1064, '武少强', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1065, '黄虎', '500', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1066, '罗江明', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1067, '卓正云', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1068, '周开伦', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1069, '石成华', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1070, '胡聪奎', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1071, '盐津，罗书愉', '400', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1072, '盐津，罗书文', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1073, '盐津，罗其康', '400', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1074, '盐津，罗其川', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1075, '罗书鹏', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1076, '卓正友', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1077, '卓家奇', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1078, '罗德晟', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1079, '罗涛', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1080, '吴常鹏', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1081, '刘相金', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1082, '滕旭', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1083, '滕俊', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1084, '滕超', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1085, '陈伟', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1086, '袁师', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1087, '昌正才', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1088, '罗玄义', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1089, '徐力军', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1090, '胡祖海', '1000', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1091, '胡纯昌', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1092, '雷学栋', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1093, '罗安雄', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1094, '何登云', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1095, '陈吉才', '8800', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1096, '侯邦琴', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1097, '陈吉富', '5000', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1098, '雷俊', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1099, '冉老八', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1100, '宋林书', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1101, '宋汉书', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1102, '温兴聪', '400', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1103, '陈吉银', '4000', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1104, '陈吉祥', '3000', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1105, '侯昌龙', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1106, '段大乾', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1107, '昌维琴', '3200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1108, '张成林', '1000', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1109, '刘代银', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1110, '昌正光', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1111, '昌维贵', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1112, '昌俊', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1113, '昌正贵', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1114, '昌青鹏', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1115, '半曹，王朝书', '500', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1116, '昌维林', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1117, '王群', '500', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1118, '杨文轩', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1119, '段国阳', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1120, '昌正强', '500', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1121, '刘鹏', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1122, '刘家润', '500', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1123, '傅少涛', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1124, '胡永涛', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1125, '郭伦东', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1126, '何登才', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1127, '刘艳', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1128, '刘家富', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1129, '昌正学', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1130, '况银金', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1131, '昌正桃', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1132, '昌猛', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1133, '叶顶聪', '2000', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1134, '昌正兴', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1135, '刘金', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1136, '周开银', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1137, '文川', '500', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1138, '陈吉书', '300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1139, '陈吉聪', '1300', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1140, '罗吉友', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1141, '唐德科', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1142, '昌刚', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1143, '文家会', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1144, '昌维金', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1145, '邓申富', '200', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (1146, '何登科', '100', NULL, '3', NULL, '2024-04-01', NULL);
INSERT INTO `favors` (`favors_id`, `favors_name`, `favors_money`, `favors_backMoney`, `favors_timer`, `remark`, `create_time`, `update_time`) VALUES (2297, '11', '11', '11', '4', '11', 'Tue Jun 25 2024 09:22:59 GMT+0800 (中国标准时间)', 'Thu Jun 27 2024 18:06:29 GMT+0800 (中国标准时间)');
COMMIT;

-- ----------------------------
-- Table structure for skill
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) NOT NULL COMMENT '技能名称',
  `level` int(10) NOT NULL COMMENT '技能等级',
  `description` varchar(100) NOT NULL COMMENT '技能描述',
  `type` int(10) NOT NULL COMMENT '技能类型',
  `effect` varchar(100) NOT NULL COMMENT '技能效果',
  `cost` varchar(100) NOT NULL COMMENT '技能消耗',
  `duration` int(100) NOT NULL COMMENT '技能持续时间',
  `ranges` varchar(100) NOT NULL COMMENT '技能范围',
  `target` varchar(100) NOT NULL COMMENT '技能目标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of skill
-- ----------------------------
BEGIN;
INSERT INTO `skill` (`id`, `name`, `level`, `description`, `type`, `effect`, `cost`, `duration`, `ranges`, `target`) VALUES (1, '大刀斩1', 5, '技能描述', 0, '亚瑟王那样的大招', '10000', 10, '500', '目标：亚瑟王');
INSERT INTO `skill` (`id`, `name`, `level`, `description`, `type`, `effect`, `cost`, `duration`, `ranges`, `target`) VALUES (2, '大刀斩2', 5, '技能描述', 0, '亚瑟王那样的大招', '10000', 10, '500', '目标：亚瑟王');
INSERT INTO `skill` (`id`, `name`, `level`, `description`, `type`, `effect`, `cost`, `duration`, `ranges`, `target`) VALUES (3, '大刀斩3', 5, '技能描述', 0, '亚瑟王那样的大招', '10000', 10, '500', '目标：亚瑟王');
INSERT INTO `skill` (`id`, `name`, `level`, `description`, `type`, `effect`, `cost`, `duration`, `ranges`, `target`) VALUES (4, '大刀斩4', 5, '技能描述', 0, '亚瑟王那样的大招', '10000', 10, '500', '目标：亚瑟王');
INSERT INTO `skill` (`id`, `name`, `level`, `description`, `type`, `effect`, `cost`, `duration`, `ranges`, `target`) VALUES (5, '大刀斩1', 5, '技能描述', 0, '亚瑟王那样的大招', '10000', 10, '500', '目标：亚瑟王');
INSERT INTO `skill` (`id`, `name`, `level`, `description`, `type`, `effect`, `cost`, `duration`, `ranges`, `target`) VALUES (6, '大刀斩2', 5, '技能描述', 0, '亚瑟王那样的大招', '10000', 10, '500', '目标：亚瑟王');
INSERT INTO `skill` (`id`, `name`, `level`, `description`, `type`, `effect`, `cost`, `duration`, `ranges`, `target`) VALUES (7, '大刀斩3', 5, '技能描述', 0, '亚瑟王那样的大招', '10000', 10, '500', '目标：亚瑟王');
INSERT INTO `skill` (`id`, `name`, `level`, `description`, `type`, `effect`, `cost`, `duration`, `ranges`, `target`) VALUES (8, '大刀斩4', 5, '技能描述', 0, '亚瑟王那样的大招', '10000', 10, '500', '目标：亚瑟王');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `dictType` varchar(100) NOT NULL,
  `label` varchar(100) DEFAULT NULL COMMENT '字典名称',
  `value` varchar(100) DEFAULT NULL,
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `createBy` varchar(64) DEFAULT '' COMMENT '创建者',
  `createTime` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(100) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `sort` bigint(100) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT KEY `remark` (`remark`),
  FULLTEXT KEY `remark_2` (`remark`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` (`id`, `pid`, `dictType`, `label`, `value`, `status`, `createBy`, `createTime`, `updateTime`, `remark`, `sort`) VALUES (2, 109, 'user_sex', '男', '1', '0', 'admin', '2024-03-27 00:00:00', '2024-03-27 00:00:00', '性别-男', 1);
INSERT INTO `sys_dict` (`id`, `pid`, `dictType`, `label`, `value`, `status`, `createBy`, `createTime`, `updateTime`, `remark`, `sort`) VALUES (3, 109, 'user_sex', '女', '2', '0', 'admin', '2024-03-27 00:00:00', '2024-03-27 00:00:00', '性别-女', 2);
INSERT INTO `sys_dict` (`id`, `pid`, `dictType`, `label`, `value`, `status`, `createBy`, `createTime`, `updateTime`, `remark`, `sort`) VALUES (4, 0, 'favors_time', '来往时间点', '', '0', 'admin', '2024-03-28 00:00:00', '1712647381166', '人情来往时间点', 2);
INSERT INTO `sys_dict` (`id`, `pid`, `dictType`, `label`, `value`, `status`, `createBy`, `createTime`, `updateTime`, `remark`, `sort`) VALUES (5, 4, 'favors_time', '三哥结婚', '1', '0', 'admin', '2024-03-28 00:00:00', '2024-03-28 00:00:00', '三哥结婚', 1);
INSERT INTO `sys_dict` (`id`, `pid`, `dictType`, `label`, `value`, `status`, `createBy`, `createTime`, `updateTime`, `remark`, `sort`) VALUES (6, 4, 'favors_time', '老爸', '2', '0', 'admin', '2024-03-28 00:00:00', '2024-03-28 00:00:00', '老爸', 2);
INSERT INTO `sys_dict` (`id`, `pid`, `dictType`, `label`, `value`, `status`, `createBy`, `createTime`, `updateTime`, `remark`, `sort`) VALUES (7, 4, 'favors_time', '奶奶', '3', '0', 'admin', '2024-03-28 00:00:00', '2024-03-28 00:00:00', '奶奶去世', 3);
INSERT INTO `sys_dict` (`id`, `pid`, `dictType`, `label`, `value`, `status`, `createBy`, `createTime`, `updateTime`, `remark`, `sort`) VALUES (102, 109, 'user_sex', '不愿透露', '3', '0', '', '1712483722956', NULL, '其他', 3);
INSERT INTO `sys_dict` (`id`, `pid`, `dictType`, `label`, `value`, `status`, `createBy`, `createTime`, `updateTime`, `remark`, `sort`) VALUES (109, 0, 'user_sex', '性别', '', '0', '', '1712645476437', '1713838926530', '性别', 1);
INSERT INTO `sys_dict` (`id`, `pid`, `dictType`, `label`, `value`, `status`, `createBy`, `createTime`, `updateTime`, `remark`, `sort`) VALUES (117, 4, 'favors_time', '其他', '4', '0', '', '1713143635220', '1713838912243', '测试专用', 4);
INSERT INTO `sys_dict` (`id`, `pid`, `dictType`, `label`, `value`, `status`, `createBy`, `createTime`, `updateTime`, `remark`, `sort`) VALUES (118, 0, 'wages_source', '就职于', '', '0', '', '1718593619032', '1718695023244', '工资来源企业', 3);
INSERT INTO `sys_dict` (`id`, `pid`, `dictType`, `label`, `value`, `status`, `createBy`, `createTime`, `updateTime`, `remark`, `sort`) VALUES (119, 118, 'wages_source', '云诺', '2', '0', '', '1718593686662', '1718695048020', '浙江云诺通信科技', 2);
INSERT INTO `sys_dict` (`id`, `pid`, `dictType`, `label`, `value`, `status`, `createBy`, `createTime`, `updateTime`, `remark`, `sort`) VALUES (120, 118, 'wages_source', '朔昂', '3', '0', '', '1718593754941', '1718695056650', '浙江朔昂科技', 3);
INSERT INTO `sys_dict` (`id`, `pid`, `dictType`, `label`, `value`, `status`, `createBy`, `createTime`, `updateTime`, `remark`, `sort`) VALUES (121, 118, 'wages_source', '深能', '1', '0', '', '1718593789423', '1718695034368', '重庆深能科技', 1);
INSERT INTO `sys_dict` (`id`, `pid`, `dictType`, `label`, `value`, `status`, `createBy`, `createTime`, `updateTime`, `remark`, `sort`) VALUES (122, 118, 'wages_source', '其它', '4', '0', '', '1719142116917', NULL, '测试', 4);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `menu_sort` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（1显示 0隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（1正常 0停用）',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2019 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'PC端', 0, 1, '', NULL, '', 'M', '1', '1', 'icon-PC', 'admin', '2024-03-24 13:35:37', '', NULL, 'pc端目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '移动端', 0, 2, '/m', NULL, '', 'M', '1', '1', 'icon-huaweishouji', 'admin', '2024-03-24 13:35:37', '', NULL, '移动端菜单目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2000, '人情来往', 1, 2, '/favors', '/favorsRecord/index', '', 'C', '1', '1', 'icon-renqing', '', '2024-05-31 17:16:17', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2002, '系统管理', 1, 11, '/system', '/system/index', '', 'M', '1', '1', 'icon-shezhi', '', '2024-06-17 10:37:09', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2003, '用户管理', 2002, 1, '/system/user', '/system/user/index', '', 'C', '1', '1', 'icon-yonghu', '', '2024-05-31 17:16:51', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2004, '菜单管理', 2002, 3, '/system/menu', '/system/menu/index', '', 'C', '1', '1', 'icon-caidan1', '', '2024-06-04 09:29:46', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2005, '首页', 1, 1, '/index', '/baseView/index', '', 'C', '1', '1', 'icon-home', '', '2024-06-17 11:25:16', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2006, '角色管理', 2002, 2, '/system/role', '/system/role/index', '', 'C', '1', '1', 'icon-usersss', '', '2024-06-17 11:25:04', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2007, '字典管理', 2002, 0, '/system/dict', '/system/dict/index', '', 'C', '1', '1', 'icon-shujuzidian', '', '2024-06-17 11:24:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2008, '小技巧', 1, 10, '/skill', '/skill/index', '', 'M', '1', '1', 'icon-xiaojiqiao', '', '2024-06-17 10:37:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2009, 'Editor', 2008, 1, '/skill/editor', '/skill/Editor/index', '', 'C', '1', '1', 'icon-fuwenbenkuang', '', '2024-06-03 11:06:38', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2010, '自定义DIalog', 2008, 2, '/skill/dialog', '/skill/Dialog/index', '', 'C', '1', '1', 'icon-dialog', '', '2024-06-03 11:06:46', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2011, 'Script', 2008, 3, '/skill/script', '/skill/Script/index', '', 'C', '1', '1', 'icon-code', '', '2024-06-03 11:07:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2012, 'Base64', 2008, 4, '/skill/base64', '/skill/Base64/index', '', 'C', '1', '1', 'icon-tupian', '', '2024-06-03 11:07:14', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2013, 'Vueuse', 2008, 5, '/skill/vueuse', '/skill/Vueuse/index', '', 'C', '1', '1', 'icon-vueuse', '', '2024-06-03 11:07:23', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2014, 'Router', 2008, 6, '/skill/router', '/skill/Router/index', '', 'C', '1', '1', 'icon-router', '', '2024-06-03 11:07:33', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2015, 'Charts', 2008, 7, '/skill/charts', '/skill/Charts/index', '', 'C', '1', '1', 'icon-echarts-bar', '', '2024-06-03 11:07:42', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2016, 'FontFamily', 2008, 8, '/skill/font', '/skill/FontFamily/index', '', 'C', '1', '1', 'icon-tianmao26geyingwenziti', '', '2024-06-04 09:30:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2017, '收入记录', 1, 3, '/wages', '/wages/index', '', 'C', '1', '1', 'icon-qitashouru', '', '2024-06-18 00:04:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `menu_sort`, `path`, `component`, `query`, `menu_type`, `visible`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2018, '技能管理(导入/导出)', 1, 4, '/import-export', '/importExport/index', '', 'C', '1', '1', 'icon-shujudaoru', '', '2024-06-26 18:24:09', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `menu_ids` varchar(255) NOT NULL COMMENT '角色关联的菜单',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `menu_ids`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '超级管理员', 'admin', 1, '', '1', 1, 1, '0', '0', 'admin', '2024-03-24 13:35:37', '', NULL, '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `menu_ids`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '普通用户', 'common', 2, '2005,2000,2007', '2', 1, 1, '0', '0', 'admin', '2024-03-24 13:35:37', '', '2024-05-30 21:15:58', '普通角色');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `menu_ids`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, '无权限', 'empty', 3, '', '1', 1, 1, '0', '0', '', '2024-05-30 22:04:44', '', '2024-05-31 17:38:06', '无权限角色');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `menu_ids`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, '人情薄', 'favor', 4, '2005,2000,2007', '1', 1, 1, '0', '0', '', '2024-05-31 22:25:48', '', '2024-06-27 16:26:50', '人情薄使用者的角色');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `menu_ids`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, '访客', 'snow', 5, '1,2005,2000,2017,2018,2008,2009,2010,2011,2012,2013,2014,2015,2016,2002,2007,2003,2006,2004', '1', 1, 1, '0', '0', '', '2024-06-27 16:10:16', '', '2024-06-27 17:57:05', '访客');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `role` int(100) NOT NULL DEFAULT '1',
  `role_key` varchar(100) NOT NULL COMMENT '角色key',
  `role_str` varchar(100) NOT NULL COMMENT '角色名称',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `app_config` varchar(10000) NOT NULL COMMENT '项目配置（主题颜色等）',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `role`, `role_key`, `role_str`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `app_config`) VALUES (1, 103, 'admin', 'admin', '00', 1, 'admin', '超级管理员', 'admin_@163.com', '15888888888', '1', '/imgs/avatars/avatar_20240620112452.png', 'kn78X2wnMbK/+yKBFV5AEPgD+B4WJplUrxp4sEBpAOK5Fjm9ZZNaV1CjiSbpiArxJ9WYPVx72iJLM756kFsPPg==', '0', '0', '127.0.0.1', '2024-03-24 13:35:37', 'admin', '2024-03-24 13:35:37', '', '2024-06-21 09:59:16', '管理员', '{\"dialogOrDrawer\":\"drawer\",\"themeColor\":\"#01BDF1\",\"isCrumb\":false,\"isFooter\":false,\"isShowLayoutTime\":true}');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `role`, `role_key`, `role_str`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `app_config`) VALUES (2, NULL, 'snows_l', '罗姗姗', '00', 1, 'admin', '超级管理员', 'snows_l@163.com', '15240861635', '1', '/imgs/avatars/avatar_20240618161747.png', 'ggfW7a6JwSUKo4n3xCH/gKf3MONAZ4r+RAaWxjuiU/YQdwh6MRzKyJjEpdc4ChMzLuZZaK1JN8An6OvTMEzk0A==', '0', '0', '', NULL, '', NULL, '', '2024-05-31 21:16:26', NULL, '{\"dialogOrDrawer\":\"drawer\",\"themeColor\":\"#12E9DB\",\"isCrumb\":true,\"isFooter\":true,\"isShowLayoutTime\":true}');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `role`, `role_key`, `role_str`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `app_config`) VALUES (129, NULL, 'eternals_l', 'eternals_l', '00', 2, 'common', '普通用户', '', '', '1', '', 'HXHVvyLJjNq0XaK2WfAcIIkTrJGXu70b9WoyzIVHuxMWADXy5ftfjMA40UwbYoBaJRB8AHy+Gn+Go8UpivLAiw==', '0', '0', '', NULL, '', NULL, '', '2024-04-19 11:01:14', NULL, '');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `role`, `role_key`, `role_str`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `app_config`) VALUES (138, NULL, 'empty', '没有权限', '00', 103, '', '', '', '', '1', '', 'boL+ydafh0ZbxTFKok/cf2wR6/AMcd2b3H8c4bpMVAeSge/tMrlFluNJ6NpTXi5V/lBmBT8HAeajUlazDvoP6Q==', '0', '0', '', NULL, '', '2024-05-31 11:05:33', '', NULL, NULL, '');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `role`, `role_key`, `role_str`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `app_config`) VALUES (149, NULL, 'snow', '访客', '00', 105, 'snow', '', '', '', '2', '', 'dBbnq6edlX/eSRuLhAOVMoegzOUd8icitKPl225iZFG38COvRiNq2rrFZ4zR0eGNJBDZCpC22XDR7nsc6KHIkw==', '0', '0', '', NULL, '', '2024-06-27 16:09:34', '', '2024-06-27 16:49:27', NULL, '');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `role`, `role_key`, `role_str`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `app_config`) VALUES (150, NULL, 'favor', '人情访客', '00', 104, 'common', '', '', '', '1', '', 'caFc3qJNASIW32cOXGUUgRRT+614eRMuqmYF+yArDFsCTuS3HQiASbMo7UFnnQp8LFVniD0PEh6tFJLs057/MA==', '0', '0', '', NULL, '', '2024-06-27 16:52:19', '', NULL, NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for wages
-- ----------------------------
DROP TABLE IF EXISTS `wages`;
CREATE TABLE `wages` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `money` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `source` varchar(100) NOT NULL COMMENT '收入来源企业',
  `del_flag` int(2) NOT NULL DEFAULT '0' COMMENT '删除标识（1:删除，0:没删除）',
  `create_time` varchar(100) NOT NULL,
  `remark` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wages
-- ----------------------------
BEGIN;
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (3, '2020/11 工资明细', '4660.22', '2020-11-15', '/imgs/wages/wages_202011_20240617201345.jpeg', '1', 0, '2024-06-17 20:17:43.836', '2020/11 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (4, '2020/12 工资明细', '5600.00', '2020-12-15', '/imgs/wages/wages_202012_20240617202856.jpeg', '1', 0, '2024-06-17 20:29:48.240', '2020/12 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (5, '2021/01 工资明细', '5117.24', '2021-01-15', '/imgs/wages/wages_202101_20240617203035.jpeg', '1', 0, '2024-06-17 20:31:01.274', '2021/01 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (6, '2021/02 工资明细', '6887.35', '2021-02-15', '/imgs/wages/wages_202102_20240617232256.jpeg', '1', 0, '2024-06-17 23:23:29.672', '2021/02 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (7, '2021/03 工资明细', '6082.27', '2021-03-15', '/imgs/wages/wages_202103_20240617232351.jpeg', '1', 0, '2024-06-17 23:24:25.215', '2021/03 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (8, '2021/04 工资明细', '6558.98', '2021-04-15', '/imgs/wages/wages_202104_20240617232437.jpeg', '1', 0, '2024-06-17 23:24:58.806', '2021/04 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (9, '2021/05 工资明细', '6927.29', '2021-05-15', '/imgs/wages/wages_202105_20240617232513.jpeg', '1', 0, '2024-06-17 23:25:38.706', '2021/05 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (10, '2021/06 工资明细', '6803.44', '2021-06-15', '/imgs/wages/wages_202106_20240617232554.jpeg', '1', 0, '2024-06-17 23:26:30.091', '2021/06 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (11, '2021/07 工资明细', '6753.44', '2021-07-15', '/imgs/wages/wages_202107_20240617232642.jpeg', '1', 0, '2024-06-17 23:27:13.405', '2021/07 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (12, '2021/08 工资明细', '6778.44', '2021-08-15', '/imgs/wages/wages_202108_20240617232733.jpeg', '1', 0, '2024-06-17 23:27:53.821', '2021/08 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (13, '2021/09 工资明细', '7053.44', '2021-09-15', '/imgs/wages/wages_202109_20240617232810.jpeg', '1', 0, '2024-06-17 23:28:30.325', '2021/09 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (14, '2021/10 工资明细', '6853.44', '2021-10-15', '/imgs/wages/wages_202110_20240617232835.jpeg', '1', 0, '2024-06-17 23:29:06.507', '2021/10 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (15, '2021/11 工资明细', '6853.44', '2021-11-15', '/imgs/wages/wages_202110_20240617232927.jpeg', '1', 0, '2024-06-17 23:29:46.643', '2021/11 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (16, '2021/12 工资明细', '6417.36', '2021-12-15', '/imgs/wages/wages_202112_20240617233001.jpeg', '1', 0, '2024-06-17 23:30:29.109', '2021/12 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (17, '2022/01 工资明细', '6410.88', '2022-01-15', '/imgs/wages/wages_202201_20240617233121.jpeg', '1', 0, '2024-06-17 23:31:51.052', '2022/01 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (18, '2022/02 工资明细', '6213.20', '2022-02-15', '/imgs/wages/wages_202202_20240617233206.jpeg', '1', 0, '2024-06-17 23:32:30.790', '2022/02 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (19, '2022/03 工资明细', '451.65', '2022-03-14', '/imgs/wages/wages_202203_01_20240617233236.jpeg', '1', 0, '2024-06-17 23:33:10.524', '2022/03 工资明细（重庆深能）');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (20, '2022/03 工资明细', '4929.57', '2022-03-15', '/imgs/wages/wages_202203_02_20240617233320.jpeg', '2', 0, '2024-06-17 23:33:57.741', '2022/03 工资明细（浙江云诺）');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (21, '2022/04 工资明细', '10937.69', '2022-04-15', '/imgs/wages/wages_202204_20240617233507.jpeg', '2', 0, '2024-06-17 23:35:31.422', '2022/04 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (22, '2022/05 工资明细', '11737.29', '2022-05-15', '/imgs/wages/wages_202205_20240617233550.jpeg', '2', 0, '2024-06-17 23:36:13.455', '2022/05 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (23, '2022/06 工资明细', '13461.80', '2022-06-15', '/imgs/wages/wages_202206_20240617233621.jpeg', '2', 0, '2024-06-17 23:36:46.392', '2022/06 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (24, '2022/07 工资明细', '13199.91', '2022-07-15', '/imgs/wages/wages_202207_20240617233701.jpeg', '2', 0, '2024-06-17 23:37:16.324', '');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (25, '2022/08 工资明细', '13458.79', '2022-08-15', '/imgs/wages/wages_202208_20240617233727.jpeg', '2', 0, '2024-06-17 23:37:45.093', '2022/08 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (26, '2022/09 工资明细', '13303.11', '2022-09-15', '/imgs/wages/wages_202209_20240617233801.jpeg', '2', 0, '2024-06-17 23:38:21.729', '2022/09 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (27, '2022/10 工资明细', '13129.04', '2022-10-15', '/imgs/wages/wages_202210_20240617233835.jpeg', '2', 0, '2024-06-17 23:38:55.193', '2022/10 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (28, '2022/11 工资明细', '12794.16', '2022-11-15', '/imgs/wages/wages_202211_20240617233908.jpeg', '2', 0, '2024-06-17 23:39:31.493', '2022/11 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (29, '2022/12 工资明细', '13161.10', '2022-12-15', '/imgs/wages/wages_202212_20240617233943.jpeg', '2', 0, '2024-06-17 23:40:08.034', '2022/12 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (30, '2023/01 工资明细', '13251.11', '2023-01-15', '/imgs/wages/wages_202301_20240617234025.jpeg', '2', 0, '2024-06-17 23:40:42.135', '2023/01 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (31, '2023/02 工资明细', '13400.10', '2023-02-15', '/imgs/wages/wages_202302_20240617234054.jpeg', '2', 0, '2024-06-17 23:41:08.267', '2023/02 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (32, '2023/03 工资明细', '14954.72', '2023-03-15', '/imgs/wages/wages_202303_20240617234119.jpeg', '2', 0, '2024-06-17 23:41:37.776', '2023/03 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (33, '2023/04 工资明细', '14401.94', '2023-04-15', '/imgs/wages/wages_202304_20240617234149.jpeg', '2', 0, '2024-06-17 23:42:14.878', '2023/04 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (34, '2023/05 工资明细', '13904.16', '2023-05-15', '/imgs/wages/wages_202305_20240617234230.jpeg', '2', 0, '2024-06-17 23:42:55.286', '2023/05 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (35, '2022 年终奖', '10752.38', '2022-12-15', '/imgs/wages/wages_2023_20240617234312.jpeg', '2', 0, '2024-06-17 23:43:55.409', '2022 年终奖（云诺）');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (36, '2023 离职补偿金', '36958.51', '2023-05-15', '/imgs/wages/wages_2023_20240617234409.jpeg', '2', 0, '2024-06-17 23:44:54.328', '2023 离职补偿金 （云诺）');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (37, '2023/09 工资明细', '3737.45', '2023-09-15', '/imgs/wages/wages_202309_20240617234609.jpeg', '3', 0, '2024-06-17 23:46:38.451', '2023/09 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (38, '2024/03 工资明细', '14219.07', '2024-03-15', '/imgs/wages/wages_202310_20240617234657.jpeg', '3', 0, '2024-06-17 23:47:16.695', '2024/03 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (39, '2023/11 工资明细', '14168.50', '2023-11-15', '/imgs/wages/wages_202311_20240617235050.jpeg', '3', 0, '2024-06-17 23:51:14.325', '2023/11 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (40, '2023/12 工资明细', '14371.97', '2023-12-15', '/imgs/wages/wages_202312_20240617235130.jpeg', '3', 0, '2024-06-17 23:51:56.485', '2023/12 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (41, '2024/01 工资明细', '14496.86', '2024-01-15', '/imgs/wages/wages_202401_20240617235214.jpeg', '3', 0, '2024-06-17 23:52:35.410', '2024/01 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (42, '2024/02 工资明细', '14530.02', '2024-02-15', '/imgs/wages/wages_202402_20240617235248.jpeg', '3', 0, '2024-06-17 23:53:09.879', '2024/02 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (43, '2024/04 工资明细', '15398.05', '2024-04-15', '/imgs/wages/wages_202404_20240617235423.jpeg', '3', 0, '2024-06-17 23:54:44.361', '2024/04 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (44, '2024/05 工资明细', '13858.29', '2024-05-15 13:06:24', '/imgs/wages/wages_202405_20240617235455.jpeg', '3', 0, '2024-06-17 23:55:11.245', '2024/05 工资明细');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (48, '测试数据', '0', '2024-06-15 18:06:04', '/imgs/wages/wages_-1 (1)2024062616444120240626164441.png', '4', 1, '2024-06-26 16:44:47.289', '测试数据');
INSERT INTO `wages` (`id`, `title`, `money`, `date`, `pic`, `source`, `del_flag`, `create_time`, `remark`) VALUES (49, '1', '0', '2024-06-15 18:06:44', '/imgs/wages/wages_-120240627180739.png', '4', 0, '2024-06-27 18:07:44.851', '');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
