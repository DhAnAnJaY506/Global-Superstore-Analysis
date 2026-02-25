CREATE TABLE superstore (
    order_id VARCHAR,
    order_date DATE,
    ship_date DATE,
    customer_id VARCHAR,
    customer_name VARCHAR,
    segment VARCHAR,
    country VARCHAR,
    region VARCHAR,
    category VARCHAR,
    sub_category VARCHAR,
    sales NUMERIC,
    quantity INT,
    discount NUMERIC,
    profit NUMERIC,
    profit_margin NUMERIC,
    delivery_days INT
);

SELECT * FROM store;

-- 1. Which region generates the highest total sales and profit?
SELECT
	region,
	SUM(profit) AS total_profit,
	SUM(sales) AS total_sales
FROM store
GROUP BY region
ORDER BY total_profit DESC, total_sales DESC;

-- 2. Which region has high sales but low profit margin?
SELECT
	region,
	SUM(sales) AS total_sales,
	(SUM(profit)/SUM(sales)) * 100 AS profit_margin
FROM store
GROUP BY 1
HAVING SUM(sales) > (
	SELECT
		AVG(sales)
	FROM store
)
ORDER BY profit_margin ASC;

-- 3. What is the average profit margin by category and sub-category?
SELECT
    category,
    sub_category,
    (SUM(profit) / SUM(sales)) * 100 AS avg_profit_margin
FROM store
GROUP BY category, sub_category
ORDER BY avg_profit_margin DESC;

-- 4. Which sub-categories are generating losses overall?
SELECT
	sub_category,
	SUM(profit) AS total_profit
FROM store
GROUP BY sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit;

-- 5. Are higher discounts negatively impacting profit?
SELECT
    CASE 
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount BETWEEN 0.01 AND 0.20 THEN 'Low Discount'
        WHEN discount BETWEEN 0.21 AND 0.40 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit)/SUM(sales)) * 100 AS profit_margin
FROM store
GROUP BY discount_category
ORDER BY profit_margin;

-- 6. Which top 10 customers generate the highest total profit?
SELECT
	customer_id,
	customer_name,
	SUM(profit) AS total_profit
FROM store
GROUP BY 1,2
ORDER BY total_profit DESC
LIMIT 10;

-- 7. Which customer segment (Consumer, Corporate, Home Office) gives the highest profit margin?
SELECT
	segment,
	(SUM(profit)/SUM(sales)) * 100 AS profit_margin
FROM store
GROUP BY segment
ORDER BY profit_margin DESC;

-- 8. Which customers placed more than 5 orders but have low total profit?
SELECT
	customer_id,
	customer_name,
	COUNT(*) AS order_count,
	SUM(profit) AS total_profit
FROM store
GROUP BY customer_id, customer_name
HAVING COUNT(*) > 5 AND
	SUM(profit) < (
		SELECT
			AVG(profit)
		FROM store
	)
ORDER BY total_profit;

-- 9. What is the monthly sales trend? Is sales increasing or decreasing?
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales) AS total_sales
FROM store
GROUP BY month
ORDER BY month;

-- 10. Which products are sold at a loss more than 10 times?
SELECT
	product_name,
	COUNT(*) AS total_sold
FROM store
WHERE profit < 0
GROUP BY product_name
HAVING COUNT(*) > 10
ORDER BY total_sold DESC;

-- 11. Which region has the highest average delivery days?
SELECT
    region,
    AVG(ship_date - order_date) AS avg_delivery_days
FROM store
GROUP BY region
ORDER BY avg_delivery_days DESC;

-- 12. Which category contributes the highest percentage of total sales?
SELECT
	category,
	ROUND(SUM(sales)* 100.0 /SUM(SUM(saleS)) over(), 2) AS percentage
FROM store
GROUP BY category
ORDER BY percentage DESC;

