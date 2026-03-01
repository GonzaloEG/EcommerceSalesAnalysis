-- Resumen sin sumar targets 
SELECT 
    od.Category,
    COUNT(DISTINCT DATE_FORMAT(o.`Order Date`, '%Y-%m')) AS meses_analizados,
    SUM(od.Amount) AS ventas_totales,
    SUM(od.Profit) AS profit_total,
    ROUND(SUM(od.Profit) / SUM(od.Amount) * 100, 2) AS margen_pct
FROM orders o
JOIN order_details od ON o.`Order ID` = od.`Order ID`
GROUP BY od.Category
ORDER BY ventas_totales DESC;