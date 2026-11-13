-- ==============================================================
-- MIGRACION 05: AMPLIAR CATALOGO PARA IMPORTAR menu_completoo.xlsx
-- Ejecutar una sola vez despues de 04_migrar_integridad_pedidos.sql
-- No elimina negocios, productos ni pedidos existentes.
-- ==============================================================
USE cutlaquepaque_delivery;

CREATE TABLE IF NOT EXISTS vendedores (
  id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  telefono VARCHAR(30),
  correo VARCHAR(180),
  fecha_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  INDEX idx_vendedores_nombre (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS categorias (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT uq_categorias_nombre UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS producto_variantes (
  id_variante INT AUTO_INCREMENT PRIMARY KEY,
  id_producto INT NOT NULL,
  nombre VARCHAR(150) NOT NULL,
  precio DECIMAL(10,2) NULL,
  disponible BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT uq_producto_variante UNIQUE (id_producto,nombre),
  CONSTRAINT fk_variantes_producto FOREIGN KEY (id_producto)
    REFERENCES productos(id_producto) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT chk_variante_precio CHECK (precio IS NULL OR precio >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS puntos_entrega (
  id_punto_entrega INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(180) NOT NULL,
  tipo VARCHAR(30) NOT NULL,
  edificio VARCHAR(120) NOT NULL DEFAULT 'CUTlaquepaque',
  referencia TEXT NULL,
  descripcion TEXT NULL,
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  orden INT NOT NULL,
  CONSTRAINT uq_puntos_entrega_nombre UNIQUE (nombre),
  CONSTRAINT uq_puntos_entrega_orden UNIQUE (orden)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Columnas nuevas en negocios (la consulta comprueba si ya existen).

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='negocios' AND COLUMN_NAME='id_vendedor')=0, 'ALTER TABLE negocios ADD COLUMN id_vendedor INT NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='negocios' AND COLUMN_NAME='horario_atencion')=0, 'ALTER TABLE negocios ADD COLUMN horario_atencion TEXT NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='negocios' AND COLUMN_NAME='observaciones')=0, 'ALTER TABLE negocios ADD COLUMN observaciones TEXT NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='negocios' AND COLUMN_NAME='logo_url')=0, 'ALTER TABLE negocios ADD COLUMN logo_url VARCHAR(500) NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='negocios' AND COLUMN_NAME='fila_fuente')=0, 'ALTER TABLE negocios ADD COLUMN fila_fuente INT NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='productos' AND COLUMN_NAME='id_categoria')=0, 'ALTER TABLE productos ADD COLUMN id_categoria INT NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='productos' AND COLUMN_NAME='disponibilidad_texto')=0, 'ALTER TABLE productos ADD COLUMN disponibilidad_texto TEXT NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='productos' AND COLUMN_NAME='existencias_aproximadas')=0, 'ALTER TABLE productos ADD COLUMN existencias_aproximadas INT NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='productos' AND COLUMN_NAME='existencias_texto')=0, 'ALTER TABLE productos ADD COLUMN existencias_texto TEXT NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='productos' AND COLUMN_NAME='variantes_texto')=0, 'ALTER TABLE productos ADD COLUMN variantes_texto TEXT NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='productos' AND COLUMN_NAME='precios_variantes_texto')=0, 'ALTER TABLE productos ADD COLUMN precios_variantes_texto TEXT NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='productos' AND COLUMN_NAME='tiempo_preparacion_texto')=0, 'ALTER TABLE productos ADD COLUMN tiempo_preparacion_texto VARCHAR(255) NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='productos' AND COLUMN_NAME='imagen_url')=0, 'ALTER TABLE productos ADD COLUMN imagen_url VARCHAR(500) NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='productos' AND COLUMN_NAME='fila_excel')=0, 'ALTER TABLE productos ADD COLUMN fila_excel INT NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- El rol vendedor queda disponible para futuras cuentas de responsables.
ALTER TABLE usuarios MODIFY COLUMN rol ENUM('estudiante','administrador','vendedor') NOT NULL DEFAULT 'estudiante';

-- Permitir productos repetidos con el mismo nombre cuando son filas distintas del Excel.
SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='productos' AND INDEX_NAME='uq_productos_negocio_nombre')>0, 'ALTER TABLE productos DROP INDEX uq_productos_negocio_nombre', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='productos' AND INDEX_NAME='uq_productos_negocio_fila_excel')=0, 'ALTER TABLE productos ADD UNIQUE KEY uq_productos_negocio_fila_excel (id_negocio,fila_excel)', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='negocios' AND INDEX_NAME='uq_negocios_fila_fuente')=0, 'ALTER TABLE negocios ADD UNIQUE KEY uq_negocios_fila_fuente (fila_fuente)', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA=DATABASE() AND TABLE_NAME='negocios' AND CONSTRAINT_NAME='fk_negocios_vendedor')=0, 'ALTER TABLE negocios ADD CONSTRAINT fk_negocios_vendedor FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor) ON UPDATE CASCADE ON DELETE SET NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA=DATABASE() AND TABLE_NAME='productos' AND CONSTRAINT_NAME='fk_productos_categoria')=0, 'ALTER TABLE productos ADD CONSTRAINT fk_productos_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) ON UPDATE CASCADE ON DELETE SET NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- Relaciona pedidos con uno de los 21 puntos institucionales.
SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='pedidos' AND COLUMN_NAME='id_punto_entrega')=0, 'ALTER TABLE pedidos ADD COLUMN id_punto_entrega INT NULL AFTER punto_entrega', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ddl = IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA=DATABASE() AND TABLE_NAME='pedidos' AND CONSTRAINT_NAME='fk_pedidos_punto_entrega')=0, 'ALTER TABLE pedidos ADD CONSTRAINT fk_pedidos_punto_entrega FOREIGN KEY (id_punto_entrega) REFERENCES puntos_entrega(id_punto_entrega) ON UPDATE CASCADE ON DELETE SET NULL', 'SELECT 1');
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- La migración solo amplía la estructura; los datos se importan con 02_datos_iniciales.sql.
