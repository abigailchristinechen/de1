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

