
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Step 7: Create a Stored Procedure
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    What is my Hello World message?
*/

USE EC_IT143_DA;
GO

CREATE OR ALTER PROCEDURE dbo.usp_load_hello_world
AS
BEGIN
    SET NOCOUNT ON;

    -- Clear existing records
    TRUNCATE TABLE dbo.t_hello_world;

    -- Load the table using the view
    INSERT INTO dbo.t_hello_world (HelloWorldMessage)
    SELECT HelloWorldMessage
    FROM dbo.v_hello_world;
END;
GO
