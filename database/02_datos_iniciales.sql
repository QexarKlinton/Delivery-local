-- ==========================================
-- DATOS INICIALES: CUTLAQUEPAQUE DELIVERY LOCAL
-- Script repetible: no duplica negocios ni productos.
-- ==========================================

USE cutlaquepaque_delivery;

START TRANSACTION;

-- NEGOCIOS
INSERT INTO negocios (nombre, descripcion, categoria, direccion)
VALUES
('Tamales Mary', 'Venta de tamales', 'Tamales', 'Alrededores del Cutlaquepaque'),
('Tacos Beny', 'Venta de tacos', 'Tacos', 'Alrededores del Cutlaquepaque'),
('Fonda de Lety', 'Comida casera y platillos del día', 'Comida corrida', 'Alrededores del Cutlaquepaque'),
('Lonches Mario', 'Venta de lonches y tortas', 'Lonches', 'Alrededores del Cutlaquepaque'),
('Aguas Frescas La Michoacana', 'Venta de aguas frescas y bebidas', 'Bebidas', 'Alrededores del Cutlaquepaque')
ON DUPLICATE KEY UPDATE nombre = VALUES(nombre);

-- PRODUCTOS
-- Los negocios se buscan por nombre; no se depende de que sus IDs sean 1 a 5.
-- La combinación negocio + nombre evita insertar productos repetidos al reejecutar.
INSERT INTO productos (id_negocio, nombre, descripcion, precio)
SELECT n.id_negocio, catalogo.nombre, catalogo.descripcion, catalogo.precio
FROM (
    SELECT 'Tamales Mary' AS negocio, 'Tamal verde' AS nombre, 'Tamal de salsa verde con cerdo' AS descripcion, 18.00 AS precio
    UNION ALL SELECT 'Tamales Mary', 'Tamal rojo', 'Tamal de salsa roja con pollo', 18.00
    UNION ALL SELECT 'Tamales Mary', 'Tamal de rajas', 'Tamal de rajas con queso', 18.00
    UNION ALL SELECT 'Tamales Mary', 'Tamal dulce', 'Tamal dulce de piña con pasas', 16.00
    UNION ALL SELECT 'Tamales Mary', 'Tamal de elote', 'Tamal dulce de elote tierno', 20.00
    UNION ALL SELECT 'Tamales Mary', 'Atole de champurrado', 'Atole tradicional de chocolate', 22.00

    UNION ALL SELECT 'Tacos Beny', 'Taco de bistec', 'Taco de bistec de res', 20.00
    UNION ALL SELECT 'Tacos Beny', 'Taco de suadero', 'Taco de suadero suave', 20.00
    UNION ALL SELECT 'Tacos Beny', 'Taco al pastor', 'Taco al pastor con piña', 20.00
    UNION ALL SELECT 'Tacos Beny', 'Taco de chorizo', 'Taco de chorizo estilo la casa', 20.00
    UNION ALL SELECT 'Tacos Beny', 'Gringa de pastor', 'Tortilla de harina con queso y pastor', 45.00
    UNION ALL SELECT 'Tacos Beny', 'Vampiro de bistec', 'Tortilla dorada con queso y bistec', 35.00

    UNION ALL SELECT 'Fonda de Lety', 'Comida del día', 'Platillo principal con sopa y arroz', 75.00
    UNION ALL SELECT 'Fonda de Lety', 'Milanesa de pollo', 'Milanesa acompañada de papas y ensalada', 85.00
    UNION ALL SELECT 'Fonda de Lety', 'Pechuga a la plancha', 'Pechuga asada con guarnición', 80.00
    UNION ALL SELECT 'Fonda de Lety', 'Carne en su jugo', 'Tradicional carne en su jugo con frijoles', 90.00
    UNION ALL SELECT 'Fonda de Lety', 'Enchiladas rojas', 'Orden de 4 enchiladas rellenas de pollo', 70.00
    UNION ALL SELECT 'Fonda de Lety', 'Agua fresca del día', 'Vaso de agua fresca natural', 20.00

    UNION ALL SELECT 'Lonches Mario', 'Lonche de pierna', 'Lonche bañado en salsa de tomate', 55.00
    UNION ALL SELECT 'Lonches Mario', 'Lonche de panela', 'Lonche fresco con queso panela y aguacate', 50.00
    UNION ALL SELECT 'Lonches Mario', 'Lonche mixto', 'Lonche de pierna con jamón y queso', 60.00
    UNION ALL SELECT 'Lonches Mario', 'Torta ahogada de carnitas', 'Torta tradicional ahogada en salsa picante', 65.00
    UNION ALL SELECT 'Lonches Mario', 'Orden de papas locas', 'Papas a la francesa con crema y queso', 45.00
    UNION ALL SELECT 'Lonches Mario', 'Licuado de plátano', 'Licuado de plátano con leche', 30.00

    UNION ALL SELECT 'Aguas Frescas La Michoacana', 'Agua de horchata', 'Agua fresca de horchata tradicional', 25.00
    UNION ALL SELECT 'Aguas Frescas La Michoacana', 'Agua de jamaica', 'Agua fresca de flor de jamaica', 25.00
    UNION ALL SELECT 'Aguas Frescas La Michoacana', 'Agua de limón con chía', 'Agua fresca de limón con chía', 25.00
    UNION ALL SELECT 'Aguas Frescas La Michoacana', 'Tejuino', 'Bebida tradicional de maíz con nieve de limón', 35.00
    UNION ALL SELECT 'Aguas Frescas La Michoacana', 'Biónico grande', 'Fruta picada con crema especial, granola y coco', 55.00
    UNION ALL SELECT 'Aguas Frescas La Michoacana', 'Fresas con crema', 'Postre de fresas naturales con crema de la casa', 50.00
) AS catalogo
INNER JOIN negocios n
    ON n.nombre = catalogo.negocio
LEFT JOIN productos p
    ON p.id_negocio = n.id_negocio
   AND p.nombre = catalogo.nombre
WHERE p.id_producto IS NULL;

COMMIT;

-- VERIFICACIÓN
SELECT COUNT(*) AS total_negocios FROM negocios;
SELECT COUNT(*) AS total_productos FROM productos;
SELECT n.nombre AS negocio, COUNT(p.id_producto) AS productos
FROM negocios n
LEFT JOIN productos p ON p.id_negocio = n.id_negocio
GROUP BY n.id_negocio, n.nombre
ORDER BY n.nombre;
