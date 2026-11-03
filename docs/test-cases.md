# Casos de prueba — Delivery Local

Este documento reúne los casos de prueba definidos para validar la integración técnica y la experiencia principal de pedido de Delivery Local.

> **Estado:** casos documentados y pendientes de ejecución en la aplicación. Los precios indicados son datos de prueba de ejemplo, no precios confirmados del catálogo.

## CP-INT-001 — Registro de pedido

**Tipo:** Prueba de integración  
**Proyecto:** Delivery Local

### Objetivo

Verificar que el frontend se comunique correctamente con la API REST y que el backend guarde un pedido en la base de datos MySQL.

### Componentes involucrados

- **Frontend:** React.
- **Backend:** Node.js y Express.
- **Base de datos:** MySQL.

### Precondiciones

1. La aplicación y la API están en funcionamiento.
2. La base de datos está conectada.
3. Existe un producto disponible en el catálogo.
4. El usuario puede acceder al formulario de pedido.

### Datos de prueba

| Campo | Valor |
|---|---|
| Producto | Hamburguesa |
| Cantidad | 2 |
| Precio unitario | $50 MXN |
| Total esperado | $100 MXN |

### Procedimiento

1. Ingresar al catálogo desde el frontend.
2. Seleccionar la hamburguesa y establecer la cantidad en 2.
3. Confirmar el pedido para que el frontend envíe la solicitud a la API.
4. Verificar que el backend valide los datos y registre el pedido en MySQL.
5. Comprobar que la respuesta de la API se muestre correctamente en el frontend.

### Resultado esperado

El pedido se registra correctamente en la base de datos, el total corresponde a $100 MXN y el frontend muestra la confirmación recibida de la API.

### Criterio de aprobación

La prueba se aprueba si los datos enviados desde el frontend coinciden con los almacenados en MySQL y la respuesta se muestra sin errores.

---

## CP-ACE-001 — Realizar un pedido de comida

**Tipo:** Prueba de aceptación  
**Proyecto:** Delivery Local

### Objetivo

Comprobar que un estudiante pueda realizar un pedido de comida mediante la aplicación de manera sencilla y que reciba una confirmación.

### Actor

Estudiante que utiliza Delivery Local.

### Precondiciones

1. La aplicación está disponible.
2. El catálogo muestra productos disponibles.
3. El estudiante puede acceder a la función de pedidos.

### Datos de prueba

| Campo | Valor |
|---|---|
| Usuario | Estudiante de prueba |
| Producto | Hamburguesa |
| Cantidad | 1 |
| Total esperado | $50 MXN |

### Procedimiento

1. El estudiante abre Delivery Local.
2. Consulta el catálogo de comida.
3. Selecciona una hamburguesa y agrega una unidad al pedido.
4. Revisa que el producto, la cantidad y el total sean correctos.
5. Confirma el pedido.
6. Verifica que la aplicación muestre un mensaje de confirmación y los datos del pedido.

### Resultado esperado

El estudiante puede completar el flujo de pedido sin dificultades, visualiza el producto y el total correctos y recibe una confirmación de que su pedido fue registrado.

### Criterio de aprobación

La prueba se aprueba si el usuario completa el proceso correctamente y la aplicación proporciona una confirmación clara del pedido.

---

## Registro de ejecución

| ID | Estado | Evidencia / observaciones |
|---|---|---|
| CP-INT-001 | Pendiente de ejecutar | Registrar resultado al probar frontend, API y MySQL. |
| CP-ACE-001 | Pendiente de ejecutar | Registrar resultado al validar el flujo desde la perspectiva del estudiante. |
