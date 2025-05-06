/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : localhost:3306
 Source Schema         : db_lg

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 06/05/2025 17:02:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'grading', '考核表', NULL, NULL, 'Grading', 'crud', '', 'com.ruoyi.system', 'system', 'grading', '考核', 'ruoyi', '0', '/', NULL, 'admin', '2025-04-18 03:24:58', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'grading_content', '考核内容值', NULL, NULL, 'GradingContent', 'crud', '', 'com.ruoyi.system', 'system', 'content', '考核内容值', 'ruoyi', '0', '/', NULL, 'admin', '2025-04-18 03:24:58', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'grading_content_rel', '评价内容表', NULL, NULL, 'GradingContentRel', 'crud', '', 'com.ruoyi.system', 'system', 'rel', '评价内容', 'ruoyi', '0', '/', NULL, 'admin', '2025-04-18 03:24:58', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'grading_template', '考核模板', NULL, NULL, 'GradingTemplate', 'crud', '', 'com.ruoyi.system', 'system', 'template', '考核模板', 'ruoyi', '0', '/', NULL, 'admin', '2025-04-18 03:24:58', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'grading_template_meta', '模板元数据', NULL, NULL, 'GradingTemplateMeta', 'crud', '', 'com.ruoyi.system', 'system', 'meta', '模板元数据', 'ruoyi', '0', '/', NULL, 'admin', '2025-04-18 03:24:58', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'questionnaire', '问卷信息', NULL, NULL, 'Questionnaire', 'crud', '', 'com.ruoyi.system', 'system', 'questionnaire', '问卷信息', 'ruoyi', '0', '/', NULL, 'admin', '2025-04-27 12:27:29', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'questionnaire_template', '问卷模版', NULL, NULL, 'QuestionnaireTemplate', 'crud', '', 'com.ruoyi.system', 'system', 'template', '问卷模版', 'ruoyi', '0', '/', NULL, 'admin', '2025-04-27 12:27:29', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, 1, 'user_id', '考核人Id', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, 1, 'grading_name', '考核表名称', 'varchar(50)', 'String', 'gradingName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, 1, 'grading_month', '考核月份', 'int(1)', 'Integer', 'gradingMonth', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, 1, 'grading_start_time', '考核开始时间', 'timestamp', 'Date', 'gradingStartTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, 1, 'grading_end_time', '考核结束时间', 'timestamp', 'Date', 'gradingEndTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, 1, 'status', '考核状态 0-已结束 1-考核中', 'int(1)', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, 2, 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, 2, 'template_meta_id', '元数据Id', 'bigint(20)', 'Long', 'templateMetaId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, 2, 'system_value', '系统模板参数 0-否 1-系统', 'int(1)', 'Integer', 'systemValue', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, 2, 'value', '内容', 'text', 'String', 'value', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, 2, 'row_id', '行号', 'int(1)', 'Integer', 'rowId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, 2, 'merge_column', '列合并', 'int(1)', 'Integer', 'mergeColumn', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, 2, 'row_column', '行合并', 'int(1)', 'Integer', 'rowColumn', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, 3, 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, 3, 'grading_id', '评价表Id', 'bigint(20)', 'Long', 'gradingId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, 3, 'content_id', '评价内容Id', 'bigint(20)', 'Long', 'contentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, 4, 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, 4, 'type', '模版类型', 'int(1)', 'Integer', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, 4, 'type_name', '模板名称', 'varchar(200)', 'String', 'typeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, 4, 'create_time', NULL, 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, 4, 'update_time', NULL, 'timestamp', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, 4, 'create_user', '创建人', 'bigint(20)', 'Long', 'createUser', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, 4, 'update_user', '更新人', 'bigint(20)', 'Long', 'updateUser', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, 5, 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, 5, 'template_id', '模板Id', 'bigint(20)', 'Long', 'templateId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, 5, 'code', '编码', 'varchar(50)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, 5, 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, 5, 'perm_valid', '是否校验权限', 'int(1)', 'Integer', 'permValid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (30, 5, 'right_code', '权限码', 'varchar(50)', 'String', 'rightCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, 5, 'sort', '排序', 'int(1)', 'Integer', 'sort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-04-18 03:24:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, 6, 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-27 12:27:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, 6, 'template_id', '模板Id', 'bigint(20)', 'Long', 'templateId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-04-27 12:27:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, 6, 'user_id', '评价人', 'bigint(20)', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-04-27 12:27:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, 6, 'value', '数据', 'varchar(500)', 'String', 'value', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2025-04-27 12:27:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, 6, 'crete_user_id', '创建人Id', 'bigint(20)', 'Long', 'creteUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-04-27 12:27:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, 6, 'update_user_id', '更新人Id', 'bigint(20)', 'Long', 'updateUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-04-27 12:27:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, 6, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-04-27 12:27:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, 6, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2025-04-27 12:27:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, 7, 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-27 12:27:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, 7, 'type', '模版ID', 'int(1)', 'Integer', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2025-04-27 12:27:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, 7, 'name', '模板名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-04-27 12:27:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, 7, 'value', '模板值，json对象', 'varchar(2000)', 'String', 'value', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2025-04-27 12:27:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, 7, 'status', '模版状态 0-停用 1-启用', 'int(1)', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2025-04-27 12:27:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, 7, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2025-04-27 12:27:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, 7, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-04-27 12:27:29', '', NULL);

-- ----------------------------
-- Table structure for grading
-- ----------------------------
DROP TABLE IF EXISTS `grading`;
CREATE TABLE `grading`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '考核人Id',
  `grading_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考核表名称',
  `grading_month` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考核月份',
  `grading_start_time` timestamp(0) NULL DEFAULT NULL COMMENT '考核开始时间',
  `grading_end_time` timestamp(0) NULL DEFAULT NULL COMMENT '考核结束时间',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '考核状态 0-已结束 1-考核中',
  `grading_type` int(1) NOT NULL DEFAULT 0 COMMENT '考核类型',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grading
-- ----------------------------
INSERT INTO `grading` VALUES (13, 2, '教师月绩效考核细则', '202504', '2025-04-01 00:00:00', '2025-04-30 23:59:59', 1, 0, '2025-04-25 21:16:48', '2025-04-25 21:16:48', 3, 3);
INSERT INTO `grading` VALUES (14, 4, '各类活动家长评价检核表', '202504', '2025-04-01 00:00:00', '2025-04-30 23:59:59', 1, 5, '2025-04-26 16:25:49', '2025-04-26 16:25:49', 1, 1);
INSERT INTO `grading` VALUES (15, 2, '各类活动家长评价检核表', '202504', '2025-04-01 00:00:00', '2025-04-30 23:59:59', 1, 5, '2025-04-26 16:33:34', '2025-04-26 16:33:34', 1, 1);
INSERT INTO `grading` VALUES (16, 2, '教师月绩效考核细则', '202505', '2025-05-01 00:00:00', '2025-05-31 23:59:59', 1, 0, '2025-05-05 20:12:12', '2025-05-05 20:12:12', 1, 1);
INSERT INTO `grading` VALUES (17, 3, '教师月绩效考核细则', '202505', '2025-05-01 00:00:00', '2025-05-31 23:59:59', 1, 0, '2025-05-05 20:12:22', '2025-05-05 20:12:22', 1, 1);
INSERT INTO `grading` VALUES (18, 4, '保育教师月绩效考核细则', '202505', '2025-05-01 00:00:00', '2025-05-31 23:59:59', 1, 1, '2025-05-05 20:12:58', '2025-05-05 20:12:58', 1, 1);

-- ----------------------------
-- Table structure for grading_content
-- ----------------------------
DROP TABLE IF EXISTS `grading_content`;
CREATE TABLE `grading_content`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_meta_id` bigint(20) NULL DEFAULT NULL COMMENT '元数据Id',
  `system_value` int(1) NOT NULL COMMENT '系统模板参数 0-否 1-系统',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `row_id` int(1) NOT NULL DEFAULT 1 COMMENT '行号',
  `merge_column` int(1) NULL DEFAULT NULL COMMENT '列合并',
  `merge_row` int(1) NULL DEFAULT NULL COMMENT '行合并',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1913539685308121820 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考核内容值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grading_content
