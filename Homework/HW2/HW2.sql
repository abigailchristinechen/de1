-- Homework #2

-- exercise #1
-- create a table called "employee" with two columns "id" and "employee_name". NULL shouldn't be allowed.
CREATE TABLE employee
(
id INTEGER NOT NULL,
employee_name VARCHAR(255) NOT NULL,
PRIMARY KEY(id) 
);

-- exercise #2: what is the flight_date of the latest birdstrike in the database?
SELECT flight_date FROM new_birdstrikes ORDER BY flight_date DESC LIMIT 1;
SELECT * FROM new_birdstrikes AS b ORDER BY b.flight_date DESC;
-- 2000 04 18


-- exercise #3: what state figures the 145th line in the database?
SELECT state FROM new_birdstrikes LIMIT 144,1;
-- tenessee


-- exercise #4: what is the cost of the 50th most expensive damage?
SELECT DISTINCT cost FROM new_birdstrikes ORDER BY cost DESC LIMIT 49,1;
-- 5345

-- exercise #5: what state figures in the 2nd record, if you filter out the records which have no state and no bird_size specified?
SELECT state FROM new_birdstrikes WHERE state IS NOT NULL AND state != '' and bird_size IS NOT NULL and bird_size !='';
-- colorado 

-- exercise #6: how many days elapsed between the current date and the flights happening in week 52, for incidents from Colorado (Hint: USENOW, DATEDIFF WEEKOFTHEYEAR)
SELECT * FROM new_birdstrikes WHERE state ='Colorado' AND WEEKOFYEAR (flight_date) = '52';
















