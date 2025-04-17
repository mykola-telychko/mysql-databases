
Services. це банкет на якому крім планових страв ще є замовлені. Airlines-Aircraft’s-services. Побудувати правильну ієрархію.
Чи має бути частиною айркрафт кейтеринг який вказаний в юніті айркрафт. 
Кейтеринг переплановується в залежності від місця куди прилітає літак¿ чи він має продукти туди і назад


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
а контролюють якість, готують напої та забезпечують комфорт пасажирів.

-------------------------------------

# Database Schema for Aircraft Catering Service

this model the in-flight catering service domain:

## 1. Airlines
CREATE TABLE Airlines (
    airline_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    iata_code CHAR(2) UNIQUE,
    catering_standard VARCHAR(50),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20)
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

  **Flight_Service_Schedules**, яка фокусується саме на організації сервісу на борту:


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

-------
Main script for presentation
describe processes 

### **Як працює кейтеринг у літаках?**  
Кейтеринг у авіації — це організація харчування пасажирів під час польоту. 
Він включає приготування, доставку та роздачу їжі та напоїв.
Це складна система, в якій задіяні авіакомпанії, спеціалізовані кейтерингові служби та бортпровідники. -- Aviation catering refers to the organization of in-flight meal services for passengers. This complex system encompasses food preparation, delivery, and distribution of meals and beverages onboard. It involves multiple stakeholders including airlines, specialized catering companies, and flight attendants.
