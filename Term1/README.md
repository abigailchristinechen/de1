[Data Engineering 1] [MySQL]
**<h2>Term Project 1</h2>**
*<h5>FOR MS BA 2022</h5>*


This repository contains the detailed description of my project submission for Data Engineering 1. I used University Ranking dataset and Salaries by Region dataset from Kaggle.  You'll find more details below. Enjoy :)


Table of Contents
Data Sources
Operational Layer
Analytics
Analytics Layer
Data Marts
Events


1. Data Sources
    1.  University Ranking from Kaggle 
        - [University Ranking Data :] (https://www.kaggle.com/mylesoneill/world-university-rankings) 
        - The first dataset is about the different universities in the world. 
        - Here's we'll see the various aspects of university rankings eg. citations, culture diversity, gender balance.
        - With these parameters, we can see which universities are comparable to each other. 
        - If you're also planning to study abroad, this will give you a glimpse of which country & top diverse uni to go to. 
        - How does your university compare globally?

            <img src="https://media.giphy.com/media/qLHzYjlA2FW8g/giphy.gif" />
  
    2.  Where It Pays to Attend College from Kaggle 
        - [Salaries Data :] (https://www.kaggle.com/wsj/college-salaries) 
        - Salaries Region data, this dataset contains data for the different universities and colleges in the US.
        - Here, you'll see the entry level, mid level and percentiles of salaries from various universities.
        - You can compare these salaries to the tuition and expenses you are expected to incur and see your estimated payback.
        - You can also do queries on which state to go to for more options
        
    3.  [Both datasets are in a zip folder in this repository. You can download them here:]    (https://github.com/abigailchristinechen/de1/tree/main/Term1/data)
        

2.  Operational Layer 
    
    1.  The *University Ranking* contains 2 tables which contain the following details

       <img src= "https://github.com/abigailchristinechen/de1/blob/main/Term1/Table%201.png" width="250" height="120"/>
       
       <img src= "https://github.com/abigailchristinechen/de1/blob/main/Term1/Table%202.png" width="250" height="140"/>
        
        
     2. The *Salaries Dataset* contains 3 tables from which I only used the Salaries per region, because the other tables were about the various departments in the universities. Here are the details:
    
        <img src= "https://github.com/abigailchristinechen/de1/blob/main/Term1/Table%203.png" width="250" height="140"/>
       
    Here's the EER diagram for the relationship: 
    
       <img src= "https://github.com/abigailchristinechen/de1/blob/main/Term1/EER%20Diagram.png" width="700" height="300"/>

3.  Analytics
     - For this project, and for reproducibility here is a quick summary on the steps
        - Loading the tables
        - Creating a data warehouse called dw_uni_analysis
        - Creating data marts to achieve 15 quick views
       <img src= "https://github.com/abigailchristinechen/de1/blob/main/Term1/Analytics%20Plan.png" width="600" height="300"/>

4. Analytics Layer
     - The data warehouse consists of 3 dimensions: Rankings, Scores and Salaries. 
       <img src= "https://github.com/abigailchristinechen/de1/blob/main/Term1/data_warehouse_etl_uni.png" width="1000" height="200"/>
       
5. Data Marts

Data View 1: Summary of all Universities?
-- This data covers the top 1526 universities globally. :) 


Data View 2: Summary of top 1000 universities
-- This data covers the top 1000 universities globally 

Data View 3: Summary of top 100 universities
-- This data covers the top 100 universities globally 


Data View 4: what countries has the most ranked universities
-- This data shows US, Japan, UK, China India as the top 5 countries with the most ranked universities, 
-- Hungary has 9 universities ranked, unfortunately CEU is not one of it :( 


Data View 5: what are the average scores of the countries with ranked universitis
-- This data view is really useful to see where the various countries scored high in
-- For Student Prof ratio : Japan is the lowest out of the top 5 countries(based on the count of uni per country).
-- For Country Diversity: UK ranks the highest followed by the US, 
-- with UK having almost double the international population of US universities.
-- Japan, China and India are mostly dominated by local students. 

Data View 6: what are the top 10 countries based on count of university and what are their details
-- top 10 countries based on the count of universities    
    
Data View 7: what are the average rankings per countriy
-- We can see that Singapore, Netherlands, Hongkong, Switzerland and Belgium have the highest average rank.
-- Note: that Singapore only had two unis in the ranking.

Data View 8: top universities in the US
 -- Here we can see the top US universities with details
 -- The salaries data I found was for US universities, and didn't have complete salaries for all the US universities
 -- 8/10 top universities are from the US
 
Data View 9: top universities in China
 
Data View 10: top universities in Japan


Data View 11: top universities in the UK

    
Data View 12: which universities have the highest research scores?
-- We can see that the top 1 uni, which is University of Oxford has 100 for it's research score
-- Followed by Harvard University and University of Cambridge with a reserach score of 99.

Data View 13: which universities have the highest citations scores?
-- We can see here that 21 universities got a perfect score in the citations.

Data View 14: which universities have the highest teaching scores?
-- 7/10 top teaching unis are from the US
-- 2/10 top teaching unis are from the UK
-- 1/10 Peking University from China is ranked 8th in teaching score, ranking higher than Princeston University 

Data View 15: top universities in Hungary
-- can't forget to check Hungary too ;)
