
 # Proyecto 05 – Subquery para análisis comparativo

Este proyecto muestra cómo usar una subconsulta dentro de `HAVING` para comparar el promedio de cada usuario con la media global de todos los usuarios.

## Objetivo
Detectar qué usuarios tienen un gasto medio superior al promedio general.

## Consulta utilizada

```sql
SELECT users.name, AVG(price) AS average_user_spent
FROM sales
JOIN users ON sales.user_id = users.id
GROUP BY users.name
HAVING AVG(price) > (
  SELECT AVG(price)
  FROM sales
);
