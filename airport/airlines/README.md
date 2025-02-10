# AIRLINES

15 таблиць які відображають предметну область авіакомпаній, облік літаків, зв'язок з виробниками літаків 
та службами, що їх обслуговують. Ці таблиці охоплюють основні аспекти, такі як договори з авіакомпаніями,
 рейси, розклад, обслуговування літаків тощо.

1. Airlines (Авіакомпанії)
    airline_id	INT PRIMARY KEY	Унікальний ідентифікатор авіакомпанії
    name	VARCHAR(255)	Назва авіакомпанії
    country	VARCHAR(100)	Країна реєстрації
    contact_info	VARCHAR(255)	Контактна інформація

2. Aircrafts (Літаки)
    aircraft_id	INT PRIMARY KEY	Унікальний ідентифікатор літака
    model	VARCHAR(100)	Модель літака
    manufacturer_id	INT	Зовнішній ключ до виробника
    airline_id	INT	Зовнішній ключ до авіакомпанії
    registration_number	VARCHAR(50)	Реєстраційний номер літака
    capacity	INT	Кількість пасажирських місць

3. Manufacturers (Виробники літаків)
    manufacturer_id	INT PRIMARY KEY	Унікальний ідентифікатор виробника
    name	VARCHAR(255)	Назва виробника
    country	VARCHAR(100)	Країна виробника
    contact_info	VARCHAR(255)	Контактна інформація

4. MaintenanceServices (Служби обслуговування)
    service_id	INT PRIMARY KEY	Унікальний ідентифікатор служби
    name	VARCHAR(255)	Назва служби
    location	VARCHAR(255)	Місцезнаходження служби
    contact_info	VARCHAR(255)	Контактна інформація

5. Agreements (Договори з авіакомпаніями)
    agreement_id	INT PRIMARY KEY	Унікальний ідентифікатор договору
    airline_id	INT	Зовнішній ключ до авіакомпанії
    start_date	DATE	Дата початку договору
    end_date	DATE	Дата завершення договору
    terms	TEXT	Умови договору

6. Flights (Рейси)
    flight_id	INT PRIMARY KEY	Унікальний ідентифікатор рейсу
    airline_id	INT	Зовнішній ключ до авіакомпанії
    aircraft_id	INT	Зовнішній ключ до літака
    departure_airport	VARCHAR(100)	Аеропорт вильоту
    arrival_airport	VARCHAR(100)	Аеропорт прибуття
    departure_time	DATETIME	Час вильоту
    arrival_time	DATETIME	Час прибуття

7. Schedules (Розклад рейсів)
    schedule_id	INT PRIMARY KEY	Унікальний ідентифікатор розкладу
    flight_id	INT	Зовнішній ключ до рейсу
    day_of_week	VARCHAR(20)	День тижня (наприклад, понеділок)
    frequency	VARCHAR(50)	Частота (наприклад, щоденно)

8. MaintenanceRecords (Записи обслуговування)
    record_id	INT PRIMARY KEY	Унікальний ідентифікатор запису
    aircraft_id	INT	Зовнішній ключ до літака
    service_id	INT	Зовнішній ключ до служби
    maintenance_date	DATE	Дата обслуговування
    description	TEXT	Опис робіт
    cost	DECIMAL(10, 2)	Вартість обслуговування

9. Pilots (Пілоти)
    pilot_id	INT PRIMARY KEY	Унікальний ідентифікатор пілота
    name	VARCHAR(255)	Ім'я пілота
    license_number	VARCHAR(50)	Номер ліцензії
    airline_id	INT	Зовнішній ключ до авіакомпанії

10. CrewMembers (Члени екіпажу)
    crew_id	INT PRIMARY KEY	Унікальний ідентифікатор члена екіпажу
    name	VARCHAR(255)	Ім'я члена екіпажу
    role	VARCHAR(100)	Роль (наприклад, стюардеса)
    airline_id	INT	Зовнішній ключ до авіакомпанії

11. Passengers (Пасажири)
    passenger_id	INT PRIMARY KEY	Унікальний ідентифікатор пасажира
    name	VARCHAR(255)	Ім'я пасажира
    contact_info	VARCHAR(255)	Контактна інформація
    frequent_flyer_number	VARCHAR(50)	Номер програми лояльності

12. Tickets (Квитки)
    ticket_id	INT PRIMARY KEY	Унікальний ідентифікатор квитка
    flight_id	INT	Зовнішній ключ до рейсу
    passenger_id	INT	Зовнішній ключ до пасажира
    seat_number	VARCHAR(10)	Номер місця
    price	DECIMAL(10, 2)	Ціна квитка

13. Airports (Аеропорти)
    airport_id	INT PRIMARY KEY	Унікальний ідентифікатор аеропорту
    name	VARCHAR(255)	Назва аеропорту
    city	VARCHAR(100)	Місто
    country	VARCHAR(100)	Країна

14. FlightLogs (Логи рейсів)
    log_id	INT PRIMARY KEY	Унікальний ідентифікатор логу
    flight_id	INT	Зовнішній ключ до рейсу
    log_date	DATETIME	Дата запису
    status	VARCHAR(100)	Стан рейсу (наприклад, успішний, затриманий)
    notes	TEXT	Додаткові нотатки

15. SpareParts (Запчастини)
    part_id	INT PRIMARY KEY	Унікальний ідентифікатор запчастини
    name	VARCHAR(255)	Назва запчастини
    manufacturer_id	INT	Зовнішній ключ до виробника
    cost	DECIMAL(10, 2)	Вартість запчастини
    quantity_in_stock	INT	Кількість на складі

Зв'язки між таблицями:
Aircrafts:
    Зв'язана з Manufacturers через manufacturer_id.
    Зв'язана з Airlines через airline_id.
    Зв'язана з MaintenanceRecords через aircraft_id.

Flights:
    Зв'язана з Airlines через airline_id.
    Зв'язана з Aircrafts через aircraft_id.
    Зв'язана з Schedules через flight_id.

MaintenanceRecords:
    Зв'язана з Aircrafts через aircraft_id.
    Зв'язана з MaintenanceServices через service_id.

Tickets:
    Зв'язана з Flights через flight_id.
    Зв'язана з Passengers через passenger_id.

Agreements:
    Зв'язана з Airlines через airline_id.