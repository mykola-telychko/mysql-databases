CREATE TABLE `Baggage`(
    `baggage_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` INT NOT NULL,
    `employee_id` INT NOT NULL,
    `flight_id` INT NOT NULL,
    `checked_in_by` INT NOT NULL,
    `weight` DECIMAL(8, 2) NOT NULL,
    `dimensions` BIGINT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `current_location` VARCHAR(255) NOT NULL
);
CREATE TABLE `BaggageCheckIn`(
    `check_in_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `baggage_id` INT NOT NULL,
    `check_in_time` DATETIME NOT NULL,
    `check_in_counter` VARCHAR(255) NOT NULL
);
CREATE TABLE `BaggageTags`(
    `tag_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Бірки багажу',
    `baggage_id` INT NOT NULL,
    `tag_number` VARCHAR(255) NOT NULL,
    `issue_time` DATETIME NOT NULL
);
CREATE TABLE `BaggageSorting`(
    `sorting_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `baggage_id` INT NOT NULL,
    `sorting_time` DATETIME NOT NULL,
    `destination_zone` VARCHAR(255) NOT NULL
);
CREATE TABLE `BaggageTransport`(
    `transport_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `baggage_id` INT NOT NULL,
    `transport_time` DATETIME NOT NULL,
    `transport_method` VARCHAR(255) NOT NULL
);
CREATE TABLE `BaggageClaim`(
    `claim_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `baggage_id` INT NOT NULL,
    `claim_time` DATETIME NOT NULL,
    `claim_area` VARCHAR(255) NOT NULL
);
CREATE TABLE `LostBaggage`(
    `lost_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `baggage_id` INT NOT NULL,
    `report_time` DATETIME NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `BaggageSearch`(
    `search_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `lost_id` INT NOT NULL,
    `search_start_time` DATETIME NOT NULL,
    `search_end_time` DATETIME NOT NULL,
    `result` VARCHAR(255) NOT NULL
);
CREATE TABLE `BaggageTypes`(
    `type_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type_name` VARCHAR(255) NOT NULL COMMENT 'Назва типу (наприклад, ручна поклажа, валіза, спортивне обладнання)',
    `max_weight` DECIMAL(8, 2) NOT NULL,
    `max_dimensions` VARCHAR(255) NOT NULL
);
CREATE TABLE `BaggageFees`(
    `fee_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type_id` INT NOT NULL,
    `fee_amount` DECIMAL(8, 2) NOT NULL,
    `effective_date` DATE NOT NULL
);