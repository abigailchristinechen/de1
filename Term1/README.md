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
  
    2.  Where It Pays to Attend College from Kaggle 
        - [Salaries Data :] (https://www.kaggle.com/wsj/college-salaries) 
        - Salaries Region data, this dataset contains data for the different universities and colleges in the US.
        - Here, you'll see the entry level, mid level and percentiles of salaries from various universities.
        - You can compare these salaries to the tuition and expenses you are expected to incur and see your estimated payback.
        - You can also do queries on which state to go to for more options
        
    3.  [Both datasets are in a zip folder in this repository. You can download them here:]    (https://github.com/abigailchristinechen/de1/tree/main/Term1/data)
        

2.  Operational Layer 
    1.  The *University Ranking* contains 2 tables which contain the following details
        - Table 1: University Rankings 
        -   Ranking
        -   Title
        -   Location
        -   Number of Students
        -   Student & Staff Ratio 
        -   Percent International Student
        -   Gender Ratio
      
        - Table 2: University Scores
        -   Ranking
        -   Title
        -   Location 
        -   Overall Score
        -   Teaching Score
        -   Research Score
        -   Citations Score
        -   Industry Income Score
        -   International Outlook Score
        
     2. The *Salaries Dataset* contains 3 tables from which I only used the Salaries per region, because the other tables were about the various departments in the universities. Here are the details:
     
        - Table 3: Salaries per Region
        -   School Name
        -   Region
        -   Starting Median Salary
        -   Mid-Career Median Salary
        -   Mid-Career 10th Percentile Salary
        -   Mid-Career 25th Percentile Salary
        -   Mid-Career 75th Percentile Salary
        -   Mid-Career 90th Percentile Salary

     4. 



Food and Goods Deliveries in Brazil dataset contains seven tables which are as following; Channels, Deliveries, Drivers, Hubs, Orders, Payments, Stores which can be found here. This dataset is the records of Food and Goods in Brazil from 2021-01-01 to 2021-04-30 across 396 stores. In order to understand the relationship between tables the below EER diagram further illustrates it. As the EER diagram shows Orders as the central table for this project. Major part of the data comes from this table. Second table is the payments information for the orders. Third table consists of delivery information and as so fourth stores and channel further add information about stores name and channel details. Further information about operational layer can be found here.




<img src="https://media.giphy.com/media/qLHzYjlA2FW8g/giphy.gif" />
