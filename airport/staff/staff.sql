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
    `name` BIGINT NOT NULL,
    `head_employee_id` BIGINT NOT NULL
);
CREATE TABLE `work_schedules`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `schedule_id` BIGINT NOT NULL,
    `employee_id` BIGINT NOT NULL,
    `shift_start` BIGINT NOT NULL,
    `shift_end` BIGINT NOT NULL,
    `status` BIGINT NOT NULL COMMENT '(активна, відпустка, лікарняний)'
);
CREATE TABLE `qualifications_training`(
    `record_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `type` BIGINT NOT NULL,
    `name` BIGINT NOT NULL,
    `issued_by` BIGINT NOT NULL,
    `valid_until` BIGINT NOT NULL,
    `date_completed` BIGINT NOT NULL
);
CREATE TABLE `air_traffic_control`(
    `control_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT NOT NULL,
    `assigned_flight` BIGINT NOT NULL,
    `status` BIGINT NOT NULL
);
CREATE TABLE `security_staff`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `security_id` BIGINT NOT NULL,
    `employee_id` BIGINT NOT NULL,
    `zone_assigned` BIGINT NOT NULL COMMENT '(наприклад, Термінал А, ВЗП, технічні приміщення)',
    `shift_start` BIGINT NOT NULL,
    `shift_end` BIGINT NOT NULL
);