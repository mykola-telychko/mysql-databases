# cleaning-service

Клінінг повітряних суден — це складний процес, який включає прибирання салону, дезінфекцію, знежирення поверхонь, видалення льоду та снігу, а також обслуговування зовнішніх частин літака. Ось основні аспекти цієї роботи:

1. Хто займається прибиранням літаків?
А. Внутрішній клінінг (салон, кабіна пілотів, туалети)
Клінінгові бригади аеропорту – спеціалізовані працівники, які проводять:

Швидке прибирання між рейсами (turnaround cleaning).

Глибоке прибирання після останнього рейсу (night stop cleaning).

Дезінфекцію (особливо після пандемії COVID-19).
§
Б. Зовнішнє очищення (крила, фюзеляж, вікна, шасі)
Деісінг (антиобледеніння) – проводиться спеціальними машинами з розпилювачами, які наносять розчин гліколю (часто Type I або Type IV).

Видалення снігу – використовуються снігоочисники, теплові гармати, механічні щітки.

Мийка літака – проводиться періодично (раз на 1–3 місяці) для зняття бруду, палива, комах.

2. Як організоване чергування та прибирання в аеропортах?
А. Графік прибирання
Turnaround Cleaning (між рейсами) – 20–60 хвилин (залежить від класу літака).

Night Stop Cleaning (глибоке) – 2–4 години (вночі або під час тривалої стоянки).

Деісінг – перед зльотом у зимовий період (може займати 5–20 хвилин).

Б. Хто виконує роботи?
Власні служби авіакомпанії (наприклад, Lufthansa Technik, Emirates Engineering).

Аутсорсингові клінінгові компанії (наприклад, Menzies Aviation, Swissport, Dnata).

Аеропортівські служби (якщо аеропорт надає послуги).

В. Логістика в різних аеропортах
Хаби (великі аеропорти) – власні бригади, автоматизовані системи (наприклад, роботизовані мийки у Дубаї).

Регіональні аеропорти – наймають місцеві клінінгові компанії.

3. Як авіалінії наймають клінінгові сервіси?
А. Види контрактів
Ground Handling Agreement (GHA) – аеропорт або третя компанія обслуговує літаки.

Self-handling – авіакомпанія має власну клінінгову службу.

Ad-hoc обслуговування – разові замовлення (наприклад, для чартерів).

Б. Управління якістю
Стандарти IATA (ISAGO), ISO 9001.

Інспекції авіакомпаній (наприклад, Qatar Airways проводить аудити).

Електронні системи моніторингу (наприклад, RFID-метки для відстеження чистоти).

4. Як влаштована робота клінінгових сервісів у аеропортах?
А. Типові процеси
Отримання завдання (через систему DCS – Departure Control System).

Підготовка інвентарю (пилососи, миючі засоби, дезінфектори).

Швидке прибирання (винос сміття, поповнення запасів).

Деісінг/антиобледеніння (якщо потрібно).

Звітність (фотофіксація, підпис пілотів).

Б. Складність роботи
Обмежений час (час на землі = збитки для авіакомпанії).

Висока відповідальність (наприклад, недогляд за льодом може призвести до аварії).

Робота в екстремальних умовах (мороз, дощ, спека).

Висновок
Клінінг літаків — це високотехнологічний процес, який вимагає чіткої координації між авіакомпаніями, аеропортами та підрядниками. Найбільші компанії (Menzies, Swissport) мають стандартизовані процедури для різних типів літаків, що дозволяє їм працювати у сотнях аеропортів світу.

// ----------------------------------
Тут є деякі нові поля які мені не знайому - вивчити їх доцільність

1. Авіакомпанії (airlines)

CREATE TABLE airlines (
    airline_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    iata_code CHAR(2) NOT NULL,
    icao_code CHAR(3) NOT NULL,
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
2. Аеропорти (airports)

CREATE TABLE airports (
    airport_id INT PRIMARY KEY AUTO_INCREMENT,
    iata_code CHAR(3) NOT NULL,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    has_deicing BOOLEAN DEFAULT FALSE,
    cleaning_services_available BOOLEAN DEFAULT TRUE
);
3. Типи літаків (aircraft_types)

CREATE TABLE aircraft_types (
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    icao_code CHAR(4) NOT NULL,
    manufacturer VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    seats_capacity INT,
    cleaning_time_min INT COMMENT 'Середній час прибирання (хвилини)',
    deicing_time_min INT COMMENT 'Середній час деісінгу (хвилини)'
);
4. Літаки (aircrafts)

CREATE TABLE aircrafts (
    aircraft_id INT PRIMARY KEY AUTO_INCREMENT,
    registration_number VARCHAR(10) NOT NULL UNIQUE,
    airline_id INT NOT NULL,
    type_id INT NOT NULL,
    last_deep_cleaning DATE,
    next_scheduled_wash DATE,
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id),
    FOREIGN KEY (type_id) REFERENCES aircraft_types(type_id)
);
5. Послуги клінінгу (cleaning_services)

