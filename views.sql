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