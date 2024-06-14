# database-group-assignment-2024

Group assignment for Databases class.



## Tasks

Petar Vladov

- [X] Passenger Table

- [X] Driver Table

- [X] Vehicle Table

- [X] Trip Table

- [X] Comment Table

- [X] Transaction for creating both a driver and a vehicle

- [X] Transaction for creating a trip and a comment for it

Boyan Vasilev

- [ ] Trigger that updates driver's average rating after insertion of trip (AFTER INSERT)

- [ ] Trigger that forbids creation of trips whose date is different from today (BEFORE INSERT)

- [ ] Trigger that forbids creation of trips whose vehicle is not owned by the driver (BEFORE INSERT)

- [ ] Trigger that forbids updates of comments (BEFORE UPDATE)

- [ ] Trigger that shortens passenger/driver's name (John Smith -> John S., Boyan Vasilev -> Boyan V.) (AFTER UPDATE)

- [ ] Trigger that deletes all of user's trips before deleting the user (BEFORE DELETE)

- [ ] Trigger that deletes trip comment before deleting the trip (BEFORE DELETE)

Petar Slavov

- [X] View of info about places (name of place, amount of times as start point and amount of times as destination)

- [X] View of info about vehicles (name of vehicle, date of first trip and date of latest trip)

- [X] View of info about drivers (name of driver, average rating, amount of trips, amount of driven vehicles)

- [X] Role for passenger (can select drivers, comments)

- [X] Role for driver (can create trips)

- [X] Role for moderator (can select comments and delete users)

Nikolay Getov

- [ ] Index for searching vehicles by brand, model (in that order)

- [ ] Index for searching drivers by name (prefix index - first 5 characters)

- [ ] Index for searching trips by destination

- [ ] Index for searching trips by start point
