-- ============================================================
-- PrimeViz E-Commerce Sales Analysis
-- Script 01: Database & Table Setup
-- ============================================================

DROP DATABASE IF EXISTS amazon_dataset;
CREATE DATABASE amazon_dataset;
USE amazon_dataset;

CREATE TABLE amazon_sales (
    OrderID           VARCHAR(20)    PRIMARY KEY,
    Date              DATE           NOT NULL,
    Product           VARCHAR(100)   NOT NULL,
    Category          VARCHAR(100),
    Price             DECIMAL(10,2)  NOT NULL,
    Quantity          INT            NOT NULL,
    TotalSales        DECIMAL(10,2)  NOT NULL,
    CustomerName      VARCHAR(100),
    CustomerLocation  VARCHAR(50),
    PaymentMethod     VARCHAR(50),
    Status            VARCHAR(50)
);

-- Load data (adjust path according to your environment)
-- LOAD DATA INFILE 'data/amazon_sales_2025.csv'
-- INTO TABLE amazon_sales
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;
