# 📊Netflix Data Analysis using SQL

## Project Overview
This project focuses on analyzing Netflix content data using SQL to extract meaningful insights related to content distribution, audience targeting, and growth trends.

The objective is to demonstrate strong SQL fundamentals along with advanced analytical techniques used in real-world data analysis.

---

## Dataset
- Dataset: Netflix Titles Dataset (CSV format)
- Total Records: ~100
- Key Features:
  - Title
  - Type (Movie / TV Show)
  - Country
  - Release Year
  - Rating
  - Duration
  - Genre

## Problem Statements.

### Content Distribution.
- What is the distribution of Movies vs TV Shows?
- Which countries contribute the most content?

### Trend Analysis
- How has Netflix content grown over the years?
- What are the patterns in content expansion?

### Audience Analysis
- What type of audience is Netflix targeting based on ratings?

### Advanced Analysis
- What is the percentage contribution of each country?
- How does year-over-year growth change over time?
- How can content be segmented into strategic eras?

## SQL Concepts Used

-  SELECT, WHERE, ORDER BY  
-  GROUP BY & HAVING  
-  CASE Statements  
-  Common Table Expressions (CTE)  
-  Window Functions (LAG, SUM OVER)  
-  UNION / UNION ALL  
-  LEFT JOIN / RIGHT JOIN  
-  Subqueries  
-  Data Cleaning Techniques  

---

##  Sample Query Outputs

### Movies vs TV Shows
![Movies vs TV Shows](images/movies_vs_tv.png)

### Top Countries by Contribution
![Top Countries](images/top_countries.png)

### Content Growth Over Years
![Growth Trend](images/growth_trend.png)

### Growth Rate Analysis (Window Function)
![Growth Rate](images/growth_rate.png)

### Audience Segmentation
![Audience Segmentation](images/audience_segmentation.png)

---

## Key Insights

- Movies dominate the Netflix catalog compared to TV Shows.
- Content production is highly concentrated among a few countries.
- Most content is targeted towards mature audiences (TV-MA, TV-14).
- Significant growth in content production is observed after 2015.
- Growth trends indicate a rapid expansion phase in recent years

## Approach

- Imported raw CSV dataset into MySQL
- Cleaned data by handling NULL values and inconsistent country entries
- Performed aggregation and grouping analysis
- Applied advanced SQL techniques (CTE, window functions, CASE)
- Derived meaningful insights from structured queries

## Challenges Faced

- Importing CSV data correctly into MySQL Workbench
- Handling multi-country values in a single column
- Managing NULL values in important fields like country and director

## 🚀 Future Improvements

- Normalize dataset into multiple relational tables
- Build interactive dashboards using Power BI
- Perform deeper genre-based and duration-based analysis

## Project Structure

Netflix-SQL-Project/
│
├── dataset/
│   └── netflix_titles.csv
│
├── queries/
│   └── analysis.sql
│
├── images/
│   └── (query screenshots)
│
└── README.md

---

## Conclusion.

This project demonstrates how SQL can be effectively used for real-world data analysis by transforming raw data into actionable insights using structured and advanced querying techniques.

 Author
- Tanushree  Janbandhu.
