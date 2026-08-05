# Results — PrimeViz E-Commerce Sales Analysis
 
**MySQL Analysis + Power BI Dashboard**  
**Period:** February – April 2025 | **Orders:** 250 | **Revenue:** $243,845

---

## 1. Executive Snapshot

| Metric | Value | Insight |
|--------|-------|---------|
| **Total Revenue** | $243,845 | Primary success metric |
| **Total Orders** | 250 | Full transactional volume |
| **Total Quantity Sold** | 714 units | Across 10 products |
| **Average Order Value** | ~$975 | Driven by high-ticket items |
| **Completion Rate** | 35.2% | Only 88 orders completed |
| **Cancellation Rate** | **30.8%** | Critical operational risk |
| **Pending Rate** | 34.0% | Significant backlog |

> **Key Takeaway:** Electronics and Home Appliances generate **>96%** of revenue, while nearly **1 in 3 orders is cancelled**.

---

## 2. MySQL Analysis Results

### 2.1 Category Performance

| Rank | Category | Total Sales | Orders | Revenue Share |
|------|----------|-------------|--------|---------------|
| 1 | Electronics | ~$129,950 | — | **~53.3%** |
| 2 | Home Appliances | ~$105,000 | — | **~43.1%** |
| 3 | Footwear | ~$4,320 | — | ~1.8% |
| 4 | Clothing | ~$3,540 | — | ~1.5% |
| 5 | Books | ~$1,035 | — | ~0.4% |

**Finding:** Extreme revenue concentration. Strategic focus should remain on Electronics and Home Appliances.

---

### 2.2 Top Products by Revenue

| Rank | Product | Category | Approx. Revenue |
|------|---------|----------|-----------------|
| 1 | Refrigerator | Home Appliances | Highest |
| 2 | Laptop | Electronics | High |
| 3 | Smartphone | Electronics | High |
| 4 | Washing Machine | Home Appliances | Medium-High |
| 5 | Smartwatch | Electronics | Medium |

**Top by Quantity:** Smartwatch (105 units) → Smartphone (97) → Laptop / Headphones (73 each)

---

### 2.3 Top Customers by Revenue

| Rank | Customer | Insight |
|------|----------|---------|
| 1 | Olivia Wilson | Highest contributor |
| 2 | Jane Smith | Strong repeat value |
| 3 | Emma Clark | Consistent high spend |
| 4–5 | John Doe, Emily Johnson, others | Material share of revenue |

**Finding:** Revenue is concentrated among a small set of customers — ideal for loyalty / retention programs.

---

### 2.4 Order Status Breakdown

| Status | Orders | Revenue | Share |
|--------|--------|---------|-------|
| Completed | 88 | ~$88,530 | **35.2%** |
| Pending | 85 | ~$90,285 | **34.0%** |
| Cancelled | 77 | ~$65,030 | **30.8%** |

**Finding:** Cancellation rate of **30.8%** is the most urgent operational red flag.

---

### 2.5 Payment Method Performance

| Payment Method | Revenue Share (approx.) |
|----------------|-------------------------|
| PayPal | ~28.6% |
| Credit Card | ~25.3% |
| Gift Card | ~19.7% |
| Amazon Pay | ~13.4% |
| Debit Card | ~13.1% |

**Finding:** PayPal and Credit Card dominate. Optimize experience and fees for these channels.

---

### 2.6 Geographic Highlights

**Top performing cities (by sales):**  
Miami, Denver, Houston, Dallas, Seattle, Boston, Chicago, New York, Los Angeles, San Francisco

**Finding:** Sales are concentrated in major US metros — useful for regional marketing and logistics prioritization.

---

### 2.7 Monthly Trend (Feb – Apr 2025)

| Month | Performance |
|-------|-------------|
| February | Highest sales volume |
| March | Strong, slightly lower than February |
| April | Significantly lower (partial month + lower activity) |

---

### 2.8 Advanced SQL Result — Top 3 Products per Category

