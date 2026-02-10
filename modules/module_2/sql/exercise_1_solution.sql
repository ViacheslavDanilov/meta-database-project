USE LittleLemonDB;

-- Task 1: Create a virtual table for orders with quantity > 2.
DROP VIEW IF EXISTS OrdersView;
CREATE VIEW OrdersView AS
SELECT
  OrderID,
  Quantity,
  TotalCost AS Cost
FROM Orders
WHERE Quantity > 2;

SELECT * FROM OrdersView;

-- Task 2: Join customer, order, menu item, and category data for orders > 150.
-- Note: This schema does not have a `Menus` table. Equivalent menu data comes from
-- OrderItems -> MenuItems -> MenuCategories.
SELECT
  c.CustomerID,
  CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
  o.OrderID,
  o.TotalCost AS Cost,
  mi.ItemName AS MenuName,
  mc.CategoryName AS Category
FROM Customers c
INNER JOIN Orders o
  ON c.CustomerID = o.CustomerID
INNER JOIN OrderItems oi
  ON o.OrderID = oi.OrderID
INNER JOIN MenuItems mi
  ON oi.MenuItemID = mi.MenuItemID
INNER JOIN MenuCategories mc
  ON mi.CategoryID = mc.CategoryID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;

-- Task 3: Use a subquery with ANY to find menu items related to orders where
-- quantity is greater than 2.
SELECT DISTINCT
  mi.ItemName AS MenuName
FROM MenuItems mi
WHERE mi.MenuItemID = ANY (
  SELECT oi.MenuItemID
  FROM OrderItems oi
  INNER JOIN Orders o
    ON oi.OrderID = o.OrderID
  WHERE o.Quantity > 2
);
