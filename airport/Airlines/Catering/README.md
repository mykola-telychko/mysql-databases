### **Як працює кейтеринг у літаках?**  
Кейтеринг у авіації — це організація харчування пасажирів під час польоту. 
Він включає приготування, доставку та роздачу їжі та напоїв.
Це складна система, в якій задіяні авіакомпанії, спеціалізовані кейтерингові служби та бортпровідники.  

Services. Треба консультація з Карпенком на рахунок кейтерингу бо це банкет на якому крім планових 
страв ще є замовлені. Airlines-Aircraft’s-services. Побудувати правильну ієрархію .
Чи має бути частиною айркрафт кейтеринг який вказаний в юніті айркрафт. 
Кейтеринг переплановується в залежності від місця куди прилітає літак¿ чи він має продукти туди і назад

---

## **Хто відповідає за кейтеринг у літаках?**  

### **1. Авіакомпанія**  
- Визначає меню (залежно від класу обслуговування: економ, бізнес, перший).  
- Встановлює стандарти якості та кількість порцій.  
- Може мати власну кейтерингову службу або укладати контракти зі сторонніми постачальниками.  

### **2. Кейтерингова компанія (авіакухня)**  
- Готує їжу заздалегідь з урахуванням санітарних норм і термінів зберігання.  
- Фасує їжу в спеціальні контейнери, які можна розігрівати в літаку.  
- Доставляє їжу на борт перед вильотом (зазвичай за 1–2 години).  

### **3. Бортпровідники (стюардеси/стюарди)**  
- Безпосередньо забезпечують сервірування їжі та напоїв пасажирам.  
- Відповідають за зберігання, розігрів і подачу страв.  

---

## **Роль стюардес у кейтерингу**  

### **1. Передпольотна підготовка**  
- Перевіряють кількість і якість їжі (терміни придатності, цілісність упаковки).  
- Контролюють наявність спецзамовлень (веганські, халяль, кошерні, дієтичні страви).  

### **2. Розігрів і сервірування їжі**  
- Використовують бортові печі (гальмівні шафи) для розігріву страв.  
- В економ-класі їжу розносять на спеціальних візках, у бізнес-/першому класі — індивідуально сервірують столи.  

### **3. Роздача напоїв**  
- Готують каву, чай, алкогольні та безалкогольні напої.  
- Враховують побажання пасажирів (лід, лимон, цукор тощо).  

### **4. Дотримання санітарних норм**  
- Стежать за чистотою в кухонному відсіку.  
- Утилізують відходи (порожні упаковки, одноразовий посуд).  

### **5. Обслуговування VIP-пасажирів**  
- У бізнес-/першому класі можуть подавати страви з меню ресторанного рівня.  
- Пропонують вибір вин та інших напоїв.  

---

## **Особливості авіакейтерингу**  
✔ **Терміни зберігання** – їжа готується за 12–24 години до польоту, щоб запобігти псуванню.  
✔ **Спеціальне обладнання** – у літаках є печі для розігріву, холодильники для напоїв.  
✔ **Спецзамовлення** – можна замовити особливе меню заздалегідь (наприклад, для дітей, алергіків).  
✔ **Обмеження** – у коротких рейсах можуть подавати лише снеки та напої.  

### **Висновок**  
Стюардеси грають ключову роль у кейтерингу: вони не просто розносять їжу,
а контролюють якість, готують напої та забезпечують комфорт пасажирів. Без їхньої роботи 
сервіс харчування на борту був би неможливим.

-------------------------------------

# My Database Schema for Aircraft Catering Service

Here's a complete set of 15 tables that model the in-flight catering service domain:

## 1. Airlines
CREATE TABLE Airlines (
    airline_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    iata_code CHAR(2) UNIQUE,
    catering_standard VARCHAR(50),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20)
);

## 2. Aircraft_Types
CREATE TABLE Aircraft_Types (
    aircraft_type_id INT PRIMARY KEY AUTO_INCREMENT,
    manufacturer VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    max_passengers INT,
    galley_count INT,
    oven_count INT,
    UNIQUE KEY (manufacturer, model)
);

