-- Proyecto 04: Uso de HAVING para filtrar resultados agregados
-- Objetivo: Mostrar usuarios que han realizado más de una compra

SELECT users.name, users.country, COUNT(*) AS total_sales
FROM sales
JOIN users ON sales.user_id = users.id
GROUP BY users.name, users.country
HAVING COUNT(*) > 1;
