-- Identificar TODOS los productos con pérdidas
SELECT 
    Category,
    `Sub-Category`,
    SUM(Amount) AS ventas_totales,
    SUM(Profit) AS profit_total,
    ROUND(SUM(Profit) / SUM(Amount) * 100, 2) AS margen_pct,
    SUM(Quantity) AS unidades_vendidas
FROM order_details
GROUP BY Category, `Sub-Category`
HAVING profit_total < 0  -- Solo los que pierden dinero
ORDER BY profit_total ASC;




-- ¿Cuándo vendimos Sarees y siempre perdimos dinero?
SELECT 
    DATE_FORMAT(o.`Order Date`, '%Y-%m') AS mes,
    COUNT(DISTINCT o.`Order ID`) AS pedidos,
    SUM(od.Amount) AS ventas,
    SUM(od.Profit) AS profit,
    ROUND(SUM(od.Profit) / SUM(od.Amount) * 100, 2) AS margen_pct
FROM orders o
JOIN order_details od ON o.`Order ID` = od.`Order ID`
WHERE od.`Sub-Category` = 'Saree'
GROUP BY mes
ORDER BY mes;



