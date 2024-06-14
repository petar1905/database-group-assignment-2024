SET AUTOCOMMIT=0;
START TRANSACTION;

CREATE VIEW place_usage AS
SELECT 
    place,
    SUM(start_count) AS times_as_start_point,
    SUM(end_count) AS times_as_destination
FROM (
    SELECT 
        start_place AS place, 
        COUNT(*) AS start_count, 
        0 AS end_count
    FROM 
        trips
    GROUP BY 
        start_place
    
    UNION ALL
    
    SELECT 
        end_place AS place, 
        0 AS start_count, 
        COUNT(*) AS end_count
    FROM 
        trips
    GROUP BY 
        end_place
) AS combined
GROUP BY 
    place;

COMMIT;
SET AUTOCOMMIT=1;

SET AUTOCOMMIT=0;
START TRANSACTION;

CREATE VIEW vehicle_trip_info AS
SELECT 
    CONCAT(v.brand, ' ', v.model) AS vehicle_name,
    MIN(t.date) AS first_trip_date,
    MAX(t.date) AS latest_trip_date
FROM 
    vehicles v
JOIN 
    trips t ON v.id = t.vehicle_id
GROUP BY 
    vehicle_name;

COMMIT;
SET AUTOCOMMIT=1;
select * from vehicle_trip_info

SET AUTOCOMMIT=0;
START TRANSACTION;

CREATE VIEW driver_info AS
SELECT 
    d.name AS driver_name,
    d.avg_rating,
    COUNT(DISTINCT t.id) AS trip_count,
    COUNT(DISTINCT t.vehicle_id) AS vehicle_count
FROM 
    drivers d
LEFT JOIN 
    trips t ON d.id = t.driver_id
GROUP BY 
    d.id, d.name, d.avg_rating;

COMMIT;
SET AUTOCOMMIT=1;

-- Start transaction and set autocommit to 0
SET AUTOCOMMIT=0;
START TRANSACTION;

-- Create the role
CREATE ROLE passenger_role;

-- Grant permissions to the role
GRANT SELECT ON drivers TO passenger_role;
GRANT SELECT ON comments TO passenger_role;

-- Example of granting role to specific passengers
-- Replace 'passenger_user1' and 'passenger_user2' with actual passenger usernames
GRANT passenger_role TO 'passenger_user1';
GRANT passenger_role TO 'passenger_user2';
-- Add more GRANT statements as needed for each passenger

-- Commit the transaction
COMMIT;
SET AUTOCOMMIT=1;

-- Start transaction and set autocommit to 0
SET AUTOCOMMIT=0;
START TRANSACTION;

-- Create the role
CREATE ROLE driver_role;

-- Grant permissions to the role
GRANT INSERT ON trips TO driver_role;

-- Example of granting role to specific drivers
-- Replace 'driver_user1' and 'driver_user2' with actual driver usernames
GRANT driver_role TO 'driver_user1';
GRANT driver_role TO 'driver_user2';
-- Add more GRANT statements as needed for each driver

-- Commit the transaction
COMMIT;
SET AUTOCOMMIT=1;

-- Start transaction and set autocommit to 0
SET AUTOCOMMIT=0;
START TRANSACTION;

-- Create the role
CREATE ROLE moderator_role;

-- Grant permissions to the role
GRANT SELECT ON comments TO moderator_role;
GRANT DELETE ON passengers TO moderator_role;
GRANT DELETE ON drivers TO moderator_role;

-- Example of granting role to specific moderators
-- Replace 'moderator_user1' and 'moderator_user2' with actual moderator usernames
GRANT moderator_role TO 'moderator_user1';
GRANT moderator_role TO 'moderator_user2';
-- Add more GRANT statements as needed for each moderator

-- Commit the transaction
COMMIT;
SET AUTOCOMMIT=1;