-- ----------------------------
INSERT INTO `grading_content` VALUES (1, 1, 1, '师德师风和行为规范（30分）', 1, 0, 0);
INSERT INTO `grading_content` VALUES (2, 2, 1, '自觉遵守《中小学教师职业道德规范》《大足区教育系统规范教师从教行为规范》，爱岗敬业，遵纪守法，关爱幼儿，为人师表，自觉维护教师形象，无违反师德师风行为；尊重领导、服从安排、顾全大局；团结同事、乐于助人；尊重家长，尽力满足家长合理的要求。', 1, 0, 0);
INSERT INTO `grading_content` VALUES (3, 3, 1, '1.进园不按规定着装，披头散发，不按工作安排按时完成任务，经劝说仍不服从，并故意吵闹，一次扣5分；说话不注意场合，当着家长、幼儿、外人的面讲有损自己和幼儿园形象的话的,1次扣3分。\r\n2.搬弄是非，不团结同事，与园内同事或家长吵架，一次扣5分，打架斗殴一次扣20分，并承担医药费及一切经济损失；                                                                                                                                                                                                                                    3.有意见不正面提，故意顶撞、吵闹、恶语伤人，一次扣5分；对持不同意见的同事打击报复（在经济上、政治上造成严重后果）一次扣10分；                                                                                                                                                              4.尊重孩子，平等、公正的对待每一个孩子，做到爱心、耐心、细心，体罚或变相体罚幼儿，一次扣20分，因此给单位造成经济损失的，按全额给予赔偿，情节严重者扣50分并报相关部门按规定处理。                                                                                                                                                            5.当班期间打电话聊天、串岗、扎堆、闲聊，每次扣5分。                                                                                                                                                                                                                                                                                                          6.思想意识不健康，参与赌博或变相赌博、违规补课、收受家长钱财物、接受家长宴请等违反中央八项规定精神20个提醒事项的经查证属实每次扣20分；造成恶劣影响的扣除当月绩效考核奖，并追究相关责任。                                                                                                                                                                                          7.有意见按程序依次上报，不得参与集体上访、集体罢课、聚众闹事等违反师德师风的事件，否则发现一次扣30分，造成严重影响的，取消当月绩效考核，并追究相关责任。                                                                                                                                                                         8.无故不服从幼儿园管理者合理工作安排，辱骂、诽谤幼儿园管理者1次扣5分。\r\n9.班级保教人员闹不团结，相关责任方每次扣5分；因与班级保教人员沟通不到位，造成工作失误的，1次扣5分。', 1, 0, 0);
INSERT INTO `grading_content` VALUES (4, 1, 1, '教育教学（20分）', 2, 0, 0);
INSERT INTO `grading_content` VALUES (5, 2, 1, '认真撰写各类计划、总结、观察记录等；坚持科学保教理念，认真按计划组织活动，活动效果好；保教活动中无小学化倾向；按时保质保量完成各类活动、保教任务；认真做好家长工作，无家长上访；积极参加幼儿园的各项活动等，积极推动幼儿园发展。积极参加园内外学习和竞赛活动，按要求完成学习和竞赛任务，提升专业水平和完成学习提高。', 2, 0, 0);
INSERT INTO `grading_content` VALUES (6, 3, 1, '1.教师组织早操、户外体育活动时，器械未准备，活动无组织，未给幼儿隔背，未提醒幼儿增减衣服，未关注体弱幼儿一次扣4分。                                                                                                                             2.上交保教工作计划、总结、表册、活动图片等材料不按时每次扣2分，上交材料质量差（抄袭、下载、不符合班级情况），不合格每次扣1分（由保教组长检查评价）， 无故不交的扣10分。                                                                                                                                                                                  3.活动前无活动准备（无挂图、教具、不熟悉活动内容等），活动中未使用普通话，组织活动不按计划执行，一次扣3分。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  4.保证幼儿每天饮水量400-600ML，早操、户外活动后集中组织幼儿饮水。未组织幼儿2次集体饮水，未提醒随时饮水，未组织餐前洗手餐后散步或进餐午睡不安静、不文明，午睡未巡查，未记录，起床未整理检查幼儿着装，一次扣3分。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         5.每月不按时更换家园联系栏、主题墙每次扣5分；家园联系栏、主题墙质量差、不合格每次扣3分。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   6.坚持科学保教的认真撰写各类计划、总结、观察记录等；坚持科学保教理念，认真按计划组织活动，活动效果好；保教活动中无小学化倾向；按时保质保量完成各类活动、保教任务；认真做好家长工作，无家长上访；积极参加幼儿园的各项活动等，积极推动幼儿园发展。积极参加园内外学习和竞赛活动，按要求完成学习和竞赛任务，提升专业水平和完成学习提高。理念，无小学化、成人化的学习内容及教学形式，无单纯的拼音、识字、写字等内容，无布置书面家庭作业等现象，否则出现一种行为每次扣10分。\r\n7.准时参加教研活动，在规定的时间（提前请假除外）未到场者每次扣5分。                                                                                                                                                                       8.服从教研工作安排，在教研活动中轮流分享游戏或故事、积极上公开课、示范课，主动承担专题讲座、教研活动主持等，事后及时上交相关材料，不按时完成者每次扣10分，完成教研任务质量差、不合格者每次扣6分（由当天的参研领导评价）；                                                                                                                                                                                  9.服从幼儿园安排，积极参加外出学习，返园后认真汇报。不服从安排者每次扣10分，学习不认真，汇报质量差每次扣6分。', 2, 0, 0);
INSERT INTO `grading_content` VALUES (7, 1, 1, '安全稳定（20分）', 3, 0, 0);
INSERT INTO `grading_content` VALUES (8, 2, 1, '加强幼儿安全教育，积极服从幼儿园安全工作安排，完成安全工作，班级无安全事故记20分', 3, 0, 0);
INSERT INTO `grading_content` VALUES (9, 3, 1, '1.未按时按要求对幼儿进行安全教育，检查安全隐患，未完成各种安全记录每次扣2分，发现隐患未及时上报扣2分，造成严重后果取消当月月考核绩效和评优评先资格；                                                                                                                                                                                                                       2.未在规定的时间完成安全平台工作，每次扣3分，不按时上交安全资料、上传安全教育图片等每次扣2分；                                                                                3.上交安全资料、安全检查工作记录不符合要求，每次扣1分；                                                                                                                                                                                                                         4.出现抓伤、摔伤、碰伤等事故，如实上报并及时处理，家长满意未吵闹不扣分，如实上报但未处理或处理不当扣5分；如未上报，家长吵闹举报扣10分；                                                                                                                                                                                                  5.安全工作不服从安排每次扣5分。因迟到、早退、旷工造成的安全事故每次扣20分。缝针及以上，住院以下，如处理及时，家长满意，未产生200元以上报账费用不扣分；因责任人管理疏忽发生住院及以上重大事故扣30分；因上述原因发生重大事故或医疗费用超过1000元时，因此造成的一切经济损失由幼儿园承担50%、责任人共同承担50%。                                                                          \r\n6.大循环时产生的安全事故，如责任到位、保护措施得当、及时上报并处理、主动告知班级教师，不扣分，如不负责或保护措施不到位或未上报或未处理或未告知班教师，经查证属实按以上标准扣分；                                                                                                                                                                                                 7.入园时未坚持晨午检，未清点幼儿人数，没有相关记录每次扣1分；                                                                                                                                                                                                                           8.离园前对幼儿进行安全提醒，离园时指导家长有序接送幼儿，家长接送混乱，教师做与接送无关的事一次扣5分；未使用接送卡排队打卡接幼儿(个别家长无卡接幼儿需签字)和无人看管没家长接的幼儿，每次扣3分，出现幼儿接错或无人接私自离园每次扣10分，出现走失或被人贩子拐走等以上事故者，取消当月绩效，年度考核不合格，并依法追究相关责任；                                                                                                                                                                                                          9.做好财产安全，保管好幼儿园的公物，做到不遗失，不故意损坏。遗失每次扣2分，故意损坏扣10分，并按价赔偿；', 3, 0, 0);
INSERT INTO `grading_content` VALUES (10, 1, 1, '卫生保健疫情防控（10分）', 4, 0, 0);
INSERT INTO `grading_content` VALUES (11, 2, 1, '按时制定班级卫生保健计划，按要求上好健康教育课，认真落实晨（午）检工作，记。班级环境美观，无卫生死角。', 4, 0, 0);
INSERT INTO `grading_content` VALUES (12, 3, 1, '1.按要求上好健康课，否则一次扣3分；\r\n2.开学初，按要求收齐儿童预防免疫接种证，完善幼儿饮水、毛巾等各类标识，否则一次扣3分；\r\n3.认真严格落实晨（午）检工作，做好记录，发现有疑似传染病病症的幼儿要立即将其送回家进行隔离，并劝其到正规医院进行检查医治，如未及时隔离，一次扣5分；对因病缺课较多的幼儿应有健康跟踪记录，如无记录或记录不全每次扣2分；发现传染病如实上报，无瞒报、缓报、谎报疫情情况，否则一次扣5分；如因上报、隔离不及时而造成无法收拾的疫情扩散，将取消当月月考核。                                                                                                                        4.保持班级环境整洁美观，各类标识完备醒目，地面、墙面无乱写、乱画、乱贴现象，否则出现一例扣2分；                                                                                                                                                                                                   5.垃圾日产日清，无卫生死角，否则发现1次扣2分；                                                                                                                     6.重点区域、公共活动场所每日清扫，保持整洁，否则一次扣责任人2分；\r\n7.班级各类表册未按时如实填写扣1分。', 4, 0, 0);
INSERT INTO `grading_content` VALUES (13, 1, 1, '家长工作（10分）', 5, 0, 0);
INSERT INTO `grading_content` VALUES (14, 2, 1, '1.做好班级家长工作，与家长建立平等合作的伙伴关系。                                                                                                                                                                                                                                                                                                                                                    2.积极按幼儿园规定召开好班级家长会、做好家长助教、家长义工、家访工作、家长开放日等，并完成相关资料填写等工作。积极宣传资助政策、确保每一个适龄儿童不因贫困失学。', 5, 0, 0);
INSERT INTO `grading_content` VALUES (15, 3, 1, '1.按要求组织各种家长会、家长开放日，做到书面通知，家长到会登记，保证家长会质量，否则每次扣2分。                                                                                                                                                                                                                                                           2.主动与家长沟通，态度热情大方，定期家访，每期每个孩子至少家访1次，否则少一人次扣1分，以此类推；及时处理家长之间的纠纷，化解矛盾，幼儿在园发生事故时，积极主动与家长做好沟通解释工作，安抚家长情绪，如确遇无法沟通，无理取闹的家长应及时向园领导反映，争取支持，不与家长发生吵闹，否则每次扣5分；受到家长投诉，经查证属实1次扣5分；                                                                                                                                                                                                                                                                                      3.积极向家长提供科学育儿知识与指导，尽力满足家长的合理需求，无理拒绝家长关于孩子成长合理要求的，发现1次扣5分。                                                                                                                                                                                                              4.幼儿园每期末向家长发放满意度调查问卷，家长满意率低于90%的，扣5分，每低5个百分点增扣2分。   \r\n5.每学期初、放假前向家长发放资助宣传单，深入宣传学前教育资助政策，让家长明白清楚，并收集好宣传资料，包括影像资料，未做者一次扣2分。                                                                                                                                                                                                                                       6.认真收集符合条件的资助材料，严格审核，按规定程序上报，不得虚报、瞒报，否则一次扣2分；                                                                                                                                                                                                                                                   7.认真排查班级幼儿家庭情况，精准落实贫困幼儿，确保每一位真正贫困的幼儿正常入学，如因教师排查不力而导致幼儿未能得到资助的，扣除教师当月月绩效考核奖，因此带来恶劣影响的年度考核不合格；                                                                                                                                                               8.每期向幼儿进行感恩教育不少于2两次，做到有教案、有图片，否则少一次扣2分。', 5, 0, 0);
INSERT INTO `grading_content` VALUES (16, 1, 1, '出勤（10分）', 6, 0, 0);
INSERT INTO `grading_content` VALUES (17, 2, 1, '自觉遵守园规，坚持坐班制度，不迟到，不早退，不旷工，出全勤。', 6, 0, 0);
INSERT INTO `grading_content` VALUES (18, 3, 1, '1.所有请假均需提前书面请假，如遇突发疾病或事件不能书面请假的，需电话请假，事后补上假条；不请假一律按旷工记。                                                                                                           2.事假超过幼儿园规定一天扣10分；病假（需三甲医院、中医院出具证明）每期累计超过规定天数的，扣6分/天；参与培训无故缺席算旷工，旷工一天扣10分；婚假、丧假按上级文件规定执行。                                                                                                                                                                                                                3.迟到一次扣2分，迟到超过30分钟视为旷工半天扣分；早退按迟到标准处理。                                                                                                                            4.病事假及延长产假每月累计天数超过当月工作日一半以上的，不参加当月考核。                                                                                                                                                         5.教师参加学历提升学习，考试当天履行请假手续，但不计假。\r\n6.法定假日，放弃休息坚持到园上班的，视情况酌情加分 。', 6, 0, 0);
INSERT INTO `grading_content` VALUES (19, 10, 1, '师德师风（30分）', 1, 0, 0);
INSERT INTO `grading_content` VALUES (20, 11, 1, '1.尊重幼儿，正确引导；耐心、热心对待幼儿，不漠视、不讥讽挖苦幼儿；不体罚或变相体罚幼儿，发现一次扣20分。\n2.做到仪表整洁，举止文明。上班一律穿平底鞋，不穿拖鞋，头发不披肩，不戴饰物和耳环，按规定着工作服，不留长指甲，不涂指甲油。\n3.工作态度积极、上进，有团队精神和奉献精神；注意个人言谈举止，和教师、保育员愉快合作、和睦相处。说话不注意场合，当着家长、幼儿、外人的面讲有损自己和幼儿园形象的话的,1次扣3分。若发生吵架、以非法方式表达诉求、串联煽动闹事等违法师德师风行为，视情况扣分，情节严重的扣除当月考核奖，并按照幼儿园相关制度执行。\n4.认真履行岗位职责，服从工作安排、调配，不做与工作无关的事。上班时间玩手机、聊天、串班，一次扣2分。\n5.思想意识不健康，参与赌博或变相赌博、违规补课、收受家长钱财物、接受家长宴请等违反中央八项规定精神20个提醒事项的经查证属实每次扣20分；造成恶劣影响的扣除当月绩效考核奖，并追究相关责任。\n6.有意见按程序依次上报。不得参与集体上访、集体罢课、聚众闹事等违反师德师风的事件，否则发现一次扣30分，造成严重影响的，取消当月绩效考核，并追究相关责任。\n7.无故不服从幼儿园管理者合理工作安排1次扣2分；辱骂、诽谤幼儿园管理者1次扣5分。', 1, 0, 0);
INSERT INTO `grading_content` VALUES (21, 10, 1, '安全工作（20分）', 2, 0, 0);
INSERT INTO `grading_content` VALUES (22, 11, 1, '创设安全、合理、舒适的环境；细心看护每一个幼儿，及时发现幼儿身体、情绪上的异常，及时采取有针对性的措施；准时到岗，做好各种安全防护和活动前的准备工作；班级无安全事故发生。', 2, 0, 0);
INSERT INTO `grading_content` VALUES (23, 10, 1, '保教工作（15分）', 3, 0, 0);
INSERT INTO `grading_content` VALUES (24, 11, 1, '积极配合老师做好班级常规工作；规范填写班级相关表格，不出漏洞；协助管理好班级自然角内的动植物，合理摆放，定期浇水，保证植物的生长。教师组织班级活动时，积极协助老师准备材料，管理幼儿。', 3, 0, 0);
INSERT INTO `grading_content` VALUES (25, 10, 1, '家长工作（10分）', 4, 0, 0);
INSERT INTO `grading_content` VALUES (26, 11, 1, '协助班级日常的家长工作、对家长热情和蔼、有耐心，遇事主动与家长沟通，不与家长争吵。', 4, 0, 0);
INSERT INTO `grading_content` VALUES (27, 10, 1, '清洁卫生保健（15）', 5, 0, 0);
INSERT INTO `grading_content` VALUES (28, 11, 1, '班级各类物品保管到位，无损坏，物品收纳、摆放规范有序；卫生用品按要求存放，做到安全、无隐患；幼儿活动后的物品、衣物要及时摆放整齐；不得擅自将公用物品带回家或自己享用。对于特殊的幼儿，给予特殊的照顾，并协助保健医生做好体弱幼儿的观察与护理工作。随时保持活动室、走廊、卫生间地面整洁，无杂物积灰，无卫生死角；玩具柜、门窗、墙壁无积灰、无污痕；班内各类物品摆放整洁有序；卫生间内无污渍，无异味。做得不到位扣酌情扣分。按要求做好各项消毒工作，及时准确记录。行政值班人员进行日常抽检。开学初，按要求收齐儿童预防免疫接种证，完善幼儿饮水、毛巾等各类标识，否则一次扣3分；\n3.认真严格落实晨（午）检工作，做好记录，发现有疑似传染病病症的幼儿要立即将其送回家进行隔离，并劝其到正规医院进行检查医治，如未及时隔离，一次扣5分；对因病缺课较多的幼儿应有健康跟踪记录，如无记录或记录不全每次扣2分；发现传染病如实上报，无瞒报、缓报、谎报疫情情况，否则一次扣5分；如因上报、隔离不及时而造成无法收拾的疫情扩散，将取消当月月考核。                                                                                                                        4.保持班级环境整洁美观，各类标识完备醒目，地面、墙面无乱写、乱画、乱贴现象，否则出现一例扣2分；                                                                                                                                                                                                   5.垃圾日产日清，无卫生死角，否则发现1次扣2分；                                                                                                                     6.重点区域、公共活动场所每日清扫，保持整洁，否则一次扣责任人2分；\n7.班级各类表册未按时如实填写扣1分。', 5, 0, 0);
INSERT INTO `grading_content` VALUES (29, 10, 1, '出勤管理（10分）', 6, 0, 0);
INSERT INTO `grading_content` VALUES (30, 11, 1, '按时上下班，不迟到，不早退。迟到、早退一次扣2分，迟到30分钟之后按旷工半天计算，扣5分。当月有正规医院出具的病历请假的（超过幼儿园规定天数）一天扣6分、事假一天扣10分。学习培训无故缺席一次扣5分。', 6, 0, 0);
INSERT INTO `grading_content` VALUES (31, 18, 1, '师德师风（20分）', 1, 0, 1);
INSERT INTO `grading_content` VALUES (32, 18, 1, '师德师风（20分）', 2, 0, 1);
INSERT INTO `grading_content` VALUES (33, 18, 1, '岗位纪律（10分）', 3, 1, 0);
INSERT INTO `grading_content` VALUES (34, 18, 1, '安全工作（20分）', 4, 0, 0);
INSERT INTO `grading_content` VALUES (35, 18, 1, '服务质量（10分）', 5, 0, 0);
INSERT INTO `grading_content` VALUES (36, 18, 1, '清洁卫生（30分）', 6, 0, 1);
INSERT INTO `grading_content` VALUES (37, 18, 1, '清洁卫生（30分）', 7, 0, 1);
INSERT INTO `grading_content` VALUES (38, 18, 1, '清洁卫生（30分）', 8, 0, 1);
INSERT INTO `grading_content` VALUES (39, 18, 1, '清洁卫生（30分）', 9, 0, 1);
INSERT INTO `grading_content` VALUES (40, 18, 1, '出勤管理（10分）', 10, 0, 1);
INSERT INTO `grading_content` VALUES (41, 19, 1, '仪容仪表', 1, 0, 0);
INSERT INTO `grading_content` VALUES (42, 19, 1, '团队协作', 2, 0, 0);
INSERT INTO `grading_content` VALUES (43, 19, 1, '岗位纪律（10分）', 3, 1, 0);
INSERT INTO `grading_content` VALUES (44, 19, 1, '安全防范', 4, 0, 0);
INSERT INTO `grading_content` VALUES (45, 19, 1, '饭菜质量', 5, 0, 0);
INSERT INTO `grading_content` VALUES (46, 19, 1, '个人卫生', 6, 0, 0);
INSERT INTO `grading_content` VALUES (47, 19, 1, '物品管理', 7, 0, 0);
INSERT INTO `grading_content` VALUES (48, 19, 1, '环境整洁', 8, 0, 0);
INSERT INTO `grading_content` VALUES (49, 19, 1, '消毒工作', 9, 0, 0);
INSERT INTO `grading_content` VALUES (50, 19, 1, '出勤情况', 10, 0, 0);
INSERT INTO `grading_content` VALUES (51, 20, 1, '做到仪表整洁，举止文明。上班一律穿平底鞋，不穿拖鞋，按规定着工作服，不留长指甲，不涂指甲油。（10分）', 1, 0, 0);
INSERT INTO `grading_content` VALUES (52, 20, 1, '工作态度积极、上进，有团队精神和奉献精神；注意个人言谈举止，和同事及保育员愉快合作、和睦相处。同事之间不团结，吵架或有过激行为扣2分，以非法方式表达诉求、串联煽动闹事等违法师德师风行为，视情况扣分。（10分）', 2, 0, 0);
INSERT INTO `grading_content` VALUES (53, 20, 1, '认真履行岗位职责，服从工作安排、调配。上班不按规定穿工作服或不戴工作帽不戴口罩、非工作人员进入食室操作间不制止、不按时间出饭菜的（特殊情况除外），食品未按规定留样、或留样不及时，留样记录填写不完整，留样柜存放其他物品、下班未及时关水电气一次扣2分，私自藏匿食堂食品、或将食物、食材带出食堂、不配合学校相关部门检查、饭菜未煮熟煮透的一次扣5分。（10分）', 3, 0, 0);
INSERT INTO `grading_content` VALUES (54, 20, 1, '把好食材验收关、烹饪关。发现肉禽蛋蔬菜感官异常未及时报告、霉变、过期食品未按规定处理一次扣5分；未规范操作各类器具一次扣2分；（20分）', 4, 0, 0);
INSERT INTO `grading_content` VALUES (55, 20, 1, '菜的油、盐超常规的，提醒一次不改进的一次、教职工普遍反映色香味存在问题、饭菜中有异物的扣2分。不服从工作安排(含未按规定加工、烹调等)一次扣5分（10分）', 5, 0, 0);
INSERT INTO `grading_content` VALUES (56, 20, 1, '个人着装干净、整洁。工作服及围裙太脏未及时换洗一次扣2分。（5分）', 6, 0, 0);
INSERT INTO `grading_content` VALUES (57, 20, 1, '冰箱内生、熟食品混放、未定期除霜、各操作间物品摆放不规范、库房未按规定存放物品或库房不按标识摆放物品一次扣2分。（10分）', 7, 0, 0);
INSERT INTO `grading_content` VALUES (58, 20, 1, '各操作间卫生打扫不彻底、锅灶、案板、洗刷池、地面、下水道口、留样柜 、冰柜、餐用具、切肉机、切菜机、食堂周围等未清理干净、垃圾桶有污垢，一次扣2分。（10分）', 8, 0, 0);
INSERT INTO `grading_content` VALUES (59, 20, 1, '按要求做好各项餐具餐盘消毒工作，及时准确记录。（5分）', 9, 0, 0);
INSERT INTO `grading_content` VALUES (60, 20, 1, '按时上下班，不迟到，不早退。迟到、早退一次扣2分，旷工一天扣除全月考核奖。当月有请病假0.2分、事假扣0.5分。学习培训无故缺席一次扣1分，请假0.2分。（10分）', 10, 0, 0);
INSERT INTO `grading_content` VALUES (61, 27, 1, '服从管理（20）', 1, 0, 0);
INSERT INTO `grading_content` VALUES (62, 27, 1, '遵守规章制度（20）', 2, 0, 0);
INSERT INTO `grading_content` VALUES (63, 27, 1, '仪容仪表（20）', 3, 0, 0);
INSERT INTO `grading_content` VALUES (64, 27, 1, '履行职责（40）', 4, 0, 0);
INSERT INTO `grading_content` VALUES (65, 28, 1, '服从幼儿园的管理，与教职工、幼儿、家长和谐相处，不得做出损坏幼儿园形象、利益的事情。', 1, 0, 0);
INSERT INTO `grading_content` VALUES (66, 28, 1, '遵守幼儿因规定的作息时间及各项规章制度。不迟到、早退、脱岗、离岗；上班期间做到在岗在位在状态，不得饮酒、娱乐、玩手机、吸烟、吃东西，不做与工作无关的事情。\n保安人员每月可换班两次，需上报安稳办主任及执行园长。', 2, 0, 0);
INSERT INTO `grading_content` VALUES (67, 28, 1, '按规定穿戴整齐当季服装，保持服装干净整洁，并佩戴保安标志和相关保安器械。站姿规范，精神抖擞；与人交谈，有礼有节。', 3, 0, 0);
INSERT INTO `grading_content` VALUES (68, 28, 1, '严格履行保安职责，严格执行门卫管理制度。按时巡逻并填写相关表册，定期进行安全检查和处置突发事件。', 4, 0, 0);
INSERT INTO `grading_content` VALUES (69, 35, 1, '依法治教（10分）', 1, 0, 0);
INSERT INTO `grading_content` VALUES (70, 35, 1, '爱岗敬业（15分）', 2, 0, 0);
INSERT INTO `grading_content` VALUES (71, 35, 1, '热爱学生（15分）', 3, 0, 0);
INSERT INTO `grading_content` VALUES (72, 35, 1, '严谨治学（15分）', 4, 0, 0);
INSERT INTO `grading_content` VALUES (73, 35, 1, '团结协作（10分）', 5, 0, 0);
INSERT INTO `grading_content` VALUES (74, 35, 1, '尊重家长（10分）', 6, 0, 0);
INSERT INTO `grading_content` VALUES (75, 35, 1, '廉洁从教（10分）', 7, 0, 0);
INSERT INTO `grading_content` VALUES (76, 35, 1, '为人师表（15分）', 8, 0, 0);
INSERT INTO `grading_content` VALUES (77, 36, 1, '拥护党的基本路线，全面贯彻国家教育方针，自觉遵守《教师法》等法律法规，在教育教学中同党和国家的方针政策一致，不得有违背党和国家方针、政策的言行。', 1, 0, 0);
INSERT INTO `grading_content` VALUES (78, 36, 1, '热爱教育、热爱幼儿园、尽职尽责、教书育人，注重培养幼儿具有良好的思想品德。认真备课、上课，认真批改作业，不敷衍塞责，不传播有害幼儿身心健康的思想。', 2, 0, 0);
INSERT INTO `grading_content` VALUES (79, 36, 1, '关心爱护全体幼儿，尊重幼儿的人格，平等、公平对待幼儿。对幼儿严格要求，耐心教导，不讽刺、不挖苦、不歧视、不体罚或变相体罚幼儿，保护幼儿的合法权益，促进幼儿全面、健康发展。', 3, 0, 0);
INSERT INTO `grading_content` VALUES (80, 36, 1, '树立优良学风，刻苦钻研业务，不断学习新知识，探索教育规律，改进教育教学方法，提高教育、教学和教研水平。', 4, 0, 0);
INSERT INTO `grading_content` VALUES (81, 36, 1, '谦虚谨慎，尊重同事，互相学习、互相帮助，维护其他老师在幼儿心目中的威信，关心集体，维护学校荣誉、共创文明校园。', 5, 0, 0);
INSERT INTO `grading_content` VALUES (82, 36, 1, '主动与幼儿家长联系，认真听取家长意见和建议，取得家长的支持与配合。积极宣传科学的教育思想和方法，不训斥、指责幼儿家长。', 6, 0, 0);
INSERT INTO `grading_content` VALUES (83, 36, 1, '坚守高尚情操，发扬奉献精神，自觉抵制社会不良风气影响，不利用职责之便谋取私利。', 7, 0, 0);
INSERT INTO `grading_content` VALUES (84, 36, 1, '模范遵守社会公德，衣着整洁得体，语言规范健康，举止文明礼貌。作风正派，注重身教。严于律己，以身作则。', 8, 0, 0);
INSERT INTO `grading_content` VALUES (85, 43, 1, '家长会', 1, 0, 1);
INSERT INTO `grading_content` VALUES (86, 44, 1, '前期准备 20分', 1, 0, 0);
INSERT INTO `grading_content` VALUES (87, 45, 1, '非常好，几乎是孩子动手做的，很好的展示了孩子的能力。15—20分\n一般，孩子参与的不多，几乎都是老师做的。10—15分\n不好，还是平平常一样。10分以下', 1, 0, 0);
INSERT INTO `grading_content` VALUES (88, 43, 1, '家长会', 2, 0, 1);
INSERT INTO `grading_content` VALUES (89, 44, 1, '流程安排 30分', 2, 0, 0);
INSERT INTO `grading_content` VALUES (90, 45, 1, '非常好，衔接紧凑，家长参与感好。20—30分\n一般，家长参与感不够。10—20分\n不好，家长没看清流程，家长参与度不高。10分以下', 2, 0, 0);
INSERT INTO `grading_content` VALUES (91, 43, 1, '家长会', 3, 0, 1);
INSERT INTO `grading_content` VALUES (92, 44, 1, '内容分享 50分', 3, 0, 0);
INSERT INTO `grading_content` VALUES (93, 45, 1, '这两大模块老师都分享得很好，能感受到老师的专业和用心。40—50分\n一个模块老师准备充分，老师很有引导，能很好带动家长的幼儿园生活。40—50分\n集中育活动很好，感受到活动的有趣，孩子能从这样的游戏中可得知识。40—50分\n两大模块的内容都还需改进，老师的能力还有待提升。20分以下', 3, 0, 0);
INSERT INTO `grading_content` VALUES (94, 43, 1, '家访', 4, 0, 1);
INSERT INTO `grading_content` VALUES (95, 44, 1, '言行举止 20分', 4, 0, 0);
INSERT INTO `grading_content` VALUES (96, 45, 1, '非常好，言行举止得体。15—20分\n一般，说话较随意。10—15分\n不好，穿着不得体，言行随意。10分以下', 4, 0, 0);
INSERT INTO `grading_content` VALUES (97, 43, 1, '家访', 5, 0, 1);
INSERT INTO `grading_content` VALUES (98, 44, 1, '家访内容 40分', 5, 0, 0);
INSERT INTO `grading_content` VALUES (99, 45, 1, '全面、具体，很好地了解到孩子在幼儿园的情况。30—40分\n了解到孩子在某些方面的情况，不够全面。20—30分\n不了解情况，交流较少。20分以下', 5, 0, 0);
INSERT INTO `grading_content` VALUES (100, 43, 1, '家访', 6, 0, 1);
INSERT INTO `grading_content` VALUES (101, 44, 1, '育儿建议 40分', 6, 0, 0);
INSERT INTO `grading_content` VALUES (102, 45, 1, '老师给予专业、科学的育儿建议，操作性强。30—40分\n给了一些建议，但针对性、操作性不强。20—30分\n老师只是为了完成任务。20分以下', 6, 0, 0);
INSERT INTO `grading_content` VALUES (103, 43, 1, '家长开放日', 7, 0, 1);
INSERT INTO `grading_content` VALUES (104, 44, 1, '前期准备 20分', 7, 0, 0);
INSERT INTO `grading_content` VALUES (105, 45, 1, '非常充分，氛围浓厚（几乎都要孩子参与的），衔接流畅。15—20分\n一般，孩子没有参与氛围布置，老师配合有待加强。10—15分\n不好，没有氛围的营造，老师对流程不够清晰。10分以下', 7, 0, 0);
INSERT INTO `grading_content` VALUES (106, 43, 1, '家长开放日', 8, 0, 1);
INSERT INTO `grading_content` VALUES (107, 44, 1, '流程安排 30分', 8, 0, 0);
INSERT INTO `grading_content` VALUES (108, 45, 1, '非常好，充分的展现了孩子的半日活动，家长参与感强。20—30分\n一般，展现了孩子的半日活动，家长参与感不强。10—20分\n不好，没有很好的展现孩子的半日活动，家长没有参与感。10分以下', 8, 0, 0);
INSERT INTO `grading_content` VALUES (109, 43, 1, '家长开放日', 9, 0, 1);
INSERT INTO `grading_content` VALUES (110, 44, 1, '内容分享 50分', 9, 0, 0);
INSERT INTO `grading_content` VALUES (111, 45, 1, '家长会模块内容丰富，理论联系实际，也给予家长很好的建议。40—50分\n单个活动细节结合，老师中有目标、眼里有孩子，期末互动效果好。40—50分\n两大模块的内容都还需改进，老师的能力还有待提升。20分以下', 9, 0, 0);
INSERT INTO `grading_content` VALUES (112, 43, 1, '亲子活动', 10, 0, 1);
INSERT INTO `grading_content` VALUES (113, 44, 1, '活动准备 20分', 10, 0, 0);
INSERT INTO `grading_content` VALUES (114, 45, 1, '非常好，每位老师都熟悉每一个环节，能接续紧。15—20分\n还行，老师之间配合还需更紧密一些。10—15分\n不好，整个活动比较混乱。10分以下', 10, 0, 0);
INSERT INTO `grading_content` VALUES (115, 43, 1, '亲子活动', 11, 0, 1);
INSERT INTO `grading_content` VALUES (116, 44, 1, '流程安排 20分', 11, 0, 0);
INSERT INTO `grading_content` VALUES (117, 45, 1, '非常好，动静结合，家长参与感强。15—20分\n一般，家长和幼儿的互动性不高。10—15分\n不好，强度太大，到后面大家的体力都跟不上了。10分以下', 11, 0, 0);
INSERT INTO `grading_content` VALUES (118, 43, 1, '亲子活动', 12, 0, 1);
INSERT INTO `grading_content` VALUES (119, 44, 1, '活动组织 60分', 12, 0, 0);
INSERT INTO `grading_content` VALUES (120, 45, 1, '很好，衔接紧凑有序，家长、孩子的积极性都高涨。40—60分\n一般，家长、孩子参与的积极性不高。20—40分\n不好，老师的组织能力还有待提高。20分以下', 12, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121652, 4, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121653, 5, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121654, 6, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121655, 7, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121656, 8, 0, '30.0', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121657, 9, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121658, 4, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121659, 5, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121660, 6, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121661, 7, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121662, 8, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121663, 9, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121664, 4, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121665, 5, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121666, 6, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121667, 7, 0, '20.0', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121668, 8, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121669, 9, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121670, 4, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121671, 5, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121672, 6, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121673, 7, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121674, 8, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121675, 9, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121676, 4, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121677, 5, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121678, 6, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121679, 7, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121680, 8, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121681, 9, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121682, 4, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121683, 5, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121684, 6, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121685, 7, 0, '10.0', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121686, 8, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121687, 9, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121688, 46, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121689, 46, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121690, 46, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121691, 46, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121692, 46, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121693, 46, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121694, 46, 0, '', 7, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121695, 46, 0, '', 8, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121696, 46, 0, '', 9, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121697, 46, 0, '', 10, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121698, 46, 0, '', 11, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121699, 46, 0, '', 12, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121700, 46, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121701, 46, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121702, 46, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121703, 46, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121704, 46, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121705, 46, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121706, 46, 0, '', 7, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121707, 46, 0, '', 8, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121708, 46, 0, '', 9, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121709, 46, 0, '', 10, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121710, 46, 0, '', 11, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121711, 46, 0, '', 12, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121712, 4, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121713, 5, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121714, 6, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121715, 7, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121716, 8, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121717, 9, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121718, 4, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121719, 5, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121720, 6, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121721, 7, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121722, 8, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121723, 9, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121724, 4, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121725, 5, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121726, 6, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121727, 7, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121728, 8, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121729, 9, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121730, 4, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121731, 5, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121732, 6, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121733, 7, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121734, 8, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121735, 9, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121736, 4, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121737, 5, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121738, 6, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121739, 7, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121740, 8, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121741, 9, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121742, 4, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121743, 5, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121744, 6, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121745, 7, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121746, 8, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121747, 9, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121748, 4, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121749, 5, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121750, 6, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121751, 7, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121752, 8, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121753, 9, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121754, 4, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121755, 5, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121756, 6, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121757, 7, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121758, 8, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121759, 9, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121760, 4, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121761, 5, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121762, 6, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121763, 7, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121764, 8, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121765, 9, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121766, 4, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121767, 5, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121768, 6, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121769, 7, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121770, 8, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121771, 9, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121772, 4, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121773, 5, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121774, 6, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121775, 7, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121776, 8, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121777, 9, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121778, 4, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121779, 5, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121780, 6, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121781, 7, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121782, 8, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121783, 9, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121784, 12, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121785, 13, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121786, 14, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121787, 15, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121788, 16, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121789, 17, 0, '', 1, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121790, 12, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121791, 13, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121792, 14, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121793, 15, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121794, 16, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121795, 17, 0, '', 2, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121796, 12, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121797, 13, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121798, 14, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121799, 15, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121800, 16, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121801, 17, 0, '', 3, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121802, 12, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121803, 13, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121804, 14, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121805, 15, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121806, 16, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121807, 17, 0, '', 4, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121808, 12, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121809, 13, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121810, 14, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121811, 15, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121812, 16, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121813, 17, 0, '', 5, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121814, 12, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121815, 13, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121816, 14, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121817, 15, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121818, 16, 0, '', 6, 0, 0);
INSERT INTO `grading_content` VALUES (1913539685308121819, 17, 0, '', 6, 0, 0);

