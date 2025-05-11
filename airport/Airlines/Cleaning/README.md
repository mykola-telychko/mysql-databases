# cleaning-service



Клінінг повітряних суден — це складний процес, який включає прибирання салону, дезінфекцію, знежирення поверхонь, видалення льоду та снігу, а також обслуговування зовнішніх частин літака.

1. Хто займається прибиранням літаків?
А. Внутрішній клінінг (салон, кабіна пілотів, туалети)
Клінінгові бригади аеропорту – спеціалізовані працівники, які проводять:

Швидке прибирання між рейсами (turnaround cleaning).

Глибоке прибирання після останнього рейсу (night stop cleaning).

Дезінфекцію (особливо після пандемії COVID-19).
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

3. Послуги клінінгу (cleaning_services)
CREATE TABLE cleaning_services (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    base_price DECIMAL(10,2) NOT NULL,
    duration_min INT NOT NULL,
    service_level ENUM('quick', 'standard', 'deep') NOT NULL
);

4. Персонал (staff)
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
MOЖЕ БУТИ ЧАСТИНОЮ staff ЗАГАЛЬНОЇ 
Сертифікація персоналу (staff_certifications)
Мета: Деталізація сертифікацій працівників (наприклад, дезінфекція, робота з хімікатами).
CREATE TABLE staff_certifications (
    certification_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_id INT NOT NULL,
    certification_name VARCHAR(100) NOT NULL,
    issue_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

5. Обладнання (equipment)
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

6. Робочі зміни (work_shifts)
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

7. Призначення персоналу (staff_assignments)
CREATE TABLE staff_assignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_id INT NOT NULL,
    shift_id INT NOT NULL,
    role VARCHAR(50) NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY (shift_id) REFERENCES work_shifts(shift_id)
);

8. Завдання на прибирання (cleaning_tasks)
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
Графік технічного обслуговування обладнання (equipment_maintenance_schedule)
Мета: Планування майбутніх ТО для обладнання.
CREATE TABLE equipment_maintenance_schedule (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    equipment_id INT NOT NULL,
    scheduled_date DATE NOT NULL,
    maintenance_type ENUM('preventive', 'corrective') NOT NULL,
    technician_id INT,
    notes TEXT,
    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id),
    FOREIGN KEY (technician_id) REFERENCES staff(staff_id)
);

9. Призначення обладнання (equipment_assignments)
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

10. Використані матеріали (consumables_usage)
CREATE TABLE consumables_usage (
    usage_id INT PRIMARY KEY AUTO_INCREMENT,
    task_id INT NOT NULL,
    consumable_type VARCHAR(50) NOT NULL,
    quantity_used DECIMAL(10,2) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    FOREIGN KEY (task_id) REFERENCES cleaning_tasks(task_id)
);

11. Перевірки якості (quality_checks)
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

12. Контракти з авіакомпаніями (service_contracts)
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

-------------
here new tables 

Це для АДМІНІСТРАЦІЇ клінінгу . -------------------------
Склад витратних матеріалів (consumables_inventory)
Мета: Відстежувати залишки витратних матеріалів (наприклад, миючі засоби, дезінфектанти).
CREATE TABLE consumables_inventory (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    consumable_type VARCHAR(50) NOT NULL,
    quantity_in_stock DECIMAL(10,2) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    last_restock DATE,
    supplier_id INT,
    airport_id INT NOT NULL,
    FOREIGN KEY (airport_id) REFERENCES airports(airport_id)
);
Постачальники (suppliers)
Мета: Відстеження постачальників обладнання та матеріалів.
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contact_phone VARCHAR(20),
    contact_email VARCHAR(100),
    supplied_item_type ENUM('equipment', 'consumables') NOT NULL
);
-------------------------

Організація клінінгу в авіалініях: хто відповідає та як це працює
Відповідальні особи/відділи:
Операційний менеджмент авіакомпанії
Визначає стандарти прибирання (частота, використання матеріалів) через таблицю service_contracts.
Контролює виконання контрактів з аеропортами або третіми компаніями.
Аеропорт (відділ обслуговування)
    Безпосередньо організовує процес через таблиці work_shifts, staff_assignments, cleaning_tasks.
    Призначає керівника зміни (team_leader_id у work_shifts).

Персонал
Команда клінінгу:
    Працівники зі статусом active у таблиці staff, призначені на зміни через staff_assignments.
    Використовують обладнання (equipment_assignments) та матеріали (consumables_usage).

Інспектори якості:
    Перевіряють виконання завдань через quality_checks.
    Мають сертифікації (поле certification у staff).

Процес організації:
Планування:
    На основі розкладу рейсів (flights) і типу літака (aircraft_types.cleaning_time_min) створюються завдання (cleaning_tasks).

Враховуються контрактні умови (service_contracts.contract_type).
Виконання:
    Персонал працює у змінах (work_shifts), використовуючи обладнання (equipment_assignments).
    Фіксуються витрати матеріалів (consumables_usage).

Контроль:
    Інспектори (quality_checks.inspector_id) перевіряють якість.
    Статус прибирання оновлюється у flights.cleaning_status.

Варіанти моделі:
    Власний персонал аеропорту: Якщо service_contracts.contract_type = 'full_service'.
    Сторонні підрядники: Якщо аеропорт не має cleaning_services_available = TRUE.
    Персонал авіакомпанії: Для VIP-рейсів або спецзавдань (відображається у cleaning_tasks.supervisor_notes).