
-- ============================================
-- FleetFlow - Sprint 1
-- Task: Constraint Testing
-- ============================================

USE FleetFlowDB;

-- TEST 1: UNIQUE constraint
-- Expected: ERROR (duplicate PlateNumber)
INSERT INTO Vehicle
(PlateNumber, Category, Make, Model, Mileage, BranchID)
VALUES
('TN01AB0001', 'Car', 'Maruti', 'Swift', 10000, 1);


-- TEST 2: CHECK constraint
-- Expected: ERROR (negative DailyRate)
INSERT INTO Rental
(VehicleID, CustomerID, StartDate, ExpectedReturnDate, DailyRate)
VALUES
(1, 1, '2026-11-20', '2026-11-25', -500.00);


-- TEST 3: DEFAULT constraint for Vehicle Status
-- Expected: SUCCESS (Status becomes Available)
INSERT INTO Vehicle
(PlateNumber, Category, Make, Model, Mileage, BranchID)
VALUES
('TN01TEST001', 'Car', 'Maruti', 'Swift', 15000, 1);

SELECT VehicleID, PlateNumber, Status
FROM Vehicle
WHERE PlateNumber = 'TN01TEST001';


-- TEST 4: DEFAULT constraint for Invoice LateFee
-- Expected: SUCCESS (LateFee becomes 0)
INSERT INTO Invoice
(RentalID, TotalAmount, IssuedDate)
VALUES
(1, 5000.00, '2026-11-20');

SELECT InvoiceID, RentalID, TotalAmount, LateFee
FROM Invoice
WHERE RentalID = 1;


-- TEST 5: FOREIGN KEY - Invalid VehicleID
-- Expected: ERROR
INSERT INTO Rental
(VehicleID, CustomerID, StartDate, ExpectedReturnDate, DailyRate)
VALUES
(9999, 1, '2026-11-20', '2026-11-25', 1000.00);


-- TEST 6: FOREIGN KEY - Invalid CustomerID
-- Expected: ERROR
INSERT INTO Rental
(VehicleID, CustomerID, StartDate, ExpectedReturnDate, DailyRate)
VALUES
(1, 9999, '2026-11-20', '2026-11-25', 1000.00);


-- FINAL: Verify record counts
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
