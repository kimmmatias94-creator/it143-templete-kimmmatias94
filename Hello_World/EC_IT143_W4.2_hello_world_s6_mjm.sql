
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Step 6: Load the Table from the View
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    What is my Hello World message?
*/

USE EC_IT143_DA;
GO

-- Clear existing records
TRUNCATE TABLE dbo.t_hello_world;
GO

-- Load the table using the view
INSERT INTO dbo.t_hello_world (HelloWorldMessage)
SELECT HelloWorldMessage
FROM dbo.v_hello_world;
GO

-- Display the loaded table
SELECT *
FROM dbo.t_hello_world;
GO
