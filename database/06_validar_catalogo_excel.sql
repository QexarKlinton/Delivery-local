-- ==============================================
-- VALIDACION DEL CATALOGO IMPORTADO DESDE EXCEL
-- ==============================================
USE cutlaquepaque_delivery;

SELECT COUNT(*) AS negocios_importados FROM negocios WHERE fila_fuente IS NOT NULL;
SELECT COUNT(*) AS productos_importados FROM productos WHERE fila_excel IS NOT NULL;
SELECT COUNT(*) AS categorias FROM categorias;
SELECT COUNT(*) AS variantes FROM producto_variantes;
SELECT COUNT(*) AS puntos_entrega_cutlaquepaque FROM puntos_entrega WHERE activo=TRUE;
SELECT tipo,COUNT(*) AS cantidad FROM puntos_entrega WHERE activo=TRUE GROUP BY tipo;

SELECT n.nombre AS negocio, COUNT(p.id_producto) AS productos
FROM negocios n
LEFT JOIN productos p ON p.id_negocio=n.id_negocio AND p.fila_excel IS NOT NULL
WHERE n.fila_fuente IS NOT NULL
GROUP BY n.id_negocio,n.nombre
ORDER BY n.nombre;

-- Debe devolver 0 filas: productos importados sin negocio.
SELECT p.id_producto,p.nombre,p.fila_excel
FROM productos p LEFT JOIN negocios n ON n.id_negocio=p.id_negocio
WHERE p.fila_excel IS NOT NULL AND n.id_negocio IS NULL;

-- Revisar el duplicado de nombre que existe en el Excel (Makito sushi).
SELECT n.nombre AS negocio,p.nombre,COUNT(*) AS registros, GROUP_CONCAT(p.fila_excel ORDER BY p.fila_excel) AS filas_excel
FROM productos p INNER JOIN negocios n ON n.id_negocio=p.id_negocio
WHERE p.fila_excel IS NOT NULL
GROUP BY n.nombre,p.nombre HAVING COUNT(*)>1;

-- Los cinco negocios de ejemplo anteriores deben quedar inactivos si existian.
SELECT nombre,activo FROM negocios
WHERE nombre IN ('Tamales Mary','Tacos Beny','Fonda de Lety','Lonches Mario','Aguas Frescas La Michoacana');
