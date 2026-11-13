# ADR-003: MySQL como sistema gestor de base de datos

**Estado:** Aceptado  
**Fecha de registro:** 29 de octubre de 2026

## Contexto

Delivery Local necesita almacenar y relacionar información de usuarios, alimentos, establecimientos y pedidos de manera consistente. El sistema manejará datos estructurados como usuarios, roles, productos, categorías, pedidos, detalles de pedidos y entregas.

## Decisión

Se utilizará MySQL como sistema gestor de base de datos relacional para la primera versión. La API de Node.js y Express será responsable de consultar y modificar los datos.

## Alternativas consideradas

- **PostgreSQL:** ofrece capacidades relacionales similares.
- **MongoDB:** utiliza un modelo de documentos y una estructura diferente.
## Justificación 

Se elige MySQL porque el alcance actual está orientado a un modelo relacional y sus necesidades previstas pueden cubrirse mediante tablas y consultas SQL.
Garantiza la integridad de los pedidos mediante transacciones y ofrece compatibilidad directa con Node.js.

## Consecuencias

- Se utilizarán tablas y relaciones definidas mediante SQL.
- Se controlará la integridad referencial mediante claves primarias y foráneas.
- Se podrán utilizar transacciones para mantener la integridad de los pedidos.
- El esquema deberá versionarse junto con el proyecto.
- Será necesario administrar los accesos y realizar respaldos periódicos.
- La infraestructura de producción se definirá posteriormente.
