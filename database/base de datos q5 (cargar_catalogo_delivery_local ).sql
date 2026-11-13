-- Carga de 73 productos desde negocios_productos.csv
-- Base de datos: delivery_local_nueva
-- No elimina ni modifica productos existentes.
-- Tamales Mary no se duplica; sus 6 productos ya están registrados.
-- Las variantes estructuradas de La Esquina del Sazón se insertan en producto_variantes.
-- Las demás variantes quedan conservadas en variantes_texto/precios_variantes_texto.

USE delivery_local_nueva;
START TRANSACTION;

-- Fila 2: La Esquina del Sazón / PELLIZCADA
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'PELLIZCADA', 'Base de masa tradicional doradita al comal, con frijoles, salsa, queso y guiso a elegir.', 27.00, TRUE,
    'DISPONIBLE', 0, '0',
    'Sencilla / Con carne', '$25 / $40 |', '5 a 8 minutos',
    NULL, 2
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'La Esquina del Sazón'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 2);

-- Fila 3: La Esquina del Sazón / HUARACHE
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'HUARACHE', 'Base ovalada de masa suave cubierta con frijoles, cebolla, cilantro, queso y tu guiso favorito.', 75.00, TRUE,
    'DISPONIBLE', 12, '12',
    'Sencillo / Con carne', '$35 / $55 |', '5 a 8 minutos',
    NULL, 3
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'La Esquina del Sazón'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 3);

-- Fila 4: La Esquina del Sazón / TACOS
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'TACOS', 'Tortilla calientita bien servida con carne a elegir, acompañada de cebolla y cilantro fresco.', 22.00, TRUE,
    'DISPONIBLE', 30, '30',
    'Tortilla de maíz / Tortilla de harina', '$18 / $22 |', '6 a 8 minutos',
    NULL, 4
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'La Esquina del Sazón'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 4);

-- Fila 5: La Esquina del Sazón / PELLIZCADA JUMBO
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'PELLIZCADA JUMBO', 'Nuestra clásica base de masa doradita al comal, pero en tamaño extragrande.', 75.00, TRUE,
    'DISPONIBLE', 15, '15',
    'Sencilla / Con carne', '$45 / $65 |', '7 a 8 minutos',
    NULL, 5
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'La Esquina del Sazón'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 5);

-- Fila 6: La Esquina del Sazón / QUESADILLAS CON CARNE
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'QUESADILLAS CON CARNE', 'Tortilla doblada con delicioso queso fundido y el guiso de tu preferencia.', 25.00, TRUE,
    'DISPONIBLE', 50, '50',
    'Tortilla de maíz / Tortilla de harina', '$30 / $35 |', '5 a 8 minutos',
    NULL, 6
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'La Esquina del Sazón'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 6);

-- Fila 7: La Esquina del Sazón / QUESADILLA SENCILLA
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'QUESADILLA SENCILLA', 'Tortilla calientita rellena únicamente de abundante queso fundido.', 22.00, TRUE,
    'DISPONIBLE', 100, '100',
    'Tortilla de maíz / Tortilla de harina', '$20 / $25 |', '9 a 8 minutos',
    NULL, 7
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'La Esquina del Sazón'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 7);

-- Fila 8: La Esquina del Sazón / PELLIZCADA DE BISTEC
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'PELLIZCADA DE BISTEC', 'Base de masa doradita al comal, servida con frijoles, salsa, queso y jugoso bistec.', 35.00, TRUE,
    'DISPONIBLE', 25, '25',
    'Queso normal / Extra queso', '$40 / $50 |', '5 a 8 minutos',
    NULL, 8
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'La Esquina del Sazón'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 8);

-- Fila 9: La Esquina del Sazón / HUARACHE DE BISTEC
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'HUARACHE DE BISTEC', 'Base ovalada de masa cubierta con frijoles, queso, vegetales frescos y bistec.', 90.00, TRUE,
    'DISPONIBLE', 20, '20',
    'Queso normal / Extra queso', '$55 / $65 |', '5 a 8 minutos',
    NULL, 9
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'La Esquina del Sazón'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 9);

-- Fila 10: La Esquina del Sazón / TACOS DE BISTEC
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'TACOS DE BISTEC', 'Tortilla de maíz calientita con jugoso bistec picado, cebolla y cilantro.', 30.00, FALSE,
    'NO DISPONIBLE', 22, '22',
    'Tortilla de maíz / Tortilla de harina', '$22 / $26 |', '5 a 8 minutos',
    NULL, 10
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'La Esquina del Sazón'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 10);

-- Fila 11: La Esquina del Sazón / QUESADILLA DE BISTEC
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'QUESADILLA DE BISTEC', 'Tortilla doblada con deliciosa combinación de queso fundido y bistec a la plancha.', 35.00, TRUE,
    'DISPONIBLE', 75, '75',
    'Tortilla de maíz / Tortilla de harina', '$35 / $40 |', '5 a 8 minutos',
    NULL, 11
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'La Esquina del Sazón'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 11);

-- Fila 12: La Esquina del Sazón / PELLIZCADA JUMBO DE BISTEC
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'PELLIZCADA JUMBO DE BISTEC', 'Tamaño extragrande de nuestra base de masa, coronada con bistec jugoso y queso.', 90.00, TRUE,
    'DISPONIBLE', 40, '40',
    'Orden de 4 / Orden de 5', '$65 / $75 |', '5 a 8 minutos',
    NULL, 12
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'La Esquina del Sazón'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 12);

