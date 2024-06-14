DELIMITER //

CREATE TRIGGER UpdateDriverAverageRating
AFTER INSERT ON Trips
FOR EACH ROW
BEGIN
    DECLARE total_ratings INT;
    DECLARE new_average DECIMAL(3, 2);

    -- Calculate the new average rating
    SELECT COUNT(*), AVG(Rating)
    INTO total_ratings, new_average
    FROM Trips
    WHERE DriverID = NEW.DriverID;

    -- Update the driver's average rating and total ratings
    UPDATE Drivers
    SET AverageRating = new_average,
        TotalRatings = total_ratings
    WHERE ID = NEW.DriverID;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER CheckTripDate
BEFORE INSERT ON Trips
FOR EACH ROW
BEGIN
    DECLARE current_date DATE;

    SET current_date = CURDATE();

    IF NEW.TripDate != current_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Trips can only be created for today''s date.';
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER ValidateVehicleOwnership
BEFORE INSERT ON Trips
FOR EACH ROW
BEGIN
    DECLARE ownership_count INT;

    SELECT COUNT(*)
    INTO ownership_count
    FROM DriverVehicles
    WHERE DriverID = NEW.DriverID AND VehicleID = NEW.VehicleID;

    IF ownership_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Driver does not own the specified vehicle';
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER PreventCommentUpdate
BEFORE UPDATE ON Comments
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Updating comments is not allowed';
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER ShortenName
AFTER UPDATE ON Users
FOR EACH ROW
BEGIN
    DECLARE short_name VARCHAR(255);

    SET short_name = CONCAT(SUBSTRING_INDEX(NEW.Name, ' ', 1), ' ', LEFT(SUBSTRING_INDEX(NEW.Name, ' ', -1), 1), '.');

    UPDATE Users
    SET Name = short_name
    WHERE ID = NEW.ID;
END;
//

DELIMITER ;

CREATE TRIGGER ShortenDriverName
AFTER UPDATE ON Drivers
FOR EACH ROW
BEGIN
    DECLARE short_name VARCHAR(255);

    SET short_name = CONCAT(SUBSTRING_INDEX(NEW.Name, ' ', 1), ' ', LEFT(SUBSTRING_INDEX(NEW.Name, ' ', -1), 1), '.');

    UPDATE Drivers
    SET Name = short_name
    WHERE ID = NEW.ID;
END;
//

DELIMITER ;