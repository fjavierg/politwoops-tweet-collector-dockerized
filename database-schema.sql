#INSERT INTO `tweets` (`id`, `user_name`, `politician_id`, `content`, `created`, `modified`, `tweet`, retweeted_id, retweeted_content, retweeted_user_name
DROP TABLE IF EXISTS `tweets`;
CREATE TABLE `tweets` (
	`id` BIGINT UNSIGNED AUTO_INCREMENT,
	`user_name` VARCHAR(64),
	`politician_id` BIGINT,
	`content` VARCHAR(255),
	`deleted` TINYINT(1) NOT NULL DEFAULT 0,
	`created` DATETIME NOT NULL,
	`modified` DATETIME NOT NULL,
	`tweet` TEXT,
	`retweeted_id` BIGINT,
	`retweeted_content` VARCHAR(255),
	`retweeted_user_name` VARCHAR(64),
	PRIMARY KEY(`id`),
	KEY(`user_name`),
	KEY(`deleted`),
	KEY(`created`),
	KEY(`modified`)
) DEFAULT CHARSET=UTF8;
DROP TABLE IF EXISTS `deleted_tweets`;
CREATE TABLE `deleted_tweets` (
	`id` BIGINT UNSIGNED AUTO_INCREMENT,
	`user_name` VARCHAR(64),
	`politician_id` BIGINT,
	`content` VARCHAR(255),
	`deleted` TINYINT(1) NOT NULL DEFAULT 0,
	`created` DATETIME NOT NULL,
	`modified` DATETIME NOT NULL,
	`tweet` TEXT,
	`retweeted_id` BIGINT,
	`retweeted_content` VARCHAR(255),
	`retweeted_user_name` VARCHAR(64),
	PRIMARY KEY(`id`),
	KEY(`user_name`),
	KEY(`deleted`),
	KEY(`created`),
	KEY(`modified`)
) DEFAULT CHARSET=UTF8;
DROP TABLE IF EXISTS `politicians`;
CREATE TABLE `politicians` (
	`id` BIGINT UNSIGNED AUTO_INCREMENT,
	`user_name` VARCHAR(255),
	`twitter_id` BIGINT,
	`status` TINYINT(1) NOT NULL DEFAULT 0,
	`created` DATETIME NOT NULL,
	`modified` DATETIME NOT NULL,
	`comment` TEXT,
	PRIMARY KEY(`id`),
	KEY(`user_name`)
) DEFAULT CHARSET=UTF8;