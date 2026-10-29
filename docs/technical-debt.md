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
