-- ==========================================
-- BASE DE DATOS: CUTLAQUEPAQUE DELIVERY LOCAL
-- Esquema inicial para MySQL 8 / MariaDB
-- ==========================================

CREATE DATABASE IF NOT EXISTS cutlaquepaque_delivery
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE cutlaquepaque_delivery;

-- USUARIOS
CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(120) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    matricula VARCHAR(30) UNIQUE,
    rol ENUM('estudiante', 'administrador') NOT NULL DEFAULT 'estudiante',
    fecha_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- NEGOCIOS
CREATE TABLE IF NOT EXISTS negocios (
    id_negocio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    categoria VARCHAR(50),
    direccion VARCHAR(200),
    telefono VARCHAR(20),
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_negocios_nombre UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- PRODUCTOS
CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_negocio INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT uq_productos_negocio_nombre UNIQUE (id_negocio, nombre),
    CONSTRAINT uq_productos_negocio_producto UNIQUE (id_negocio, id_producto),
    CONSTRAINT fk_productos_negocio
        FOREIGN KEY (id_negocio)
        REFERENCES negocios(id_negocio)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_productos_precio CHECK (precio >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- PEDIDOS
CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_negocio INT NOT NULL,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estado ENUM(
        'pendiente',
        'aceptado',
        'preparando',
        'listo',
        'entregado',
        'cancelado'
    ) NOT NULL DEFAULT 'pendiente',
    punto_entrega VARCHAR(150) NOT NULL,
    observaciones TEXT,
    CONSTRAINT uq_pedidos_pedido_negocio UNIQUE (id_pedido, id_negocio),
    CONSTRAINT fk_pedidos_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_pedidos_negocio
        FOREIGN KEY (id_negocio)
        REFERENCES negocios(id_negocio)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_pedidos_total CHECK (total >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- DETALLE DE PEDIDOS
-- id_negocio permite garantizar que el producto pertenezca
-- al mismo negocio registrado en el pedido.
CREATE TABLE IF NOT EXISTS detalle_pedidos (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_negocio INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_detalle_pedido_negocio
        FOREIGN KEY (id_pedido, id_negocio)
        REFERENCES pedidos(id_pedido, id_negocio)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_detalle_producto_negocio
        FOREIGN KEY (id_negocio, id_producto)
        REFERENCES productos(id_negocio, id_producto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_detalle_cantidad CHECK (cantidad > 0),
    CONSTRAINT chk_detalle_precio CHECK (precio_unitario >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- CONSULTAS DE VERIFICACIÓN (ejecutar manualmente cuando se requiera):
-- SHOW TABLES;
-- DESCRIBE usuarios;
-- DESCRIBE negocios;
-- DESCRIBE productos;
-- DESCRIBE pedidos;
-- DESCRIBE detalle_pedidos;
