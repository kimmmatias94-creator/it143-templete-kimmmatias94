
/*
============================================================
BYU PATHWAY - IT 143
W3.4 ADVENTUREWORKS - CREATE ANSWERS

Student Name: Mario James Matias
Course: IT 143
Assignment: W3.4 AdventureWorks - Create Answers
Database: AdventureWorks2022

Estimated Runtime: Less than 1 minute

Description:
This script answers eight business and metadata questions
using the AdventureWorks2022 database.
============================================================
*/

USE AdventureWorks2022;
GO


/*
============================================================
QUESTION 1 - BUSINESS USER: MARGINAL COMPLEXITY

Question:
What ten products have the highest list prices?

Original Author: My Own Question
============================================================
*/

SELECT TOP 10
    ProductID,
    Name AS ProductName,
    ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;
GO


/*
============================================================
QUESTION 2 - BUSINESS USER: MARGINAL COMPLEXITY

Question:
What is the average standard cost of all products?

Original Author: My Own Question
============================================================
*/

SELECT
    AVG(StandardCost) AS AverageStandardCost
FROM Production.Product;
GO


/*
============================================================
QUESTION 3 - BUSINESS USER: MODERATE COMPLEXITY

Question:
Which employees hold the most frequently occurring job titles,
including ties? Show their names and hourly rates from each
employee's most recent recorded pay change.

Original Author: Aidan Young
============================================================
*/

WITH JobTitleCounts AS
(
    SELECT
        JobTitle,
        COUNT(*) AS EmployeeCount
    FROM HumanResources.Employee
    GROUP BY JobTitle
),
MostFrequentJobTitles AS
(
    SELECT JobTitle
    FROM JobTitleCounts
    WHERE EmployeeCount =
    (
        SELECT MAX(EmployeeCount)
        FROM JobTitleCounts
    )
),
LatestPay AS
(
    SELECT
        BusinessEntityID,
        Rate,
        RateChangeDate,
        ROW_NUMBER() OVER
        (
            PARTITION BY BusinessEntityID
            ORDER BY RateChangeDate DESC
        ) AS RowNum
    FROM HumanResources.EmployeePayHistory
)
SELECT
    e.JobTitle,
    p.FirstName,
    p.LastName,
    lp.Rate AS LatestHourlyRate,
    lp.RateChangeDate
FROM HumanResources.Employee AS e
INNER JOIN MostFrequentJobTitles AS m
    ON e.JobTitle = m.JobTitle
INNER JOIN Person.Person AS p
    ON e.BusinessEntityID = p.BusinessEntityID
INNER JOIN LatestPay AS lp
    ON e.BusinessEntityID = lp.BusinessEntityID
WHERE lp.RowNum = 1
ORDER BY e.JobTitle, p.LastName, p.FirstName;
GO


/*
============================================================
QUESTION 4 - BUSINESS USER: MODERATE COMPLEXITY

Question:
Which three road bikes generate the least net revenue per
unit sold? Net revenue is defined as list price less
standard cost.

Original Author: Nkazimulo Mishel Ndlovu
============================================================
*/

SELECT TOP 3
    p.ProductID,
    p.Name AS ProductName,
    p.ListPrice,
    p.StandardCost,
    (p.ListPrice - p.StandardCost) AS NetRevenuePerUnit
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE ps.Name = 'Road Bikes'
ORDER BY NetRevenuePerUnit ASC, p.Name;
GO


/*
============================================================
QUESTION 5 - BUSINESS USER: INCREASED COMPLEXITY

Question:
Based solely on internet sales from 2013, which are the top
ten customers by revenue in Europe? List their full names,
country region name, number of orders, and total sum of
subtotals.

Original Author: Wisdom Adams
============================================================
*/

SELECT TOP 10
    CONCAT(
        p.FirstName, ' ',
        COALESCE(p.MiddleName + ' ', ''),
        p.LastName
    ) AS CustomerFullName,
    cr.Name AS CountryRegionName,
    COUNT(DISTINCT soh.SalesOrderID) AS NumberOfOrders,
    SUM(soh.SubTotal) AS TotalSalesSubtotals
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.Customer AS c
    ON soh.CustomerID = c.CustomerID
