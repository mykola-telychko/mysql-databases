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
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NOT NULL,
    `position` VARCHAR(255) NOT NULL,
    `department` VARCHAR(255) NOT NULL,
    `salary` VARCHAR(255) NOT NULL,
    `hire_date` DATE NOT NULL,
    `contacts` BIGINT NOT NULL
);
CREATE TABLE `sales`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `date` DATE NOT NULL,
    `client_id` INT NOT NULL,
    `medication_id` INT NOT NULL,
    `qty` INT NOT NULL,
    `amount` DECIMAL(8, 2) NOT NULL,
    `pharmacy_id` INT NOT NULL
);
CREATE TABLE `returns`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `num_return` VARCHAR(255) NOT NULL,
    `date` DATE NOT NULL,
    `client_id` INT NOT NULL,
    `medication_id` INT NOT NULL,
    `qty` INT NOT NULL,
    `reason` TEXT NOT NULL,
    `sale_id` INT NOT NULL
);
CREATE TABLE `discounts`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type_discount` VARCHAR(255) NOT NULL,
    `percent_size` DECIMAL(8, 2) NOT NULL,
    `period` VARCHAR(255) NOT NULL,
    `medication_id` INT NOT NULL,
    `client_id` INT NOT NULL
);
CREATE TABLE `prescriptions`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `doctor_id` INT NOT NULL,
    `patient_id` INT NOT NULL,
    `medication_id` INT NOT NULL,
    `issue_date` DATE NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `pharmacies` ADD CONSTRAINT `pharmacies_manager_id_foreign` FOREIGN KEY(`manager_id`) REFERENCES `employees`(`id`);
ALTER TABLE
    `providers-supliers` ADD CONSTRAINT `providers_supliers_id_foreign` FOREIGN KEY(`id`) REFERENCES `shipments`(`id`);
ALTER TABLE
    `discounts` ADD CONSTRAINT `discounts_medication_id_foreign` FOREIGN KEY(`medication_id`) REFERENCES `medications`(`id`);
ALTER TABLE
    `returns` ADD CONSTRAINT `returns_client_id_foreign` FOREIGN KEY(`client_id`) REFERENCES `сustomers`(`id`);
ALTER TABLE
    `Inventory` ADD CONSTRAINT `inventory_medication_id_foreign` FOREIGN KEY(`medication_id`) REFERENCES `medications`(`id`);
ALTER TABLE
    `sales` ADD CONSTRAINT `sales_pharmacy_id_foreign` FOREIGN KEY(`pharmacy_id`) REFERENCES `pharmacies`(`id`);
ALTER TABLE
    `medications` ADD CONSTRAINT `medications_manufacturer_id_foreign` FOREIGN KEY(`manufacturer_id`) REFERENCES `manufacturer`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_pharmacy_id_foreign` FOREIGN KEY(`pharmacy_id`) REFERENCES `pharmacies`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_id_foreign` FOREIGN KEY(`id`) REFERENCES `order_Items`(`id`);
ALTER TABLE
    `returns` ADD CONSTRAINT `returns_medication_id_foreign` FOREIGN KEY(`medication_id`) REFERENCES `medications`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_client_id_foreign` FOREIGN KEY(`client_id`) REFERENCES `сustomers`(`id`);
ALTER TABLE
    `prescriptions` ADD CONSTRAINT `prescriptions_doctor_id_foreign` FOREIGN KEY(`doctor_id`) REFERENCES `employees`(`id`);
ALTER TABLE
    `sales` ADD CONSTRAINT `sales_medication_id_foreign` FOREIGN KEY(`medication_id`) REFERENCES `medications`(`id`);
ALTER TABLE
    `discounts` ADD CONSTRAINT `discounts_client_id_foreign` FOREIGN KEY(`client_id`) REFERENCES `сustomers`(`id`);
ALTER TABLE
    `prescriptions` ADD CONSTRAINT `prescriptions_patient_id_foreign` FOREIGN KEY(`patient_id`) REFERENCES `сustomers`(`id`);
ALTER TABLE
    `prescriptions` ADD CONSTRAINT `prescriptions_medication_id_foreign` FOREIGN KEY(`medication_id`) REFERENCES `medications`(`id`);
ALTER TABLE
    `sales` ADD CONSTRAINT `sales_client_id_foreign` FOREIGN KEY(`client_id`) REFERENCES `сustomers`(`id`);