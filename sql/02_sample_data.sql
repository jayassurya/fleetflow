
-- ============================================
-- FleetFlow - Sprint 1
-- Task: Insert sample data into six tables
-- Total: 250 records
-- ============================================

USE FleetFlowDB;

-- 1. Insert 10 Branches
INSERT INTO Branche (BranchName, City) VALUES
('Chennai Central', 'Chennai'),
('Anna Nagar Branch', 'Chennai'),
('Tambaram Branch', 'Chennai'),
('Coimbatore Branch', 'Coimbatore'),
('Madurai Branch', 'Madurai'),
('Trichy Branch', 'Trichy'),
('Salem Branch', 'Salem'),
('Bangalore Branch', 'Bangalore'),
('Hyderabad Branch', 'Hyderabad'),
('Pondicherry Branch', 'Pondicherry');


-- 2. Insert 200 Vehicles
INSERT INTO Vehicle
(PlateNumber, Category, Make, Model, Mileage, BranchID, Status)
WITH RECURSIVE numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM numbers WHERE n < 200
)
SELECT
    CONCAT('TN01AB', LPAD(n, 4, '0')),
    CASE
        WHEN MOD(n, 3) = 0 THEN 'Truck'
        WHEN MOD(n, 3) = 1 THEN 'Car'
        ELSE 'Van'
    END,
    CASE
        WHEN MOD(n, 3) = 0 THEN 'Ashok Leyland'
        WHEN MOD(n, 3) = 1 THEN 'Maruti'
        ELSE 'Tata'
    END,
    CASE
        WHEN MOD(n, 3) = 0 THEN 'Dost'
        WHEN MOD(n, 3) = 1 THEN 'Swift'
        ELSE 'Winger'
    END,
    10000 + (n * 150),
    MOD(n - 1, 10) + 1,
    'Available'
FROM numbers;


-- 3. Insert 10 Customers
INSERT INTO Customer
(FirstName, LastName, LicenseNumber, Phone) VALUES
('Arun', 'Kumar', 'DL10001', '9876500001'),
('Bala', 'Krishnan', 'DL10002', '9876500002'),
('Charan', 'Raj', 'DL10003', '9876500003'),
('Deepak', 'Kumar', 'DL10004', '9876500004'),
('Elango', 'Nathan', 'DL10005', '9876500005'),
('Farhan', 'Ali', 'DL10006', '9876500006'),
('Gokul', 'Raj', 'DL10007', '9876500007'),
('Hari', 'Prasad', 'DL10008', '9876500008'),
('Imran', 'Khan', 'DL10009', '9876500009'),
('Karthik', 'Raja', 'DL10010', '9876500010');


-- 4. Insert 10 Rentals
INSERT INTO Rental
(VehicleID, CustomerID, StartDate, ExpectedReturnDate,
 ActualReturnDate, DailyRate) VALUES
(1, 1, '2026-11-01', '2026-11-05', '2026-11-05', 1500.00),
(2, 2, '2026-11-02', '2026-11-06', '2026-11-06', 1800.00),
(3, 3, '2026-11-03', '2026-11-07', NULL, 2500.00),
(4, 4, '2026-11-04', '2026-11-08', '2026-11-08', 1600.00),
(5, 5, '2026-11-05', '2026-11-09', NULL, 2000.00),
(6, 6, '2026-11-06', '2026-11-10', '2026-11-10', 2200.00),
(7, 7, '2026-11-07', '2026-11-11', NULL, 1700.00),
(8, 8, '2026-11-08', '2026-11-12', '2026-11-12', 1900.00),
(9, 9, '2026-11-09', '2026-11-13', NULL, 2600.00),
(10, 10, '2026-11-10', '2026-11-14', '2026-11-14', 1500.00);


-- 5. Insert 10 Maintenance Records
INSERT INTO MaintenanceLog
(VehicleID, ServiceDate, Description, Cost) VALUES
(1, '2026-10-01', 'Engine oil replacement', 2500.00),
(2, '2026-10-02', 'Brake inspection', 1800.00),
(3, '2026-10-03', 'Tyre replacement', 6500.00),
(4, '2026-10-04', 'Battery replacement', 4200.00),
(5, '2026-10-05', 'Engine servicing', 5000.00),
(6, '2026-10-06', 'Air filter replacement', 1200.00),
(7, '2026-10-07', 'Wheel alignment', 1500.00),
(8, '2026-10-08', 'Clutch inspection', 3000.00),
(9, '2026-10-09', 'Coolant replacement', 1000.00),
(10, '2026-10-10', 'General vehicle service', 3500.00);


-- 6. Insert 10 Invoices
INSERT INTO Invoice
(RentalID, TotalAmount, LateFee, IssuedDate) VALUES
(1, 6000.00, 0.00, '2026-11-05'),
(2, 7200.00, 0.00, '2026-11-06'),
(3, 10000.00, 0.00, '2026-11-07'),
(4, 6400.00, 0.00, '2026-11-08'),
(5, 8000.00, 0.00, '2026-11-09'),
(6, 8800.00, 0.00, '2026-11-10'),
(7, 6800.00, 0.00, '2026-11-11'),
(8, 7600.00, 0.00, '2026-11-12'),
(9, 10400.00, 0.00, '2026-11-13'),
(10, 6000.00, 0.00, '2026-11-14');


-- 7. Verify record counts
SELECT 'Branche' AS TableName, COUNT(*) AS TotalRecords FROM Branche
UNION ALL
SELECT 'Vehicle', COUNT(*) FROM Vehicle
UNION ALL
SELECT 'Customer', COUNT(*) FROM Customer
UNION ALL
SELECT 'Rental', COUNT(*) FROM Rental
UNION ALL
SELECT 'MaintenanceLog', COUNT(*) FROM MaintenanceLog
UNION ALL
SELECT 'Invoice', COUNT(*) FROM Invoice;
