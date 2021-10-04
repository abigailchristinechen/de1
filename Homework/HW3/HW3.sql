
-- HW #3 

-- Exercise #1 : Do the same with speed. If speed is NULL or speed < 100 create a “LOW SPEED” category, otherwise, mark as “HIGH SPEED”. 
-- Use IF instead of CASE!

SELECT aircraft, airline, speed,
		IF (speed IS NULL OR speed < 100, 'LOW SPEED', 'HIGH SPEED')
		AS speed_category  
        FROM  new_birdstrikes
        ORDER BY speed_category;
        
        
-- Exercise #2 : How many distinct ‘aircraft’ we have in the database?
SELECT COUNT(DISTINCT aircraft) FROM  new_birdstrikes;
-- 3


-- Exercise #3 : What was the lowest speed of aircrafts starting with ‘H’?
SELECT MIN(speed) AS lowest_speed FROM new_birdstrikes WHERE aircraft LIKE 'H%';
-- 9


-- Exercise #4 : Which phase_of_flight has the least of incidents?
SELECT phase_of_flight, COUNT(damage) AS damage_total FROM new_birdstrikes GROUP BY phase_of_flight ORDER BY damage_total ASC;
-- taxi 
-- include WHERE damage ='caused damage'for the ones with damages
  

-- Exercise #5 : What is the rounded highest average cost by phase_of_flight?
SELECT phase_of_flight, ROUND(AVG(cost)) AS ave_cost FROM new_birdstrikes GROUP BY phase_of_flight ORDER BY (ave_cost) DESC;
-- Climb 54,673


-- Exercise #6 : What the highest AVG speed of the states with names less than 5 characters?
SELECT AVG(speed)AS ave_speed, state FROM new_birdstrikes GROUP BY state HAVING LENGTH(state) < 5 AND state !='' ORDER BY ave_speed DESC;
-- 2862.5000 Iowa






