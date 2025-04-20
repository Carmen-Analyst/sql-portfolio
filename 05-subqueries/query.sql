-- Proyecto 05: Subquery para comparar promedios de gasto
-- Objetivo: Mostrar usuarios cuyo gasto medio supera la media global

SELECT users.name, AVG(price) AS average_user_spent
FROM sales
JOIN users ON sales.user_id = users.id
GROUP BY users.name
HAVING AVG(price) > (
  SELECT AVG(price)
  FROM sales
);
