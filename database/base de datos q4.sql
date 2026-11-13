USE delivery_local_nueva;

START TRANSACTION;

-- Crear la categoría Tamales si todavía no existe
INSERT INTO categorias (nombre)
SELECT 'Tamales'
WHERE NOT EXISTS (
    SELECT 1 FROM categorias WHERE nombre = 'Tamales'
);

-- Agregar los productos de Tamales Mary
INSERT INTO productos (
    id_negocio,
    id_categoria,
    nombre,
    descripcion,
    precio,
    disponible
)
VALUES
(
    (SELECT id_negocio FROM negocios WHERE nombre = 'Tamales Mary'),
    (SELECT id_categoria FROM categorias WHERE nombre = 'Tamales'),
    'Tamal verde',
    'Tamal de salsa verde con cerdo',
    18.00,
    TRUE
),
(
    (SELECT id_negocio FROM negocios WHERE nombre = 'Tamales Mary'),
    (SELECT id_categoria FROM categorias WHERE nombre = 'Tamales'),
    'Tamal rojo',
    'Tamal de salsa roja con pollo',
    18.00,
    TRUE
),
(
    (SELECT id_negocio FROM negocios WHERE nombre = 'Tamales Mary'),
    (SELECT id_categoria FROM categorias WHERE nombre = 'Tamales'),
    'Tamal de rajas',
    'Tamal de rajas con queso',
    18.00,
    TRUE
),
(
    (SELECT id_negocio FROM negocios WHERE nombre = 'Tamales Mary'),
    (SELECT id_categoria FROM categorias WHERE nombre = 'Tamales'),
    'Tamal dulce',
    'Tamal dulce de piña con pasas',
    16.00,
    TRUE
),
(
    (SELECT id_negocio FROM negocios WHERE nombre = 'Tamales Mary'),
    (SELECT id_categoria FROM categorias WHERE nombre = 'Tamales'),
    'Tamal de elote',
    'Tamal dulce de elote tierno',
    20.00,
    TRUE
),
(
    (SELECT id_negocio FROM negocios WHERE nombre = 'Tamales Mary'),
    (SELECT id_categoria FROM categorias WHERE nombre = 'BEBIDAS'),
    'Atole de champurrado',
    'Atole tradicional de chocolate',
    22.00,
    TRUE
);

COMMIT;

-- Verificar los productos registrados
SELECT
    n.nombre AS negocio,
    p.nombre AS producto,
    p.descripcion,
    p.precio
FROM productos p
INNER JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'Tamales Mary';




USE delivery_local_nueva;

SELECT
    n.nombre AS negocio,
    COUNT(p.id_producto) AS total_productos
FROM negocios n
LEFT JOIN productos p
    ON n.id_negocio = p.id_negocio
GROUP BY n.id_negocio, n.nombre
ORDER BY n.id_negocio;




SELECT
    n.nombre AS negocio,
    COUNT(p.id_producto) AS total_productos
FROM negocios n
LEFT JOIN productos p
    ON n.id_negocio = p.id_negocio
GROUP BY n.id_negocio, n.nombre
ORDER BY n.id_negocio;