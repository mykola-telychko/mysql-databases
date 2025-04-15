CREATE TABLE `Airlines`(
    `airline_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NOT NULL,
    `contact_info` VARCHAR(255) NOT NULL
);
CREATE TABLE `Aircrafts`(
    `aircraft_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `model` VARCHAR(255) NOT NULL,
    `manufacturer_id` INT NOT NULL,
    `airline_id` INT NOT NULL,
    `registration_number` VARCHAR(255) NOT NULL,
    `capacity` INT NOT NULL
);
CREATE TABLE `Manufacturers`(
    `manufacturer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NOT NULL,
    `contact_info` VARCHAR(255) NOT NULL
);
CREATE TABLE `MaintenanceServices`(
    `service_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `contact_info` VARCHAR(255) NOT NULL
);
CREATE TABLE `Agreements`(
    `agreement_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `airline_id` INT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `terms` TEXT NOT NULL
);

CREATE TABLE `Schedules`(
    `schedule_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_id` INT NOT NULL,
    `day_of_week` VARCHAR(255) NOT NULL,
    `frequency` VARCHAR(255) NOT NULL
);
CREATE TABLE `MaintenanceRecords`(
    `record_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `aircraft_id` BIGINT NOT NULL,
    `service_id` INT NOT NULL,
    `maintenance_date` DATE NOT NULL,
    `description` TEXT NOT NULL,
    `cost` DECIMAL(8, 2) NOT NULL
);
CREATE TABLE `Pilots`(
    `pilot_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `license_number` VARCHAR(255) NOT NULL,
    `airline_id` INT NOT NULL
);
CREATE TABLE `CrewMembers`(
    `crew_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `role` VARCHAR(255) NOT NULL,
    `airline_id` INT NOT NULL
);
CREATE TABLE `Passengers`(
    `passenger_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `contact_info` VARCHAR(255) NOT NULL,
    `frequent_flyer_number` VARCHAR(255) NOT NULL
);
CREATE TABLE `Tickets`(
    `ticket_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_id` INT NOT NULL,
    `passenger_id` INT NOT NULL,
    `seat_number` VARCHAR(255) NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL
);
CREATE TABLE `Airports`(
    `airport_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NOT NULL
);
CREATE TABLE `FlightLogs`(
    `log_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_id` INT NOT NULL,
    `log_date` DATETIME NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `notes` TEXT NOT NULL
);
CREATE TABLE `SpareParts`(
    `part_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `manufacturer_id` INT NOT NULL,
    `cost` INT NOT NULL,
    `quantity_in_stock` INT NOT NULL
);