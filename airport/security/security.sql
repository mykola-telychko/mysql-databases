CREATE TABLE `Cameras`(
    `camera_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `location` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `last_maintenance` DATE NOT NULL
);
CREATE TABLE `SurveillanceLogs`(
    `log_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `camera_id` BIGINT NOT NULL,
    `timestamp` DATETIME NOT NULL,
    `event_description` TEXT NOT NULL
);
CREATE TABLE `AccessPoints`(
    `access_point_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `location` VARCHAR(255) NOT NULL COMMENT 'Розташування точки доступу',
    `type` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `AccessLogs`(
    `log_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `access_point_id` INT NOT NULL,
    `person_id` INT NOT NULL,
    `timestamp` DATETIME NOT NULL,
    `access_type` VARCHAR(255) NOT NULL
);
CREATE TABLE `Alarms`(
    `alarm_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `location` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `Persons`(
    `person_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `role` VARCHAR(255) NOT NULL,
    `access_level` VARCHAR(255) NOT NULL COMMENT 'Рівень доступу (наприклад, адміністратор, звичайний)'
);
CREATE TABLE `AlarmLogs`(
    `log_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `alarm_id` INT NOT NULL,
    `timestamp` DATETIME NOT NULL,
    `event_description` TEXT NOT NULL
);
CREATE TABLE `SecurityZones`(
    `zone_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL
);
CREATE TABLE `ZoneAccess`(
    `zone_access_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `zone_id` INT NOT NULL,
    `person_id` INT NOT NULL,
    `access_type` VARCHAR(255) NOT NULL
);
CREATE TABLE `Incidents`(
    `incident_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `description` TEXT NOT NULL,
    `timestamp` DATETIME NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `IncidentResponses`(
    `response_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `incident_id` INT NOT NULL,
    `person_id` INT NOT NULL,
    `response_action` TEXT NOT NULL,
    `timestamp` DATE NOT NULL
);
CREATE TABLE `SecurityStaff`(
    `staff_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `role` VARCHAR(255) NOT NULL,
    `contact_info` VARCHAR(255) NOT NULL
);
CREATE TABLE `SecurityShifts`(
    `shift_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `staff_id` INT NOT NULL,
    `start_time` DATETIME NOT NULL,
    `end_time` DATETIME NOT NULL,
    `zone_id` INT NOT NULL
);
CREATE TABLE `EmergencyExits`(
    `exit_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `location` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `last_inspection` DATE NOT NULL
);
CREATE TABLE `SecurityPolicies`(
    `policy_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `description` BIGINT NOT NULL,
    `effective_date` BIGINT NOT NULL,
    `revision_date` BIGINT NOT NULL
);