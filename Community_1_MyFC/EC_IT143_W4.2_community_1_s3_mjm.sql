
/*
    Assignment: W4.2 T-SQL Data Manipulation
    Community 1: MyFC
    Step 3: Create an Ad Hoc SQL Query
    Author: Mario James Matias
    Date: 2026-11-21

    Question:
    Which players belong to each team?
*/

USE MyFC;
GO

SELECT
    p.pl_id,
    p.pl_name,
    t.t_code
FROM dbo.tblPlayerDim AS p
INNER JOIN dbo.tblTeamDim AS t
    ON p.t_id = t.t_id
ORDER BY t.t_code, p.pl_name;
GO
