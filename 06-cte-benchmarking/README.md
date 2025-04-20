# Proyecto 06 – Benchmarking interno con CTE

Este proyecto muestra cómo comparar el gasto medio individual de cada usuario con la media global más una desviación estándar, utilizando un `CTE` y `CROSS JOIN`.

## Objetivo
Identificar usuarios que tienen un gasto medio significativamente superior a la media global.

## Consulta utilizada

```sql
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
