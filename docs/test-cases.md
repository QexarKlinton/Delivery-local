# Casos de prueba — Delivery Local

Este documento reúne los casos de prueba definidos para validar la integración técnica y la experiencia principal de pedido de Delivery Local.

> **Estado:** casos documentados y pendientes de ejecución en la aplicación. Los precios indicados son datos de prueba de ejemplo, no precios confirmados del catálogo.



## CP-INT-001 — Inicio de sesión

> **Tipo:** Prueba de integración
**Proyecto:** Cutlaquepaque Delivery

**Objetivo**

Verificar que el frontend se comunique correctamente con la API REST y que el backend valide las credenciales del usuario consultando la base de datos MySQL.

**Componentes involucrados**

- Frontend: React.
- Backend: Node.js y Express.
- Base de datos: MySQL.

**Precondiciones**

1. La aplicación y la API están en funcionamiento.
2. La base de datos está conectada.
3. Existe un usuario previamente registrado.
4. El usuario se encuentra en la pantalla de inicio de sesión.

**Datos de prueba**

--
Campo | Valor
Correo electrónico | estudiante@cutlaquepaque.edu.mx
Contraseña | Clave12345
Usuario | Estudiante registrado
--

**Procedimiento**

1. Ingresar a la pantalla de inicio de sesión desde el frontend.
2. Introducir el correo electrónico y la contraseña registrados.
3. Presionar el botón de iniciar sesión.
4. Verificar que el frontend envíe las credenciales a la API REST.
5. Comprobar que el backend valide las credenciales consultando MySQL.
6. Verificar que la API responda correctamente y permita el acceso al usuario.

**Resultado esperado**

El backend valida las credenciales y permite el acceso al estudiante. El frontend recibe la respuesta de autenticación y redirige al usuario a la página principal de la aplicación.

**Criterio de aprobación**

La prueba se aprueba si las credenciales coinciden con las almacenadas en MySQL, la API responde correctamente y el usuario puede acceder sin errores.

---

## CP-INT-002 — Contraseña incorrecta

> **Tipo:** Prueba de integración
> **Proyecto:** Cutlaquepaque Delivery

**Objetivo**

Comprobar que el backend identifique una contraseña incorrecta y que el frontend muestre un mensaje de error sin permitir el acceso a la cuenta.

**Componentes involucrados**

- Frontend: React.
- Backend: Node.js y Express.
- Base de datos: MySQL.

**Precondiciones**

1. La aplicación y la API están en funcionamiento.
2. La base de datos está conectada.
3. Existe un usuario registrado.
4. El usuario se encuentra en la pantalla de inicio de sesión.

**Datos de prueba**

Campo| Valor
Correo electrónico| estudiante@cutlaquepaque.edu.mx
Contraseña| Incorrecta123
Estado de la cuenta| Activa

**Procedimiento**

1. Ingresar a la pantalla de inicio de sesión.
2. Introducir un correo electrónico registrado.
3. Introducir una contraseña incorrecta.
4. Presionar el botón de iniciar sesión.
5. Verificar que el frontend envíe los datos a la API.
6. Comprobar que el backend compare la contraseña con el hash almacenado en MySQL.
7. Verificar que la API devuelva una respuesta de autenticación fallida.

**Resultado esperado**

El sistema rechaza el acceso, mantiene al usuario fuera de su cuenta y muestra un mensaje indicando que el correo electrónico o la contraseña son incorrectos.

**Criterio de aprobación**

La prueba se aprueba si el backend detecta la contraseña incorrecta, no genera una sesión válida y el frontend muestra el mensaje correspondiente.

---

## CP-INT-003 — Validación de campos vacíos

> **Tipo:** Prueba de integración
> **Proyecto:** Cutlaquepaque Delivery

**Objetivo**

Verificar que el sistema identifique los campos vacíos durante el inicio de sesión y evite enviar información incompleta al backend.

**Componentes involucrados**

- Frontend: React.
- Backend: Node.js y Express.
- Base de datos: MySQL.

**Precondiciones**

1. La aplicación está en funcionamiento.
2. La API REST está disponible.
3. El usuario se encuentra en la pantalla de inicio de sesión.

**Datos de prueba**

Campo| Valor
Correo electrónico| Vacío
Contraseña| Vacía
Acción| Presionar iniciar sesión

**Procedimiento**

1. Abrir la pantalla de inicio de sesión.
2. Dejar vacíos los campos de correo electrónico y contraseña.
3. Presionar el botón de iniciar sesión.
4. Verificar que el frontend identifique los campos obligatorios.
5. Comprobar que no se envíe una solicitud de autenticación con datos incompletos.
6. Revisar que se muestren los mensajes de validación correspondientes.

