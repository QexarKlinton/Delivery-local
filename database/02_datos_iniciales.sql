-- INSERSIONES 

INSERT INTO negocios
(nombre, descripcion, categoria, direccion)
VALUES
('Tamales Mary',
 'Venta de tamales',
 'Tamales',
 'Alrededores del Cutlaquepaque'),

('Tacos Beny',
 'Venta de tacos',
 'Tacos',
 'Alrededores del Cutlaquepaque'),

('Fonda de Lety',
 'Comida casera y platillos del día',
 'Comida corrida',
 'Alrededores del Cutlaquepaque'),

('Lonches Mario',
 'Venta de lonches y tortas',
 'Lonches',
 'Alrededores del Cutlaquepaque'),

('Aguas Frescas La Michoacana',
 'Venta de aguas frescas y bebidas',
 'Bebidas',
 'Alrededores del Cutlaquepaque');
 
 -- INSERSIÓN DE PRODUCTOS

INSERT INTO productos
(id_negocio, nombre, descripcion, precio)
VALUES
 -- TAMALES MARY
(1, 'Tamal verde', 'Tamal de salsa verde con cerdo', 18.00),
(1, 'Tamal rojo', 'Tamal de salsa roja con pollo', 18.00),
(1, 'Tamal de rajas', 'Tamal de rajas con queso', 18.00),
(1, 'Tamal dulce', 'Tamal dulce de piña con pasas', 16.00),
(1, 'Tamal de elote', 'Tamal dulce de elote tierno', 20.00),
(1, 'Atole de champurrado', 'Atole tradicional de chocolate', 22.00);

-- TACOS BENY
(2, 'Taco de bistec', 'Taco de bistec de res', 20.00),
(2, 'Taco de suadero', 'Taco de suadero suave', 20.00),
(2, 'Taco al pastor', 'Taco al pastor con piña', 20.00),
(2, 'Taco de chorizo', 'Taco de chorizo estilo la casa', 20.00),
(2, 'Gringa de pastor', 'Tortilla de harina con queso y pastor', 45.00),
(2, 'Vampiro de bistec', 'Tortilla dorada con queso y bistec', 35.00);

-- FONDA DE LETY
(3, 'Comida del día', 'Platillo principal con sopa y arroz', 75.00),
(3, 'Milanesa de pollo', 'Milanesa acompañada de papas y ensalada', 85.00),
(3, 'Pechuga a la plancha', 'Pechuga asada con guarnición', 80.00),
(3, 'Carne en su jugo', 'Tradicional carne en su jugo con frijoles', 90.00),
(3, 'Enchiladas rojas', 'Orden de 4 enchiladas rellenas de pollo', 70.00),
(3, 'Agua fresca del día', 'Vaso de agua fresca natural', 20.00);

-- LONCHES MARIO
(4, 'Lonche de pierna', 'Lonche bañado en salsa de tomate', 55.00),
(4, 'Lonche de panela', 'Lonche fresco con queso panela y aguacate', 50.00),
(4, 'Lonche mixto', 'Lonche de pierna con jamón y queso', 60.00),
(4, 'Torta ahogada de carnitas', 'Torta tradicional ahogada en salsa picante', 65.00),
(4, 'Orden de papas locas', 'Papas a la francesa con crema y queso', 45.00),
(4, 'Licuado de plátano', 'Licuado de plátano con leche', 30.00);

-- AGUAS FRESCAS LA MICHOACANA
(5, 'Agua de horchata', 'Agua fresca de horchata tradicional', 25.00),
(5, 'Agua de jamaica', 'Agua fresca de flor de jamaica', 25.00),
(5, 'Agua de limón con chía', 'Agua fresca de limón con chía', 25.00),
(5, 'Tejuino', 'Bebida tradicional de maíz con nieve de limón', 35.00),
(5, 'Biónico grande', 'Fruta picada con crema especial, granola y coco', 55.00),
(5, 'Fresas con crema', 'Postre de fresas naturales con crema de la casa', 50.00);

USE cutlaquepaque_delivery;

SHOW TABLES;

SELECT * FROM negocios;

SELECT * FROM usuarios;