INNER JOIN Person.Person AS p
    ON c.PersonID = p.BusinessEntityID
INNER JOIN Sales.SalesTerritory AS st
    ON soh.TerritoryID = st.TerritoryID
INNER JOIN Person.CountryRegion AS cr
    ON st.CountryRegionCode = cr.CountryRegionCode
WHERE
    soh.OnlineOrderFlag = 1
    AND soh.OrderDate >= '2013-01-01'
    AND soh.OrderDate < '2014-01-01'
    AND st.[Group] = 'Europe'
GROUP BY
    p.FirstName,
    p.MiddleName,
    p.LastName,
    cr.Name
ORDER BY TotalSalesSubtotals DESC;
GO


/*
============================================================
QUESTION 6 - BUSINESS USER: INCREASED COMPLEXITY

Question:
What did mountain bike orders look like by frame color
during Q3 2011? Show the information by order month.

Original Author: Mukena Mande Alain
============================================================
*/

SELECT
    DATEFROMPARTS(
        YEAR(soh.OrderDate),
        MONTH(soh.OrderDate),
        1
    ) AS OrderMonth,
    COALESCE(p.Color, 'Unspecified') AS FrameColor,
    SUM(sod.OrderQty) AS TotalQuantitySold,
    COUNT(DISTINCT soh.SalesOrderID) AS NumberOfOrders,
    SUM(sod.LineTotal) AS TotalSales
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE
    ps.Name = 'Mountain Bikes'
    AND soh.OrderDate >= '2011-07-01'
    AND soh.OrderDate < '2011-10-01'
GROUP BY
    DATEFROMPARTS(
        YEAR(soh.OrderDate),
        MONTH(soh.OrderDate),
        1
    ),
    COALESCE(p.Color, 'Unspecified')
ORDER BY
    OrderMonth,
    FrameColor;
GO


/*
============================================================
QUESTION 7 - METADATA

Question:
Which database tables contain a column named
ProductSubcategoryID? List the matching table names
and their schemas.

Original Author: Andre Paul Rangi
============================================================
*/

SELECT
    t.TABLE_SCHEMA AS SchemaName,
    t.TABLE_NAME AS TableName,
    c.COLUMN_NAME AS ColumnName
FROM INFORMATION_SCHEMA.COLUMNS AS c
INNER JOIN INFORMATION_SCHEMA.TABLES AS t
    ON c.TABLE_CATALOG = t.TABLE_CATALOG
    AND c.TABLE_SCHEMA = t.TABLE_SCHEMA
    AND c.TABLE_NAME = t.TABLE_NAME
WHERE
    c.COLUMN_NAME = 'ProductSubcategoryID'
    AND t.TABLE_TYPE = 'BASE TABLE'
ORDER BY
    t.TABLE_SCHEMA,
    t.TABLE_NAME;
GO


/*
============================================================
QUESTION 8 - METADATA

Question:
Which AdventureWorks tables contain a column named
ProductID, and what is the data type of that column?

Original Author: Prince Kwaku Acheampong
============================================================
*/

SELECT
    t.TABLE_SCHEMA AS SchemaName,
    t.TABLE_NAME AS TableName,
    c.COLUMN_NAME AS ColumnName,
    c.DATA_TYPE AS DataType
FROM INFORMATION_SCHEMA.COLUMNS AS c
INNER JOIN INFORMATION_SCHEMA.TABLES AS t
    ON c.TABLE_CATALOG = t.TABLE_CATALOG
    AND c.TABLE_SCHEMA = t.TABLE_SCHEMA
    AND c.TABLE_NAME = t.TABLE_NAME
WHERE
    c.COLUMN_NAME = 'ProductID'
    AND t.TABLE_TYPE = 'BASE TABLE'
ORDER BY
    t.TABLE_SCHEMA,
    t.TABLE_NAME;
GO


/*
============================================================
END OF W3.4 SQL SCRIPT
============================================================
*/
