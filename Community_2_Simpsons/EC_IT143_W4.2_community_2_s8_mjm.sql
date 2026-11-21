
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Community 2: Simpsons
    Step 8: Call the Stored Procedure
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    What are the names and job titles
    of the Simpsons family members?
*/

USE Simpsons;
GO

-- Execute the stored procedure
EXEC dbo.usp_load_community_2_family_jobs;
GO

-- Display the final table
SELECT *
FROM dbo.t_community_2_family_jobs
ORDER BY Last_Name, First_Name;
GO
