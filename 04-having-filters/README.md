# Proyecto 04 – Uso de HAVING para filtrar agregaciones

Este proyecto muestra cómo usar la cláusula `HAVING` para aplicar filtros a resultados que ya han sido agregados mediante `GROUP BY`.

## Objetivo
Mostrar únicamente aquellos usuarios que han realizado más de una compra.

## Consulta utilizada

```sql
SELECT users.name, users.country, COUNT(*) AS total_sales
FROM sales
JOIN users ON sales.user_id = users.id
GROUP BY users.name, users.country
HAVING COUNT(*) > 1;
