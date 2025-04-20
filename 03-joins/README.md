# Proyecto 03 – JOIN entre tablas

Este proyecto muestra cómo unir dos tablas (`sales` y `users`) usando `JOIN` para combinar datos relacionales y calcular el total gastado por cada usuario.

## Objetivo
Obtener el nombre de cada usuario y el total que ha gastado en todas sus compras.

## Consulta utilizada

```sql
SELECT users.name, SUM(sales.price) AS total_spent
FROM sales
JOIN users ON sales.user_id = users.id
GROUP BY users.name;
