# Bank_Customer_Churn_Analysis
End-to-end Bank Customer Churn Analysis using Python, SQL Server, and Power BI to identify churn patterns, customer segments, and financial impact.
# 🏦 Bank Customer Churn Analysis | Python, SQL Server & Power BI

## 📌 Project Overview

The **Bank Customer Churn Analysis** project focuses on analyzing customer behavior, identifying factors contributing to customer attrition, and understanding the financial impact of customers leaving a bank.

This project integrates **Python, Microsoft SQL Server, and Power BI** to perform data preprocessing, SQL-based business analysis, and interactive data visualization. It transforms raw banking customer data into meaningful insights that can help financial institutions understand customer retention patterns and identify high-value lost customers.

## 🎯 Project Objectives

- Analyze the overall customer churn rate and customer retention rate.
- Identify countries with higher customer churn.
- Understand churn patterns across different age groups and genders.
- Analyze the relationship between credit scores and customer churn.
- Evaluate how banking product usage influences customer retention.
- Compare active and inactive customer churn behavior.
- Examine customer tenure and its relationship with churn.
- Identify high-value customers lost by the bank.
- Analyze the financial impact of churn through customer account balances.

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Python | Data preprocessing and transformation |
| Pandas | Data manipulation and analysis |
| Jupyter Notebook | Python development environment |
| Microsoft SQL Server | Database creation and business queries |
| SQL | Customer segmentation and churn analysis |
| Power BI | Interactive dashboards and visualization |

## 📂 Project Workflow

### 1. Python – Data Preprocessing
- Imported the banking customer dataset using Pandas.
- Explored dataset structure using `head()`, `info()`, and `describe()`.
- Checked missing values.
- Standardized column names.
- Created age-group categories using quartile-based grouping.
- Created credit card status categories using mapping.
- Prepared the dataset for further analysis.

### 2. SQL Server – Business Analysis
Created a SQL Server database named `project1` and performed business analysis using SQL queries.

Key SQL concepts implemented:
- Database and table exploration.
- Aggregate functions (`COUNT`, `SUM`, `AVG`).
- Conditional statements (`CASE WHEN`).
- Data grouping using `GROUP BY`.
- Sorting using `ORDER BY`.
- Data type conversion using `CAST`.
- Filtering using `WHERE`.
- Customer segmentation and financial analysis.

**Business Questions Answered:**
1. What is the overall customer churn rate?
2. Which country has the highest customer churn rate?
3. Which age group is more likely to leave the bank?
4. Are inactive customers more likely to leave?
5. Does the number of banking products affect churn?
6. Which gender has a higher churn rate?
7. Are customers with lower credit scores more likely to leave?
8. Are new customers more likely to leave compared to long-term customers?
9. How much account balance is associated with churned customers?
10. Who are the high-value customers lost by the bank?
11. What is the average credit score of each age group?

### 3. Power BI – Interactive Dashboard

Developed a multi-page Power BI dashboard to present customer churn insights and financial analysis.

**Dashboard 1 – Customer Insights**
- Total Customers
- Churned Customers
- Retention Rate
- Churn Rate
- Country-wise customer analysis
- Age-group churn analysis
- Gender-wise churn analysis
- Active vs. inactive customer analysis
- Churn by number of banking products

**Dashboard 2 – Customer Segmentation**
- Customer distribution by age group
- Churn analysis by banking products
- Credit score group analysis
- Customer segment analysis
- Lost customer balance

**Dashboard 3 – Financial Impact Analysis**
- Churned Customer Balance
- Retained Customer Balance
- Total Customer Balance
- Average Customer Balance
- Balance analysis by tenure
- Country-wise churned balance
- Balance comparison by churn status
- Financial impact by customer segment

## 💡 Key Business Insights

The project is designed to help identify:
- Customer groups with higher churn rates.
- Differences in retention patterns across countries and demographics.
- The relationship between customer activity, tenure, credit scores, and banking products.
- Financial exposure associated with lost customers.
- High-value customers who may require targeted retention strategies.

## 📈 Skills Demonstrated

- Data Cleaning and Preprocessing
- Exploratory Data Analysis (EDA)
- SQL Query Writing
- Business Requirement Analysis
- Customer Segmentation
- KPI Development
- Financial Data Analysis
- Dashboard Development
- Data Visualization
- Business Intelligence

## 📁 Project Files

| File | Description |
|---|---|
| `churn project.pbix` | Interactive Power BI dashboard |
| `SQL project.sql` | SQL Server database scripts and business analysis queries |
| `Untitled.ipynb` | Python data preprocessing and SQL Server connection notebook |

## 🚀 Conclusion

This project demonstrates an end-to-end data analytics workflow by combining Python, SQL Server, and Power BI. It converts banking customer data into actionable business insights, helping understand customer churn patterns, evaluate financial impact, and support data-driven customer retention decisions.

**Tools:** Python | Pandas | Jupyter Notebook | Microsoft SQL Server | SQL | Power BI

**Project Domain:** Banking Analytics | Customer Churn Analysis | Business Intelligence | Data Analytics
