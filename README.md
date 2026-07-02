World Layoffs: Data Cleaning and Exploratory Data Analysis (SQL)
Project Overview
This project involves a comprehensive data cleaning and exploratory analysis of a global layoffs dataset using MySQL. The goal was to take raw, "dirty" data and transform it into a "gold" standard format for analysis to uncover meaningful insights into the economic impact of layoffs across various companies, industries, and countries
.
Tools Used
Database: MySQL
Skills: Data Standardization, Duplicate Removal, Join Logic, CTEs (Common Table Expressions), Window Functions
.
Part 1: Data Cleaning
The initial dataset was imported into a "Bronze" or raw table. To protect the integrity of the original data, a staging table was created for all subsequent cleaning steps
.
Cleaning Steps:
Duplicate Removal: Since the data lacked a unique primary key, I used a ROW_NUMBER() window function partitioned across all columns to identify and delete duplicate records
.
Standardization:
Trimming: Removed unnecessary whitespace from company names
.
Industry Alignment: Standardized inconsistent labels, such as merging various spellings of "cryptocurrency" into a single "Crypto" category
.
Geographic Fixes: Cleaned country names (e.g., removing trailing periods from "United States.")
.
Date Conversion: Converted the date column from a text string into a proper DATE data type to enable time-series analysis
.
Handling Null & Blank Values: Used self-joins to populate missing industry values where the data existed in other rows for the same company
.
Data Pruning: Removed rows that lacked both total layoffs and percentage layoff figures, as these were not useful for the intended analysis
.
Part 2: Exploratory Data Analysis (EDA)
With the data cleaned, I explored the dataset to identify patterns and significant outliers
.
Key Insights:
Peak Layoffs: Identified the highest single-day layoff (12,000 people) and highlighted companies that went completely under (100% layoff)
.
Industry Impact: Found that the Consumer and Retail sectors were hit hardest during the COVID-19 pandemic period
.
Geographic Concentration: Analysis showed the United States and India suffered the highest volumes of layoffs
.
Temporal Trends: Created Rolling Totals of layoffs by month to visualize the progression of layoffs over three years
.
Company Rankings: Utilized multiple CTEs to rank the top 5 companies with the most layoffs for each individual year (2020–2023)
.
Conclusion
This project demonstrates a professional data analyst workflow: transitioning from raw, unusable data to complex SQL insights that provide clear business value
