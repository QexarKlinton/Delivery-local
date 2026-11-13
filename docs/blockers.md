# Bloqueos del proyecto Delivery Local

Este documento registra los bloqueos que afectan el avance del proyecto, sus causas, impacto y acciones propuestas para resolverlos.

---

### BLQ-001: Infraestructura
* **Descripción del bloqueo:** El equipo aún tiene dificultades para definir y configurar la infraestructura necesaria para ejecutar y publicar Delivery Local, incluyendo el servidor, la base de datos y el despliegue de la aplicación.
* **Problema:** Falta de estandarización y definición clara sobre los entornos de ejecución, alojamiento en la nube y herramientas de despliegue continuo.
* **Impacto:** Retraso en las pruebas en entornos reales y bloqueo para compartir avances funcionales fuera del entorno de desarrollo individual.
* **Tipo:** Técnico / Infraestructura.
* **Nivel de escalamiento:** Alto.
* **Intentos previos:** Investigación de las herramientas disponibles y revisión de las tecnologías necesarias para desarrollar el proyecto.
* **Solución / Acción propuesta:** Definir el stack definitivo de infraestructura, configurar primero un entorno local funcional estandarizado y realizar pruebas de despliegue en un entorno *staging* antes de pasar a producción.
* **Responsable:** Todo el equipo de desarrollo.
* **Fecha:** 29/10/2026.

---

### BLQ-002: Conocimiento y experiencia en desarrollo
* **Descripción del bloqueo:** El equipo no tiene experiencia previa suficiente desarrollando aplicaciones completas, por lo que necesita aprender y aplicar conocimientos de frontend, backend, APIs, bases de datos e integración de componentes.
* **Problema:** Curva de aprendizaje pronunciada al abordar simultáneamente múltiples capas de la arquitectura full-stack.
* **Impacto:** Disminución en la velocidad de entrega de módulos, aumento en la probabilidad de deuda técnica y errores de arquitectura en etapas tempranas.
* **Tipo:** Técnico / Capacitación.
* **Nivel de escalamiento:** Alto.
* **Intentos previos:** Investigación de tecnologías, consulta de documentación y revisión de la arquitectura propuesta para el proyecto.
* **Solución / Acción propuesta:** Dividir el desarrollo en tareas pequeñas e incrementales, crear prototipos funcionales aislados, consultar documentación oficial y realizar sesiones breves de transferencia de conocimiento (*pair programming* o revisiones de código) para facilitar la integración.
* **Responsable:** Todo el equipo de desarrollo.
* **Fecha:** 29/10/2026.

---

### BLQ-003: Configuración y conectividad de base de datos
* **Descripción del bloqueo:** Dificultades para diseñar el esquema relacional y establecer una conectividad funcional entre el servidor backend y la base de datos.
* **Problema:** Discrepancia en los nombres de tablas, columnas y parámetros entre la definición de la base de datos y las consultas/modelos del backend, provocando que el sistema no capture ni devuelva la información correctamente.
* **Impacto:** Imposibilidad de almacenar o consultar datos reales de usuarios, productos y pedidos, deteniendo el funcionamiento de los endpoints CRUD.
* **Tipo:** Técnico / Base de Datos y Backend.
* **Nivel de escalamiento:** Alto.
* **Intentos previos:** Elaboración de borradores del diagrama entidad-relación (DER) y pruebas de conexión local aisladas.
* **Solución / Acción propuesta:** Estandarizar el diccionario de datos asegurando que los nombres de tablas y campos coincidan exactamente entre el script SQL y los modelos del backend, centralizar las migraciones en el repositorio y configurar un `.env.example` con las credenciales de conexión.
* **Responsable:** Equipo de desarrollo (área de Backend / Datos).
* **Fecha:** 10/11/2026.

---

