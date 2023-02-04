/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : bookapi

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 03/02/2023 01:20:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` datetime NOT NULL,
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages` int(11) NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (2, '99999999', 'Practical Modern JavaScript', 'Dive into ES6 and the Future of JavaScript', 'Nicolás Bevacqua', '2017-07-16 00:00:00', 'O\'Reilly Media', 334, 'To get the most out of modern JavaScript, you need learn the latest features of its parent specification, ECMAScript 6 (ES6). This book provides a highly practical look at ES6, without getting lost in the specification or its implementation details.', 'https://github.com/mjavascript/practical-modern-javascript', '2023-02-02 14:48:48', '2023-02-02 14:48:48');
INSERT INTO `books` VALUES (3, '9781491943533', 'Practical Modern JavaScript', 'Dive into ES6 and the Future of JavaScript', 'Nicolás Bevacqua', '2017-07-16 00:00:00', 'O\'Reilly Media', 334, 'To get the most out of modern JavaScript, you need learn the latest features of its parent specification, ECMAScript 6 (ES6). This book provides a highly practical look at ES6, without getting lost in the specification or its implementation details.', 'https://github.com/mjavascript/practical-modern-javascript', '2023-02-02 14:48:54', '2023-02-02 14:48:54');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2023_02_02_092423_create_books_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Mark', 'mark@gmail.com', NULL, '$2y$10$IWKxQFOts8isKc3txRtNkO8kVb75/mZmmq08ws9jI.nZS61SFYDQG', NULL, '2023-02-02 16:50:52', '2023-02-02 16:50:52');
INSERT INTO `users` VALUES (2, 'ppo', 'orang12323@gmail.com', NULL, '$2y$10$ttNbVQtfOCHky..8ChW0HOgmOgyySRUa4o9FonA2qGjZaTE6zxvhq', NULL, '2023-02-02 17:00:59', '2023-02-02 17:00:59');
INSERT INTO `users` VALUES (3, 'dewasembiring', 'dewa@gmail.com', NULL, '$2y$10$grvB/hRstfDaUGYZ192efeovQx7epXdFNG8LCoNQEPXIumEKqF9CC', NULL, '2023-02-02 17:31:12', '2023-02-02 17:31:12');
INSERT INTO `users` VALUES (4, 'andre', 'andre@gmail.com', NULL, '$2y$10$29QrZ.GJbFU5N97kY0CB1.MbLvqU4syDisA3qe9LtS8zom7Ofr4IG', NULL, '2023-02-02 17:34:28', '2023-02-02 17:34:28');
INSERT INTO `users` VALUES (5, 'ererk', 'oekroe@g', NULL, '$2y$10$K7XRboj/LX/QXHpb2gArfeLemmeaZUTGPN3N9uYK2mtvERVrQsgJS', NULL, '2023-02-02 17:40:57', '2023-02-02 17:40:57');
INSERT INTO `users` VALUES (6, 'havel', 'havel@gmail.com', NULL, '$2y$10$7iv8.qjWwcFE/n8ng5S1gOK73Ia700CDPrb5WgBmPBSjbfMc6flXa', NULL, '2023-02-02 17:41:38', '2023-02-02 17:41:38');
INSERT INTO `users` VALUES (7, 'wqeq', 'sdksod@g', NULL, '$2y$10$cTUxET6J.X6oBqNOmOe2f.7ATPSUto8cJ60oiTjNNVhlz0Lp4U/A6', NULL, '2023-02-02 17:44:52', '2023-02-02 17:44:52');
INSERT INTO `users` VALUES (8, 'soadasok', 'oekfoe@dok', NULL, '$2y$10$8Df.XzQTzSW0yrxFoqI/ROg/gD8xviGmfR.x4J9BsSR52jCLABpKO', NULL, '2023-02-02 17:45:33', '2023-02-02 17:45:33');
INSERT INTO `users` VALUES (9, 'sadsao', 'okeof@gmail.com', NULL, '$2y$10$x2LVL2Mwc5rL1rO.ttcoI.ECCx3c.Eicw.QeFKRHZR4cFc596N6Va', NULL, '2023-02-02 17:46:47', '2023-02-02 17:46:47');
INSERT INTO `users` VALUES (10, 'ekafoeaeo', 'oekoe@gmail', NULL, '$2y$10$TTuECPwAExJwpi7xTZJcLO08dSOJPIKRr0nnJp0/ugC.OGy69.YZm', NULL, '2023-02-02 17:47:39', '2023-02-02 17:47:39');
INSERT INTO `users` VALUES (11, 'anto', 'anto@gmail.com', NULL, '$2y$10$Xed9FRmVTm7rPae8AkqXf.amLKUmZTWj5ykOuBl/mmoAqJtCrzhY6', NULL, '2023-02-02 17:51:28', '2023-02-02 17:51:28');
INSERT INTO `users` VALUES (12, 'aww', 'aww@gmail.com', NULL, '$2y$10$RX7tZ41AvMMtRenzTwFhsu6SP5U4iCdLxxhvrB1HwendHsIsaC3iC', NULL, '2023-02-02 17:52:27', '2023-02-02 17:52:27');
INSERT INTO `users` VALUES (13, 'osdkos', 'osdko@gmail.com', NULL, '$2y$10$M6DSUYOqwA3D/SY1Zm8D7e5edwCUFahH9fRKpRyOlwmgov51JJNbe', NULL, '2023-02-02 17:52:40', '2023-02-02 17:52:40');
INSERT INTO `users` VALUES (14, 'orangsss', 'jeje@gmail.co', NULL, '$2y$10$dC6NvVTJxO013MBzWZ8bnea9BoplrRoorX09s86nRFOsFnRF9RgQO', NULL, '2023-02-02 17:57:53', '2023-02-02 17:57:53');
INSERT INTO `users` VALUES (15, 'kating', 'kating@gmail.com', NULL, '$2y$10$RDIlP5Q06KMjsAN8X1XM7O3fYUvBjKyzU3POK8GkVtV8AlaA64gqu', NULL, '2023-02-02 18:00:13', '2023-02-02 18:00:13');
INSERT INTO `users` VALUES (16, 'jojo', 'jojo@gmail.com', NULL, '$2y$10$11BPMSI2ztQMOGfQhPSG2.PlchgWuZy97J2/Ad4Nf7kD/W4Vb9uVK', NULL, '2023-02-02 18:01:43', '2023-02-02 18:01:43');
INSERT INTO `users` VALUES (17, 'orangorang', 'jajan@gmail.com', NULL, '$2y$10$CQrrTRrneUCl27vS1a97ROQmcnG.SJIzh4e1a8F9Eo/9Rs2clUQJK', NULL, '2023-02-02 18:12:40', '2023-02-02 18:12:40');

SET FOREIGN_KEY_CHECKS = 1;
