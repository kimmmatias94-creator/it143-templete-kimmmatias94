
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Community 1: MyFC
    Step 4: Create a View
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    Which players belong to each team?
*/

USE MyFC;
GO

CREATE OR ALTER VIEW dbo.v_community_1_players_by_team
AS
SELECT
    p.pl_id,
    p.pl_name,
    t.t_code
FROM dbo.tblPlayerDim AS p
INNER JOIN dbo.tblTeamDim AS t
    ON p.t_id = t.t_id;
GO

-- Display the view
SELECT *
FROM dbo.v_community_1_players_by_team
ORDER BY t_code, pl_name;
GO
