-- CREATE DATABASE delivery_local_nueva
-- CHARACTER SET utf8mb4
-- COLLATE utf8mb4_unicode_ci;

USE delivery_local_nueva;

-- 1. Usuarios: estudiantes que acceden con su código
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    codigo_estudiante VARCHAR(30) NOT NULL,
    nombre VARCHAR(100) NULL,
    correo VARCHAR(160) NULL,
    telefono VARCHAR(25) NULL,
    rol ENUM('estudiante','administrador') NOT NULL DEFAULT 'estudiante',
    fecha_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT uq_usuarios_codigo UNIQUE (codigo_estudiante),
    CONSTRAINT uq_usuarios_correo UNIQUE (correo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2. Vendedores: locales que acceden con teléfono y contraseña
CREATE TABLE vendedores (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NULL,
    telefono VARCHAR(30) NULL,
    password_hash VARCHAR(255) NULL,
    correo VARCHAR(180) NULL,
    fecha_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT uq_vendedores_telefono UNIQUE (telefono),
    INDEX idx_vendedores_nombre (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 3. Negocios
CREATE TABLE negocios (
    id_negocio INT AUTO_INCREMENT PRIMARY KEY,
    id_vendedor INT NULL,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    categoria VARCHAR(80) NULL,
    direccion VARCHAR(300),
    telefono VARCHAR(30),
    horario_atencion TEXT,
    observaciones TEXT,
    logo_url VARCHAR(500) NULL,
    fila_fuente INT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_negocios_nombre UNIQUE (nombre),
    CONSTRAINT uq_negocios_fila_fuente UNIQUE (fila_fuente),
    CONSTRAINT fk_negocios_vendedor FOREIGN KEY (id_vendedor)
        REFERENCES vendedores(id_vendedor)
        ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 4. Categorías
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT uq_categorias_nombre UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 5. Productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_negocio INT NOT NULL,
    id_categoria INT NULL,
    nombre VARCHAR(180) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    disponibilidad_texto TEXT,
    existencias_aproximadas INT NULL,
    existencias_texto TEXT NULL,
    variantes_texto TEXT NULL,
    precios_variantes_texto TEXT NULL,
    tiempo_preparacion_texto VARCHAR(255) NULL,
    imagen_url VARCHAR(500) NULL,
    fila_excel INT NULL,
    CONSTRAINT uq_productos_negocio_producto
        UNIQUE (id_negocio, id_producto),
    CONSTRAINT uq_productos_negocio_fila_excel
        UNIQUE (id_negocio, fila_excel),
    CONSTRAINT fk_productos_negocio FOREIGN KEY (id_negocio)
        REFERENCES negocios(id_negocio)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_productos_categoria FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT chk_productos_precio CHECK (precio >= 0),
    CONSTRAINT chk_productos_existencias
        CHECK (existencias_aproximadas IS NULL OR existencias_aproximadas >= 0),
    INDEX idx_productos_catalogo (id_negocio, disponible, id_categoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 6. Variantes de productos
CREATE TABLE producto_variantes (
    id_variante INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    precio DECIMAL(10,2) NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT uq_producto_variante UNIQUE (id_producto, nombre),
    CONSTRAINT fk_variantes_producto FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT chk_variante_precio CHECK (precio IS NULL OR precio >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 7. Puntos de entrega
CREATE TABLE puntos_entrega (
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


-- 8. Pedidos
CREATE TABLE pedidos (
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
    punto_entrega VARCHAR(200) NOT NULL,
    id_punto_entrega INT NULL,
    observaciones TEXT,
    CONSTRAINT uq_pedidos_pedido_negocio
        UNIQUE (id_pedido, id_negocio),
    CONSTRAINT fk_pedidos_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_pedidos_negocio FOREIGN KEY (id_negocio)
        REFERENCES negocios(id_negocio)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_pedidos_punto_entrega FOREIGN KEY (id_punto_entrega)
        REFERENCES puntos_entrega(id_punto_entrega)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT chk_pedidos_total CHECK (total >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 9. Detalles de pedidos
CREATE TABLE detalle_pedidos (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_negocio INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_detalle_pedido_negocio
        FOREIGN KEY (id_pedido, id_negocio)
        REFERENCES pedidos(id_pedido, id_negocio)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_detalle_producto_negocio
        FOREIGN KEY (id_negocio, id_producto)
        REFERENCES productos(id_negocio, id_producto)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_detalle_cantidad CHECK (cantidad > 0),
    CONSTRAINT chk_detalle_precio CHECK (precio_unitario >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- mostrar tablas
-- USE delivery_local_nueva;
-- SHOW TABLES;