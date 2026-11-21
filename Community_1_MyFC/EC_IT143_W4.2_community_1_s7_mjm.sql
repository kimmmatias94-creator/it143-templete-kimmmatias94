
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Community 1: MyFC
    Step 7: Create a Stored Procedure
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    Which players belong to each team?
*/

USE MyFC;
GO

CREATE OR ALTER PROCEDURE dbo.usp_load_community_1_players_by_team
AS
BEGIN
    SET NOCOUNT ON;

    -- Clear existing records
    TRUNCATE TABLE dbo.t_community_1_players_by_team;

    -- Load the table using the view
    INSERT INTO dbo.t_community_1_players_by_team
        (pl_id, pl_name, t_code)
    SELECT
        pl_id,
        pl_name,
        t_code
    FROM dbo.v_community_1_players_by_team;
END;
GO
