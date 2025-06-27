-- SQL for Sales Data Analysis
-- Create products lookup table
DROP TABLE IF EXISTS products;
CREATE TABLE products AS
SELECT DISTINCT PRODUCTCODE, PRODUCTLINE, MSRP
FROM sales;

-- Query 1: Total sales by year
SELECT YEAR_ID, SUM(SALES) AS total_sales
FROM sales
GROUP BY YEAR_ID
ORDER BY YEAR_ID;

-- Query 2: Top 5 countries by number of orders
SELECT COUNTRY, COUNT(DISTINCT ORDERNUMBER) AS orders
FROM sales
GROUP BY COUNTRY
ORDER BY orders DESC
LIMIT 5;

-- Query 3: Average order value per month in 2003
SELECT MONTH_ID, AVG(SALES) AS avg_order_value
FROM sales
WHERE YEAR_ID = 2003
GROUP BY MONTH_ID
ORDER BY MONTH_ID;

-- Query 4: Top 10 products by revenue
SELECT PRODUCTCODE, SUM(SALES) AS revenue
FROM sales
GROUP BY PRODUCTCODE
ORDER BY revenue DESC
LIMIT 10;

-- Query 5: Customers whose total purchases exceed average customer sales
SELECT CUSTOMERNAME, total_customer_sales
FROM (
    SELECT CUSTOMERNAME, SUM(SALES) AS total_customer_sales
    FROM sales
    GROUP BY CUSTOMERNAME
) AS customer_totals
WHERE total_customer_sales > (
    SELECT AVG(total_sales)
    FROM (
        SELECT CUSTOMERNAME, SUM(SALES) AS total_sales
        FROM sales
        GROUP BY CUSTOMERNAME
    ) AS all_customer_totals
)
ORDER BY total_customer_sales DESC;

-- Create view: sales by product line
DROP VIEW IF EXISTS v_sales_by_productline;
CREATE VIEW v_sales_by_productline AS
SELECT PRODUCTLINE, SUM(SALES) AS total_sales
FROM sales
GROUP BY PRODUCTLINE;

-- Join example: Revenue vs MSRP per product (discount difference)
SELECT s.PRODUCTCODE,
       SUM(s.QUANTITYORDERED) AS qty_sold,
       SUM(s.SALES) AS revenue,
       p.MSRP,
       SUM(s.QUANTITYORDERED * p.MSRP) AS potential_revenue,
       SUM(s.QUANTITYORDERED * p.MSRP) - SUM(s.SALES) AS discount_difference
FROM sales s
JOIN products p ON s.PRODUCTCODE = p.PRODUCTCODE
GROUP BY s.PRODUCTCODE, p.MSRP
ORDER BY discount_difference DESC
LIMIT 10;

-- Indexes for optimization
CREATE INDEX IF NOT EXISTS idx_ordernumber ON sales (ORDERNUMBER);
CREATE INDEX IF NOT EXISTS idx_customername ON sales (CUSTOMERNAME);
CREATE INDEX IF NOT EXISTS idx_productcode ON sales (PRODUCTCODE);
