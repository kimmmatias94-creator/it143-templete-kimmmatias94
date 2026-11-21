
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Community 1: MyFC
    Step 8: Call the Stored Procedure
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    Which players belong to each team?
*/

USE MyFC;
GO

-- Execute the stored procedure
EXEC dbo.usp_load_community_1_players_by_team;
GO

-- Display the final table
SELECT *
FROM dbo.t_community_1_players_by_team
ORDER BY t_code, pl_name;
GO
