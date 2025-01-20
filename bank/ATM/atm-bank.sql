CREATE TABLE `users`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `surename` BIGINT NOT NULL,
    `count_number` BIGINT NOT NULL,
    `pincode` BIGINT NOT NULL COMMENT 'hash',
    `birthday` BIGINT NOT NULL,
    `contacts` BIGINT NOT NULL
);
CREATE TABLE `accounts`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type` BIGINT NOT NULL COMMENT '(deposit, credit)',
    `balance` BIGINT NOT NULL,
    `startdate` BIGINT NOT NULL,
    `userid` BIGINT NOT NULL
);
CREATE TABLE `cards`(
    `id_card` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `card_number` BIGINT NOT NULL,
    `startdate` DATETIME NOT NULL,
    `enddate` DATETIME NOT NULL,
    `cvv` BIGINT NOT NULL,
    `status` BIGINT NOT NULL COMMENT '(active, blocked)',
    `id_account` BIGINT NOT NULL
);
CREATE TABLE `transactions`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type` BIGINT NOT NULL COMMENT '(cash withdrawal, top-up, transfer)',
    `amount_sum` BIGINT NOT NULL,
    `datetime` BIGINT NOT NULL,
    `id_account` BIGINT NOT NULL,
    `id_atm` BIGINT NOT NULL,
    `status` BIGINT NOT NULL COMMENT '(success, declined)'
);
CREATE TABLE `atms`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `address` TEXT NOT NULL,
    `status` TEXT NOT NULL COMMENT '(active, inactive)',
    `last service` DATETIME NOT NULL
);
CREATE TABLE `fees`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type` TEXT NOT NULL COMMENT '(cash withdrawal, transfer)',
    `amount` BIGINT NOT NULL,
    `currency` BIGINT NOT NULL
);
CREATE TABLE `currencies`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `code` BIGINT NOT NULL COMMENT '(EU,USD,JY)',
    `exchange_rate` BIGINT NOT NULL
);
CREATE TABLE `logs`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `datetime` BIGINT NOT NULL,
    `action` BIGINT NOT NULL COMMENT '(login, cash withdrawal, error)',
    `details` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `bank_id` BIGINT NOT NULL
);
CREATE TABLE `configs`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `params` BIGINT NOT NULL,
    `value` BIGINT NOT NULL
);
CREATE TABLE `error`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `datetime` BIGINT NOT NULL,
    `code_error` BIGINT NOT NULL,
    `describe` BIGINT NOT NULL,
    `atm_id` BIGINT NOT NULL
);
CREATE TABLE `products`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `describe` BIGINT NOT NULL
);
CREATE TABLE `services`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `describe` BIGINT NOT NULL
);
CREATE TABLE `campaigns`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `period` BIGINT NOT NULL,
    `condition` BIGINT NOT NULL
);
CREATE TABLE `UserProducts`(
    `user_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `prod_serv_id` BIGINT NOT NULL
);
CREATE TABLE `limits`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type` BIGINT NOT NULL COMMENT '(daily, monthly)',
    `amount` BIGINT NOT NULL,
    `id_account` BIGINT NOT NULL
);
ALTER TABLE
    `cards` ADD CONSTRAINT `cards_id_account_foreign` FOREIGN KEY(`id_account`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `UserProducts` ADD CONSTRAINT `userproducts_prod_serv_id_foreign` FOREIGN KEY(`prod_serv_id`) REFERENCES `services`(`id`);
ALTER TABLE
    `UserProducts` ADD CONSTRAINT `userproducts_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `UserProducts` ADD CONSTRAINT `userproducts_prod_serv_id_foreign` FOREIGN KEY(`prod_serv_id`) REFERENCES `products`(`id`);