-- ----------------------------
-- Table structure for grading_content_detail
-- ----------------------------
DROP TABLE IF EXISTS `grading_content_detail`;
CREATE TABLE `grading_content_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content_id` bigint(20) NOT NULL COMMENT '考核内容Id',
  `grading_user_id` bigint(20) NOT NULL COMMENT '考核人',
  `score` decimal(5, 2) NOT NULL COMMENT '分数',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 643 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考核内容详情信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grading_content_detail
-- ----------------------------
INSERT INTO `grading_content_detail` VALUES (499, 1, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (500, 2, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (501, 3, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (502, 4, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (503, 5, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (504, 6, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (505, 7, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (506, 8, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (507, 9, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (508, 10, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (509, 11, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (510, 12, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (511, 13, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (512, 14, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (513, 15, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (514, 16, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (515, 17, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (516, 18, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:16:55');
INSERT INTO `grading_content_detail` VALUES (517, 1913539685308121655, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:17:24');
INSERT INTO `grading_content_detail` VALUES (518, 1913539685308121656, 3, 30.00, '2025-04-25 21:16:55', '2025-04-25 21:17:24');
INSERT INTO `grading_content_detail` VALUES (519, 1913539685308121661, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:17:24');
INSERT INTO `grading_content_detail` VALUES (520, 1913539685308121662, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:17:24');
INSERT INTO `grading_content_detail` VALUES (521, 1913539685308121667, 3, 20.00, '2025-04-25 21:16:55', '2025-04-25 21:17:24');
INSERT INTO `grading_content_detail` VALUES (522, 1913539685308121668, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:17:24');
INSERT INTO `grading_content_detail` VALUES (523, 1913539685308121673, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:17:24');
INSERT INTO `grading_content_detail` VALUES (524, 1913539685308121674, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:17:24');
INSERT INTO `grading_content_detail` VALUES (525, 1913539685308121679, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:17:24');
INSERT INTO `grading_content_detail` VALUES (526, 1913539685308121680, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:17:24');
INSERT INTO `grading_content_detail` VALUES (527, 1913539685308121685, 3, 10.00, '2025-04-25 21:16:55', '2025-04-25 21:17:24');
INSERT INTO `grading_content_detail` VALUES (528, 1913539685308121686, 3, 0.00, '2025-04-25 21:16:55', '2025-04-25 21:17:24');
INSERT INTO `grading_content_detail` VALUES (529, 85, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (530, 86, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (531, 87, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (532, 88, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (533, 89, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (534, 90, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (535, 91, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (536, 92, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (537, 93, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (538, 94, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (539, 95, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (540, 96, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (541, 97, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (542, 98, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (543, 99, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (544, 100, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (545, 101, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (546, 102, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (547, 103, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (548, 104, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (549, 105, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (550, 106, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (551, 107, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (552, 108, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (553, 109, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (554, 110, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (555, 111, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (556, 112, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (557, 113, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (558, 114, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (559, 115, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (560, 116, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (561, 117, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (562, 118, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (563, 119, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (564, 120, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (565, 1913539685308121688, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (566, 1913539685308121689, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (567, 1913539685308121690, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (568, 1913539685308121691, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (569, 1913539685308121692, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (570, 1913539685308121693, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (571, 1913539685308121694, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (572, 1913539685308121695, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (573, 1913539685308121696, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (574, 1913539685308121697, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (575, 1913539685308121698, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (576, 1913539685308121699, 1, 0.00, '2025-04-26 16:26:07', '2025-04-26 16:26:07');
INSERT INTO `grading_content_detail` VALUES (577, 1913539685308121700, 1, 0.00, '2025-04-26 16:33:39', '2025-04-26 16:33:39');
INSERT INTO `grading_content_detail` VALUES (578, 1913539685308121701, 1, 0.00, '2025-04-26 16:33:39', '2025-04-26 16:33:39');
INSERT INTO `grading_content_detail` VALUES (579, 1913539685308121702, 1, 0.00, '2025-04-26 16:33:39', '2025-04-26 16:33:39');
INSERT INTO `grading_content_detail` VALUES (580, 1913539685308121703, 1, 0.00, '2025-04-26 16:33:39', '2025-04-26 16:33:39');
INSERT INTO `grading_content_detail` VALUES (581, 1913539685308121704, 1, 0.00, '2025-04-26 16:33:39', '2025-04-26 16:33:39');
INSERT INTO `grading_content_detail` VALUES (582, 1913539685308121705, 1, 0.00, '2025-04-26 16:33:39', '2025-04-26 16:33:39');
INSERT INTO `grading_content_detail` VALUES (583, 1913539685308121706, 1, 0.00, '2025-04-26 16:33:39', '2025-04-26 16:33:39');
INSERT INTO `grading_content_detail` VALUES (584, 1913539685308121707, 1, 0.00, '2025-04-26 16:33:39', '2025-04-26 16:33:39');
INSERT INTO `grading_content_detail` VALUES (585, 1913539685308121708, 1, 0.00, '2025-04-26 16:33:39', '2025-04-26 16:33:39');
INSERT INTO `grading_content_detail` VALUES (586, 1913539685308121709, 1, 0.00, '2025-04-26 16:33:39', '2025-04-26 16:33:39');
INSERT INTO `grading_content_detail` VALUES (587, 1913539685308121710, 1, 0.00, '2025-04-26 16:33:39', '2025-04-26 16:33:39');
INSERT INTO `grading_content_detail` VALUES (588, 1913539685308121711, 1, 0.00, '2025-04-26 16:33:39', '2025-04-26 16:33:39');
INSERT INTO `grading_content_detail` VALUES (589, 1, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (590, 2, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (591, 3, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (592, 4, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (593, 5, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (594, 6, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (595, 7, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (596, 8, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (597, 9, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (598, 10, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (599, 11, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (600, 12, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (601, 13, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (602, 14, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (603, 15, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (604, 16, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (605, 17, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (606, 18, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (607, 1913539685308121748, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (608, 1913539685308121749, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (609, 1913539685308121750, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (610, 1913539685308121751, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (611, 1913539685308121752, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (612, 1913539685308121753, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (613, 1913539685308121754, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (614, 1913539685308121755, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (615, 1913539685308121756, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (616, 1913539685308121757, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (617, 1913539685308121758, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (618, 1913539685308121759, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (619, 1913539685308121760, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (620, 1913539685308121761, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (621, 1913539685308121762, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (622, 1913539685308121763, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (623, 1913539685308121764, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (624, 1913539685308121765, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (625, 1913539685308121766, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (626, 1913539685308121767, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (627, 1913539685308121768, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (628, 1913539685308121769, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (629, 1913539685308121770, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (630, 1913539685308121771, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (631, 1913539685308121772, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (632, 1913539685308121773, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (633, 1913539685308121774, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (634, 1913539685308121775, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (635, 1913539685308121776, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (636, 1913539685308121777, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (637, 1913539685308121778, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (638, 1913539685308121779, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (639, 1913539685308121780, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (640, 1913539685308121781, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (641, 1913539685308121782, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');
INSERT INTO `grading_content_detail` VALUES (642, 1913539685308121783, 1, 0.00, '2025-05-05 20:12:48', '2025-05-05 20:12:48');

-- ----------------------------
-- Table structure for grading_content_rel
-- ----------------------------
DROP TABLE IF EXISTS `grading_content_rel`;
CREATE TABLE `grading_content_rel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `grading_id` bigint(20) NOT NULL COMMENT '评价表Id',
  `content_id` bigint(20) NOT NULL COMMENT '评价内容Id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_grading_content`(`grading_id`, `content_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1913539976359265364 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评价内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grading_content_rel
-- ----------------------------
INSERT INTO `grading_content_rel` VALUES (1913539976359265058, 13, 1);
INSERT INTO `grading_content_rel` VALUES (1913539976359265059, 13, 2);
INSERT INTO `grading_content_rel` VALUES (1913539976359265060, 13, 3);
INSERT INTO `grading_content_rel` VALUES (1913539976359265061, 13, 4);
INSERT INTO `grading_content_rel` VALUES (1913539976359265062, 13, 5);
INSERT INTO `grading_content_rel` VALUES (1913539976359265063, 13, 6);
INSERT INTO `grading_content_rel` VALUES (1913539976359265064, 13, 7);
INSERT INTO `grading_content_rel` VALUES (1913539976359265065, 13, 8);
INSERT INTO `grading_content_rel` VALUES (1913539976359265066, 13, 9);
INSERT INTO `grading_content_rel` VALUES (1913539976359265067, 13, 10);
INSERT INTO `grading_content_rel` VALUES (1913539976359265068, 13, 11);
INSERT INTO `grading_content_rel` VALUES (1913539976359265069, 13, 12);
INSERT INTO `grading_content_rel` VALUES (1913539976359265070, 13, 13);
INSERT INTO `grading_content_rel` VALUES (1913539976359265071, 13, 14);
INSERT INTO `grading_content_rel` VALUES (1913539976359265072, 13, 15);
INSERT INTO `grading_content_rel` VALUES (1913539976359265073, 13, 16);
INSERT INTO `grading_content_rel` VALUES (1913539976359265074, 13, 17);
INSERT INTO `grading_content_rel` VALUES (1913539976359265075, 13, 18);
INSERT INTO `grading_content_rel` VALUES (1913539976359265076, 13, 1913539685308121652);
INSERT INTO `grading_content_rel` VALUES (1913539976359265077, 13, 1913539685308121653);
INSERT INTO `grading_content_rel` VALUES (1913539976359265078, 13, 1913539685308121654);
INSERT INTO `grading_content_rel` VALUES (1913539976359265079, 13, 1913539685308121655);
INSERT INTO `grading_content_rel` VALUES (1913539976359265080, 13, 1913539685308121656);
INSERT INTO `grading_content_rel` VALUES (1913539976359265081, 13, 1913539685308121657);
INSERT INTO `grading_content_rel` VALUES (1913539976359265082, 13, 1913539685308121658);
INSERT INTO `grading_content_rel` VALUES (1913539976359265083, 13, 1913539685308121659);
INSERT INTO `grading_content_rel` VALUES (1913539976359265084, 13, 1913539685308121660);
INSERT INTO `grading_content_rel` VALUES (1913539976359265085, 13, 1913539685308121661);
INSERT INTO `grading_content_rel` VALUES (1913539976359265086, 13, 1913539685308121662);
INSERT INTO `grading_content_rel` VALUES (1913539976359265087, 13, 1913539685308121663);
INSERT INTO `grading_content_rel` VALUES (1913539976359265088, 13, 1913539685308121664);
INSERT INTO `grading_content_rel` VALUES (1913539976359265089, 13, 1913539685308121665);
INSERT INTO `grading_content_rel` VALUES (1913539976359265090, 13, 1913539685308121666);
INSERT INTO `grading_content_rel` VALUES (1913539976359265091, 13, 1913539685308121667);
INSERT INTO `grading_content_rel` VALUES (1913539976359265092, 13, 1913539685308121668);
INSERT INTO `grading_content_rel` VALUES (1913539976359265093, 13, 1913539685308121669);
INSERT INTO `grading_content_rel` VALUES (1913539976359265094, 13, 1913539685308121670);
INSERT INTO `grading_content_rel` VALUES (1913539976359265095, 13, 1913539685308121671);
INSERT INTO `grading_content_rel` VALUES (1913539976359265096, 13, 1913539685308121672);
INSERT INTO `grading_content_rel` VALUES (1913539976359265097, 13, 1913539685308121673);
INSERT INTO `grading_content_rel` VALUES (1913539976359265098, 13, 1913539685308121674);
INSERT INTO `grading_content_rel` VALUES (1913539976359265099, 13, 1913539685308121675);
INSERT INTO `grading_content_rel` VALUES (1913539976359265100, 13, 1913539685308121676);
INSERT INTO `grading_content_rel` VALUES (1913539976359265101, 13, 1913539685308121677);
INSERT INTO `grading_content_rel` VALUES (1913539976359265102, 13, 1913539685308121678);
INSERT INTO `grading_content_rel` VALUES (1913539976359265103, 13, 1913539685308121679);
INSERT INTO `grading_content_rel` VALUES (1913539976359265104, 13, 1913539685308121680);
INSERT INTO `grading_content_rel` VALUES (1913539976359265105, 13, 1913539685308121681);
INSERT INTO `grading_content_rel` VALUES (1913539976359265106, 13, 1913539685308121682);
INSERT INTO `grading_content_rel` VALUES (1913539976359265107, 13, 1913539685308121683);
INSERT INTO `grading_content_rel` VALUES (1913539976359265108, 13, 1913539685308121684);
INSERT INTO `grading_content_rel` VALUES (1913539976359265109, 13, 1913539685308121685);
INSERT INTO `grading_content_rel` VALUES (1913539976359265110, 13, 1913539685308121686);
INSERT INTO `grading_content_rel` VALUES (1913539976359265111, 13, 1913539685308121687);
INSERT INTO `grading_content_rel` VALUES (1913539976359265112, 14, 85);
INSERT INTO `grading_content_rel` VALUES (1913539976359265113, 14, 86);
INSERT INTO `grading_content_rel` VALUES (1913539976359265114, 14, 87);
INSERT INTO `grading_content_rel` VALUES (1913539976359265115, 14, 88);
INSERT INTO `grading_content_rel` VALUES (1913539976359265116, 14, 89);
INSERT INTO `grading_content_rel` VALUES (1913539976359265117, 14, 90);
INSERT INTO `grading_content_rel` VALUES (1913539976359265118, 14, 91);
INSERT INTO `grading_content_rel` VALUES (1913539976359265119, 14, 92);
INSERT INTO `grading_content_rel` VALUES (1913539976359265120, 14, 93);
INSERT INTO `grading_content_rel` VALUES (1913539976359265121, 14, 94);
INSERT INTO `grading_content_rel` VALUES (1913539976359265122, 14, 95);
INSERT INTO `grading_content_rel` VALUES (1913539976359265123, 14, 96);
INSERT INTO `grading_content_rel` VALUES (1913539976359265124, 14, 97);
INSERT INTO `grading_content_rel` VALUES (1913539976359265125, 14, 98);
INSERT INTO `grading_content_rel` VALUES (1913539976359265126, 14, 99);
INSERT INTO `grading_content_rel` VALUES (1913539976359265127, 14, 100);
INSERT INTO `grading_content_rel` VALUES (1913539976359265128, 14, 101);
INSERT INTO `grading_content_rel` VALUES (1913539976359265129, 14, 102);
INSERT INTO `grading_content_rel` VALUES (1913539976359265130, 14, 103);
INSERT INTO `grading_content_rel` VALUES (1913539976359265131, 14, 104);
INSERT INTO `grading_content_rel` VALUES (1913539976359265132, 14, 105);
INSERT INTO `grading_content_rel` VALUES (1913539976359265133, 14, 106);
INSERT INTO `grading_content_rel` VALUES (1913539976359265134, 14, 107);
INSERT INTO `grading_content_rel` VALUES (1913539976359265135, 14, 108);
INSERT INTO `grading_content_rel` VALUES (1913539976359265136, 14, 109);
INSERT INTO `grading_content_rel` VALUES (1913539976359265137, 14, 110);
INSERT INTO `grading_content_rel` VALUES (1913539976359265138, 14, 111);
INSERT INTO `grading_content_rel` VALUES (1913539976359265139, 14, 112);
INSERT INTO `grading_content_rel` VALUES (1913539976359265140, 14, 113);
INSERT INTO `grading_content_rel` VALUES (1913539976359265141, 14, 114);
INSERT INTO `grading_content_rel` VALUES (1913539976359265142, 14, 115);
INSERT INTO `grading_content_rel` VALUES (1913539976359265143, 14, 116);
INSERT INTO `grading_content_rel` VALUES (1913539976359265144, 14, 117);
INSERT INTO `grading_content_rel` VALUES (1913539976359265145, 14, 118);
INSERT INTO `grading_content_rel` VALUES (1913539976359265146, 14, 119);
INSERT INTO `grading_content_rel` VALUES (1913539976359265147, 14, 120);
INSERT INTO `grading_content_rel` VALUES (1913539976359265148, 14, 1913539685308121688);
INSERT INTO `grading_content_rel` VALUES (1913539976359265149, 14, 1913539685308121689);
INSERT INTO `grading_content_rel` VALUES (1913539976359265150, 14, 1913539685308121690);
INSERT INTO `grading_content_rel` VALUES (1913539976359265151, 14, 1913539685308121691);
INSERT INTO `grading_content_rel` VALUES (1913539976359265152, 14, 1913539685308121692);
INSERT INTO `grading_content_rel` VALUES (1913539976359265153, 14, 1913539685308121693);
INSERT INTO `grading_content_rel` VALUES (1913539976359265154, 14, 1913539685308121694);
INSERT INTO `grading_content_rel` VALUES (1913539976359265155, 14, 1913539685308121695);
INSERT INTO `grading_content_rel` VALUES (1913539976359265156, 14, 1913539685308121696);
INSERT INTO `grading_content_rel` VALUES (1913539976359265157, 14, 1913539685308121697);
INSERT INTO `grading_content_rel` VALUES (1913539976359265158, 14, 1913539685308121698);
INSERT INTO `grading_content_rel` VALUES (1913539976359265159, 14, 1913539685308121699);
INSERT INTO `grading_content_rel` VALUES (1913539976359265160, 15, 85);
INSERT INTO `grading_content_rel` VALUES (1913539976359265161, 15, 86);
INSERT INTO `grading_content_rel` VALUES (1913539976359265162, 15, 87);
INSERT INTO `grading_content_rel` VALUES (1913539976359265163, 15, 88);
INSERT INTO `grading_content_rel` VALUES (1913539976359265164, 15, 89);
INSERT INTO `grading_content_rel` VALUES (1913539976359265165, 15, 90);
INSERT INTO `grading_content_rel` VALUES (1913539976359265166, 15, 91);
INSERT INTO `grading_content_rel` VALUES (1913539976359265167, 15, 92);
INSERT INTO `grading_content_rel` VALUES (1913539976359265168, 15, 93);
INSERT INTO `grading_content_rel` VALUES (1913539976359265169, 15, 94);
INSERT INTO `grading_content_rel` VALUES (1913539976359265170, 15, 95);
INSERT INTO `grading_content_rel` VALUES (1913539976359265171, 15, 96);
INSERT INTO `grading_content_rel` VALUES (1913539976359265172, 15, 97);
INSERT INTO `grading_content_rel` VALUES (1913539976359265173, 15, 98);
INSERT INTO `grading_content_rel` VALUES (1913539976359265174, 15, 99);
INSERT INTO `grading_content_rel` VALUES (1913539976359265175, 15, 100);
INSERT INTO `grading_content_rel` VALUES (1913539976359265176, 15, 101);
INSERT INTO `grading_content_rel` VALUES (1913539976359265177, 15, 102);
INSERT INTO `grading_content_rel` VALUES (1913539976359265178, 15, 103);
INSERT INTO `grading_content_rel` VALUES (1913539976359265179, 15, 104);
INSERT INTO `grading_content_rel` VALUES (1913539976359265180, 15, 105);
INSERT INTO `grading_content_rel` VALUES (1913539976359265181, 15, 106);
INSERT INTO `grading_content_rel` VALUES (1913539976359265182, 15, 107);
INSERT INTO `grading_content_rel` VALUES (1913539976359265183, 15, 108);
INSERT INTO `grading_content_rel` VALUES (1913539976359265184, 15, 109);
INSERT INTO `grading_content_rel` VALUES (1913539976359265185, 15, 110);
INSERT INTO `grading_content_rel` VALUES (1913539976359265186, 15, 111);
INSERT INTO `grading_content_rel` VALUES (1913539976359265187, 15, 112);
INSERT INTO `grading_content_rel` VALUES (1913539976359265188, 15, 113);
INSERT INTO `grading_content_rel` VALUES (1913539976359265189, 15, 114);
INSERT INTO `grading_content_rel` VALUES (1913539976359265190, 15, 115);
INSERT INTO `grading_content_rel` VALUES (1913539976359265191, 15, 116);
INSERT INTO `grading_content_rel` VALUES (1913539976359265192, 15, 117);
INSERT INTO `grading_content_rel` VALUES (1913539976359265193, 15, 118);
INSERT INTO `grading_content_rel` VALUES (1913539976359265194, 15, 119);
INSERT INTO `grading_content_rel` VALUES (1913539976359265195, 15, 120);
INSERT INTO `grading_content_rel` VALUES (1913539976359265196, 15, 1913539685308121700);
INSERT INTO `grading_content_rel` VALUES (1913539976359265197, 15, 1913539685308121701);
INSERT INTO `grading_content_rel` VALUES (1913539976359265198, 15, 1913539685308121702);
INSERT INTO `grading_content_rel` VALUES (1913539976359265199, 15, 1913539685308121703);
INSERT INTO `grading_content_rel` VALUES (1913539976359265200, 15, 1913539685308121704);
INSERT INTO `grading_content_rel` VALUES (1913539976359265201, 15, 1913539685308121705);
INSERT INTO `grading_content_rel` VALUES (1913539976359265202, 15, 1913539685308121706);
INSERT INTO `grading_content_rel` VALUES (1913539976359265203, 15, 1913539685308121707);
INSERT INTO `grading_content_rel` VALUES (1913539976359265204, 15, 1913539685308121708);
INSERT INTO `grading_content_rel` VALUES (1913539976359265205, 15, 1913539685308121709);
INSERT INTO `grading_content_rel` VALUES (1913539976359265206, 15, 1913539685308121710);
INSERT INTO `grading_content_rel` VALUES (1913539976359265207, 15, 1913539685308121711);
INSERT INTO `grading_content_rel` VALUES (1913539976359265208, 16, 1);
INSERT INTO `grading_content_rel` VALUES (1913539976359265209, 16, 2);
INSERT INTO `grading_content_rel` VALUES (1913539976359265210, 16, 3);
INSERT INTO `grading_content_rel` VALUES (1913539976359265211, 16, 4);
INSERT INTO `grading_content_rel` VALUES (1913539976359265212, 16, 5);
INSERT INTO `grading_content_rel` VALUES (1913539976359265213, 16, 6);
INSERT INTO `grading_content_rel` VALUES (1913539976359265214, 16, 7);
INSERT INTO `grading_content_rel` VALUES (1913539976359265215, 16, 8);
INSERT INTO `grading_content_rel` VALUES (1913539976359265216, 16, 9);
INSERT INTO `grading_content_rel` VALUES (1913539976359265217, 16, 10);
INSERT INTO `grading_content_rel` VALUES (1913539976359265218, 16, 11);
INSERT INTO `grading_content_rel` VALUES (1913539976359265219, 16, 12);
INSERT INTO `grading_content_rel` VALUES (1913539976359265220, 16, 13);
INSERT INTO `grading_content_rel` VALUES (1913539976359265221, 16, 14);
INSERT INTO `grading_content_rel` VALUES (1913539976359265222, 16, 15);
INSERT INTO `grading_content_rel` VALUES (1913539976359265223, 16, 16);
INSERT INTO `grading_content_rel` VALUES (1913539976359265224, 16, 17);
INSERT INTO `grading_content_rel` VALUES (1913539976359265225, 16, 18);
INSERT INTO `grading_content_rel` VALUES (1913539976359265226, 16, 1913539685308121712);
INSERT INTO `grading_content_rel` VALUES (1913539976359265227, 16, 1913539685308121713);
INSERT INTO `grading_content_rel` VALUES (1913539976359265228, 16, 1913539685308121714);
INSERT INTO `grading_content_rel` VALUES (1913539976359265229, 16, 1913539685308121715);
INSERT INTO `grading_content_rel` VALUES (1913539976359265230, 16, 1913539685308121716);
INSERT INTO `grading_content_rel` VALUES (1913539976359265231, 16, 1913539685308121717);
INSERT INTO `grading_content_rel` VALUES (1913539976359265232, 16, 1913539685308121718);
INSERT INTO `grading_content_rel` VALUES (1913539976359265233, 16, 1913539685308121719);
INSERT INTO `grading_content_rel` VALUES (1913539976359265234, 16, 1913539685308121720);
INSERT INTO `grading_content_rel` VALUES (1913539976359265235, 16, 1913539685308121721);
INSERT INTO `grading_content_rel` VALUES (1913539976359265236, 16, 1913539685308121722);
INSERT INTO `grading_content_rel` VALUES (1913539976359265237, 16, 1913539685308121723);
INSERT INTO `grading_content_rel` VALUES (1913539976359265238, 16, 1913539685308121724);
INSERT INTO `grading_content_rel` VALUES (1913539976359265239, 16, 1913539685308121725);
INSERT INTO `grading_content_rel` VALUES (1913539976359265240, 16, 1913539685308121726);
INSERT INTO `grading_content_rel` VALUES (1913539976359265241, 16, 1913539685308121727);
INSERT INTO `grading_content_rel` VALUES (1913539976359265242, 16, 1913539685308121728);
INSERT INTO `grading_content_rel` VALUES (1913539976359265243, 16, 1913539685308121729);
INSERT INTO `grading_content_rel` VALUES (1913539976359265244, 16, 1913539685308121730);
INSERT INTO `grading_content_rel` VALUES (1913539976359265245, 16, 1913539685308121731);
INSERT INTO `grading_content_rel` VALUES (1913539976359265246, 16, 1913539685308121732);
INSERT INTO `grading_content_rel` VALUES (1913539976359265247, 16, 1913539685308121733);
INSERT INTO `grading_content_rel` VALUES (1913539976359265248, 16, 1913539685308121734);
INSERT INTO `grading_content_rel` VALUES (1913539976359265249, 16, 1913539685308121735);
INSERT INTO `grading_content_rel` VALUES (1913539976359265250, 16, 1913539685308121736);
INSERT INTO `grading_content_rel` VALUES (1913539976359265251, 16, 1913539685308121737);
INSERT INTO `grading_content_rel` VALUES (1913539976359265252, 16, 1913539685308121738);
INSERT INTO `grading_content_rel` VALUES (1913539976359265253, 16, 1913539685308121739);
INSERT INTO `grading_content_rel` VALUES (1913539976359265254, 16, 1913539685308121740);
INSERT INTO `grading_content_rel` VALUES (1913539976359265255, 16, 1913539685308121741);
INSERT INTO `grading_content_rel` VALUES (1913539976359265256, 16, 1913539685308121742);
INSERT INTO `grading_content_rel` VALUES (1913539976359265257, 16, 1913539685308121743);
INSERT INTO `grading_content_rel` VALUES (1913539976359265258, 16, 1913539685308121744);
INSERT INTO `grading_content_rel` VALUES (1913539976359265259, 16, 1913539685308121745);
INSERT INTO `grading_content_rel` VALUES (1913539976359265260, 16, 1913539685308121746);
INSERT INTO `grading_content_rel` VALUES (1913539976359265261, 16, 1913539685308121747);
INSERT INTO `grading_content_rel` VALUES (1913539976359265262, 17, 1);
INSERT INTO `grading_content_rel` VALUES (1913539976359265263, 17, 2);
INSERT INTO `grading_content_rel` VALUES (1913539976359265264, 17, 3);
INSERT INTO `grading_content_rel` VALUES (1913539976359265265, 17, 4);
INSERT INTO `grading_content_rel` VALUES (1913539976359265266, 17, 5);
INSERT INTO `grading_content_rel` VALUES (1913539976359265267, 17, 6);
INSERT INTO `grading_content_rel` VALUES (1913539976359265268, 17, 7);
INSERT INTO `grading_content_rel` VALUES (1913539976359265269, 17, 8);
INSERT INTO `grading_content_rel` VALUES (1913539976359265270, 17, 9);
INSERT INTO `grading_content_rel` VALUES (1913539976359265271, 17, 10);
INSERT INTO `grading_content_rel` VALUES (1913539976359265272, 17, 11);
INSERT INTO `grading_content_rel` VALUES (1913539976359265273, 17, 12);
INSERT INTO `grading_content_rel` VALUES (1913539976359265274, 17, 13);
INSERT INTO `grading_content_rel` VALUES (1913539976359265275, 17, 14);
INSERT INTO `grading_content_rel` VALUES (1913539976359265276, 17, 15);
INSERT INTO `grading_content_rel` VALUES (1913539976359265277, 17, 16);
INSERT INTO `grading_content_rel` VALUES (1913539976359265278, 17, 17);
INSERT INTO `grading_content_rel` VALUES (1913539976359265279, 17, 18);
INSERT INTO `grading_content_rel` VALUES (1913539976359265280, 17, 1913539685308121748);
INSERT INTO `grading_content_rel` VALUES (1913539976359265281, 17, 1913539685308121749);
INSERT INTO `grading_content_rel` VALUES (1913539976359265282, 17, 1913539685308121750);
INSERT INTO `grading_content_rel` VALUES (1913539976359265283, 17, 1913539685308121751);
INSERT INTO `grading_content_rel` VALUES (1913539976359265284, 17, 1913539685308121752);
INSERT INTO `grading_content_rel` VALUES (1913539976359265285, 17, 1913539685308121753);
INSERT INTO `grading_content_rel` VALUES (1913539976359265286, 17, 1913539685308121754);
INSERT INTO `grading_content_rel` VALUES (1913539976359265287, 17, 1913539685308121755);
INSERT INTO `grading_content_rel` VALUES (1913539976359265288, 17, 1913539685308121756);
INSERT INTO `grading_content_rel` VALUES (1913539976359265289, 17, 1913539685308121757);
INSERT INTO `grading_content_rel` VALUES (1913539976359265290, 17, 1913539685308121758);
INSERT INTO `grading_content_rel` VALUES (1913539976359265291, 17, 1913539685308121759);
INSERT INTO `grading_content_rel` VALUES (1913539976359265292, 17, 1913539685308121760);
INSERT INTO `grading_content_rel` VALUES (1913539976359265293, 17, 1913539685308121761);
INSERT INTO `grading_content_rel` VALUES (1913539976359265294, 17, 1913539685308121762);
INSERT INTO `grading_content_rel` VALUES (1913539976359265295, 17, 1913539685308121763);
INSERT INTO `grading_content_rel` VALUES (1913539976359265296, 17, 1913539685308121764);
INSERT INTO `grading_content_rel` VALUES (1913539976359265297, 17, 1913539685308121765);
INSERT INTO `grading_content_rel` VALUES (1913539976359265298, 17, 1913539685308121766);
INSERT INTO `grading_content_rel` VALUES (1913539976359265299, 17, 1913539685308121767);
INSERT INTO `grading_content_rel` VALUES (1913539976359265300, 17, 1913539685308121768);
INSERT INTO `grading_content_rel` VALUES (1913539976359265301, 17, 1913539685308121769);
INSERT INTO `grading_content_rel` VALUES (1913539976359265302, 17, 1913539685308121770);
INSERT INTO `grading_content_rel` VALUES (1913539976359265303, 17, 1913539685308121771);
INSERT INTO `grading_content_rel` VALUES (1913539976359265304, 17, 1913539685308121772);
INSERT INTO `grading_content_rel` VALUES (1913539976359265305, 17, 1913539685308121773);
INSERT INTO `grading_content_rel` VALUES (1913539976359265306, 17, 1913539685308121774);
INSERT INTO `grading_content_rel` VALUES (1913539976359265307, 17, 1913539685308121775);
INSERT INTO `grading_content_rel` VALUES (1913539976359265308, 17, 1913539685308121776);
INSERT INTO `grading_content_rel` VALUES (1913539976359265309, 17, 1913539685308121777);
INSERT INTO `grading_content_rel` VALUES (1913539976359265310, 17, 1913539685308121778);
INSERT INTO `grading_content_rel` VALUES (1913539976359265311, 17, 1913539685308121779);
INSERT INTO `grading_content_rel` VALUES (1913539976359265312, 17, 1913539685308121780);
INSERT INTO `grading_content_rel` VALUES (1913539976359265313, 17, 1913539685308121781);
INSERT INTO `grading_content_rel` VALUES (1913539976359265314, 17, 1913539685308121782);
INSERT INTO `grading_content_rel` VALUES (1913539976359265315, 17, 1913539685308121783);
INSERT INTO `grading_content_rel` VALUES (1913539976359265316, 18, 19);
INSERT INTO `grading_content_rel` VALUES (1913539976359265317, 18, 20);
INSERT INTO `grading_content_rel` VALUES (1913539976359265318, 18, 21);
INSERT INTO `grading_content_rel` VALUES (1913539976359265319, 18, 22);
INSERT INTO `grading_content_rel` VALUES (1913539976359265320, 18, 23);
INSERT INTO `grading_content_rel` VALUES (1913539976359265321, 18, 24);
INSERT INTO `grading_content_rel` VALUES (1913539976359265322, 18, 25);
INSERT INTO `grading_content_rel` VALUES (1913539976359265323, 18, 26);
INSERT INTO `grading_content_rel` VALUES (1913539976359265324, 18, 27);
INSERT INTO `grading_content_rel` VALUES (1913539976359265325, 18, 28);
INSERT INTO `grading_content_rel` VALUES (1913539976359265326, 18, 29);
INSERT INTO `grading_content_rel` VALUES (1913539976359265327, 18, 30);
INSERT INTO `grading_content_rel` VALUES (1913539976359265328, 18, 1913539685308121784);
INSERT INTO `grading_content_rel` VALUES (1913539976359265329, 18, 1913539685308121785);
INSERT INTO `grading_content_rel` VALUES (1913539976359265330, 18, 1913539685308121786);
INSERT INTO `grading_content_rel` VALUES (1913539976359265331, 18, 1913539685308121787);
INSERT INTO `grading_content_rel` VALUES (1913539976359265332, 18, 1913539685308121788);
INSERT INTO `grading_content_rel` VALUES (1913539976359265333, 18, 1913539685308121789);
INSERT INTO `grading_content_rel` VALUES (1913539976359265334, 18, 1913539685308121790);
INSERT INTO `grading_content_rel` VALUES (1913539976359265335, 18, 1913539685308121791);
INSERT INTO `grading_content_rel` VALUES (1913539976359265336, 18, 1913539685308121792);
INSERT INTO `grading_content_rel` VALUES (1913539976359265337, 18, 1913539685308121793);
INSERT INTO `grading_content_rel` VALUES (1913539976359265338, 18, 1913539685308121794);
INSERT INTO `grading_content_rel` VALUES (1913539976359265339, 18, 1913539685308121795);
INSERT INTO `grading_content_rel` VALUES (1913539976359265340, 18, 1913539685308121796);
INSERT INTO `grading_content_rel` VALUES (1913539976359265341, 18, 1913539685308121797);
INSERT INTO `grading_content_rel` VALUES (1913539976359265342, 18, 1913539685308121798);
INSERT INTO `grading_content_rel` VALUES (1913539976359265343, 18, 1913539685308121799);
INSERT INTO `grading_content_rel` VALUES (1913539976359265344, 18, 1913539685308121800);
INSERT INTO `grading_content_rel` VALUES (1913539976359265345, 18, 1913539685308121801);
INSERT INTO `grading_content_rel` VALUES (1913539976359265346, 18, 1913539685308121802);
INSERT INTO `grading_content_rel` VALUES (1913539976359265347, 18, 1913539685308121803);
INSERT INTO `grading_content_rel` VALUES (1913539976359265348, 18, 1913539685308121804);
INSERT INTO `grading_content_rel` VALUES (1913539976359265349, 18, 1913539685308121805);
INSERT INTO `grading_content_rel` VALUES (1913539976359265350, 18, 1913539685308121806);
INSERT INTO `grading_content_rel` VALUES (1913539976359265351, 18, 1913539685308121807);
INSERT INTO `grading_content_rel` VALUES (1913539976359265352, 18, 1913539685308121808);
INSERT INTO `grading_content_rel` VALUES (1913539976359265353, 18, 1913539685308121809);
INSERT INTO `grading_content_rel` VALUES (1913539976359265354, 18, 1913539685308121810);
INSERT INTO `grading_content_rel` VALUES (1913539976359265355, 18, 1913539685308121811);
INSERT INTO `grading_content_rel` VALUES (1913539976359265356, 18, 1913539685308121812);
INSERT INTO `grading_content_rel` VALUES (1913539976359265357, 18, 1913539685308121813);
INSERT INTO `grading_content_rel` VALUES (1913539976359265358, 18, 1913539685308121814);
INSERT INTO `grading_content_rel` VALUES (1913539976359265359, 18, 1913539685308121815);
INSERT INTO `grading_content_rel` VALUES (1913539976359265360, 18, 1913539685308121816);
INSERT INTO `grading_content_rel` VALUES (1913539976359265361, 18, 1913539685308121817);
INSERT INTO `grading_content_rel` VALUES (1913539976359265362, 18, 1913539685308121818);
INSERT INTO `grading_content_rel` VALUES (1913539976359265363, 18, 1913539685308121819);

-- ----------------------------
-- Table structure for grading_template
-- ----------------------------
DROP TABLE IF EXISTS `grading_template`;
CREATE TABLE `grading_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(1) NOT NULL COMMENT '模版类型',
  `type_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考核模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grading_template
-- ----------------------------
INSERT INTO `grading_template` VALUES (1, 0, '重庆市大足区龙岗幼儿园教师月绩效考核细则', '2025-04-18 06:42:23', '2025-04-18 06:44:00', 1, 1);
INSERT INTO `grading_template` VALUES (2, 1, '重庆市大足区龙岗幼儿园保育教师月绩效考核细则', '2025-04-18 06:42:50', '2025-04-18 06:44:06', 1, 1);
INSERT INTO `grading_template` VALUES (3, 2, '重庆市大足区龙岗幼儿园食堂人员月绩效考核细则', '2025-04-18 06:43:07', '2025-04-18 06:44:09', 1, 1);
INSERT INTO `grading_template` VALUES (4, 3, '重庆市大足区龙岗幼儿园保安人员工作考核评细则', '2025-04-18 06:43:18', '2025-04-19 06:30:42', 1, 1);
INSERT INTO `grading_template` VALUES (5, 4, '重庆市大足区龙岗幼儿园学年度师德师风考核评价表', '2025-04-18 06:43:43', '2025-04-18 06:44:23', 1, 1);
INSERT INTO `grading_template` VALUES (6, 5, '大足区龙岗幼儿园各类活动家长评价检核表', '2025-04-25 13:27:04', '2025-04-25 13:27:04', 1, 1);

-- ----------------------------
-- Table structure for grading_template_meta
-- ----------------------------
DROP TABLE IF EXISTS `grading_template_meta`;
CREATE TABLE `grading_template_meta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_id` bigint(20) NOT NULL COMMENT '模板Id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `perm_valid` int(1) NOT NULL DEFAULT 1 COMMENT '是否校验权限',
  `right_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限码',
  `sort` int(1) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_template`(`template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模板元数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grading_template_meta
-- ----------------------------
INSERT INTO `grading_template_meta` VALUES (1, 1, 'project', '项目', 0, NULL, 0);
INSERT INTO `grading_template_meta` VALUES (2, 1, 'content', '考核内容', 0, NULL, 1);
INSERT INTO `grading_template_meta` VALUES (3, 1, 'standards', '考核标准', 0, NULL, 2);
INSERT INTO `grading_template_meta` VALUES (4, 1, 'principalScore', '园长评价', 1, 'principal', 3);
INSERT INTO `grading_template_meta` VALUES (5, 1, 'departmentScore', '部门评价', 1, 'department', 4);
INSERT INTO `grading_template_meta` VALUES (6, 1, 'classScore', '班组互评', 1, 'classer', 5);
INSERT INTO `grading_template_meta` VALUES (7, 1, 'teacherScore', '教师互评', 1, 'teacher', 6);
INSERT INTO `grading_template_meta` VALUES (8, 1, 'parentsScore', '家长评价', 1, 'parents', 7);
INSERT INTO `grading_template_meta` VALUES (9, 1, 'selfScore', '自评', 1, '', 8);
INSERT INTO `grading_template_meta` VALUES (10, 2, 'project', '项目', 0, NULL, 0);
INSERT INTO `grading_template_meta` VALUES (11, 2, 'standards', '评分标准', 0, NULL, 1);
INSERT INTO `grading_template_meta` VALUES (12, 2, 'principalScore', '园长评价', 1, 'principal', 2);
INSERT INTO `grading_template_meta` VALUES (13, 2, 'departmentScore', '部门评价', 1, 'department', 3);
INSERT INTO `grading_template_meta` VALUES (14, 2, 'classScore', '班组互评', 1, 'classer', 4);
INSERT INTO `grading_template_meta` VALUES (15, 2, 'teacherScore', '教师互评', 1, 'teacher', 5);
INSERT INTO `grading_template_meta` VALUES (16, 2, 'parentsScore', '家长评价', 1, 'parents', 6);
INSERT INTO `grading_template_meta` VALUES (17, 2, 'selfScore', '自评', 1, '', 7);
INSERT INTO `grading_template_meta` VALUES (18, 3, 'project', '项目', 0, NULL, 0);
INSERT INTO `grading_template_meta` VALUES (19, 3, 'content', '内容', 0, NULL, 1);
INSERT INTO `grading_template_meta` VALUES (20, 3, 'standards', '评分标准', 0, NULL, 2);
INSERT INTO `grading_template_meta` VALUES (21, 3, 'principalScore', '园长评价', 1, 'principal', 3);
INSERT INTO `grading_template_meta` VALUES (22, 3, 'departmentScore', '部门评价', 1, 'department', 4);
INSERT INTO `grading_template_meta` VALUES (23, 3, 'classScore', '班组互评', 1, 'classer', 5);
INSERT INTO `grading_template_meta` VALUES (24, 3, 'teacherScore', '教师互评', 1, 'teacher', 6);
INSERT INTO `grading_template_meta` VALUES (25, 3, 'parentsScore', '家长评价', 1, 'parents', 7);
INSERT INTO `grading_template_meta` VALUES (26, 3, 'selfScore', '自评', 1, '', 8);
INSERT INTO `grading_template_meta` VALUES (27, 4, 'project', '项目', 0, NULL, 0);
INSERT INTO `grading_template_meta` VALUES (28, 4, 'standards', '评分标准', 0, NULL, 1);
INSERT INTO `grading_template_meta` VALUES (29, 4, 'principalScore', '园长评价', 1, 'principal', 2);
INSERT INTO `grading_template_meta` VALUES (30, 4, 'departmentScore', '部门评价', 1, 'department', 3);
INSERT INTO `grading_template_meta` VALUES (31, 4, 'classScore', '班组互评', 1, 'classer', 4);
INSERT INTO `grading_template_meta` VALUES (32, 4, 'teacherScore', '教师互评', 1, 'teacher', 5);
INSERT INTO `grading_template_meta` VALUES (33, 4, 'parentsScore', '家长评价', 1, 'parents', 6);
INSERT INTO `grading_template_meta` VALUES (34, 4, 'selfScore', '自评', 1, '', 7);
INSERT INTO `grading_template_meta` VALUES (35, 5, 'project', '项目', 0, NULL, 0);
INSERT INTO `grading_template_meta` VALUES (36, 5, 'standards', '评分标准', 0, NULL, 1);
INSERT INTO `grading_template_meta` VALUES (37, 5, 'principalScore', '园长评价', 1, 'principal', 2);
INSERT INTO `grading_template_meta` VALUES (38, 5, 'departmentScore', '部门评价', 1, 'department', 3);
INSERT INTO `grading_template_meta` VALUES (39, 5, 'classScore', '班组互评', 1, 'classer', 4);
INSERT INTO `grading_template_meta` VALUES (40, 5, 'teacherScore', '教师互评', 1, 'teacher', 5);
INSERT INTO `grading_template_meta` VALUES (41, 5, 'parentsScore', '家长评价', 1, 'parents', 6);
INSERT INTO `grading_template_meta` VALUES (42, 5, 'selfScore', '自评', 1, '', 7);
INSERT INTO `grading_template_meta` VALUES (43, 6, 'firstClass', '一级指标', 0, NULL, 0);
INSERT INTO `grading_template_meta` VALUES (44, 6, 'secondClass', '二级指标', 0, NULL, 1);
INSERT INTO `grading_template_meta` VALUES (45, 6, 'checkPoint', '检核点', 0, NULL, 2);
INSERT INTO `grading_template_meta` VALUES (46, 6, 'checkResult', '检核结果', 1, 'parents', 3);

-- ----------------------------
-- Table structure for questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `questionnaire`;
CREATE TABLE `questionnaire`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_id` bigint(20) NOT NULL COMMENT '模板Id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '评价人',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据',
  `crete_user_id` bigint(20) NOT NULL COMMENT '创建人Id',
  `update_user_id` bigint(20) NOT NULL COMMENT '更新人Id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1916679532264063005 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问卷信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questionnaire
-- ----------------------------
INSERT INTO `questionnaire` VALUES (1916679532264062985, 1, 3, '{\"title\":[{\"code\":\"category\",\"label\":\"一级指标\"},{\"code\":\"subCategory\",\"label\":\"二级指标\"},{\"code\":\"points\",\"label\":\"检核点\"},{\"code\":\"score\",\"label\":\"检核结果\"},{\"code\":\"total\",\"label\":\"总分\"}],\"value\":[{\"category\":\"家长会\",\"subCategory\":\"前期准备\\n20分\",\"points\":[\"非常好，几乎是孩子动手做的，很好的展示了孩子的能力。15—20分\",\"一般，孩子参与的不多，几乎都是老师做的。10—15分\",\"不好，还是平平常一样。10分以下\"],\"score\":\"15\",\"total\":\"94\"},{\"category\":\"家长会\",\"subCategory\":\"流程安排\\n30分\",\"points\":[\"非常好，衔接紧凑，家长参与感好。20—30分\",\"一般，家长参与感不够。10—20分\",\"不好，家长没看清流程，家长参与度不高。10分以下\"],\"score\":\"30\",\"total\":\"94\"},{\"category\":\"家长会\",\"subCategory\":\"内容分享\\n50分\",\"points\":[\"这两大模块老师都分享得很好，能感受到老师的专业和用心。40—50分\",\"一个模块老师准备充分，老师很有引导，能很好带动家长的幼儿园生活。40—50分\",\"集中育活动很好，感受到活动的有趣，孩子能从这样的游戏中可得知识。40—50分\",\"两大模块的内容都还需改进，老师的能力还有待提升。20分以下\"],\"score\":\"49\",\"total\":\"94\"},{\"category\":\"家访\",\"subCategory\":\"言行举止\\n20分\",\"points\":[\"非常好，言行举止得体。15—20分\",\"一般，说话较随意。10—15分\",\"不好，穿着不得体，言行随意。10分以下\"],\"score\":\"20\",\"total\":\"100\"},{\"category\":\"家访\",\"subCategory\":\"家访内容\\n40分\",\"points\":[\"全面、具体，很好地了解到孩子在幼儿园的情况。30—40分\",\"了解到孩子在某些方面的情况，不够全面。20—30分\",\"不了解情况，交流较少。20分以下\"],\"score\":\"40\",\"total\":\"100\"},{\"category\":\"家访\",\"subCategory\":\"育儿建议\\n40分\",\"points\":[\"老师给予专业、科学的育儿建议，操作性强。30—40分\",\"给了一些建议，但针对性、操作性不强。20—30分\",\"老师只是为了完成任务。20分以下\"],\"score\":\"40\",\"total\":\"100\"},{\"category\":\"家长开放日\",\"subCategory\":\"前期准备\\n20分\",\"points\":[\"非常充分，氛围浓厚（几乎都要孩子参与的），衔接流畅。15—20分\",\"一般，孩子没有参与氛围布置，老师配合有待加强。10—15分\",\"不好，没有氛围的营造，老师对流程不够清晰。10分以下\"],\"score\":\"19\",\"total\":\"99\"},{\"category\":\"家长开放日\",\"subCategory\":\"流程安排\\n30分\",\"points\":[\"非常好，充分的展现了孩子的半日活动，家长参与感强。20—30分\",\"一般，展现了孩子的半日活动，家长参与感不强。10—20分\",\"不好，没有很好的展现孩子的半日活动，家长没有参与感。10分以下\"],\"score\":\"30\",\"total\":\"99\"},{\"category\":\"家长开放日\",\"subCategory\":\"内容分享\\n50分\",\"points\":[\"家长会模块内容丰富，理论联系实际，也给予家长很好的建议。40—50分\",\"单个活动细节结合，老师中有目标、眼里有孩子，期末互动效果好。40—50分\",\"两大模块的内容都还需改进，老师的能力还有待提升。20分以下\"],\"score\":\"50\",\"total\":\"99\"},{\"category\":\"亲子活动\",\"subCategory\":\"活动准备\\n20分\",\"points\":[\"非常好，每位老师都熟悉每一个环节，能接续紧。15—20分\",\"还行，老师之间配合还需更紧密一些。10—15分\",\"不好，整个活动比较混乱。10分以下\"],\"score\":\"20\",\"total\":\"99\"},{\"category\":\"亲子活动\",\"subCategory\":\"流程安排\\n20分\",\"points\":[\"非常好，动静结合，家长参与感强。15—20分\",\"一般，家长和幼儿的互动性不高。10—15分\",\"不好，强度太大，到后面大家的体力都跟不上了。10分以下\"],\"score\":\"20\",\"total\":\"99\"},{\"category\":\"亲子活动\",\"subCategory\":\"活动组织\\n60分\",\"points\":[\"很好，衔接紧凑有序，家长、孩子的积极性都高涨。40—60分\",\"一般，家长、孩子参与的积极性不高。20—40分\",\"不好，老师的组织能力还有待提高。20分以下\"],\"score\":\"59\",\"total\":\"99\"}]}', 1, 1, '2025-04-28 11:20:58', '2025-04-28 11:41:44');
INSERT INTO `questionnaire` VALUES (1916679532264062988, 2, 2, '{\"classroom\":\"大班\",\"teacherPreparation\":\"A\",\"activityContent\":\"A\",\"teacherOrganization\":\"A\"}', 1, 1, '2025-04-29 14:20:15', '2025-04-29 14:20:31');
INSERT INTO `questionnaire` VALUES (1916679532264062990, 3, 3, '{\"classInfo\":\"大班\",\"flowSatisfaction\":\"A\",\"teacherPreparation\":\"A\",\"activityEffect\":\"C\"}', 1, 1, '2025-04-29 15:33:49', '2025-04-29 16:13:55');
INSERT INTO `questionnaire` VALUES (1916679532264062991, 3, 2, '{\"classInfo\":\"\",\"flowSatisfaction\": \"\",\"teacherPreparation\": \"\",\"activityEffect\":\"\"}', 1, 1, '2025-04-29 16:11:14', '2025-04-29 16:11:14');
INSERT INTO `questionnaire` VALUES (1916679532264062992, 2, 3, '{\"classroom\": \"\",\"teacherPreparation\": \"\",\"activityContent\": \"\",\"teacherOrganization\": \"\"}', 1, 1, '2025-04-29 16:14:14', '2025-04-29 16:14:14');
INSERT INTO `questionnaire` VALUES (1916679532264062993, 4, 3, '{\"classInfo\":\"大一班\",\"flowSatisfaction\":\"A\",\"atmosphere\":\"B\",\"activityEffect\":\"B\"}', 1, 1, '2025-04-29 18:35:59', '2025-04-29 20:07:16');
INSERT INTO `questionnaire` VALUES (1916679532264062994, 4, 2, ' {\"classInfo\":\"\",\"flowSatisfaction\":\"\",\"atmosphere\":\"\",\"activityEffect\":\"\"}', 1, 1, '2025-04-29 18:36:10', '2025-04-29 18:36:10');
INSERT INTO `questionnaire` VALUES (1916679532264062995, 5, 2, '{\"classroom\":\"小一班\",\"behaveAppropriately\":\"A\",\"contentComprehensive\":\"B\",\"advice\":\"C\"}', 1, 1, '2025-04-29 20:27:55', '2025-04-29 20:28:05');
INSERT INTO `questionnaire` VALUES (1916679532264062996, 1, 2, '{\"title\":[{\"code\":\"category\",\"label\":\"一级指标\"},{\"code\":\"subCategory\",\"label\":\"二级指标\"},{\"code\":\"points\",\"label\":\"检核点\"},{\"code\":\"score\",\"label\":\"检核结果\"},{\"code\":\"total\",\"label\":\"总分\"}],\"value\":[{\"category\":\"家长会\",\"subCategory\":\"前期准备\\n20分\",\"points\":[\"非常好，几乎是孩子动手做的，很好的展示了孩子的能力。15—20分\",\"一般，孩子参与的不多，几乎都是老师做的。10—15分\",\"不好，还是平平常一样。10分以下\"],\"score\":\"20\",\"total\":\"50\"},{\"category\":\"家长会\",\"subCategory\":\"流程安排\\n30分\",\"points\":[\"非常好，衔接紧凑，家长参与感好。20—30分\",\"一般，家长参与感不够。10—20分\",\"不好，家长没看清流程，家长参与度不高。10分以下\"],\"score\":\"30\",\"total\":\"50\"},{\"category\":\"家长会\",\"subCategory\":\"内容分享\\n50分\",\"points\":[\"这两大模块老师都分享得很好，能感受到老师的专业和用心。40—50分\",\"一个模块老师准备充分，老师很有引导，能很好带动家长的幼儿园生活。40—50分\",\"集中育活动很好，感受到活动的有趣，孩子能从这样的游戏中可得知识。40—50分\",\"两大模块的内容都还需改进，老师的能力还有待提升。20分以下\"],\"score\":\"\",\"total\":\"50\"},{\"category\":\"家访\",\"subCategory\":\"言行举止\\n20分\",\"points\":[\"非常好，言行举止得体。15—20分\",\"一般，说话较随意。10—15分\",\"不好，穿着不得体，言行随意。10分以下\"],\"score\":\"\",\"total\":\"\"},{\"category\":\"家访\",\"subCategory\":\"家访内容\\n40分\",\"points\":[\"全面、具体，很好地了解到孩子在幼儿园的情况。30—40分\",\"了解到孩子在某些方面的情况，不够全面。20—30分\",\"不了解情况，交流较少。20分以下\"],\"score\":\"\",\"total\":\"\"},{\"category\":\"家访\",\"subCategory\":\"育儿建议\\n40分\",\"points\":[\"老师给予专业、科学的育儿建议，操作性强。30—40分\",\"给了一些建议，但针对性、操作性不强。20—30分\",\"老师只是为了完成任务。20分以下\"],\"score\":\"\",\"total\":\"\"},{\"category\":\"家长开放日\",\"subCategory\":\"前期准备\\n20分\",\"points\":[\"非常充分，氛围浓厚（几乎都要孩子参与的），衔接流畅。15—20分\",\"一般，孩子没有参与氛围布置，老师配合有待加强。10—15分\",\"不好，没有氛围的营造，老师对流程不够清晰。10分以下\"],\"score\":\"\",\"total\":\"\"},{\"category\":\"家长开放日\",\"subCategory\":\"流程安排\\n30分\",\"points\":[\"非常好，充分的展现了孩子的半日活动，家长参与感强。20—30分\",\"一般，展现了孩子的半日活动，家长参与感不强。10—20分\",\"不好，没有很好的展现孩子的半日活动，家长没有参与感。10分以下\"],\"score\":\"\",\"total\":\"\"},{\"category\":\"家长开放日\",\"subCategory\":\"内容分享\\n50分\",\"points\":[\"家长会模块内容丰富，理论联系实际，也给予家长很好的建议。40—50分\",\"单个活动细节结合，老师中有目标、眼里有孩子，期末互动效果好。40—50分\",\"两大模块的内容都还需改进，老师的能力还有待提升。20分以下\"],\"score\":\"\",\"total\":\"\"},{\"category\":\"亲子活动\",\"subCategory\":\"活动准备\\n20分\",\"points\":[\"非常好，每位老师都熟悉每一个环节，能接续紧。15—20分\",\"还行，老师之间配合还需更紧密一些。10—15分\",\"不好，整个活动比较混乱。10分以下\"],\"score\":\"\",\"total\":\"\"},{\"category\":\"亲子活动\",\"subCategory\":\"流程安排\\n20分\",\"points\":[\"非常好，动静结合，家长参与感强。15—20分\",\"一般，家长和幼儿的互动性不高。10—15分\",\"不好，强度太大，到后面大家的体力都跟不上了。10分以下\"],\"score\":\"\",\"total\":\"\"},{\"category\":\"亲子活动\",\"subCategory\":\"活动组织\\n60分\",\"points\":[\"很好，衔接紧凑有序，家长、孩子的积极性都高涨。40—60分\",\"一般，家长、孩子参与的积极性不高。20—40分\",\"不好，老师的组织能力还有待提高。20分以下\"],\"score\":\"\",\"total\":\"\"}]}', 1, 1, '2025-04-29 20:58:02', '2025-05-01 10:03:14');
INSERT INTO `questionnaire` VALUES (1916679532264062997, 6, 2, '{\"happyTime\":\"很好哦\",\"favoriteActivity\":\"不错\",\"howDo\":\"来来来\",\"listen\":\"水电费\",\"iWillDo\":\"陌生地方\"}', 1, 1, '2025-05-01 11:28:00', '2025-05-01 11:39:28');
INSERT INTO `questionnaire` VALUES (1916679532264062998, 7, 2, '{\"animal\":\"测试\",\"favoriteActivity\":\"2\",\"wishToTeacher\":\"3\",\"speakToTeacher\":\"老师真好\"}', 1, 1, '2025-05-05 17:56:21', '2025-05-05 18:15:55');
INSERT INTO `questionnaire` VALUES (1916679532264062999, 8, 2, '{\"teacher\":\"3\",\"funnyTime\":\"捉迷藏\",\"teacherHelp\":\"擦眼泪\",\"speakToTeacher\":\"好得很\"}', 1, 1, '2025-05-05 18:22:04', '2025-05-05 18:28:35');
INSERT INTO `questionnaire` VALUES (1916679532264063000, 8, 3, '{\"teacher\":\"\",\"funnyTime\":\"\",\"teacherHelp\":\"\",\"speakToTeacher\":\"\"}', 1, 1, '2025-05-05 18:40:07', '2025-05-05 18:40:07');
INSERT INTO `questionnaire` VALUES (1916679532264063001, 9, 2, '{\"teacher\":\"镁铝\",\"activities\":\"323\",\"teacherHelp\":\"第三方\",\"story\":\"水电费\"}', 1, 1, '2025-05-05 18:42:47', '2025-05-05 18:48:04');
INSERT INTO `questionnaire` VALUES (1916679532264063002, 10, 2, '{\"EMO_TEACHER\":5,\"EMO_CHILD\":5,\"EMO_INTERACT\":5,\"EMO_ENV\":4,\"ENG_COGNITIVE\":8,\"ENG_BEHAVIOR\":8,\"ENG_SOCIAL\":7,\"ENG_OUTPUT\":2,\"CON_LIFE\":5,\"CON_AGE\":5,\"CON_INTEGRATE\":4,\"TEA_SCAFFOLD\":6,\"TEA_FEEDBACK\":6,\"TEA_ADAPT\":5,\"TEA_FAMILY\":3,\"INN_TECH\":8,\"INN_EVAL\":6,\"OVR_FLOW\":3,\"OVR_SPECIAL\":1,\"totalScore\":\"96\"}', 1, 1, '2025-05-05 22:14:18', '2025-05-05 22:32:08');
INSERT INTO `questionnaire` VALUES (1916679532264063003, 11, 2, '{\"observer\":\"\",\"highlights\":\"好得很\",\"suggestions\":\"不错阿斯蒂芬\",\"goalClarity\":5,\"contentSuitability\":5,\"happinessIntegration\":5,\"layeredDesign\":5,\"interactionQuality\":6,\"participationAtmosphere\":6,\"situationCreation\":6,\"teachingMethods\":6,\"happinessMoments\":6,\"languageInfluence\":5,\"emotionTransmission\":5,\"adaptationAbility\":5,\"happinessLeadership\":5,\"abilityImprovement\":8,\"happinessExperience\":8,\"habitCultivation\":4,\"innovativePerformance\":5,\"physicalEnvironment\":2,\"psychologicalSupport\":2,\"totalScore\":99}', 1, 1, '2025-05-05 22:36:08', '2025-05-05 23:27:56');
INSERT INTO `questionnaire` VALUES (1916679532264063004, 11, 4, '{\"observer\":\"\",\"highlights\":\"你吃的\",\"suggestions\":\"nice\",\"goalClarity\":5,\"contentSuitability\":5,\"happinessIntegration\":5,\"layeredDesign\":5,\"interactionQuality\":6,\"participationAtmosphere\":6,\"situationCreation\":6,\"teachingMethods\":6,\"happinessMoments\":6,\"languageInfluence\":5,\"emotionTransmission\":5,\"adaptationAbility\":0,\"happinessLeadership\":5,\"abilityImprovement\":8,\"happinessExperience\":8,\"habitCultivation\":4,\"innovativePerformance\":5,\"physicalEnvironment\":3,\"psychologicalSupport\":2,\"totalScore\":95}', 1, 1, '2025-05-05 23:28:12', '2025-05-05 23:28:58');

-- ----------------------------
-- Table structure for questionnaire_template
-- ----------------------------
DROP TABLE IF EXISTS `questionnaire_template`;
CREATE TABLE `questionnaire_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(1) NOT NULL COMMENT '模版ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板值，json对象',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '模版状态 0-停用 1-启用',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问卷模版' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questionnaire_template
-- ----------------------------
INSERT INTO `questionnaire_template` VALUES (1, 0, '各类活动家长评价检核表', '{\n  \"title\": [\n    {\n      \"code\": \"category\",\n      \"label\": \"一级指标\"\n    },\n    {\n      \"code\": \"subCategory\",\n      \"label\": \"二级指标\"\n    },\n    {\n      \"code\": \"points\",\n      \"label\": \"检核点\"\n    },\n    {\n      \"code\": \"score\",\n      \"label\": \"检核结果\"\n    },\n    {\n      \"code\": \"total\",\n      \"label\": \"总分\"\n    }\n  ],\n  \"value\": [\n    {\n      \"category\": \"家长会\",\n      \"subCategory\": \"前期准备\\n20分\",\n      \"points\": [\n        \"非常好，几乎是孩子动手做的，很好的展示了孩子的能力。15—20分\",\n        \"一般，孩子参与的不多，几乎都是老师做的。10—15分\",\n        \"不好，还是平平常一样。10分以下\"\n      ],\n      \"score\": \"\",\n      \"total\": \"\"\n    },\n    {\n      \"category\": \"家长会\",\n      \"subCategory\": \"流程安排\\n30分\",\n      \"points\": [\n        \"非常好，衔接紧凑，家长参与感好。20—30分\",\n        \"一般，家长参与感不够。10—20分\",\n        \"不好，家长没看清流程，家长参与度不高。10分以下\"\n      ],\n      \"score\": \"\",\n      \"total\": \"\"\n    },\n    {\n      \"category\": \"家长会\",\n      \"subCategory\": \"内容分享\\n50分\",\n      \"points\": [\n        \"这两大模块老师都分享得很好，能感受到老师的专业和用心。40—50分\",\n        \"一个模块老师准备充分，老师很有引导，能很好带动家长的幼儿园生活。40—50分\",\n        \"集中育活动很好，感受到活动的有趣，孩子能从这样的游戏中可得知识。40—50分\",\n        \"两大模块的内容都还需改进，老师的能力还有待提升。20分以下\"\n      ],\n      \"score\": \"\",\n      \"total\": \"\"\n    },\n    {\n      \"category\": \"家访\",\n      \"subCategory\": \"言行举止\\n20分\",\n      \"points\": [\n        \"非常好，言行举止得体。15—20分\",\n        \"一般，说话较随意。10—15分\",\n        \"不好，穿着不得体，言行随意。10分以下\"\n      ],\n      \"score\": \"\",\n      \"total\": \"\"\n    },\n    {\n      \"category\": \"家访\",\n      \"subCategory\": \"家访内容\\n40分\",\n      \"points\": [\n        \"全面、具体，很好地了解到孩子在幼儿园的情况。30—40分\",\n        \"了解到孩子在某些方面的情况，不够全面。20—30分\",\n        \"不了解情况，交流较少。20分以下\"\n      ],\n      \"score\": \"\",\n      \"total\": \"\"\n    },\n    {\n      \"category\": \"家访\",\n      \"subCategory\": \"育儿建议\\n40分\",\n      \"points\": [\n        \"老师给予专业、科学的育儿建议，操作性强。30—40分\",\n        \"给了一些建议，但针对性、操作性不强。20—30分\",\n        \"老师只是为了完成任务。20分以下\"\n      ],\n      \"score\": \"\",\n      \"total\": \"\"\n    },\n    {\n      \"category\": \"家长开放日\",\n      \"subCategory\": \"前期准备\\n20分\",\n      \"points\": [\n        \"非常充分，氛围浓厚（几乎都要孩子参与的），衔接流畅。15—20分\",\n        \"一般，孩子没有参与氛围布置，老师配合有待加强。10—15分\",\n        \"不好，没有氛围的营造，老师对流程不够清晰。10分以下\"\n      ],\n      \"score\": \"\",\n      \"total\": \"\"\n    },\n    {\n      \"category\": \"家长开放日\",\n      \"subCategory\": \"流程安排\\n30分\",\n      \"points\": [\n        \"非常好，充分的展现了孩子的半日活动，家长参与感强。20—30分\",\n        \"一般，展现了孩子的半日活动，家长参与感不强。10—20分\",\n        \"不好，没有很好的展现孩子的半日活动，家长没有参与感。10分以下\"\n      ],\n      \"score\": \"\",\n      \"total\": \"\"\n    },\n    {\n      \"category\": \"家长开放日\",\n      \"subCategory\": \"内容分享\\n50分\",\n      \"points\": [\n        \"家长会模块内容丰富，理论联系实际，也给予家长很好的建议。40—50分\",\n        \"单个活动细节结合，老师中有目标、眼里有孩子，期末互动效果好。40—50分\",\n        \"两大模块的内容都还需改进，老师的能力还有待提升。20分以下\"\n      ],\n      \"score\": \"\",\n      \"total\": \"\"\n    },\n    {\n      \"category\": \"亲子活动\",\n      \"subCategory\": \"活动准备\\n20分\",\n      \"points\": [\n        \"非常好，每位老师都熟悉每一个环节，能接续紧。15—20分\",\n        \"还行，老师之间配合还需更紧密一些。10—15分\",\n        \"不好，整个活动比较混乱。10分以下\"\n      ],\n      \"score\": \"\",\n      \"total\": \"\"\n    },\n    {\n      \"category\": \"亲子活动\",\n      \"subCategory\": \"流程安排\\n20分\",\n      \"points\": [\n        \"非常好，动静结合，家长参与感强。15—20分\",\n        \"一般，家长和幼儿的互动性不高。10—15分\",\n        \"不好，强度太大，到后面大家的体力都跟不上了。10分以下\"\n      ],\n      \"score\": \"\",\n      \"total\": \"\"\n    },\n    {\n      \"category\": \"亲子活动\",\n      \"subCategory\": \"活动组织\\n60分\",\n      \"points\": [\n        \"很好，衔接紧凑有序，家长、孩子的积极性都高涨。40—60分\",\n        \"一般，家长、孩子参与的积极性不高。20—40分\",\n        \"不好，老师的组织能力还有待提高。20分以下\"\n      ],\n      \"score\": \"\",\n      \"total\": \"\"\n    }\n  ]\n}', 1, '2025-04-27 11:07:27', '2025-04-28 02:56:08');
INSERT INTO `questionnaire_template` VALUES (2, 1, '亲子活动家长满意度问卷', '{\"classroom\": \"\",\"teacherPreparation\": \"\",\"activityContent\": \"\",\"teacherOrganization\": \"\"}', 1, '2025-04-28 08:47:41', '2025-04-28 09:27:37');
INSERT INTO `questionnaire_template` VALUES (3, 2, '小班家长开放日家长满意度问卷调查', '{\"classInfo\":\"\",\"flowSatisfaction\": \"\",\"teacherPreparation\": \"\",\"activityEffect\":\"\"}', 1, '2025-04-29 06:43:34', '2025-04-29 07:26:27');
INSERT INTO `questionnaire_template` VALUES (4, 3, '大班家长会家长满意度问卷调查', '{\"classInfo\":\"\",\"flowSatisfaction\":\"\",\"atmosphere\":\"\",\"activityEffect\":\"\"}', 1, '2025-04-29 08:19:51', '2025-04-29 12:21:34');
INSERT INTO `questionnaire_template` VALUES (5, 4, '教师家访家长满意度问卷调查', '{\"classroom\":\"\",\"behaveAppropriately\":\"\",\"contentComprehensive\": \"\",\"advice\":\"\"}', 1, '2025-04-29 12:21:34', '2025-04-29 12:21:34');
INSERT INTO `questionnaire_template` VALUES (6, 5, '儿童委员会评价反馈表', '{\"happyTime\":\"\",\"favoriteActivity\":\"\",\"howDo\":\"\",\"listen\":\"\",\"iWillDo\":\"\"}', 1, '2025-05-01 02:54:42', '2025-05-01 02:57:34');
INSERT INTO `questionnaire_template` VALUES (7, 6, '大班幼儿评教表', '{\"animal\":\"\",\"favoriteActivity\":\"\",\"wishToTeacher\":\"\",\"speakToTeacher\":\"\"}', 1, '2025-05-05 09:13:32', '2025-05-05 09:34:18');
INSERT INTO `questionnaire_template` VALUES (8, 7, '中班幼儿评教表', '{\"teacher\":\"\",\"funnyTime\":\"\",\"teacherHelp\":\"\",\"speakToTeacher\":\"\"}', 1, '2025-05-05 09:13:32', '2025-05-05 10:27:54');
INSERT INTO `questionnaire_template` VALUES (9, 8, '小班幼儿评教表', '{\"teacher\":\"\",\"activities\":\"\",\"teacherHelp\":\"\",\"story\":\"\"}', 1, '2025-05-05 09:13:32', '2025-05-05 10:47:47');
INSERT INTO `questionnaire_template` VALUES (10, 9, '幸福赛课评分表', '{\"EMO_TEACHER\":\"\",\"EMO_CHILD\":\"\",\"EMO_INTERACT\":\"\",\"EMO_ENV\":\"\",\"ENG_COGNITIVE\":\"\",\"ENG_BEHAVIOR\":\"\",\"ENG_SOCIAL\":\"\",\"ENG_OUTPUT\":\"\",\"CON_LIFE\":\"\",\"CON_AGE\":\"\",\"CON_INTEGRATE\":\"\",\"TEA_SCAFFOLD\":\"\",\n\"TEA_FEEDBACK\":\"\",\"TEA_ADAPT\":\"\",\"TEA_FAMILY\":\"\",\"INN_TECH\":\"\",\"INN_EVAL\":\"\",\"OVR_FLOW\":\"\",\"OVR_SPECIAL\":\"\",\"totalScore\":\"\"}', 1, '2025-05-05 13:29:27', '2025-05-05 14:15:54');
INSERT INTO `questionnaire_template` VALUES (11, 10, '幸福推门评分表', '{\"goalClarity\":\"\",\"contentSuitability\":\"\",\"happinessIntegration\":\"\",\"layeredDesign\":\"\",\"interactionQuality\":\"\",\"participationAtmosphere\":\"\",\"situationCreation\":\"\",\"teachingMethods\":\"\",\"happinessMoments\":\"\",\"languageInfluence\":\"\",\"emotionTransmission\":\"\",\"adaptationAbility\":\"\",\n\"happinessLeadership\":\"\",\"abilityImprovement\":\"\",\"happinessExperience\":\"\",\"habitCultivation\":\"\",\"innovativePerformance\":\"\",\"physicalEnvironment\":\"\",\"psychologicalSupport\":\"\",\"highlights\":\"\",\"suggestions\":\"\",\"totalScore\":\"\"}', 1, '2025-05-05 13:34:01', '2025-05-05 14:51:42');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-04-14 12:35:23', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-04-14 12:35:23', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-04-14 12:35:23', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-04-14 12:35:23', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-04-14 12:35:23', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-04-14 12:35:23', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '大足区龙岗幼儿园', 0, '龚凤', '15888888888', 'gf@qq.com', '0', '0', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-15 12:43:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '行政班子', 1, '龚凤', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-15 12:45:44');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '执行园长', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-15 12:44:49');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '党政办公室', 1, '龚凤', '15888888888', 'gf@qq.com', '0', '0', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-15 12:46:07');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '保教办公室', 2, '龚凤', '15888888888', 'gf@qq.com', '0', '0', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-15 12:46:30');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '科研办公室', 3, '龚凤', '15888888888', 'gf@qq.com', '0', '0', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-15 12:46:50');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '安全法治办公室', 4, '龚凤', '15888888888', 'gf@qq.com', '0', '0', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-15 12:47:13');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '总务办公室', 5, '龚凤', '15888888888', 'gf@qq.com', '0', '0', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-15 12:47:31');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '党政办公室', 1, '龚凤', '15888888888', 'gf@qq.com', '0', '0', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-15 12:47:54');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '保教办公室', 2, '龚凤', '15888888888', 'gf@qq.com', '0', '0', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-15 12:48:10');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-04-14 12:35:23', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-04-14 12:35:22', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-04-14 12:35:22', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-04-14 12:35:22', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-04-14 12:35:22', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-04-14 12:35:22', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-04-14 12:35:22', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-04-14 12:35:22', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-04-14 12:35:22', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-04-14 12:35:22', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-04-14 12:35:22', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-04-14 12:35:23', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-04-14 12:35:23', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-04-14 12:35:23', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-14 12:52:25');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-14 12:52:55');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-14 13:01:10');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-14 13:02:01');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-04-14 13:04:27');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-14 13:04:31');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 00:23:53');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 02:04:14');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-15 02:06:54');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 02:07:36');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-15 02:59:43');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 02:59:48');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 05:02:56');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-15 05:03:03');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-15 05:12:32');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 11:35:07');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '192.168.3.91', '内网IP', 'Chrome 11', 'Unknown mobile', '0', '登录成功', '2025-04-15 12:50:08');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 14:57:23');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-16 02:43:42');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-16 02:43:50');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-16 02:47:16');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-16 09:08:21');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-17 06:58:54');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-17 09:07:27');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-17 10:17:01');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-17 12:57:12');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 03:23:43');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 05:55:54');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 07:58:19');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-19 05:08:10');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-19 08:36:45');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-19 10:23:46');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-20 01:01:07');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-20 07:21:36');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-20 08:10:59');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-21 08:22:25');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-21 10:40:06');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-21 11:23:12');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 00:58:19');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 03:01:52');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-04-22 07:02:31');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 07:02:36');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 07:53:20');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 09:11:09');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-22 09:43:13');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-22 09:43:13');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-22 09:43:13');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 09:43:35');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 12:05:22');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 12:48:13');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-23 03:50:19');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-23 06:13:52');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-23 07:07:07');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-23 08:45:43');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-24 13:07:11');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 10:54:47');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-25 12:33:38');
INSERT INTO `sys_logininfor` VALUES (157, 'lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-04-25 12:33:46');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-25 12:33:57');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 12:34:01');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-25 12:34:50');
INSERT INTO `sys_logininfor` VALUES (161, 'lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-04-25 12:34:59');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-25 12:35:07');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 12:35:11');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-25 12:35:40');
INSERT INTO `sys_logininfor` VALUES (165, 'lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-04-25 12:35:49');
INSERT INTO `sys_logininfor` VALUES (166, 'lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 12:36:01');
INSERT INTO `sys_logininfor` VALUES (167, 'lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-25 12:36:13');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 12:36:20');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-25 12:38:01');
INSERT INTO `sys_logininfor` VALUES (170, 'lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 12:38:08');
INSERT INTO `sys_logininfor` VALUES (171, 'lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 12:48:33');
INSERT INTO `sys_logininfor` VALUES (172, 'lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 12:49:30');
INSERT INTO `sys_logininfor` VALUES (173, 'lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 12:49:46');
INSERT INTO `sys_logininfor` VALUES (174, 'lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 12:53:37');
INSERT INTO `sys_logininfor` VALUES (175, 'lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-25 13:20:55');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 13:21:02');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-26 05:36:05');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-26 08:17:29');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-26 09:15:43');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-26 12:05:06');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 03:25:30');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 11:22:11');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-27 12:05:51');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 12:05:55');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-28 02:18:49');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-28 08:13:29');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-28 09:24:26');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-29 05:53:30');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-29 08:08:33');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-29 09:06:58');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-29 10:35:28');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-29 11:41:33');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-01 02:01:55');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-01 03:27:50');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-01 05:56:15');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-05 09:07:29');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-05 09:54:45');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-05 12:12:07');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-05-05 14:11:56');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-05 14:11:59');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-06 07:22:09');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2051 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 5, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-15 00:49:26', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 6, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-15 00:49:38', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 7, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-15 00:49:45', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-04-14 12:35:22', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-04-14 12:35:22', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-04-14 12:35:22', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-04-14 12:35:22', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-04-14 12:35:22', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-04-14 12:35:22', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-04-14 12:35:22', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-04-14 12:35:22', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-04-14 12:35:22', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-04-14 12:35:22', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-04-14 12:35:22', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-04-14 12:35:22', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-04-14 12:35:22', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-04-14 12:35:22', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-04-14 12:35:22', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-04-14 12:35:22', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-04-14 12:35:22', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-04-14 12:35:22', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-04-14 12:35:22', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-04-14 12:35:22', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '管理分层式评价', 0, 1, 'teacher', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'user', 'admin', '2025-04-14 13:08:44', 'admin', '2025-04-17 12:57:50', '');
INSERT INTO `sys_menu` VALUES (2001, '家长参与式评价', 0, 2, 'parents', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'user', 'admin', '2025-04-14 13:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '幼儿游戏式评价', 0, 3, 'child', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'people', 'admin', '2025-04-14 13:17:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '专家引领式评价', 0, 4, 'expert', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'peoples', 'admin', '2025-04-14 13:18:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '大班幼儿评教表', 2002, 1, 'biggerGarden', NULL, NULL, '', 1, 0, 'C', '0', '0', '', 'user', 'admin', '2025-04-15 11:36:43', 'admin', '2025-04-17 10:17:43', '');
INSERT INTO `sys_menu` VALUES (2005, '中班班幼儿评教表', 2002, 2, 'middleGarden', NULL, NULL, '', 1, 0, 'C', '0', '0', '', 'people', 'admin', '2025-04-15 11:38:56', 'admin', '2025-04-17 10:52:06', '');
INSERT INTO `sys_menu` VALUES (2006, '各类活动家长评价检核表', 2001, 1, 'activities', NULL, NULL, '', 1, 0, 'C', '0', '0', '', 'user', 'admin', '2025-04-15 11:40:38', 'admin', '2025-04-28 08:13:51', '');
INSERT INTO `sys_menu` VALUES (2007, '亲子活动家长满意度问卷调查', 2001, 2, 'childActivities', NULL, NULL, '', 1, 0, 'C', '0', '0', '', 'user', 'admin', '2025-04-15 11:41:11', 'admin', '2025-04-28 08:14:00', '');
INSERT INTO `sys_menu` VALUES (2008, '教师绩效考核', 2000, 1, 'teacher', NULL, NULL, '', 1, 0, 'C', '0', '0', '', 'chart', 'admin', '2025-04-15 11:41:37', 'admin', '2025-04-21 09:31:40', '');
INSERT INTO `sys_menu` VALUES (2009, '保育教师绩效考核', 2000, 2, 'childcareTeacher', NULL, NULL, '', 1, 0, 'C', '0', '0', '', 'build', 'admin', '2025-04-15 11:42:17', 'admin', '2025-04-21 09:31:52', '');
INSERT INTO `sys_menu` VALUES (2010, '幸福推门', 2003, 1, 'expertDoor', NULL, NULL, '', 1, 0, 'C', '0', '0', '', 'education', 'admin', '2025-04-15 11:45:50', 'admin', '2025-04-17 11:08:13', '');
INSERT INTO `sys_menu` VALUES (2011, '幸福赛课', 2003, 2, 'expertClass', NULL, NULL, '', 1, 0, 'C', '0', '0', '', 'skill', 'admin', '2025-04-15 11:46:11', 'admin', '2025-04-17 11:08:04', '');
INSERT INTO `sys_menu` VALUES (2012, '小班幼儿评教表', 2002, 3, 'smallGarden', NULL, NULL, '', 1, 0, 'C', '0', '0', NULL, 'people', 'admin', '2025-04-17 10:52:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '儿童委员会评价反馈表', 2002, 4, 'childFeedback', NULL, NULL, '', 1, 0, 'C', '0', '0', NULL, 'peoples', 'admin', '2025-04-17 10:53:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '小班家长开放日家长满意度问卷调查', 2001, 3, 'smallerConference', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'dict', 'admin', '2025-04-17 11:41:49', 'admin', '2025-04-28 08:14:10', '');
INSERT INTO `sys_menu` VALUES (2016, '大班家长会家长满意度问卷调查', 2001, 4, 'biggerConference', NULL, NULL, '', 1, 0, 'C', '0', '0', '', 'checkbox', 'admin', '2025-04-17 11:42:19', 'admin', '2025-04-28 08:14:22', '');
INSERT INTO `sys_menu` VALUES (2017, '教师家访家长满意度问卷调查', 2001, 5, 'homeVisit', NULL, NULL, '', 1, 0, 'C', '0', '0', '', 'documentation', 'admin', '2025-04-17 11:42:44', 'admin', '2025-04-28 08:14:29', '');
INSERT INTO `sys_menu` VALUES (2018, '食堂人员绩效考核', 2000, 3, 'canteenStaff', NULL, NULL, '', 1, 0, 'C', '0', '0', '', 'peoples', 'admin', '2025-04-17 12:58:53', 'admin', '2025-04-21 09:32:15', '');
INSERT INTO `sys_menu` VALUES (2019, '保安人员工作考核', 2000, 4, 'securityGuard', NULL, NULL, '', 1, 0, 'C', '0', '0', '', 'form', 'admin', '2025-04-17 12:59:41', 'admin', '2025-04-21 09:32:25', '');
INSERT INTO `sys_menu` VALUES (2020, '师德师风考核', 2000, 5, 'morality', NULL, NULL, '', 1, 0, 'C', '0', '0', '', 'monitor', 'admin', '2025-04-17 13:00:02', 'admin', '2025-04-21 09:32:36', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-04-14 12:35:23', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-04-14 12:35:23', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 254 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"管理分层式评价\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/manageLevel\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-14 13:08:44', 68);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-14 13:08:44\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":2000,\"menuName\":\"管理分层式评价\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/manageLevel\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"修改菜单\'管理分层式评价\'失败，地址必须以http(s)://开头\",\"code\":500}', 0, NULL, '2025-04-14 13:08:54', 6);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-14 13:08:44\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"管理分层式评价\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/manageLevel\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-14 13:09:40', 36);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-14 13:08:44\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"管理分层式评价\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"manage\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-14 13:16:06', 17);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"家长参与式评价\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"parents\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-14 13:17:07', 23);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"幼儿游戏式评价\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"child\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-14 13:17:43', 34);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"专家引领式评价\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"expert\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-14 13:18:38', 22);
INSERT INTO `sys_oper_log` VALUES (107, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"parents\",\"roleName\":\"家长\",\"roleSort\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-14 13:28:05', 26);
INSERT INTO `sys_oper_log` VALUES (108, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":101,\"roleKey\":\"expert\",\"roleName\":\"专家\",\"roleSort\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-14 13:28:48', 17);
INSERT INTO `sys_oper_log` VALUES (109, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":102,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-14 13:29:08', 12);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-14 12:35:22\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 00:49:26', 10);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-14 12:35:22\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 00:49:38', 10);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-14 12:35:22\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 00:49:45', 12);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-14 12:35:22\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 00:49:56', 7);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-04-15 00:50:26', 7);
INSERT INTO `sys_oper_log` VALUES (115, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-14 12:35:22\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 00:50:53', 26);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 00:51:25', 11);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"儿童委员会\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"youer\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:36:43', 27);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"班级评价\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"path\":\"classGame\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:38:56', 9);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:36:43\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"儿童委员会\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"childLevel\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:39:10', 14);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"活动评价\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"active\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:40:38', 14);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"家园共建\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"home\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:41:11', 16);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"师德师风\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"teacher\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:41:37', 11);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教育教育\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"teachLevel\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:42:17', 17);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:41:11\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"家园共建\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"home\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:43:32', 10);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:41:11\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"家园共建\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"parentActive\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:44:07', 8);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:42:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"教育教育\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"teachLevel\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:44:34', 9);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"幸福推门\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"zhuanjia\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:45:50', 14);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"幸福赛课\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"path\":\"zhuanjiasaike\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:46:11', 8);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:45:50\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"幸福推门\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"zhuanjia\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 12:40:21', 13);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:46:11\",\"icon\":\"skill\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"幸福赛课\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"path\":\"zhuanjiasaike\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 12:40:39', 13);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:41:37\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"师德师风\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"teacher\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 12:41:10', 9);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:42:17\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"教育教育\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"teachLevel\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 12:41:24', 15);
INSERT INTO `sys_oper_log` VALUES (133, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"大足区龙岗幼儿园\",\"email\":\"gf@qq.com\",\"leader\":\"龚凤\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 12:43:00', 16);
INSERT INTO `sys_oper_log` VALUES (134, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"党政办公室\",\"email\":\"ry@qq.com\",\"leader\":\"龚凤\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"大足区龙岗幼儿园\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 12:44:26', 34);
INSERT INTO `sys_oper_log` VALUES (135, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"执行园长\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"大足区龙岗幼儿园\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 12:44:49', 29);
INSERT INTO `sys_oper_log` VALUES (136, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"行政班子\",\"email\":\"ry@qq.com\",\"leader\":\"龚凤\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"大足区龙岗幼儿园\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 12:45:44', 21);
INSERT INTO `sys_oper_log` VALUES (137, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"党政办公室\",\"email\":\"gf@qq.com\",\"leader\":\"龚凤\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"行政班子\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 12:46:07', 19);
INSERT INTO `sys_oper_log` VALUES (138, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"保教办公室\",\"email\":\"gf@qq.com\",\"leader\":\"龚凤\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"行政班子\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 12:46:30', 17);
INSERT INTO `sys_oper_log` VALUES (139, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"科研办公室\",\"email\":\"gf@qq.com\",\"leader\":\"龚凤\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"行政班子\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 12:46:50', 18);
INSERT INTO `sys_oper_log` VALUES (140, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"安全法治办公室\",\"email\":\"gf@qq.com\",\"leader\":\"龚凤\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"parentName\":\"行政班子\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 12:47:13', 18);
INSERT INTO `sys_oper_log` VALUES (141, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":107,\"deptName\":\"总务办公室\",\"email\":\"gf@qq.com\",\"leader\":\"龚凤\",\"orderNum\":5,\"params\":{},\"parentId\":101,\"parentName\":\"行政班子\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 12:47:31', 18);
INSERT INTO `sys_oper_log` VALUES (142, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":108,\"deptName\":\"党政办公室\",\"email\":\"gf@qq.com\",\"leader\":\"龚凤\",\"orderNum\":1,\"params\":{},\"parentId\":102,\"parentName\":\"执行园长\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 12:47:54', 17);
INSERT INTO `sys_oper_log` VALUES (143, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":109,\"deptName\":\"保教办公室\",\"email\":\"gf@qq.com\",\"leader\":\"龚凤\",\"orderNum\":2,\"params\":{},\"parentId\":102,\"parentName\":\"执行园长\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 12:48:10', 15);
INSERT INTO `sys_oper_log` VALUES (144, '岗位管理', 2, 'com.grading.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-14 12:35:22\",\"flag\":false,\"params\":{},\"postCode\":\"teacher\",\"postId\":1,\"postName\":\"教师\",\"postSort\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 09:22:01', 17);
INSERT INTO `sys_oper_log` VALUES (145, '岗位管理', 2, 'com.grading.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-14 12:35:22\",\"flag\":false,\"params\":{},\"postCode\":\"parents\",\"postId\":2,\"postName\":\"家长\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 09:22:33', 10);
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:36:43\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"大班幼儿评教表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"kinderGarden\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 09:15:02', 17);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:36:43\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"大班幼儿评教表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"biggerGarden\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 10:17:43', 20);
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:38:56\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"中班班幼儿评教表\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"path\":\"middleGarden\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 10:52:06', 18);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 1, 'com.grading.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"小班幼儿评教表\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2002,\"path\":\"smallGarden\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 10:52:42', 14);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 1, 'com.grading.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"儿童委员会评价反馈表\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2002,\"path\":\"childFeedback\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 10:53:16', 9);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 1, 'com.grading.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"大足区龙岗幼儿园儿童委员会评价表\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2002,\"path\":\"childEvaluationForm\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 10:53:37', 10);
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-17 10:53:37\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"大足区龙岗幼儿园儿童委员会评价表\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2002,\"path\":\"childEvaluationForm\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 11:00:36', 10);
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:45:50\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"幸福推门\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"expertClass\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 11:07:50', 19);
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:46:11\",\"icon\":\"skill\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"幸福赛课\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"path\":\"expertClass\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 11:08:04', 13);
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:45:50\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"幸福推门\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"expertDoor\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 11:08:13', 12);
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:40:38\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"大足区龙岗幼儿园各类活动家长评价检核表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"activities\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 11:41:13', 12);
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:41:11\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"重庆市大足区龙岗幼儿园亲子活动家长满意度问卷调查\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"childActivities\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 11:41:28', 13);
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 1, 'com.grading.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"重庆市大足区龙岗幼儿园2024小班家长开放日家长满意度问卷调查\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"smallerConference\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 11:41:49', 8);
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 1, 'com.grading.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"重庆市大足区龙岗幼儿园2024秋季大班家长会家长满意度问卷调查\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"biggerConference\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 11:42:19', 19);
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 1, 'com.grading.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"重庆市大足区龙岗幼儿园教师家访家长满意度问卷调查\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"homeVisit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 11:42:44', 10);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-14 13:08:44\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"管理分层式评价\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"teacher\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 12:57:50', 10);
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:41:37\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"重庆市大足区龙岗幼儿园教师月绩效考核细则\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"teacher\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 12:58:02', 8);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:42:17\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"重庆市大足区龙岗幼儿园保育教师月绩效考核细则\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"childcareTeacher\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 12:58:28', 13);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 1, 'com.grading.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"重庆市大足区龙岗幼儿园食堂人员月绩效考核细则\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"canteenStaff\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 12:58:53', 9);
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-17 12:58:53\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"重庆市大足区龙岗幼儿园食堂人员月绩效考核细则\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"canteenStaff\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 12:59:10', 13);
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 1, 'com.grading.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"重庆市大足区龙岗幼儿园保安人员工作考核评细\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"securityGuard\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 12:59:41', 22);
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 1, 'com.grading.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"重庆市大足区龙岗幼儿园学年度师德师风考核评价表\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"morality\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 13:00:02', 7);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-17 13:00:02\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"重庆市大足区龙岗幼儿园学年度师德师风考核评价表\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"morality\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 13:00:17', 11);
INSERT INTO `sys_oper_log` VALUES (169, '代码生成', 6, 'com.grading.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '党政办公室', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"grading_content_rel,grading,grading_template_meta,grading_template,grading_content\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 03:24:58', 193);
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 8, 'com.grading.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '党政办公室', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"grading\"}', NULL, 0, NULL, '2025-04-18 03:25:43', 57);
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 8, 'com.grading.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '党政办公室', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"grading,grading_content,grading_content_rel,grading_template,grading_template_meta\"}', NULL, 0, NULL, '2025-04-18 03:26:24', 286);
INSERT INTO `sys_oper_log` VALUES (172, '角色管理', 1, 'com.grading.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2008,2009,2018,2019,2020,2001,2006,2007,2015,2016,2017,2002,2004,2005,2012,2013,2014,2003,2010,2011],\"params\":{},\"roleId\":103,\"roleKey\":\"principal\",\"roleName\":\"园长\",\"roleSort\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 07:59:24', 37);
INSERT INTO `sys_oper_log` VALUES (173, '角色管理', 1, 'com.grading.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2008,2009,2018,2019,2020,2001,2006,2007,2015,2016,2017,2002,2004,2005,2012,2013,2014,2003,2010,2011],\"params\":{},\"roleId\":104,\"roleKey\":\"department\",\"roleName\":\"部长\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 07:59:59', 31);
INSERT INTO `sys_oper_log` VALUES (174, '角色管理', 1, 'com.grading.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2008,2009,2018,2019,2020,2001,2006,2007,2015,2016,2017,2002,2004,2005,2012,2013,2014],\"params\":{},\"roleId\":105,\"roleKey\":\"class\",\"roleName\":\"班组长\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 08:00:39', 19);
INSERT INTO `sys_oper_log` VALUES (175, '角色管理', 1, 'com.grading.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2018],\"params\":{},\"roleId\":106,\"roleKey\":\"canteen\",\"roleName\":\"食堂人员\",\"roleSort\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 08:10:07', 20);
INSERT INTO `sys_oper_log` VALUES (176, '角色管理', 1, 'com.grading.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2009,2001,2006,2007,2015,2016,2017,2002,2004,2005,2012,2013,2014],\"params\":{},\"roleId\":107,\"roleKey\":\"childteacher\",\"roleName\":\"保教老师\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 08:10:58', 19);
INSERT INTO `sys_oper_log` VALUES (177, '角色管理', 1, 'com.grading.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2019],\"params\":{},\"roleId\":108,\"roleKey\":\"sercurity\",\"roleName\":\"保安\",\"roleSort\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 08:11:37', 15);
INSERT INTO `sys_oper_log` VALUES (178, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-18 08:11:37\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2019],\"params\":{},\"roleId\":108,\"roleKey\":\"security\",\"roleName\":\"保安\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 08:13:13', 21);
INSERT INTO `sys_oper_log` VALUES (179, '角色管理', 3, 'com.grading.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/role/2', '127.0.0.1', '内网IP', '[2]', NULL, 1, '普通角色已分配,不能删除', '2025-04-18 08:15:13', 9);
INSERT INTO `sys_oper_log` VALUES (180, '角色管理', 4, 'com.grading.web.controller.system.SysRoleController.cancelAuthUser()', 'PUT', 1, 'admin', '党政办公室', '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\"roleId\":2,\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 08:15:28', 7);
INSERT INTO `sys_oper_log` VALUES (181, '角色管理', 3, 'com.grading.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/role/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 08:15:37', 30);
INSERT INTO `sys_oper_log` VALUES (182, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-18 08:00:39\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2008,2009,2018,2019,2020,2001,2006,2007,2015,2016,2017,2002,2004,2005,2012,2013,2014],\"params\":{},\"roleId\":105,\"roleKey\":\"classer\",\"roleName\":\"班组长\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 08:16:16', 17);
INSERT INTO `sys_oper_log` VALUES (183, '用户管理', 2, 'com.grading.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-14 12:35:22\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"科研办公室\",\"leader\":\"龚凤\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-04-14 12:35:22\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[1],\"remark\":\"老师\",\"roleIds\":[102],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-19 08:37:32', 43);
INSERT INTO `sys_oper_log` VALUES (184, '用户管理', 2, 'com.grading.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '党政办公室', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-19 08:38:38', 75);
INSERT INTO `sys_oper_log` VALUES (185, '用户管理', 1, 'com.grading.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '党政办公室', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"李四\",\"params\":{},\"postIds\":[1],\"roleIds\":[102],\"status\":\"0\",\"userId\":3,\"userName\":\"lisi\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 09:07:27', 95);
INSERT INTO `sys_oper_log` VALUES (186, '用户管理', 2, 'com.grading.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-21 09:07:27\",\"delFlag\":\"0\",\"deptId\":103,\"email\":\"66666@qq.com\",\"loginIp\":\"\",\"nickName\":\"李四\",\"params\":{},\"phonenumber\":\"13211111111\",\"postIds\":[1],\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"lisi\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 09:08:04', 29);
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:41:37\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"教师绩效考核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"teacher\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 09:31:40', 16);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:42:17\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"保育教师绩效考核\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"childcareTeacher\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 09:31:52', 8);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-17 12:58:53\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"食堂人员绩效考核\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"canteenStaff\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 09:32:15', 11);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-17 12:59:41\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"保安人员工作考核\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"securityGuard\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 09:32:25', 7);
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-17 13:00:02\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"师德师风考核\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"morality\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 09:32:36', 10);
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 1, 'com.grading.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '党政办公室', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":106,\"nickName\":\"王五\",\"params\":{},\"postIds\":[],\"roleIds\":[107],\"sex\":\"0\",\"status\":\"0\",\"userId\":4,\"userName\":\"wangwu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 10:49:58', 78);
INSERT INTO `sys_oper_log` VALUES (193, '用户管理', 1, 'com.grading.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '党政办公室', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":104,\"nickName\":\"黄六\",\"params\":{},\"postIds\":[],\"roleIds\":[106],\"status\":\"0\",\"userId\":5,\"userName\":\"huangliu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 10:50:54', 80);
INSERT INTO `sys_oper_log` VALUES (194, '用户管理', 2, 'com.grading.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-21 10:49:57\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"安全法治办公室\",\"leader\":\"龚凤\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":106,\"email\":\"12@qq.com\",\"loginIp\":\"\",\"nickName\":\"王五\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[107],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":107,\"roleKey\":\"childteacher\",\"roleName\":\"保教老师\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":4,\"userName\":\"wangwu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 10:51:19', 15);
INSERT INTO `sys_oper_log` VALUES (195, '用户管理', 2, 'com.grading.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-21 10:49:57\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"安全法治办公室\",\"leader\":\"龚凤\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":106,\"email\":\"12@qq.com\",\"loginIp\":\"\",\"nickName\":\"王五\",\"params\":{},\"phonenumber\":\"13111111111\",\"postIds\":[],\"roleIds\":[107],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":107,\"roleKey\":\"childteacher\",\"roleName\":\"保教老师\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":4,\"userName\":\"wangwu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 10:51:44', 26);
INSERT INTO `sys_oper_log` VALUES (196, '用户管理', 2, 'com.grading.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-21 10:50:54\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"保教办公室\",\"leader\":\"龚凤\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":104,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"黄六\",\"params\":{},\"phonenumber\":\"18500000000\",\"postIds\":[],\"roleIds\":[106],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":106,\"roleKey\":\"canteen\",\"roleName\":\"食堂人员\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":5,\"userName\":\"huangliu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 10:51:54', 30);
INSERT INTO `sys_oper_log` VALUES (197, '用户管理', 1, 'com.grading.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '党政办公室', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":107,\"nickName\":\"江七\",\"params\":{},\"postIds\":[],\"roleIds\":[108],\"sex\":\"0\",\"status\":\"0\",\"userId\":6,\"userName\":\"jiang7\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 10:52:59', 76);
INSERT INTO `sys_oper_log` VALUES (198, '用户管理', 2, 'com.grading.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '党政办公室', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-25 12:34:40', 77);
INSERT INTO `sys_oper_log` VALUES (199, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-14 13:29:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2008,2009,2018,2019,2020],\"params\":{},\"roleId\":102,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-25 12:37:56', 24);
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 6, 'com.grading.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '党政办公室', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"questionnaire_template,questionnaire\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 12:27:29', 110);
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:40:38\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"各类活动家长评价检核表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"activities\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 08:13:51', 24);
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-15 11:41:11\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"亲子活动家长满意度问卷调查\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"childActivities\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 08:14:00', 9);
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-17 11:41:49\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"小班家长开放日家长满意度问卷调查\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"smallerConference\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 08:14:10', 9);
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-17 11:42:19\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2016,\"menuName\":\"大班家长会家长满意度问卷调查\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"biggerConference\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 08:14:22', 11);
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-17 11:42:44\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"教师家访家长满意度问卷调查\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"homeVisit\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 08:14:29', 11);
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 2, 'com.grading.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-17 10:53:37\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"儿童委员会评价表\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2002,\"path\":\"childEvaluationForm\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-29 12:36:15', 20);
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-05-01 02:31:57', 7);
INSERT INTO `sys_oper_log` VALUES (208, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-18 08:00:39\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2008,2009,2018,2019,2020,2001,2006,2007,2015,2016,2017],\"params\":{},\"roleId\":105,\"roleKey\":\"classer\",\"roleName\":\"班组长\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 02:33:43', 92);
INSERT INTO `sys_oper_log` VALUES (209, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-18 08:10:58\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2009,2001,2006,2007,2015,2016,2017],\"params\":{},\"roleId\":107,\"roleKey\":\"childteacher\",\"roleName\":\"保教老师\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 02:33:54', 60);
INSERT INTO `sys_oper_log` VALUES (210, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-18 07:59:59\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2008,2009,2018,2019,2020,2001,2006,2007,2015,2016,2017,2003,2010,2011],\"params\":{},\"roleId\":104,\"roleKey\":\"department\",\"roleName\":\"部长\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 02:33:59', 37);
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-05-01 02:34:09', 8);
INSERT INTO `sys_oper_log` VALUES (212, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-18 07:59:24\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2008,2009,2018,2019,2020,2001,2006,2007,2015,2016,2017,2003,2010,2011],\"params\":{},\"roleId\":103,\"roleKey\":\"principal\",\"roleName\":\"园长\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 02:34:29', 44);
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 02:34:35', 33);
INSERT INTO `sys_oper_log` VALUES (214, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-14 13:28:05\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2004,2005,2012,2013],\"params\":{},\"roleId\":100,\"roleKey\":\"parents\",\"roleName\":\"家长\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 02:34:50', 47);
INSERT INTO `sys_oper_log` VALUES (215, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2021', '127.0.0.1', '内网IP', '2021', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-05-06 07:22:56', 8);
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2026', '127.0.0.1', '内网IP', '2026', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:23:02', 16);
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2025', '127.0.0.1', '内网IP', '2025', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:23:05', 13);
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2024', '127.0.0.1', '内网IP', '2024', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:23:08', 15);
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2023', '127.0.0.1', '内网IP', '2023', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:23:11', 12);
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2022', '127.0.0.1', '内网IP', '2022', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:23:14', 13);
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2021', '127.0.0.1', '内网IP', '2021', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:23:18', 16);
INSERT INTO `sys_oper_log` VALUES (222, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2032', '127.0.0.1', '内网IP', '2032', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:23:24', 14);
INSERT INTO `sys_oper_log` VALUES (223, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2031', '127.0.0.1', '内网IP', '2031', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:23:27', 10);
INSERT INTO `sys_oper_log` VALUES (224, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2030', '127.0.0.1', '内网IP', '2030', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:23:30', 12);
INSERT INTO `sys_oper_log` VALUES (225, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2029', '127.0.0.1', '内网IP', '2029', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:23:33', 13);
INSERT INTO `sys_oper_log` VALUES (226, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2028', '127.0.0.1', '内网IP', '2028', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:23:36', 12);
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2027', '127.0.0.1', '内网IP', '2027', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:23:39', 11);
INSERT INTO `sys_oper_log` VALUES (228, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2038', '127.0.0.1', '内网IP', '2038', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:24:16', 12);
INSERT INTO `sys_oper_log` VALUES (229, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2037', '127.0.0.1', '内网IP', '2037', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:24:19', 10);
INSERT INTO `sys_oper_log` VALUES (230, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2036', '127.0.0.1', '内网IP', '2036', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:24:24', 12);
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2035', '127.0.0.1', '内网IP', '2035', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:24:27', 11);
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2034', '127.0.0.1', '内网IP', '2034', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:24:30', 11);
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2033', '127.0.0.1', '内网IP', '2033', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:24:34', 10);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2044', '127.0.0.1', '内网IP', '2044', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:25:48', 11);
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2043', '127.0.0.1', '内网IP', '2043', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:25:50', 12);
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2042', '127.0.0.1', '内网IP', '2042', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:25:53', 11);
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2041', '127.0.0.1', '内网IP', '2041', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:25:56', 12);
INSERT INTO `sys_oper_log` VALUES (238, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2040', '127.0.0.1', '内网IP', '2040', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:25:59', 11);
INSERT INTO `sys_oper_log` VALUES (239, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2039', '127.0.0.1', '内网IP', '2039', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:26:02', 9);
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2050', '127.0.0.1', '内网IP', '2050', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:26:09', 11);
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2049', '127.0.0.1', '内网IP', '2049', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:26:11', 11);
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2048', '127.0.0.1', '内网IP', '2048', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:26:14', 11);
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2047', '127.0.0.1', '内网IP', '2047', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:26:17', 11);
INSERT INTO `sys_oper_log` VALUES (244, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2046', '127.0.0.1', '内网IP', '2046', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:26:20', 10);
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 3, 'com.grading.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '党政办公室', '/system/menu/2045', '127.0.0.1', '内网IP', '2045', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:26:23', 10);
INSERT INTO `sys_oper_log` VALUES (246, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-14 13:28:05\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2006,2007,2015,2016,2017,2002,2004,2005,2012,2013],\"params\":{},\"roleId\":100,\"roleKey\":\"parents\",\"roleName\":\"家长\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:37:44', 31);
INSERT INTO `sys_oper_log` VALUES (247, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-18 07:59:24\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2008,2009,2018,2019,2020,2001,2006,2007,2015,2016,2017,2002,2004,2005,2012,2013,2003,2010,2011],\"params\":{},\"roleId\":103,\"roleKey\":\"principal\",\"roleName\":\"园长\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:37:55', 20);
INSERT INTO `sys_oper_log` VALUES (248, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-14 13:28:48\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2003,2010,2011],\"params\":{},\"roleId\":101,\"roleKey\":\"expert\",\"roleName\":\"专家\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:38:08', 16);
INSERT INTO `sys_oper_log` VALUES (249, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-18 08:10:58\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2009,2001,2006,2007,2015,2016,2017,2002,2004,2005,2012,2013],\"params\":{},\"roleId\":107,\"roleKey\":\"childteacher\",\"roleName\":\"保教老师\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:38:49', 30);
INSERT INTO `sys_oper_log` VALUES (250, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-18 07:59:59\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2008,2009,2018,2019,2020,2001,2006,2007,2015,2016,2017,2002,2004,2005,2012,2013,2003,2010,2011],\"params\":{},\"roleId\":104,\"roleKey\":\"department\",\"roleName\":\"部长\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:38:59', 17);
INSERT INTO `sys_oper_log` VALUES (251, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-14 13:29:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2008,2009,2018,2019,2020,2001,2006,2007,2015,2016,2017,2002,2004,2005,2012,2013],\"params\":{},\"roleId\":102,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:39:07', 23);
INSERT INTO `sys_oper_log` VALUES (252, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-18 08:00:39\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2008,2009,2020,2001,2006,2007,2015,2016,2017],\"params\":{},\"roleId\":105,\"roleKey\":\"classer\",\"roleName\":\"班组长\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:39:23', 22);
INSERT INTO `sys_oper_log` VALUES (253, '角色管理', 2, 'com.grading.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '党政办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-14 13:29:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2008,2009,2020,2001,2006,2007,2015,2016,2017,2002,2004,2005,2012,2013],\"params\":{},\"roleId\":102,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 07:39:39', 20);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'teacher', '教师', 1, '0', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-16 09:22:01', '');
INSERT INTO `sys_post` VALUES (2, 'parents', '家长', 2, '0', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-16 09:22:33', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-04-14 12:35:22', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-04-14 12:35:22', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-04-14 12:35:22', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '2', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-15 00:50:53', '普通角色');
INSERT INTO `sys_role` VALUES (100, '家长', 'parents', 1, '1', 1, 1, '0', '0', 'admin', '2025-04-14 13:28:05', 'admin', '2025-05-06 07:37:44', NULL);
INSERT INTO `sys_role` VALUES (101, '专家', 'expert', 1, '1', 1, 1, '0', '0', 'admin', '2025-04-14 13:28:48', 'admin', '2025-05-06 07:38:08', NULL);
INSERT INTO `sys_role` VALUES (102, '教师', 'teacher', 2, '1', 1, 1, '0', '0', 'admin', '2025-04-14 13:29:08', 'admin', '2025-05-06 07:39:39', NULL);
INSERT INTO `sys_role` VALUES (103, '园长', 'principal', 1, '1', 1, 1, '0', '0', 'admin', '2025-04-18 07:59:24', 'admin', '2025-05-06 07:37:55', NULL);
INSERT INTO `sys_role` VALUES (104, '部长', 'department', 2, '1', 1, 1, '0', '0', 'admin', '2025-04-18 07:59:59', 'admin', '2025-05-06 07:38:59', NULL);
INSERT INTO `sys_role` VALUES (105, '班组长', 'classer', 3, '1', 1, 1, '0', '0', 'admin', '2025-04-18 08:00:39', 'admin', '2025-05-06 07:39:23', NULL);
INSERT INTO `sys_role` VALUES (106, '食堂人员', 'canteen', 5, '1', 1, 1, '0', '0', 'admin', '2025-04-18 08:10:07', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (107, '保教老师', 'childteacher', 2, '1', 1, 1, '0', '0', 'admin', '2025-04-18 08:10:58', 'admin', '2025-05-06 07:38:49', NULL);
INSERT INTO `sys_role` VALUES (108, '保安', 'security', 5, '1', 1, 1, '0', '0', 'admin', '2025-04-18 08:11:37', 'admin', '2025-04-18 08:13:13', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (101, 2003);
INSERT INTO `sys_role_menu` VALUES (101, 2010);
INSERT INTO `sys_role_menu` VALUES (101, 2011);
INSERT INTO `sys_role_menu` VALUES (102, 2000);
INSERT INTO `sys_role_menu` VALUES (102, 2001);
INSERT INTO `sys_role_menu` VALUES (102, 2002);
INSERT INTO `sys_role_menu` VALUES (102, 2004);
INSERT INTO `sys_role_menu` VALUES (102, 2005);
INSERT INTO `sys_role_menu` VALUES (102, 2006);
INSERT INTO `sys_role_menu` VALUES (102, 2007);
INSERT INTO `sys_role_menu` VALUES (102, 2008);
INSERT INTO `sys_role_menu` VALUES (102, 2009);
INSERT INTO `sys_role_menu` VALUES (102, 2012);
INSERT INTO `sys_role_menu` VALUES (102, 2013);
INSERT INTO `sys_role_menu` VALUES (102, 2015);
INSERT INTO `sys_role_menu` VALUES (102, 2016);
INSERT INTO `sys_role_menu` VALUES (102, 2017);
INSERT INTO `sys_role_menu` VALUES (102, 2020);
INSERT INTO `sys_role_menu` VALUES (103, 2000);
INSERT INTO `sys_role_menu` VALUES (103, 2001);
INSERT INTO `sys_role_menu` VALUES (103, 2002);
INSERT INTO `sys_role_menu` VALUES (103, 2003);
INSERT INTO `sys_role_menu` VALUES (103, 2004);
INSERT INTO `sys_role_menu` VALUES (103, 2005);
INSERT INTO `sys_role_menu` VALUES (103, 2006);
INSERT INTO `sys_role_menu` VALUES (103, 2007);
INSERT INTO `sys_role_menu` VALUES (103, 2008);
INSERT INTO `sys_role_menu` VALUES (103, 2009);
INSERT INTO `sys_role_menu` VALUES (103, 2010);
INSERT INTO `sys_role_menu` VALUES (103, 2011);
INSERT INTO `sys_role_menu` VALUES (103, 2012);
INSERT INTO `sys_role_menu` VALUES (103, 2013);
INSERT INTO `sys_role_menu` VALUES (103, 2015);
INSERT INTO `sys_role_menu` VALUES (103, 2016);
INSERT INTO `sys_role_menu` VALUES (103, 2017);
INSERT INTO `sys_role_menu` VALUES (103, 2018);
INSERT INTO `sys_role_menu` VALUES (103, 2019);
INSERT INTO `sys_role_menu` VALUES (103, 2020);
INSERT INTO `sys_role_menu` VALUES (104, 2000);
INSERT INTO `sys_role_menu` VALUES (104, 2001);
INSERT INTO `sys_role_menu` VALUES (104, 2002);
INSERT INTO `sys_role_menu` VALUES (104, 2003);
INSERT INTO `sys_role_menu` VALUES (104, 2004);
INSERT INTO `sys_role_menu` VALUES (104, 2005);
INSERT INTO `sys_role_menu` VALUES (104, 2006);
INSERT INTO `sys_role_menu` VALUES (104, 2007);
INSERT INTO `sys_role_menu` VALUES (104, 2008);
INSERT INTO `sys_role_menu` VALUES (104, 2009);
INSERT INTO `sys_role_menu` VALUES (104, 2010);
INSERT INTO `sys_role_menu` VALUES (104, 2011);
INSERT INTO `sys_role_menu` VALUES (104, 2012);
INSERT INTO `sys_role_menu` VALUES (104, 2013);
INSERT INTO `sys_role_menu` VALUES (104, 2015);
INSERT INTO `sys_role_menu` VALUES (104, 2016);
INSERT INTO `sys_role_menu` VALUES (104, 2017);
INSERT INTO `sys_role_menu` VALUES (104, 2018);
INSERT INTO `sys_role_menu` VALUES (104, 2019);
INSERT INTO `sys_role_menu` VALUES (104, 2020);
INSERT INTO `sys_role_menu` VALUES (105, 2000);
INSERT INTO `sys_role_menu` VALUES (105, 2001);
INSERT INTO `sys_role_menu` VALUES (105, 2006);
INSERT INTO `sys_role_menu` VALUES (105, 2007);
INSERT INTO `sys_role_menu` VALUES (105, 2008);
INSERT INTO `sys_role_menu` VALUES (105, 2009);
INSERT INTO `sys_role_menu` VALUES (105, 2015);
INSERT INTO `sys_role_menu` VALUES (105, 2016);
INSERT INTO `sys_role_menu` VALUES (105, 2017);
INSERT INTO `sys_role_menu` VALUES (105, 2020);
INSERT INTO `sys_role_menu` VALUES (106, 2000);
INSERT INTO `sys_role_menu` VALUES (106, 2018);
INSERT INTO `sys_role_menu` VALUES (107, 2000);
INSERT INTO `sys_role_menu` VALUES (107, 2001);
INSERT INTO `sys_role_menu` VALUES (107, 2002);
INSERT INTO `sys_role_menu` VALUES (107, 2004);
INSERT INTO `sys_role_menu` VALUES (107, 2005);
INSERT INTO `sys_role_menu` VALUES (107, 2006);
INSERT INTO `sys_role_menu` VALUES (107, 2007);
INSERT INTO `sys_role_menu` VALUES (107, 2009);
INSERT INTO `sys_role_menu` VALUES (107, 2012);
INSERT INTO `sys_role_menu` VALUES (107, 2013);
INSERT INTO `sys_role_menu` VALUES (107, 2015);
INSERT INTO `sys_role_menu` VALUES (107, 2016);
INSERT INTO `sys_role_menu` VALUES (107, 2017);
INSERT INTO `sys_role_menu` VALUES (108, 2000);
INSERT INTO `sys_role_menu` VALUES (108, 2019);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-05-06 15:22:09', 'admin', '2025-04-14 12:35:22', '', '2025-05-06 07:22:09', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '张三', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$st0njx/P7tNo82amOmtZcO7z6tPSVo8.vDO.85hTOck6pSe5GI0c2', '0', '0', '127.0.0.1', '2025-04-14 12:35:22', 'admin', '2025-04-14 12:35:22', 'admin', '2025-04-19 08:38:38', '老师');
INSERT INTO `sys_user` VALUES (3, 103, 'lisi', '李四', '00', '66666@qq.com', '13211111111', '0', '', '$2a$10$Ymss0LgPzltNKaZaiXttLe8nAzskC0O6vVgQbcoue/ckF.1/fW0m6', '0', '0', '127.0.0.1', '2025-04-25 20:53:38', 'admin', '2025-04-21 09:07:27', 'admin', '2025-04-25 12:53:37', NULL);
INSERT INTO `sys_user` VALUES (4, 106, 'wangwu', '王五', '00', '12@qq.com', '13111111111', '0', '', '$2a$10$R3iQ/bJg2DT7ECWvNzdVrufp7kPef7tiaRgu1p4Q1WePQF4iytOlG', '0', '0', '', NULL, 'admin', '2025-04-21 10:49:57', 'admin', '2025-04-21 10:51:44', NULL);
INSERT INTO `sys_user` VALUES (5, 104, 'huangliu', '黄六', '00', '', '18500000000', '0', '', '$2a$10$Mszj9gZoWS12pbU4D7/P6.j9ZvkNUFUj1g2SWF2JEAB7GbsgjOMU.', '0', '0', '', NULL, 'admin', '2025-04-21 10:50:54', 'admin', '2025-04-21 10:51:54', NULL);
INSERT INTO `sys_user` VALUES (6, 107, 'jiang7', '江七', '00', '', '', '0', '', '$2a$10$IeGfjgkUrgmsgdc3Hcx45e.oJibWZbxpE3Zv1JJWmNkayBFxT3c7O', '0', '0', '', NULL, 'admin', '2025-04-21 10:52:59', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 1);
INSERT INTO `sys_user_post` VALUES (3, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 102);
INSERT INTO `sys_user_role` VALUES (3, 102);
INSERT INTO `sys_user_role` VALUES (4, 107);
INSERT INTO `sys_user_role` VALUES (5, 106);
INSERT INTO `sys_user_role` VALUES (6, 108);

SET FOREIGN_KEY_CHECKS = 1;
