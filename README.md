# Delivery Local

## Descripción

Plataforma web para la gestión de pedidos de entrega local que permite registrar usuarios y administrar solicitudes de entrega.

## Objetivo

Desarrollar una aplicación web que facilite el registro y seguimiento de solicitudes de entrega local.

## Tecnologías utilizadas

- HTML5
- CSS3
- JavaScript
- MySQL
- Git
- GitHub

### Herramientas del proyecto

- React y Vite para el frontend.
- Node.js y Express para el backend.
- `mysql2` para la conexión con MySQL.

## Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/QexarKlinton/Delivery-local.git
```

### 2. Acceder al proyecto

```bash
cd Delivery-local
```

### 3. Configurar la base de datos

La base de datos se llama `cutlaquepaque_delivery`. En MySQL Workbench, ejecuta estos archivos en orden:

1. `database/01_schema.sql`
2. `database/02_datos_iniciales.sql`
3. `database/06_validar_catalogo_excel.sql` para revisar los datos.

Después, configura la conexión del backend:

```powershell
cd DELIVERY_BACKEND
Copy-Item .env.example .env
npm install
```

Edita el archivo `DELIVERY_BACKEND/.env` con las credenciales de tu instalación local de MySQL. No compartas ni subas este archivo con credenciales a GitHub.

### 4. Ejecutar la aplicación

Inicia el backend desde `DELIVERY_BACKEND`:

```bash
npm run dev
```

En otra terminal, desde la raíz del proyecto, inicia el frontend:

```bash
cd frontend
npm install
npm run dev
```

Abre en el navegador la dirección local que indique Vite (normalmente `http://localhost:5173`).

## Base de datos

El proyecto utiliza **MySQL**. MariaDB no forma parte de las tecnologías indicadas para este proyecto.
