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