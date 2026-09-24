-- E-Commerce Sales Analysis

-- 1. Total Sales
SELECT SUM(Sales) AS total_sales
FROM ecommerce_sales;

-- 2. Total Profit
SELECT SUM(Profit) AS total_profit
FROM ecommerce_sales;

-- 3. Total Orders
SELECT COUNT(DISTINCT Order_ID) AS total_orders
FROM ecommerce_sales;

-- 4. Total Quantity
SELECT SUM(Quantity) AS total_quantity
FROM ecommerce_sales;

-- 5. Average Order Value
SELECT AVG(Sales) AS average_order_value
FROM ecommerce_sales;

-- 6. Sales by Category
SELECT
    Category,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Category
ORDER BY total_sales DESC;

-- 7. Profit by Category
SELECT
    Category,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY Category
ORDER BY total_profit DESC;

-- 8. Sales by Region
SELECT
    Region,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Region
ORDER BY total_sales DESC;

-- 9. Top 5 Products
SELECT
    Product,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Product
ORDER BY total_sales DESC
LIMIT 5;

-- 10. Monthly Sales
SELECT
    strftime('%Y-%m', Order_Date) AS month,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY month
ORDER BY month;

-- 11. Top 5 Customers
SELECT
    Customer_Name,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Customer_Name
ORDER BY total_sales DESC
LIMIT 5;

-- 12. Profit Margin by Category
SELECT
    Category,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS profit_margin_pct
FROM ecommerce_sales
GROUP BY Category
ORDER BY profit_margin_pct DESC;

-- 13. Region + Category Sales
SELECT
    Region,
    Category,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Region, Category
ORDER BY Region, total_sales DESC;