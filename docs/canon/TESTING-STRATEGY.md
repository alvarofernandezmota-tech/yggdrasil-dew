---
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/canon/TESTING-STRATEGY.md
tags: [testing, bats, bash, scripts, canon, ci]
status: activo
---

# Testing Strategy — Scripts Críticos

> Estrategia de testing para los scripts bash del ecosistema.
> Framework elegido: **BATS** (Bash Automated Testing System).
> Razón: es el estándar de facto para testing de bash, integrable con GitHub Actions,
> produce output TAP compatible con cualquier reporter de CI.

---

## Scripts críticos a testear

| Script | Función | Prioridad |
|---|---|---|
| `scripts/inbox-commit.sh` | Copia drop/ → add → commit → push | 🔴 Alta |
| `scripts/session-logger.sh` | Captura comandos de terminal en tiempo real | 🔴 Alta |
| `scripts/orquestador-unico.sh` | Punto de entrada único del ecosistema | 🟠 Media |
| `scripts/inbox-clasificador.sh` | Clasifica archivos de drop/ por nombre/extensión | 🟠 Media |
| `scripts/session-terminal-doc.sh` | Genera documento de cierre de sesión | 🟡 Baja |

---

## Instalación de BATS en Madre

```bash
# Arch Linux
sudo pacman -S bash-bats

# O desde fuente (más actualizado)
git clone https://github.com/bats-core/bats-core.git
cd bats-core && sudo ./install.sh /usr/local

# Verificar
bats --version
```

---

## Estructura de tests

```
yggdrasil-dew/
└── tests/
    ├── unit/
    │   ├── inbox-commit.bats
    │   ├── session-logger.bats
    │   └── inbox-clasificador.bats
    ├── integration/
    │   └── orquestador.bats
    └── fixtures/
        ├── sample.md
        └── sample.sh
```

---

## Patrón de test BATS — ejemplo para `inbox-commit.sh`

Primero, el script debe ser sourceable. Añadir al final de cada script:

```bash
# Al final del script — permite que BATS lo cargue sin ejecutar main
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  run_main
fi
```

Luego el archivo de test:

```bash
#!/usr/bin/env bats
# tests/unit/inbox-commit.bats
# Tests para scripts/inbox-commit.sh

load "${BATS_TEST_DIRNAME}/../../scripts/inbox-commit.sh"

setup() {
  # Crear directorio temporal para cada test
  TEST_DIR=$(mktemp -d)
  mkdir -p "${TEST_DIR}/inbox/drop"
  mkdir -p "${TEST_DIR}/inbox/sesiones"
}

teardown() {
  # Limpiar tras cada test
  rm -rf "${TEST_DIR}"
}

@test "inbox-commit: falla si drop/ esta vacio" {
  run --separate-stderr check_drop_empty "${TEST_DIR}/inbox/drop"
  [ "$status" -eq 1 ]
  [ "$stderr" != "" ]
}

@test "inbox-commit: acepta archivo .md en drop/" {
  touch "${TEST_DIR}/inbox/drop/test.md"
  run --separate-stderr check_drop_empty "${TEST_DIR}/inbox/drop"
  [ "$status" -eq 0 ]
}

@test "inbox-commit: rechaza rutas fuera del repo" {
  run --separate-stderr validate_path "/etc/passwd"
  [ "$status" -eq 1 ]
}
```

---

## Integración con GitHub Actions

```yaml
# .github/workflows/test-scripts.yml
name: Test Scripts

on:
  push:
    paths:
      - 'scripts/**'
      - 'tests/**'
  pull_request:
    paths:
      - 'scripts/**'
      - 'tests/**'

jobs:
  bats:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Instalar BATS
        run: |
          git clone https://github.com/bats-core/bats-core.git
          cd bats-core && sudo ./install.sh /usr/local

      - name: Ejecutar tests unitarios
        run: bats tests/unit/

      - name: Ejecutar tests de integración
        run: bats tests/integration/
```

---

## Reglas de testing

1. **Todo script crítico (nivel 🔴) debe tener tests antes de modificarse**
2. **Cada función nueva en un script crítico lleva su test**
3. **Los tests no dependen de estado externo** — usan `mktemp` y `teardown` siempre
4. **Los tests de integración se ejecutan solo en local** (requieren git configurado)
5. **CI falla en rojo si cualquier test falla** — no se hace merge con tests rojos

---

## Pendiente de implementar

- [ ] Refactorizar `inbox-commit.sh` para ser sourceable (añadir guard `BASH_SOURCE`)
- [ ] Refactorizar `session-logger.sh` igual
- [ ] Crear `tests/unit/inbox-commit.bats` con tests básicos
- [ ] Añadir workflow `.github/workflows/test-scripts.yml`
- [ ] Crear `tests/fixtures/` con archivos de prueba

---

_Creado: 2026-07-06 · Fase 5 Plan de Alineación · Referencia: [bats-core](https://github.com/bats-core/bats-core) · [Testing bash scripts](https://blog.thewatertower.org/2025/02/10/testing-bash-scripts-using-bats/)_
