
-- ============================================
-- FleetFlow - Sprint 1
-- Database: FleetFlowDB
-- Task: Create all six database tables
-- ============================================

CREATE DATABASE IF NOT EXISTS FleetFlowDB;
USE FleetFlowDB;

-- 1. Branche Table
CREATE TABLE IF NOT EXISTS Branche (
    BranchID INT AUTO_INCREMENT PRIMARY KEY,
    BranchName VARCHAR(100),
    City VARCHAR(50)
);

-- 2. Vehicle Table
CREATE TABLE IF NOT EXISTS Vehicle (
    VehicleID INT AUTO_INCREMENT PRIMARY KEY,
    PlateNumber VARCHAR(20) UNIQUE NOT NULL,
    Category VARCHAR(30),
    Make VARCHAR(50),
    Model VARCHAR(50),
    Mileage INT DEFAULT 0,
    BranchID INT,
    Status VARCHAR(20) DEFAULT 'Available'
);

-- 3. Customer Table
CREATE TABLE IF NOT EXISTS Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    LicenseNumber VARCHAR(30) UNIQUE,
    Phone VARCHAR(20)
);

-- 4. Rental Table
CREATE TABLE IF NOT EXISTS Rental (
    RentalID INT AUTO_INCREMENT PRIMARY KEY,
    VehicleID INT,
    CustomerID INT,
    StartDate DATE NOT NULL,
    ExpectedReturnDate DATE NOT NULL,
    ActualReturnDate DATE,
    DailyRate DECIMAL(10,2),

    CONSTRAINT fk_rental_vehicle
        FOREIGN KEY (VehicleID)
        REFERENCES Vehicle(VehicleID),

    CONSTRAINT fk_rental_customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID),

    CONSTRAINT chk_daily_rate
        CHECK (DailyRate >= 0)
);

-- 5. MaintenanceLog Table
CREATE TABLE IF NOT EXISTS MaintenanceLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    VehicleID INT,
    ServiceDate DATE,
    Description VARCHAR(200),
    Cost DECIMAL(10,2),

    CONSTRAINT fk_maintenance_vehicle
        FOREIGN KEY (VehicleID)
        REFERENCES Vehicle(VehicleID)
);

-- 6. Invoice Table
CREATE TABLE IF NOT EXISTS Invoice (
    InvoiceID INT AUTO_INCREMENT PRIMARY KEY,
    RentalID INT,
    TotalAmount DECIMAL(10,2),
    LateFee DECIMAL(10,2) DEFAULT 0,
    IssuedDate DATE,

    CONSTRAINT fk_invoice_rental
        FOREIGN KEY (RentalID)
        REFERENCES Rental(RentalID)
);

-- Verify table creation
SHOW TABLES;
