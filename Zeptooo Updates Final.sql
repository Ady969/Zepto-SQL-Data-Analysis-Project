drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

--data exploration
--count of rows
SELECT COUNT(*) from zepto;
SELECT * FROM zepto
LIMIT 10;

--NULL VALUES
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
availableQuantity IS NULL
OR
discountSellingPrice IS NULL
OR
weightInGms IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--Different Product Categories

SELECT DISTINCT category 
FROM zepto
Order by category;

--How many products are instock vs outofstock

SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

--product names present more than 1 times
SELECT name, COUNT(sku_id) as "SKU Lists"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;

--data cleaning
--product with price = 0
SELECT * FROM zepto
WHERE mrp = 0;

DELETE FROM zepto
WHERE mrp = 0;

--Convert Paise into Rupees

UPDATE zepto
SET mrp = mrp/100.0, discountSellingPrice = discountSellingPrice/100.0;

SELECT mrp, discountSellingPrice FROM zepto;

--(Q-1)Found top 10 best-value products based on discount percentage
SELECT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10; 

--(Q-2)Identified high-MRP products that are currently out of stock

SELECT DISTINCT(name), mrp
FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;

--(Q-3)Estimated potential revenue for each product category

SELECT category, 
SUM(discountSellingPrice*availableQuantity) AS revenue
FROM zepto
GROUP BY category
ORDER BY revenue;

--(Q-4)Filtered expensive products (MRP > ₹500) with minimal discount (<10%)

SELECT DISTINCT(name), mrp, discountPercent
FROM zepto
WHERE mrp>500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

--(Q-5)Ranked top 5 categories offering highest average discounts
SELECT category,
AVG(discountPercent) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

--(Q-6)Calculated price per gram (above 100gms) to identify the best value.

SELECT DISTINCT(name), weightInGms, discountSellingPrice, 
ROUND(discountSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

--(Q-7)Grouped products into categories like Low, Medium, and Bulk.
SELECT DISTINCT(name), weightInGms
CASE WHEN 
FROM zepto
WHERE weightInGms 





--(Q-8)Measured total inventory weight per product category










