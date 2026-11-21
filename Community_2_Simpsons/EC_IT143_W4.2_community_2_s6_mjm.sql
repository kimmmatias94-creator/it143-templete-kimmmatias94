
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Community 2: Simpsons
    Step 6: Load the Table from the View
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    What are the names and job titles
    of the Simpsons family members?
*/

USE Simpsons;
GO

-- Clear existing records
TRUNCATE TABLE dbo.t_community_2_family_jobs;
GO

-- Load the table using the view
INSERT INTO dbo.t_community_2_family_jobs
    (Member_ID, First_Name, Last_Name, Job_Title)
SELECT
    Member_ID,
    First_Name,
    Last_Name,
    Job_Title
FROM dbo.v_community_2_family_jobs;
GO

-- Display the loaded table
SELECT *
FROM dbo.t_community_2_family_jobs
ORDER BY Last_Name, First_Name;
GO
