# Proyecto 02 – Uso de GROUP BY y funciones agregadas

Este proyecto muestra cómo utilizar `GROUP BY` junto a funciones agregadas como `COUNT()` para agrupar datos.

## Objetivo
Contar cuántos coches hay de cada marca en la base de datos ficticia `cars`.

## Consulta utilizada

```sql
SELECT brand, COUNT(*) AS total_cars
FROM cars
GROUP BY brand;
