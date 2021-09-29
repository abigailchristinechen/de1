-- DE DAY 2 2021/09/22

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

CREATE SCHEMA de1_session_02;
USE de1_session_02;

-- copy table
CREATE TABLE new_birdstrikes LIKE birdstrikes;

-- show tables in the database
SHOW TABLES;

-- way to describe variables in a specific table in a schema
DESCRIBE de1_session_02.new_birdstrikes;

-- if you are in the schema, you can skip the schema part 
DESCRIBE new_birdstrikes;

SELECT * FROM new_birdstrikes;

-- delete table
DROP TABLE IF EXISTS new_birdstrikes;

CREATE TABLE new_birdstrikes
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
speed INTEGER, 
PRIMARY KEY (id)
);

-- for loading file
SHOW VARIABLES LIKE "secure_file_priv";
SHOW VARIABLES LIKE "local_infile";

-- load CSV data into the table
-- to get the path name in MAC use Control + Shift + 2 Tap + Options
LOAD DATA INFILE '/Users/abigailchristinechen/Downloads/birdstrikes_small.csv'
INTO TABLE new_birdstrikes
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, aircraft, flight_date, damage, airline, state, phase_of_flight, @v_reported_date,bird_size,cost, @v_speed)
SET
reported_date = nullif(@v_reported_date, ''),
speed = nullif(@v_speed,'')
;

SELECT * FROM new_birdstrikes;
SELECT airline, cost FROM new_birdstrikes;

-- exercise #1
-- create a table called "employee" with two columns "id" and "employee_name". NULL shouldn't be allowed.
CREATE TABLE employee
(
id INTEGER NOT NULL,
employee_name VARCHAR(255) NOT NULL,
PRIMARY KEY(id) 
);

SHOW TABLES;

DESCRIBE employee;

-- insert new rows 
INSERT INTO employee (id, employee_name) VALUES (1, 'Student1');
INSERT INTO employee (id, employee_name) VALUES (2, 'Student2');
INSERT INTO employee (id, employee_name) VALUES (3, 'Student3');

SELECT * FROM employee;

-- can't load this line because the primary key must be unique
INSERT INTO employee (id, employee_name) VALUES (3, 'Student4');

-- updating rows
UPDATE employee SET employee_name = 'Arnold Schwarzenegger' WHERE id =1;
UPDATE employee SET employee_name = 'The Other Arnold' WHERE id =2;

SELECT * FROM employee;

-- deleting rows 
DELETE FROM employee WHERE id=3;

SELECT * FROM employee;

-- empty the whole table
TRUNCATE employee;
SELECT * FROM employee;

-- users and privileges
-- access to certain data

-- create a user
-- the @ '%' part means the user can access the file anywhere on the internet
CREATE USER 'achen'@'%' IDENTIFIED BY 'achen';

-- full rights on one table 
GRANT ALL ON de1_session_02.employee TO 'achen'@'%';

SHOW TABLES;

-- access only one column
GRANT SELECT (state) ON de1_session_02.birdstrikes TO 'achen'@'%';










