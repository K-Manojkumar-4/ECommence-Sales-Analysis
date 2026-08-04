-- **SQL project using amazon sales dataset**

-- first creating a new database

-- drop if database exists 
drop database if exists amazon_dataset;

-- create database 
create database amazon_dataset;
use amazon_dataset;

-- creating table columns for the dataset
create table amazon_sales 
			(
				OrderID varchar(20) primary key,
                Date date,
				Product	varchar(100),
				Category varchar(100),                               
                Price decimal(10,2),
                Quantity int, 
                TotalSales decimal(10,2),
				CustomerName varchar(100),	
                CustomerLocation varchar(50),
                PaymentMethod varchar(50),
                Status varchar(50));
                
                
-- checking for clarification                 
select * from amazon_sales;


-- **data expoloration** 

-- check how many rows been there ?
select count(*) from amazon_sales;

-- checking for columns have null values ?

select * from  amazon_sales
where OrderID is null or
Date is null or
Product is null or
Category is null or
Price is null or
Quantity is null or
TotalSales is null or
CustomerName is null  or
CustomerLocation is null or
PaymentMethod is null or 
Status is null;


-- **data analysis and business key problems & answer**

-- ** MySQL Questions to Solve **


-- 1. Basic Retrieval
-- Find all Completed orders placed in March 2025. Show Order ID, Date, Product, and Total Sales. Sort by date descending.

select OrderID , Date , Product , TotalSales from amazon_sales
where Date like '2025-03-%' and Status = 'Completed'
order by Date desc;


-- 2. Aggregation
-- Calculate the total revenue (total_sales), total quantity sold, and average order value for the entire dataset.

select sum(TotalSales) as total_revenue ,
 sum(Quantity) as total_quantity_sold ,
 round(avg(TotalSales),2) as average_order_value 
 from amazon_sales;
 
 
-- 3. Category Analysis
-- Show the total sales and number of orders for each Category. Sort by total sales in descending order.

select Category,
 sum(TotalSales) as total_sales ,
 count(*) as number_of_orders
 from amazon_sales
 group by Category
 order by total_sales desc;

-- 4. Top Products
-- Find the top 5 best-selling products by total quantity sold. Include Product name and total quantity.

select Product , sum(Quantity) as total_quantity_sold from amazon_sales
group by Product
order by total_quantity_sold desc
limit 5;


-- 5. Customer Performance
-- Find the top 5 customers who generated the highest total sales. Show Customer Name, Total Sales, and Number of Orders.

select CustomerName , sum(TotalSales) as total_sales , count(*) as number_of_orders from amazon_sales
group by CustomerName
order by total_sales desc
limit 5;


-- 6. Payment Method Analysis
-- For each Payment Method, show:
-- Total sales
-- Number of orders
-- Percentage of total revenue (of the entire dataset)?

select PaymentMethod ,
 sum(TotalSales) as total_sales ,
 count(*) as number_of_orders ,
 round(sum(TotalSales)*100.0/(select sum(TotalSales) from amazon_sales),2) as revenue_percentage
 from amazon_sales
 group by PaymentMethod
 order by total_sales desc;


-- 7. Status-wise Performance
-- Show the count of orders and total sales for each Status (Completed, Pending, Cancelled). Also calculate the completion rate (Completed / Total Orders * 100).

SELECT 
    Status,
    COUNT(*) AS number_of_orders,
    SUM(TotalSales) AS total_sales,
    ROUND(
        (SELECT COUNT(*) FROM amazon_sales WHERE Status = 'Completed') * 100.0 
        / (SELECT COUNT(*) FROM amazon_sales), 
        2
    ) AS overall_completion_rate
FROM amazon_sales
GROUP BY Status;


-- 8. Location-wise Sales
-- Find the top 5 cities (customer_location) by total sales. Also show the average order value per city.

select CustomerLocation ,
 sum(TotalSales) as total_sales ,
 round(avg(TotalSales),2) as average_order_value ,
 count(*) as number_of_orders 
 from amazon_sales
group by CustomerLocation
order by total_sales desc 
limit 5;


-- 9. Monthly Trend
-- Show monthly total sales and number of orders from February to April 2025. (Group by month)

select date_format(Date , '%Y-%m') as month ,
sum(TotalSales) as total_sales ,
count(*) as number_of_orders 
 from amazon_sales
where Date between '2025-02-01' and '2025-04-30'
group by month
order by month;


-- 10. Advanced - Window Function
-- For each Category, rank the products by their total sales within that category (using RANK() or DENSE_RANK()).
-- Show Category, Product, Total Sales, and Rank. Only show top 3 products per category.

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
order by Category ,Rank_value;