-- Fila 13: La Esquina del Sazón / ENCHILADAS VERDE RELLENAS DE POLLO
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'ENCHILADAS VERDE RELLENAS DE POLLO', '4 deliciosas tortillas rellenas de pollo, bañadas en salsa verde casera, crema y queso.', 85.00, FALSE,
    'NO DISPONIBLE', 45, '45',
    'Orden de 4 / Orden de 5', '$70 / $85 |', '5 a 8 minutos',
    NULL, 13
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'La Esquina del Sazón'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 13);

-- Fila 14: La Esquina del Sazón / ENCHILADAS VERDES RELLENAS DE POLLO + PASTOR
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'ENCHILADAS VERDES RELLENAS DE POLLO + PASTOR', 'Nuestras tradicionales enchiladas verdes de pollo, coronadas con sabrosa carne al pastor.', 95.00, TRUE,
    'DISPONIBLE', 65, '65',
    'Orden de 4 / Orden de 5', '$90 / $110 |', '5 a 8 minutos',
    NULL, 14
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'La Esquina del Sazón'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 14);

-- Fila 15: La Esquina del Sazón / AGUA FRESCA 1/2
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'AGUA FRESCA 1/2', 'Refrescante bebida de fruta natural en presentación grande, ideal para acompañar tus alimentos.', 35.00, TRUE,
    'DISPONIBLE', 43, '43',
    'Horchata / Jamaica', '$20 / $20 |', '5 a 8 minutos',
    NULL, 15
FROM negocios n
JOIN categorias c ON c.nombre = 'BEBIDAS'
WHERE n.nombre = 'La Esquina del Sazón'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 15);

-- Fila 16: La Esquina del Sazón / AGUA FRESCA 1L
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'AGUA FRESCA 1L', 'Bebida fresca de fruta natural del día en tamaño individual.
Recuerda aplicar el botón de "Ajustar texto" en esa columna para que se acomoden como pequeños párrafos dentro de su cuadro.', 25.00, TRUE,
    'DISPONIBLE', 29, '29',
    'Horchata / Jamaica', '| $35 / $35 |', '5 a 8 minutos',
    NULL, 16
FROM negocios n
JOIN categorias c ON c.nombre = 'BEBIDAS'
WHERE n.nombre = 'La Esquina del Sazón'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 16);

-- Fila 17: Mariscos Lalo'S 1. / Levanta Muertos
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Levanta Muertos', 'Especialidad de la casa que combina una variedad de mariscos frescos (camarón, pulpo, ostión) servidos en un potente caldo preparado con especias picantes, ideal para revivir el ánimo.', 200.00, TRUE,
    'DISPONIBLE', 25, '25',
    'variante', '$200', '20 minutos',
    NULL, 17
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 17);

-- Fila 18: Mariscos Lalo'S 1. / Molcajete de Mariscos
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Molcajete de Mariscos', 'Deliciosa combinación de mariscos surtidos servidos en un molcajete de piedra volcánica con salsa especial de la casa, aguacate y verduras frescas.', 180.00, TRUE,
    'DISPONIBLE', 24, '24',
    'variante', '$180', '20 minutos',
    NULL, 18
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 18);

-- Fila 19: Mariscos Lalo'S 1. / Camarones Aguachile
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Camarones Aguachile', 'Camarones frescos curtidos en jugo de limón recién exprimido, acompañados de pepino, cebolla morada y bañados en la salsa picante de tu elección.', 135.00, TRUE,
    'DISPONIBLE', 25, '25',
    'variante', '$135', '20 minutos',
    NULL, 19
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 19);

-- Fila 20: Mariscos Lalo'S 1. / P1 Variantes: Verde, Rojo,
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'P1 Variantes: Verde, Rojo,', 'Camarones empanizados con un crujiente rebozado dorado, fritos a la perfección y servidos acompañados de ensalada.', 135.00, TRUE,
    'DISPONIBLE', 26, '26',
    'variante', '$135', '20 minutos',
    NULL, 20
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 20);

-- Fila 21: Mariscos Lalo'S 1. / Camarón al Gusto
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Camarón al Gusto', 'Camarones o filete salteados en una suculenta salsa a base de mantequilla dorada y trocitos de ajo perfumado.', 145.00, TRUE,
    'DISPONIBLE', 23, '23',
    'variante', '$145', '20 minutos',
    NULL, 21
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 21);

-- Fila 22: Mariscos Lalo'S 1. / Empanizados
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Empanizados', 'Camarones empanizados con un crujiente rebozado dorado, fritos a la perfección y servidos acompañados de ensalada.', 135.00, TRUE,
    'DISPONIBLE', 24, '24',
    'variante', '$135', '20 minutos',
    NULL, 22
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 22);

-- Fila 23: Mariscos Lalo'S 1. / Al Mojo de Ajo
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Al Mojo de Ajo', ': Camarones o filete salteados en una suculenta salsa a base de mantequilla dorada y trocitos de ajo perfumado.', 135.00, TRUE,
    'DISPONIBLE', 23, '23',
    'variante', '$135', '20 minutos',
    NULL, 23
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 23);

-- Fila 24: Mariscos Lalo'S 1. / Rancheros
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Rancheros', 'Preparados en una salsa tradicional guisada con jitomate, cebolla, chile serrano y especias caseras.', 135.00, TRUE,
    'DISPONIBLE', 23, '23',
    'variante', '$135', '20 minutos',
    NULL, 24
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 24);

-- Fila 25: Mariscos Lalo'S 1. / A la Mexicana
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'A la Mexicana', 'Salteados al momento con cebolla, jitomate y chile fresco picado, al estilo tradicional mexicano.', 135.00, TRUE,
    'DISPONIBLE', 24, '24',
    'variante', '$135', '20 minutos',
    NULL, 25
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 25);

