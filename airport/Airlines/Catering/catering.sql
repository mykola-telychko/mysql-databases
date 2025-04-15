CREATE TABLE `Airlines`(
    `airline_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `iata_code` CHAR(2) NULL,
    `catering_standard` VARCHAR(50) NULL,
    `contact_email` VARCHAR(100) NULL,
    `contact_phone` VARCHAR(20) NULL
);
ALTER TABLE
    `Airlines` ADD UNIQUE `airlines_iata_code_unique`(`iata_code`);
CREATE TABLE `Aircraft_Types`(
    `aircraft_type_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `manufacturer` VARCHAR(50) NOT NULL,
    `model` VARCHAR(50) NOT NULL,
    `max_passengers` INT NULL,
    `galley_count` INT NULL,
    `oven_count` INT NULL
);
ALTER TABLE
    `Aircraft_Types` ADD UNIQUE `aircraft_types_manufacturer_model_unique`(`manufacturer`, `model`);
CREATE TABLE `Cabin_Classes`(
    `class_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `class_name` VARCHAR(20) NOT NULL,
    `description` VARCHAR(100) NULL,
    `service_level` INT NULL
);
ALTER TABLE
    `Cabin_Classes` ADD UNIQUE `cabin_classes_class_name_unique`(`class_name`);
CREATE TABLE `Meal_Types`(
    `meal_type_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type_name` VARCHAR(50) NOT NULL,
    `description` VARCHAR(200) NULL,
    `dietary_category` VARCHAR(50) NULL
);
ALTER TABLE
    `Meal_Types` ADD UNIQUE `meal_types_type_name_unique`(`type_name`);
CREATE TABLE `Meal_Items`(
    `meal_item_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `description` TEXT NULL,
    `meal_type_id` INT NULL,
    `is_vegetarian` BOOLEAN NULL DEFAULT 'DEFAULT FALSE',
    `is_vegan` BOOLEAN NULL DEFAULT 'DEFAULT FALSE',
    `is_gluten_free` BOOLEAN NULL DEFAULT 'DEFAULT FALSE',
    `calories` INT NULL
);
CREATE TABLE `Beverages`(
    `beverage_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `category` ENUM('') NOT NULL,
    `is_alcoholic` BOOLEAN NULL DEFAULT 'DEFAULT FALSE',
    `serving_temperature` VARCHAR(20) NULL,
    `container_type` VARCHAR(30) NULL
);
CREATE TABLE `Catering_Companies`(
    `company_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `airport_code` CHAR(3) NOT NULL,
    `contact_person` VARCHAR(100) NULL,
    `contact_phone` VARCHAR(20) NULL,
    `contract_start` DATE NULL,
    `contract_end` DATE NULL
);
CREATE TABLE `Flight_Meal_Plans`(
    `plan_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_id` INT NOT NULL,
    `class_id` INT NOT NULL,
    `meal_type_id` INT NOT NULL,
    `meal_item_id` INT NOT NULL,
    `beverage_id` INT NULL,
    `serving_order` INT NULL
);
CREATE TABLE `Crew_Members`(
    `crew_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `airline_id` INT NOT NULL,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `position` ENUM('') NOT NULL,
    `hire_date` DATE NULL
);
CREATE TABLE `Flight_Crew_Assignments`(
    `assignment_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_id` INT NOT NULL,
    `crew_id` INT NOT NULL,
    `role` VARCHAR(50) NOT NULL,
    `responsibility_zone` VARCHAR(20) NULL
);
CREATE TABLE `Special_Meal_Requests`(
    `request_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_name` VARCHAR(100) NOT NULL,
    `flight_id` INT NOT NULL,
    `seat_number` VARCHAR(10) NOT NULL,
    `meal_type_id` INT NOT NULL,
    `special_notes` TEXT NULL,
    `is_fulfilled` BOOLEAN NULL DEFAULT 'DEFAULT FALSE'
);
CREATE TABLE `Catering_Orders`(
    `order_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_id` INT NOT NULL,
    `catering_company_id` INT NOT NULL,
    `order_date` DATETIME NOT NULL,
    `delivery_time` DATETIME NOT NULL,
    `status` ENUM('') NOT NULL
);
CREATE TABLE `Catering_Order_Details`(
    `detail_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` INT NOT NULL,
    `meal_item_id` INT NULL,
    `beverage_id` INT NULL,
    `quantity` INT NOT NULL,
    `for_class_id` INT NOT NULL
);
CREATE TABLE `Service_Logs`(
    `log_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_id` INT NOT NULL,
    `crew_id` INT NOT NULL,
    `service_type` ENUM('') NOT NULL,
    `service_time` DATETIME NOT NULL,
    `passenger_count` INT NULL,
    `notes` TEXT NULL
);
CREATE TABLE `Flight_Service_Schedules`(
    `service_schedule_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_number` VARCHAR(10) NOT NULL,
    `airline_id` INT NOT NULL,
    `aircraft_type_id` INT NOT NULL,
    `departure_datetime` DATETIME NOT NULL,
    `flight_duration_minutes` INT NOT NULL,
    `planned_meal_services` TINYINT NOT NULL DEFAULT '1' COMMENT '\\u041a\\u0456\\u043b\\u044c\\u043a\\u0456\\u0441\\u0442\\u044c \\u0437\\u0430\\u043f\\u043b\\u0430\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0445 \\u0445\\u0430\\u0440\\u0447\\u043e\\u0432\\u0438\\u0445 \\u0441\\u0435\\u0440\\u0432\\u0456\\u0441\\u0456\\u0432',
    `beverage_rounds` TINYINT NOT NULL DEFAULT '2' COMMENT '\\u041a\\u0456\\u043b\\u044c\\u043a\\u0456\\u0441\\u0442\\u044c \\u0437\\u0430\\u043f\\u043b\\u0430\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0445 \\u0440\\u043e\\u0437\\u0434\\u0430\\u0447 \\u043d\\u0430\\u043f\\u043e\\u0457\\u0432',
    `special_service_notes` TEXT NULL COMMENT '\\u041e\\u0441\\u043e\\u0431\\u043b\\u0438\\u0432\\u0456 \\u0432\\u043a\\u0430\\u0437\\u0456\\u0432\\u043a\\u0438 \\u0449\\u043e\\u0434\\u043e \\u043e\\u0431\\u0441\\u043b\\u0443\\u0433\\u043e\\u0432\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f',
    `is_premium_route` BOOLEAN NULL DEFAULT 'DEFAULT FALSE' COMMENT '\\u041f\\u0440\\u0430\\u043f\\u043e\\u0440 \\u043f\\u0440\\u0435\\u043c\\u0456\\u0443\\u043c-\\u043c\\u0430\\u0440\\u0448\\u0440\\u0443\\u0442\\u0443',
    `catering_load_time` DATETIME NULL COMMENT '\\u0427\\u0430\\u0441 \\u0437\\u0430\\u0432\\u0430\\u043d\\u0442\\u0430\\u0436\\u0435\\u043d\\u043d\\u044f \\u043a\\u0435\\u0439\\u0442\\u0435\\u0440\\u0438\\u043d\\u0433\\u0443',
    `catering_company_id` INT NULL
);
ALTER TABLE
    `Flight_Service_Schedules` ADD CONSTRAINT `flight_service_schedules_aircraft_type_id_foreign` FOREIGN KEY(`aircraft_type_id`) REFERENCES `Aircraft_Types`(`aircraft_type_id`);
ALTER TABLE
    `Flight_Service_Schedules` ADD CONSTRAINT `flight_service_schedules_airline_id_foreign` FOREIGN KEY(`airline_id`) REFERENCES `Airlines`(`airline_id`);
ALTER TABLE
    `Crew_Members` ADD CONSTRAINT `crew_members_airline_id_foreign` FOREIGN KEY(`airline_id`) REFERENCES `Airlines`(`airline_id`);
ALTER TABLE
    `Flight_Service_Schedules` ADD CONSTRAINT `flight_service_schedules_catering_company_id_foreign` FOREIGN KEY(`catering_company_id`) REFERENCES `Catering_Companies`(`company_id`);
ALTER TABLE
    `Catering_Order_Details` ADD CONSTRAINT `catering_order_details_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `Catering_Orders`(`order_id`);
ALTER TABLE
    `Catering_Order_Details` ADD CONSTRAINT `catering_order_details_meal_item_id_foreign` FOREIGN KEY(`meal_item_id`) REFERENCES `Meal_Items`(`meal_item_id`);
ALTER TABLE
    `Catering_Order_Details` ADD CONSTRAINT `catering_order_details_beverage_id_foreign` FOREIGN KEY(`beverage_id`) REFERENCES `Beverages`(`beverage_id`);
ALTER TABLE
    `Meal_Items` ADD CONSTRAINT `meal_items_meal_type_id_foreign` FOREIGN KEY(`meal_type_id`) REFERENCES `Meal_Types`(`meal_type_id`);
ALTER TABLE
    `Catering_Order_Details` ADD CONSTRAINT `catering_order_details_for_class_id_foreign` FOREIGN KEY(`for_class_id`) REFERENCES `Cabin_Classes`(`class_id`);