CREATE TABLE cleaning_services (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    base_price DECIMAL(10,2) NOT NULL,
    duration_min INT NOT NULL,
    service_level ENUM('quick', 'standard', 'deep') NOT NULL
);
6. Персонал (staff)

CREATE TABLE staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    certification VARCHAR(100),
    is_deicing_certified BOOLEAN DEFAULT FALSE,
    status ENUM('active', 'on_leave', 'terminated') DEFAULT 'active'
);
7. Обладнання (equipment)

CREATE TABLE equipment (
    equipment_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    type ENUM('cleaning', 'deicing', 'both') NOT NULL,
    purchase_date DATE,
    last_maintenance DATE,
    status ENUM('active', 'maintenance', 'retired') DEFAULT 'active',
    airport_id INT,
    FOREIGN KEY (airport_id) REFERENCES airports(airport_id)
);
8. Робочі зміни (work_shifts)

CREATE TABLE work_shifts (
    shift_id INT PRIMARY KEY AUTO_INCREMENT,
    shift_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    airport_id INT NOT NULL,
    team_leader_id INT,
    FOREIGN KEY (airport_id) REFERENCES airports(airport_id),
    FOREIGN KEY (team_leader_id) REFERENCES staff(staff_id)
);
9. Призначення персоналу (staff_assignments)

CREATE TABLE staff_assignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_id INT NOT NULL,
    shift_id INT NOT NULL,
    role VARCHAR(50) NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY (shift_id) REFERENCES work_shifts(shift_id)
);
10. Рейси (flights)

CREATE TABLE flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(10) NOT NULL,
    airline_id INT NOT NULL,
    aircraft_id INT NOT NULL,
    origin_airport_id INT NOT NULL,
    destination_airport_id INT NOT NULL,
    scheduled_arrival DATETIME NOT NULL,
    scheduled_departure DATETIME NOT NULL,
    actual_arrival DATETIME,
    actual_departure DATETIME,
    needs_deicing BOOLEAN DEFAULT FALSE,
    cleaning_status ENUM('not_started', 'in_progress', 'completed', 'skipped') DEFAULT 'not_started',
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id),
    FOREIGN KEY (aircraft_id) REFERENCES aircrafts(aircraft_id),
    FOREIGN KEY (origin_airport_id) REFERENCES airports(airport_id),
    FOREIGN KEY (destination_airport_id) REFERENCES airports(airport_id)
);
11. Завдання на прибирання (cleaning_tasks)

CREATE TABLE cleaning_tasks (
    task_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_id INT NOT NULL,
    service_id INT NOT NULL,
    assigned_shift_id INT NOT NULL,
    scheduled_start DATETIME NOT NULL,
    actual_start DATETIME,
    actual_end DATETIME,
    status ENUM('pending', 'in_progress', 'completed', 'cancelled') DEFAULT 'pending',
    supervisor_notes TEXT,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id),
    FOREIGN KEY (service_id) REFERENCES cleaning_services(service_id),
    FOREIGN KEY (assigned_shift_id) REFERENCES work_shifts(shift_id)
);
12. Призначення обладнання (equipment_assignments)

CREATE TABLE equipment_assignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    task_id INT NOT NULL,
    equipment_id INT NOT NULL,
    check_out_time DATETIME NOT NULL,
    check_in_time DATETIME,
    operator_id INT,
    FOREIGN KEY (task_id) REFERENCES cleaning_tasks(task_id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id),
    FOREIGN KEY (operator_id) REFERENCES staff(staff_id)
);
13. Використані матеріали (consumables_usage)

CREATE TABLE consumables_usage (
    usage_id INT PRIMARY KEY AUTO_INCREMENT,
    task_id INT NOT NULL,
    consumable_type VARCHAR(50) NOT NULL,
    quantity_used DECIMAL(10,2) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    FOREIGN KEY (task_id) REFERENCES cleaning_tasks(task_id)
);
14. Перевірки якості (quality_checks)

CREATE TABLE quality_checks (
    check_id INT PRIMARY KEY AUTO_INCREMENT,
    task_id INT NOT NULL,
    inspector_id INT NOT NULL,
    check_time DATETIME NOT NULL,
    passed BOOLEAN NOT NULL,
    notes TEXT,
    FOREIGN KEY (task_id) REFERENCES cleaning_tasks(task_id),
    FOREIGN KEY (inspector_id) REFERENCES staff(staff_id)
);
15. Контракти з авіакомпаніями (service_contracts)

CREATE TABLE service_contracts (
    contract_id INT PRIMARY KEY AUTO_INCREMENT,
    airline_id INT NOT NULL,
    airport_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    contract_type ENUM('full_service', 'cleaning_only', 'deicing_only') NOT NULL,
    payment_terms VARCHAR(100),
    special_requirements TEXT,
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id),
    FOREIGN KEY (airport_id) REFERENCES airports(airport_id)
);