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
    `transport_method` VARCHAR(255) NOT NULL,
    `equip_id` INT NOT NULL
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
    `max_dimensions` VARCHAR(255) NOT NULL,
    `baggage_type_id` INT NOT NULL
);
CREATE TABLE `BaggageFees`(
    `fee_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `baggage_type_id` INT NOT NULL,
    `weight_limit` BIGINT NOT NULL,
    `price` BIGINT NOT NULL,
    `fee_amount` DECIMAL(8, 2) NOT NULL,
    `effective_date` DATE NOT NULL
);
CREATE TABLE `BaggageHandlingEvents`(
    `event_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `baggage_id` INT NOT NULL,
    `event_type` VARCHAR(255) NOT NULL COMMENT '(Тип події: реєстрація, завантаження, розвантаження, доставка, втрата)',
    `timestamp` DATETIME NOT NULL,
    `location` TEXT NOT NULL,
    `equip_id` BIGINT NOT NULL
);
CREATE TABLE `BaggageInspection`(
    `inspection_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `baggage_id` INT NOT NULL,
    `inspection_time` DATETIME NOT NULL,
    `result` VARCHAR(255) NOT NULL
);
CREATE TABLE `BaggageStorage`(
    `storage_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `baggage_id` INT NOT NULL,
    `storage_start` DATETIME NOT NULL,
    `storage_end` DATETIME NOT NULL,
    `storage_location` VARCHAR(255) NOT NULL
);
CREATE TABLE `BaggageClaimsLog`(
    `claim_log_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Логи претензій щодо багажу',
    `baggage_id` INT NOT NULL,
    `claim_description` TEXT NOT NULL,
    `claim_time` DATETIME NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `passenger_id` INT NOT NULL
);
CREATE TABLE `BaggageHandlingEquipment`(
    `equipment_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `equipment_type` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `BaggageTags` ADD CONSTRAINT `baggagetags_baggage_id_foreign` FOREIGN KEY(`baggage_id`) REFERENCES `Baggage`(`baggage_id`);
ALTER TABLE
    `BaggageHandlingEvents` ADD CONSTRAINT `baggagehandlingevents_baggage_id_foreign` FOREIGN KEY(`baggage_id`) REFERENCES `Baggage`(`baggage_id`);
ALTER TABLE
    `BaggageHandlingEvents` ADD CONSTRAINT `baggagehandlingevents_equip_id_foreign` FOREIGN KEY(`equip_id`) REFERENCES `BaggageHandlingEquipment`(`equipment_id`);
ALTER TABLE
    `BaggageInspection` ADD CONSTRAINT `baggageinspection_baggage_id_foreign` FOREIGN KEY(`baggage_id`) REFERENCES `Baggage`(`baggage_id`);
ALTER TABLE
    `BaggageTransport` ADD CONSTRAINT `baggagetransport_baggage_id_foreign` FOREIGN KEY(`baggage_id`) REFERENCES `Baggage`(`baggage_id`);
ALTER TABLE
    `Baggage` ADD CONSTRAINT `baggage_type_foreign` FOREIGN KEY(`type`) REFERENCES `BaggageTypes`(`type_id`);
ALTER TABLE
    `BaggageTransport` ADD CONSTRAINT `baggagetransport_equip_id_foreign` FOREIGN KEY(`equip_id`) REFERENCES `BaggageHandlingEquipment`(`equipment_id`);
ALTER TABLE
    `LostBaggage` ADD CONSTRAINT `lostbaggage_baggage_id_foreign` FOREIGN KEY(`baggage_id`) REFERENCES `Baggage`(`baggage_id`);
ALTER TABLE
    `BaggageSearch` ADD CONSTRAINT `baggagesearch_lost_id_foreign` FOREIGN KEY(`lost_id`) REFERENCES `LostBaggage`(`lost_id`);
ALTER TABLE
    `BaggageStorage` ADD CONSTRAINT `baggagestorage_baggage_id_foreign` FOREIGN KEY(`baggage_id`) REFERENCES `Baggage`(`baggage_id`);
ALTER TABLE
    `BaggageCheckIn` ADD CONSTRAINT `baggagecheckin_check_in_id_foreign` FOREIGN KEY(`check_in_id`) REFERENCES `Baggage`(`baggage_id`);
ALTER TABLE
    `BaggageClaimsLog` ADD CONSTRAINT `baggageclaimslog_baggage_id_foreign` FOREIGN KEY(`baggage_id`) REFERENCES `Baggage`(`baggage_id`);
ALTER TABLE
    `BaggageClaim` ADD CONSTRAINT `baggageclaim_baggage_id_foreign` FOREIGN KEY(`baggage_id`) REFERENCES `Baggage`(`baggage_id`);
ALTER TABLE
    `BaggageFees` ADD CONSTRAINT `baggagefees_baggage_type_id_foreign` FOREIGN KEY(`baggage_type_id`) REFERENCES `BaggageTypes`(`type_id`);