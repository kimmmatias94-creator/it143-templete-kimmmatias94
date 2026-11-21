
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Community 1: MyFC
    Step 6: Load the Table from the View
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    Which players belong to each team?
*/

USE MyFC;
GO

-- Clear existing records
TRUNCATE TABLE dbo.t_community_1_players_by_team;
GO

-- Load the table using the view
INSERT INTO dbo.t_community_1_players_by_team
    (pl_id, pl_name, t_code)
SELECT
    pl_id,
    pl_name,
    t_code
FROM dbo.v_community_1_players_by_team;
GO

-- Display the loaded table
SELECT *
FROM dbo.t_community_1_players_by_team
ORDER BY t_code, pl_name;
GO
