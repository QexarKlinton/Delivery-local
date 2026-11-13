# Delivery Local

Plataforma de delivery local para el entorno universitario de **CUTlaquepaque**, que permite consultar negocios, productos y realizar pedidos con entrega dentro del campus.

## Tecnologías

| Capa | Tecnología |
|---|---|
| Frontend | React + Vite |
| Backend | Node.js + Express |
| API | REST + JSON |
| Base de datos | MySQL / MariaDB |
| Conexión | mysql2 |

## Estructura actual

```text
Delivery-local/
├── DELIVERY_BACKEND/
│   ├── src/
│   │   ├── db.js
│   │   └── index.js
│   ├── .env.example
│   └── package.json
├── database/
│   ├── 01_schema.sql
│   └── 02_datos_iniciales.sql
├── docs/
├── frontend/
└── README.md
```

## 1. Preparar la base de datos

En MySQL Workbench:

1. Abre y ejecuta `database/01_schema.sql`.
2. Abre y ejecuta `database/02_datos_iniciales.sql`.

El segundo archivo registra los cinco negocios y sus 30 productos de ejemplo. Puede ejecutarse más de una vez sin duplicar esos registros.

La base de datos se llama **cutlaquepaque_delivery**.

## 2. Configurar y ejecutar el backend

Abre una terminal en la carpeta del proyecto y ejecuta:

```powershell
cd DELIVERY_BACKEND
Copy-Item .env.example .env
npm install
```

Edita `DELIVERY_BACKEND/.env` y coloca las credenciales reales de tu servidor MySQL. No subas ese archivo a GitHub; está excluido mediante `.gitignore`.

Inicia el backend:

```powershell
npm run dev
```

El servidor utiliza el puerto **4000** por defecto.

## 3. Ejecutar el frontend

Abre una segunda terminal:

```powershell
cd frontend
npm install
npm run dev
```

Vite utiliza el puerto **5173** y reenvía las solicitudes que comienzan con `/api` al backend en el puerto **4000**.

## 4. Rutas disponibles

| Método | Ruta | Función |
|---|---|---|
| GET | `/api/test-db` | Comprueba la conexión e informa la base utilizada |
| GET | `/api/roles` | Consulta los roles permitidos en `usuarios.rol` |
| GET | `/api/negocios` | Lista los negocios activos |
| GET | `/api/productos` | Lista los productos disponibles |
| GET | `/api/productos?id_negocio=1` | Filtra productos por negocio |

Con el frontend activo, estas rutas también pueden consultarse desde `http://localhost:5173/api/...`.

## 5. Reglas importantes del modelo

- Cada pedido pertenece a un usuario y a un solo negocio.
- Los productos de un pedido deben pertenecer al mismo negocio del pedido.
- El detalle conserva el negocio para validar esa relación mediante claves foráneas compuestas.
- El frontend se comunica con MySQL únicamente a través del backend.

## Estado

La estructura SQL, los datos iniciales y las rutas básicas de consulta están preparados. El registro de usuarios, autenticación, carrito, creación de pedidos y paneles de gestión se implementarán por etapas.
