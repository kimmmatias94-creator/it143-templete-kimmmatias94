
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Community 1: MyFC
    Step 5.1: Create a Table from the View
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    Which players belong to each team?
*/

USE MyFC;
GO

-- Remove the old table if it already exists
IF OBJECT_ID('dbo.t_community_1_players_by_team', 'U') IS NOT NULL
    DROP TABLE dbo.t_community_1_players_by_team;
GO

-- Create a table from the view
SELECT
    pl_id,
    pl_name,
    t_code
INTO dbo.t_community_1_players_by_team
FROM dbo.v_community_1_players_by_team;
GO

-- Display the new table
SELECT *
FROM dbo.t_community_1_players_by_team
ORDER BY t_code, pl_name;
GO