**Resultado esperado**

El sistema identifica que los campos están vacíos, muestra mensajes solicitando completar la información y evita que se realice el inicio de sesión.

**Criterio de aprobación**

La prueba se aprueba si el frontend identifica los campos vacíos, impide continuar y no permite una autenticación con información incompleta.

---

## CP-INT-004 — Registro de pedido

> **Tipo:** Prueba de integración
> **Proyecto:** Cutlaquepaque Delivery

**Objetivo**

Verificar que el frontend se comunique correctamente con la API REST y que el backend guarde un pedido en la base de datos MySQL, relacionándolo con el usuario y el negocio correspondiente.

**Componentes involucrados**

- Frontend: React.
- Backend: Node.js y Express.
- Base de datos: MySQL.

**Precondiciones**

1. La aplicación y la API están en funcionamiento.
2. La base de datos está conectada.
3. Existe un usuario registrado con sesión iniciada.
4. Existe un negocio disponible en el catálogo.
5. Existe un producto disponible en dicho negocio.

**Datos de prueba**

Campo| Valor
Negocio| Tacos Beny
Producto| Taco de bistec
Cantidad| 2
Precio unitario| $20 MXN
Total esperado| $40 MXN
Punto de entrega| Entrada principal del Cutlaquepaque

**Procedimiento**

1. Ingresar al catálogo desde el frontend.
2. Seleccionar el negocio Tacos Beny.
3. Seleccionar dos tacos de bistec.
4. Verificar que el frontend calcule el total del pedido.
5. Confirmar el pedido para que el frontend envíe la solicitud a la API.
6. Verificar que el backend valide los datos y registre el pedido en MySQL.
7. Comprobar que se almacenen los registros correspondientes en las tablas "pedidos" y "detalle_pedidos".
8. Verificar que la respuesta de la API se muestre correctamente en el frontend.

**Resultado esperado**

El pedido se registra correctamente en MySQL, se relaciona con el usuario y el negocio correspondiente, el total es de $40 MXN y el frontend muestra una confirmación con el punto de entrega establecido.

**Criterio de aprobación**

La prueba se aprueba si los datos enviados desde el frontend coinciden con los almacenados en MySQL, el total es correcto y la respuesta de la API se muestra sin errores.

---

## CP-INT-005 — Consulta de pedido

> **Tipo:** Prueba de integración
> **Proyecto:** Cutlaquepaque Delivery

**Objetivo**

Comprobar que el usuario pueda consultar los pedidos realizados y que la información recuperada desde MySQL sea enviada correctamente por el backend al frontend.

**Componentes involucrados**

- Frontend: React.
- Backend: Node.js y Express.
- Base de datos: MySQL.

**Precondiciones**

1. La aplicación y la API están en funcionamiento.
2. La base de datos está conectada.
3. Existe un usuario registrado con sesión iniciada.
4. El usuario tiene al menos un pedido previamente registrado.

**Datos de prueba**

Campo| Valor
ID del pedido| 1
Usuario| Estudiante registrado
Negocio| Tacos Beny
Producto| Taco de bistec
Cantidad| 2
Total| $40 MXN
Estado| Pendiente

**Procedimiento**

1. Iniciar sesión en la aplicación.
2. Acceder a la sección de mis pedidos.
3. Seleccionar el pedido que se desea consultar.
4. Verificar que el frontend solicite la información a la API REST.
5. Comprobar que el backend consulte las tablas "pedidos" y "detalle_pedidos" en MySQL.
6. Verificar que la API devuelva la información correspondiente.
7. Comprobar que el frontend muestre los detalles del pedido.

**Resultado esperado**

El sistema muestra correctamente la información del pedido, incluyendo el negocio, los productos, las cantidades, el total y el estado actual.

**Criterio de aprobación**

La prueba se aprueba si la información mostrada en el frontend coincide con los registros almacenados en MySQL y corresponde al usuario autenticado.

---

## CP-INT-006 — Acceso con sesión inválida

> **Tipo:** Prueba de integración
> **Proyecto:** Cutlaquepaque Delivery

**Objetivo**

Verificar que el backend impida el acceso a las funciones privadas cuando un usuario no cuenta con una sesión válida o intenta utilizar un token de autenticación inválido.

**Componentes involucrados**

- Frontend: React.
- Backend: Node.js y Express.
- Base de datos: MySQL.

**Precondiciones**

