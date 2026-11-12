
-- ==========================================
-- BASE DE DATOS: CUTLAQUEPAQUE DELIVERY LOCAL
-- ==========================================

CREATE DATABASE IF NOT EXISTS cutlaquepaque_delivery;

USE cutlaquepaque_delivery;

-- USUARIOS
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(120) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    telefono VARCHAR(15),
    matricula VARCHAR(30) UNIQUE,
    rol ENUM('estudiante', 'administrador')
        DEFAULT 'estudiante',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE
);

-- NEGOCIOS
CREATE TABLE negocios (
    id_negocio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    categoria VARCHAR(50),
    direccion VARCHAR(200),
    telefono VARCHAR(15),
    activo BOOLEAN DEFAULT TRUE,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- PRODUCTOS
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_negocio INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,

    FOREIGN KEY (id_negocio)
        REFERENCES negocios(id_negocio),

    CHECK (precio >= 0)
);



-- PEDIDOS

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_negocio INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL DEFAULT 0.00,

    estado ENUM(
        'pendiente',
        'aceptado',
        'preparando',
        'listo',
        'entregado',
        'cancelado'
    ) DEFAULT 'pendiente',

    punto_entrega VARCHAR(150)
        DEFAULT 'Entrada principal del Cutlaquepaque',

    observaciones TEXT,

    FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario),

    FOREIGN KEY (id_negocio)
        REFERENCES negocios(id_negocio),

    CHECK (total >= 0)
);

-- DETALLE DE PEDIDOS
CREATE TABLE detalle_pedidos (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido),

    FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto),

    CHECK (cantidad > 0),
    CHECK (precio_unitario >= 0)
);
-- TEST 1
USE cutlaquepaque_delivery;
SHOW TABLES;
-- TEST 2 
SELECT * FROM negocios;
-- TEST 3
SELECT
    n.nombre AS negocio,
    p.nombre AS producto,
    p.precio
FROM productos p
INNER JOIN negocios n
    ON p.id_negocio = n.id_negocio;

-- TEST 4
DESCRIBE usuarios;
DESCRIBE negocios;
DESCRIBE productos;
DESCRIBE pedidos;
DESCRIBE detalle_pedidos;
