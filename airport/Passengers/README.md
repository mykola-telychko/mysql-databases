# PASSENGERS

1. Passengers (Пасажири)
    passenger_id	INT PRIMARY KEY	Унікальний ідентифікатор пасажира
    first_name	VARCHAR(100)	Ім'я пасажира
    last_name	VARCHAR(100)	Прізвище пасажира
    passport_number	VARCHAR(50)	Номер паспорта
    nationality	VARCHAR(100)	Національність
    date_of_birth	DATE	Дата народження
    gender	VARCHAR(10)	Стать
    contact_number	VARCHAR(20)	Контактний номер
    email	VARCHAR(255)	Електронна пошта
    frequent_flyer_number	VARCHAR(50)	Номер програми лояльності

2. Flights (Рейси)
    flight_id	INT PRIMARY KEY	Унікальний ідентифікатор рейсу
    flight_number	VARCHAR(50)	Номер рейсу
    departure_airport	VARCHAR(100)	Аеропорт вильоту
    arrival_airport	VARCHAR(100)	Аеропорт прибуття
    departure_time	DATETIME	Час вильоту
    arrival_time	DATETIME	Час прибуття
    aircraft_type	VARCHAR(100)	Тип літака
    airline	VARCHAR(100)	Авіакомпанія
    status	VARCHAR(50)	Стан рейсу (наприклад, за розкладом, затримано)

3. Tickets (Квитки)
    ticket_id	INT PRIMARY KEY	Унікальний ідентифікатор квитка
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    flight_id	INT	Зовнішній ключ до таблиці Flights
    seat_number	VARCHAR(10)	Номер місця
    ticket_class	VARCHAR(50)	Клас квитка (наприклад, економ, бізнес)
    purchase_date	DATETIME	Дата покупки квитка
    price	DECIMAL(10,2)	Ціна квитка
    status	VARCHAR(50)	Стан квитка (наприклад, активний, скасований)

4. Baggage (Багаж ) ---- SKIP?? /baggage
    baggage_id	INT PRIMARY KEY	Унікальний ідентифікатор багажу
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    flight_id	INT	Зовнішній ключ до таблиці Flights
    weight	DECIMAL(5,2)	Вага багажу (кг)
    type	VARCHAR(50)	Тип багажу (наприклад, ручна поклажа, валіза)
    status	VARCHAR(50)	Стан багажу (наприклад, зареєстровано, втрачено)

5. CheckIn (Реєстрація)
    check_in_id	INT PRIMARY KEY	Унікальний ідентифікатор реєстрації
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    flight_id	INT	Зовнішній ключ до таблиці Flights
    check_in_time	DATETIME	Час реєстрації
    check_in_counter	VARCHAR(50)	Номер стойки реєстрації
    baggage_count	INT	Кількість багажу
    status	VARCHAR(50)	Стан реєстрації (наприклад, успішно, скасовано)

6. PassportControl (Паспортний контроль)
    control_id	INT PRIMARY KEY	Унікальний ідентифікатор контролю
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    flight_id	INT	Зовнішній ключ до таблиці Flights
    control_time	DATETIME	Час проходження контролю
    officer_name	VARCHAR(100)	Ім'я офіцера
    status	VARCHAR(50)	Стан контролю (наприклад, успішно, відмовлено)

7. CustomsControl (Митний контроль)
    customs_id	INT PRIMARY KEY	Унікальний ідентифікатор контролю
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    flight_id	INT	Зовнішній ключ до таблиці Flights
    control_time	DATETIME	Час проходження контролю
    officer_name	VARCHAR(100)	Ім'я офіцера
    status	VARCHAR(50)	Стан контролю (наприклад, успішно, відмовлено)

8. SecurityCheck (Перевірка безпеки) ---- FOR?? /serucity
    security_id	INT PRIMARY KEY	Унікальний ідентифікатор перевірки
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    flight_id	INT	Зовнішній ключ до таблиці Flights
    check_time	DATETIME	Час перевірки
    officer_name	VARCHAR(100)	Ім'я офіцера
    status	VARCHAR(50)	Стан перевірки (наприклад, успішно, відмовлено)

