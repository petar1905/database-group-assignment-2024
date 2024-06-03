SET AUTOCOMMIT=0;
START TRANSACTION;
CREATE TABLE passengers
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    email VARCHAR(64) NOT NULL UNIQUE,
    password VARCHAR(64) NOT NULL,
    join_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

/* №20524 */

CREATE TABLE drivers
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    email VARCHAR(64) NOT NULL UNIQUE,
    password VARCHAR(64) NOT NULL,
    join_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    avg_rating DECIMAL(3,2) 
);

/* №20524 */

CREATE TABLE vehicles
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    brand VARCHAR(32) NOT NULL,
    model VARCHAR(32) NOT NULL,
    year DECIMAL(4,0) NOT NULL,
    owner_id INT NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES drivers(id)
);

/* №20524 */

CREATE TABLE trips
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_id INT NOT NULL,
    driver_id INT NOT NULL,
    start_place VARCHAR(32) NOT NULL,
    end_place VARCHAR(32) NOT NULL,
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id),
    FOREIGN KEY (driver_id) REFERENCES drivers(id)
);

/* №20524 */

CREATE TABLE trips_travellers
(
    trip_id INT NOT NULL,
    passenger_id INT NOT NULL,
    PRIMARY KEY (trip_id, passenger_id),
    FOREIGN KEY (trip_id) REFERENCES trips(id),
    FOREIGN KEY (passenger_id) REFERENCES passengers(id)
);

/* №20524 */

CREATE TABLE comments
(
  	trip_id INT NOT NULL,
  	passenger_id INT NOT NULL,
    content MEDIUMTEXT NOT NULL,
    rating DECIMAL(1,0) NOT NULL,
  	PRIMARY KEY (trip_id, passenger_id),
    FOREIGN KEY (trip_id, passenger_id) REFERENCES trips_travellers(trip_id, passenger_id)
);
COMMIT;
SET AUTOCOMMIT=1;
/* №20524 */