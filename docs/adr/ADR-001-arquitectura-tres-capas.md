# ADR-001: Arquitectura de tres 

## Contexto

Delivery Local necesita separar la interfaz, las reglas de negocio y la persistencia de datos. El proyecto tiene un alcance académico y debe mantenerse comprensible y mantenible.

## Decisión

Utilizar una arquitectura de tres capas:

1. Presentación.
2. Lógica de negocio.
3. Datos.

## Justificación técnica

La separación reduce el acoplamiento entre la interfaz y la base de datos, permite modificar una capa con menor impacto sobre las demás y facilita las pruebas y el mantenimiento.

## Consecuencias

- La interfaz no accede directamente a MySQL.
- Las reglas de negocio se concentran en el backend.
- La estructura requiere mayor organización inicial.
- El sistema puede evolucionar posteriormente sin cambiar el modelo de capas base.

## Alternativas consideradas

- Arquitectura monolítica sin separación explícita.
- Microservicios.

Para el alcance actual, los microservicios añadirían complejidad operativa sin una necesidad técnica demostrada.