9. Boarding (Посадка) ---- FOR?? /terminal
        boarding_id	INT PRIMARY KEY	Унікальний ідентифікатор посадки
        passenger_id	INT	Зовнішній ключ до таблиці Passengers
        flight_id	INT	Зовнішній ключ до таблиці Flights
        boarding_time	DATETIME	Час посадки
        gate_number	VARCHAR(10)	Номер виходу
        status	VARCHAR(50)	Стан посадки (наприклад, успішно, відмовлено)

10. WaitingAreas (Зони очікування) ---- FOR?? /infrastracture
        area_id	INT PRIMARY KEY	Унікальний ідентифікатор зони
        flight_id	INT	Зовнішній ключ до таблиці Flights
        area_name	VARCHAR(100)	Назва зони очікування
        capacity	INT	Місткість зони
        status	VARCHAR(50)	Стан зони (наприклад, відкрита, закрита)

11. PassengerLocations (Місцезнаходження пасажирів)
        location_id	INT PRIMARY KEY	Унікальний ідентифікатор місця
        passenger_id	INT	Зовнішній ключ до таблиці Passengers
        flight_id	INT	Зовнішній ключ до таблиці Flights
        location_type	VARCHAR(50)	Тип місця (наприклад, зона очікування, посадка)
        timestamp	DATETIME	Час перебування

12. FlightStatusUpdates (Оновлення статусу рейсу)
        update_id	INT PRIMARY KEY	Унікальний ідентифікатор оновлення
        flight_id	INT	Зовнішній ключ до таблиці Flights
        update_time	DATETIME	Час оновлення
        status	VARCHAR(100)	Новий статус рейсу
        description	TEXT	Опис оновлення

13. PassengerServices (Послуги для пасажирів)
        service_id	INT PRIMARY KEY	Унікальний ідентифікатор послуги
        passenger_id	INT	Зовнішній ключ до таблиці Passengers
        service_type	VARCHAR(100)	Тип послуги (наприклад, VIP, догляд за дітьми)
        service_time	DATETIME	Час надання послуги
        status	VARCHAR(50)	Стан послуги (наприклад, активна, завершена)

14. FlightDelays (Затримки рейсів)
        delay_id	INT PRIMARY KEY	Унікальний ідентифікатор затримки
        flight_id	INT	Зовнішній ключ до таблиці Flights
        delay_start	DATETIME	Час початку затримки
        delay_end	DATETIME	Час завершення затримки
        reason	TEXT	Причина затримки

15. PassengerFeedback (Відгуки/скарги пасажирів)
        feedback_id	INT PRIMARY KEY	Унікальний ідентифікатор відгуку
        passenger_id	INT	Зовнішній ключ до таблиці Passengers
        flight_id	INT	Зовнішній ключ до таблиці Flights
        feedback_text	TEXT	Текст відгуку
        rating	INT	Оцінка (наприклад, від 1 до 5)
        feedback_time	DATETIME	Час відгуку

---------------------------------

RESEARCH this tables 

1. PassengerPreferences (Переваги пасажирів)
    preference_id	INT PRIMARY KEY	Унікальний ідентифікатор переваги
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    preference_type	VARCHAR(100)	Тип переваги (наприклад, вегетаріанське харчування, вікно)
    preference_value	VARCHAR(255)	Значення переваги

2. LoungeAccess (Доступ до лаунжів)
    access_id	INT PRIMARY KEY	Унікальний ідентифікатор доступу
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    lounge_name	VARCHAR(100)	Назва лаунжу
    access_time	DATETIME	Час доступу
    status	VARCHAR(50)	Стан доступу (наприклад, активний, завершений)

3. PassengerAssistance (Допомога пасажирам)
    assistance_id	INT PRIMARY KEY	Унікальний ідентифікатор допомоги
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    assistance_type	VARCHAR(100)	Тип допомоги (наприклад, інвалідний візок, переклад)
    request_time	DATETIME	Час запиту
    status	VARCHAR(50)	Стан допомоги (наприклад, надано, в очікуванні)

4. PassengerComplaints (Скарги пасажирів)
    complaint_id	INT PRIMARY KEY	Унікальний ідентифікатор скарги
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    complaint_type	VARCHAR(100)	Тип скарги (наприклад, затримка рейсу, втрачений багаж)
    complaint_text	TEXT	Текст скарги
    complaint_time	DATETIME	Час подання скарги
    status	VARCHAR(50)	Стан скарги (наприклад, розглядається, вирішено)

