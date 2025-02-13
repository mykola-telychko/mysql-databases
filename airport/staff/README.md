# STAFF

-- Is it possible to merge some tables (about)? 

Загальні коментарі:
Типи даних:

Використання TEXT для полів, які можуть бути обмеженими (наприклад, position, status, role),
 не є оптимальним. Краще використовувати VARCHAR з обмеженням на довжину.

Поля, які повинні бути датами (issued_by, valid_until, date_completed), 
мають тип DATETIME, але для них більше підходить DATE.

Недоліки:
Відсутність індексів для полів, які часто використовуються для
 пошуку (наприклад, employee_id, department_id).

Відсутність обмежень на унікальність для деяких полів 
(наприклад, head_employee_id у таблиці departments).

1. Таблиця employees
Недоліки:
Поле position має тип BIGINT, але воно має бути текстовим або посилатися на таблицю з посадами.
Поле status має тип BIGINT, але воно має бути текстовим або використовувати ENUM.
Відсутність контактної інформації (наприклад, email, телефон).
CREATE TABLE `employees` (
    `employee_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `position` VARCHAR(100) NOT NULL, -- Або зовнішній ключ до таблиці positions
    `department_id` BIGINT UNSIGNED NOT NULL,
    `hire_date` DATE NOT NULL,
    `status` ENUM('active', 'on_leave', 'terminated') NOT NULL,
    `email` VARCHAR(255),
    `contacts` VARCHAR(255),
    `phone` VARCHAR(20),
    FOREIGN KEY (`department_id`) REFERENCES `departments`(`department_id`)
);

2. Таблиця departments
Недоліки:
Поле head_employee_id має тип TEXT, але воно має бути BIGINT і посилатися на таблицю employees.
CREATE TABLE `departments` (
    `department_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `head_employee_id` BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (`head_employee_id`) REFERENCES `employees`(`employee_id`)
);

3. Таблиця work_schedules
Недоліки:
Поле status має тип BIGINT, але воно має бути текстовим або використовувати ENUM.
CREATE TABLE `work_schedules` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT UNSIGNED NOT NULL,
    `shift_start` DATETIME NOT NULL,
    `shift_end` DATETIME NOT NULL,
    `status` ENUM('active', 'vacation', 'sick_leave') NOT NULL,
    FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`)
);

4. Таблиця qualifications_training
Недоліки:
Поля issued_by, valid_until, date_completed мають тип DATETIME, але вони мають бути DATE.
CREATE TABLE `qualifications_training` (
    `record_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT UNSIGNED NOT NULL,
    `type` VARCHAR(100) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `issued_by` DATE NOT NULL,
    `valid_until` DATE NOT NULL,
    `date_completed` DATE NOT NULL,
    FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`)
);

5. Таблиця air_traffic_control
Недоліки:
Поле assigned_flight має тип BIGINT, але воно має посилатися на таблицю з рейсами.
CREATE TABLE `air_traffic_control` (
    `control_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT UNSIGNED NOT NULL,
    `assigned_flight` BIGINT UNSIGNED NOT NULL,
    `status` VARCHAR(50) NOT NULL,
    `details` TEXT NOT NULL,
    FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`),
    FOREIGN KEY (`assigned_flight`) REFERENCES `flights`(`flight_id`)
);

6. Таблиця security_staff
Недоліки:
Відсутність зв'язку з таблицею zones для zone_assigned.
CREATE TABLE `security_staff` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT UNSIGNED NOT NULL,
    `zone_assigned` VARCHAR(100) NOT NULL,
    `shift_start` DATETIME NOT NULL,
    `shift_end` DATETIME NOT NULL,
    FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`)
);

7. Таблиця medical_staff
Недоліки:
Відсутність зв'язку з таблицею zones для assigned_zone.
CREATE TABLE `medical_staff` (
    `medical_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT UNSIGNED NOT NULL,
    `qualification` ENUM('doctor', 'paramedic', 'nurse') NOT NULL,
    `assigned_zone` VARCHAR(100) NOT NULL,
    FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`)
);

