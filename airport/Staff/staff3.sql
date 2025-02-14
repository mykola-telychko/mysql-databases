CREATE TABLE `employees`(
    `employee_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `position` VARCHAR(100) NOT NULL,
    `department_id` BIGINT NOT NULL,
    `hire_date` DATE NOT NULL,
    `status` ENUM('(' active '', '' on_leave '', '' TERMINATED ')') NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `contacts` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(20) NOT NULL
);
CREATE TABLE `departments`(
    `department_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` TEXT NOT NULL,
    `head_employee_id` BIGINT NOT NULL
);
CREATE TABLE `work_schedules`(
    `schedule_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `shift_start` DATETIME NOT NULL,
    `shift_end` DATETIME NOT NULL,
    `status` ENUM('(' active '', '' vacation '', '' sick_leave ')') NOT NULL COMMENT '(активна, відпустка, лікарняний)'
);
CREATE TABLE `qualifications_training`(
    `record_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `type` VARCHAR(100) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `issued_by` DATE NOT NULL,
    `valid_until` DATE NOT NULL,
    `date_completed` DATE NOT NULL
);
CREATE TABLE `air_traffic_control`(
    `control_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `assigned_flight` BIGINT NOT NULL,
    `status` VARCHAR(50) NOT NULL,
    `detailed` TEXT NOT NULL
);
CREATE TABLE `security_staff`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `security_id` BIGINT NOT NULL,
    `employee_id` BIGINT NOT NULL,
    `zone_assigned` TEXT NOT NULL COMMENT '(наприклад, Термінал А, ВЗП, технічні приміщення)',
    `shift_start` DATETIME NOT NULL,
    `shift_end` DATETIME NOT NULL
);
CREATE TABLE `medical_staff`(
    `medical_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `qualification` ENUM('(' doctor '', '' paramedic '', '' nurse ')') NOT NULL COMMENT '(лікар, фельдшер, медсестра)',
    `assigned_zone` VARCHAR(100) NOT NULL
);
CREATE TABLE `service_staff`(
    `service_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `duty_area` VARCHAR(100) NOT NULL,
    `status` ENUM('(' active '', '' on_break '', '' off_duty ')') NOT NULL
);
CREATE TABLE `attendance_log`(
    `log_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `timestamp` DATETIME NOT NULL,
    `event` TEXT NOT NULL COMMENT '(вхід/вихід)'
);
CREATE TABLE `incidents`(
    `incident_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `department_id` BIGINT NOT NULL,
    `description` TEXT NOT NULL,
    `date_reported` DATETIME NOT NULL,
    `status` ENUM('(' OPEN '', '' in_progress '', '' resolved ')') NOT NULL
);
CREATE TABLE `access_control`(
    `access_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `zone_id` BIGINT NOT NULL,
    `access_level` ENUM('(' low '', '' MID '', '' high ')') NOT NULL COMMENT '(low/mid/high)'
);
CREATE TABLE `maintenance_requests`(
    `request_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `department_id` BIGINT NOT NULL,
    `description` TEXT NOT NULL,
    `status` ENUM('(' OPEN '', '' in_progress '', '' completed ')') NOT NULL
);
CREATE TABLE `communication_logs`(
    `comm_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `message` TEXT NOT NULL,
    `timestamp` DATETIME NOT NULL,
    `department_id` BIGINT NOT NULL
);
CREATE TABLE `work_reports`(
    `report_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `report_text` TEXT NOT NULL,
    `date_submitted` DATE NOT NULL,
    `report_type` ENUM('(' daily '', '' weekly '', '' monthly ')') NOT NULL
);
CREATE TABLE `administration`(
    `admin_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `role` VARCHAR(100) NOT NULL,
    `responsibilities` TEXT NOT NULL,
    `office_location` VARCHAR(255) NOT NULL,
    `department_id` BIGINT NOT NULL
);
ALTER TABLE
    `administration` ADD CONSTRAINT `administration_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employees`(`employee_id`);
ALTER TABLE
    `incidents` ADD CONSTRAINT `incidents_department_id_foreign` FOREIGN KEY(`department_id`) REFERENCES `departments`(`department_id`);
ALTER TABLE
    `maintenance_requests` ADD CONSTRAINT `maintenance_requests_department_id_foreign` FOREIGN KEY(`department_id`) REFERENCES `departments`(`department_id`);
ALTER TABLE
    `access_control` ADD CONSTRAINT `access_control_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employees`(`employee_id`);
ALTER TABLE
    `qualifications_training` ADD CONSTRAINT `qualifications_training_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employees`(`employee_id`);
ALTER TABLE
    `employees` ADD CONSTRAINT `employees_department_id_foreign` FOREIGN KEY(`department_id`) REFERENCES `departments`(`department_id`);
ALTER TABLE
    `work_reports` ADD CONSTRAINT `work_reports_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employees`(`employee_id`);
ALTER TABLE
    `air_traffic_control` ADD CONSTRAINT `air_traffic_control_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employees`(`employee_id`);
ALTER TABLE
    `employees` ADD CONSTRAINT `employees_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `work_schedules`(`schedule_id`);
ALTER TABLE
    `attendance_log` ADD CONSTRAINT `attendance_log_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employees`(`employee_id`);
ALTER TABLE
    `administration` ADD CONSTRAINT `administration_department_id_foreign` FOREIGN KEY(`department_id`) REFERENCES `departments`(`department_id`);
ALTER TABLE
    `incidents` ADD CONSTRAINT `incidents_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employees`(`employee_id`);
ALTER TABLE
    `maintenance_requests` ADD CONSTRAINT `maintenance_requests_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employees`(`employee_id`);
ALTER TABLE
    `medical_staff` ADD CONSTRAINT `medical_staff_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employees`(`employee_id`);
ALTER TABLE
    `service_staff` ADD CONSTRAINT `service_staff_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employees`(`employee_id`);
ALTER TABLE
    `security_staff` ADD CONSTRAINT `security_staff_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employees`(`employee_id`);
ALTER TABLE
    `communication_logs` ADD CONSTRAINT `communication_logs_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employees`(`employee_id`);
ALTER TABLE
    `communication_logs` ADD CONSTRAINT `communication_logs_department_id_foreign` FOREIGN KEY(`department_id`) REFERENCES `departments`(`department_id`);