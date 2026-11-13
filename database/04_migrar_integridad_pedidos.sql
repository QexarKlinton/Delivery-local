-- ==========================================
-- MIGRACIÓN: VALIDAR QUE CADA DETALLE PERTENEZCA
-- AL MISMO NEGOCIO QUE SU PEDIDO.
--
-- Ejecutar SOLO en una base creada con el esquema anterior.
-- Antes, ejecutar 03_validar_migracion_pedidos.sql y confirmar 0.
-- Esta migración se ejecuta una sola vez.
-- ==========================================

USE cutlaquepaque_delivery;

-- Índices únicos compuestos requeridos por las nuevas claves foráneas.
ALTER TABLE productos
    ADD CONSTRAINT uq_productos_negocio_producto
    UNIQUE (id_negocio, id_producto);

ALTER TABLE pedidos
    ADD CONSTRAINT uq_pedidos_pedido_negocio
    UNIQUE (id_pedido, id_negocio);

-- Guarda el negocio del pedido en cada detalle.
ALTER TABLE detalle_pedidos
    ADD COLUMN id_negocio INT NULL AFTER id_pedido;

UPDATE detalle_pedidos dp
INNER JOIN pedidos pe
    ON pe.id_pedido = dp.id_pedido
SET dp.id_negocio = pe.id_negocio;

ALTER TABLE detalle_pedidos
    MODIFY id_negocio INT NOT NULL;

-- Elimina las claves foráneas anteriores de detalle_pedidos hacia
-- pedidos y productos, sin depender de los nombres automáticos de MySQL.
SET @foreign_keys_to_drop = (
    SELECT GROUP_CONCAT(
        DISTINCT CONCAT('DROP FOREIGN KEY `', CONSTRAINT_NAME, '`')
        SEPARATOR ', '
    )
    FROM information_schema.KEY_COLUMN_USAGE
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'detalle_pedidos'
      AND REFERENCED_TABLE_NAME IN ('pedidos', 'productos')
);

SET @migration_sql = IF(
    @foreign_keys_to_drop IS NULL,
    'SELECT 1',
    CONCAT('ALTER TABLE detalle_pedidos ', @foreign_keys_to_drop)
);

PREPARE migration_statement FROM @migration_sql;
EXECUTE migration_statement;
DEALLOCATE PREPARE migration_statement;

-- Las nuevas claves compuestas impiden mezclar productos de negocios distintos.
ALTER TABLE detalle_pedidos
    ADD CONSTRAINT fk_detalle_pedido_negocio
        FOREIGN KEY (id_pedido, id_negocio)
        REFERENCES pedidos(id_pedido, id_negocio)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    ADD CONSTRAINT fk_detalle_producto_negocio
        FOREIGN KEY (id_negocio, id_producto)
        REFERENCES productos(id_negocio, id_producto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT;

-- Verificación final: debe devolver 0.
SELECT COUNT(*) AS relaciones_invalidas
FROM detalle_pedidos dp
INNER JOIN pedidos pe
    ON pe.id_pedido = dp.id_pedido
INNER JOIN productos pr
    ON pr.id_producto = dp.id_producto
WHERE dp.id_negocio <> pe.id_negocio
   OR dp.id_negocio <> pr.id_negocio;
