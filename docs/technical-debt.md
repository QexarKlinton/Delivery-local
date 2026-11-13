# Balance de deuda técnica

La deuda técnica se registra para hacer visibles las decisiones pendientes y evitar que los riesgos del proyecto queden ocultos.

## DT-001: Pruebas insuficientes

- **Descripción:** El sistema necesita más pruebas para comprobar el funcionamiento de los pedidos, usuarios y respuestas de la API.
- **Impacto/consecuencias:** Los errores podrían llegar a producción y afectar a los usuarios.
- **Solución:** Implementar pruebas unitarias para la lógica de negocio y pruebas de integración para los endpoints críticos.
- **Prioridad:** Alta.
- **Fecha de registro:** 29/10/2026.

## DT-002: Despliegue e infraestructura pendientes

- **Descripción:** Se necesita completar la configuración del servidor y del entorno de producción.
- **Impacto/consecuencias:** La aplicación podría no estar disponible o presentar problemas de configuración.
- **Solución:** Configurar el hosting, las variables de entorno, HTTPS y los respaldos de la base de datos; definir la infraestructura de producción.
- **Prioridad:** Alta.
- **Fecha de registro:** 29/10/2026.

## DT-003: Notificaciones y pagos por completar

- **Descripción:** Las funciones de notificación de pedidos y procesamiento de pagos requieren definirse o completarse.
- **Impacto/consecuencias:** Los usuarios podrían no recibir actualizaciones oportunas y el flujo de compra podría quedar limitado.
- **Solución:** Definir las notificaciones de estado y evaluar una pasarela de pago segura antes de implementarla. Las credenciales deberán protegerse mediante variables de entorno.
- **Prioridad:** Media.
- **Fecha de registro:** 29/10/2026.

## Criterio de prioridad

- **Alta:** afecta directamente una capacidad necesaria del sistema o la confiabilidad del desarrollo.
- **Media:** afecta la experiencia, operación o despliegue, pero puede resolverse después de estabilizar el núcleo.

## Seguimiento

Cada deuda deberá convertirse en una tarea o issue cuando se programe su resolución. Al cerrarla, se documentará el cambio mediante un commit y Pull Request.

**Fecha de registro:** 29/10/2026.

# DT-004: Diseño responsive móvil incompleto

- **Descripción:** Algunas interfaces y componentes del sistema aún no han sido adaptados completamente para dispositivos móviles y diferentes resoluciones de pantalla.

- **Impacto/consecuencias:** Los usuarios que accedan desde teléfonos inteligentes o tabletas podrían experimentar problemas de visualización, navegación y usabilidad.

- **Solución:** Aplicar técnicas de diseño responsivo, utilizar Media Queries y realizar pruebas en distintos dispositivos para garantizar una experiencia de usuario consistente.

- **Prioridad:** Media.

- **Fecha de registro:** 10/11/2026.

# DT-005: Automatización de pruebas pendiente

- **Descripción:** Actualmente la validación de funcionalidades se realiza principalmente mediante pruebas manuales, sin una estrategia de pruebas automatizadas que facilite la detección temprana de errores.

- **Impacto/consecuencias:** Las futuras modificaciones podrían introducir fallos no detectados oportunamente, incrementando el riesgo de errores en producción y el tiempo de validación.

- **Solución:** Implementar pruebas automatizadas para los módulos principales del sistema, incluyendo pruebas unitarias, pruebas de integración y validaciones continuas durante el desarrollo.

- **Prioridad:** Alta.

- **Fecha de registro:** 10/11/2026.

  # DT-006: Optimización de consultas SQL pendiente

- **Descripción:** Algunas consultas y operaciones de acceso a la base de datos requieren optimización para mantener un rendimiento adecuado conforme aumente el volumen de información procesada.

- **Impacto/consecuencias:** El sistema podría presentar tiempos de respuesta lentos, consumo innecesario de recursos y una experiencia de usuario menos eficiente.

- **Solución:** Revisar las consultas críticas, aplicar índices cuando sea necesario, optimizar sentencias SQL y realizar pruebas de rendimiento sobre la base de datos.

- **Prioridad:** Media.

- **Fecha de registro:** 10/11/2026.
