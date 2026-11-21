
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Step 5.2: Refine the Table Structure
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    What is my Hello World message?
*/

USE EC_IT143_DA;
GO

-- Remove the table created in Step 5.1
DROP TABLE dbo.t_hello_world;
GO

-- Recreate the table with the correct structure
CREATE TABLE dbo.t_hello_world
(
    HelloWorldID INT IDENTITY(1,1) NOT NULL,
    HelloWorldMessage VARCHAR(50) NOT NULL,

    CONSTRAINT PK_t_hello_world
        PRIMARY KEY (HelloWorldID)
);
GO

-- Display the table structure and contents
SELECT *
FROM dbo.t_hello_world;
GO
