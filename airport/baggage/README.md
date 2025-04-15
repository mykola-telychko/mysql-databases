# BUGGAGE

CANONICAL FLIGHTS 
https://github.com/mykola-telychko/mysql-databases/blob/main/airport/README.md

-- Is it possible to merge some tables (about)? 

1. Baggage (Багаж)
    baggage_id	INT PRIMARY KEY	Унікальний ідентифікатор багажу
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    employee_id (ID співробітника, який виконав дію).
    flight_id	INT	Зовнішній ключ до таблиці Flights
    checked_in_by (ID співробітника, який зареєстрував багаж).
    weight	DECIMAL(5,2)	Вага багажу (кг)
     dimensions (Розміри)
    type	VARCHAR(50)	Тип багажу (baggage_type_id, наприклад, ручна поклажа, валіза)
    status	VARCHAR(50)	Стан багажу (наприклад, зареєстровано,доставлений, втрачено)
    current_location (Поточне місцезнаходження)


2. BaggageCheckIn (Реєстрація багажу)
    
    check_in_id	INT PRIMARY KEY	Унікальний ідентифікатор реєстрації
    baggage_id	INT	Зовнішній ключ до таблиці Baggage
    check_in_time	DATETIME	Час реєстрації багажу
    check_in_counter	VARCHAR(50)	Номер стойки реєстрації

3. BaggageTags (Бірки багажу)
    
    tag_id	INT PRIMARY KEY	Унікальний ідентифікатор бірки
    baggage_id	INT	Зовнішній ключ до таблиці Baggage
    tag_number	VARCHAR(50)	Номер бірки
    issue_time	DATETIME	Час видачі бірки

4. (ADD TO EVENtS bgg) BaggageSorting (Сортування багажу)
    sorting_id	INT PRIMARY KEY	Унікальний ідентифікатор сортування
    baggage_id	INT	Зовнішній ключ до таблиці Baggage
    sorting_time	DATETIME	Час сортування
    destination_zone	VARCHAR(100)	Зона призначення (наприклад, рейс, зона видачі)

5. BaggageTransport (Транспортування багажу)
        transport_id	INT PRIMARY KEY	Унікальний ідентифікатор транспортування
        baggage_id	INT	Зовнішній ключ до таблиці Baggage
        transport_time	DATETIME	Час транспортування
        transport_method	VARCHAR(100)	Метод транспортування (наприклад, конвеєр, тележка)

6. BaggageClaim (Видача багажу)
        
        claim_id	INT PRIMARY KEY	Унікальний ідентифікатор видачі
        baggage_id	INT	Зовнішній ключ до таблиці Baggage
        claim_time	DATETIME	Час видачі багажу
        claim_area	VARCHAR(100)	Зона видачі багажу

7. LostBaggage (Втрачений багаж)
    lost_id	INT PRIMARY KEY	Унікальний ідентифікатор втраченого багажу
    baggage_id	INT	Зовнішній ключ до таблиці Baggage
    report_time	DATETIME	Час повідомлення про втрату
    status	VARCHAR(50)	Стан пошуку (наприклад, в пошуку, знайдено)

8. BaggageSearch (Пошук багажу)
        search_id	INT PRIMARY KEY	Унікальний ідентифікатор пошуку
        lost_id	INT	Зовнішній ключ до таблиці LostBaggage
        search_start_time	DATETIME	Час початку пошуку
        search_end_time	DATETIME	Час завершення пошуку
        result	VARCHAR(100)	Результат пошуку (наприклад, знайдено, не знайдено)

9. BaggageTypes (Типи багажу)
        type_id	INT PRIMARY KEY	Унікальний ідентифікатор типу багажу
        type_name	VARCHAR(100)	Назва типу (наприклад, ручна поклажа, валіза, спортивне обладнання)
        max_dimensions
        max_weight	DECIMAL(5,2)	Максимальна вага (кг)
        baggage_type_id (ID типу багажу)        

10. BaggageFees (Тарифи за багаж)(FINANCE department?) 
        fee_id	INT PRIMARY KEY	Унікальний ідентифікатор тарифу
        baggage_type_id (ID типу багажу, Зовнішній ключ до таблиці BaggageTypes)
        weight_limit (Ліміт ваги)
        price (Ціна)
        fee_amount	DECIMAL(10,2)	Сума тарифу
        effective_date	DATE	Дата набуття чинності


11. BaggageHandlingEvents (Події з багажем)
        event_id (ID події)
        baggage_id (ID багажу)
        event_type (Тип події: реєстрація, завантаження, розвантаження, доставка, втрата)
        timestamp (Час події)
        location (Місце, де відбулася подія)

12. BaggageInspection (Інспекція багажу)
        inspection_id	INT PRIMARY KEY	Унікальний ідентифікатор інспекції
        baggage_id	INT	Зовнішній ключ до таблиці Baggage
        inspection_time	DATETIME	Час інспекції
        result	VARCHAR(100)	Результат інспекції (наприклад, дозволено, заборонено)

13. BaggageStorage (Зберігання багажу)
    storage_id	INT PRIMARY KEY	Унікальний ідентифікатор зберігання
    baggage_id	INT	Зовнішній ключ до таблиці Baggage
    storage_start	DATETIME	Час початку зберігання
    storage_end	DATETIME	Час завершення зберігання
    storage_location	VARCHAR(255)	Місце зберігання

