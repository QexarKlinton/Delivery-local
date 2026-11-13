# Product Backlog - Proyecto Delivery Local

**Autores:** Itzel Arleth Padilla Segura, Ramiro Preciado Martinez, Cesar Medina Hernandez, Armando Rodrigo Hernandez Barba, Daniel Alejandro Medina Amena[cite: 1].  
**Última actualización:** 13/11/2026

---

## 📋 Registro de Cambios y Justificación Arquitectónica

**Cambio realizado:** Eliminación del manejo de contraseñas y del módulo de recuperación de contraseña (anteriormente `HU-07`)[cite: 2]. Migración del flujo de registro e inicio de sesión a autenticación mediante **número telefónico**[cite: 1, 2].

* **¿Por qué se realizó este cambio?** Para agilizar la incorporación (*onboarding*) y el acceso de los clientes al realizar pedidos, eliminando fricciones al momento de autenticarse.
* **Justificación técnica y de negocio:** Se busca que la plataforma sea más fácil de utilizar, rápida y ligera, evitando el almacenamiento innecesario de datos sensibles (hashes de contraseñas, tokens de restablecimiento y correos secundarios) y reduciendo la carga en la base de datos al utilizar el número telefónico como identificador principal del cliente.

---

## 📊 Tabla General del Backlog