-- Fila 26: Mariscos Lalo'S 1. / A la Mantequilla
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'A la Mantequilla', 'Salteados suavemente en abundante mantequilla de vaca que realza el sabor natural del marisco o pescado', 135.00, TRUE,
    'DISPONIBLE', 27, '27',
    'variante', '$135', '20 minutos',
    NULL, 26
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 26);

-- Fila 27: Mariscos Lalo'S 1. / A la Naranja
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'A la Naranja', 'Bañados en una agridulce y aromática reducción de jugo de naranja natural con un toque de especias', 135.00, TRUE,
    'DISPONIBLE', 28, '28',
    'variante', '$135', '20 minutos',
    NULL, 27
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 27);

-- Fila 28: Mariscos Lalo'S 1. / Al Chipotle
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Al Chipotle', 'Bañados en una cremosa y ahumada salsa a base de chile chipotle refrito.', 135.00, TRUE,
    'DISPONIBLE', 25, '25',
    'variante', '$135', '20 minutos',
    NULL, 28
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 28);

-- Fila 29: Mariscos Lalo'S 1. / A la Diabla
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'A la Diabla', ': Salteados en una salsa roja intensa muy picante a base de chiles secos de la casa.', 135.00, TRUE,
    'DISPONIBLE', 24, '24',
    'variante', '$135', '20 minutos',
    NULL, 29
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 29);

-- Fila 30: Mariscos Lalo'S 1. / Al Ajillo.
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Al Ajillo.', 'Salteados en aceite de oliva y mantequilla con guajillo en rodajas y finas láminas de ajo frito.', 135.00, TRUE,
    'DISPONIBLE', 23, '23',
    'variante', '$135', '20 minutos',
    NULL, 30
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 30);

-- Fila 31: Mariscos Lalo'S 1. / Filetes de Pescado
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Filetes de Pescado', 'Lomo de pescado blanco, suave y jugoso, preparado al momento en la técnica de cocción o salsa de tu preferencia.', 135.00, TRUE,
    'DISPONIBLE', 25, '25',
    'variante', '$135', '20 minutos',
    NULL, 31
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 31);

-- Fila 32: Mariscos Lalo'S 1. / Cervezas
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Cervezas', 'Cervezas frías embotelladas para acompañar y refrescar tus platillos (se sirven exclusivamente con consumo de alimentos).', 31.00, TRUE,
    'DISPONIBLE', 20, '20',
    'variante', '$31', '5 minutos',
    NULL, 32
FROM negocios n
JOIN categorias c ON c.nombre = 'BEBIDAS'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 32);

-- Fila 33: Mariscos Lalo'S 1. / Michelada
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Michelada', 'Cerveza fría preparada en vaso escarchado con sal y chile en polvo, servida con jugo de limón y salsas negras', 75.00, TRUE,
    'DISPONIBLE', 20, '20',
    'variante', '$75', '5 minutos',
    NULL, 33
FROM negocios n
JOIN categorias c ON c.nombre = 'BEBIDAS'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 33);

-- Fila 34: Mariscos Lalo'S 1. / REFRESCO
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'REFRESCO', 'Bebidas embotelladas y frías de sabores variados o línea Coca-Cola para acompañar tu comida.', 20.00, TRUE,
    'DISPONIBLE', 20, '20',
    'variante', '$20', '5 minutos',
    NULL, 34
FROM negocios n
JOIN categorias c ON c.nombre = 'BEBIDAS'
WHERE n.nombre = 'Mariscos Lalo''S 1.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 34);

-- Fila 35: Makito sushi. / California Roll
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'California Roll', 'Por dentro surimi, pepino y aguacate; por fuera ajonjolí.', 85.00, TRUE,
    'DISPONIBLE', 45, '45',
    'variante', 'NO APLICA', '15 minutos',
    NULL, 35
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Makito sushi.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 35);

-- Fila 36: Makito sushi. / Kiss Me Roll
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Kiss Me Roll', 'Por dentro queso Philadelphia, pepino y aguacate; por fuera envuelto con ensalada de kanikama con trozos de camarón empanizado bañado con salsa de anguila y ajonjolí.', 145.00, TRUE,
    'DISPONIBLE', 45, '45',
    'variante', 'NO APLICA', '15 minutos',
    NULL, 36
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Makito sushi.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 36);

-- Fila 37: Makito sushi. / Dragon Roll
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Dragon Roll', 'Por dentro camarón empanizado con panko y kanikama en tempura, queso Philadelphia; por fuera envuelto con mango y aguacate, con un toque de sriracha y salsa de anguila.', 155.00, TRUE,
    'DISPONIBLE', 32, '32',
    'variante', 'NO APLICA', '15 minutos',
    NULL, 37
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Makito sushi.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 37);

-- Fila 38: Makito sushi. / Nigiri de Salmón "Sake"
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Nigiri de Salmón "Sake"', 'Bocado de arroz presionado a mano cubierto con una fina lámina de salmón fresco.', 40.00, TRUE,
    'DISPONIBLE', 21, '21',
    'variante', 'NO APLICA', '15 minutos',
    NULL, 38
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Makito sushi.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 38);

-- Fila 39: Makito sushi. / Sashimi de Atún "Maguro"
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Sashimi de Atún "Maguro"', 'Cortes finos o gruesos de atún fresco de alta calidad.', 155.00, TRUE,
    'DISPONIBLE', 54, '54',
    'variante', 'NO APLICA', '15 minutos',
    NULL, 39
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Makito sushi.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 39);

