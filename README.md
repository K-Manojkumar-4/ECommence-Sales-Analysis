# PrimeViz — E-Commerce Sales Analysis

![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![SQL](https://img.shields.io/badge/SQL-Analysis-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Project-Completed-success?style=for-the-badge)

> Professional end-to-end **E-Commerce Sales Analytics of Amazon 2025 Sales** project combining advanced MySQL analysis with interactive Power BI dashboards.

---

## 📌 Project Overview

**PrimeViz** is a complete data analytics solution built on Amazon-style e-commerce sales data for Q1 2025 (February – April).  

The project demonstrates the full analytics lifecycle:

1. Database design & data loading  
2. Exploratory Data Analysis (EDA)  
3. Business problem solving with advanced SQL  
4. Interactive dashboard development in Power BI  
5. Actionable business insights & recommendations  

**Dataset Size:** 250 orders  
**Total Revenue:** $243,845  
**Key Categories:** Electronics, Home Appliances, Clothing, Footwear, Books

---

## 🗂️ Project Structure

- The project is organized into clear folders for easy navigation.
- The data folder contains the cleaned source dataset named amazon_sales_2025.csv.
- The sql folder holds all the SQL scripts. It includes the database setup script, the complete business analysis queries covering all ten questions, and the original full analysis script.
- The powerbi folder contains the Power BI template file (sales2025.pbit) along with a short guide on how to open and use the dashboard.
- The docs folder includes two important documents — insights.md which covers the key findings and business recommendations, and technical_notes.md which explains the technical design decisions and methods used in the project.
- There is also an assets folder reserved for dashboard screenshots and other visual materials.

---

## 🛠️ Tech Stack

| Layer              | Technology              |
|--------------------|-------------------------|
| Database           | MySQL 8.0+              |
| Data Analysis      | Advanced SQL (CTEs, Window Functions, Aggregations) |
| Visualization      | Power BI Desktop        |
| Data Source        | CSV → MySQL / Direct Import |

---

## 🔑 Key Business Questions Solved (SQL)

1. Completed orders in March 2025  
2. Overall revenue, quantity sold & average order value  
3. Category-wise sales & order volume  
4. Top 5 products by quantity sold  
5. Top 5 customers by revenue  
6. Payment method performance + revenue share  
7. Status-wise analysis + completion rate  
8. Top 5 cities by sales + average order value  
9. Monthly sales trend (Feb–Apr 2025)  
10. Top 3 products per category using `DENSE_RANK()` (Window Function)

---

## 📊 Dashboard Pages

The Power BI dashboard contains **4 professional pages**:

| # | Page Name              | Purpose                                      |
|---|------------------------|----------------------------------------------|
| 1 | **Overview**           | Executive KPIs, Category mix, Monthly trend  |
| 2 | **Sales Analysis**     | Product performance, Category contribution   |
| 3 | **Customer Insights**  | Top customers, Geographic sales distribution |
| 4 | **Operations**         | Payment methods, Order status & cancellations|

---

## 📈 Key Insights

- **Total Revenue:** $243,845 across 250 orders  
- **Dominant Category:** Electronics (~53% of total revenue)  
- **Completion Rate:** 35.2% | **Cancellation Rate:** 30.8%  
- **Top Products:** Refrigerator, Laptop, Smartphone  
- **Highest Revenue Month:** February 2025  
- **Leading Payment Methods:** PayPal & Credit Card  
- **Top Customers:** Olivia Wilson, Jane Smith, Emma Clark  

> High cancellation rate (30.8%) represents a significant opportunity for operational improvement.

---

## 🚀 How to Use This Project

### 1. SQL Analysis
```bash
# Open MySQL
mysql -u root -p

# Run the full script
source sql/amazon 2025.sql
```

### 2. Power BI Dashboard
1. Open **Power BI Desktop**
2. File → Open → Select `powerbi/sales2025.pbit`
3. Connect to the CSV or your MySQL database
4. Explore the 4 interactive pages

### 3. Data
The cleaned dataset is available at:  
`data/amazon_sales_2025.csv`

---

## 💡 Business Recommendations

1. **Reduce Cancellations** — Investigate root causes (especially in Electronics & Home Appliances).  
2. **Focus on High-Value Categories** — Prioritize promotions for Electronics and Home Appliances.  
3. **Customer Retention** — Create loyalty programs for top spenders.  
4. **Payment Optimization** — Encourage PayPal and Credit Card usage.  
5. **Seasonal Strategy** — Strengthen campaigns in February and March.

---

## 🧠 Skills Demonstrated

- Database Design & Data Modeling  
- Advanced SQL (Window Functions, CTEs, Subqueries, Aggregations)  
- Exploratory Data Analysis  
- Business Intelligence Dashboard Design  
- KPI Definition & Storytelling with Data  
- End-to-end Analytics Project Delivery  

---

## 🔮 Future Enhancements

- RFM Customer Segmentation  
- Predictive sales forecasting  
- Cancellation prediction model  
- Real-time dashboard with DirectQuery  
- Automated data pipeline (Python + Airflow)

---

**Built with precision for Data Analyst portfolios.**  
*PrimeViz — Turning raw sales data into actionable intelligence.*
