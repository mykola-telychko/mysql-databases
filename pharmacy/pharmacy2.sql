CREATE TABLE `medications`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NOT NULL,
    `colision` TEXT NOT NULL,
    `type_1` VARCHAR(255) NOT NULL,
    `type_2` VARCHAR(255) NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL,
    `expiration_date` DATE NOT NULL,
    `manufacturer_id` BIGINT NOT NULL
);
CREATE TABLE `providers-supliers`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `contact_person` VARCHAR(255) NOT NULL,
    `registration_date` DATETIME NOT NULL
);
CREATE TABLE `manufacturer`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NOT NULL
);
CREATE TABLE `pharmacies`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `work_schedule` VARCHAR(255) NOT NULL,
    `manager_id` INT NOT NULL,
    `type` VARCHAR(255) NOT NULL
);
CREATE TABLE `сustomers`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `registration_date` DATETIME NOT NULL,
    `purchase history` TEXT NOT NULL
);
CREATE TABLE `orders`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `date` DATETIME NOT NULL,
    `client_id` INT NOT NULL,
    `pharmacy_id` INT NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `total_amount` DECIMAL(8, 2) NOT NULL,
    `payment_type` VARCHAR(255) NOT NULL
);
CREATE TABLE `order_Items`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` INT NOT NULL,
    `medication_id` BIGINT NOT NULL,
    `qty` BIGINT NOT NULL,
    `price` BIGINT NOT NULL,
    `detail` BIGINT NOT NULL,
    `name` BIGINT NOT NULL
);
CREATE TABLE `shipments`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `date` DATETIME NOT NULL,
    `supplier_id` INT NOT NULL,
    `qty` INT NOT NULL,
    `total_cost` DECIMAL(8, 2) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `Inventory`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `medication_id` INT NOT NULL,
    `qty` BIGINT NOT NULL,
    `date_of_receipt` DATE NOT NULL,
    `expiration_date` DATE NOT NULL,
    `name` BIGINT NOT NULL
);
CREATE TABLE `employees`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `lastname` BIGINT NOT NULL,
    `position` BIGINT NOT NULL,
    `department` BIGINT NOT NULL
);
CREATE TABLE `sales`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `date` BIGINT NOT NULL,
    `client` BIGINT NOT NULL,
    `product` BIGINT NOT NULL,
    `qty` BIGINT NOT NULL,
    `amount` BIGINT NOT NULL
);
CREATE TABLE `returns`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `num_return` BIGINT NOT NULL,
    `date` BIGINT NOT NULL,
    `client` BIGINT NOT NULL,
    `product` BIGINT NOT NULL,
    `qty` BIGINT NOT NULL,
    `reason` BIGINT NOT NULL
);
CREATE TABLE `discounts`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type_discount` BIGINT NOT NULL,
    `percent_size` BIGINT NOT NULL,
    `period` BIGINT NOT NULL
);
CREATE TABLE `prescriptions`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `doctor` BIGINT NOT NULL,
    `patient` BIGINT NOT NULL,
    `medicine` BIGINT NOT NULL
);
ALTER TABLE
    `pharmacies` ADD CONSTRAINT `pharmacies_manager_id_foreign` FOREIGN KEY(`manager_id`) REFERENCES `employees`(`id`);
ALTER TABLE
    `providers-supliers` ADD CONSTRAINT `providers_supliers_id_foreign` FOREIGN KEY(`id`) REFERENCES `shipments`(`id`);
ALTER TABLE
    `Inventory` ADD CONSTRAINT `inventory_medication_id_foreign` FOREIGN KEY(`medication_id`) REFERENCES `medications`(`id`);
ALTER TABLE
    `medications` ADD CONSTRAINT `medications_manufacturer_id_foreign` FOREIGN KEY(`manufacturer_id`) REFERENCES `manufacturer`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_pharmacy_id_foreign` FOREIGN KEY(`pharmacy_id`) REFERENCES `pharmacies`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_id_foreign` FOREIGN KEY(`id`) REFERENCES `order_Items`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_client_id_foreign` FOREIGN KEY(`client_id`) REFERENCES `сustomers`(`id`);