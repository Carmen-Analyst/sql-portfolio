-- Proyecto 07: Benchmarking por país con CTE
-- Objetivo: Comparar el gasto medio por usuario con la media global, mostrando también el país

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
