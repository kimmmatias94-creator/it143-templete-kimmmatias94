
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Community 2: Simpsons
    Step 5.1: Create a Table from the View
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    What are the names and job titles
    of the Simpsons family members?
*/

USE Simpsons;
GO

-- Remove the old table if it already exists
IF OBJECT_ID('dbo.t_community_2_family_jobs', 'U') IS NOT NULL
    DROP TABLE dbo.t_community_2_family_jobs;
GO

-- Create a table from the view
SELECT
    First_Name,
    Last_Name,
    Job_Title
INTO dbo.t_community_2_family_jobs
FROM dbo.v_community_2_family_jobs;
GO

-- Display the new table
SELECT *
FROM dbo.t_community_2_family_jobs
ORDER BY Last_Name, First_Name;
GO
