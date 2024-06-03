INSERT INTO passengers
(name, email, password)
VALUES
("Becky", "b3@kee.com", "123456"),
("Donald", "d0nny@gmail.com", "987654"),
("Arthur", "arthy@mail.ru", "767676");

INSERT INTO drivers
(name, email, password)
VALUES
("David", "david@yahoo.com", "qwerty123"),
("John", "john@users.co.uk", "azertyuiop123"),
("Lisa", "lisa_l@yahoo.jp", "k@nb@n55");

INSERT INTO vehicles
(brand, model, year, owner_id)
VALUES
("Tesla", "Model 3", 2020, 1),
("Toyota", "Corolla", 2018, 2),
("Opel", "Kadett", 1990, 3);

INSERT INTO trips
(vehicle_id, driver_id, start_place, end_place)
VALUES
(1, 1, "Sofia", "Plovdiv"),
(2, 2, "Sofia", "Pravets"),
(3, 3, "Sofia", "Botevgrad");

INSERT INTO trips_travellers
(trip_id, passenger_id)
VALUES
(1, 2), (2, 1), (3, 3);

INSERT INTO comments
(trip_id, passenger_id, content, rating)
VALUES
(1, 2, "Comment #1", 8),
(2, 1, "Comment #2", 6),
(3, 3, "Comment #3", 4);