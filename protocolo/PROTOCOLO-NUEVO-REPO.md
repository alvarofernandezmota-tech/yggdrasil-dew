---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-NUEVO-REPO.md
tags: [protocolo, repo, ecosistema, atomo]
status: vigente
version: 1.0
---

# PROTOCOLO-NUEVO-REPO v1.0

> Ejecutar cuando se incorpora un nuevo repo al ecosistema Yggdrasil.
> Un repo sin entrada en el ecosistema es una isla flotante sin conexion.
> Tiempo estimado: 20-30 min.

---

## Antes de crear

```
[ ] Responder las 4 preguntas de PROTOCOLO-NUEVA-ISLA:
    1. Que ES este repo
    2. Que REPRESENTA en el ecosistema
    3. Que FUNCIONES tiene
    4. A que repos esta conectado
[ ] Verificar que el nombre es canonico (PROTOCOLO-NOMBRES)
[ ] Verificar que no duplica un repo existente
```

---

## Pasos de creacion

```
[ ] 1. Crear repo en GitHub con nombre canonico
       - Privado si contiene datos personales o credenciales
       - Publico si es contenido tecnico compartible

[ ] 2. Crear README.md minimo con:
       - Descripcion de que es el repo
       - Estructura de carpetas esperada
       - Link a DEW como cerebro del ecosistema

[ ] 3. Ejecutar PROTOCOLO-NUEVA-ISLA para registrar en el ecosistema:
       - Carta en WIKI
       - ESTADO-ISLA en DEW
       - Entrada en MAPA-ISLAS-DEPENDENCIAS

[ ] 4. Actualizar ESTADO-SISTEMA.md en DEW:
       Anadir el repo a la tabla de repos del ecosistema

[ ] 5. Si la creacion es una decision arquitectural -> crear ADR
       (PROTOCOLO-NUEVO-ADR)

[ ] 6. Ejecutar PROTOCOLO-ACTUALIZACION-ECOSISTEMA TIPO B

[ ] 7. Commit en DEW:
       'feat(ecosistema): nuevo repo <nombre> integrado'
```

---

## Relacionado

- PROTOCOLO-NUEVA-ISLA.md
- PROTOCOLO-NOMBRES.md
- PROTOCOLO-NUEVO-ADR.md
- PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md (TIPO B)
- docs/canon/ESTADO-SISTEMA.md

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
