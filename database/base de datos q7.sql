USE delivery_local_nueva;

INSERT INTO producto_variantes (
    id_producto,
    nombre,
    precio,
    disponible
)
SELECT
    p.id_producto,
    x.variante,
    x.precio,
    TRUE
FROM (
    SELECT 'Alitas' AS producto, 'Búfalo' AS variante, 195.00 AS precio
    UNION ALL SELECT 'Alitas', 'BBQ', 195.00
    UNION ALL SELECT 'Alitas', 'Mango Habanero', 195.00
    UNION ALL SELECT 'Jugo Boing', 'Manzana', 20.00
    UNION ALL SELECT 'Jugo Boing', 'Mango', 20.00
    UNION ALL SELECT 'Jugo Boing', 'Guayaba', 20.00
    UNION ALL SELECT 'Jugo Boing', 'Uva', 20.00
) AS x
INNER JOIN negocios n
    ON n.nombre = 'MERAKI RESTAURANT PIZZERIA'
INNER JOIN productos p
    ON p.id_negocio = n.id_negocio
    AND p.nombre = x.producto
WHERE NOT EXISTS (
    SELECT 1
    FROM producto_variantes v
    WHERE v.id_producto = p.id_producto
      AND v.nombre = x.variante
);