-- Fila 40: Makito sushi. / Yakimeshi Mixto
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Yakimeshi Mixto', 'Arroz frito salteado con carne, camarón, huevo, zanahoria, calabaza, cebolla y cebolleta al final.', 90.00, TRUE,
    'DISPONIBLE', 76, '76',
    'variante', 'NO APLICA', '15 minutos',
    NULL, 40
FROM negocios n
JOIN categorias c ON c.nombre = 'COMIDA'
WHERE n.nombre = 'Makito sushi.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 40);

-- Fila 41: Makito sushi. / Yakimeshi de Verduras
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Yakimeshi de Verduras', 'Arroz frito salteado con zanahoria, calabaza, huevo, cebolla y cebolleta al final.', 65.00, TRUE,
    'DISPONIBLE', 45, '45',
    'variante', 'NO APLICA', '15 minutos',
    NULL, 41
FROM negocios n
JOIN categorias c ON c.nombre = 'BEBIDAS'
WHERE n.nombre = 'Makito sushi.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 41);

-- Fila 42: Makito sushi. / Helado Frito "tempura helado"
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Helado Frito "tempura helado"', ': Bola de helado capeada al estilo tempura frita, servida con cajeta o chocolate.', 59.00, TRUE,
    'DISPONIBLE', 34, '34',
    'variante', 'NO APLICA', '15 minutos',
    NULL, 42
FROM negocios n
JOIN categorias c ON c.nombre = 'POSTRE'
WHERE n.nombre = 'Makito sushi.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 42);

-- Fila 43: Makito sushi. / Calpis Sui
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Calpis Sui', 'Bebida refrescante tradicional japonesa a base de yogur concentrado y toque cítrico.', 35.00, TRUE,
    'DISPONIBLE', 65, '65',
    'variante', 'NO APLICA', '15 minutos',
    NULL, 43
FROM negocios n
JOIN categorias c ON c.nombre = 'POSTRE'
WHERE n.nombre = 'Makito sushi.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 43);

-- Fila 44: Makito sushi. / Jarra de Sake 240 ml
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Jarra de Sake 240 ml', 'Licor de arroz tradicional japonés servido caliente o frío en jarra de 240 ml.', 175.00, TRUE,
    'DISPONIBLE', 54, '54',
    'variante', 'NO APLICA', '15 minutos',
    NULL, 44
FROM negocios n
JOIN categorias c ON c.nombre = 'BEBIDAS'
WHERE n.nombre = 'Makito sushi.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 44);

-- Fila 45: Makito sushi. / Jarra de Sake 240 ml
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Jarra de Sake 240 ml', 'Licor de arroz tradicional japonés servido caliente o frío en jarra de 240 ml.', 175.00, TRUE,
    'DISPONIBLE', 36, '36',
    'variante', 'NO APLICA', '15 minutos',
    NULL, 45
FROM negocios n
JOIN categorias c ON c.nombre = 'BEBIDAS'
WHERE n.nombre = 'Makito sushi.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 45);

-- Fila 46: MERAKI RESTAURANT PIZZERIA / Pizza Margarita
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Pizza Margarita', 'Pomodoro, mozzarella y albahaca fresca sobre base de salsa roja.', 175.00, TRUE,
    'Disponibilidad de cada producto: Disponibles de jueves a martes durante su horario vespertino/nocturno (miércoles cerrado).', NULL, 'desconocido',
    'no aplica', '60', 'e MERAKI RESTAURANT PIZZERIA',
    NULL, 46
FROM negocios n
JOIN categorias c ON c.nombre = 'pizzas'
WHERE n.nombre = 'MERAKI RESTAURANT PIZZERIA'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 46);

-- Fila 47: MERAKI RESTAURANT PIZZERIA / Pizza Hawaiana
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Pizza Hawaiana', 'Mix de quesos, salsa pomodoro, jamón y piña.', 175.00, TRUE,
    'Disponibilidad de cada producto: Disponibles de jueves a martes durante su horario vespertino/nocturno (miércoles cerrado).', NULL, 'desconocido',
    'no aplica', '175', 'Tiempo aproximado de preparación: No se especifica en las imágenes.',
    NULL, 47
FROM negocios n
JOIN categorias c ON c.nombre = 'pizzas'
WHERE n.nombre = 'MERAKI RESTAURANT PIZZERIA'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 47);

-- Fila 48: MERAKI RESTAURANT PIZZERIA / Pizza Nápoles
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Pizza Nápoles', 'Mix de quesos, aceite de oliva, un toque de mostaza dulce, arúgula fresca, jamón serrano fresco, parmesano rallado y pistache sobre base blanca.', 195.00, TRUE,
    'Disponibilidad de cada producto: Disponibles de jueves a martes durante su horario vespertino/nocturno (miércoles cerrado).', NULL, 'desconocido',
    'no aplica', '175', 'Tiempo aproximado de preparación: No se especifica en las imágenes.',
    NULL, 48
FROM negocios n
JOIN categorias c ON c.nombre = 'pizzas'
WHERE n.nombre = 'MERAKI RESTAURANT PIZZERIA'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 48);

-- Fila 49: MERAKI RESTAURANT PIZZERIA / Pizza Arrachera
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Pizza Arrachera', 'Mix de quesos, salsa pomodoro y corte de arrachera jugosa.', 220.00, TRUE,
    'Disponibilidad de cada producto: Disponibles de jueves a martes durante su horario vespertino/nocturno (miércoles cerrado).', NULL, 'desconocido',
    'no aplica', '175', 'Tiempo aproximado de preparación: No se especifica en las imágenes.',
    NULL, 49
