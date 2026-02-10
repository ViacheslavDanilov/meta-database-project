USE LittleLemonDB;

-- Ensure required customer records exist for IDs used in this exercise.
INSERT INTO Customers (CustomerID, FirstName, LastName, Phone, Email)
VALUES
  (1, 'Anna', 'Miller', '+1-202-555-0101', 'anna.miller@example.com'),
  (2, 'Brian', 'Clark', '+1-202-555-0102', 'brian.clark@example.com'),
  (3, 'Carla', 'Lopez', '+1-202-555-0103', 'carla.lopez@example.com')
ON DUPLICATE KEY UPDATE
  FirstName = VALUES(FirstName),
  LastName = VALUES(LastName),
  Phone = VALUES(Phone);

-- Task 1: AddBooking procedure.
-- Note: This schema also requires BookingTime and NumberOfGuests, so defaults are used.
DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER $$
CREATE PROCEDURE AddBooking(
  IN p_booking_id INT,
  IN p_customer_id INT,
  IN p_booking_date DATE,
  IN p_table_number INT
)
BEGIN
  INSERT INTO Bookings
    (BookingID, BookingDate, BookingTime, TableNumber, NumberOfGuests, CustomerID)
  VALUES
    (p_booking_id, p_booking_date, '18:00:00', p_table_number, 2, p_customer_id);

  SELECT 'New booking added' AS Confirmation;
END $$
DELIMITER ;

-- Example call:
CALL AddBooking(10, 3, '2022-12-30', 4);

-- Task 2: UpdateBooking procedure.
DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER $$
CREATE PROCEDURE UpdateBooking(
  IN p_booking_id INT,
  IN p_booking_date DATE
)
BEGIN
  UPDATE Bookings
  SET BookingDate = p_booking_date
  WHERE BookingID = p_booking_id;

  IF ROW_COUNT() > 0 THEN
    SELECT CONCAT('Booking ', p_booking_id, ' updated') AS Confirmation;
  ELSE
    SELECT CONCAT('Booking ', p_booking_id, ' not found') AS Confirmation;
  END IF;
END $$
DELIMITER ;

-- Example call:
CALL UpdateBooking(10, '2022-12-17');

-- Task 3: CancelBooking procedure.
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER $$
CREATE PROCEDURE CancelBooking(
  IN p_booking_id INT
)
BEGIN
  DELETE FROM Bookings
  WHERE BookingID = p_booking_id;

  IF ROW_COUNT() > 0 THEN
    SELECT CONCAT('Booking ', p_booking_id, ' cancelled') AS Confirmation;
  ELSE
    SELECT CONCAT('Booking ', p_booking_id, ' not found') AS Confirmation;
  END IF;
END $$
DELIMITER ;

-- Example call:
CALL CancelBooking(10);
