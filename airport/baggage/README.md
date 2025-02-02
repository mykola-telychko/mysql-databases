# BUGGAGE

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
        max_weight	DECIMAL(5,2)	Максимальна вага (кг)

10. BaggageFees (Тарифи за багаж)
        
        fee_id	INT PRIMARY KEY	Унікальний ідентифікатор тарифу
        type_id	INT	Зовнішній ключ до таблиці BaggageTypes
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

14. BaggageClaimsLog (Логи претензій щодо багажу)
    
    claim_log_id	INT PRIMARY KEY	Унікальний ідентифікатор логу претензій
    baggage_id	INT	Зовнішній ключ до таблиці Baggage
    claim_description	TEXT	Опис претензії
    claim_time	DATETIME	Час подання претензії
    status	VARCHAR(50)	Стан претензії (наприклад, розглядається, вирішено)

15. BaggageTypes (Типи багажу)
        baggage_type_id (ID типу багажу)
        type_name (Назва типу багажу, наприклад, валіза, сумка, спортивний інвентар)

(FINANCE department?) 
16. BaggageFees (Тарифи за багаж)
        fee_id (ID тарифу)
        baggage_type_id (ID типу багажу)
        weight_limit (Ліміт ваги)
        price (Ціна)

17. LostBaggageClaims (Заявки про втрачений багаж)
        claim_id (ID заявки)
        baggage_id (ID багажу)
        passenger_id (ID пасажира)
        claim_date (Дата подання заявки)
        status (Статус заявки: розглядається, знайдено, не знайдено)

18. (SERVICESandSTAFF?) BaggageHandlingEquipment (Обладнання для обробки багажу):
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