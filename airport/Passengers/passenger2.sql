CREATE TABLE `Passengers`(
    `passenger_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `passport_number` BIGINT NOT NULL,
    `nationality` VARCHAR(255) NOT NULL,
    `date_of_birth` DATETIME NOT NULL,
    `gender` VARCHAR(255) NOT NULL,
    `contact_number` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `frequent_flyer_number` VARCHAR(255) NOT NULL,
    `ip` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL
);
CREATE TABLE `Flights`(
    `flight_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_number` VARCHAR(255) NOT NULL,
    `departure_airport` VARCHAR(255) NOT NULL,
    `arrival_airport` VARCHAR(255) NOT NULL,
    `departure_time` DATETIME NOT NULL,
    `arrival_time` DATETIME NOT NULL,
    `aircraft_type` VARCHAR(255) NOT NULL,
    `airline` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `Tickets`(
    `ticket_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` INT NOT NULL,
    `flight_id` INT NOT NULL,
    `seat_number` VARCHAR(255) NOT NULL,
    `ticket_class` VARCHAR(255) NOT NULL,
    `purchase_date` DATETIME NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `CheckIn`(
    `check_in_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` INT NOT NULL,
    `flight_id` INT NOT NULL,
    `check_in_time` DATETIME NOT NULL,
    `check_in_counter` VARCHAR(255) NOT NULL,
    `baggage_count` INT NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `PassportControl`(
    `control_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` INT NOT NULL,
    `flight_id` INT NOT NULL,
    `control_time` DATETIME NOT NULL,
    `officer_name` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `CustomsControl`(
    `customs_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` INT NOT NULL,
    `flight_id` INT NOT NULL,
    `control_time` DATETIME NOT NULL,
    `officer_name` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL COMMENT '(наприклад, успішно, відмовлено)'
);
CREATE TABLE `SecurityCheck`(
    `security_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` INT NOT NULL,
    `flight_id` INT NOT NULL,
    `check_time` DATETIME NOT NULL,
    `officer_name` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `Boarding`(
    `boarding_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` INT NOT NULL,
    `flight_id` INT NOT NULL,
    `boarding_time` DATETIME NOT NULL,
    `gate_number` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `WaitingAreas`(
    `area_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_id` INT NOT NULL,
    `area_name` VARCHAR(255) NOT NULL,
    `capacity` VARCHAR(255) NOT NULL COMMENT 'місткість',
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `PassengerLocations`(
    `location_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` INT NOT NULL,
    `flight_id` INT NOT NULL,
    `location_type` VARCHAR(255) NOT NULL,
    `timestamp` DATETIME NOT NULL
);
CREATE TABLE `FlightStatusUpdates`(
    `update_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_id` INT NOT NULL,
    `update_time` DATETIME NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL
);
CREATE TABLE `PassengerServices`(
    `service_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` INT NOT NULL,
    `service_type` VARCHAR(255) NOT NULL,
    `service_time` DATETIME NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `FlightDelays`(
    `delay_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_id` INT NOT NULL,
    `delay_start` DATETIME NOT NULL,
    `delay_end` DATETIME NOT NULL,
    `reason` TEXT NOT NULL
);
CREATE TABLE `PassengerFeedback`(
    `feedback_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` INT NOT NULL,
    `flight_id` TEXT NOT NULL,
    `feedback_text` TEXT NOT NULL,
    `rating` INT NOT NULL,
    `feedback_time` DATETIME NOT NULL,
    `status` VARCHAR(255) NOT NULL COMMENT '(розглядається, вирішено)'
);
CREATE TABLE `PassengerPreferences`(
    `preference_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` BIGINT NOT NULL,
    `preference_type` VARCHAR(255) NOT NULL COMMENT '(наприклад, вегетаріанське харчування, вікно)',
    `preference_value` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `SecurityCheck` ADD CONSTRAINT `securitycheck_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `Passengers`(`passenger_id`);
ALTER TABLE
    `FlightStatusUpdates` ADD CONSTRAINT `flightstatusupdates_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `Flights`(`flight_id`);
ALTER TABLE
    `Boarding` ADD CONSTRAINT `boarding_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `Flights`(`flight_id`);
ALTER TABLE
    `Tickets` ADD CONSTRAINT `tickets_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `Flights`(`flight_id`);
ALTER TABLE
    `PassengerPreferences` ADD CONSTRAINT `passengerpreferences_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `Passengers`(`passenger_id`);
ALTER TABLE
    `SecurityCheck` ADD CONSTRAINT `securitycheck_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `Flights`(`flight_id`);
ALTER TABLE
    `Boarding` ADD CONSTRAINT `boarding_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `Passengers`(`passenger_id`);
ALTER TABLE
    `PassengerFeedback` ADD CONSTRAINT `passengerfeedback_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `Passengers`(`passenger_id`);
ALTER TABLE
    `CustomsControl` ADD CONSTRAINT `customscontrol_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `Flights`(`flight_id`);
ALTER TABLE
    `PassengerLocations` ADD CONSTRAINT `passengerlocations_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `Passengers`(`passenger_id`);
ALTER TABLE
    `PassportControl` ADD CONSTRAINT `passportcontrol_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `Flights`(`flight_id`);
ALTER TABLE
    `CustomsControl` ADD CONSTRAINT `customscontrol_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `Passengers`(`passenger_id`);
ALTER TABLE
    `PassengerLocations` ADD CONSTRAINT `passengerlocations_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `Flights`(`flight_id`);
ALTER TABLE
    `CheckIn` ADD CONSTRAINT `checkin_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `Flights`(`flight_id`);
ALTER TABLE
    `WaitingAreas` ADD CONSTRAINT `waitingareas_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `Flights`(`flight_id`);
ALTER TABLE
    `CheckIn` ADD CONSTRAINT `checkin_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `Passengers`(`passenger_id`);
ALTER TABLE
    `FlightDelays` ADD CONSTRAINT `flightdelays_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `Flights`(`flight_id`);
ALTER TABLE
    `PassportControl` ADD CONSTRAINT `passportcontrol_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `Passengers`(`passenger_id`);
ALTER TABLE
    `Tickets` ADD CONSTRAINT `tickets_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `Passengers`(`passenger_id`);
ALTER TABLE
    `PassengerFeedback` ADD CONSTRAINT `passengerfeedback_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `Flights`(`flight_id`);
ALTER TABLE
    `PassengerServices` ADD CONSTRAINT `passengerservices_passenger_id_foreign` FOREIGN KEY(`passenger_id`) REFERENCES `Passengers`(`passenger_id`);