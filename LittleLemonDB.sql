DROP DATABASE IF EXISTS LittleLemonDB;
CREATE DATABASE LittleLemonDB;
USE LittleLemonDB;

CREATE TABLE Customers (
  CustomerID INT AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Phone VARCHAR(20) NOT NULL,
  Email VARCHAR(100) NOT NULL UNIQUE,
  CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Staff (
  StaffID INT AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Role VARCHAR(50) NOT NULL,
  Salary DECIMAL(10, 2) NOT NULL,
  HireDate DATE NOT NULL,
  CHECK (Salary >= 0)
);

CREATE TABLE Bookings (
  BookingID INT AUTO_INCREMENT PRIMARY KEY,
  BookingDate DATE NOT NULL,
  BookingTime TIME NOT NULL,
  TableNumber INT NOT NULL,
  NumberOfGuests INT NOT NULL,
  CustomerID INT NOT NULL,
  CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_booking_customer
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  UNIQUE KEY uk_booking_slot (BookingDate, BookingTime, TableNumber),
  CHECK (TableNumber > 0),
  CHECK (NumberOfGuests > 0)
);

CREATE TABLE MenuCategories (
  CategoryID INT AUTO_INCREMENT PRIMARY KEY,
  CategoryName VARCHAR(30) NOT NULL UNIQUE,
  Description VARCHAR(255)
);

CREATE TABLE MenuItems (
  MenuItemID INT AUTO_INCREMENT PRIMARY KEY,
  CategoryID INT NOT NULL,
  ItemName VARCHAR(100) NOT NULL,
  ItemDescription VARCHAR(255),
  Price DECIMAL(10, 2) NOT NULL,
  IsActive BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT fk_menu_category
    FOREIGN KEY (CategoryID)
    REFERENCES MenuCategories(CategoryID)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  UNIQUE KEY uk_menu_item_name_per_category (CategoryID, ItemName),
  CHECK (Price >= 0)
);

CREATE TABLE Orders (
  OrderID INT AUTO_INCREMENT PRIMARY KEY,
  OrderDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Quantity INT NOT NULL,
  TotalCost DECIMAL(10, 2) NOT NULL,
  CustomerID INT NOT NULL,
  BookingID INT NULL,
  StaffID INT NULL,
  CONSTRAINT fk_order_customer
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT fk_order_booking
    FOREIGN KEY (BookingID)
    REFERENCES Bookings(BookingID)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
  CONSTRAINT fk_order_staff
    FOREIGN KEY (StaffID)
    REFERENCES Staff(StaffID)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
  CHECK (Quantity > 0),
  CHECK (TotalCost >= 0)
);

CREATE TABLE OrderItems (
  OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
  OrderID INT NOT NULL,
  MenuItemID INT NOT NULL,
  Quantity INT NOT NULL,
  UnitPrice DECIMAL(10, 2) NOT NULL,
  LineTotal DECIMAL(10, 2) NOT NULL,
  CONSTRAINT fk_orderitem_order
    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT fk_orderitem_menuitem
    FOREIGN KEY (MenuItemID)
    REFERENCES MenuItems(MenuItemID)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  UNIQUE KEY uk_order_menu_item (OrderID, MenuItemID),
  CHECK (Quantity > 0),
  CHECK (UnitPrice >= 0),
  CHECK (LineTotal >= 0)
);

CREATE TABLE OrderDeliveryStatus (
  DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
  OrderID INT NOT NULL,
  DeliveryDate DATETIME NULL,
  Status ENUM('Preparing', 'Out for delivery', 'Delivered', 'Cancelled') NOT NULL,
  Notes VARCHAR(255),
  CONSTRAINT fk_delivery_order
    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  UNIQUE KEY uk_delivery_order (OrderID)
);

INSERT INTO MenuCategories (CategoryName, Description)
VALUES
  ('Cuisines', 'Main regional cuisine style'),
  ('Starters', 'Appetizers and small plates'),
  ('Courses', 'Main course dishes'),
  ('Drinks', 'Hot and cold beverages'),
  ('Desserts', 'Sweet dishes and pastries');
