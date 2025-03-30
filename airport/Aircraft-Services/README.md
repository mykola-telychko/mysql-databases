# AIRCRAFT-SERVICES

15 таблиць які відображають роботу всіх сервісів, що обслуговують літак, 
включаючи ремонтні майстерні, заправку та обслуговування борту:

1. Aircraft (Літаки)
    aircraft_id	INT PRIMARY KEY	Унікальний ідентифікатор літака
    model	VARCHAR(100)	Модель літака
    registration_number	VARCHAR(50)	Реєстраційний номер
    manufacturer	VARCHAR(100)	Виробник
    status	VARCHAR(50)	Стан літака (наприклад, активний, на ремонті)

2. MaintenanceWorkshops (Ремонтні майстерні)
    workshop_id	INT PRIMARY KEY	Унікальний ідентифікатор майстерні
    name	VARCHAR(100)	Назва майстерні
    location	VARCHAR(255)	Розташування майстерні
    capacity	INT	Місткість майстерні

3. Equipment (Обладнання)
    equipment_id	INT PRIMARY KEY	Унікальний ідентифікатор обладнання
    name	VARCHAR(100)	Назва обладнання
    workshop_id	INT	Зовнішній ключ до майстерні
    status	VARCHAR(50)	Стан обладнання (наприклад, активне, на ремонті)

4. Specialists (Спеціалісти)
    specialist_id	INT PRIMARY KEY	Унікальний ідентифікатор спеціаліста
    name	VARCHAR(100)	Ім'я спеціаліста
    position	VARCHAR(100)	Посада
    workshop_id	INT	Зовнішній ключ до майстерні

5. MaintenanceTasks (Завдання з обслуговування)
    task_id	INT PRIMARY KEY	Унікальний ідентифікатор завдання
    aircraft_id	INT	Зовнішній ключ до літака
    workshop_id	INT	Зовнішній ключ до майстерні
    description	TEXT	Опис завдання
    status	VARCHAR(50)	Стан завдання (наприклад, в процесі, завершено)

6. FuelTypes (Типи палива)
    fuel_type_id	INT PRIMARY KEY	Унікальний ідентифікатор типу палива
    name	VARCHAR(100)	Назва типу палива
    description	TEXT	Опис типу палива

7. Fueling (Заправка)
    fueling_id	INT PRIMARY KEY	Унікальний ідентифікатор заправки
    aircraft_id	INT	Зовнішній ключ до літака
    fuel_type_id	INT	Зовнішній ключ до типу палива
    volume	DECIMAL(10, 2)	Об'єм палива
    date	DATETIME	Дата заправки

8. CleaningServices (Прибирання)
    cleaning_id	INT PRIMARY KEY	Унікальний ідентифікатор прибирання
    aircraft_id	INT	Зовнішній ключ до літака
    date	DATETIME	Дата прибирання
    status	VARCHAR(50)	Стан прибирання (наприклад, завершено)

9. CateringServices (Харчування)
    catering_id	INT PRIMARY KEY	Унікальний ідентифікатор харчування
    aircraft_id	INT	Зовнішній ключ до літака
    meal_type	VARCHAR(100)	Тип їжі (наприклад, вегетаріанська)
    quantity	INT	Кількість порцій
    date	DATETIME	Дата харчування

10. Crew (Екіпаж)
        crew_id	INT PRIMARY KEY	Унікальний ідентифікатор екіпажу
        name	VARCHAR(100)	Ім'я члена екіпажу
        position	VARCHAR(100)	Посада (наприклад, пілот, стюард)
        aircraft_id	INT	Зовнішній ключ до літака
        contacts / details

11. PassengerServices (Обслуговування пасажирів)
        service_id	INT PRIMARY KEY	Унікальний ідентифікатор послуги
        aircraft_id	INT	Зовнішній ключ до літака
        service_type	VARCHAR(100)	Тип послуги (наприклад, догляд за дітьми)
        date	DATETIME	Дата надання послуги

12. Inventory (Інвентаризація)
        inventory_id	INT PRIMARY KEY	Унікальний ідентифікатор інвентаризації
        aircraft_id	INT	Зовнішній ключ до літака
        item_name	VARCHAR(100)	Назва предмета
        quantity	INT	Кількість
        date	DATETIME	Дата інвентаризації

13. Inspections (Інспекції)
        inspection_id	INT PRIMARY KEY	Унікальний ідентифікатор інспекції
        aircraft_id	INT	Зовнішній ключ до літака
        inspector_name	VARCHAR(100)	Ім'я інспектора
        date	DATETIME	Дата інспекції
        status	VARCHAR(50)	Стан інспекції (наприклад, успішно, невдало)

14. FlightLogs (Журнали польотів)
        log_id	INT PRIMARY KEY	Унікальний ідентифікатор журналу
        aircraft_id	INT	Зовнішній ключ до літака
        flight_date	DATETIME	Дата польоту
        duration	INT	Тривалість польоту (у хвилинах)
        status	VARCHAR(50)	Стан польоту (наприклад, успішний, скасований)

15. ServiceProviders (Постачальники сервісів)
        provider_id	INT PRIMARY KEY	Унікальний ідентифікатор постачальника
        name	VARCHAR(100)	Назва постачальника
        service_type	VARCHAR(100)	Тип послуги (наприклад, заправка, прибирання)
        contact_info	VARCHAR(255)	Контактна інформація

Зв'язки між таблицями:
Aircraft:
    Зв'язана з MaintenanceTasks, Fueling, CleaningServices, CateringServices, Crew, PassengerServices, Inventory, Inspections, FlightLogs.

MaintenanceWorkshops:
    Зв'язана з Equipment, Specialists, MaintenanceTasks.

FuelTypes:
    Зв'язана з Fueling.

ServiceProviders:
    Зв'язана з іншими таблицями через тип послуги.


