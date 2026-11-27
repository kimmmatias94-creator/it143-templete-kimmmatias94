
/*
============================================================
IT 143 - Week 5.2
My Communities Data Sets Question and Answer Script
Community: Simpsons
Student: Mario James Matias
Date: November 27, 2026

Description:
This script answers four questions about the Simpsons
community using SQL Server queries.
============================================================
*/

USE Simpsons;
GO

/*
QUESTION 1:
Which family members have the highest total spending in
each transaction category, based on the Planet_Express table?

Original Author: Michael Otieno
*/

WITH CategorySpending AS
(
    SELECT
        Card_Member,
        Category,
        SUM(Amount) AS Total_Spending
    FROM dbo.Planet_Express
    GROUP BY
        Card_Member,
        Category
),
RankedSpending AS
(
    SELECT
        Card_Member,
        Category,
        Total_Spending,
        RANK() OVER (
            PARTITION BY Category
            ORDER BY Total_Spending DESC
        ) AS Spending_Rank
    FROM CategorySpending
)
SELECT
    Card_Member,
    Category,
    Total_Spending,
    Spending_Rank
FROM RankedSpending
WHERE Spending_Rank = 1
ORDER BY Category;
GO

/*
QUESTION 2:
Can we compare the spending amounts of different family members?

Original Author: Mario James Matias
*/

SELECT
    Card_Member,
    SUM(Amount) AS Total_Spending,
    COUNT(*) AS Total_Transactions,
    AVG(Amount) AS Average_Transaction
FROM dbo.Planet_Express
GROUP BY Card_Member
ORDER BY Total_Spending DESC;
GO

/*
QUESTION 3:
Which spending categories account for the highest expenses?

Original Author: Mario James Matias
*/

SELECT
    Category,
    SUM(Amount) AS Total_Category_Spending,
    COUNT(*) AS Number_of_Transactions,
    AVG(Amount) AS Average_Transaction
FROM dbo.Planet_Express
GROUP BY Category
ORDER BY Total_Category_Spending DESC;
GO

/*
QUESTION 4:
How does family spending change over time?

Original Author: Mario James Matias
*/

SELECT
    YEAR(Date) AS Spending_Year,
    MONTH(Date) AS Spending_Month,
    SUM(Amount) AS Total_Monthly_Spending,
    COUNT(*) AS Number_of_Transactions
FROM dbo.Planet_Express
GROUP BY
    YEAR(Date),
    MONTH(Date)
ORDER BY
    Spending_Year,
    Spending_Month;
GO