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
CREATE TABLE `deposits`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `account_number` BIGINT NOT NULL,
    `deposit_amount` BIGINT NOT NULL,
    `interest_rate` BIGINT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL
);
CREATE TABLE `employees`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` TEXT NOT NULL,
    `last_name` TEXT NOT NULL,
    `position` TEXT NOT NULL,
    `department` TEXT NOT NULL,
    `hire_date` DATETIME NOT NULL
);
CREATE TABLE `branches`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `branch_name` TEXT NOT NULL,
    `address` TEXT NOT NULL,
    `phone_number` BIGINT NOT NULL
);
CREATE TABLE `departments`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `department_name` BIGINT NOT NULL,
    `branch_id` BIGINT NOT NULL
);
CREATE TABLE `products`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_name` TEXT NOT NULL,
    `product_type` TEXT NOT NULL COMMENT '(депозит, кредит, картка)',
    `description` TEXT NOT NULL
);
CREATE TABLE `tarifs`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT NOT NULL,
    `fee` BIGINT NOT NULL,
    `description` BIGINT NOT NULL
);
CREATE TABLE `currencies`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `currency_code` BIGINT NOT NULL,
    `currency_name` BIGINT NOT NULL
);
CREATE TABLE `users`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` BIGINT NOT NULL,
    `password` BIGINT NOT NULL,
    `role` BIGINT NOT NULL COMMENT '(адміністратор, касир, менеджер)'
);
CREATE TABLE `log_operation`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `action` TEXT NOT NULL,
    `timestamp` DATETIME NOT NULL
);
CREATE TABLE `counterparties`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `counterparty_name` TEXT NOT NULL,
    `address` TEXT NOT NULL,
    `phone_number` BIGINT NOT NULL
);
ALTER TABLE
    `clients` ADD CONSTRAINT `clients_account_number_foreign` FOREIGN KEY(`account_number`) REFERENCES `accounts`(`account_number`);
ALTER TABLE
    `tarifs` ADD CONSTRAINT `tarifs_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `products`(`id`);
ALTER TABLE
    `transactions` ADD CONSTRAINT `transactions_account_number_foreign` FOREIGN KEY(`account_number`) REFERENCES `accounts`(`account_number`);
ALTER TABLE
    `loans_credits` ADD CONSTRAINT `loans_credits_account_number_foreign` FOREIGN KEY(`account_number`) REFERENCES `accounts`(`account_number`);
ALTER TABLE
    `deposits` ADD CONSTRAINT `deposits_account_number_foreign` FOREIGN KEY(`account_number`) REFERENCES `accounts`(`account_number`);
ALTER TABLE
    `departments` ADD CONSTRAINT `departments_branch_id_foreign` FOREIGN KEY(`branch_id`) REFERENCES `branches`(`id`);
ALTER TABLE
    `log_operation` ADD CONSTRAINT `log_operation_id_foreign` FOREIGN KEY(`id`) REFERENCES `users`(`id`);