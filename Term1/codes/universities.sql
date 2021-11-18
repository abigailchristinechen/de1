Drop schema if exists universities;
create schema universities;
use universities;


-- Universities Ranking
drop table if exists universities_ranking;
CREATE TABLE universities_ranking(
ranking INTEGER NOT NULL,
title VARCHAR(255) NOT NULL,
location VARCHAR(255) NOT NULL,
num_of_students VARCHAR(255),
student_staff_ratio INTEGER NOT NULL,
intl_students VARCHAR(255), 
gender_ratio VARCHAR(255),
PRIMARY KEY (ranking)
);



-- loading the data 
TRUNCATE universities_ranking;
SHOW VARIABLES LIKE "secure_file_priv";
SET GLOBAL local_infile= 'on';
SHOW VARIABLES LIKE "local_infile";


-- university ranking table
LOAD DATA INFILE '/Users/abigailchristinechen/universities_ranking.csv'
INTO TABLE universities_ranking
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(ranking, title, location, num_of_students, student_staff_ratio, intl_students, gender_ratio);

SELECT * FROM universities_ranking;


-- university scores
drop table if exists universities_scores;
create table universities_scores(
ranking INTEGER NOT NULL,
title VARCHAR(255) NOT NULL,
location VARCHAR(255) NOT NULL,
overall_score VARCHAR(255)NOT NULL,
teaching_score INTEGER NOT NULL,
research_score INTEGER NOT NULL,
citations_score INTEGER NOT NULL,
industry_income_score INTEGER NOT NULL, 
intl_outlook_score INTEGER NOT NULL,
PRIMARY KEY (ranking)
);

TRUNCATE universities_scores;
SHOW VARIABLES LIKE "secure_file_priv";
SET GLOBAL local_infile= 'on';
SHOW VARIABLES LIKE "local_infile";

load data infile '/Users/abigailchristinechen/universities_scores.csv'
into table universities_scores
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(ranking, title, location, overall_score, teaching_score, research_score, 
citations_score, industry_income_score, intl_outlook_score);

SELECT * FROM universities_scores;

-- salaries by region 
drop table if exists salaries_region;
CREATE TABLE salaries_region(
title VARCHAR(255) NOT NULL,
region VARCHAR(255),
start_median_salary VARCHAR(255),
mid_median_salary VARCHAR(255),
mid_10_percentile VARCHAR(255),
mid_25_percentile VARCHAR(255), 
mid_75_percentile VARCHAR(255),
mid_90_percentile VARCHAR(255),
PRIMARY KEY (title)
);

TRUNCATE salaries_region;
show variables like "secure_file_priv";
SET GLOBAL local_infile= 'on';
show variables like "local_infile";

load data infile '/Users/abigailchristinechen/salaries-by-region.csv'
into table salaries_region
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(title, region, start_median_salary, mid_median_salary, mid_10_percentile, mid_25_percentile, mid_75_percentile, mid_90_percentile);

SELECT * FROM salaries_region;
