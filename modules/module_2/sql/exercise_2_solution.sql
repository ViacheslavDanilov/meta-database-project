USE LittleLemonDB;

-- Task 1: Create a procedure to return maximum ordered quantity.
DROP PROCEDURE IF EXISTS GetMaxQuantity;
DELIMITER $$
CREATE PROCEDURE GetMaxQuantity()
BEGIN
  SELECT MAX(Quantity) AS MaxQuantity
  FROM Orders;
END $$
DELIMITER ;

CALL GetMaxQuantity();

-- Task 2: Create a prepared statement for order details by CustomerID.
SET @get_order_detail_sql =
  'SELECT OrderID, Quantity, TotalCost
   FROM Orders
   WHERE CustomerID = ?';

PREPARE GetOrderDetail FROM @get_order_detail_sql;

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Optional cleanup after use.
DEALLOCATE PREPARE GetOrderDetail;

-- Task 3: Create a procedure to cancel (delete) an order by OrderID.
DROP PROCEDURE IF EXISTS CancelOrder;
DELIMITER $$
CREATE PROCEDURE CancelOrder(IN p_order_id INT)
BEGIN
  DELETE FROM Orders
  WHERE OrderID = p_order_id;

  IF ROW_COUNT() > 0 THEN
    SELECT CONCAT('Order ', p_order_id, ' is cancelled') AS Confirmation;
  ELSE
    SELECT CONCAT('Order ', p_order_id, ' was not found') AS Confirmation;
  END IF;
END $$
DELIMITER ;

-- Example call:
CALL CancelOrder(5);