### BLQ-004: Validación de formularios
* **Descripción del bloqueo:** Errores en el manejo de estados, expresiones regulares y reglas de negocio en los formularios de registro, inicio de sesión y creación de pedidos tanto en el cliente como en el servidor.
* **Problema:** Los formularios permiten el envío de datos incompletos o con formatos inválidos, o bloquean envíos válidos por falta de sincronización entre las reglas del frontend y del backend.
* **Impacto:** Fallos en la experiencia de usuario (UX), errores `400 Bad Request` no controlados y riesgo de almacenar datos corruptos o nulos en la base de datos.
* **Tipo:** Técnico / Frontend y Backend.
* **Nivel de escalamiento:** Medio.
* **Intentos previos:** Implementación de validaciones básicas nativas de HTML5 y pruebas manuales de captura.
* **Solución / Acción propuesta:** Estandarizar los esquemas de validación en cliente y servidor, mostrar mensajes de error claros por campo en la interfaz y asegurar que el backend valide cada petición antes de procesarla.
* **Responsable:** Equipo de desarrollo (Frontend y Backend).
* **Fecha:** 10/11/2026.

---

### BLQ-005: Integración de backend y frontend (Autenticación y Carrito)
* **Descripción del bloqueo:** Problemas de conectividad y funcionamiento al enlazar las acciones principales de la interfaz de usuario con los endpoints del backend.
* **Problema:** Fallos en los eventos y peticiones de los botones de **inicio de sesión** y **carrito**, ausencia del botón de **agregar al carrito** en las tarjetas/vistas de productos y desajuste entre los nombres de los campos enviados por el backend y los esperados por el frontend.
* **Impacto:** El flujo principal de compra e identificación de usuarios queda interrumpido, impidiendo autenticar sesiones o gestionar pedidos de extremo a extremo.
* **Tipo:** Técnico / Integración Full-Stack.
* **Nivel de escalamiento:** Alto.
* **Intentos previos:** Pruebas individuales de rutas mediante clientes HTTP y renderizado de vistas con datos estáticos.
* **Solución / Acción propuesta:** Incorporar el componente/botón de **agregar al carrito** en el catálogo, corregir los manejadores de eventos (`onClick`/`onSubmit`) en inicio de sesión y carrito, alinear los nombres de propiedades JSON entre backend y frontend, y habilitar correctamente CORS en el servidor.
* **Responsable:** Todo el equipo de desarrollo.
* **Fecha:** 10/11/2026.

---

### BLQ-006: Conflictos con GitHub
* **Descripción del bloqueo:** Dificultades en el flujo de trabajo colaborativo con Git y GitHub, incluyendo conflictos de fusión (*merge conflicts*), pérdida o sobreescritura de cambios y falta de una estrategia de ramas definida.
* **Problema:** Múltiples integrantes editan los mismos archivos simultáneamente directamente sobre la rama principal (`main`) o realizan *pulls/pushes* sin resolver diferencias previas.
* **Impacto:** Pérdida de tiempo de desarrollo resolviendo código roto, bloqueos para subir avances nuevos y riesgo de desestabilizar versiones que ya funcionaban.
* **Tipo:** Operativo / Control de Versiones.
* **Nivel de escalamiento:** Medio.
* **Intentos previos:** Subida directa de archivos y resolución manual de conflictos sin una guía de comandos estándar.
* **Solución / Acción propuesta:** Adoptar un flujo basado en ramas por funcionalidad (`feature/nombre-tarea`), prohibir los *push* directos a `main`, exigir *Pull Requests* con revisión rápida antes de fusionar y establecer la regla de ejecutar `git pull` antes de iniciar cualquier sesión de trabajo.
* **Responsable:** Todo el equipo de desarrollo.
* **Fecha:** 10/11/2026.

---

### Seguimiento
* Revisar estos bloqueos periódicamente en las reuniones del equipo.
* Cuando se resuelvan, registrar las acciones realizadas, la fecha de cierre y actualizar su estado (`Abierto`, `En progreso`, `Resuelto`) para mantener un seguimiento claro del avance.