1. La aplicación y la API están en funcionamiento.
2. La base de datos está conectada.
3. Existe una sección privada para consultar pedidos.
4. El usuario no tiene una sesión activa o utiliza un token inválido.

**Datos de prueba**

Campo| Valor
Usuario| Sin sesión activa
Token de autenticación| Inválido
Recurso solicitado| Mis pedidos
Método HTTP| GET

**Procedimiento**

1. Abrir la aplicación sin iniciar sesión.
2. Intentar acceder directamente a la sección de mis pedidos.
3. Verificar que el frontend realice una solicitud a la API REST.
4. Comprobar que el backend valide el token de autenticación.
5. Verificar que la API rechace la solicitud por falta de autorización.
6. Comprobar que el frontend redirija al usuario a la pantalla de inicio de sesión.

**Resultado esperado**

El backend rechaza el acceso a la información privada y devuelve una respuesta de autorización no válida (HTTP 401). El frontend impide consultar los pedidos y solicita iniciar sesión.

**Criterio de aprobación**

La prueba se aprueba si el sistema bloquea el acceso, no entrega información privada y redirige al usuario a la pantalla de inicio de sesión.

---

## CP-INT-007 — Validación de datos obligatorios en el registro

> **Tipo:** Prueba de integración
> **Proyecto:** Cutlaquepaque Delivery

**Objetivo**

Verificar que el formulario de registro y el backend validen los campos obligatorios antes de almacenar un nuevo usuario en la base de datos MySQL.

**Componentes involucrados**

- Frontend: React.
- Backend: Node.js y Express.
- Base de datos: MySQL.

**Precondiciones**

1. La aplicación y la API están en funcionamiento.
2. La base de datos está conectada.
3. El usuario se encuentra en la pantalla de registro.
4. No existe un registro previo con los datos de prueba.

**Datos de prueba**

Campo| Valor
Nombre| Vacío
Correo electrónico| estudiante2@cutlaquepaque.edu.mx
Contraseña| Clave12345
Matrícula| 123456
Teléfono| 3312345678

**Procedimiento**

1. Acceder al formulario de registro.
2. Introducir los datos de prueba dejando vacío el campo de nombre.
3. Presionar el botón de registrarse.
4. Verificar que el frontend identifique el campo obligatorio faltante.
5. Comprobar que el backend también valide la información recibida si se intenta enviar la solicitud directamente.
6. Verificar que no se almacene un usuario incompleto en MySQL.

**Resultado esperado**

El sistema detecta que falta el nombre del estudiante, muestra un mensaje de validación y rechaza el registro. No se crea ningún usuario incompleto en la tabla "usuarios".

**Criterio de aprobación**

La prueba se aprueba si el sistema identifica el campo faltante, rechaza la solicitud y mantiene sin modificaciones la tabla "usuarios".

---

## CP-INT-008 — Consulta de negocios disponibles

> **Tipo:** Prueba de integración
> **Proyecto:** Cutlaquepaque Delivery

**Objetivo**

Verificar que el frontend obtenga correctamente desde la API REST la información de los negocios registrados en MySQL y los muestre en el catálogo de la aplicación.

**Componentes involucrados**

- Frontend: React.
- Backend: Node.js y Express.
- Base de datos: MySQL.

**Precondiciones**

1. La aplicación y la API están en funcionamiento.
2. La base de datos está conectada.
3. Los cinco negocios están registrados en la tabla "negocios".
4. Los negocios se encuentran activos.
5. El usuario puede acceder al catálogo.

**Datos de prueba**

ID| Negocio| Estado
1| Tamales Mary| Activo
2| Tacos Beny| Activo
3| Fonda de Lety| Activo
4| Lonches Mario| Activo
5| Aguas Frescas La Michoacana| Activo

**Procedimiento**

1. Ingresar a la aplicación.
2. Acceder a la sección de negocios disponibles.
3. Verificar que el frontend solicite la información a la API REST.
4. Comprobar que el backend consulte la tabla "negocios" en MySQL.
5. Verificar que la API devuelva los establecimientos activos.
6. Comprobar que el frontend muestre correctamente los cinco negocios.
7. Comparar la información mostrada con los registros almacenados en la base de datos.

**Resultado esperado**

El sistema recupera y muestra correctamente los cinco establecimientos registrados: Tamales Mary, Tacos Beny, Fonda de Lety, Lonches Mario y Aguas Frescas La Michoacana.

**Criterio de aprobación**

La prueba se aprueba si el frontend muestra los cinco negocios activos y la información coincide con los registros almacenados en MySQL.
