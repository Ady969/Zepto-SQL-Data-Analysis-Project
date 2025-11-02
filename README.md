# 🛒 Zepto SQL Data Analysis Project

**Tools Used:** PostgreSQL | pgAdmin4 | SQL | Data Cleaning | Data Analysis

---

## 📘 Project Overview

This project demonstrates **end-to-end SQL-based data analysis** using **PostgreSQL** on Zepto’s product dataset (a simulated online grocery dataset).  
The objective was to explore **pricing patterns, discount strategies, and revenue insights** to drive data-backed business decisions.

---

## 🎯 Key Objectives

- Perform **data exploration** and check for missing or duplicate values.  
- Conduct **data cleaning** to ensure accuracy and consistency.  
- Derive **actionable insights** related to product pricing, discount efficiency, and stock management.  
- Use **SQL queries** to uncover patterns and opportunities for improvement.

---

## 🧩 Dataset Information

**File:** `zepto_v2.csv`  
**Rows:** ~2500+ product entries  
**Columns:** Category, Product Name, MRP, Discount %, Available Quantity, Weight, Stock Status, etc.  

This dataset simulates a real-world grocery product listing from an e-commerce platform like **Zepto**.

---

## 🧮 SQL Workflow Summary

### 1️⃣ Data Exploration
- Counted total records and checked for null or duplicate values.  
- Identified distinct product categories and stock distribution.

```sql
SELECT DISTINCT category FROM zepto ORDER BY category;
SELECT outOfStock, COUNT(sku_id) FROM zepto GROUP BY outOfStock;

### 2️⃣ Data Cleaning

   Removed invalid products with zero MRP.

   Converted values from Paise → Rupees for accurate currency analysis.

   UPDATE zepto
   SET mrp = mrp / 100.0, discountSellingPrice = discountSellingPrice / 100.0;

### 3️⃣ Insights & Analysis
   🥇 Q1. Top 10 Best-Value Products by Discount %
   SELECT name, mrp, discountPercent
   FROM zepto
   ORDER BY discountPercent DESC
   LIMIT 10;

### 🚫 Q2. High-MRP Products Currently Out of Stock
   SELECT DISTINCT(name), mrp
   FROM zepto
   WHERE outOfStock = TRUE AND mrp > 300
   ORDER BY mrp DESC;

### 💰 Q3. Estimated Revenue by Category
   SELECT category, 
   SUM(discountSellingPrice * availableQuantity) AS revenue
   FROM zepto
   GROUP BY category
   ORDER BY revenue DESC;

### 🎯 Q4. Expensive Products (MRP > ₹500) with Minimal Discount (<10%)
   SELECT DISTINCT(name), mrp, discountPercent
   FROM zepto
   WHERE mrp > 500 AND discountPercent < 10
   ORDER BY mrp DESC;

### 🧾 Q5. Top 5 Categories Offering Highest Average Discounts
    SELECT category,
    AVG(discountPercent) AS avg_discount
    FROM zepto
    GROUP BY category
    ORDER BY avg_discount DESC
    LIMIT 5;

### ⚖️ Q6. Best Value per Gram (Products Above 100g)
    SELECT DISTINCT(name), weightInGms, discountSellingPrice, 
    ROUND(discountSellingPrice / weightInGms, 2) AS price_per_gram
    FROM zepto
    WHERE weightInGms >= 100
    ORDER BY price_per_gram;

### 📦 Q7. Categorized Products by Weight
    SELECT DISTINCT(name), weightInGms,
CASE 
   WHEN weightInGms < 1000 THEN 'Low'
   WHEN weightInGms < 5000 THEN 'Medium'
   ELSE 'Bulk'
END AS weight_category
FROM zepto;

### ⚙️ Q8. Total Inventory Weight per Category
     SELECT category, 
     SUM(weightInGms * availableQuantity) AS total_weight
     FROM zepto
     GROUP BY category
     ORDER BY total_weight DESC;

## 📊 Sample Insights

Top Discounted Items: Products offering >80% discounts were mostly snacks and personal care items.

Revenue Leaders: Categories like Beverages and Household Essentials contributed the highest total revenue.

Stock Gaps: High-MRP items had a higher out-of-stock ratio, indicating possible supply-chain inefficiencies.

Average Discounts: The Packaged Food category offered the most aggressive pricing.

## 🏁 Key Takeaways

Demonstrated strong data wrangling, cleaning, and analysis using SQL.

Delivered insights on pricing strategy, inventory weight, and discount optimization.

Project reflects capabilities in data-driven business decision-making and database querying with PostgreSQL.

---

## 🖼️ Project Snapshots

| Description | Screenshot |
|--------------|-------------|
| Data Preview | ![Data Preview](screenshots/data_preview.png) |
| Top Discounted Products | <img width="1916" height="1012" alt="image" src="https://github.com/user-attachments/assets/fe456ba2-63df-443b-9283-41270cd739a4" />|
| Different Weights for category |<img width="988" height="218" alt="image" src="https://github.com/user-attachments/assets/6ab77522-93a9-4ee8-be3a-a1695eb8ac86" /> |


> Screenshots generated from PostgreSQL (pgAdmin4 query results).

---

## 📈 Learnings

- Strengthened SQL proficiency in **data cleaning, transformation, and aggregation.**  
- Understood **real-world data quality challenges** (missing, duplicate, and inconsistent values).  
- Practiced **KPI-based querying** — revenue, stock levels, discounts, etc.  
- Enhanced ability to **translate raw data into actionable business insights.**



## 🧠 About the Analyst

Developed by: Aadil Shaikh
Role: Data Analyst | Quality Engineer | SQL & Power BI Enthusiast
Focus: Business Analytics | Data Visualization | Data Domain
