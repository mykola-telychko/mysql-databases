# AIRPORT

https://uk.wikipedia.org/wiki/%D0%90%D0%B5%D1%80%D0%BE%D0%BF%D0%BE%D1%80%D1%82

board
terminal
area

 - service of planes, service of airport, pilot team (crew, waht tab?)

AEROPORT — — — start
    (customs service)
    Scheduled maintenance (levels-types) .
    Daily inspection and schedule
    Validate aircraft depending on the completed work technologies
AEROPORT — — — end

https://github.com/apkuznetsov/database-design-2019

sandboxes:
https://app.sqldbm.com/MySQL/DatabaseExplorer/New/#
https://my.vertabelo.com/sign-up


https://github.com/poltaratskiy/airport/tree/master/%D0%9F%D1%80%D0%BE%D0%B5%D0%BA%D1%82%20%D0%BA%D0%BB%D0%B8%D0%B5%D0%BD%D1%82%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D1%8F/Airport

5/5
https://www.freeprojectz.com/entity-relationship/airline-booking-system-er-diagram

<!-- TABLES  begin -->
Aircraft model table: To store information about the types of aircraft operated by airlines.

Hub Airports Table: To identify the main airports through which transit flights pass.

Class Table: Service To store information about different classes of service (economy, business, first).

Currency Table: To store information about the currencies in which payments are made.

Promo Codes Table: To store information about promo codes and discounts.

