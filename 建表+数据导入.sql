-- 建表+数据导入
-- 一些暴露出来的问题alter
-- @@sql_mode; -- 导入csv文件时一直出错，故先查看sql导入数据的模式，sql_mode 被设为了 strict 模式, 
-- set sql_mode=''; -- 临时修改sql_mode

CREATE DATABASE demo;  -- 作业在这个数据库完成
USE demo;

-- rating 导入数据
DROP TABLE IF EXISTS rating;
CREATE TABLE `rating`  (
  `userId` INT(11) DEFAULT NULL,
  `movieId` INT(11) DEFAULT NULL,
  `rating` DOUBLE(255, 4) DEFAULT NULL,
  `timestamp` DATETIME(6) DEFAULT NULL,
  `ratingId` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ratingId`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 5356 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/new_ratings.csv' #CSV文件存放路径
INTO TABLE rating  #要将数据导入的表名
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY '\r\n';

SELECT * FROM rating;


-- tag 导入数据 
DROP TABLE IF EXISTS tag;
CREATE TABLE `tag`  (
  `userId` INT(11) DEFAULT NULL,
  `movieId` INT(11) DEFAULT NULL,
  `tag` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `timestamp` DATETIME(6) DEFAULT NULL,
  `tagId` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`tagId`) USING BTREE,
  INDEX `index_tag`(`tag`) USING BTREE,
  INDEX `index_tagId`(`tagId`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 120366 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/new_tags.csv' #CSV文件存放路径
INTO TABLE tag CHARACTER SET gb2312 #要将数据导入的表名
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY '\r\n';

SELECT * FROM tag;


DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `movieId` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `genres` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/new_movies.csv' #CSV文件存放路径
INTO TABLE movie  CHARACTER SET gb2312#要将数据导入的表名
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY '\r\n';  

select * from movie;

 