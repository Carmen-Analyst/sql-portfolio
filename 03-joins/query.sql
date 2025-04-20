-- Proyecto 03: Uso de JOIN para combinar datos de dos tablas
-- Objetivo: Mostrar el nombre de usuario y el total gastado

SELECT users.name, SUM(sales.price) AS total_spent
FROM sales
JOIN users ON sales.user_id = users.id
GROUP BY users.name;
