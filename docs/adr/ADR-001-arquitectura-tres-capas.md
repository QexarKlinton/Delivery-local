# ADR-001: Arquitectura de tres capas

**Estado:** Aceptado  
**Fecha de registro:** 29 de octubre de 2026

## Contexto

Delivery Local necesita una estructura organizada que facilite el desarrollo, mantenimiento y crecimiento de la plataforma de pedidos de alimentos. Es necesario separar la interfaz, las reglas de negocio y la persistencia de datos.

## Decisión

Se utilizará una arquitectura de tres capas:

1. **Presentación:** React, HTML, CSS y JavaScript para la interfaz del usuario.
2. **Lógica de negocio:** Node.js y Express para procesar solicitudes mediante una API REST.
3. **Datos:** MySQL para almacenar usuarios, productos, pedidos y demás información.

## Alternativas consideradas

- **Aplicación monolítica sin separación clara de responsabilidades:** se descarta porque dificulta mantener límites claros entre la interfaz, la lógica y los datos.
- **Arquitectura de microservicios:** se descarta para el alcance actual porque añade complejidad operativa e infraestructura sin una necesidad técnica demostrada.

## Consecuencias

- La interfaz no accederá directamente a MySQL.
- Las reglas de negocio se concentrarán en el backend.
- La separación facilita las pruebas, el mantenimiento y las futuras mejoras.
- Será necesario configurar correctamente la comunicación entre el frontend, la API y la base de datos.
- La estructura requiere mayor organización inicial, pero permite que las capas evolucionen con menor impacto entre sí.