| ID | Historia de Usuario | Criterios de Aceptación | Funcionalidad | Prioridad (MoSCoW) | Estado |
| :--- | :--- | :--- | :--- | :---: | :---: |
| **HU-01** | Como usuario, quiero registrarme en el sistema ingresando mi número telefónico, para crear una cuenta rápidamente y poder acceder a sus funcionalidades[cite: 1]. | • **Dado que** no tengo una cuenta, **cuando** ingreso mi número telefónico y datos básicos válidos, **entonces** el sistema debe permitir crear mi cuenta[cite: 1].<br>• **Dado que** ingreso datos incompletos, **cuando** intento registrarme, **entonces** el sistema debe solicitar que complete los campos obligatorios[cite: 1].<br>• **Dado que** ingreso un número telefónico con formato inválido o ya registrado, **cuando** intento registrarme, **entonces** el sistema debe mostrar un mensaje de validación[cite: 1]. | Registro de usuario / Creación de cuenta[cite: 1] | **Must**[cite: 1] | Completada[cite: 4] |
| **HU-02** | Como usuario, quiero iniciar sesión únicamente con mi número telefónico, para acceder de forma rápida y sencilla al sistema sin necesidad de recordar contraseñas[cite: 1]. | • **Dado que** tengo una cuenta registrada, **cuando** ingreso correctamente mi número telefónico, **entonces** el sistema debe permitirme acceder[cite: 1].<br>• **Dado que** ingreso un número no registrado o con formato incorrecto, **cuando** intento iniciar sesión, **entonces** el sistema debe mostrar un mensaje de error[cite: 1].<br>• **Dado que** dejo el campo de teléfono vacío, **cuando** intento iniciar sesión, **entonces** el sistema debe solicitar que lo complete[cite: 1]. | Inicio de sesión / Autenticación[cite: 1] | **Must**[cite: 1] | Completada[cite: 4] |
| **HU-03** | Como usuario, quiero cerrar sesión, para proteger mi cuenta cuando termine de utilizar el sistema[cite: 1]. | • **Dado que** mi sesión está activa, **cuando** selecciono "Cerrar sesión", **entonces** el sistema debe finalizar mi sesión[cite: 1].<br>• **Dado que** cierro sesión, **cuando** regreso al inicio, **entonces** no deben mostrarse datos privados de mi cuenta[cite: 1]. | Cierre de sesión[cite: 1] | **Must**[cite: 1] | Completada |
| **HU-04** | Como usuario, quiero visualizar una pantalla de inicio, para conocer las principales opciones disponibles del sistema[cite: 1]. | • **Dado que** he iniciado sesión, **cuando** ingreso al sistema, **entonces** debe mostrarse la pantalla principal[cite: 1].<br>• **Dado que** estoy en la pantalla de inicio, **cuando** visualizo las opciones, **entonces** deben mostrarse de manera clara y organizada[cite: 1].<br>• **Dado que** selecciono una opción disponible, **cuando** hago clic sobre ella, **entonces** el sistema debe dirigirme a la sección correspondiente[cite: 1]. | Pantalla principal / Frontend[cite: 1] | **Must**[cite: 1] | Completada |
| **HU-05** | Como cliente, quiero consultar mi información, para conocer y administrar mis datos dentro del sistema[cite: 2]. | • **Dado que** tengo una cuenta registrada, **cuando** ingreso a mi perfil, **entonces** el sistema debe mostrar mi información[cite: 2].<br>• **Dado que** estoy consultando mi información, **cuando** reviso los datos, **entonces** deben corresponder con mi cuenta[cite: 2].<br>• **Dado que** no existe información disponible, **cuando** consulto mi perfil, **entonces** el sistema debe mostrar un mensaje claro indicando que no se encuentra la información[cite: 2]. | Consulta de información del cliente[cite: 2] | **Should**[cite: 2] | En proceso |
| **HU-06** | Como cliente, quiero actualizar mis datos personales, para mantener mi información actualizada[cite: 2]. | • **Dado que** estoy en mi perfil, **cuando** modifico un dato válido, **entonces** el sistema debe permitir guardarlo[cite: 2].<br>• **Dado que** ingreso información inválida, **cuando** intento guardar los cambios, **entonces** el sistema debe mostrar un mensaje de validación[cite: 2].<br>• **Dado que** guardo correctamente los cambios, **cuando** vuelvo a consultar mi perfil, **entonces** deben aparecer los nuevos datos[cite: 2]. | Actualización de datos[cite: 2] | **Should**[cite: 2] | Pendiente |
| ~~**HU-07**~~ | ~~Como usuario, quiero recuperar mi contraseña, para poder acceder nuevamente a mi cuenta si la olvido[cite: 2].~~ | *Historia descartada por simplificación de arquitectura (autenticación directa por teléfono sin contraseña).* | ~~Recuperación de contraseña~~[cite: 2] | ~~Could~~[cite: 2] | **Descartada** |
| **HU-08** | Como usuario, quiero recibir mensajes de confirmación o error, para saber si las acciones que realizo fueron exitosas[cite: 2]. | • **Dado que** realizo una acción correctamente, **cuando** el sistema la procesa, **entonces** debe mostrar un mensaje de confirmación[cite: 2].<br>• **Dado que** ocurre un error, **cuando** el sistema no puede completar la acción, **entonces** debe mostrar un mensaje explicando el error[cite: 2].<br>• **Dado que** aparece un mensaje, **cuando** lo visualizo, **entonces** debe ser claro y comprensible[cite: 2]. | Mensajes de error y confirmación[cite: 2] | **Must**[cite: 2] | Completada |
| **HU-09** | Como usuario, quiero navegar fácilmente entre las diferentes secciones, para utilizar el sistema de manera sencilla[cite: 2]. | • **Dado que** estoy dentro del sistema, **cuando** utilizo el menú de navegación, **entonces** debo poder acceder a las secciones disponibles[cite: 2].<br>• **Dado que** selecciono una sección, **cuando** hago clic en ella, **entonces** el sistema debe mostrar la página correspondiente[cite: 2].<br>• **Dado que** regreso a una sección anterior, **cuando** utilizo la navegación, **entonces** el sistema debe mantener la sesión activa[cite: 2]. | Navegación del sistema[cite: 2] | **Must**[cite: 2] | Completada |
| **HU-10** | Como usuario, quiero que el sistema valide mis datos antes de enviarlos, para evitar errores en la información registrada[cite: 3]. | • **Dado que** estoy llenando un formulario, **cuando** ingreso datos inválidos, **entonces** el sistema debe indicarme qué campo necesita corregirse[cite: 3].<br>• **Dado que** dejo un campo obligatorio vacío, **cuando** intento continuar, **entonces** el sistema no debe permitir el envío[cite: 3].<br>• **Dado que** todos los datos son válidos, **cuando** envío el formulario, **entonces** el sistema debe procesar la información correctamente[cite: 3]. | Validación de formularios[cite: 3] | **Must**[cite: 3] | En proceso |
| **HU-11** | Como administrador, quiero gestionar las cuentas de los usuarios, para mantener un control adecuado de las personas que utilizan el sistema[cite: 3]. | • **Dado que** soy administrador, **cuando** ingreso a la sección de usuarios, **entonces** debo poder visualizar las cuentas registradas[cite: 3].<br>• **Dado que** selecciono un usuario, **cuando** realizo una acción permitida, **entonces** el sistema debe aplicarla correctamente[cite: 3].<br>• **Dado que** un usuario no tiene permisos administrativos, **cuando** intenta acceder a esta sección, **entonces** el sistema debe denegarle el acceso[cite: 3]. | Administración de usuarios[cite: 3] | **Won't**[cite: 3] | En proceso[cite: 4] |

---

## 📌 Resumen del Tablero de Progreso

* **Completadas:**
  * Registro de usuarios (por número telefónico)[cite: 4]
  * Inicio de sesión (por número telefónico)[cite: 4]
  * Gestión de pedidos[cite: 4]
* **En proceso:**
  * Panel administrativo[cite: 4]
  * Validación de formularios y consulta de perfil
* **Pendientes:**
  * Notificaciones[cite: 4]
  * Reportes[cite: 4]
* **Descartadas:**
  * ~~Recuperación de contraseña~~ (eliminada por optimización de flujo sin contraseñas)[cite: 4]
