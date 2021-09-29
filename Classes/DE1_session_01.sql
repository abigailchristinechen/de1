-- DE DAY 1 2021/09/20

-- topic questions
-- #1 what is data engineering and why is it important for data analysts?
-- #2 how to access a data set, stored in a database?
-- #3 how to load various data files (eg.csv) into a database?

-- learning objectives
-- #1 setting the context - evolution of digital persistency 1950-2010
-- #2 introducing the basic terms in context of SQL 
-- #3 writing the first SQL
-- #4 setting the lcoal mySQL/ Workbench
-- #5 understanding how to work in Workbench
-- #6 creating and exploring the first mySQL database
-- #7 understanding how to backup and restore a database

-- session keywords
-- #intro , #local environment, #basicSQL, #firstdatabase #datadumps
CREATE SCHEMA de1_session_01;

-- to select the schema
USE de1_session_01;

-- to delete a schema
DROP SCHEMA de1_session_01;

-- to delete if it exists
DROP SCHEMA IF EXISTS de1_session_01;

CREATE SCHEMA de1_session_01;
USE de1_session_01;

CREATE TABLE birdstrikes
(id INTEGER NOT NULL,
aircraft VARCHAR(32),
flight_date DATE NOT NULL,
damage VARCHAR(16) NOT NULL, 
airline VARCHAR(255) NOT NULL,
state VARCHAR(255),
phase_of_flight VARCHAR(32),
reported_date DATE,
bird_size VARCHAR(16),
cost INTEGER NOT NULL,
speed INTEGER, PRIMARY KEY (id)
);

-- for loading file
SHOW VARIABLES LIKE "secure_file_priv";
SHOW VARIABLES LIKE "local_infile";

-- load CSV data into the table
-- to get the path name in MAC use Control + Shift + 2 Tap + Options
LOAD DATA INFILE '/Users/abigailchristinechen/Downloads/birdstrikes_small.csv'
INTO TABLE birdstrikes
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(id, aircraft, flight_date, damage, airline, state, phase_of_flight, @v_reported_date,bird_size,cost, @v_speed)
SET
reported_date = nullif(@v_reported_date, ''),
speed = nullif(@v_speed,'')
;

-- list the tables in the database
SHOW TABLES;

-- list the structures of the table
DESCRIBE birdstrikes;

-- select all data in birdstrikes
SELECT * FROM birdstrikes;

-- select certain fields
SELECT cost FROM birdstrikes;

SELECT airline, cost FROM birdstrikes;











