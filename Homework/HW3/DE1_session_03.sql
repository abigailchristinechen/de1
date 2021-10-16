-- DE DAY 3 2021/09/27

-- topic questions
-- As analyst, one the most important operation you do, is data aggregation. How SQL supports data aggregation?


-- learning objectives
-- Learn about conditional logic
-- Introduce the aggregation concepts in SQL
-- Introduce the most used aggregation functions
-- Introduce the functions related to grouping
-- Present examples and exercise aggregation and grouping

-- session keywords
#CONDITIONAL LOGIC
#AGGREGATING
#GROUPING

USE de1_session_02;

-- case logic syntax


SELECT aircraft, airline, cost, 
    CASE 
        WHEN cost  = 0
            THEN 'NO COST'
        WHEN  cost >0 AND cost < 100000
            THEN 'MEDIUM COST'
        ELSE 
            'HIGH COST'
    END
    AS cost_category   
FROM  new_birdstrikes
ORDER BY cost_category;

-- Exercise #1 : Do the same with speed. If speed is NULL or speed < 100 create a “LOW SPEED” category, otherwise, mark as “HIGH SPEED”. 
-- Use IF instead of CASE!

SELECT aircraft, airline, speed,
		IF (speed IS NULL OR speed < 100, 'LOW SPEED', 'HIGH SPEED')
		AS speed_category  
        FROM  new_birdstrikes
        ORDER BY speed_category;
    
-- count the number of records    
SELECT COUNT(*) FROM new_birdstrikes;

-- count the number of not null records in a column
SELECT COUNT(reported_date) FROM new_birdstrikes;

-- count distinct state
SELECT COUNT(DISTINCT state) FROM new_birdstrikes;

-- Exercise #2 : How many distinct ‘aircraft’ we have in the database?
SELECT COUNT(DISTINCT aircraft) FROM  new_birdstrikes;
-- 3  

-- select the sum of cost
SELECT SUM(cost) FROM new_birdstrikes;

-- how to transform units, 1 KNOT = 1.852KMH
SELECT (AVG(speed)*1.852) as avg_kmh FROM new_birdstrikes;
-- 1532.832

-- how many observation days do we have?
SELECT DATEDIFF(MAX(reported_date), MIN(reported_date)) FROM new_birdstrikes;
-- 1143

-- Exercise #3 : What is the lowest speed of aircraft starting with H?
SELECT MIN(speed) AS lowest_speed FROM new_birdstrikes WHERE aircraft LIKE 'H%';
-- 9 

-- group by 
-- one group: what is the highest speed by aircraft type?
SELECT MAX(speed) , aircraft FROM new_birdstrikes GROUP BY aircraft;
-- 21000, Airplane   1900 Helicopter

-- Exercise #4 : Which phase_of_flight has the least of incidents?
SELECT DISTINCT phase_of_flight, COUNT(damage) AS total_damage FROM new_birdstrikes GROUP BY phase_of_flight ORDER BY total_damage ASC; 
-- taxi

-- Exercise #5 : What is the rounded highest average cost by phase_of_flight?
SELECT phase_of_flight, ROUND(AVG(cost)) AS avg_cost FROM new_birdstrikes GROUP BY phase_of_flight ORDER BY avg_cost DESC;
-- 54673
 
 -- two group: which state for which aircraft type paid the most repair cost?
 SELECT state, aircraft, SUM(cost) AS sum FROM new_birdstrikes WHERE state !='' GROUP BY state, aircraft ORDER BY sum DESC;

-- HAVING, before aggregation you can use where, after aggregation you can use having
-- we like to filter the result of the aggregation, in this case, we want only the result where speed is equal to 50
SELECT AVG(speed) AS avg_speed, state FROM new_birdstrikes GROUP BY state WHERE ROUND(avg_speed)= 50;

SELECT AVG(speed) AS avg_speed, state FROM new_birdstrikes GROUP BY state HAVING ROUND(avg_speed) = 50;

-- you can use where before the group by, and having after group by 
SELECT AVG(speed) AS avg_speed, state FROM new_birdstrikes WHERE state='Idaho' GROUP BY state HAVING ROUND(avg_speed)= 50;

-- Exercise #6 : What the highest AVG speed of the states with names less than 5 characters?
SELECT AVG(speed) AS ave_speed, state FROM new_birdstrikes GROUP BY state HAVING LENGTH(state) < 5 AND state !='' ORDER BY ave_speed DESC;
-- 2862.5000 Iowa
        
        
        
        
        
        
    