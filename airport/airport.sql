CREATE TABLE `flights_05_25`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `new_column` BIGINT NOT NULL,
    `status` TEXT NOT NULL COMMENT 'gate open / on time / canceled / boarding / delayed',
    `plane` TEXT NOT NULL,
    `start` DATETIME NOT NULL,
    `end` DATETIME NOT NULL,
    `during` INT NOT NULL,
    `from` TEXT NOT NULL,
    `to` TEXT NOT NULL
);
CREATE TABLE `fast_flight_updates`(
    `id_flight` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `status` BIGINT NOT NULL
);
CREATE TABLE `passangers`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` TEXT NOT NULL,
    `phone` TEXT NOT NULL,
    `passport` TEXT NOT NULL,
    `ticket` TEXT NOT NULL,
    `history` TEXT NOT NULL
);
CREATE TABLE `planes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_airlines` BIGINT NOT NULL,
    `name` TEXT NOT NULL,
    `allow` TINYINT NOT NULL,
    `status_check` BIGINT NOT NULL,
    `status_plan` TEXT NOT NULL
);
CREATE TABLE `airlines`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `phone` BIGINT NOT NULL,
    `address` TEXT NOT NULL,
    `country` TEXT NOT NULL,
    `comments` LONGTEXT NOT NULL
);