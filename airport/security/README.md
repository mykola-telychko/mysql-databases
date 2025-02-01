# Security


-------------------------

1. Cameras (Камери відеоспостереження)
    camera_id	INT PRIMARY KEY	Унікальний ідентифікатор камери
    location	VARCHAR(255)	Розташування камери
    type	VARCHAR(100)	Тип камери (наприклад, купольна, поворотна)
    status	VARCHAR(50)	Стан камери (активна, неактивна, на ремонті)
    last_maintenance	DATE	Дата останнього технічного обслуговування

2. SurveillanceLogs (Логи відеоспостереження)
    log_id	INT PRIMARY KEY	Унікальний ідентифікатор логу
    camera_id	INT	Зовнішній ключ до таблиці Cameras
    timestamp	DATETIME	Час запису
    event_description	TEXT	Опис події (наприклад, підозріла активність)

3. AccessPoints (Точки контролю доступу)
    access_point_id	INT PRIMARY KEY	Унікальний ідентифікатор точки доступу
    location	VARCHAR(255)	Розташування точки доступу
    type	VARCHAR(100)	Тип точки доступу (наприклад, турнікет, двері)
    status	VARCHAR(50)	Стан точки доступу (активна, неактивна)

4. AccessLogs (Логи контролю доступу)
    log_id	INT PRIMARY KEY	Унікальний ідентифікатор логу
    access_point_id	INT	Зовнішній ключ до таблиці AccessPoints
    person_id	INT	Зовнішній ключ до таблиці Persons
    timestamp	DATETIME	Час доступу
    access_type	VARCHAR(50)	Тип доступу (вхід, вихід)

5. Persons (Особи)
    person_id	INT PRIMARY KEY	Унікальний ідентифікатор особи
    name	VARCHAR(255)	Ім'я особи
    role	VARCHAR(100)	Роль (наприклад, працівник, пасажир)
    access_level	VARCHAR(50)	Рівень доступу (наприклад, адміністратор, звичайний)

6. Alarms (Системи оповіщення)
    alarm_id	INT PRIMARY KEY	Унікальний ідентифікатор сигналізації
    location	VARCHAR(255)	Розташування сигналізації
    type	VARCHAR(100)	Тип сигналізації (наприклад, пожежна, тривожна)
    status	VARCHAR(50)	Стан сигналізації (активна, неактивна)

7. AlarmLogs (Логи оповіщень)
    log_id	INT PRIMARY KEY	Унікальний ідентифікатор логу
    alarm_id	INT	Зовнішній ключ до таблиці Alarms
    timestamp	DATETIME	Час активації сигналізації
    event_description	TEXT	Опис події (наприклад, пожежа, порушення доступу)

8. SecurityZones (Зони безпеки)
    
    zone_id	INT PRIMARY KEY	Унікальний ідентифікатор зони
    name	VARCHAR(255)	Назва зони (наприклад, зона VIP, зона контролю)
    description	TEXT	Опис зони

9. ZoneAccess (Доступ до зон)
    
    zone_access_id	INT PRIMARY KEY	Унікальний ідентифікатор доступу
    zone_id	INT	Зовнішній ключ до таблиці SecurityZones
    person_id	INT	Зовнішній ключ до таблиці Persons
    access_type	VARCHAR(50)	Тип доступу (дозволений, заборонений)

10. Incidents (Інциденти)
        
        incident_id	INT PRIMARY KEY	Унікальний ідентифікатор інциденту
        description	TEXT	Опис інциденту
        timestamp	DATETIME	Час інциденту
        location	VARCHAR(255)	Місце інциденту
        status	VARCHAR(50)	Стан інциденту (наприклад, вирішено, в процесі)

11. IncidentResponses (Реакції на інциденти)
        
        response_id	INT PRIMARY KEY	Унікальний ідентифікатор реакції
        incident_id	INT	Зовнішній ключ до таблиці Incidents
        person_id	INT	Зовнішній ключ до таблиці Persons
        response_action	TEXT	Дія, яка була вжита
        timestamp	DATETIME	Час реакції

12. SecurityStaff (Персонал безпеки)
        
        staff_id	INT PRIMARY KEY	Унікальний ідентифікатор працівника
        name	VARCHAR(255)	Ім'я працівника
        role	VARCHAR(100)	Роль (наприклад, охоронець, керівник безпеки)
        contact_info	VARCHAR(255)	Контактна інформація

13. SecurityShifts (Зміни охорони)
        
        shift_id	INT PRIMARY KEY	Унікальний ідентифікатор зміни
        staff_id	INT	Зовнішній ключ до таблиці SecurityStaff
        start_time	DATETIME	Початок зміни
        end_time	DATETIME	Кінець зміни
        zone_id	INT	Зовнішній ключ до таблиці SecurityZones

14. EmergencyExits (Аварійні виходи)
        
        exit_id	INT PRIMARY KEY	Унікальний ідентифікатор виходу
        location	VARCHAR(255)	Розташування виходу
        status	VARCHAR(50)	Стан виходу (відкритий, закритий)
        last_inspection	DATE	Дата останньої перевірки

15. SecurityPolicies (Політики безпеки)
    
    policy_id	INT PRIMARY KEY	Унікальний ідентифікатор політики
    name	VARCHAR(255)	Назва політики
    description	TEXT	Опис політики
    effective_date	DATE	Дата набуття чинності
    revision_date	DATE	Дата останньої ревізії