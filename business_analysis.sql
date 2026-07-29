-- ============================================================
-- PrimeViz E-Commerce Sales Analysis
-- Script 02: Business Analysis Queries
-- ============================================================

USE amazon_dataset;

-- ------------------------------------------------------------
-- 1. Basic Retrieval
-- Find all Completed orders placed in March 2025
-- ------------------------------------------------------------
SELECT 
    OrderID,
    Date,
    Product,
    TotalSales
FROM amazon_sales
WHERE Date LIKE '2025-03%'
  AND Status = 'Completed'
ORDER BY Date DESC;


-- ------------------------------------------------------------
-- 2. Aggregation
-- Total revenue, quantity sold, and average order value
-- ------------------------------------------------------------
SELECT 
    SUM(TotalSales)                    AS total_revenue,
    SUM(Quantity)                      AS total_quantity_sold,
    ROUND(AVG(TotalSales), 2)          AS average_order_value
FROM amazon_sales;


-- ------------------------------------------------------------
-- 3. Category Analysis
-- ------------------------------------------------------------
SELECT 
    Category,
    SUM(TotalSales)                    AS total_sales,
    COUNT(*)                           AS number_of_orders
FROM amazon_sales
GROUP BY Category
ORDER BY total_sales DESC;


-- ------------------------------------------------------------
-- 4. Top 5 Products by Quantity Sold
-- ------------------------------------------------------------
SELECT 
    Product,
    SUM(Quantity)                      AS total_quantity_sold
FROM amazon_sales
GROUP BY Product
ORDER BY total_quantity_sold DESC
LIMIT 5;


-- ------------------------------------------------------------
-- 5. Top 5 Customers by Revenue
-- ------------------------------------------------------------
SELECT 
    CustomerName,
    SUM(TotalSales)                    AS total_sales,
    COUNT(*)                           AS number_of_orders
FROM amazon_sales
GROUP BY CustomerName
ORDER BY total_sales DESC
LIMIT 5;


-- ------------------------------------------------------------
-- 6. Payment Method Analysis + Revenue Percentage
-- ------------------------------------------------------------
SELECT 
    PaymentMethod,
    SUM(TotalSales)                    AS total_sales,
    COUNT(*)                           AS number_of_orders,
    ROUND(SUM(TotalSales) * 100.0 / (SELECT SUM(TotalSales) FROM amazon_sales), 2) 
                                       AS revenue_percentage
FROM amazon_sales
GROUP BY PaymentMethod
ORDER BY total_sales DESC;


-- ------------------------------------------------------------
-- 7. Status-wise Performance + Completion Rate
-- ------------------------------------------------------------
SELECT 
    Status,
    COUNT(*)                           AS number_of_orders,
    SUM(TotalSales)                    AS total_sales,
    ROUND(COUNT(CASE WHEN Status = 'Completed' THEN 1 END) * 100.0 / COUNT(*), 2) 
                                       AS completion_rate
FROM amazon_sales
GROUP BY Status;


-- ------------------------------------------------------------
-- 8. Top 5 Cities by Sales
-- ------------------------------------------------------------
SELECT 
    CustomerLocation,
    SUM(TotalSales)                    AS total_sales,
    ROUND(AVG(TotalSales), 2)          AS average_order_value,
    COUNT(*)                           AS number_of_orders
FROM amazon_sales
GROUP BY CustomerLocation
ORDER BY total_sales DESC
LIMIT 5;


-- ------------------------------------------------------------
-- 9. Monthly Sales Trend (Feb – Apr 2025)
-- ------------------------------------------------------------
SELECT 
    DATE_FORMAT(Date, '%Y-%m')         AS month,
    SUM(TotalSales)                    AS total_sales,
    COUNT(*)                           AS number_of_orders
FROM amazon_sales
WHERE Date BETWEEN '2025-02-01' AND '2025-04-30'
GROUP BY month
ORDER BY month;


-- ------------------------------------------------------------
-- 10. Advanced: Top 3 Products per Category (Window Function)
-- ------------------------------------------------------------
WITH product_sales AS (
    SELECT 
        Category,
        Product,
        SUM(TotalSales)                AS total_sales
    FROM amazon_sales
    GROUP BY Category, Product
),
ranked_sales AS (
    SELECT 
        Category,
        Product,
        total_sales,
        DENSE_RANK() OVER (
            PARTITION BY Category 
            ORDER BY total_sales DESC
        ) AS rank_value
    FROM product_sales
)
SELECT 
    Category,
    Product,
    total_sales,
    rank_value
FROM ranked_sales
WHERE rank_value <= 3
ORDER BY Category, rank_value;
