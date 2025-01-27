CREATE TABLE `employees`(
    `employee_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` TEXT NOT NULL,
    `last_name` TEXT NOT NULL,
    `position` BIGINT NOT NULL,
    `department_id` BIGINT NOT NULL,
    `hire_date` DATE NOT NULL,
    `status` BIGINT NOT NULL
);
CREATE TABLE `departments`(
    `department_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` TEXT NOT NULL,
    `head_employee_id` TEXT NOT NULL
);
CREATE TABLE `work_schedules`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `schedule_id` BIGINT NOT NULL,
    `employee_id` BIGINT NOT NULL,
    `shift_start` DATETIME NOT NULL,
    `shift_end` DATETIME NOT NULL,
    `status` BIGINT NOT NULL COMMENT '(активна, відпустка, лікарняний)'
);
CREATE TABLE `qualifications_training`(
    `record_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `type` TEXT NOT NULL,
    `name` TEXT NOT NULL,
    `issued_by` DATETIME NOT NULL,
    `valid_until` DATETIME NOT NULL,
    `date_completed` DATETIME NOT NULL
);
CREATE TABLE `air_traffic_control`(
    `control_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `assigned_flight` BIGINT NOT NULL,
    `status` TEXT NOT NULL,
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
    `qualification` TEXT NOT NULL COMMENT '(лікар, фельдшер, медсестра)',
    `assigned_zone` TEXT NOT NULL
);
CREATE TABLE `service_staff`(
    `service_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `duty_area` TEXT NOT NULL,
    `status` TEXT NOT NULL
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
    `description` DATETIME NOT NULL,
    `date_reported` DATETIME NOT NULL,
    `status` TEXT NOT NULL
);
CREATE TABLE `access_control`(
    `access_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `zone_id` BIGINT NOT NULL,
    `access_level` TEXT NOT NULL COMMENT '(low/mid/high)'
);
CREATE TABLE `maintenance_requests`(
    `request_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `department_id` BIGINT NOT NULL,
    `description` TEXT NOT NULL,
    `status` TEXT NOT NULL
);
CREATE TABLE `communication_logs`(
    `comm_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `message` TEXT NOT NULL,
    `timestamp` DATETIME NOT NULL
);
CREATE TABLE `work_reports`(
    `report_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `report_text` TEXT NOT NULL,
    `date_submitted` DATE NOT NULL
);
CREATE TABLE `administration`(
    `admin_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `role` TEXT NOT NULL,
    `responsibilities` TEXT NOT NULL,
    `office_location` TEXT NOT NULL
);