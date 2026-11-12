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
(1, 'Tamal verde', 'Tamal de salsa verde', 18.00),
(2, 'Taco de bistec', 'Taco de bistec', 20.00),
(3, 'Comida del día', 'Platillo del día', 75.00),
(4, 'Lonche de pierna', 'Lonche de pierna', 55.00),
(5, 'Agua de horchata', 'Agua fresca de horchata', 25.00);

USE cutlaquepaque_delivery;

SHOW TABLES;

SELECT * FROM negocios;

SELECT * FROM usuarios;