Using `DENSE_RANK()` window function (partitioned by Category):

- **Electronics:** Laptop, Smartphone, Smartwatch (leading)
- **Home Appliances:** Refrigerator, Washing Machine
- **Other categories:** Single or limited high performers (Running Shoes, Jeans, T-Shirt, Book)

This ranking supports category-level assortment and promotion decisions.

---

## 3. Power BI Dashboard Results

The interactive dashboard contains **4 pages**:

### Page 1 — Overview
- KPI cards: Total Revenue, Total Orders, AOV, Completion Rate, Cancellation Rate
- Category contribution (donut)
- Monthly sales trend (line)
- High-level health snapshot for executives

### Page 2 — Sales Analysis
- Top products by revenue (bar)
- Category share
- Monthly sales + order volume (dual-axis)
- Product performance table

### Page 3 — Customer Insights
- Top customers ranking
- Sales by city (map + bar)
- Customer metrics table
- Average sales per customer

### Page 4 — Operations
- Revenue by payment method
- Order status by category (stacked)
- Status summary with percentages
- Cancellation rate emphasis

**Slicers available:** Date, Category, Status, Payment Method

---

## 4. Key Business Insights

1. **Revenue is highly concentrated** — Electronics + Home Appliances = >96% of sales.
2. **Cancellation rate (30.8%) is critically high** and represents the biggest operational risk.
3. **Pending orders (34%)** indicate fulfillment or process delays that need attention.
4. **A small group of customers** drives a large share of revenue → loyalty opportunity.
5. **PayPal & Credit Card** are the strongest payment channels.
6. **February–March** form the stronger sales window in this dataset.
7. **High-ticket products** (Refrigerator, Laptop, Smartphone) dominate absolute revenue.

---

## 5. Recommendations (Prioritized)

| Priority | Recommendation | Expected Impact |
|----------|----------------|-----------------|
| 1 | Investigate and reduce cancellations (esp. Electronics & Home Appliances) | High revenue recovery |
| 2 | Focus growth efforts on Electronics & Home Appliances | Protect core revenue |
| 3 | Launch loyalty / retention for top customers | Increase lifetime value |
| 4 | Optimize PayPal & Credit Card experience | Improve conversion & fees |
| 5 | Prioritize marketing & logistics in top cities | Higher ROI on spend |
| 6 | Clear pending order backlog | Improve completion rate |

---

## 6. Technical Highlights

**MySQL techniques used:**
- Aggregations (`SUM`, `AVG`, `COUNT`)
- `GROUP BY` + `ORDER BY` + `LIMIT`
- Date filtering and `DATE_FORMAT`
- Subqueries for percentage-of-total
- Conditional aggregation (`CASE WHEN`)
- CTEs (`WITH`)
- Window functions (`DENSE_RANK() OVER (PARTITION BY ...)`)

**Power BI features used:**
- KPI cards & measures (DAX)
- Donut / bar / line / map visuals
- Cross-page slicers
- Status and category breakdowns

---

## 7. How to Reproduce

1. **SQL**
   ```bash
   # In MySQL
   source sql/01_database_setup.sql
   source sql/02_business_analysis.sql
   ```

2. **Power BI**
   - Open `powerbi/sales2025.pbit` in Power BI Desktop
   - Connect to `data/amazon_sales_2025.csv` (or MySQL)
   - Explore the 4 dashboard pages

3. **Documentation**
   - See `docs/` for full report, insights, technical notes, and presentation

---

## 8. Summary

PrimeViz delivers a complete, professional analytics workflow:

**Raw CSV → MySQL (Advanced SQL) → Insights → Power BI Dashboard → Recommendations**

The most actionable findings are:
- Protect and grow **Electronics & Home Appliances**
- Urgently address the **30.8% cancellation rate**

---

**Project:** PrimeViz — E-Commerce Sales Analysis  
**Stack:** MySQL + Power BI  
**Status:** Completed