## 3. Flights
CREATE TABLE Flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(10) NOT NULL,
    airline_id INT NOT NULL,
    aircraft_type_id INT NOT NULL,
    departure_airport CHAR(3) NOT NULL,
    arrival_airport CHAR(3) NOT NULL,
    scheduled_departure DATETIME NOT NULL,
    scheduled_arrival DATETIME NOT NULL,
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id),
    FOREIGN KEY (aircraft_type_id) REFERENCES Aircraft_Types(aircraft_type_id)
);

## 4. Cabin_Classes
CREATE TABLE Cabin_Classes (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(20) NOT NULL UNIQUE,
    description VARCHAR(100),
    service_level INT
);

Для **великої системи** (особливо якщо передбачається розширення) краще тримати окремо. 
## 5. Meal_Types
CREATE TABLE Meal_Types (
    meal_type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(200),
    dietary_category VARCHAR(50)
);

## 6. Meal_Items
CREATE TABLE Meal_Items (
    meal_item_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    meal_type_id INT,
    is_vegetarian BOOLEAN DEFAULT FALSE,
    is_vegan BOOLEAN DEFAULT FALSE,
    is_gluten_free BOOLEAN DEFAULT FALSE,
    calories INT,
    FOREIGN KEY (meal_type_id) REFERENCES Meal_Types(meal_type_id)
);

## 7. Beverages
CREATE TABLE Beverages (
    beverage_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category ENUM('Alcoholic', 'Non-Alcoholic', 'Hot Drink') NOT NULL,
    is_alcoholic BOOLEAN DEFAULT FALSE,
    serving_temperature VARCHAR(20),
    container_type VARCHAR(30)
);

## 8. Catering_Companies
CREATE TABLE Catering_Companies (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    airport_code CHAR(3) NOT NULL,
    contact_person VARCHAR(100),
    contact_phone VARCHAR(20),
    contract_start DATE,
    contract_end DATE
);

## 9. Flight_Meal_Plans
CREATE TABLE Flight_Meal_Plans (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_id INT NOT NULL,
    class_id INT NOT NULL,
    meal_type_id INT NOT NULL,
    meal_item_id INT NOT NULL,
    beverage_id INT,
    serving_order INT,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (class_id) REFERENCES Cabin_Classes(class_id),
    FOREIGN KEY (meal_type_id) REFERENCES Meal_Types(meal_type_id),
    FOREIGN KEY (meal_item_id) REFERENCES Meal_Items(meal_item_id),
    FOREIGN KEY (beverage_id) REFERENCES Beverages(beverage_id)
);

## 10. Crew_Members
CREATE TABLE Crew_Members (
    crew_id INT PRIMARY KEY AUTO_INCREMENT,
    airline_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position ENUM('Purser', 'Flight Attendant', 'Cabin Crew') NOT NULL,
    hire_date DATE,
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id)
);

## 11. Flight_Crew_Assignments
CREATE TABLE Flight_Crew_Assignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_id INT NOT NULL,
    crew_id INT NOT NULL,
    role VARCHAR(50) NOT NULL,
    responsibility_zone VARCHAR(20),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (crew_id) REFERENCES Crew_Members(crew_id)
);

## 12. Special_Meal_Requests
CREATE TABLE Special_Meal_Requests (
    request_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_name VARCHAR(100) NOT NULL,
    flight_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    meal_type_id INT NOT NULL,
    special_notes TEXT,
    is_fulfilled BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (meal_type_id) REFERENCES Meal_Types(meal_type_id)
);

## 13. Catering_Orders
CREATE TABLE Catering_Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_id INT NOT NULL,
    catering_company_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    delivery_time DATETIME NOT NULL,
    status ENUM('Planned', 'Delivered', 'Verified', 'Issued') NOT NULL,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (catering_company_id) REFERENCES Catering_Companies(company_id)
);

