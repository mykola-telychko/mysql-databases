-- ============================================================
-- Airport Infrastructure Database Schema Documentation
--
-- This schema models the infrastructure of an airport, including:
--   - Runways, taxiways, aprons, and buildings
--   - Utility systems (power, ventilation, water supply)
--   - Communications and metering systems
--   - Maintenance workshops and refueling facilities
--   - Aircraft service operations
--   - Documentation, standards, and scheduled inspections
--
-- Table Overview:
--   Runways: Physical runway details, materials, status, and compliance.
--   Taxiways: Taxiway dimensions and operational status.
--   Aprons: Aircraft parking locations and supported aircraft types.
--   Buildings: Airport buildings, their types, locations, and capacities.
--   PowerSupplySystems, VentilationSystems, WaterSupplySystems:
--     Utility systems linked to buildings, with capacity and status.
--   Communications: Communication systems in buildings.
--   Meters: Utility meters for buildings, with readings and types.
--   MaintenanceWorkshops: Equipment and specialists for maintenance.
--   Refueling: Fuel types and volumes for airport operations.
--   AircraftService: Services provided to aircraft (cleaning, catering).
--   Documentation: Documents associated with infrastructure entities.
--   Standards: Compliance standards for infrastructure entities.
--   ScheduledInspections: Planned inspections for infrastructure entities.
--
-- Relationships:
--   Most utility and communication tables reference buildings via building_id.
--   Documentation, Standards, and ScheduledInspections use entity_type and entity_id
--     to associate records with any infrastructure entity.
--
-- Notes:
--   Comments in Ukrainian provide additional context for certain fields.
--   Data types are chosen for scalability and precision (e.g., BIGINT, FLOAT(53)).
-- ============================================================
CREATE TABLE `Runways`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `length` FLOAT(53) NOT NULL,
    `width` FLOAT(53) NOT NULL,
    `surface_material` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `documentation` TEXT NOT NULL,
    `standards` TEXT NOT NULL,
    `maintenance_plan` TEXT NOT NULL,
    `last_inspection` DATETIME NOT NULL
);
CREATE TABLE `Taxiways`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `length` FLOAT(53) NOT NULL,
    `width` FLOAT(53) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `Aprons`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `location` BIGINT NOT NULL,
    `aircraft_type` BIGINT NOT NULL COMMENT 'Тип літаків, які обслуговують'
);
CREATE TABLE `Buildings`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type` VARCHAR(255) NOT NULL COMMENT 'Тип будівлі (термінал, ангар, вежа управління, склад)',
    `location` VARCHAR(255) NOT NULL,
    `capacity` BIGINT NOT NULL COMMENT 'Місткість (якщо є)'
);
CREATE TABLE `PowerSupplySystems`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `building_id` INT NOT NULL,
    `capacity` FLOAT(53) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `VentilationSystems`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `building_id` INT NOT NULL,
    `capacity` FLOAT(53) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `WaterSupplySystems`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `building_id` INT NOT NULL,
    `capacity` FLOAT(53) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `Communications`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `building_id` INT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `Meters`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `building_id` INT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `value` FLOAT(53) NOT NULL,
    `last_reading_date` DATE NOT NULL
);
CREATE TABLE `MaintenanceWorkshops`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `equipment` TEXT NOT NULL,
    `specialists` TEXT NOT NULL
);
CREATE TABLE `Refueling`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `fuel_type` VARCHAR(255) NOT NULL,
    `volume` FLOAT(53) NOT NULL
);
CREATE TABLE `AircraftService`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cleaning` BOOLEAN NULL,
    `catering` BOOLEAN NOT NULL COMMENT 'Харчування'
);
CREATE TABLE `Documentation`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `entity_type` VARCHAR(255) NOT NULL,
    `entity_id` INT NOT NULL,
    `document_name` VARCHAR(255) NOT NULL,
    `document_file` BLOB NOT NULL
);
CREATE TABLE `Standards`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `entity_type` VARCHAR(255) NOT NULL,
    `entity_id` BIGINT NOT NULL,
    `standard_name` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL
);
CREATE TABLE `ScheduledInspections`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `entity_type` VARCHAR(255) NOT NULL,
    `entity_id` INT NOT NULL,
    `inspection_date` DATE NOT NULL,
    `status` VARCHAR(255) NOT NULL
);