14. BaggageClaimsLog (Логи претензій щодо багажу/Заявки про втрачений багаж-LostBaggageClaims)
    claim_log_id	INT PRIMARY KEY	Унікальний ідентифікатор логу претензій
    baggage_id	INT	Зовнішній ключ до таблиці Baggage
    passengere_id
    claim_description	TEXT	Опис претензії
    claim_time	DATETIME	Час подання претензії
    status	VARCHAR(50)	Стан претензії (наприклад, розглядається, вирішено,знайдено, не знайдено)

15. (SERVICESandSTAFF?) BaggageHandlingEquipment (Обладнання для обробки багажу):
    equipment_id (ID обладнання)
    equipment_type (Тип обладнання: конвеєр, сканер тощо)
    location (Місцезнаходження обладнання)

---------------
-- old
 Baggage (Багаж)
 BaggageCheckIn (Реєстрація багажу)
 BaggageTags (Бірки багажу)
 BaggageTransport (Транспортування багажу)
 BaggageClaim (Видача багажу)
 LostBaggage (Втрачений багаж)
 BaggageSearch (Пошук багажу)
 BaggageTypes (Типи багажу)
 BaggageFees (Тарифи за багаж)
 BaggageInspection (Інспекція багажу)
 BaggageStorage (Зберігання багажу)
 BaggageClaimsLog 
 ----------------

Baggage
BaggageCheckIn
BaggageTags
BaggageTransport
BaggageClaim
LostBaggage
BaggageSearch
BaggageFees
BaggageHandlingEvents
BaggageInspection
BaggageStorage
BaggageClaimsLog
BaggageTypes
BaggageHandlingEquipment

-------

Основні процеси:


Реєстрація багажу:
- add equip_id for several 
Пасажир реєструє багаж під час check-in.
Багажу присвоюється унікальний ідентифікатор.

Сортування та транспортування:
        Багаж сортується за рейсами та транспортується до відповідного літака.

Видача багажу:
        Багаж видається пасажиру після прибуття рейсу.

Пошук втраченого багажу:
        Якщо багаж втрачено, ініціюється процес пошуку.

Інспекція та зберігання:
        Багаж може проходити інспекцію або тимчасово зберігатися.

Обробка претензій:
        Пасажир може подати претензію щодо багажу.

----
Зв'язки між таблицями:
1. Baggage (Багаж)
Зв'язок один до одного:

- BaggageCheckIn: Кожен багаж реєструється один раз.
- BaggageTags: Кожен багаж має одну бірку.
- BaggageTypes: Кожен багаж належить до одного типу.

Зв'язок один до багатьох:
        - BaggageTransport: Багаж може транспортуватися кілька разів.
        - BaggageHandlingEvents: Багаж може мати кілька подій обробки.
        - BaggageInspection: Багаж може проходити інспекцію кілька разів.
        - BaggageStorage: Багаж може зберігатися кілька разів.
        - BaggageClaimsLog: Багаж може мати кілька претензій.

2. BaggageCheckIn (Реєстрація багажу)

3. BaggageTags (Бірки багажу)

4. BaggageTransport (Транспортування багажу)
Зв'язок багато до одного:
        - BaggageHandlingEquipment: Кожне транспортування може використовувати одне обладнання.

5. BaggageClaim (Видача багажу)
Зв'язок багато до одного:
        - Baggage: Кожна видача пов'язана з одним багажем.

6. LostBaggage (Втрачений багаж)
Зв'язок багато до одного:
        - Baggage: Кожен втрачений багаж пов'язаний з одним багажем.

7. BaggageSearch (Пошук багажу) ???
Зв'язок багато до одного:
        - LostBaggage: Кожен пошук пов'язаний з одним втраченим багажем.

8. BaggageFees (Тарифи за багаж)
Зв'язок багато до одного:
        - BaggageTypes: Кожен тариф пов'язаний з одним типом багажу.

9. BaggageHandlingEvents (Події обробки багажу)

10. BaggageInspection (Інспекція багажу)

11. BaggageStorage (Зберігання багажу)

12. BaggageClaimsLog (Логи претензій щодо багажу)
        Зв'язок багато до одного:
        З Baggage: Кожна претензія пов'язана з одним багажем.

13. BaggageTypes (Типи багажу)
Зв'язок один до багатьох:
        З Baggage: Кожен тип багажу може бути пов'язаний з багатьма багажами. (??? diff types)
        - BaggageFees: Кожен тип багажу може мати кілька тарифів

14. BaggageHandlingEquipment (Обладнання для обробки багажу)
Зв'язок один до багатьох:
        - BaggageTransport: Одне обладнання може використовуватися для багатьох транспортувань.
        З BaggageHandlingEvents: Одне обладнання може використовуватися для багатьох подій обробки.

Візуалізація зв'язків:
        Baggage є центральною таблицею, яка пов'язана з більшістю інших таблиць.

        BaggageTypes та BaggageHandlingEquipment є довідковими таблицями, які використовуються для класифікації багажу та обробки.
        LostBaggage та BaggageSearch пов'язані між собою для обробки втраченого багажу.