5. PassengerMetrics (Метрики пасажирів)
    metric_id	INT PRIMARY KEY	Унікальний ідентифікатор метрики
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    metric_type	VARCHAR(100)	Тип метрики (наприклад, час очікування, задоволеність)
    metric_value	DECIMAL(10,2)	Значення метрики
    metric_time	DATETIME	Час запису метрики

6. PassengerSurveys (Опитування пасажирів)
    survey_id	INT PRIMARY KEY	Унікальний ідентифікатор опитування
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    survey_type	VARCHAR(100)	Тип опитування (наприклад, задоволеність сервісом)
    survey_response	TEXT	Відповідь пасажира
    survey_time	DATETIME	Час опитування

7. PassengerLoyalty (Програми лояльності)
    loyalty_id	INT PRIMARY KEY	Унікальний ідентифікатор лояльності
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    loyalty_program	VARCHAR(100)	Назва програми лояльності
    points_balance	INT	Баланс балів
    status	VARCHAR(50)	Стан програми (наприклад, активна, неактивна)

8. PassengerHealth (Дані про здоров'я пасажирів)
    health_id	INT PRIMARY KEY	Унікальний ідентифікатор запису
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    health_status	VARCHAR(100)	Стан здоров'я (наприклад, алергія, хвороба)
    medical_notes	TEXT	Медичні примітки
    last_update	DATETIME	Час останнього оновлення

9. PassengerSpecialRequests (Спеціальні запити пасажирів)
    request_id	INT PRIMARY KEY	Унікальний ідентифікатор запиту
    passenger_id	INT	Зовнішній ключ до таблиці Passengers
    request_type	VARCHAR(100)	Тип запиту (наприклад, додаткове місце, спеціальне харчування)
    request_details	TEXT	Деталі запиту
    status	VARCHAR(50)	Стан запиту (наприклад, виконано, в очікуванні)

10. PassengerWaitTimes (Час очікування пасажирів)
        wait_id	INT PRIMARY KEY	Унікальний ідентифікатор запису
        passenger_id	INT	Зовнішній ключ до таблиці Passengers
        wait_type	VARCHAR(100)	Тип очікування (наприклад, реєстрація, паспортний контроль)
        wait_duration	INT	Тривалість очікування (у хвилинах)
        wait_time	DATETIME	Час очікування

11. PassengerFlowMetrics (Метрики потоку пасажирів)
        flow_id	INT PRIMARY KEY	Унікальний ідентифікатор метрики
        area_id	INT	Зовнішній ключ до таблиці WaitingAreas
        passenger_count	INT	Кількість пасажирів у зоні
        timestamp	DATETIME	Час запису метрики

12. PassengerSatisfaction (Задоволеність пасажирів)
        satisfaction_id	INT PRIMARY KEY	Унікальний ідентифікатор запису
        passenger_id	INT	Зовнішній ключ до таблиці Passengers
        satisfaction_score	INT	Оцінка задоволеності (наприклад, від 1 до 5)
        feedback	TEXT	Відгук пасажира
        timestamp	DATETIME	Час запису

13. PassengerIncidents (Інциденти з пасажирами)
        incident_id	INT PRIMARY KEY	Унікальний ідентифікатор інциденту
        passenger_id	INT	Зовнішній ключ до таблиці Passengers
        incident_type	VARCHAR(100)	Тип інциденту (наприклад, конфлікт, медичний випадок)
        description	TEXT	Опис інциденту
        timestamp	DATETIME	Час інциденту

14. PassengerNotifications (Сповіщення для пасажирів)
        notification_id	INT PRIMARY KEY	Унікальний ідентифікатор сповіщення
        passenger_id	INT	Зовнішній ключ до таблиці Passengers
        notification_type	VARCHAR(100)	Тип сповіщення (наприклад, затримка рейсу, зміна гейту)
        message	TEXT	Текст сповіщення
        timestamp	DATETIME	Час сповіщення

15. PassengerSpending (Витрати пасажирів)
        spending_id	INT PRIMARY KEY	Унікальний ідентифікатор витрат
        passenger_id	INT	Зовнішній ключ до таблиці Passengers
        spending_type	VARCHAR(100)	Тип витрат (наприклад, магазини, ресторани)
        amount	DECIMAL(10,2)	Сума витрат
        timestamp	DATETIME	Час витрат