8. Таблиця service_staff
Недоліки:
Поле status має тип TEXT, але воно має бути ENUM.
CREATE TABLE `service_staff` (
    `service_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT UNSIGNED NOT NULL,
    `duty_area` VARCHAR(100) NOT NULL,
    `status` ENUM('active', 'on_break', 'off_duty') NOT NULL,
    FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`)
);

9. Таблиця attendance_log
Недоліки:
Поле event має тип TEXT, але воно має бути ENUM.
CREATE TABLE `attendance_log` (
    `log_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT UNSIGNED NOT NULL,
    `timestamp` DATETIME NOT NULL,
    `event` ENUM('check_in', 'check_out') NOT NULL,
    FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`)
);

10. Таблиця incidents
Недоліки:
Поле description має тип DATETIME, але воно має бути TEXT.
CREATE TABLE `incidents` (
    `incident_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT UNSIGNED NOT NULL,
    `department_id` BIGINT UNSIGNED NOT NULL,
    `description` TEXT NOT NULL,
    `date_reported` DATETIME NOT NULL,
    `status` ENUM('open', 'in_progress', 'resolved') NOT NULL,
    FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`),
    FOREIGN KEY (`department_id`) REFERENCES `departments`(`department_id`)
);

11. Таблиця access_control
Недоліки:
Відсутність зв'язку з таблицею zones для zone_id.
CREATE TABLE `access_control` (
    `access_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT UNSIGNED NOT NULL,
    `zone_id` BIGINT UNSIGNED NOT NULL,
    `access_level` ENUM('low', 'mid', 'high') NOT NULL,
    FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`),
    FOREIGN KEY (`zone_id`) REFERENCES `zones`(`zone_id`)
);

12. Таблиця maintenance_requests
Недоліки:
Поле status має тип TEXT, але воно має бути ENUM.
CREATE TABLE `maintenance_requests` (
    `request_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT UNSIGNED NOT NULL,
    `department_id` BIGINT UNSIGNED NOT NULL,
    `description` TEXT NOT NULL,
    `status` ENUM('open', 'in_progress', 'completed') NOT NULL,
    FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`),
    FOREIGN KEY (`department_id`) REFERENCES `departments`(`department_id`)
);

13. Таблиця communication_logs
Недоліки:
Відсутність зв'язку з таблицею departments для логування повідомлень між відділами.
CREATE TABLE `communication_logs` (
    `comm_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT UNSIGNED NOT NULL,
    `message` TEXT NOT NULL,
    `timestamp` DATETIME NOT NULL,
    `department_id` BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`),
    FOREIGN KEY (`department_id`) REFERENCES `departments`(`department_id`)
);

14. Таблиця work_reports
Недоліки:
Відсутність поля для типу звіту (наприклад, щоденний, тижневий).
CREATE TABLE `work_reports` (
    `report_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT UNSIGNED NOT NULL,
    `report_text` TEXT NOT NULL,
    `date_submitted` DATE NOT NULL,
    `report_type` ENUM('daily', 'weekly', 'monthly') NOT NULL,
    FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`)
);

15. Таблиця administration
Недоліки:
Відсутність зв'язку з таблицею departments.
CREATE TABLE `administration` (
    `admin_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` BIGINT UNSIGNED NOT NULL,
    `role` VARCHAR(100) NOT NULL,
    `responsibilities` TEXT NOT NULL,
    `office_location` VARCHAR(255) NOT NULL,
    `department_id` BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`),
    FOREIGN KEY (`department_id`) REFERENCES `departments`(`department_id`)
);


++++++ Нові таблиці, які можна додати:

Таблиця positions:
Для зберігання посад працівників.
CREATE TABLE `positions` (
    `position_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `description` TEXT
);

