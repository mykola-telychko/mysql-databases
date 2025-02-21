CREATE TABLE `payments`(
    `payment_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `amount` BIGINT NOT NULL,
    `date` BIGINT NOT NULL,
    `currency_id` BIGINT NOT NULL,
    `booking_id` BIGINT NOT NULL,
    `invoice_id` BIGINT NOT NULL
);
CREATE TABLE `invoices`(
    `invoice_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `invoice_number` VARCHAR(255) NOT NULL,
    `issue_date` DATE NOT NULL,
    `total_amount` BIGINT NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `revenue_streams`(
    `revenue_stream_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `description` BIGINT NOT NULL
);
CREATE TABLE `fees`(
    `fee_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `amount` BIGINT NOT NULL,
    `currency_id` BIGINT NOT NULL
);
CREATE TABLE `expenses`(
    `expense_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `amount` BIGINT NOT NULL,
    `date` BIGINT NOT NULL,
    `category_id` BIGINT NOT NULL,
    `contract_id` BIGINT NOT NULL
);
CREATE TABLE `expenses_categories`(
    `category_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL COMMENT 'комуналка зп аренда'
);
CREATE TABLE `contracts`(
    `contract_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `contract_number` BIGINT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `total_amount` BIGINT NOT NULL
);
CREATE TABLE `assets`(
    `asset_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL COMMENT 'terminalA terminalB',
    `type` BIGINT NOT NULL,
    `value` BIGINT NOT NULL
);
CREATE TABLE `liabilities`(
    `liability_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `amount` BIGINT NOT NULL,
    `due_date` DATE NOT NULL
);
CREATE TABLE `currencies`(
    `currencies_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `exchange_rate` FLOAT(53) NOT NULL
);
CREATE TABLE `discounts`(
    `discount_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type` ENUM('(student', 'group)') NOT NULL,
    `amount` FLOAT(53) NOT NULL,
    `conditions` VARCHAR(255) NOT NULL
);
CREATE TABLE `prices_policy`(
    `policy_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `base_price` BIGINT NOT NULL,
    `seasonal_multiplier` BIGINT NOT NULL,
    `effective_date` DATE NOT NULL
);
CREATE TABLE `flights`(
    `flight_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_number` BIGINT NOT NULL,
    `airline` VARCHAR(255) NOT NULL,
    `route` VARCHAR(255) NOT NULL,
    `date` DATE NOT NULL
);
CREATE TABLE `bookings`(
    `booking_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` BIGINT NOT NULL,
    `flight_id` BIGINT NOT NULL,
    `booking_date` DATE NOT NULL
);
CREATE TABLE `table_15`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
ALTER TABLE
    `fees` ADD CONSTRAINT `fees_currency_id_foreign` FOREIGN KEY(`currency_id`) REFERENCES `currencies`(`currencies_id`);
ALTER TABLE
    `expenses` ADD CONSTRAINT `expenses_contract_id_foreign` FOREIGN KEY(`contract_id`) REFERENCES `contracts`(`contract_id`);
ALTER TABLE
    `expenses` ADD CONSTRAINT `expenses_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `expenses_categories`(`category_id`);
ALTER TABLE
    `payments` ADD CONSTRAINT `payments_booking_id_foreign` FOREIGN KEY(`booking_id`) REFERENCES `bookings`(`booking_id`);
ALTER TABLE
    `payments` ADD CONSTRAINT `payments_invoice_id_foreign` FOREIGN KEY(`invoice_id`) REFERENCES `invoices`(`invoice_id`);
ALTER TABLE
    `payments` ADD CONSTRAINT `payments_currency_id_foreign` FOREIGN KEY(`currency_id`) REFERENCES `currencies`(`currencies_id`);