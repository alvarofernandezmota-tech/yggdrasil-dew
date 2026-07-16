---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-CONTEXTO-ECOSISTEMA.md
tags: [protocolo, contexto, ecosistema, global]
status: vigente
version: 1.0
---

# PROTOCOLO-CONTEXTO-ECOSISTEMA v1.0

> Carga el mapa mental completo del ecosistema Yggdrasil.
> Usar cuando la sesion afecta a todo el ecosistema o cuando el agente no sabe
> que repos/islas/protocolos existen.
> Tiempo estimado: 3-5 min.

---

## Mapa de repos

```
alvarofernandezmota-tech/
+-- NUCLEO ---------------------------------------------------------------
|   yggdrasil-dew        -> CEREBRO TECNICO: canon, ADRs, protocolos, diarios
|   yggdrasil-wiki       -> MAPA CONCEPTUAL: islas tematicas (no codigo, no personal)
|   yggdrasil-tracking   -> VIDA PERSONAL: diarios personales, metas, habitos
|   yggdrasil-formacion  -> APRENDIZAJE: apuntes, HTB, cursos, labs
+-- INFRAESTRUCTURA ------------------------------------------------------
|   yggdrasil-scripts    -> automatizacion del ecosistema
|   madre-config         -> configuracion servidor Madre
|   ollama-stack         -> stack IA local
|   THDORA               -> agente autonomo
```

---

## 7 reglas canonicas globales

```
1. NOMBRES exactos: yggdrasil-dew / yggdrasil-wiki / yggdrasil-tracking / yggdrasil-formacion
2. SEPARACION: tecnico->DEW+FORMACION / personal->TRACKING / mapa->WIKI
3. SEGURIDAD: ningun secreto/token/IP en ningun .md
4. FRONTMATTER: tipo+author+creado+actualizado+ruta+tags+status en todo archivo
5. PLANTILLAS: ningun archivo nuevo sin su PLANTILLA-*.md de docs/canon/
6. PROPAGACION: todo cambio estructural -> PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md
7. SINCRONIZACION: cierre con cambios -> PROTOCOLO-SINCRONIZACION-ECOSISTEMA.md
```

---

## Documentos maestros - leer en este orden

```
1. docs/canon/ESTADO-SISTEMA.md      -> estado operativo actual
2. MASTER-PENDIENTES.md              -> que hay que hacer y que fases van
3. protocolo/INDEX.md                -> que protocolos existen
4. docs/adr/INDEX-ADR.md             -> decisiones tomadas y por que
5. docs/islas/MAPA-ISLAS-DEPENDENCIAS -> relaciones entre repos
```

---

## Cuando usar cada protocolo

```
ABRIR SESION               -> PROTOCOLO-APERTURA-SESION.md
CONTEXTO REPO CONCRETO     -> PROTOCOLO-CONTEXTO-DEW/WIKI/TRACKING/FORMACION.md
CAMBIA ALGO ESTRUCTURAL    -> PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md
VERIFICAR CONSISTENCIA     -> PROTOCOLO-SINCRONIZACION-ECOSISTEMA.md
SINCRONIZAR REPO CONCRETO  -> PROTOCOLO-SINCRONIZACION-DEW/WIKI/TRACKING/FORMACION.md
AUDITORIA PROFUNDA GLOBAL  -> PROTOCOLO-AUDITORIA-ECOSISTEMA.md
AUDITORIA REPO CONCRETO    -> PROTOCOLO-AUDITORIA-DEW/WIKI/TRACKING/FORMACION.md
ENTRAR ALGO NUEVO          -> NORMA-ENTRADA-NUEVA-ISLA.md + ACTUALIZACION TIPO B
BORRAR ALGO                -> PROTOCOLO-BORRADO.md
RENOMBRAR                  -> PROTOCOLO-NOMBRES.md + ACTUALIZACION TIPO A
CERRAR SESION              -> PROTOCOLO-CIERRE-SESION.md
```

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
