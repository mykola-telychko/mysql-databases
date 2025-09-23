/*
    Database Schema Documentation: Airport Finance System

    Tables:
    --------
    1. payments
        - Stores payment transactions related to bookings and invoices.
        - Fields: payment_id, amount, date (UNIX timestamp), currency_id, booking_id, invoice_id, revenue_stream_id.
        - Foreign Keys: currency_id, booking_id, invoice_id, revenue_stream_id.

    2. invoices
        - Stores invoice details for financial transactions.
        - Fields: invoice_id, invoice_number (unique), issue_date, total_amount, status.

    3. revenue_streams
        - Defines different revenue streams for the airport.
        - Fields: revenue_stream_id, name, description.

    4. fees
        - Stores various fees associated with revenue streams.
        - Fields: fee_id, name, amount, currency_id, revenue_stream_id.
        - Foreign Keys: currency_id, revenue_stream_id.

    5. expenses
        - Records expenses incurred by the airport.
        - Fields: expense_id, amount, date (UNIX timestamp), category_id, contract_id.
        - Foreign Keys: category_id, contract_id.

    6. expenses_categories
        - Categorizes types of expenses (e.g., utilities, salaries, rent).
        - Fields: category_id, name.

    7. contracts
        - Stores contract information for airport operations.
        - Fields: contract_id, name, contract_number, start_date, end_date, total_amount.

    8. assets
        - Records airport assets (e.g., terminals).
        - Fields: asset_id, name, type, value.

    9. liabilities
        - Tracks financial liabilities.
        - Fields: liability_id, name, amount, due_date.

    10. currencies
        - Stores currency information and exchange rates.
        - Fields: currencies_id, code, name, exchange_rate.

    11. discounts
        - Defines discount types and conditions.
        - Fields: discount_id, type (ENUM: student, group), amount, conditions.

    12. prices_policy
        - Stores pricing policies for flights.
        - Fields: policy_id, flight_id, base_price, seasonal_multiplier, effective_date.
        - Foreign Key: flight_id.

    13. flights
        - Stores flight information.
        - Fields: flight_id, flight_number (unique), airline, route, date.

    14. bookings
        - Records flight bookings by passengers.
        - Fields: booking_id, passenger_id, flight_id, booking_date.
        - Foreign Key: flight_id.

    Relationships:
    --------------
    - payments references bookings, invoices, currencies, and revenue_streams.
    - fees references currencies and revenue_streams.
    - expenses references contracts and expense categories.
    - prices_policy references flights.
    - bookings references flights.

    Notes:
    ------
    - All primary keys are BIGINT UNSIGNED and auto-incremented.
    - Amount fields use DECIMAL for precision, except some use BIGINT.
    - Dates are stored as either DATE or BIGINT (UNIX timestamp).
    - Unique constraints on invoice_number and flight_number.
    - Comments in some fields clarify usage (e.g., asset names, expense categories).
*/
CREATE TABLE `payments`(
    `payment_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `amount` DECIMAL(10, 2) NOT NULL,
    `date` BIGINT NOT NULL,
    `currency_id` BIGINT NOT NULL,
    `booking_id` BIGINT NOT NULL,
    `invoice_id` BIGINT NOT NULL,
    `revenue_stream_id` BIGINT NOT NULL
);
CREATE TABLE `invoices`(
    `invoice_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `invoice_number` VARCHAR(255) NOT NULL,
    `issue_date` DATE NOT NULL,
    `total_amount` BIGINT NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `invoices` ADD UNIQUE `invoices_invoice_number_unique`(`invoice_number`);
CREATE TABLE `revenue_streams`(
    `revenue_stream_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL
);
CREATE TABLE `fees`(
    `fee_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `amount` DECIMAL(10, 2) NOT NULL,
    `currency_id` BIGINT NOT NULL,
    `revenue_stream_id` BIGINT NOT NULL
);
CREATE TABLE `expenses`(
    `expense_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `amount` BIGINT NOT NULL,
    `date` BIGINT NOT NULL,
    `category_id` BIGINT NOT NULL,
    `contract_id` BIGINT NOT NULL
);
CREATE TABLE `expenses_categories`(
    `category_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL COMMENT 'комуналка зп аренда'
);
CREATE TABLE `contracts`(
    `contract_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `contract_number` VARCHAR(255) NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `total_amount` BIGINT NOT NULL
);
CREATE TABLE `assets`(
    `asset_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL COMMENT 'terminalA terminalB',
    `type` VARCHAR(255) NOT NULL,
    `value` VARCHAR(255) NOT NULL
);
CREATE TABLE `liabilities`(
    `liability_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `amount` DECIMAL(10, 2) NOT NULL,
    `due_date` DATE NOT NULL
);
CREATE TABLE `currencies`(
    `currencies_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `exchange_rate` FLOAT(53) NOT NULL
);
CREATE TABLE `discounts`(
    `discount_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type` ENUM('student', 'group') NOT NULL,
    `amount` DECIMAL(10, 2) NOT NULL,
    `conditions` VARCHAR(255) NOT NULL
);
CREATE TABLE `prices_policy`(
    `policy_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_id` BIGINT NOT NULL,
    `base_price` DECIMAL(10, 2) NOT NULL,
    `seasonal_multiplier` DECIMAL(10, 2) NOT NULL,
    `effective_date` DATE NOT NULL
);
CREATE TABLE `flights`(
    `flight_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `flight_number` VARCHAR(255) NOT NULL,
    `airline` VARCHAR(255) NOT NULL,
    `route` VARCHAR(255) NOT NULL,
    `date` DATE NOT NULL
);
ALTER TABLE
    `flights` ADD UNIQUE `flights_flight_number_unique`(`flight_number`);
CREATE TABLE `bookings`(
    `booking_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `passenger_id` BIGINT NOT NULL,
    `flight_id` BIGINT NOT NULL,
    `booking_date` DATE NOT NULL
);
ALTER TABLE
    `fees` ADD CONSTRAINT `fees_currency_id_foreign` FOREIGN KEY(`currency_id`) REFERENCES `currencies`(`currencies_id`);
ALTER TABLE
    `bookings` ADD CONSTRAINT `bookings_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `flights`(`flight_id`);
ALTER TABLE
    `expenses` ADD CONSTRAINT `expenses_contract_id_foreign` FOREIGN KEY(`contract_id`) REFERENCES `contracts`(`contract_id`);
ALTER TABLE
    `fees` ADD CONSTRAINT `fees_revenue_stream_id_foreign` FOREIGN KEY(`revenue_stream_id`) REFERENCES `revenue_streams`(`revenue_stream_id`);
ALTER TABLE
    `payments` ADD CONSTRAINT `payments_revenue_stream_id_foreign` FOREIGN KEY(`revenue_stream_id`) REFERENCES `revenue_streams`(`revenue_stream_id`);
ALTER TABLE
    `expenses` ADD CONSTRAINT `expenses_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `expenses_categories`(`category_id`);
ALTER TABLE
    `payments` ADD CONSTRAINT `payments_booking_id_foreign` FOREIGN KEY(`booking_id`) REFERENCES `bookings`(`booking_id`);
ALTER TABLE
    `payments` ADD CONSTRAINT `payments_invoice_id_foreign` FOREIGN KEY(`invoice_id`) REFERENCES `invoices`(`invoice_id`);
ALTER TABLE
    `payments` ADD CONSTRAINT `payments_currency_id_foreign` FOREIGN KEY(`currency_id`) REFERENCES `currencies`(`currencies_id`);
ALTER TABLE
    `prices_policy` ADD CONSTRAINT `prices_policy_flight_id_foreign` FOREIGN KEY(`flight_id`) REFERENCES `flights`(`flight_id`);