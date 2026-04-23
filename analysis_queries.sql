-- =========================================
-- E-COMMERCE SALES ANALYSIS PROJECT
-- =========================================

-- View sample data
SELECT * FROM cleaned_orders LIMIT 10;


-- 1. Total Sales, Profit & Orders
SELECT 
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    COUNT(*) AS total_orders
FROM cleaned_orders;


-- 2. Sales by Category
SELECT 
    Category,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM cleaned_orders
GROUP BY Category
ORDER BY total_sales DESC;


-- 3. Sub-Category Analysis
SELECT 
    `Sub-Category`,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM cleaned_orders
GROUP BY `Sub-Category`
ORDER BY total_sales DESC;


-- 4. Region-wise Performance
SELECT 
    Region,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM cleaned_orders
GROUP BY Region
ORDER BY total_sales DESC;


-- 5. Segment Analysis
SELECT 
    Segment,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM cleaned_orders
GROUP BY Segment;


-- 6. Ship Mode Analysis
SELECT 
    `Ship Mode`,
    COUNT(*) AS total_orders,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    SUM(loss) AS total_loss
FROM cleaned_orders
GROUP BY `Ship Mode`
ORDER BY total_sales DESC;


-- 7. Profitability Analysis
SELECT 
    Category,
    AVG(profit_margin) AS avg_profit_margin
FROM cleaned_orders
GROUP BY Category
ORDER BY avg_profit_margin DESC;


-- 8. Loss Making Sub-Categories
SELECT 
    `Sub-Category`,
    SUM(loss) AS total_loss
FROM cleaned_orders
GROUP BY `Sub-Category`
HAVING total_loss > 0
ORDER BY total_loss DESC;


-- 9. Discount Impact
SELECT 
    Discount,
    AVG(Profit) AS avg_profit
FROM cleaned_orders
GROUP BY Discount
ORDER BY Discount DESC;