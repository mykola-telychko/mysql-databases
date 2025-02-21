# PASSENGERS


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
