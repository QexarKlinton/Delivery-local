# ADR-003: MySQL como sistema gestor de base de datos

## Contexto

Delivery Local manejará información estructurada y relacionada: usuarios, roles, productos, categorías, pedidos, detalles de pedidos y entregas.

## Decisión

Utilizar MySQL como sistema gestor de base de datos para la primera versión.

## Justificación técnica

El dominio contiene relaciones entre entidades y requiere integridad referencial y consultas estructuradas. Un sistema relacional permite representar estas relaciones de manera directa.

## Consecuencias

- Se utilizarán tablas y relaciones definidas mediante SQL.
- Se deberán controlar claves primarias y foráneas.
- El esquema deberá versionarse junto con el proyecto.
- La infraestructura de producción se definirá posteriormente.

## Alternativas consideradas

- MongoDB.
- PostgreSQL.

No se seleccionan para esta primera versión porque el alcance académico ya está orientado a un modelo relacional y MySQL cubre los requerimientos previstos.