FROM negocios n
JOIN categorias c ON c.nombre = 'pizzas'
WHERE n.nombre = 'MERAKI RESTAURANT PIZZERIA'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 49);

-- Fila 50: MERAKI RESTAURANT PIZZERIA / Pizza Florencia
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Pizza Florencia', 'Mix de quesos, salsa pomodoro, espinaca, champiñones, alcachofa y pesto.', 175.00, TRUE,
    'Disponibilidad de cada producto: Disponibles de jueves a martes durante su horario vespertino/nocturno (miércoles cerrado).', NULL, 'desconocido',
    'no aplica', '175', 'Tiempo aproximado de preparación: No se especifica en las imágenes.',
    NULL, 50
FROM negocios n
JOIN categorias c ON c.nombre = 'pizzas'
WHERE n.nombre = 'MERAKI RESTAURANT PIZZERIA'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 50);

-- Fila 51: MERAKI RESTAURANT PIZZERIA / Alitas
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Alitas', 'Porción de alitas crujientes servidas con aderezo Ranch, zanahoria y bañadas en la salsa de tu elección.', 180.00, TRUE,
    'Disponibilidad de cada producto: Disponibles de jueves a martes durante su horario vespertino/nocturno (miércoles cerrado).', NULL, 'desconocido',
    'Búfalo, BBQ, Mango Habanero', '195', 'Tiempo aproximado de preparación: No se especifica en las imágenes.',
    NULL, 51
FROM negocios n
JOIN categorias c ON c.nombre = 'entradas'
WHERE n.nombre = 'MERAKI RESTAURANT PIZZERIA'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 51);

-- Fila 52: MERAKI RESTAURANT PIZZERIA / Ensalada Oasis
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Ensalada Oasis', 'Mix de lechugas, espinaca, tomate cherry, queso de cabra, arándanos y nuez; acompañada de vinagreta de orégano y limón.', 85.00, TRUE,
    'Disponibilidad de cada producto: Disponibles de jueves a martes durante su horario vespertino/nocturno (miércoles cerrado).', NULL, 'desconocido',
    'No aplica.', '220', 'Tiempo aproximado de preparación: No se especifica en las imágenes.',
    NULL, 52
FROM negocios n
JOIN categorias c ON c.nombre = 'ensalada'
WHERE n.nombre = 'MERAKI RESTAURANT PIZZERIA'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 52);

-- Fila 53: MERAKI RESTAURANT PIZZERIA / Beso Dulce con Helado
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Beso Dulce con Helado', 'Calzone dulce relleno de Nutella o dulce de leche, servido con una bola de helado.', 80.00, TRUE,
    'Disponibilidad de cada producto: Disponibles de jueves a martes durante su horario vespertino/nocturno (miércoles cerrado).', NULL, 'desconocido',
    'no aplica', '175', 'Tiempo aproximado de preparación: No se especifica en las imágenes.',
    NULL, 53
FROM negocios n
JOIN categorias c ON c.nombre = 'postre'
WHERE n.nombre = 'MERAKI RESTAURANT PIZZERIA'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 53);

-- Fila 54: MERAKI RESTAURANT PIZZERIA / Jugo Boing
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Jugo Boing', ': Bebida frutal embotellada disponible en sabores tradicionales.', 28.00, TRUE,
    'Disponibilidad de cada producto: Disponibles de jueves a martes durante su horario vespertino/nocturno (miércoles cerrado).', NULL, 'desconocido',
    '(Manzana, Mango, Guayaba, Uva', '20', 'Tiempo aproximado de preparación: No se especifica en las imágenes.',
    NULL, 54
FROM negocios n
JOIN categorias c ON c.nombre = 'bebidas'
WHERE n.nombre = 'MERAKI RESTAURANT PIZZERIA'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 54);

-- Fila 55: Peinecillo's Gril. / Hot Dog Sencillo
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Hot Dog Sencillo', 'Clásico hot dog con salchicha de pavo, aderezos de la casa y verdura fresca.', 20.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días en su horario vespertino/nocturno.', NULL, 'Existencias aproximadas: No se especifica en las imágenes.',
    'no aplica', '20', '15 minutos',
    NULL, 55
FROM negocios n
JOIN categorias c ON c.nombre = 'Hot Dog'
WHERE n.nombre = 'Peinecillo''s Gril.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 55);

-- Fila 56: Peinecillo's Gril. / Chilidogo
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Chilidogo', 'Hot dog especial bañado con abundante chili con carne casero y queso melted.', 25.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días en su horario vespertino/nocturno.', NULL, 'Existencias aproximadas: No se especifica en las imágenes.',
    'no aplica', '25', '15 minutos',
    NULL, 56
FROM negocios n
JOIN categorias c ON c.nombre = 'Hot Dog'
WHERE n.nombre = 'Peinecillo''s Gril.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 56);

-- Fila 57: Peinecillo's Gril. / Lonches
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Lonches', 'Lonche tradicional en pan virote relleno de carne, verdura y aderezos', 35.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días en su horario vespertino/nocturno.', NULL, 'Existencias aproximadas: No se especifica en las imágenes.',
    'no aplica', '35', '15 minutos',
    NULL, 57
FROM negocios n
JOIN categorias c ON c.nombre = 'lonches'
WHERE n.nombre = 'Peinecillo''s Gril.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 57);

