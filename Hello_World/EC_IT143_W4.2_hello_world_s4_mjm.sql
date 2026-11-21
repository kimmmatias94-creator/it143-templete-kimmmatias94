
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Step 4: Create a View
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    What is my Hello World message?
*/

USE EC_IT143_DA ;
GO

CREATE OR ALTER VIEW dbo.v_hello_world
AS
SELECT 'Hello World' AS HelloWorldMessage;
GO

-- Display the view's result
SELECT *
FROM dbo.v_hello_world;
GO
