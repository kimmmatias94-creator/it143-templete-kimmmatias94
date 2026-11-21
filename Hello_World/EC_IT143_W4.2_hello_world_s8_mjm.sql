
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Step 8: Call the Stored Procedure
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    What is my Hello World message?
*/

USE EC_IT143_DA;
GO

-- Execute the stored procedure
EXEC dbo.usp_load_hello_world;
GO

-- Display the final table
SELECT *
FROM dbo.t_hello_world;
GO
