-- CANTIDAD DE PEDIDOS TOTAL

SELECT COUNT(*) AS total_orders       
FROM orders;

-- CANTIDAD DE REGISTROS DETALLADOS

SELECT COUNT(*) AS total_order_details
FROM order_details;

-- CANTIDAD DE REGISTROS DE TARGETS

SELECT COUNT(*) AS total_targets
FROM sales_target;


-- KPIs GENERALES 

SELECT 
SUM(Amount) AS total_sales,
SUM(Profit) AS total_profit,
SUM(Quantity) AS total_units_sold,
COUNT(DISTINCT `Order ID`) AS total_orders,
SUM(profit) / COUNT(DISTINCT `Order ID`) AS avg_profit_per_order
FROM order_details;

-- MIRADA MENSUAL DE VENTAS 
SELECT
    DATE_FORMAT(o.`Order Date`, '%Y-%m') AS order_month,
    SUM(od.amount) AS total_sales,
    SUM(od.profit) AS total_profit
FROM orders o
JOIN order_details od 
    ON o.`Order ID` = od.`Order ID`
GROUP BY order_month
ORDER BY order_month;


-- VENTAS POR CATEGORIA

SELECT 
Category,
SUM(Amount) AS total_sales,
SUM(Profit) AS total_profit,
SUM(Quantity) AS total_units
FROM order_details
GROUP BY Category
ORDER BY total_sales DESC;

-- PRIMER CHEQUEO DE RENTABILIDAD

SELECT
    category,
    SUM(amount) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(amount), 0) * 100, 2) AS profit_margin_pct
FROM order_details
GROUP BY category
ORDER BY profit_margin_pct;








