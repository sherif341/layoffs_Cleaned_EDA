# 🌍 World Layoffs Data Cleaning & Exploratory Data Analysis (SQL)

## 📌 Project Overview

This project demonstrates an end-to-end **Data Analytics workflow** using **MySQL**, covering both **data cleaning** and **exploratory data analysis (EDA)**.

The dataset contains global layoffs from **2020–2023**. The goal was to transform raw, inconsistent data into a clean and reliable dataset, then analyze it to uncover trends across industries, countries, and companies.

---

## 🛠️ Tools & Technologies

- **Database:** MySQL
- **SQL Concepts Used:**
  - Common Table Expressions (CTEs)
  - Window Functions
  - Joins
  - Aggregate Functions
  - String Manipulation
  - Date Functions
  - Data Type Conversion

---

# Part 1 — Data Cleaning

The first phase focused on preparing the dataset for analysis by improving its quality and consistency.

### ✔ Duplicate Removal
- Identified duplicate records using `ROW_NUMBER()`
- Removed duplicates despite the absence of a unique ID

### ✔ Data Standardization
- Trimmed unnecessary whitespace from company names
- Standardized industry names (e.g., different cryptocurrency labels → **Crypto**)
- Fixed inconsistent country names (e.g., `United States.` → `United States`)

### ✔ Date Formatting
- Converted text dates into MySQL `DATE` format using `STR_TO_DATE()`
- Enabled accurate time-based analysis

### ✔ Handling Missing Values
- Filled missing industry values using self-joins when possible
- Removed records missing essential layoff information

---

# Part 2 — Exploratory Data Analysis (EDA)

After cleaning the data, SQL queries were used to answer business questions and identify trends.

## 🔍 Analysis Performed

- Identified the largest single-day layoff event
- Analyzed layoffs by:
  - Industry
  - Country
  - Company
  - Year
  - Month
- Calculated monthly rolling totals to visualize layoff trends over time
- Ranked the **Top 5 companies** with the highest layoffs each year using CTEs and window functions

---

## 📊 Key Insights

- The largest recorded layoff involved **12,000 employees**.
- **Consumer** and **Retail** industries experienced the highest layoffs.
- The **United States** and **India** recorded the largest number of layoffs.
- Layoffs increased significantly during 2022 before gradually declining.
- Yearly rankings highlighted the companies most affected during each period.

---

## 🎯 Skills Demonstrated

- SQL Data Cleaning
- Exploratory Data Analysis (EDA)
- Data Transformation
- Window Functions
- Common Table Expressions (CTEs)
- Ranking & Aggregation
- Data Quality Management
- Business Insight Generation

---

## 📈 Conclusion

This project demonstrates the ability to work with real-world messy datasets, clean and transform data using SQL, and extract meaningful business insights through exploratory analysis.

It reflects a practical workflow commonly used by Data Analysts in real business environments.
