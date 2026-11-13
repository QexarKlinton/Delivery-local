USE delivery_local_nueva;

START TRANSACTION;

-- Crear las categorías que hagan falta
INSERT INTO categorias (nombre)
SELECT x.nombre
FROM (
    SELECT 'Tacos' AS nombre
    UNION ALL SELECT 'Comida corrida'
    UNION ALL SELECT 'Lonches'
    UNION ALL SELECT 'Bebidas'
) AS x
WHERE NOT EXISTS (
    SELECT 1
    FROM categorias c
    WHERE c.nombre = x.nombre
);

-- Insertar los 24 productos faltantes
INSERT INTO productos (
    id_negocio,
    id_categoria,
    nombre,
    descripcion,
    precio,
    disponible
)
SELECT
    n.id_negocio,
    c.id_categoria,
    x.producto,
    x.descripcion,
    x.precio,
    TRUE
FROM (
    -- TACOS BENY
    SELECT 'Tacos Beny' AS negocio, 'Tacos' AS categoria,
           'Taco de bistec' AS producto,
           'Taco de bistec de res' AS descripcion, 20.00 AS precio
    UNION ALL SELECT 'Tacos Beny', 'Tacos', 'Taco de suadero',
           'Taco de suadero suave', 20.00
    UNION ALL SELECT 'Tacos Beny', 'Tacos', 'Taco al pastor',
           'Taco al pastor con piña', 20.00
    UNION ALL SELECT 'Tacos Beny', 'Tacos', 'Taco de chorizo',
           'Taco de chorizo estilo la casa', 20.00
    UNION ALL SELECT 'Tacos Beny', 'Tacos', 'Gringa de pastor',
           'Tortilla de harina con queso y pastor', 45.00
    UNION ALL SELECT 'Tacos Beny', 'Tacos', 'Vampiro de bistec',
           'Tortilla dorada con queso y bistec', 35.00

    -- FONDA DE LETY
    UNION ALL SELECT 'Fonda de Lety', 'Comida corrida', 'Comida del día',
           'Platillo principal con sopa y arroz', 75.00
    UNION ALL SELECT 'Fonda de Lety', 'Comida corrida', 'Milanesa de pollo',
           'Milanesa acompañada de papas y ensalada', 85.00
    UNION ALL SELECT 'Fonda de Lety', 'Comida corrida', 'Pechuga a la plancha',
           'Pechuga asada con guarnición', 80.00
    UNION ALL SELECT 'Fonda de Lety', 'Comida corrida', 'Carne en su jugo',
           'Tradicional carne en su jugo con frijoles', 90.00
    UNION ALL SELECT 'Fonda de Lety', 'Comida corrida', 'Enchiladas rojas',
           'Orden de 4 enchiladas rellenas de pollo', 70.00
    UNION ALL SELECT 'Fonda de Lety', 'Comida corrida', 'Agua fresca del día',
           'Vaso de agua fresca natural', 20.00

    -- LONCHES MARIO
    UNION ALL SELECT 'Lonches Mario', 'Lonches', 'Lonche de pierna',
           'Lonche bañado en salsa de tomate', 55.00
    UNION ALL SELECT 'Lonches Mario', 'Lonches', 'Lonche de panela',
           'Lonche fresco con queso panela y aguacate', 50.00
    UNION ALL SELECT 'Lonches Mario', 'Lonches', 'Lonche mixto',
           'Lonche de pierna con jamón y queso', 60.00
    UNION ALL SELECT 'Lonches Mario', 'Lonches', 'Torta ahogada de carnitas',
           'Torta tradicional ahogada en salsa picante', 65.00
    UNION ALL SELECT 'Lonches Mario', 'Lonches', 'Orden de papas locas',
           'Papas a la francesa con crema y queso', 45.00
    UNION ALL SELECT 'Lonches Mario', 'Lonches', 'Licuado de plátano',
           'Licuado de plátano con leche', 30.00

    -- AGUAS FRESCAS LA MICHOACANA
    UNION ALL SELECT 'Aguas Frescas La Michoacana', 'Bebidas',
           'Agua de horchata', 'Agua fresca de horchata tradicional', 25.00
    UNION ALL SELECT 'Aguas Frescas La Michoacana', 'Bebidas',
           'Agua de jamaica', 'Agua fresca de flor de jamaica', 25.00
    UNION ALL SELECT 'Aguas Frescas La Michoacana', 'Bebidas',
           'Agua de limón con chía', 'Agua fresca de limón con chía', 25.00
    UNION ALL SELECT 'Aguas Frescas La Michoacana', 'Bebidas',
           'Tejuino', 'Bebida tradicional de maíz con nieve de limón', 35.00
    UNION ALL SELECT 'Aguas Frescas La Michoacana', 'Bebidas',
           'Biónico grande', 'Fruta picada con crema especial, granola y coco', 55.00
    UNION ALL SELECT 'Aguas Frescas La Michoacana', 'Bebidas',
           'Fresas con crema', 'Postre de fresas naturales con crema de la casa', 50.00
) AS x
INNER JOIN negocios n
    ON n.nombre = x.negocio
INNER JOIN categorias c
    ON c.nombre = x.categoria
LEFT JOIN productos p
    ON p.id_negocio = n.id_negocio
    AND p.nombre = x.producto
WHERE p.id_producto IS NULL;

COMMIT;

-- Verificar productos por negocio
SELECT
    n.nombre AS negocio,
    COUNT(p.id_producto) AS total_productos
FROM negocios n
LEFT JOIN productos p
    ON p.id_negocio = n.id_negocio
GROUP BY n.id_negocio, n.nombre
ORDER BY n.id_negocio;