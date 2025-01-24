CREATE TABLE `payments`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `date` BIGINT NOT NULL,
    `amount` BIGINT NOT NULL,
    `date` BIGINT NOT NULL,
    `payment_method` BIGINT NOT NULL,
    `currency` BIGINT NOT NULL
);
CREATE TABLE `invoices`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `invoice_code` BIGINT NOT NULL,
    `date` BIGINT NOT NULL,
    `amount` BIGINT NOT NULL,
    `status` BIGINT NOT NULL
);
CREATE TABLE `revenue_streams`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `example` BIGINT NOT NULL,
    `date` BIGINT NOT NULL,
    `ticket sales` BIGINT NOT NULL,
    `rental of premises` BIGINT NOT NULL COMMENT 'оренда приміщень',
    `parking` BIGINT NOT NULL
);
CREATE TABLE `fees`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger fees` BIGINT NOT NULL,
    `baggage fees` BIGINT NOT NULL
);
CREATE TABLE `expenses`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `amount` BIGINT NOT NULL,
    `date` BIGINT NOT NULL,
    `category` BIGINT NOT NULL,
    `expense_category` BIGINT NOT NULL,
    `delivery` BIGINT NOT NULL
);
CREATE TABLE `expenses_categories`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `salary` BIGINT NOT NULL,
    `rent` BIGINT NOT NULL,
    `utilities` BIGINT NOT NULL COMMENT 'комуналка',
    `fuel` BIGINT NOT NULL,
    `etc` BIGINT NOT NULL
);
CREATE TABLE `contracts`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `contract number` BIGINT NOT NULL,
    `dateconclusion` BIGINT NOT NULL,
    `amount` BIGINT NOT NULL
);
CREATE TABLE `assets`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `real estate` BIGINT NOT NULL,
    `equipment` BIGINT NOT NULL,
    `investments` BIGINT NOT NULL
);
CREATE TABLE `liabilities`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `credits` BIGINT NOT NULL,
    `debts to suppliers` BIGINT NOT NULL
);
CREATE TABLE `currencies`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE `discounts`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE `prices_policy`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);