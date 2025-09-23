/*
    Database Schema Documentation: Aircraft Services

    Tables:
    --------
    1. Aircraft
        - Stores aircraft details including model, registration number, manufacturer, and status.

    2. MaintenanceWorkshops
        - Contains information about maintenance workshops, their location, and capacity.

    3. Equipment
        - Lists equipment assigned to workshops, including status and workshop association.

    4. Specialists
        - Details specialists working in workshops, including their position and workshop assignment.

    5. MaintenanceTasks
        - Records maintenance tasks performed on aircraft, including description, status, and associated workshop.

    6. FuelTypes
        - Catalogs available fuel types and their descriptions.

    7. Fueling
        - Logs fueling events for aircraft, specifying fuel type, volume, and date.

    8. CleaningServices
        - Tracks cleaning services provided to aircraft, including date and status.

    9. CateringServices
        - Records catering services for aircraft, specifying meal type, quantity, and date.

    10. Crew
        - Stores crew member details assigned to aircraft, including position, contacts, and additional details.

    11. PassengerServices
        - Logs passenger services provided to aircraft, including service type and date.

    12. Inventory
        - Manages inventory items on aircraft, including item name, quantity, and date.

    13. Inspections
        - Records inspection events for aircraft, including inspector name, date, and status.

    14. FlightLogs
        - Logs flight events for aircraft, including flight date, duration, and status.

    15. ServiceProviders
        - Contains information about service providers, their service type, and contact info.

    Relationships (Foreign Keys):
    -----------------------------
    - Many tables reference Aircraft via aircraft_id (e.g., Inspections, MaintenanceTasks, Fueling, etc.).
    - Equipment and Specialists reference MaintenanceWorkshops via workshop_id.
    - Fueling references FuelTypes via fuel_type_id.
    - ServiceProviders references PassengerServices via service_type.
    - All foreign key constraints ensure referential integrity between related entities.

    Notes:
    ------
    - All primary keys are auto-incremented unsigned integers.
    - All date fields use DATETIME type for precise event logging.
    - The schema supports comprehensive tracking of aircraft services, maintenance, crew, inventory, and related operations.
*/
CREATE TABLE `Aircraft`(
    `aircraft_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `model` VARCHAR(255) NOT NULL,
    `registration_number` VARCHAR(255) NOT NULL,
    `manufacturer` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `MaintenanceWorkshops`(
    `workshop_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `capacity` INT NOT NULL
);
CREATE TABLE `Equipment`(
    `equipment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `workshop_id` INT NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `Specialists`(
    `specialist_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `position` VARCHAR(255) NOT NULL,
    `workshop_id` INT NOT NULL
);
CREATE TABLE `MaintenanceTasks`(
    `task_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `aircraft_id` INT NOT NULL,
    `workshop_id` INT NOT NULL,
    `description` TEXT NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `FuelTypes`(
    `fuel_type_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL
);
CREATE TABLE `Fueling`(
    `fueling_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `aircraft_id` INT NOT NULL,
    `fuel_type_id` INT NOT NULL,
    `volume` DECIMAL(8, 2) NOT NULL,
    `date` DATETIME NOT NULL
);
CREATE TABLE `CleaningServices`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `aircraft_id` INT NOT NULL,
    `date` DATETIME NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `CateringServices`(
    `catering_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `aircraft_id` INT NOT NULL,
    `meal_type` VARCHAR(255) NOT NULL,
    `quantity` INT NOT NULL,
    `date` DATETIME NOT NULL
);
CREATE TABLE `Crew`(
    `crew_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `position` VARCHAR(255) NOT NULL,
    `aircraft_id` INT NOT NULL,
    `contacts` VARCHAR(255) NOT NULL,
    `detailes` TEXT NOT NULL
);
CREATE TABLE `PassengerServices`(
    `service_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `aircraft_id` INT NOT NULL,
    `service_type` VARCHAR(255) NOT NULL,
    `date` DATETIME NOT NULL
);
CREATE TABLE `Inventory`(
    `inventory_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `aircraft_id` INT NOT NULL,
    `item_name` VARCHAR(255) NOT NULL,
    `quantity` INT NOT NULL,
    `date` DATETIME NOT NULL
);
CREATE TABLE `Inspections`(
    `inspection_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `aircraft_id` INT NOT NULL,
    `inspector_name` VARCHAR(255) NOT NULL,
    `date` DATETIME NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `FlightLogs`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `aircraft_id` INT NOT NULL,
    `flight_date` DATETIME NOT NULL,
    `duration` INT NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `ServiceProviders`(
    `provider_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `service_type` VARCHAR(255) NOT NULL,
    `contact_info` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Inspections` ADD CONSTRAINT `inspections_aircraft_id_foreign` FOREIGN KEY(`aircraft_id`) REFERENCES `Aircraft`(`aircraft_id`);
ALTER TABLE
    `MaintenanceTasks` ADD CONSTRAINT `maintenancetasks_aircraft_id_foreign` FOREIGN KEY(`aircraft_id`) REFERENCES `Aircraft`(`aircraft_id`);
ALTER TABLE
    `Equipment` ADD CONSTRAINT `equipment_workshop_id_foreign` FOREIGN KEY(`workshop_id`) REFERENCES `MaintenanceWorkshops`(`workshop_id`);
ALTER TABLE
    `PassengerServices` ADD CONSTRAINT `passengerservices_aircraft_id_foreign` FOREIGN KEY(`aircraft_id`) REFERENCES `Aircraft`(`aircraft_id`);
ALTER TABLE
    `Specialists` ADD CONSTRAINT `specialists_workshop_id_foreign` FOREIGN KEY(`workshop_id`) REFERENCES `MaintenanceWorkshops`(`workshop_id`);
ALTER TABLE
    `Fueling` ADD CONSTRAINT `fueling_aircraft_id_foreign` FOREIGN KEY(`aircraft_id`) REFERENCES `Aircraft`(`aircraft_id`);
ALTER TABLE
    `Inventory` ADD CONSTRAINT `inventory_aircraft_id_foreign` FOREIGN KEY(`aircraft_id`) REFERENCES `Aircraft`(`aircraft_id`);
ALTER TABLE
    `Fueling` ADD CONSTRAINT `fueling_fuel_type_id_foreign` FOREIGN KEY(`fuel_type_id`) REFERENCES `FuelTypes`(`fuel_type_id`);
ALTER TABLE
    `Crew` ADD CONSTRAINT `crew_aircraft_id_foreign` FOREIGN KEY(`aircraft_id`) REFERENCES `Aircraft`(`aircraft_id`);
ALTER TABLE
    `CateringServices` ADD CONSTRAINT `cateringservices_aircraft_id_foreign` FOREIGN KEY(`aircraft_id`) REFERENCES `Aircraft`(`aircraft_id`);
ALTER TABLE
    `ServiceProviders` ADD CONSTRAINT `serviceproviders_service_type_foreign` FOREIGN KEY(`service_type`) REFERENCES `PassengerServices`(`service_type`);
ALTER TABLE
    `FlightLogs` ADD CONSTRAINT `flightlogs_aircraft_id_foreign` FOREIGN KEY(`aircraft_id`) REFERENCES `Aircraft`(`aircraft_id`);
ALTER TABLE
    `CleaningServices` ADD CONSTRAINT `cleaningservices_aircraft_id_foreign` FOREIGN KEY(`aircraft_id`) REFERENCES `Aircraft`(`aircraft_id`);