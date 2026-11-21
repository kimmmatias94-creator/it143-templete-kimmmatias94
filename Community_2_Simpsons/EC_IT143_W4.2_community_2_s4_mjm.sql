
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Community 2: Simpsons
    Step 4: Create a View
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    What are the names and job titles
    of the Simpsons family members?
*/

USE Simpsons;
GO

CREATE OR ALTER VIEW dbo.v_community_2_family_jobs
AS
SELECT
    First_Name,
    Last_Name,
    Job_Title
FROM dbo.Family_Data;
GO

-- Display the view
SELECT *
FROM dbo.v_community_2_family_jobs
ORDER BY Last_Name, First_Name;
GO
