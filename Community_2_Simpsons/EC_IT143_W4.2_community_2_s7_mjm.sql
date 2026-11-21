
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Community 2: Simpsons
    Step 7: Create a Stored Procedure
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    What are the names and job titles
    of the Simpsons family members?
*/

USE Simpsons;
GO

CREATE OR ALTER PROCEDURE dbo.usp_load_community_2_family_jobs
AS
BEGIN
    SET NOCOUNT ON;

    -- Clear existing records
    TRUNCATE TABLE dbo.t_community_2_family_jobs;

    -- Load the table using the view
    INSERT INTO dbo.t_community_2_family_jobs
        (Member_ID, First_Name, Last_Name, Job_Title)
    SELECT
        Member_ID,
        First_Name,
        Last_Name,
        Job_Title
    FROM dbo.v_community_2_family_jobs;
END;
GO