## 14. Catering_Order_Details
CREATE TABLE Catering_Order_Details (
    detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    meal_item_id INT,
    beverage_id INT,
    quantity INT NOT NULL,
    for_class_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Catering_Orders(order_id),
    FOREIGN KEY (meal_item_id) REFERENCES Meal_Items(meal_item_id),
    FOREIGN KEY (beverage_id) REFERENCES Beverages(beverage_id),
    FOREIGN KEY (for_class_id) REFERENCES Cabin_Classes(class_id)
);

## 15. Service_Logs
CREATE TABLE Service_Logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_id INT NOT NULL,
    crew_id INT NOT NULL,
    service_type ENUM('Meal', 'Beverage', 'Special Request') NOT NULL,
    service_time DATETIME NOT NULL,
    passenger_count INT,
    notes TEXT,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (crew_id) REFERENCES Crew_Members(crew_id)
);

This schema covers all aspects of in-flight catering:
- Airline and aircraft information
- Meal and beverage definitions
- Catering company relationships
- Crew assignments and responsibilities
- Special meal requests
- Ordering and delivery logistics
- Service tracking and logging

The relationships between tables ensure data integrity while allowing for comprehensive reporting on catering operations.

------------------
заміна табоиці флайтс

Замінюю таблицю **Flights** на більш спеціалізовану таблицю **Flight_Service_Schedules**, яка фокусується саме на організації сервісу на борту:


CREATE TABLE Flight_Service_Schedules (
    service_schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(10) NOT NULL,
    airline_id INT NOT NULL,
    aircraft_type_id INT NOT NULL,
    departure_datetime DATETIME NOT NULL,
    flight_duration_minutes INT NOT NULL,
    
    -- Інформація для сервісу
    planned_meal_services TINYINT NOT NULL DEFAULT 1 COMMENT 'Кількість запланованих харчових сервісів',
    beverage_rounds TINYINT NOT NULL DEFAULT 2 COMMENT 'Кількість запланованих роздач напоїв',
    special_service_notes TEXT COMMENT 'Особливі вказівки щодо обслуговування',
    is_premium_route BOOLEAN DEFAULT FALSE COMMENT 'Прапор преміум-маршруту',
    
    -- Логістика кейтерингу
    catering_load_time DATETIME COMMENT 'Час завантаження кейтерингу',
    catering_company_id INT,
    
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id),
    FOREIGN KEY (aircraft_type_id) REFERENCES Aircraft_Types(aircraft_type_id),
    FOREIGN KEY (catering_company_id) REFERENCES Catering_Companies(company_id)
);

### Ключові поліпшення цієї таблиці:

1. **Специфіка для сервісу**:
   - Чіткі поля для кількості харчових сервісів і роздач напоїв
   - Місце для спеціальних інструкцій щодо обслуговування

2. **Практичні дані для бортпровідників**:
   - Тривалість польоту в хвилинах (для планування сервісу)
   - Преміум-маршрут (ознака особливого сервісу)

3. **Логістика кейтерингу**:
   - Час завантаження їжі на борт
   - Пряме посилання на кейтерингову компанію

4. **Оптимізація для звітів**:
   - Легко аналізувати кількість сервісів за маршрутами
   - Просто планувати навантаження на бортпровідників

### Як це допомагає в сервісі на борту:

1. **Планування сервісу**:
   SELECT flight_number, planned_meal_services, beverage_rounds 
   FROM Flight_Service_Schedules 
   WHERE departure_datetime BETWEEN '2023-12-01' AND '2023-12-31';
   

2. **Підготовка особливих випадків**:
   SELECT * FROM Flight_Service_Schedules 
   WHERE special_service_notes IS NOT NULL;
   

3. **Координація з кейтерингом**:
   SELECT fss.flight_number, cc.name AS catering_company, fss.catering_load_time
   FROM Flight_Service_Schedules fss
   JOIN Catering_Companies cc ON fss.catering_company_id = cc.company_id
   WHERE fss.departure_datetime > NOW();
   
Ця структура більш орієнтована на безпосереднє забезпечення сервісу на борту, ніж загальна інформація про рейси.

-------
describe processes
