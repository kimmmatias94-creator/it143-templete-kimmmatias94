
/*
============================================================
IT 143 - Week 5.2
My Communities Data Sets Question and Answer Script
Community: MyFC
Student: Mario James Matias
Date: November 27, 2026

Description:
This script answers four questions about the MyFC soccer
community using SQL Server queries.
============================================================
*/

USE MyFC;
GO

/*
QUESTION 1:
Which position has the most players assigned, and how does
each position's player count compare to its p_target?

Original Author: Nkazimulo Mishel Ndlovu
*/

SELECT
    pos.p_name AS Position,
    pos.p_target AS Target_Players,
    COUNT(pl.pl_id) AS Actual_Players,
    COUNT(pl.pl_id) - pos.p_target AS Difference
FROM dbo.tblPositionDim AS pos
LEFT JOIN dbo.tblPlayerDim AS pl
    ON pos.p_id = pl.p_id
GROUP BY
    pos.p_id,
    pos.p_name,
    pos.p_target
ORDER BY Actual_Players DESC;
GO

/*
QUESTION 2:
Which team has the highest total monthly player salary,
and which players contribute the most to that team's salary?

Original Author: Mario James Matias
*/

WITH LatestDate AS
(
    SELECT MAX(as_of_date) AS Latest_Date
    FROM dbo.tblPlayerFact
),
PlayerSalaries AS
(
    SELECT
        t.t_code AS Team,
        pl.pl_name AS Player,
        pf.mtd_salary AS Monthly_Salary,
        SUM(pf.mtd_salary) OVER (
            PARTITION BY t.t_id
        ) AS Team_Total_Salary
    FROM dbo.tblPlayerFact AS pf
    INNER JOIN dbo.tblPlayerDim AS pl
        ON pf.pl_id = pl.pl_id
    INNER JOIN dbo.tblTeamDim AS t
        ON pl.t_id = t.t_id
    CROSS JOIN LatestDate AS ld
    WHERE pf.as_of_date = ld.Latest_Date
)
SELECT
    Team,
    Player,
    Monthly_Salary,
    Team_Total_Salary
FROM PlayerSalaries
ORDER BY
    Team_Total_Salary DESC,
    Monthly_Salary DESC;
GO

/*
QUESTION 3:
Which player positions have the highest average monthly salaries?

Original Author: Mario James Matias
*/

WITH LatestDate AS
(
    SELECT MAX(as_of_date) AS Latest_Date
    FROM dbo.tblPlayerFact
)
SELECT
    pos.p_name AS Position,
    COUNT(pl.pl_id) AS Number_of_Players,
    AVG(CAST(pf.mtd_salary AS DECIMAL(18,2))) AS Average_Monthly_Salary
FROM dbo.tblPlayerFact AS pf
INNER JOIN dbo.tblPlayerDim AS pl
    ON pf.pl_id = pl.pl_id
INNER JOIN dbo.tblPositionDim AS pos
    ON pl.p_id = pos.p_id
CROSS JOIN LatestDate AS ld
WHERE pf.as_of_date = ld.Latest_Date
GROUP BY
    pos.p_id,
    pos.p_name
ORDER BY Average_Monthly_Salary DESC;
GO

/*
QUESTION 4:
How many players are assigned to each team?

Original Author: Mario James Matias
*/

SELECT
    t.t_code AS Team,
    COUNT(pl.pl_id) AS Total_Players
FROM dbo.tblTeamDim AS t
LEFT JOIN dbo.tblPlayerDim AS pl
    ON t.t_id = pl.t_id
GROUP BY
    t.t_id,
    t.t_code
ORDER BY Total_Players DESC;
GO