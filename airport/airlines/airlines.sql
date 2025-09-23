/*
    Database Schema Documentation: Airport Airlines Management System

    Tables:
    --------
    1. Airlines
        - Stores airline information including name, country, and contact info.

    2. Aircrafts
        - Details of aircrafts, including model, manufacturer, airline association, registration number, and capacity.

    3. Manufacturers
        - Information about aircraft manufacturers, including name, country, and contact info.

    4. MaintenanceServices
        - Records maintenance service providers with their name, location, and contact info.

    5. Agreements
        - Tracks agreements between airlines and other entities, including start/end dates and terms.

    6. Flights
        - Contains flight details such as airline, aircraft, departure/arrival airports, and times.

    7. Schedules
        - Specifies flight schedules, including day of week and frequency.

    8. MaintenanceRecords
        - Logs maintenance performed on aircrafts, including service provider, date, description, and cost.

    9. Pilots
        - Stores pilot information, including name, license number, and associated airline.

    10. CrewMembers
        - Details crew members, their roles, and associated airline.

    11. Passengers
        - Contains passenger details, contact info, and frequent flyer number.

    12. Tickets
        - Records ticket sales, linking flights and passengers, with seat and price info.

    13. Airports
        - Stores airport information, including name, city, and country.

    14. FlightLogs
        - Logs flight status and notes for each flight on specific dates.

    15. SpareParts
        - Tracks spare parts inventory, manufacturer, cost, and stock quantity.

    Relationships (Foreign Keys):
    -----------------------------
    - Flights.airline_id → Airlines.airline_id
    - Aircrafts.airline_id → Airlines.airline_id
    - Flights.aircraft_id → Aircrafts.aircraft_id
    - Tickets.passenger_id → Passengers.passenger_id
    - Agreements.airline_id → Airlines.airline_id
    - MaintenanceRecords.service_id → MaintenanceServices.service_id
    - Aircrafts.manufacturer_id → Manufacturers.manufacturer_id
    - Tickets.flight_id → Flights.flight_id
    - MaintenanceRecords.aircraft_id → Aircrafts.aircraft_id
    - Schedules.flight_id → Flights.flight_id

    Notes:
    ------
    - All tables use INT UNSIGNED as primary keys with AUTO_INCREMENT for unique identification.
    - Foreign key constraints enforce referential integrity between related tables.
    - The schema supports comprehensive management of airlines, aircrafts, flights, maintenance, crew, passengers, and inventory.
*/
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