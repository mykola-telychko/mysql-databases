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
CREATE TABLE `Flights`(
    `flight_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `airline_id` INT NOT NULL,
    `aircraft_id` INT NOT NULL,
    `departure_airport` VARCHAR(255) NOT NULL,
    `arrival_airport` VARCHAR(255) NOT NULL,
    `departure_time` DATETIME NOT NULL,
    `arrival_time` DATETIME NOT NULL
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
ALTER TABLE
    `Flights` ADD CONSTRAINT `flights_airline_id_foreign` FOREIGN KEY(`airline_id`) REFERENCES `Airlines`(`airline_id`);
ALTER TABLE
    `Aircrafts` ADD CONSTRAINT `aircrafts_airline_id_foreign` FOREIGN KEY(`airline_id`) REFERENCES `Airlines`(`airline_id`);
ALTER TABLE
    `Flights` ADD CONSTRAINT `flights_aircraft_id_foreign` FOREIGN KEY(`aircraft_id`) REFERENCES `Aircrafts`(`aircraft_id`);
ALTER TABLE
    `Tickets` ADD CONSTRAINT `tickets_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `Passengers`(`passenger_id`);
ALTER TABLE
    `Agreements` ADD CONSTRAINT `agreements_airline_id_foreign` FOREIGN KEY(`airline_id`) REFERENCES `Airlines`(`airline_id`);
ALTER TABLE
    `MaintenanceRecords` ADD CONSTRAINT `maintenancerecords_service_id_foreign` FOREIGN KEY(`service_id`) REFERENCES `MaintenanceServices`(`service_id`);
ALTER TABLE
    `Aircrafts` ADD CONSTRAINT `aircrafts_manufacturer_id_foreign` FOREIGN KEY(`manufacturer_id`) REFERENCES `Manufacturers`(`manufacturer_id`);
ALTER TABLE
    `Tickets` ADD CONSTRAINT `tickets_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `Flights`(`flight_id`);
ALTER TABLE
    `MaintenanceRecords` ADD CONSTRAINT `maintenancerecords_aircraft_id_foreign` FOREIGN KEY(`aircraft_id`) REFERENCES `Aircrafts`(`aircraft_id`);
ALTER TABLE
    `Schedules` ADD CONSTRAINT `schedules_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `Flights`(`flight_id`);