
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Community 2: Simpsons
    Step 5.2: Refine the Table Structure
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    What are the names and job titles
    of the Simpsons family members?
*/

USE Simpsons;
GO

-- Remove the table created in Step 5.1
DROP TABLE dbo.t_community_2_family_jobs;
GO

-- Recreate the table with the correct structure
CREATE TABLE dbo.t_community_2_family_jobs
(
    Member_ID MONEY NOT NULL,
    First_Name NVARCHAR(50) NOT NULL,
    Last_Name NVARCHAR(50) NOT NULL,
    Job_Title NVARCHAR(50) NOT NULL,

    CONSTRAINT PK_community_2_family_jobs
        PRIMARY KEY (Member_ID)
);
GO

-- Display the empty table
SELECT *
FROM dbo.t_community_2_family_jobs;
GO
