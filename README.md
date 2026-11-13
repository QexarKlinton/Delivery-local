# Delivery Local

Plataforma de delivery local para el entorno universitario de **CUTlaquepaque**, que permite consultar negocios, productos y realizar pedidos con entrega en los puntos registrados.

## Tecnologías

| Capa | Tecnología |
|---|---|
| Frontend | React + Vite |
| Backend | Node.js + Express |
| API | REST + JSON |
| Base de datos | MySQL / MariaDB |
| Conexión | mysql2 |

## Estructura principal

```text
Delivery-local/
├── DELIVERY_BACKEND/
│   ├── src/db.js
│   ├── src/index.js
│   └── .env.example
├── database/
│   ├── 00_importacion_excel.md
│   ├── 01_schema.sql
│   ├── 02_datos_iniciales.sql
│   ├── 03_validar_migracion_pedidos.sql
│   ├── 04_migrar_integridad_pedidos.sql
│   ├── 05_migrar_catalogo_excel.sql
│   └── 06_validar_catalogo_excel.sql
├── frontend/
└── README.md
```

## 1. Catálogo definitivo importado

El catálogo de negocios se integró desde `menu_completoo.xlsx` (Hoja1):

- 6 negocios y sus responsables/contactos.
- 73 productos con descripción, precio, categoría, disponibilidad, existencias, variantes informadas y tiempo de preparación.
- 17 categorías de producto normalizadas por nombre (se unificaron diferencias de mayúsculas/minúsculas).
- 37 variantes estructuradas cuando el Excel proporcionó opciones identificables; los textos originales de variantes y precios también se conservan en cada producto.
- 9 puntos de entrega registrados.

Se conserva una referencia a la fila de origen del Excel (`fila_fuente` / `fila_excel`). Esto permite que el script sea repetible y conserva incluso los dos registros de “Jarra de Sake 240 ml” que aparecen en filas distintas del Excel.

Los cinco negocios de ejemplo del catálogo anterior (Tamales Mary, Tacos Beny, Fonda de Lety, Lonches Mario y Aguas Frescas La Michoacana) se desactivan, no se borran, para conservar cualquier historial que pudiera existir.

Las celdas de fotografía/logotipo del Excel contienen `#VALUE!` o están vacías; por eso los campos `imagen_url` y `logo_url` quedan en NULL. Las imágenes no se publican como archivos ni se inventan enlaces. Los correos y teléfonos se conservan como texto fuente, incluso cuando el Excel contiene formatos que requieren confirmación.

## 2. Preparar la base de datos

La base de datos se llama **cutlaquepaque_delivery**.

### Instalación nueva

1. Ejecuta `database/01_schema.sql`.
2. Ejecuta `database/02_datos_iniciales.sql`.
3. Ejecuta `database/06_validar_catalogo_excel.sql` y revisa los conteos.

### Si ya existe la base anterior del proyecto

1. Si todavía no migraste la integridad de pedidos, ejecuta `database/03_validar_migracion_pedidos.sql`. Solo si `detalles_con_negocio_incorrecto` es 0, ejecuta una vez `database/04_migrar_integridad_pedidos.sql`.
2. Ejecuta una sola vez `database/05_migrar_catalogo_excel.sql` para agregar las columnas y tablas del catálogo ampliado.
3. Ejecuta `database/02_datos_iniciales.sql` para importar el catálogo.
4. Ejecuta `database/06_validar_catalogo_excel.sql`.

No ejecutes `01_schema.sql` esperando que modifique tablas ya existentes: `CREATE TABLE IF NOT EXISTS` no altera estructuras anteriores. No vuelvas a ejecutar la migración 04 si ya fue aplicada. El script 02 puede repetirse sin duplicar los registros importados.

## 3. Modelo de datos

- `usuarios`: cuentas de estudiantes, administradores y rol disponible para vendedores.
- `vendedores`: responsables y datos de contacto capturados en el Excel. No se crean cuentas ni contraseñas de vendedor.
- `negocios`: información, ubicación, teléfono, horario, observaciones y responsable.
- `categorias`: catálogo normalizado de categorías de productos.
- `productos`: descripción, precio, disponibilidad, inventario, variantes fuente, preparación y fila de origen.
- `producto_variantes`: opciones que se pudieron separar sin adivinar datos.
- `puntos_entrega`: ubicaciones, referencias, descripción y disponibilidad de entrega.
- `pedidos` y `detalle_pedidos`: conservan las reglas de integridad para que cada pedido pertenezca a un negocio y sus productos correspondan a ese mismo negocio.

## 4. Configurar y ejecutar el backend

```powershell
cd DELIVERY_BACKEND
Copy-Item .env.example .env
npm install
npm run dev
```

Edita `.env` con las credenciales reales de MySQL. No subas ese archivo a GitHub. El backend utiliza el puerto 4000 por defecto.

## 5. Ejecutar el frontend

En otra terminal:

```powershell
cd frontend
npm install
npm run dev
```

Vite utiliza el puerto 5173 y reenvía las solicitudes `/api` al backend en el puerto 4000.

## 6. Rutas API

| Método | Ruta | Función |
|---|---|---|
| GET | `/api/test-db` | Comprueba la conexión y muestra la base utilizada |
| GET | `/api/roles` | Consulta los roles disponibles |
| GET | `/api/negocios` | Lista negocios activos y datos de responsable |
| GET | `/api/negocios/:id/puntos-entrega` | Lista puntos de entrega de un negocio |
| GET | `/api/productos` | Lista productos disponibles con categoría |
| GET | `/api/productos?id_negocio=1` | Filtra productos por negocio |
| GET | `/api/productos/:id/variantes` | Lista variantes estructuradas de un producto |

## Estado

El esquema y el catálogo del Excel están preparados en GitHub. Los scripts SQL deben ejecutarse en MySQL Workbench para aplicar los cambios a la instancia local. El frontend todavía requiere conectar sus componentes a los endpoints reales.