CREATE TABLE `passengers`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` BIGINT NOT NULL,
    `last_name` BIGINT NOT NULL,
    `passport_number` BIGINT NOT NULL,
    `birthday` BIGINT NOT NULL COMMENT 'day of birth',
    `nationality` BIGINT NOT NULL,
    `contact_info` BIGINT NOT NULL
);
CREATE TABLE `flights`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_number` BIGINT NOT NULL,
    `airline` BIGINT NOT NULL,
    `departure_airport` BIGINT NOT NULL,
    `arrival_airport` BIGINT NOT NULL,
    `departure_time` BIGINT NOT NULL,
    `arrival_time` BIGINT NOT NULL,
    `status` ENUM(
        'ENUM(' Scheduled '',
        '' DELAYED '',
        '' Cancelled '',
        '' Departed '',
        '' Arrived ')'
    ) NOT NULL
);
CREATE TABLE `tickets`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` BIGINT NOT NULL,
    `flight_id` BIGINT NOT NULL,
    `seat_number` BIGINT NOT NULL,
    `class` ENUM('ENUM(' Economy '', '' Business '', '' FIRST ')') NOT NULL,
    `price` BIGINT NOT NULL
);
CREATE TABLE `baggage`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ticket_id` BIGINT NOT NULL,
    `weight` BIGINT NOT NULL,
    `status` ENUM(
        'ENUM(' Checked - IN '',
        '' Loaded '',
        '' Unloaded '',
        '' Claimed ')'
    ) NOT NULL
);
CREATE TABLE `luggage_storage`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` BIGINT NOT NULL,
    `locker_number` BIGINT NOT NULL,
    `start_time` DATE NOT NULL,
    `end_time` DATE NOT NULL,
    `price` BIGINT NOT NULL
);
CREATE TABLE `security_staff`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` BIGINT NOT NULL,
    `last_name` BIGINT NOT NULL,
    `badge_number` BIGINT NOT NULL,
    `position` BIGINT NOT NULL
);
CREATE TABLE `security_checks`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` BIGINT NOT NULL,
    `security_staff_id` BIGINT NOT NULL,
    `check_time` BIGINT NOT NULL,
    `status` ENUM('ENUM(' Passed '', '' Failed ')') NOT NULL
);
CREATE TABLE `boarding_passes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ticket_id` BIGINT NOT NULL,
    `boarding_gate` BIGINT NOT NULL,
    `boarding_time` BIGINT NOT NULL
);
CREATE TABLE `gates`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `gate_number` BIGINT NOT NULL,
    `status` ENUM(
        'ENUM(' OPEN '',
        '' Closed '',
        '' Maintenance ')'
    ) NOT NULL
);
CREATE TABLE `employees`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` BIGINT NOT NULL,
    `last_name` BIGINT NOT NULL,
    `position` BIGINT NOT NULL
);
CREATE TABLE `aircrafts`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `aircraft_model` BIGINT NOT NULL,
    `capacity` BIGINT NOT NULL,
    `airline` BIGINT NOT NULL
);
CREATE TABLE `crew_members`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_id` BIGINT NOT NULL,
    `employee_id` BIGINT NOT NULL
);
CREATE TABLE `delays`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_id` BIGINT NOT NULL,
    `reason` TEXT NOT NULL,
    `new_departure_time` DATETIME NOT NULL
);
CREATE TABLE `maintenance`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `aircraft_id` BIGINT NOT NULL,
    `maintenance_date` BIGINT NOT NULL,
    `status` ENUM(
        'ENUM(' Scheduled '',
        '' Completed '',
        '' IN Progress ')'
    ) NOT NULL
);
CREATE TABLE `transactions`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` BIGINT NOT NULL,
    `amount` BIGINT NOT NULL,
    `description` TEXT NOT NULL
);
ALTER TABLE
    `crew_members` ADD CONSTRAINT `crew_members_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employees`(`id`);
ALTER TABLE
    `tickets` ADD CONSTRAINT `tickets_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `flights`(`id`);
ALTER TABLE
    `luggage_storage` ADD CONSTRAINT `luggage_storage_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `passengers`(`id`);
ALTER TABLE
    `maintenance` ADD CONSTRAINT `maintenance_aircraft_id_foreign` FOREIGN KEY(`aircraft_id`) REFERENCES `aircrafts`(`id`);
ALTER TABLE
    `tickets` ADD CONSTRAINT `tickets_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `passengers`(`id`);
ALTER TABLE
    `baggage` ADD CONSTRAINT `baggage_id_foreign` FOREIGN KEY(`id`) REFERENCES `tickets`(`id`);
ALTER TABLE
    `flights` ADD CONSTRAINT `flights_id_foreign` FOREIGN KEY(`id`) REFERENCES `crew_members`(`id`);
ALTER TABLE
    `transactions` ADD CONSTRAINT `transactions_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `passengers`(`id`);
ALTER TABLE
    `delays` ADD CONSTRAINT `delays_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `flights`(`id`);
ALTER TABLE
    `security_checks` ADD CONSTRAINT `security_checks_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `passengers`(`id`);
ALTER TABLE
    `security_checks` ADD CONSTRAINT `security_checks_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `security_staff`(`id`);
ALTER TABLE
    `boarding_passes` ADD CONSTRAINT `boarding_passes_id_foreign` FOREIGN KEY(`id`) REFERENCES `tickets`(`id`);