-- Fila 58: Peinecillo's Gril. / Hamburguesa Sencilla
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Hamburguesa Sencilla', 'Lonche tradicional en pan virote relleno de carne, verdura y aderezos', 38.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días en su horario vespertino/nocturno.', NULL, 'Existencias aproximadas: No se especifica en las imágenes.',
    'no aplica', '38', '15 minutos',
    NULL, 58
FROM negocios n
JOIN categorias c ON c.nombre = 'hamburguesas'
WHERE n.nombre = 'Peinecillo''s Gril.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 58);

-- Fila 59: Peinecillo's Gril. / Hamburguesa c/ Papas
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Hamburguesa c/ Papas', 'Hamburguesa clásica servida en paquete con una porción de papas a la francesa doradas.', 50.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días en su horario vespertino/nocturno.', NULL, 'Existencias aproximadas: No se especifica en las imágenes.',
    'no aplica', '50', '15 minutos',
    NULL, 59
FROM negocios n
JOIN categorias c ON c.nombre = 'hamburguesas'
WHERE n.nombre = 'Peinecillo''s Gril.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 59);

-- Fila 60: Peinecillo's Gril. / Hamburguesa c/ Salchipulpos
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Hamburguesa c/ Salchipulpos', 'Combo de hamburguesa acompañada de divertidas salchichas fritas cortadas en forma de pulpo.', 47.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días en su horario vespertino/nocturno.', NULL, 'Existencias aproximadas: No se especifica en las imágenes.',
    'no aplica', '47', '15 minutos',
    NULL, 60
FROM negocios n
JOIN categorias c ON c.nombre = 'hamburguesas'
WHERE n.nombre = 'Peinecillo''s Gril.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 60);

-- Fila 61: Peinecillo's Gril. / Hamburguesa c/ Salchipapa
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Hamburguesa c/ Salchipapa', 'Combo de hamburguesa acompañada con una combinación de salchichas fritas y papas a la francesa.', 55.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días en su horario vespertino/nocturno.', NULL, 'Existencias aproximadas: No se especifica en las imágenes.',
    'no aplica', '55', '15 minutos',
    NULL, 61
FROM negocios n
JOIN categorias c ON c.nombre = 'hamburguesas'
WHERE n.nombre = 'Peinecillo''s Gril.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 61);

-- Fila 62: Peinecillo's Gril. / Papas a la Francesa
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Papas a la Francesa', 'Orden de papas de corte tradicional fritas y sazonadas al momento.', 25.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días en su horario vespertino/nocturno.', NULL, 'Existencias aproximadas: No se especifica en las imágenes.',
    'no aplica', '25', '15 minutos',
    NULL, 62
FROM negocios n
JOIN categorias c ON c.nombre = 'snacks'
WHERE n.nombre = 'Peinecillo''s Gril.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 62);

-- Fila 63: Peinecillo's Gril. / Salchipulpos
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Salchipulpos', 'Porción de salchichas de pavo fritas con cortes en forma de pulpo, acompañadas de aderezo o salsas.', 25.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días en su horario vespertino/nocturno.', NULL, 'Existencias aproximadas: No se especifica en las imágenes.',
    'no aplica', '25', '15 minutos',
    NULL, 63
FROM negocios n
JOIN categorias c ON c.nombre = 'snacks'
WHERE n.nombre = 'Peinecillo''s Gril.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 63);

-- Fila 64: Peinecillo's Gril. / Refresco
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Refresco', 'Bebida embotellada y fría de sabores variados para acompañar tu snack.', 20.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días en su horario vespertino/nocturno.', NULL, 'Existencias aproximadas: No se especifica en las imágenes.',
    'variante de sabores', '20', '15 minutos',
    NULL, 64
FROM negocios n
JOIN categorias c ON c.nombre = 'refresco y agua'
WHERE n.nombre = 'Peinecillo''s Gril.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 64);

-- Fila 65: Paleteria Dani. / (Sabor Fresa/Roja)
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, '(Sabor Fresa/Roja)', 'Descripción de cada producto:
   * Paleta de Agua (Fresa/Roja): Paleta helada tradicional a base de agua.', 16.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días de la semana durante su horario de apertura (11:00 AM a 8:30 PM aprox, domingos horario reducido).', NULL, 'Existencias aproximadas: No se especifican en las imágenes.',
    'Variantes de cada producto:
   1-2. Paletas de Agua: Varios colores y sabores frutales.', '16', '2minutos',
    NULL, 65
FROM negocios n
JOIN categorias c ON c.nombre = 'Paletas de Agua'
WHERE n.nombre = 'Paleteria Dani.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 65);

-- Fila 66: Paleteria Dani. / (Sabor Limón/Verde)
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, '(Sabor Limón/Verde)', 'Paleta de Agua (Limón/Verde): Paleta helada refrescante a base de agua.', 16.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días de la semana durante su horario de apertura (11:00 AM a 8:30 PM aprox, domingos horario reducido).', NULL, 'Existencias aproximadas: No se especifican en las imágenes.',
    'Variantes de cada producto:
   1-2. Paletas de Agua: Varios colores y sabores frutales.', '18', '2minutos',
    NULL, 66
FROM negocios n
JOIN categorias c ON c.nombre = 'Paletas de Agua'
WHERE n.nombre = 'Paleteria Dani.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 66);

-- Fila 67: Paleteria Dani. / Paleta de Leche con trozos de fruta
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Paleta de Leche con trozos de fruta', 'Paleta de Leche con fruta: Paleta helada deliciosa y cremosa elaborada a base de leche con fresas visibles incrustadas.', 18.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días de la semana durante su horario de apertura (11:00 AM a 8:30 PM aprox, domingos horario reducido).', NULL, 'Existencias aproximadas: No se especifican en las imágenes.',
    'Variantes de cada producto:
   1-2. Paletas de Agua: Varios colores y sabores frutales.', '20', '2minutos',
    NULL, 67
