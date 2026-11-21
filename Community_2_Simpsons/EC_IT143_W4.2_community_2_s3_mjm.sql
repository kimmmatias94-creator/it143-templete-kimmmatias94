
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Community 2: Simpsons
    Step 3: Create an Ad Hoc SQL Query
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    What are the names and job titles
    of the Simpsons family members?
*/

USE Simpsons;
GO

SELECT
    First_Name,
    Last_Name,
    Job_Title
FROM dbo.Family_Data
ORDER BY Last_Name, First_Name;
GO
