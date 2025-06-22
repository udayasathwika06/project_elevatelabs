---> SQL Table Creation:
CREATE TABLE retail_transactions (
    Transaction_ID INT,
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Region VARCHAR(20),
    Season VARCHAR(20),
    Units_Sold INT,
    Unit_Cost DECIMAL(10,2),
    Unit_Price DECIMAL(10,2),
    Inventory_Days INT,
    Revenue DECIMAL(10,2),
    Cost DECIMAL(10,2),
    Profit DECIMAL(10,2)
);

---> SQL Data Cleaning Query:
DELETE FROM retail_transactions
WHERE Category IS NULL OR Units_Sold IS NULL OR Unit_Cost IS NULL;

--->SQL Profit Margin Analysis
---> Profit Margin by Category
SELECT 
    Category,
    SUM(Profit) AS Total_Profit,
    SUM(Revenue) AS Total_Revenue,
    ROUND(SUM(Profit) / NULLIF(SUM(Revenue), 0), 2) AS Profit_Margin
FROM retail_transactions
GROUP BY Category;

---> Profit Margin by Sub-Category
SELECT 
    Sub_Category,
    SUM(Profit) AS Total_Profit,
    SUM(Revenue) AS Total_Revenue,
    ROUND(SUM(Profit) / NULLIF(SUM(Revenue), 0), 2) AS Profit_Margin
FROM retail_transactions
GROUP BY Sub_Category;
