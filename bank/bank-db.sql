CREATE TABLE `clients`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` TEXT NOT NULL,
    `last_name` TEXT NOT NULL,
    `birth_date` DATETIME NOT NULL,
    `address` TEXT NOT NULL,
    `phone_number` BIGINT NOT NULL,
    `email` BIGINT NOT NULL,
    `account_number` BIGINT NOT NULL
);
CREATE TABLE `accounts`(
    `account_number` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `account_type` BIGINT NOT NULL COMMENT '(депозитний, розрахунковий, кредитний)',
    `balance` BIGINT NOT NULL,
    `currency` BIGINT NOT NULL,
    `open_date` BIGINT NOT NULL,
    `closed_date` BIGINT NOT NULL,
    `client_id` BIGINT NOT NULL
);
CREATE TABLE `transactions`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `account_number` BIGINT NOT NULL,
    `transaction_type` BIGINT NOT NULL COMMENT '(депозит, зняття, переказ)',
    `amount` BIGINT NOT NULL,
    `transaction_date` BIGINT NOT NULL,
    `description` BIGINT NOT NULL
);
CREATE TABLE `cards`(
    `card_number` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'use card or card id',
    `account_number` BIGINT NOT NULL,
    `card_type` BIGINT NOT NULL,
    `expiration_date` BIGINT NOT NULL,
    `cvv` BIGINT NOT NULL,
    `status` BIGINT NOT NULL COMMENT '(active/blocked)'
);
CREATE TABLE `loans_credits`(
    `loan_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `account_number` BIGINT NOT NULL,
    `loan_amount` BIGINT NOT NULL,
    `interest_rate` BIGINT NOT NULL,
    `start_date` BIGINT NOT NULL,
    `end_date` BIGINT NOT NULL,
    `monthly_payment` BIGINT NOT NULL
);
ALTER TABLE
    `clients` ADD CONSTRAINT `clients_account_number_foreign` FOREIGN KEY(`account_number`) REFERENCES `accounts`(`account_number`);
ALTER TABLE
    `transactions` ADD CONSTRAINT `transactions_account_number_foreign` FOREIGN KEY(`account_number`) REFERENCES `accounts`(`account_number`);
ALTER TABLE
    `loans_credits` ADD CONSTRAINT `loans_credits_account_number_foreign` FOREIGN KEY(`account_number`) REFERENCES `accounts`(`account_number`);