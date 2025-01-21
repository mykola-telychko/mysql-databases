# TERMINAL

Що таке термінал аеропорту?

1. Аеровокзал - це будівля в аеропорту, де пасажири можуть сідати на літак і виходити з нього. Зазвичай він включає в себе каси продажу квитків, камери схову та контрольно-пропускні пункти.

2. Чим великі аеропорти відрізняються від малих?
 Великі аеропорти зазвичай мають кілька терміналів та/або залів очікування, в той час як малі аеропорти зазвичай мають лише один термінал, який поєднує в собі функції терміналу та залу очікування.

3. Прикладами грандіозних або архітектурно вражаючих терміналів аеропортів є Міжнародний аеропорт Багдада, Термінал 1 в аеропорту імені Шарля де Голля поблизу Парижа, Термінал 5 в нью-йоркському аеропорту імені Кеннеді, Міжнародний аеропорт Альбукерке в Нью-Мексико та Міжнародний аеропорт Баїас-де-Уатулько в Уатулько, штат Оахака, Мексика. (Міжнародний аеропорт Баїас-де-Уатулько)

4. Які послуги надає середньостатистичний термінал?
 Середньостатистичний термінал надає послуги з продажу квитків для пасажирів (рейси), камери схову для пасажирів, співробітники служби безпеки, які перевіряють пасажирів перед посадкою в літак.


1. passengers (пасажири)
    id (PK, INT, AUTO_INCREMENT) – унікальний ідентифікатор пасажира
    first_name (VARCHAR(50)) – ім'я
    last_name (VARCHAR(50)) – прізвище
    passport_number (VARCHAR(20), UNIQUE) – номер паспорта
    dob (DATE) – дата народження
    nationality (VARCHAR(50)) – національність
    contact_info (VARCHAR(255)) – контактні дані
    Зв'язки: Один пасажир може мати багато квитків (tickets)

2. flights (рейси)
    id (PK, INT, AUTO_INCREMENT) – унікальний ідентифікатор рейсу
    flight_number (VARCHAR(20), UNIQUE) – номер рейсу
    airline (VARCHAR(100)) – авіакомпанія
    departure_airport (VARCHAR(100)) – аеропорт відправлення
    arrival_airport (VARCHAR(100)) – аеропорт прибуття
    departure_time (DATETIME) – час відправлення
    arrival_time (DATETIME) – час прибуття
    status (ENUM('Scheduled', 'Delayed', 'Cancelled', 'Departed', 'Arrived')) – статус рейсу
    Зв'язки:
    Один рейс може мати багато квитків (tickets)

3. tickets (квитки)
    id (PK, INT, AUTO_INCREMENT) – унікальний ідентифікатор квитка
    passenger_id (FK → passengers.id) – пасажир
    flight_id (FK → flights.id) – рейс
    seat_number (VARCHAR(10)) – номер місця
    class (ENUM('Economy', 'Business', 'First')) – клас квитка
    price (DECIMAL(10,2)) – ціна
    Зв'язки:

Один пасажир може мати багато квитків
Один рейс може мати багато квитків
4. baggage (багаж)
    id (PK, INT, AUTO_INCREMENT) – унікальний ідентифікатор
    ticket_id (FK → tickets.id) – квиток пасажира
    weight (DECIMAL(5,2)) – вага багажу
    status (ENUM('Checked-in', 'Loaded', 'Unloaded', 'Claimed')) – статус багажу
    Зв'язки:
    Один квиток може мати кілька одиниць багажу

5. luggage_storage (камери схову)
    id (PK, INT, AUTO_INCREMENT) – унікальний ідентифікатор
    passenger_id (FK → passengers.id) – пасажир
    locker_number (VARCHAR(10)) – номер комірки
    start_time (DATETIME) – час початку зберігання
    end_time (DATETIME) – час закінчення зберігання
    price (DECIMAL(6,2)) – вартість
Зв'язки:
Один пасажир може використовувати кілька камер схову

6. security_staff (служба безпеки)
    id (PK, INT, AUTO_INCREMENT) – унікальний ідентифікатор
    first_name (VARCHAR(50)) – ім'я
    last_name (VARCHAR(50)) – прізвище
    badge_number (VARCHAR(20), UNIQUE) – номер значка
    position (VARCHAR(50)) – посада

7. security_checks (перевірки безпеки)
    id (PK, INT, AUTO_INCREMENT) – унікальний ідентифікатор
    passenger_id (FK → passengers.id) – пасажир
    security_staff_id (FK → security_staff.id) – співробітник служби безпеки
    check_time (DATETIME) – час перевірки
    status (ENUM('Passed', 'Failed')) – результат перевірки

8. boarding_passes (посадкові талони)
    id (PK, INT, AUTO_INCREMENT) – унікальний ідентифікатор
    ticket_id (FK → tickets.id) – квиток
    boarding_gate (VARCHAR(10)) – вихід на посадку
    boarding_time (DATETIME) – час початку посадки

9. gates (виходи на посадку)
    id (PK, INT, AUTO_INCREMENT) – унікальний ідентифікатор
    gate_number (VARCHAR(10), UNIQUE) – номер виходу
    status (ENUM('Open', 'Closed', 'Maintenance')) – статус

10. employees (співробітники)
    id (PK, INT, AUTO_INCREMENT) – унікальний ідентифікатор
    first_name (VARCHAR(50)) – ім'я
    last_name (VARCHAR(50)) – прізвище
    position (VARCHAR(100)) – посада

11. aircrafts (літаки)
    id (PK, INT, AUTO_INCREMENT) – унікальний ідентифікатор
    aircraft_model (VARCHAR(50)) – модель літака
    capacity (INT) – місткість
    airline (VARCHAR(100)) – авіакомпанія

12. crew_members (екіпаж)
    id (PK, INT, AUTO_INCREMENT) – унікальний ідентифікатор
    flight_id (FK → flights.id) – рейс
    employee_id (FK → employees.id) – працівник

13. delays (затримки рейсів)
    id (PK, INT, AUTO_INCREMENT) – унікальний ідентифікатор
    flight_id (FK → flights.id) – рейс
    reason (TEXT) – причина
    new_departure_time (DATETIME) – новий час відправлення

14. maintenance (технічне обслуговування)
    id (PK, INT, AUTO_INCREMENT) – унікальний ідентифікатор
    aircraft_id (FK → aircrafts.id) – літак
    maintenance_date (DATETIME) – дата обслуговування
    status (ENUM('Scheduled', 'Completed', 'In Progress')) – статус

15. transactions (фінансові операції)
    id (PK, INT, AUTO_INCREMENT) – унікальний ідентифікатор
    passenger_id (FK → passengers.id) – пасажир
    amount (DECIMAL(10,2)) – сума
    description (TEXT) – опис
