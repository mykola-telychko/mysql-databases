CREATE TABLE `flights_05_25`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `new_column` BIGINT NOT NULL,
    `status` TEXT NOT NULL COMMENT 'gate open / on time / canceled / boarding / delayed',
    `plane` TEXT NOT NULL,
    `start` DATETIME NOT NULL,
    `end` DATETIME NOT NULL,
    `during` INT NOT NULL,
    `from` TEXT NOT NULL,
    `to` TEXT NOT NULL
);
CREATE TABLE `fast_flight_updates`(
    `id_flight` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `status` BIGINT NOT NULL
);
CREATE TABLE `passangers`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` TEXT NOT NULL,
    `phone` TEXT NOT NULL,
    `passport` TEXT NOT NULL,
    `ticket` TEXT NOT NULL,
    `history` TEXT NOT NULL
);
CREATE TABLE `planes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_airlines` BIGINT NOT NULL,
    `name` TEXT NOT NULL,
    `allow` TINYINT NOT NULL,
    `status_check` BIGINT NOT NULL,
    `status_plan` TEXT NOT NULL
);
CREATE TABLE `airlines`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `phone` BIGINT NOT NULL,
    `address` TEXT NOT NULL,
    `country` TEXT NOT NULL,
    `comments` LONGTEXT NOT NULL
);
CREATE TABLE `schedules`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_id` BIGINT NOT NULL COMMENT 'reference on flights_05_25',
    `departure_time` DATETIME NOT NULL,
    `arrival_time` DATETIME NOT NULL
);
CREATE TABLE `crew`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `booking_id` BIGINT NOT NULL,
    `service_type` TEXT NOT NULL,
    `service_cost` TEXT NOT NULL
);
CREATE TABLE `additional_services`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `booking_id` BIGINT NOT NULL,
    `service_type` TEXT NOT NULL,
    `service_cost` TEXT NOT NULL
);
CREATE TABLE `tickets`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `booking_id` BIGINT NOT NULL,
    `seat_number` BIGINT NOT NULL,
    `ticket_price` BIGINT NOT NULL,
    `baggage_allowance` BIGINT NOT NULL
);
CREATE TABLE `bookings`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` BIGINT NOT NULL,
    `flight_id` BIGINT NOT NULL,
    `booking_date` BIGINT NOT NULL,
    `total_price` BIGINT NOT NULL,
    `payment_status` BIGINT NOT NULL,
    `booking_status` BIGINT NOT NULL
);
CREATE TABLE `routes`(
    `route_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `origin_airport_id` BIGINT NOT NULL,
    `destination_airport_id` BIGINT NOT NULL,
    `distance` BIGINT NOT NULL,
    `flight_duration` BIGINT NOT NULL
);
CREATE TABLE `airports`(
    `airport_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `airport_name` TEXT NOT NULL,
    `city` TEXT NOT NULL,
    `country` TEXT NOT NULL,
    `timezone` BIGINT NOT NULL,
    `latitude` TEXT NOT NULL,
    `longitude` TEXT NOT NULL
);