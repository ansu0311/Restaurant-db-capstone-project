DELIMITER //

CREATE PROCEDURE AddValidBooking(
    IN bookingDate DATE,
    IN tableNumber INT)
BEGIN
    DECLARE existingBookingCount INT;

    -- Check if the table is already booked
    SELECT COUNT(*) INTO existingBookingCount
    FROM Bookings
    WHERE bookings.Date = bookings.Date AND TableNumber = tableNumber;

      -- Start a transaction
    START TRANSACTION;

    IF existingBookingCount > 0 THEN
        -- The table is already booked, so rollback the transaction
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Table is already booked for this date.';
    ELSE
        -- The table is available, so insert the new booking
        INSERT INTO Bookings (Bookings.Date, TableNumber)
        VALUES (bookingDate, tableNumber);

        -- Commit the transaction
        COMMIT;
    END IF;
END //

DELIMITER ;