Таблиця zones:
Для зберігання зон аеропорту.
CREATE TABLE `zones` (
    `zone_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `description` TEXT
);

Таблиця flights:
Для зберігання інформації про рейси.
CREATE TABLE `flights` (
    `flight_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_number` VARCHAR(50) NOT NULL,
    `departure_time` DATETIME NOT NULL,
    `arrival_time` DATETIME NOT NULL,
    `status` ENUM('scheduled', 'delayed', 'cancelled') NOT NULL
);







-------------------------------
1. Співробітники (employees)
Основна інформація про працівників аеропорту.
    employee_id (PK)
    first_name, 
    last_name
    position (пілот, диспетчер, технік, охоронець тощо)
    department_id (FK)
    hire_date
    status (активний, у відпустці, звільнений)

2. Відділи (departments)
Різні служби аеропорту.
    department_id (PK)
    name (Диспетчерська служба, Технічний відділ, Безпека тощо)
    head_employee_id (FK) – Начальник служби

3. Графіки змін (work_schedules)
Розклад роботи персоналу.
    schedule_id (PK)
    employee_id (FK)
    shift_start
    shift_end
    status (активна, відпустка, лікарняний)

4. Кваліфікації та підготовка (qualifications_training)
Кваліфікація, сертифікати та навчання працівників.
    record_id (PK)
    employee_id (FK)
    type (кваліфікація/навчання)
    name (Наприклад, "Диспетчер категорії А" або "Пожежна безпека")
    issued_by
    valid_until (для сертифікатів)
    date_completed (для навчання)

5. Диспетчерська служба (air_traffic_control)
Інформація про диспетчерів та контроль повітряного руху.
    control_id (PK)
    employee_id (FK)
    assigned_flight (опціонально, рейс, який веде диспетчер)
    status (активний / очікує)


6. Охорона аеропорту (security_staff)
Персонал безпеки аеропорту.
    security_id (PK)
    employee_id (FK)
    zone_assigned (наприклад, Термінал А, ВЗП, технічні приміщення)
    shift_start, shift_end

7. Медична служба (medical_staff)
Лікарі, медпрацівники в аеропорту.
    medical_id (PK)
    employee_id (FK)
    qualification (лікар, фельдшер, медсестра)
    assigned_zone

8. Обслуговуючий персонал (service_staff)
Прибиральники, техніки, обслуговуючий персонал.
    service_id (PK)
    employee_id (FK)
    duty_area (Наприклад, "Зона вильоту", "Гейт 5")
    status

9. Облік відвідування (attendance_log)
Коли співробітник входив / виходив на роботу.
    log_id (PK)
    employee_id (FK)
    timestamp
    event (вхід/вихід)

10. Інциденти (incidents)
Фіксація порушень, аварійних ситуацій.
    incident_id (PK)
    employee_id (FK) – хто повідомив
    department_id (FK) – відповідальна служба
    description
    date_reported
    status (відкрито/закрито)


11. Облік допусків (access_control)
Кому і куди дозволено доступ.
    access_id (PK)
    employee_id (FK)
    zone_id (FK)
    access_level (низький/середній/високий)

12. Запити на ремонт (maintenance_requests)
Запити на техобслуговування.
    request_id (PK)
    employee_id (FK) – хто подав
    department_id (FK) – хто відповідає
    description
    status

13. Радіозв'язок (communication_logs)
Лог спілкування диспетчерів, охорони та техперсоналу.
    comm_id (PK)
    employee_id (FK)
    message
    timestamp

14. Звіти про роботу (work_reports)
Звіти про виконану роботу.
    report_id (PK)
    employee_id (FK)
    report_text
    date_submitted

15. Адміністрація (administration)
Вища адміністрація та управління аеропортом.
    admin_id (PK)
    employee_id (FK)
    role (Наприклад, "Генеральний директор", "Фінансовий директор")
    responsibilities
    office_location