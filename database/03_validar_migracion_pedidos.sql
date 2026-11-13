-- ==========================================
-- VALIDACIÓN PREVIA A LA MIGRACIÓN DE PEDIDOS
-- Para bases creadas con la versión anterior de 01_schema.sql.
-- ==========================================

USE cutlaquepaque_delivery;

-- Debe devolver CERO filas.
-- Si aparecen resultados, hay detalles que relacionan un pedido
-- con productos de un negocio diferente. Corrige esos casos antes
-- de ejecutar 04_migrar_integridad_pedidos.sql.
SELECT
    dp.id_detalle,
    dp.id_pedido,
    pe.id_negocio AS negocio_del_pedido,
    dp.id_producto,
    pr.id_negocio AS negocio_del_producto
FROM detalle_pedidos dp
INNER JOIN pedidos pe
    ON pe.id_pedido = dp.id_pedido
INNER JOIN productos pr
    ON pr.id_producto = dp.id_producto
WHERE pe.id_negocio <> pr.id_negocio;

-- Resumen: el valor debe ser 0 para continuar.
SELECT COUNT(*) AS detalles_con_negocio_incorrecto
FROM detalle_pedidos dp
INNER JOIN pedidos pe
    ON pe.id_pedido = dp.id_pedido
INNER JOIN productos pr
    ON pr.id_producto = dp.id_producto
WHERE pe.id_negocio <> pr.id_negocio;
