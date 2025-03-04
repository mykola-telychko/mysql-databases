CREATE TABLE `medications`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` TEXT NOT NULL,
    `country` TINYTEXT NOT NULL,
    `colision` BIGINT NOT NULL,
    `type_1` BIGINT NOT NULL,
    `type_2` BIGINT NOT NULL
);
CREATE TABLE `providers-supliers`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `phone` BIGINT NOT NULL,
    `datetime` BIGINT NOT NULL
);
CREATE TABLE `manufacturer`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `address` BIGINT NOT NULL,
    `phone` BIGINT NOT NULL
);
CREATE TABLE `pharmacies`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `address` BIGINT NOT NULL,
    `phone` BIGINT NOT NULL,
    `work schedule` BIGINT NOT NULL,
    `store` BIGINT NOT NULL
);
CREATE TABLE `сustomers`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` TEXT NOT NULL,
    `lastname` TEXT NOT NULL,
    `phone` TEXT NOT NULL,
    `address` TEXT NOT NULL,
    `purchase history` TEXT NOT NULL
);
CREATE TABLE `orders`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `date` BIGINT NOT NULL,
    `client` BIGINT NOT NULL,
    `pharmacy` BIGINT NOT NULL,
    `status` BIGINT NOT NULL
);
CREATE TABLE `order_Items`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `detail` BIGINT NOT NULL,
    `name` BIGINT NOT NULL,
    `qty` BIGINT NOT NULL,
    `price` BIGINT NOT NULL
);
CREATE TABLE `shipments`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `date` BIGINT NOT NULL,
    `suplier` BIGINT NOT NULL,
    `qty` BIGINT NOT NULL
);
CREATE TABLE `Inventory`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `qty` BIGINT NOT NULL,
    `date of receipt` BIGINT NOT NULL,
    `expiration date` BIGINT NOT NULL
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