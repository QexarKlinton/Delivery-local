# Registro de importación del catálogo de negocios

## Fuente

- Archivo: `menu_completoo.xlsx`
- Hoja: `Hoja1`
- Rango de datos utilizado: filas 2 a 74
- Columnas interpretadas: información del negocio, responsable, contacto, ubicación, horario, observaciones, productos, categorías, precios, disponibilidad, existencias, variantes, preparación y puntos de entrega.

## Registros integrados

| Tipo de dato | Cantidad |
|---|---:|
| Negocios | 6 |
| Responsables/vendedores | 6 |
| Productos | 73 |
| Categorías | 17 |
| Variantes estructuradas | 37 |
| Puntos oficiales de entrega en CUTlaquepaque | 21 |

### Negocios

1. La Esquina del Sazón — 15 productos.
2. Mariscos Lalo'S 1. — 18 productos.
3. Makito sushi. — 11 productos.
4. MERAKI RESTAURANT PIZZERIA — 9 productos.
5. Peinecillo's Gril. — 10 productos.
6. Paleteria Dani. — 10 productos.

## Mapeo a tablas

- `vendedores`: nombre del propietario/responsable, teléfono y correo tal como aparecen en el Excel.
- `negocios`: nombre, descripción, dirección, teléfono, horario, observaciones, referencia de fila y responsable relacionado.
- `categorias`: categorías de productos. Se unificaron únicamente diferencias de mayúsculas/minúsculas para evitar categorías duplicadas como `POSTRE` y `postre`.
- `productos`: nombre, descripción, precio, categoría, disponibilidad, existencias, textos originales de variantes y precios de variantes, tiempo de preparación y número de fila del Excel.
- `producto_variantes`: opciones que se pudieron separar de forma directa. Se registraron 30 opciones de La Esquina del Sazón, 3 de Alitas y 4 sabores de Jugo Boing. Las variantes sin precio explícito quedan con precio `NULL`.
- `puntos_entrega`: 20 aulas y el edificio de Administración (CEMSAC), como ubicaciones oficiales para entregar pedidos dentro del CUTlaquepaque. Los nueve puntos comerciales que aparecían en el Excel no se usan como puntos institucionales de entrega.

## Decisiones para conservar la información

- Se conserva una fila por producto del Excel. En Makito sushi aparecen dos filas con el nombre `Jarra de Sake 240 ml`; ambas se importan por separado porque tienen existencias distintas. Por ello, el esquema no impone unicidad por nombre de producto y utiliza la fila original como identificador de importación.
- Los textos originales de disponibilidad, existencias no numéricas, variantes, precios de variantes y tiempos de preparación se guardan en columnas de texto. No se convierten en valores numéricos cuando el Excel no permite hacerlo con certeza.
- Los puntos comerciales externos descritos en el Excel no sustituyen las ubicaciones de entrega dentro de la universidad. La aplicación utilizará exclusivamente las 20 aulas y el edificio de Administración (CEMSAC).
- Los cinco negocios de ejemplo de la versión anterior se desactivan, no se eliminan, para no afectar pedidos o historial que pudiera existir.
- No se crean cuentas de acceso para vendedores: el Excel no contiene contraseñas ni credenciales de autenticación. Solo se importan los datos de contacto.

## Datos que requieren completar posteriormente

- Los campos de correo de Makito sushi. (`MAKITOSGSHIGDL.COM.MX`) y Paleteria Dani. (`paletasdani12gmail.com`) se conservan exactamente como aparecen, pero su formato no parece ser una dirección de correo completa.
- Algunos negocios tienen `No disponible` en correo; se conserva ese dato como texto.
- Las celdas de fotografía/logotipo muestran `#VALUE!` o están vacías. Aunque el archivo contiene recursos gráficos incrustados, no aporta URL públicas que la aplicación pueda usar. Por ello `negocios.logo_url` y `productos.imagen_url` quedan en `NULL`; las imágenes no se subieron a GitHub ni a un servicio de almacenamiento.
- Algunos nombres, descripciones y tiempos de preparación presentan inconsistencias o texto explicativo del Excel. Se conserva el contenido fuente, con limpieza de espacios y eliminación de encabezados repetidos cuando estaban escritos dentro de la celda.

## Archivos relacionados

- `01_schema.sql`: estructura completa para una instalación nueva.
- `02_datos_iniciales.sql`: importación idempotente de los datos del Excel.
- `05_migrar_catalogo_excel.sql`: ampliación de una base creada con el esquema anterior.
- `06_validar_catalogo_excel.sql`: consultas de comprobación posteriores a la importación.