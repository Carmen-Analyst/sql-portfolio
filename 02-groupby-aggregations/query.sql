-- Proyecto 02: Uso de GROUP BY y funciones agregadas
-- Objetivo: Contar cuántos coches hay por marca

SELECT brand, COUNT(*) AS total_cars
FROM cars
GROUP BY brand;
