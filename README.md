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

2️⃣ Data Cleaning

Removed invalid products with zero MRP.

Converted values from Paise → Rupees for accurate currency analysis.

UPDATE zepto
SET mrp = mrp / 100.0, discountSellingPrice = discountSellingPrice / 100.0;

3️⃣ Insights & Analysis
🥇 Q1. Top 10 Best-Value Products by Discount %
SELECT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;