FROM negocios n
JOIN categorias c ON c.nombre = 'Paletas de Leche'
WHERE n.nombre = 'Paleteria Dani.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 67);

-- Fila 68: Paleteria Dani. / paleta de Leche tipo Nuez/Vainilla
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'paleta de Leche tipo Nuez/Vainilla', 'Paleta de Leche tipo Nuez: Paleta helada cremosa de leche con trocitos de nuez o ingredientes secos.', 18.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días de la semana durante su horario de apertura (11:00 AM a 8:30 PM aprox, domingos horario reducido).', NULL, 'Existencias aproximadas: No se especifican en las imágenes.',
    'Variantes de cada producto:
   1-2. Paletas de Agua: Varios colores y sabores frutales.', '20', '2minutos',
    NULL, 68
FROM negocios n
JOIN categorias c ON c.nombre = 'Paletas de Leche'
WHERE n.nombre = 'Paleteria Dani.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 68);

-- Fila 69: Paleteria Dani. / Piña/Amarilla
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Piña/Amarilla', 'Agua Fresca (Piña/Amarilla): Bebida tradicional refrescante servida en botella de plástico de 1 litro.', 20.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días de la semana durante su horario de apertura (11:00 AM a 8:30 PM aprox, domingos horario reducido).', NULL, 'Existencias aproximadas: No se especifican en las imágenes.',
    'Variantes de cada producto:
   1-2. Paletas de Agua: Varios colores y sabores frutales.', '16', '2minutos',
    NULL, 69
FROM negocios n
JOIN categorias c ON c.nombre = 'Aguas Frescas'
WHERE n.nombre = 'Paleteria Dani.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 69);

-- Fila 70: Paleteria Dani. / Horchata/Blanca
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Horchata/Blanca', 'Agua Fresca (Horchata/Blanca): Bebida dulce y fresca servida en envase de 1 litro.', 20.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días de la semana durante su horario de apertura (11:00 AM a 8:30 PM aprox, domingos horario reducido).', NULL, 'Existencias aproximadas: No se especifican en las imágenes.',
    'Variantes de cada producto:
   1-2. Paletas de Agua: Varios colores y sabores frutales.', '25', '2minutos',
    NULL, 70
FROM negocios n
JOIN categorias c ON c.nombre = 'Aguas Frescas'
WHERE n.nombre = 'Paleteria Dani.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 70);

-- Fila 71: Paleteria Dani. / Sabor Fresa/Rosa
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Sabor Fresa/Rosa', 'Agua Fresca (Fresa/Rosa): Bebida frutal embotellada en presentación de 1 litro.', 20.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días de la semana durante su horario de apertura (11:00 AM a 8:30 PM aprox, domingos horario reducido).', NULL, 'Existencias aproximadas: No se especifican en las imágenes.',
    'Variantes de cada producto:
   1-2. Paletas de Agua: Varios colores y sabores frutales.', '16', '2minutos',
    NULL, 71
FROM negocios n
JOIN categorias c ON c.nombre = 'Aguas Frescas'
WHERE n.nombre = 'Paleteria Dani.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 71);

-- Fila 72: Paleteria Dani. / Nieve Bola Grande
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Nieve Bola Grande', 'Nieve Bola Grande: Porción abundante de helado servida en vaso de unicel rotulado con el logo del negocio.', 20.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días de la semana durante su horario de apertura (11:00 AM a 8:30 PM aprox, domingos horario reducido).', NULL, 'Existencias aproximadas: No se especifican en las imágenes.',
    'Variantes de cada producto:
   1-2. Paletas de Agua: Varios colores y sabores frutales.', '25', '2minutos',
    NULL, 72
FROM negocios n
JOIN categorias c ON c.nombre = 'Nieves / Helados'
WHERE n.nombre = 'Paleteria Dani.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 72);

-- Fila 73: Paleteria Dani. / Sandwich de vainilla
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Sandwich de vainilla', 'Sandwich de vainilla: Cuadro de helado de vainilla contenido entre dos galletas, envuelto en papel aluminio.', 16.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días de la semana durante su horario de apertura (11:00 AM a 8:30 PM aprox, domingos horario reducido).', NULL, 'Existencias aproximadas: No se especifican en las imágenes.',
    'Variantes de cada producto:
   1-2. Paletas de Agua: Varios colores y sabores frutales.', '25', '2minutos',
    NULL, 73
FROM negocios n
JOIN categorias c ON c.nombre = 'Sandwich / Helados'
WHERE n.nombre = 'Paleteria Dani.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 73);

-- Fila 74: Paleteria Dani. / Frappuccino
INSERT INTO productos (
    id_negocio, id_categoria, nombre, descripcion, precio, disponible,
    disponibilidad_texto, existencias_aproximadas, existencias_texto,
    variantes_texto, precios_variantes_texto, tiempo_preparacion_texto,
    imagen_url, fila_excel
)
SELECT
    n.id_negocio, c.id_categoria, 'Frappuccino', 'Frappuccino: Bebida helada mezclada tipo frappé, decorada con crema batida, chispas, jarabe de chocolate y una galleta en forma de tubo.', 25.00, TRUE,
    'Disponibilidad de cada producto: Disponibles todos los días de la semana durante su horario de apertura (11:00 AM a 8:30 PM aprox, domingos horario reducido).', NULL, 'Existencias aproximadas: No se especifican en las imágenes.',
    'Variantes de cada producto:
   1-2. Paletas de Agua: Varios colores y sabores frutales.', '20', '2minutos',
    NULL, 74
