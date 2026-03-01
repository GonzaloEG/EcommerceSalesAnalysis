--  Producto Problemático de Junio 2018
SELECT 
    Category,
    `Sub-Category`,
    SUM(Amount) AS ventas,
    SUM(Profit) AS profit,
    ROUND(SUM(Profit) / SUM(Amount) * 100, 2) AS margen_pct
FROM order_details od
JOIN orders o ON od.`Order ID` = o.`Order ID`
WHERE DATE_FORMAT(o.`Order Date`, '%Y-%m') = '2018-06'
GROUP BY Category, `Sub-Category`
ORDER BY profit ASC;  -- Los peores primero

-- Comparación de productos en las fechas NOVIEMBRE 2018 VS ENERO 2019
SELECT 
    DATE_FORMAT(o.`Order Date`, '%Y-%m') AS mes,
    Category,
    SUM(Amount) AS ventas,
    SUM(Profit) AS profit,
    ROUND(SUM(Profit) / SUM(Amount) * 100, 2) AS margen_pct,
    SUM(Quantity) AS unidades
FROM order_details od
JOIN orders o ON od.`Order ID` = o.`Order ID`
WHERE DATE_FORMAT(o.`Order Date`, '%Y-%m') IN ('2018-11', '2019-01')
GROUP BY mes, Category
ORDER BY mes, ventas DESC;


-- Top 10 ciudades por ventas en enero 2019
SELECT 
    State,
    City,
    COUNT(DISTINCT o.`Order ID`) AS cant_pedidos,
    SUM(Amount) AS ventas,
    SUM(Profit) AS profit
FROM orders o
JOIN order_details od ON o.`Order ID` = od.`Order ID`
WHERE DATE_FORMAT(o.`Order Date`, '%Y-%m') = '2019-01'
GROUP BY State, City
ORDER BY ventas DESC
LIMIT 10;
