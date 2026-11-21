
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Step 5.1: Create a Table from the View
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    What is my Hello World message?
*/

USE EC_IT143_DA;
GO

-- Remove the old table if it already exists
IF OBJECT_ID('dbo.t_hello_world', 'U') IS NOT NULL
    DROP TABLE dbo.t_hello_world;
GO

-- Create a table using the view
SELECT HelloWorldMessage
INTO dbo.t_hello_world
FROM dbo.v_hello_world;
GO

-- Display the new table
SELECT *
FROM dbo.t_hello_world;
GO
