-- ============================================================
-- PrimeViz E-Commerce Sales Analysis
-- Script 02: Business Analysis Queries
-- ============================================================

USE amazon_dataset;

-- ------------------------------------------------------------
-- 1. Basic Retrieval
-- Find all Completed orders placed in March 2025
-- ------------------------------------------------------------

select OrderID , Date , Product , TotalSales from amazon_sales
where Date like '2025-03-%'
order by Date desc;

-- ------------------------------------------------------------
-- 2. Aggregation
-- Total revenue, quantity sold, and average order value
-- ------------------------------------------------------------

select sum(TotalSales) as total_revenue ,
 sum(Quantity) as total_quantity_sold ,
 round(avg(TotalSales),2) as average_order_value 
 from amazon_sales;

-- ------------------------------------------------------------
-- 3. Category Analysis
-- ------------------------------------------------------------

select Category,
 sum(TotalSales) as total_sales ,
 count(*) as number_of_orders
 from amazon_sales
 group by Category
 order by total_sales desc;

-- ------------------------------------------------------------
-- 4. Top 5 Products by Quantity Sold
-- ------------------------------------------------------------
select Product , sum(Quantity) as total_quantity_sold from amazon_sales
group by Product
order by total_quantity_sold desc
limit 5;

-- ------------------------------------------------------------
-- 5. Top 5 Customers by Revenue
-- ------------------------------------------------------------

select CustomerName , sum(TotalSales) as total_sales , count(*) as number_of_orders from amazon_sales
group by CustomerName
order by total_sales desc
limit 5;

-- ------------------------------------------------------------
-- 6. Payment Method Analysis + Revenue Percentage
-- ------------------------------------------------------------

select PaymentMethod ,
 sum(TotalSales) as total_sales ,
 count(*) as number_of_orders ,
 round(sum(TotalSales)*100.0/(select sum(TotalSales) from amazon_sales),2) as revenue_percentage
 from amazon_sales
 group by PaymentMethod
 order by total_sales desc;

-- ------------------------------------------------------------
-- 7. Status-wise Performance + Completion Rate
-- ------------------------------------------------------------

select Status ,
count(*) as number_of_orders ,
sum(TotalSales) as total_sales ,
round(count(case when Status = 'Completed' then 1 end ) * 100.0 / count(*) ,2) as completion_rate 
from amazon_sales
group by Status;

-- ------------------------------------------------------------
-- 8. Top 5 Cities by Sales
-- ------------------------------------------------------------

select CustomerLocation ,
 sum(TotalSales) as total_sales ,
 round(avg(TotalSales),2) as average_order_value ,
 count(*) as number_of_orders 
 from amazon_sales
group by CustomerLocation
order by total_sales desc 
limit 5;

-- ------------------------------------------------------------
-- 9. Monthly Sales Trend (Feb – Apr 2025)
-- ------------------------------------------------------------

select date_format(Date , '%m') as month ,
sum(TotalSales) as total_sales ,
count(*) as number_of_orders 
 from amazon_sales
where Date between '2025-02-01' and '2025-04-30'
group by month
order by month;

-- ------------------------------------------------------------
-- 10. Advanced: Top 3 Products per Category (Window Function)
-- ------------------------------------------------------------

with product_sales as(
  select Category ,
         Product ,
         sum(TotalSales) as total_sales 
         from amazon_sales
         group by Category , Product
),
ranked_sales as (
 select Category , 
		Product , 
        total_sales , 
        dense_rank()over(partition by Category order by total_sales desc) as Rank_value
		from product_sales 
)
select Category ,
		Product ,
        total_sales , 
        Rank_value 
        from ranked_sales
where Rank_value <= 3
order by Category ,Rank_value;;
