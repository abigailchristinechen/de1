use universities;
drop procedure if exists data_warehouse_etl_uni;
Delimiter $$
create procedure data_warehouse_etl_uni()

Begin
Drop table if exists dw_uni_analysis;
create table dw_uni_analysis as 

select
universities_ranking.r_ranking as UniRanking,
universities_ranking.r_title as UniName,
universities_ranking.r_location as UniLocation,
universities_ranking.num_of_students as UniPopulation,
universities_ranking.student_staff_ratio as UniStudentProfRatio,
universities_ranking.intl_students as UniIntlRatio, 
universities_ranking.gender_ratio as UniGenderRatio,

-- universities_scores.ranking as UniRanking,
-- universities_scores.title as UniName,
-- universities_scores.location as UniLocation,
universities_scores.overall_score as ScoreTotal,
universities_scores.teaching_score as ScoreTeaching,
universities_scores.research_score as ScoreResearch,
universities_scores.citations_score as ScoreCitations,
universities_scores.industry_income_score as ScoreIndustry,
universities_scores.intl_outlook_score as ScoreIntl,

-- salaries_region.title as UniName,
-- salaries_region.region as UniLocation,
salaries_region.start_median_salary as SalaryStart,
salaries_region.mid_median_salary as SalaryMid,
salaries_region.mid_10_percentile as SalaryMid10,
salaries_region.mid_25_percentile as SalaryMid25, 
salaries_region.mid_75_percentile as SalaryMid75,
salaries_region.mid_90_percentile as SalaryMid90

from universities_ranking
left join universities_scores on universities_ranking.r_title = universities_scores.s_title
left join salaries_region on universities_ranking.r_title = salaries_region.salary_name
order by r_title;


End $$
Delimiter ;

call data_warehouse_etl_uni();

select * from dw_uni_analysis ORDER BY UniRanking;


-- Data View 1: Summary of all Universities?
drop view if exists v1_uni_summary;
	create view v1_uni_summary as 
    select count(UniName) as 'Number of Uni',
    AVG(UniStudentProfRatio) as Ave_UniStudentProfRatio,
    AVG(UniIntlRatio) as Ave_UniIntlRatio, 
	AVG(UniGenderRatio) as Ave_UniGenderRatio,
    AVG(ScoreTotal) as Ave_ScoreTotal,
    AVG(ScoreTeaching) AS Ave_ScoreTeaching,
    AVG(ScoreResearch) AS Ave_ScoreResearch,
    AVG(ScoreCitations) AS Ave_ScoreCitations,
	AVG(ScoreIndustry) AS Ave_ScoreIndustry,
    AVG(ScoreIntl) AS Ave_ScoreIntl
    FROM dw_uni_analysis as o;
-- This data covers the top 1526 universities globally. :) 


-- Data View 2: Summary of top 1000 universities
drop view if exists v2_uni_top1000;
	create view v2_uni_top1000 as 
    SELECT
    AVG(UniStudentProfRatio) as Ave_UniStudentProfRatio,
    AVG(UniIntlRatio) as Ave_UniIntlRatio, 
	AVG(UniGenderRatio) as Ave_UniGenderRatio,
    AVG(ScoreTotal) as Ave_ScoreTotal,
    AVG(ScoreTeaching) AS Ave_ScoreTeaching,
    AVG(ScoreResearch) AS Ave_ScoreResearch,
    AVG(ScoreCitations) AS Ave_ScoreCitations,
	AVG(ScoreIndustry) AS Ave_ScoreIndustry,
    AVG(ScoreIntl) AS Ave_ScoreIntl
    FROM dw_uni_analysis as o
    WHERE UniRanking <= 1000;
-- This data covers the top 1000 universities globally 

