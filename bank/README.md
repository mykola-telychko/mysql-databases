# BANK


Як забезпечити цілісність даних при проведенні транзакцій.
Як оптимізувати запити до бази даних.
Як створити систему звітності для аналізу фінансових показників.


База даних для банку: 15 основних таблиць та їх атрибути

clients
    client_id (PK)
    first_name
    last_name
    birth_date
    address
    phone_number
    email
    account_number (FK до таблиці Accounts)

accounts
    account_number (PK)
    account_type (депозитний, розрахунковий, кредитний)
    balance
    currency
    open_date
    closed_date
    client_id (FK до таблиці Clients)

 transactions
    transaction_id (PK)
    account_number (FK до таблиці Accounts)
    transaction_type (депозит, зняття, переказ)
    amount
    transaction_date
    description

cards
    card_number (PK)
    account_number (FK до таблиці Accounts)
    card_type (дебетова, кредитна)
    expiration_date
    cvv
    status (активна, заблокована)

loans_credits
    loan_id (PK)
    account_number (FK до таблиці Accounts)
    loan_amount
    interest_rate
    start_date
    end_date
    monthly_payment

deposits
    deposit_id (PK)
    account_number (FK до таблиці Accounts)
    deposit_amount
    interest_rate
    start_date
    end_date

employees
    employee_id (PK)
    first_name
    last_name
    position
    department
    hire_date

Філії branches
    branch_id (PK)
    branch_name
    address
    phone_number

departments
    department_id (PK)
    department_name
    branch_id (FK до таблиці Branches)

products
    product_id (PK)
    product_name
    product_type (депозит, кредит, картка)
    description

tarifs
    tariff_id (PK)
    product_id (FK до таблиці Products)
    fee
    description

currencies
    currency_id (PK)
    currency_code
    currency_name

users - Користувачі системи
    user_id (PK)
    username
    password
    role (адміністратор, касир, менеджер)

log_operation
    log_id (PK)
    user_id (FK до таблиці Users)
    action
    timestamp


Контрагенти - counterparties
    counterparty_id (PK)
    counterparty_name
    address
    phone_number


Пояснення до таблиць:

clients: Базова інформація про клієнтів банку.

accounts: Інформація про всі відкриті рахунки клієнтів.

transactions: Історія всіх фінансових операцій по рахунках.

cards: Інформація про випущені банківські картки.

loans_credits: Деталі кредитних договорів.

deposits: Інформація про депозитні рахунки.

employees: Дані про співробітників банку.

branches: Інформація про фізичні відділення банку.

departments: Інформація про внутрішні відділи банку (наприклад, кредитний, депозитний).

products: Перелік банківських продуктів.

tarifs: Інформація про вартість банківських послуг.

currencies: Список підтримуваних валют.

users: Інформація про користувачів системи банку.

log_operation: Журнал дій користувачів системи.

counterparties-Контрагенти: Інформація про юридичних осіб, з якими банк взаємодіє.
Зверніть увагу: Це лише базовий набір таблиць. Для конкретного банку може знадобитися додаткові таблиці, наприклад, для обліку комісій, штрафів, іпотечних кредитів тощо.

Важливі моменти при проектуванні:

Нормалізація: Таблиці повинні бути нормалізовані для уникнення дублювання даних та забезпечення цілісності.
Індекси: Створення індексів на часто використовуваних полях для прискорення запитів.
Зв'язки між таблицями: Використання зовнішніх ключів для встановлення зв'язків між таблицями.
Безпека: Забезпечення безпеки даних шляхом використання механізмів автентифікації, авторизації та шифрування.
Бажаєте розглянути конкретний аспект проектування бази даних банку детальніше? Наприклад, ми можемо обговорити:

