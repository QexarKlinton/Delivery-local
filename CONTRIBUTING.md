# Contribución a Delivery Local

## Flujo de trabajo

1. Crear una rama a partir de `main`.
2. Realizar un cambio pequeño y coherente.
3. Crear un commit atómico con un mensaje descriptivo.
4. Abrir un Pull Request hacia `main`.
5. Revisar el cambio.
6. Integrar el Pull Request una vez validado.

## Convención de ramas

Ejemplos:

```text
feature/nombre-funcionalidad
fix/nombre-problema
docs/nombre-documentacion
```

## Convención de commits

Se recomienda Conventional Commits:

```text
feat: nueva funcionalidad
fix: corrección de error
docs: documentación
refactor: reorganización del código
test: pruebas
chore: mantenimiento
```

Ejemplos:

```bash
git commit -m "docs: agregar ADR de arquitectura"
git commit -m "feat: agregar creación de pedidos"
git commit -m "test: agregar pruebas de pedidos"
```

## Pull Requests

Cada PR debe indicar:

- Qué se cambió.
- Por qué se realizó.
- Qué se probó.
- Qué pendientes quedan.

Los cambios grandes deben dividirse en PRs pequeños cuando sea posible.
