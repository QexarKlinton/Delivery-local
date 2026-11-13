USE delivery_local_nueva;

START TRANSACTION;

-- 1. REGISTRAR LOS 6 VENDEDORES
INSERT INTO vendedores (
    nombre,
    telefono,
    password_hash,
    correo
) VALUES
('Luis Martínez', '33 1398 3400', NULL, 'contacto.laesquinadelsazon@gmail.com'),
('LALO', '33 3915 9270.', NULL, 'No disponible'),
('Jose Luis', '33 33552951.', NULL, 'MAKITOSGSHIGDL.COM.MX'),
('lizzeth', '3318830325', NULL, 'no disponible'),
('Miguel Hernandez', '33 1972 2004.', NULL, 'no disponible'),
('Samantha Velazquez', '33 2947 8384.', NULL, 'paletasdani12gmail.com');


-- 2. REGISTRAR LAS 17 CATEGORÍAS
INSERT INTO categorias (nombre) VALUES
('COMIDA'),
('BEBIDAS'),
('POSTRE'),
('pizzas'),
('entradas'),
('ensalada'),
('Hot Dog'),
('lonches'),
('hamburguesas'),
('snacks'),
('refresco y agua'),
('Paletas de Agua'),
('Paletas de Leche'),
('Aguas Frescas'),
('Nieves / Helados'),
('Sandwich / Helados'),
('Bebidas Preparadas / Frappuccinos');


-- 3. REGISTRAR LOS 6 NEGOCIOS DEL ARCHIVO EXCEL
INSERT INTO negocios (
    id_vendedor,
    nombre,
    telefono,
    fila_fuente,
    activo
) VALUES
(
    (SELECT id_vendedor FROM vendedores
     WHERE telefono = '33 1398 3400'),
    'La Esquina del Sazón',
    '33 1398 3400',
    2,
    TRUE
),
(
    (SELECT id_vendedor FROM vendedores
     WHERE telefono = '33 3915 9270.'),
    'Mariscos Lalo''S 1.',
    '33 3915 9270.',
    17,
    TRUE
),
(
    (SELECT id_vendedor FROM vendedores
     WHERE telefono = '33 33552951.'),
    'Makito sushi.',
    '33 33552951.',
    35,
    TRUE
),
(
    (SELECT id_vendedor FROM vendedores
     WHERE telefono = '3318830325'),
    'MERAKI RESTAURANT PIZZERIA',
    '3318830325',
    46,
    TRUE
),
(
    (SELECT id_vendedor FROM vendedores
     WHERE telefono = '33 1972 2004.'),
    'Peinecillo''s Gril.',
    '33 1972 2004.',
    55,
    TRUE
),
(
    (SELECT id_vendedor FROM vendedores
     WHERE telefono = '33 2947 8384.'),
    'Paleteria Dani.',
    '33 2947 8384.',
    65,
    TRUE
);


-- 4. AGREGAR LOS 5 NEGOCIOS DE LA BASE ANTERIOR
INSERT INTO negocios (
    id_vendedor,
    nombre,
    activo
) VALUES
(NULL, 'Tamales Mary', TRUE),
(NULL, 'Tacos Beny', TRUE),
(NULL, 'Fonda de Lety', TRUE),
(NULL, 'Lonches Mario', TRUE),
(NULL, 'Aguas Frescas La Michoacana', TRUE);


COMMIT;


-- 5. COMPROBAR LOS REGISTROS
SELECT COUNT(*) AS total_vendedores FROM vendedores;

SELECT COUNT(*) AS total_categorias FROM categorias;

SELECT COUNT(*) AS total_negocios FROM negocios;

SELECT id_negocio, nombre, id_vendedor
FROM negocios
ORDER BY id_negocio;