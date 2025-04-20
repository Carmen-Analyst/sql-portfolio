# Proyecto 07 – Benchmarking por país con CTE

Este proyecto extiende el análisis de benchmarking comparando el gasto medio individual de cada usuario con la media global, incluyendo además el país de origen de cada usuario.

## Objetivo
Detectar patrones de gasto significativos por país, comparando cada usuario con la media global y calculando la diferencia porcentual.

## Consulta utilizada

```sql
WITH stats_global AS (
  SELECT AVG(price) AS avg_global, STDDEV(price) AS stddev_price
  FROM sales
)

SELECT 
  users.country,
  users.name,
  AVG(sales.price) AS average_user_spent,
  sg.avg_global,
  sg.stddev_price,
  ((AVG(sales.price) - sg.avg_global) / sg.avg_global) * 100 AS percent_difference
FROM sales
JOIN users ON sales.user_id = users.id
CROSS JOIN stats_global AS sg
GROUP BY users.country, users.name, sg.avg_global, sg.stddev_price;
