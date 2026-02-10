USE LittleLemonDB;

-- This script resets demo data in these tables.
-- It keeps schema objects and repopulates with deterministic mock rows.
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE OrderDeliveryStatus;
TRUNCATE TABLE OrderItems;
TRUNCATE TABLE Orders;
TRUNCATE TABLE Bookings;
TRUNCATE TABLE Staff;
TRUNCATE TABLE MenuItems;
TRUNCATE TABLE Customers;
SET FOREIGN_KEY_CHECKS = 1;

-- Ensure required menu categories exist.
INSERT IGNORE INTO MenuCategories (CategoryID, CategoryName, Description) VALUES
  (1, 'Cuisines', 'Main regional cuisine style'),
  (2, 'Starters', 'Appetizers and small plates'),
  (3, 'Courses', 'Main course dishes'),
  (4, 'Drinks', 'Hot and cold beverages'),
  (5, 'Desserts', 'Sweet dishes and pastries');

INSERT INTO Customers (CustomerID, FirstName, LastName, Phone, Email) VALUES
  (1, 'Anna', 'Miller', '+1-202-555-0101', 'anna.miller@example.com'),
  (2, 'Brian', 'Clark', '+1-202-555-0102', 'brian.clark@example.com'),
  (3, 'Carla', 'Lopez', '+1-202-555-0103', 'carla.lopez@example.com'),
  (4, 'David', 'Nguyen', '+1-202-555-0104', 'david.nguyen@example.com');

INSERT INTO Staff (StaffID, FirstName, LastName, Role, Salary, HireDate) VALUES
  (1, 'Maya', 'Patel', 'Manager', 55000.00, '2023-01-10'),
  (2, 'Noah', 'Reed', 'Waiter', 32000.00, '2024-03-15'),
  (3, 'Liam', 'Scott', 'Chef', 48000.00, '2022-11-01');

INSERT INTO MenuItems (MenuItemID, CategoryID, ItemName, ItemDescription, Price, IsActive) VALUES
  (1, 2, 'Bruschetta', 'Toasted bread with tomatoes', 8.50, TRUE),
  (2, 2, 'Greek Salad', 'Salad with feta and olives', 10.00, TRUE),
  (3, 3, 'Grilled Salmon', 'Salmon with vegetables', 24.00, TRUE),
  (4, 3, 'Pasta Primavera', 'Pasta with seasonal vegetables', 18.00, TRUE),
  (5, 4, 'Lemonade', 'Fresh homemade lemonade', 5.00, TRUE),
  (6, 5, 'Tiramisu', 'Classic Italian dessert', 9.00, TRUE);

INSERT INTO Bookings (BookingID, BookingDate, BookingTime, TableNumber, NumberOfGuests, CustomerID) VALUES
  (1, '2026-02-08', '18:30:00', 2, 3, 1),
  (2, '2026-02-08', '19:00:00', 5, 2, 2),
  (3, '2026-02-09', '20:00:00', 1, 4, 3),
  (4, '2026-02-09', '20:30:00', 4, 5, 4);

INSERT INTO Orders (OrderID, OrderDate, Quantity, TotalCost, CustomerID, BookingID, StaffID) VALUES
  (1, '2026-02-08 18:45:00', 3, 185.00, 1, 1, 2),
  (2, '2026-02-08 19:10:00', 1, 45.00, 2, 2, 2),
  (3, '2026-02-09 20:15:00', 4, 220.00, 3, 3, 3),
  (4, '2026-02-09 20:40:00', 2, 120.00, 1, 1, 2),
  (5, '2026-02-09 21:00:00', 5, 300.00, 4, 4, 1);

INSERT INTO OrderItems (OrderItemID, OrderID, MenuItemID, Quantity, UnitPrice, LineTotal) VALUES
  (1, 1, 1, 1, 8.50, 8.50),
  (2, 1, 3, 2, 24.00, 48.00),
  (3, 1, 6, 1, 9.00, 9.00),
  (4, 2, 4, 1, 18.00, 18.00),
  (5, 2, 5, 1, 5.00, 5.00),
  (6, 3, 3, 2, 24.00, 48.00),
  (7, 3, 2, 1, 10.00, 10.00),
  (8, 4, 4, 2, 18.00, 36.00),
  (9, 5, 3, 3, 24.00, 72.00),
  (10, 5, 6, 2, 9.00, 18.00);

INSERT INTO OrderDeliveryStatus (DeliveryID, OrderID, DeliveryDate, Status, Notes) VALUES
  (1, 1, '2026-02-08 19:20:00', 'Delivered', 'Delivered on time'),
  (2, 2, '2026-02-08 19:40:00', 'Delivered', 'No issues'),
  (3, 3, '2026-02-09 20:55:00', 'Delivered', 'Customer confirmed'),
  (4, 4, NULL, 'Preparing', 'In kitchen'),
  (5, 5, NULL, 'Out for delivery', 'Driver assigned');

-- Keep AUTO_INCREMENT aligned with explicit IDs above.
ALTER TABLE Customers AUTO_INCREMENT = 5;
ALTER TABLE Staff AUTO_INCREMENT = 4;
ALTER TABLE MenuItems AUTO_INCREMENT = 7;
ALTER TABLE Bookings AUTO_INCREMENT = 5;
ALTER TABLE Orders AUTO_INCREMENT = 6;
ALTER TABLE OrderItems AUTO_INCREMENT = 11;
ALTER TABLE OrderDeliveryStatus AUTO_INCREMENT = 6;