FROM negocios n
JOIN categorias c ON c.nombre = 'Bebidas Preparadas / Frappuccinos'
WHERE n.nombre = 'Paleteria Dani.'
  AND NOT EXISTS (SELECT 1 FROM productos p WHERE p.id_negocio = n.id_negocio AND p.fila_excel = 74);

-- Variante de PELLIZCADA: Sencilla
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Sencilla', 25.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 2
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Sencilla');

-- Variante de PELLIZCADA: Con carne
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Con carne', 40.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 2
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Con carne');

-- Variante de HUARACHE: Sencillo
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Sencillo', 35.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 3
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Sencillo');

-- Variante de HUARACHE: Con carne
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Con carne', 55.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 3
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Con carne');

-- Variante de TACOS: Tortilla de maíz
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Tortilla de maíz', 18.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 4
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Tortilla de maíz');

-- Variante de TACOS: Tortilla de harina
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Tortilla de harina', 22.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 4
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Tortilla de harina');

-- Variante de PELLIZCADA JUMBO: Sencilla
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Sencilla', 45.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 5
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Sencilla');

-- Variante de PELLIZCADA JUMBO: Con carne
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Con carne', 65.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 5
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Con carne');

-- Variante de QUESADILLAS CON CARNE: Tortilla de maíz
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Tortilla de maíz', 30.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 6
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Tortilla de maíz');

-- Variante de QUESADILLAS CON CARNE: Tortilla de harina
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Tortilla de harina', 35.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 6
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Tortilla de harina');

-- Variante de QUESADILLA SENCILLA: Tortilla de maíz
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Tortilla de maíz', 20.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 7
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Tortilla de maíz');

-- Variante de QUESADILLA SENCILLA: Tortilla de harina
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Tortilla de harina', 25.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 7
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Tortilla de harina');

-- Variante de PELLIZCADA DE BISTEC: Queso normal
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Queso normal', 40.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 8
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Queso normal');

-- Variante de PELLIZCADA DE BISTEC: Extra queso
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Extra queso', 50.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 8
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Extra queso');

-- Variante de HUARACHE DE BISTEC: Queso normal
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Queso normal', 55.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 9
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Queso normal');

-- Variante de HUARACHE DE BISTEC: Extra queso
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Extra queso', 65.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 9
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Extra queso');

-- Variante de TACOS DE BISTEC: Tortilla de maíz
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Tortilla de maíz', 22.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 10
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Tortilla de maíz');

-- Variante de TACOS DE BISTEC: Tortilla de harina
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Tortilla de harina', 26.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 10
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Tortilla de harina');

-- Variante de QUESADILLA DE BISTEC: Tortilla de maíz
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Tortilla de maíz', 35.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 11
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Tortilla de maíz');

-- Variante de QUESADILLA DE BISTEC: Tortilla de harina
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Tortilla de harina', 40.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 11
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Tortilla de harina');

-- Variante de PELLIZCADA JUMBO DE BISTEC: Orden de 4
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Orden de 4', 65.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 12
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Orden de 4');

-- Variante de PELLIZCADA JUMBO DE BISTEC: Orden de 5
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Orden de 5', 75.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 12
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Orden de 5');

-- Variante de ENCHILADAS VERDE RELLENAS DE POLLO: Orden de 4
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Orden de 4', 70.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 13
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Orden de 4');

-- Variante de ENCHILADAS VERDE RELLENAS DE POLLO: Orden de 5
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Orden de 5', 85.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 13
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Orden de 5');

-- Variante de ENCHILADAS VERDES RELLENAS DE POLLO + PASTOR: Orden de 4
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Orden de 4', 90.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 14
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Orden de 4');

-- Variante de ENCHILADAS VERDES RELLENAS DE POLLO + PASTOR: Orden de 5
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Orden de 5', 110.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 14
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Orden de 5');

-- Variante de AGUA FRESCA 1/2: Horchata
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Horchata', 20.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 15
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Horchata');

-- Variante de AGUA FRESCA 1/2: Jamaica
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Jamaica', 20.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 15
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Jamaica');

-- Variante de AGUA FRESCA 1L: Horchata
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Horchata', 35.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 16
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Horchata');

-- Variante de AGUA FRESCA 1L: Jamaica
INSERT INTO producto_variantes (id_producto, nombre, precio, disponible)
SELECT p.id_producto, 'Jamaica', 35.00, TRUE
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
WHERE n.nombre = 'La Esquina del Sazón' AND p.fila_excel = 16
  AND NOT EXISTS (SELECT 1 FROM producto_variantes pv WHERE pv.id_producto = p.id_producto AND pv.nombre = 'Jamaica');

COMMIT;

-- Verificación de productos por negocio
SELECT n.nombre AS negocio, COUNT(p.id_producto) AS total_productos
FROM negocios n
LEFT JOIN productos p ON p.id_negocio = n.id_negocio
GROUP BY n.id_negocio, n.nombre
ORDER BY n.id_negocio;

-- Verificación de variantes registradas
SELECT n.nombre AS negocio, p.nombre AS producto, COUNT(v.id_variante) AS total_variantes
FROM productos p
JOIN negocios n ON n.id_negocio = p.id_negocio
LEFT JOIN producto_variantes v ON v.id_producto = p.id_producto
GROUP BY p.id_producto, n.nombre, p.nombre
HAVING COUNT(v.id_variante) > 0
ORDER BY n.nombre, p.nombre;
