-- ============================================================
-- PrimeViz E-Commerce Sales Analysis
-- Script 01: Database & Table Setup
-- ============================================================

DROP DATABASE IF EXISTS amazon_dataset;
CREATE DATABASE amazon_dataset;
USE amazon_dataset;

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

-- Load data (adjust path according to your environment)
-- LOAD DATA INFILE 'data/amazon_sales_2025.csv'
-- INTO TABLE amazon_sales
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;
