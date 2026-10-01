# ADR-002: Comunicación mediante API REST

- **Estado:** Aceptado
- **Fecha:** 2026-10-01

## Contexto

El frontend necesita consultar y modificar información de usuarios, productos y pedidos sin conectarse directamente a la base de datos.

## Decisión

Utilizar una API REST implementada con Node.js y Express, intercambiando información mediante HTTP y JSON.

## Justificación técnica

La API permite centralizar autenticación, autorización, validación y reglas de negocio. También establece un contrato claro entre frontend y backend.

## Consecuencias

- El frontend queda desacoplado de MySQL.
- Los endpoints deben documentarse y versionarse cuando sea necesario.
- El backend se convierte en el punto central de validación.
- Será necesario manejar errores HTTP de forma consistente.

## Alternativas consideradas

- Conexión directa del frontend a MySQL: descartada por seguridad y separación de responsabilidades.
- GraphQL: no se considera necesario para el alcance actual.
