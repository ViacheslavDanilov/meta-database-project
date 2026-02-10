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

-- Task 1: Populate Bookings with the required rows.
-- Note: This schema requires BookingTime and NumberOfGuests, so fixed values are used.
DELETE FROM Bookings
WHERE BookingID IN (1, 2, 3, 4);

INSERT INTO Bookings
  (BookingID, BookingDate, BookingTime, TableNumber, NumberOfGuests, CustomerID)
VALUES
  (1, '2022-10-10', '18:00:00', 5, 2, 1),
  (2, '2022-11-12', '18:00:00', 3, 2, 3),
  (3, '2022-10-11', '18:00:00', 2, 2, 2),
  (4, '2022-10-13', '18:00:00', 2, 2, 1);

SELECT BookingID, BookingDate, TableNumber, CustomerID
FROM Bookings
WHERE BookingID IN (1, 2, 3, 4)
ORDER BY BookingID;

-- Task 2: Check if a table is booked for a given date.
DROP PROCEDURE IF EXISTS CheckBooking;
DELIMITER $$
CREATE PROCEDURE CheckBooking(IN p_booking_date DATE, IN p_table_number INT)
BEGIN
  DECLARE v_booking_count INT DEFAULT 0;

  SELECT COUNT(*) INTO v_booking_count
  FROM Bookings
  WHERE BookingDate = p_booking_date
    AND TableNumber = p_table_number;

  IF v_booking_count > 0 THEN
    SELECT CONCAT('Table ', p_table_number, ' is already booked') AS BookingStatus;
  ELSE
    SELECT CONCAT('Table ', p_table_number, ' is available') AS BookingStatus;
  END IF;
END $$
DELIMITER ;

-- Example call:
CALL CheckBooking('2022-10-10', 5);

-- Task 3: Add a booking only if the table is not already booked on that date.
DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER $$
CREATE PROCEDURE AddValidBooking(IN p_booking_date DATE, IN p_table_number INT)
BEGIN
  DECLARE v_booking_count INT DEFAULT 0;

  START TRANSACTION;

  SELECT COUNT(*) INTO v_booking_count
  FROM Bookings
  WHERE BookingDate = p_booking_date
    AND TableNumber = p_table_number;

  IF v_booking_count > 0 THEN
    ROLLBACK;
    SELECT CONCAT('Table ', p_table_number, ' is already booked - booking cancelled') AS BookingStatus;
  ELSE
    INSERT INTO Bookings (BookingDate, BookingTime, TableNumber, NumberOfGuests, CustomerID)
    VALUES (p_booking_date, '19:00:00', p_table_number, 2, 1);

    COMMIT;
    SELECT CONCAT('Table ', p_table_number, ' is available - booking confirmed') AS BookingStatus;
  END IF;
END $$
DELIMITER ;

-- Example calls:
CALL AddValidBooking('2022-10-10', 5); -- expected rollback
CALL AddValidBooking('2022-10-10', 6); -- expected commit