-- Data View 3: Summary of top 100 universities
drop view if exists v3_uni_top100;
	create view v3_uni_top100 as 
    SELECT
    AVG(UniStudentProfRatio) as Ave_UniStudentProfRatio,
    AVG(UniIntlRatio) as Ave_UniIntlRatio, 
	AVG(UniGenderRatio) as Ave_UniGenderRatio,
    AVG(ScoreTotal) as Ave_ScoreTotal,
    AVG(ScoreTeaching) AS Ave_ScoreTeaching,
    AVG(ScoreResearch) AS Ave_ScoreResearch,
    AVG(ScoreCitations) AS Ave_ScoreCitations,
	AVG(ScoreIndustry) AS Ave_ScoreIndustry,
    AVG(ScoreIntl) AS Ave_ScoreIntl
    FROM dw_uni_analysis as o
    WHERE UniRanking <= 100;
-- This data covers the top 100 universities globally 


-- Data View 4: what countries has the most ranked universities
drop view if exists v4_countries;
	create view v4_countries as 
	SELECT
    Unilocation, COUNT(UniLocation) AS Count_Location
    FROM dw_uni_analysis as o
    GROUP BY UniLocation
    ORDER BY Count_Location DESC;
-- This data shows US, Japan, UK, China India as the top 5 countries with the most ranked universities, 
-- Hungary has 9 universities ranked, unfortunately CEU is not one of it :( 


-- Data View 5: what are the average scores of the countries with ranked universitis
drop view if exists v5_countries_w_scores;
create view v5_countries_w_scores as 
	SELECT
    Unilocation, COUNT(UniLocation) AS Count_Location,
    AVG(UniStudentProfRatio) as Ave_UniStudentProfRatio,
    AVG(UniIntlRatio) as Ave_UniIntlRatio, 
	AVG(UniGenderRatio) as Ave_UniGenderRatio,
    AVG(ScoreTotal) as Ave_ScoreTotal,
    AVG(ScoreTeaching) AS Ave_ScoreTeaching,
    AVG(ScoreResearch) AS Ave_ScoreResearch,
    AVG(ScoreCitations) AS Ave_ScoreCitations,
	AVG(ScoreIndustry) AS Ave_ScoreIndustry,
    AVG(ScoreIntl) AS Ave_ScoreIntl
    FROM dw_uni_analysis as o
    GROUP BY UniLocation
    ORDER BY Count_Location DESC;
-- This data view is really useful to see where the various countries scored high in
-- For Student Prof ratio : Japan is the lowest out of the top 5 countries(based on the count of uni per country).
-- For Country Diversity: UK ranks the highest followed by the US, 
-- with UK having almost double the international population of US universities.
-- Japan, China and India are mostly dominated by local students. 

-- Data View 6: what are the top 10 countries based on count of university and what are their details
drop view if exists v6_top10_countries_w_scores;
create view v6_top10_countries_w_scores as  
SELECT
    Unilocation, COUNT(UniLocation) AS Count_Location,
    AVG(UniStudentProfRatio) as Ave_UniStudentProfRatio,
    AVG(UniIntlRatio) as Ave_UniIntlRatio, 
	AVG(UniGenderRatio) as Ave_UniGenderRatio,
    AVG(ScoreTotal) as Ave_ScoreTotal,
    AVG(ScoreTeaching) AS Ave_ScoreTeaching,
    AVG(ScoreResearch) AS Ave_ScoreResearch,
    AVG(ScoreCitations) AS Ave_ScoreCitations,
	AVG(ScoreIndustry) AS Ave_ScoreIndustry,
    AVG(ScoreIntl) AS Ave_ScoreIntl
    FROM dw_uni_analysis as o
    GROUP BY UniLocation
    ORDER BY Count_Location DESC
    LIMIT 10;
-- top 10 countries based on the count of universities    
    
-- Data View 7: what are the average rankings per countriy
drop view if exists v7_AveRanking_country;
create view v7_AveRanking_country as  
SELECT
    Unilocation, COUNT(UniLocation) AS Count_Location,
    AVG(UniRanking) AS Ave_UniRanking
    FROM dw_uni_analysis as o
    GROUP BY UniLocation
    ORDER BY Ave_UniRanking ASC;
-- We can see that Singapore, Netherlands, Hongkong, Switzerland and Belgium have the highest average rank.
-- Note: that Singapore only had two unis in the ranking.

-- Data View 8: top universities in the US
drop view if exists v8_topUS;
create view v8_topUS as  
SELECT
	UniRanking,
	UniName, 
    UniLocation,
	UniPopulation,
	UniStudentProfRatio,
	UniIntlRatio, 
	UniGenderRatio,
    SalaryStart,
    SalaryMid
    FROM dw_uni_analysis as o
	WHERE UniLocation = 'United States'
    ORDER BY UniRanking;
 -- Here we can see the top US universities with details
 -- The salaries data I found was for US universities, and didn't have complete salaries for all the US universities
 -- 8/10 top universities are from the US
 
 -- Data View 9: top universities in the China
drop view if exists v9_topchina;
create view v9_topchina as  
SELECT
	UniRanking,
	UniName, 
    UniLocation,
	UniPopulation,
	UniStudentProfRatio,
	UniIntlRatio, 
	UniGenderRatio
    FROM dw_uni_analysis as o
	WHERE UniLocation = 'China'
    ORDER BY UniRanking;
 
 -- Data View 10: top universities in the japan
drop view if exists v10_topjapan;
create view v10_topjapan as  
SELECT
	UniRanking,
	UniName, 
    UniLocation,
	UniPopulation,
	UniStudentProfRatio,
	UniIntlRatio, 
	UniGenderRatio
    FROM dw_uni_analysis as o
	WHERE UniLocation = 'Japan'
    ORDER BY UniRanking;
 
 -- Data View 10: top universities in the UK
drop view if exists v11_topuk;
create view v11_topuk as  
SELECT
	UniRanking,
	UniName, 
    UniLocation,
	UniPopulation,
	UniStudentProfRatio,
	UniIntlRatio, 
	UniGenderRatio
    FROM dw_uni_analysis as o
	WHERE UniLocation = 'United Kingdom'
    ORDER BY UniRanking;
    
-- Data View 12: which universities have the highest research scores?
drop view if exists v12_topresearch;
create view v12_topresearch as  
SELECT
    UniRanking,
	UniName, 
    UniLocation,
    ScoreResearch
    FROM dw_uni_analysis as o
    ORDER BY ScoreResearch DESC;
-- We can see that the top 1 uni, which is University of Oxford has 100 for it's research score
-- Followed by Harvard University and University of Cambridge with a reserach score of 99.

-- Data View 13: which universities have the highest citations scores?
drop view if exists v13_topcitations;
create view v13_topcitations as  
SELECT
    UniRanking,
	UniName, 
    UniLocation,
    ScoreCitations
    FROM dw_uni_analysis as o
    ORDER BY ScoreCitations DESC, UniRanking;
-- Run this: 
-- SELECT COUNT(UniRanking) FROM dw_uni_analysis WHERE ScoreCitations = 100;
-- We can see here that 21 universities got a perfect score in the citations.

-- Data View 14: which universities have the highest teaching scores?
drop view if exists v14_topteaching;
create view v14_topteaching as  
SELECT
    UniRanking,
	UniName, 
    UniLocation,
    ScoreTeaching
    FROM dw_uni_analysis as o
    ORDER BY ScoreTeaching DESC, UniRanking;
-- 7/10 top teaching unis are from the US
-- 2/10 top teaching unis are from the UK
-- 1/10 Peking University from China is ranked 8th in teaching score, ranking higher than Princeston University 

-- Data View 10: top universities in Hungary
drop view if exists v15_tophungary;
create view v15_tophungary as  
SELECT
	UniRanking,
	UniName, 
    UniLocation,
	UniPopulation,
	UniStudentProfRatio,
	UniIntlRatio, 
	UniGenderRatio
    FROM dw_uni_analysis as o
	WHERE UniLocation = 'Hungary'
    ORDER BY UniRanking;