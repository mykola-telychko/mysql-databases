# Security

-------------------------
Основні таблиці:
Cameras - камери спостереження

SurveillanceLogs - логи з камер
AccessPoints - контрольні точки доступу
AccessLogs - логи доступу
Alarms - системи тривоги
Persons - особи (персонал, пасажири)
AlarmLogs - логи тривог
SecurityZones - зони безпеки
ZoneAccess - доступ до зон
Incidents - інциденти
IncidentResponses - реагування на інциденти
SecurityStaff - охоронний персонал
SecurityShifts - зміни охорони
EmergencyExits - аварійні виходи
SecurityPolicies - політики безпеки

Пропоновані зв'язки між таблицями: 
SurveillanceLogs.camera_id → Cameras.camera_id (зовнішній ключ)
AccessLogs.access_point_id → AccessPoints.access_point_id
AccessLogs.person_id → Persons.person_id

AlarmLogs.alarm_id → Alarms.alarm_id
ZoneAccess.zone_id → SecurityZones.zone_id
ZoneAccess.person_id → Persons.person_id

IncidentResponses.incident_id → Incidents.incident_id
IncidentResponses.person_id → Persons.person_id
SecurityShifts.staff_id → SecurityStaff.staff_id
SecurityShifts.zone_id → SecurityZones.zone_id

Пропоновані додаткові таблиці:
1. Equipment (Обладнання)

CREATE TABLE `Equipment` (
    `equipment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `last_inspection` DATE NOT NULL,
    `responsible_person_id` INT NOT NULL,
    FOREIGN KEY (`responsible_person_id`) REFERENCES `Persons`(`person_id`)
);
2. VisitorRecords (Реєстрація відвідувачів)

CREATE TABLE `VisitorRecords` (
    `record_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `visitor_id` INT NOT NULL,
    `purpose` TEXT NOT NULL,
    `entry_time` DATETIME NOT NULL,
    `exit_time` DATETIME,
    `escort_person_id` INT,
    `access_level` VARCHAR(255) NOT NULL,
    FOREIGN KEY (`visitor_id`) REFERENCES `Persons`(`person_id`),
    FOREIGN KEY (`escort_person_id`) REFERENCES `Persons`(`person_id`)
);
3. BaggageChecks (Перевірка багажу)

CREATE TABLE `BaggageChecks` (
    `check_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `person_id` INT NOT NULL,
    `check_time` DATETIME NOT NULL,
    `check_type` VARCHAR(255) NOT NULL,
    `result` VARCHAR(255) NOT NULL,
    `staff_id` INT NOT NULL,
    `equipment_id` INT,
    `notes` TEXT,
    FOREIGN KEY (`person_id`) REFERENCES `Persons`(`person_id`),
    FOREIGN KEY (`staff_id`) REFERENCES `SecurityStaff`(`staff_id`),
    FOREIGN KEY (`equipment_id`) REFERENCES `Equipment`(`equipment_id`)
);
4. SecurityTrainings (Тренування персоналу)

CREATE TABLE `SecurityTrainings` (
    `training_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `trainer_id` INT NOT NULL,
    `date` DATE NOT NULL,
    `duration` INT NOT NULL COMMENT 'Тривалість у хвилинах',
    FOREIGN KEY (`trainer_id`) REFERENCES `SecurityStaff`(`staff_id`)
);
5. StaffTrainingRecords (Реєстрація тренувань персоналу)

CREATE TABLE `StaffTrainingRecords` (
    `record_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `staff_id` INT NOT NULL,
    `training_id` INT NOT NULL,
    `completion_status` VARCHAR(255) NOT NULL,
    `score` INT,
    `certificate_number` VARCHAR(255),
    FOREIGN KEY (`staff_id`) REFERENCES `SecurityStaff`(`staff_id`),
    FOREIGN KEY (`training_id`) REFERENCES `SecurityTrainings`(`training_id`)
);
6. VehicleAccess (Доступ транспортних засобів)

CREATE TABLE `VehicleAccess` (
    `access_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `vehicle_registration` VARCHAR(255) NOT NULL,
    `driver_id` INT NOT NULL,
    `entry_time` DATETIME NOT NULL,
    `exit_time` DATETIME,
    `purpose` TEXT NOT NULL,
    `zone_id` INT NOT NULL,
    `security_check_status` VARCHAR(255) NOT NULL,
    FOREIGN KEY (`driver_id`) REFERENCES `Persons`(`person_id`),
    FOREIGN KEY (`zone_id`) REFERENCES `SecurityZones`(`zone_id`)
);
7. ThreatAssessments (Оцінки загроз)

CREATE TABLE `ThreatAssessments` (
    `assessment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `date` DATE NOT NULL,
    `assessed_by` INT NOT NULL,
    `threat_level` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `recommendations` TEXT NOT NULL,
    FOREIGN KEY (`assessed_by`) REFERENCES `SecurityStaff`(`staff_id`)
);
Покращення існуючих таблиць
У таблиці SecurityPolicies поля name, description, effective_date, revision_date мають неправильний тип BIGINT. Виправлення:


ALTER TABLE `SecurityPolicies` 
MODIFY `name` VARCHAR(255) NOT NULL,
MODIFY `description` TEXT NOT NULL,
MODIFY `effective_date` DATE NOT NULL,
MODIFY `revision_date` DATE;
Додати індекси для полів, які часто використовуються для пошуку:


CREATE INDEX idx_camera_location ON `Cameras`(`location`);
CREATE INDEX idx_access_log_timestamp ON `AccessLogs`(`timestamp`);
CREATE INDEX idx_person_role ON `Persons`(`role`);
CREATE INDEX idx_incident_status ON `Incidents`(`status`);