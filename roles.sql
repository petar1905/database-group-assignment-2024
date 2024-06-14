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