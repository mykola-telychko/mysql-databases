# STAFF

-- Is it possible to merge some tables (about)? 


1. Співробітники (employees)
Основна інформація про працівників аеропорту.
    employee_id (PK)
    first_name, 
    last_name
    position (пілот, диспетчер, технік, охоронець тощо)
    department_id (FK)
    hire_date
    status (активний, у відпустці, звільнений)

2. Відділи (departments)
Різні служби аеропорту.
    department_id (PK)
    name (Диспетчерська служба, Технічний відділ, Безпека тощо)
    head_employee_id (FK) – Начальник служби

3. Графіки змін (work_schedules)
Розклад роботи персоналу.
    schedule_id (PK)
    employee_id (FK)
    shift_start
    shift_end
    status (активна, відпустка, лікарняний)

4. Кваліфікації та підготовка (qualifications_training)
Кваліфікація, сертифікати та навчання працівників.
    record_id (PK)
    employee_id (FK)
    type (кваліфікація/навчання)
    name (Наприклад, "Диспетчер категорії А" або "Пожежна безпека")
    issued_by
    valid_until (для сертифікатів)
    date_completed (для навчання)

5. Диспетчерська служба (air_traffic_control)
Інформація про диспетчерів та контроль повітряного руху.
    control_id (PK)
    employee_id (FK)
    assigned_flight (опціонально, рейс, який веде диспетчер)
    status (активний / очікує)


6. Охорона аеропорту (security_staff)
Персонал безпеки аеропорту.
    security_id (PK)
    employee_id (FK)
    zone_assigned (наприклад, Термінал А, ВЗП, технічні приміщення)
    shift_start, shift_end

7. Медична служба (medical_staff)
Лікарі, медпрацівники в аеропорту.
    medical_id (PK)
    employee_id (FK)
    qualification (лікар, фельдшер, медсестра)
    assigned_zone

8. Обслуговуючий персонал (service_staff)
Прибиральники, техніки, обслуговуючий персонал.
    service_id (PK)
    employee_id (FK)
    duty_area (Наприклад, "Зона вильоту", "Гейт 5")
    status

9. Облік відвідування (attendance_log)
Коли співробітник входив / виходив на роботу.
    log_id (PK)
    employee_id (FK)
    timestamp
    event (вхід/вихід)

10. Інциденти (incidents)
Фіксація порушень, аварійних ситуацій.
    incident_id (PK)
    employee_id (FK) – хто повідомив
    department_id (FK) – відповідальна служба
    description
    date_reported
    status (відкрито/закрито)


11. Облік допусків (access_control)
Кому і куди дозволено доступ.
    access_id (PK)
    employee_id (FK)
    zone_id (FK)
    access_level (низький/середній/високий)

12. Запити на ремонт (maintenance_requests)
Запити на техобслуговування.
    request_id (PK)
    employee_id (FK) – хто подав
    department_id (FK) – хто відповідає
    description
    status

13. Радіозв'язок (communication_logs)
Лог спілкування диспетчерів, охорони та техперсоналу.
    comm_id (PK)
    employee_id (FK)
    message
    timestamp

14. Звіти про роботу (work_reports)
Звіти про виконану роботу.
    report_id (PK)
    employee_id (FK)
    report_text
    date_submitted

15. Адміністрація (administration)
Вища адміністрація та управління аеропортом.
    admin_id (PK)
    employee_id (FK)
    role (Наприклад, "Генеральний директор", "Фінансовий директор")
    responsibilities
    office_location