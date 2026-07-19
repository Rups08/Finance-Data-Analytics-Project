/*==========================================================
 Finance Transaction Analytics Project
 Author : Rupali Mane
 Database : EnterpriseFinanceDB
 Tools : SQL Server, Power BI
==========================================================*/

------------------------------------------------------------
-- 1. USE DATABASE
------------------------------------------------------------
USE EnterpriseFinanceDB;
GO

------------------------------------------------------------
-- 2. TOTAL REVENUE
------------------------------------------------------------
SELECT
SUM(Revenue) AS Total_Revenue
FROM Fact_Financial_Transactions_New;

------------------------------------------------------------
-- 3. TOTAL PROFIT
------------------------------------------------------------
SELECT
SUM(Profit) AS Total_Profit
FROM Fact_Financial_Transactions_New;

------------------------------------------------------------
-- 4. TOTAL COST
------------------------------------------------------------
SELECT
SUM(Cost) AS Total_Cost
FROM Fact_Financial_Transactions_New;

------------------------------------------------------------
-- 5. TOTAL TRANSACTIONS
------------------------------------------------------------
SELECT
COUNT(*) AS Total_Transactions
FROM Fact_Financial_Transactions_New;

------------------------------------------------------------
-- 6. MONTHLY REVENUE TREND
------------------------------------------------------------
SELECT
d.Year,
d.Month_Name,
SUM(f.Revenue) AS Total_Revenue
FROM Fact_Financial_Transactions_New f
INNER JOIN Dim_date_New d
ON f.Date_ID=d.Date_ID
GROUP BY d.Year,d.Month_Name
ORDER BY d.Year;

------------------------------------------------------------
-- 7. REVENUE BY PRODUCT CATEGORY
------------------------------------------------------------
SELECT
p.Product_Category,
SUM(f.Revenue) AS Total_Revenue
FROM Fact_Financial_Transactions_New f
INNER JOIN Dim_Product_New p
ON f.Product_ID=p.Product_ID
GROUP BY p.Product_Category
ORDER BY Total_Revenue DESC;

------------------------------------------------------------
-- 8. REVENUE BY COUNTRY
------------------------------------------------------------
SELECT
r.Country,
SUM(f.Revenue) AS Total_Revenue
FROM Fact_Financial_Transactions_New f
INNER JOIN Dim_Region r
ON f.Region_ID=r.Region_ID
GROUP BY r.Country
ORDER BY Total_Revenue DESC;

------------------------------------------------------------
-- 9. PAYMENT STATUS ANALYSIS
------------------------------------------------------------
SELECT
Payment_Status,
COUNT(*) AS Total_Transactions
FROM Fact_Financial_Transactions_New
GROUP BY Payment_Status;

------------------------------------------------------------
-- 10. TOP 10 HIGHEST REVENUE TRANSACTIONS
------------------------------------------------------------
SELECT TOP 10 *
FROM Fact_Financial_Transactions_New
ORDER BY Revenue DESC;

------------------------------------------------------------
-- 11. AVERAGE PROCESSING TIME
------------------------------------------------------------
SELECT
AVG(Processing_Time_Hours) AS Avg_Processing_Time
FROM Fact_Financial_Transactions_New;

------------------------------------------------------------
-- 12. RISK LEVEL ANALYSIS
------------------------------------------------------------
SELECT
Risk_Level,
COUNT(*) AS Transactions
FROM Fact_Financial_Transactions_New
GROUP BY Risk_Level;

------------------------------------------------------------
-- 13. TRANSACTION TYPE ANALYSIS
------------------------------------------------------------
SELECT
Transaction_Type,
SUM(Revenue) AS Revenue
FROM Fact_Financial_Transactions_New
GROUP BY Transaction_Type;

------------------------------------------------------------
-- 14. PROFIT BY COUNTRY
------------------------------------------------------------
SELECT
r.Country,
SUM(f.Profit) AS Total_Profit
FROM Fact_Financial_Transactions_New f
INNER JOIN Dim_Region r
ON f.Region_ID=r.Region_ID
GROUP BY r.Country
ORDER BY Total_Profit DESC;

------------------------------------------------------------
-- 15. PROFIT BY PRODUCT CATEGORY
------------------------------------------------------------
SELECT
p.Product_Category,
SUM(f.Profit) AS Total_Profit
FROM Fact_Financial_Transactions_New f
INNER JOIN Dim_Product_New p
ON f.Product_ID=p.Product_ID
GROUP BY p.Product_Category
ORDER BY Total_Profit DESC;