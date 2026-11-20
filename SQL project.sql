SELECT @@SPID AS CurrentSessionID;
KILL 70;
USE master;
GO

CREATE DATABASE project1;
GO
SELECT name, state_desc
FROM sys.databases
WHERE name = 'project1';
USE project1;
GO

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES;

USE project1;
GO

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
USE project1;
GO

SELECT *
FROM dbo.[Bank Customer Churn Prediction];

--1. What is the overall customer churn rate of the bank?

USE project1;
GO

SELECT
    COUNT(*) AS Total_Customers,
    SUM(CAST(churn AS INT)) AS Churned_Customers,
    COUNT(*) - SUM(CAST(churn AS INT)) AS Retained_Customers,

    CAST(
        SUM(CAST(churn AS INT)) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Churn_Percentage

FROM dbo.[Bank Customer Churn Prediction];

--2. Which country has the highest customer churn rate?

    SELECT
    country,
    COUNT(*) AS Total_Customers,
    SUM(CAST(churn AS INT)) AS Churned_Customers,

    CAST(
        SUM(CAST(churn AS INT)) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Churn_Rate

FROM dbo.[Bank Customer Churn Prediction]

GROUP BY country
ORDER BY Churn_Rate DESC;

--3. Which age group is more likely to leave the bank?

SELECT
    CASE
        WHEN age < 25 THEN 'Below 25'
        WHEN age BETWEEN 25 AND 35 THEN '25-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE 'Above 55'
    END AS Age_Group,

    COUNT(*) AS Total_Customers,

    SUM(CAST(churn AS INT)) AS Churned_Customers,

    CAST(
        SUM(CAST(churn AS INT)) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Churn_Rate

FROM dbo.[Bank Customer Churn Prediction]

GROUP BY
    CASE
        WHEN age < 25 THEN 'Below 25'
        WHEN age BETWEEN 25 AND 35 THEN '25-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE 'Above 55'
    END

ORDER BY Churn_Rate DESC;

--4. Are inactive customers more likely to leave the bank?

SELECT
    CASE
        WHEN active_member = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS Customer_Status,

    COUNT(*) AS Total_Customers,

    SUM(CAST(churn AS INT)) AS Churned_Customers,

    CAST(
        SUM(CAST(churn AS INT)) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Churn_Rate

FROM dbo.[Bank Customer Churn Prediction]

GROUP BY active_member
ORDER BY Churn_Rate DESC;

--5. Does the number of banking products affect customer churn?

SELECT
    products_number AS Number_Of_Products,

    COUNT(*) AS Total_Customers,

    SUM(CAST(churn AS INT)) AS Churned_Customers,

    CAST(
        SUM(CAST(churn AS INT)) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Churn_Rate

FROM dbo.[Bank Customer Churn Prediction]

GROUP BY products_number
ORDER BY products_number;

--6. Which gender has a higher customer churn rate?

SELECT
    gender,

    COUNT(*) AS Total_Customers,

    SUM(CAST(churn AS INT)) AS Churned_Customers,

    CAST(
        SUM(CAST(churn AS INT)) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Churn_Rate

FROM dbo.[Bank Customer Churn Prediction]

GROUP BY gender
ORDER BY Churn_Rate DESC;

--7. Are customers with lower credit scores more likely to leave?

SELECT
    CASE
        WHEN credit_score < 500 THEN 'Low'
        WHEN credit_score BETWEEN 500 AND 650 THEN 'Medium'
        WHEN credit_score BETWEEN 651 AND 750 THEN 'Good'
        ELSE 'Excellent'
    END AS Credit_Score_Category,

    COUNT(*) AS Total_Customers,

    SUM(CAST(churn AS INT)) AS Churned_Customers,

    CAST(
        SUM(CAST(churn AS INT)) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Churn_Rate

FROM dbo.[Bank Customer Churn Prediction]

GROUP BY
    CASE
        WHEN credit_score < 500 THEN 'Low'
        WHEN credit_score BETWEEN 500 AND 650 THEN 'Medium'
        WHEN credit_score BETWEEN 651 AND 750 THEN 'Good'
        ELSE 'Excellent'
    END

ORDER BY Churn_Rate DESC;

--8. Are new customers more likely to leave compared to long-term customers?

SELECT
    CASE
        WHEN tenure <= 2 THEN '0-2 Years'
        WHEN tenure BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN tenure BETWEEN 6 AND 8 THEN '6-8 Years'
        ELSE '9-10 Years'
    END AS Customer_Tenure,

    COUNT(*) AS Total_Customers,

    SUM(CAST(churn AS INT)) AS Churned_Customers,

    CAST(
        SUM(CAST(churn AS INT)) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Churn_Rate

FROM dbo.[Bank Customer Churn Prediction]

GROUP BY
    CASE
        WHEN tenure <= 2 THEN '0-2 Years'
        WHEN tenure BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN tenure BETWEEN 6 AND 8 THEN '6-8 Years'
        ELSE '9-10 Years'
    END

ORDER BY Churn_Rate DESC;

-- 9. How much account balance is associated with customers who left the bank?

SELECT
    CASE
        WHEN churn = 1 THEN 'Churned Customers'
        ELSE 'Retained Customers'
    END AS Customer_Category,

    COUNT(*) AS Total_Customers,

    SUM(balance) AS Total_Balance,

    CAST(AVG(balance) AS DECIMAL(18,2))
        AS Average_Balance,

    CAST(AVG(estimated_salary) AS DECIMAL(18,2))
        AS Average_Salary

FROM dbo.[Bank Customer Churn Prediction]

GROUP BY churn;

--10. Who are the high-value customers that the bank has lost?

SELECT
    customer_id,
    country,
    gender,
    age,
    credit_score,
    tenure,
    balance,
    products_number,
    estimated_salary

FROM dbo.[Bank Customer Churn Prediction]

WHERE churn = 1
AND balance >= 100000

ORDER BY balance DESC;


---11.what is the credit_score of each age group?

USE project1;
GO

SELECT
    CASE
        WHEN age < 25 THEN 'Below 25'
        WHEN age BETWEEN 25 AND 35 THEN '25-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE 'Above 55'
    END AS Age_Group,

    COUNT(*) AS Total_Customers,

    CAST(AVG(CAST(credit_score AS DECIMAL(10,2)))
         AS DECIMAL(10,2)) AS Average_Credit_Score

FROM dbo.[Bank Customer Churn Prediction]

GROUP BY
    CASE
        WHEN age < 25 THEN 'Below 25'
        WHEN age BETWEEN 25 AND 35 THEN '25-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE 'Above 55'
    END

ORDER BY Average_Credit_Score DESC;



USE master;
GO

SELECT
    l.request_session_id AS SessionID,
    s.login_name AS LoginName,
    s.host_name AS HostName,
    s.program_name AS ProgramName,
    s.status AS SessionStatus,
    l.resource_type AS ResourceType,
    l.request_mode AS LockMode,
    l.request_status AS LockStatus,
    r.command AS CurrentCommand
FROM sys.dm_tran_locks l
LEFT JOIN sys.dm_exec_sessions s
    ON l.request_session_id = s.session_id
LEFT JOIN sys.dm_exec_requests r
    ON l.request_session_id = r.session_id
WHERE l.resource_database_id = DB_ID('model');


SELECT name, state_desc
FROM sys.databases
WHERE name IN ('model', 'project1');

SELECT
    session_id,
    status,
    open_transaction_count,
    last_request_end_time,
    host_name,
    program_name
FROM sys.dm_exec_sessions
WHERE session_id = 70;

SELECT *
FROM sys.dm_tran_session_transactions
WHERE session_id = 70;