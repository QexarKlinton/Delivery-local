# Balance de deuda técnica

La deuda técnica se registra para hacer visibles las decisiones pendientes y evitar que los riesgos del proyecto queden ocultos.

| ID | Deuda técnica | Prioridad | Impacto | Solución propuesta |
|---|---|---|---|---|
| DT-001 | Cobertura de pruebas automatizadas todavía insuficiente | Alta | Los cambios podrían introducir errores sin detección temprana | Incorporar pruebas unitarias para lógica de negocio y pruebas de integración para endpoints críticos |
| DT-002 | Integración de pagos todavía no implementada | Alta | El flujo de compra no cubre todavía un proceso de pago completo | Definir proveedor de pagos, diseñar el flujo de confirmación y proteger las credenciales mediante variables de entorno |
| DT-003 | Infraestructura de producción aún pendiente | Media | El sistema no cuenta todavía con un entorno público permanente | Definir hosting, dominio, base de datos de producción y variables de entorno; posteriormente automatizar el despliegue |
| DT-004 | Notificaciones de cambios de pedido pendientes de una implementación completa | Media | El usuario puede no recibir información inmediata sobre el estado del pedido | Implementar notificaciones mediante correo o un mecanismo en tiempo real cuando el flujo principal esté estable |

## Criterio de prioridad

- **Alta:** afecta directamente una capacidad necesaria del sistema o la confiabilidad del desarrollo.
- **Media:** afecta experiencia, operación o despliegue, pero puede resolverse después de estabilizar el núcleo.

## Seguimiento

Cada deuda deberá convertirse en una tarea o issue cuando se programe su resolución. Al cerrarla se documentará el cambio mediante un commit y Pull Request.
