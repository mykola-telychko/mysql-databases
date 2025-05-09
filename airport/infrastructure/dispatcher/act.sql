CREATE TABLE `Flights`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `FlightNumber` VARCHAR(10) NOT NULL,
    `Status` ENUM('') NOT NULL,
    `DepartureTime` DATETIME NOT NULL,
    `ArrivalTime` DATETIME NOT NULL
);
ALTER TABLE
    `Flights` ADD UNIQUE `flights_flightnumber_unique`(`FlightNumber`);
CREATE TABLE `Airplanes`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Model` VARCHAR(50) NOT NULL,
    `RegistrationNumber` VARCHAR(20) NOT NULL,
    `Capacity` INT NOT NULL,
    `LastMaintenanceDate` DATE NULL
);
ALTER TABLE
    `Airplanes` ADD UNIQUE `airplanes_registrationnumber_unique`(`RegistrationNumber`);
CREATE TABLE `Pilots`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(100) NOT NULL,
    `LicenseNumber` VARCHAR(20) NOT NULL,
    `ExperienceHours` INT NULL
);
ALTER TABLE
    `Pilots` ADD UNIQUE `pilots_licensenumber_unique`(`LicenseNumber`);
CREATE TABLE `CrewMembers`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(100) NOT NULL,
    `Role` VARCHAR(50) NOT NULL,
    `AssignedFlightID` INT NULL
);
CREATE TABLE `AirTrafficControllers`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(100) NOT NULL,
    `ShiftSchedule` TEXT NULL,
    `CertificationLevel` ENUM('') NULL DEFAULT 'Junior'
);
CREATE TABLE `Airports`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(100) NOT NULL,
    `IATACode` CHAR(3) NOT NULL,
    `RunwayCount` INT NULL DEFAULT '1'
);
ALTER TABLE
    `Airports` ADD UNIQUE `airports_iatacode_unique`(`IATACode`);
CREATE TABLE `Runways`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `AirportID` INT NOT NULL,
    `Status` ENUM('') NULL DEFAULT 'Active',
    `Length` INT NOT NULL
);
CREATE TABLE `Gates`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `AirportID` INT NOT NULL,
    `Status` ENUM('') NULL,
    `AssignedFlightID` INT NULL
);
CREATE TABLE `Sessions`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ControllerID` INT NOT NULL,
    `LoginTime` DATETIME NOT NULL,
    `LogoutTime` DATETIME NULL,
    `Token` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Sessions` ADD UNIQUE `sessions_token_unique`(`Token`);
CREATE TABLE `RadioFrequencies`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Frequency` VARCHAR(10) NOT NULL,
    `Purpose` TEXT NULL,
    `AssignedControllerID` INT NULL
);
ALTER TABLE
    `RadioFrequencies` ADD UNIQUE `radiofrequencies_frequency_unique`(`Frequency`);
CREATE TABLE `FlightEvents`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `FlightID` INT NOT NULL,
    `EventType` VARCHAR(50) NOT NULL,
    `Timestamp` DATETIME NULL DEFAULT CURRENT_TIMESTAMP(), `ControllerID` INT NOT NULL);
CREATE TABLE `MaintenanceLogs`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `AirplaneID` INT NOT NULL,
    `IssueDescription` TEXT NOT NULL,
    `ResolutionDate` DATE NULL
);
CREATE TABLE `FlightPlans`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `FlightID` INT NOT NULL,
    `RouteCoordinates` TEXT NOT NULL,
    `Altitude` INT NOT NULL,
    `FuelEstimation` DECIMAL(10, 2) NOT NULL
);
ALTER TABLE
    `FlightPlans` ADD UNIQUE `flightplans_flightid_unique`(`FlightID`);
CREATE TABLE `WeatherData`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `AirportID` INT NOT NULL,
    `WindSpeed` DECIMAL(5, 2) NULL,
    `Visibility` INT NULL,
    `Timestamp` DATETIME NULL DEFAULT CURRENT_TIMESTAMP());
CREATE TABLE `AlertsNotifications`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Message` TEXT NOT NULL,
    `Severity` ENUM('') NULL DEFAULT 'Medium',
    `Timestamp` DATETIME NULL DEFAULT CURRENT_TIMESTAMP(), `RecipientID` INT NOT NULL);
ALTER TABLE
    `Gates` ADD CONSTRAINT `gates_airportid_foreign` FOREIGN KEY(`AirportID`) REFERENCES `Airports`(`ID`);
ALTER TABLE
    `MaintenanceLogs` ADD CONSTRAINT `maintenancelogs_airplaneid_foreign` FOREIGN KEY(`AirplaneID`) REFERENCES `Airplanes`(`ID`);
ALTER TABLE
    `FlightEvents` ADD CONSTRAINT `flightevents_flightid_foreign` FOREIGN KEY(`FlightID`) REFERENCES `Flights`(`ID`);
ALTER TABLE
    `FlightPlans` ADD CONSTRAINT `flightplans_flightid_foreign` FOREIGN KEY(`FlightID`) REFERENCES `Flights`(`ID`);
ALTER TABLE
    `RadioFrequencies` ADD CONSTRAINT `radiofrequencies_assignedcontrollerid_foreign` FOREIGN KEY(`AssignedControllerID`) REFERENCES `AirTrafficControllers`(`ID`);
ALTER TABLE
    `CrewMembers` ADD CONSTRAINT `crewmembers_assignedflightid_foreign` FOREIGN KEY(`AssignedFlightID`) REFERENCES `Flights`(`ID`);
ALTER TABLE
    `Gates` ADD CONSTRAINT `gates_assignedflightid_foreign` FOREIGN KEY(`AssignedFlightID`) REFERENCES `Flights`(`ID`);
ALTER TABLE
    `FlightEvents` ADD CONSTRAINT `flightevents_controllerid_foreign` FOREIGN KEY(`ControllerID`) REFERENCES `AirTrafficControllers`(`ID`);
ALTER TABLE
    `Runways` ADD CONSTRAINT `runways_airportid_foreign` FOREIGN KEY(`AirportID`) REFERENCES `Airports`(`ID`);
ALTER TABLE
    `Sessions` ADD CONSTRAINT `sessions_controllerid_foreign` FOREIGN KEY(`ControllerID`) REFERENCES `AirTrafficControllers`(`ID`);
ALTER TABLE
    `WeatherData` ADD CONSTRAINT `weatherdata_airportid_foreign` FOREIGN KEY(`AirportID`) REFERENCES `Airports`(`ID`);