
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Community 1: MyFC
    Step 5.2: Refine the Table Structure
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    Which players belong to each team?
*/

USE MyFC;
GO

-- Remove the table created in Step 5.1
DROP TABLE dbo.t_community_1_players_by_team;
GO

-- Recreate the table with the correct structure
CREATE TABLE dbo.t_community_1_players_by_team
(
    pl_id INT NOT NULL,
    pl_name VARCHAR(100) NOT NULL,
    t_code VARCHAR(5) NOT NULL,

    CONSTRAINT PK_community_1_players_by_team
        PRIMARY KEY (pl_id)
);
GO

-- Display the table structure and contents
SELECT *
FROM dbo.t_community_1_players_by_team;
GO