<!-- CANONICAL TABS -- begin -->
<!-- CANONICAL TABS -- begin -->
CREATE TABLE `Flights`(
    (flight_number is flight_id?)
    `flight_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `airline_id` INT NOT NULL,
    `aircraft_type_id` INT NOT NULL,
    `departure_airport` VARCHAR(255) NOT NULL,
    `arrival_airport` VARCHAR(255) NOT NULL,
     `scheduled_departure` DATETIME NOT NULL,
     `scheduled_arrival` DATETIME NOT NULL,
    `departure_time` DATETIME NOT NULL,
    `arrival_time` DATETIME NOT NULL
);
CREATE TABLE flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(10) NOT NULL,
    airline_id INT NOT NULL,
    aircraft_id INT NOT NULL,
    origin_airport_id INT NOT NULL,
    destination_airport_id INT NOT NULL,
    scheduled_arrival DATETIME NOT NULL,
    scheduled_departure DATETIME NOT NULL,
    actual_arrival DATETIME,
    actual_departure DATETIME,
    needs_deicing BOOLEAN DEFAULT FALSE,
    cleaning_status ENUM('not_started', 'in_progress', 'completed', 'skipped') DEFAULT 'not_started',
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id),
    FOREIGN KEY (aircraft_id) REFERENCES aircrafts(aircraft_id),
    FOREIGN KEY (origin_airport_id) REFERENCES airports(airport_id),
    FOREIGN KEY (destination_airport_id) REFERENCES airports(airport_id)
);
CREATE TABLE aircraft_types (
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    icao_code CHAR(4) NOT NULL,
    manufacturer VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    seats_capacity INT,
    cleaning_time_min INT COMMENT 'Середній час прибирання (хвилини)',
    deicing_time_min INT COMMENT 'Середній час деісінгу (хвилини)'
);
CREATE TABLE aircrafts (
    aircraft_id INT PRIMARY KEY AUTO_INCREMENT,
    registration_number VARCHAR(10) NOT NULL UNIQUE,
    airline_id INT NOT NULL,
    type_id INT NOT NULL,
    last_deep_cleaning DATE,
    next_scheduled_wash DATE,
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id),
    FOREIGN KEY (type_id) REFERENCES aircraft_types(type_id)
);

МАЄ БУТИ ЧАСТИНОЮ ВІДГУКІВ ПРО ПОЛІТ?- Відгуки/скарги (cleaning_feedback)
Мета: Фіксація відгуків авіакомпаній або пасажирів щодо якості прибирання.
CREATE TABLE cleaning_feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_id INT NOT NULL,
    feedback_text TEXT NOT NULL,
    submitted_by ENUM('airline', 'passenger') NOT NULL,
    submission_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    resolved BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);
<!-- CANONICAL TABS -- end -->
<!-- CANONICAL TABS -- end -->

<!-- TABLES  end -->

------------------------------

Основні, транзитні та міжнародні аеропорти: управління, узгодження та стандартизація


Основні типи аеропортів та їхні характеристики:
Основні аеропорти - найбільші аеропорти, які обслуговують значні обсяги пасажирів і вантажів. 
мають кілька злітно-посадкових смуг, великі термінали. Приклади: Бориспіль, Heathrow в Лондоні, Charles de Gaulle в Парижі. 

Транзитні аеропорти: важливими вузлами для пересадок пасажирів між різними рейсами.
 Вони часто мають великі термінали, зручні пересадки між рейсами.
Міжнародні аеропорти: Це аеропорти, які обслуговують міжнародні рейси. Вони мають спеціальні 
зони для міжнародних прибуттів і відправлень, а також служби прикордонного контролю та митниці.

Малі та локальні аеропорти, обслуговують менші міста та регіони. Вони можуть 
бути як цивільними, так і військовими, а також комбінованими. Зазвичай, такі аеропорти мають одну
 злітно-посадкову смугу, обмежену кількість рейсів і невеликі термінали.

Особливості:
Обслуговування регіонів: Основна функція – забезпечення сполучення між невеликими містами та регіональними центрами.
Короткі дистанції
Менші літаки: Використовуються менші літаки, такі як турбогвинтові або легкі реактивні.
Обмежена інфраструктура: Термінали та злітно-посадкові смуги можуть бути меншими  порівняно з великими аеропортами.
Власники:  державними, приватними.

Транзитні чи внутрішні?
Більшість малих та локальних аеропортів є суто внутрішніми. Тобто вони обслуговують рейси 
всередині однієї країни. Однак, деякі з них можуть мати обмежену кількість міжнародних рейсів, 
особливо якщо вони розташовані в прикордонних зонах.

-----------------------------
Управління та узгодження аеропортів:

Управління аеропортами який вимагає координації багатьох служб та організацій. основні аспекти:

Аеропорт як підприємство: Кожен аеропорт є окремим підприємством, яке може бути державним
 або приватним. Він має свою власну адміністрацію, яка відповідає за операційну діяльність аеропорту.
Регуляторні органи: Діяльність аеропортів регулюється державними органами авіації. 
Ці органи встановлюють стандарти безпеки, визначають правила повітряного руху та контролюють
 дотримання цих правил авіакомпаніями та аеропортами.
Міжнародні організації: Існує ряд міжнародних організацій, таких як Міжнародна організація 
цивільної авіації (ICAO), які встановлюють міжнародні стандарти для цивільної авіації. 
Ці стандарти забезпечують безпеку та ефективність повітряних перевезень у всьому світі.
Узгодження між аеропортами: Аеропорти тісно співпрацюють між собою для забезпечення безперебійної 
роботи повітряного транспорту. Це включає обмін інформацією про рейси, координацію операцій 
на злітних смугах та в терміналах, а також спільне використання авіаційних служб.
Стандартизація роботи аеропортів:

Стандартизація роботи аеропортів для  безпеки та ефективності. Основні стандарти встановлюються 
Міжнародною організацією цивільної авіації (ICAO). Ці стандарти стосуються:

Безпеки польотів: Встановлюються правила та процедури, які мають бути дотримані для забезпечення безпеки пасажирів і екіпажів.
Операційної діяльності: Визначаються стандарти для проведення зльоту та посадки літаків, обробки багажу, обслуговування пасажирів тощо.
Комунікацій: Встановлюються стандарти для радіозв'язку між пілотами та диспетчерами, а також для обміну інформацією між аеропортами.
Висновок:

Управління аеропортами є складним процесом, який вимагає координації зусиль. 
Стандартизація роботи аеропортів забезпечує безпеку та ефективність повітряних перевезень. 
Міжнародне співробітництво дозволяє забезпечити безперебійну роботу світової авіаційної системи.

Ключові організації, що беруть участь у регулюванні авіації:

ICAO (Міжнародна організація цивільної авіації): Встановлює міжнародні стандарти для цивільної авіації.
Євроконтроль: Європейська організація, що займається управлінням повітряним рухом над Європою.
FAA (Федеральне управління цивільної авіації США): Регулює цивільну авіацію в США.
Державні органи авіації кожної країни: Відповідають за регулювання авіації на національному рівні.
Якщо у вас є додаткові питання, я з радістю відповім.

----

https://www.a4airport.com/product-page/small-regional-airport-1-200
Small regional airport

Чому важливі малі аеропорти?

Доступність: Забезпечують доступ для жителів віддалених регіонів.
Розвиток регіонів: Сприяють розвитку туризму, бізнесу та економіки регіонів.
Альтернатива залізничному та автомобільному транспорту: Особливо актуальні для регіонів з розвиненою мережею доріг.
Управління та стандартизація

Хоча малі аеропорти мають свої особливості, вони також підлягають загальним правилам і стандартам, 
встановленим міжнародними організаціями, такими як ICAO. вимоги можуть бути 
менш суворими порівняно з великими аеропортами.

-----------------------

deep research
https://www.researchgate.net/publication/221138246_AGILE_Software_Architecture_for_Mobility

diagram from deep research 
https://www.researchgate.net/figure/Class-diagram-of-the-airport-example_fig1_221138246

-----------------------

Класифікація 

Їх класифікують за різними критеріями, такими як:

За призначенням:
Цивільні: Обслуговують пасажирські та вантажні рейси.
Військові: Використовуються для військових літаків та вертольотів.
Комбіновані: Поєднують цивільні та військові функції.
За розміром та пропускною спроможністю:
Міжнародні хаби: Великі аеропорти, які обслуговують значний обсяг міжнародних рейсів та мають розвинену інфраструктуру. 
Приклад:

Heathrow Airport
Регіональні аеропорти: Обслуговують певний регіон або країну, здебільшого виконують внутрішні рейси.
Локальні аеропорти: Найменші аеропорти, часто мають одну злітно-посадкову смугу та обслуговують невеликі літаки.
За типом операцій:
Пасажирські: Спеціалізуються на обслуговуванні пасажирів.
Вантажні: Орієнтовані на перевезення вантажів.
Загального призначення: Обслуговують як пасажирів, так і вантажі.
За рівнем обслуговування:
Високого рівня: Мають широкий спектр послуг, включаючи магазини, ресторани, готелі тощо.
Середнього рівня: Пропонують базовий набір послуг.
Низького рівня: Обмежені за кількістю та якістю послуг.
За типом власності: Державні, Приватні.
Важливо зазначити: часто аеропорти можуть поєднувати в собі кілька характеристик. Наприклад, великий міжнародний 
аеропорт може бути як державним, так і приватним, і одночасно обслуговувати пасажирські та вантажні рейси.