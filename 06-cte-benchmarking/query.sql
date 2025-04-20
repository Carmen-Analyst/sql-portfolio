-- Proyecto 06: Benchmarking interno con CTE y CROSS JOIN
-- Objetivo: Mostrar usuarios cuyo gasto medio está por encima de la media global + 1 desviación estándar

WITH stats_global AS (
  SELECT AVG(price) AS avg_global, STDDEV(price) AS stddev_price
  FROM sales
)

SELECT 
  users.name,
  AVG(sales.price) AS avg_user_spent,
  ((AVG(sales.price) - sg.avg_global) / sg.avg_global) * 100 AS percent_difference
FROM sales
JOIN users ON sales.user_id = users.id
CROSS JOIN stats_global AS sg
GROUP BY users.name, sg.avg_global;
