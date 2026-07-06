# NORMAS DEL ECOSISTEMA — Separación canónica

> Este documento es la fuente de verdad sobre qué va en cada repo.
> Si hay duda sobre dónde poner algo, aquí está la respuesta.

---

## Regla fundamental

```
WIKI = QUÉ existe y POR QUÉ
DEW  = CÓMO funciona y QUÉ se decidió
REPOS OPERATIVOS = CÓMO se ejecuta
```

Si un archivo tiene comandos, scripts, IPs, tokens o pasos para ejecutar → NO es WIKI.
Si un archivo explica conceptos, relaciones y decisiones → NO es un repo operativo.

---

## Regla de diarios

- **Un diario = un día.** Máximo un archivo por fecha.
- **Nombre siempre:** `YYYY-MM-DD.md` — sin sufijos, sin `noche`, sin números.
- **Ubicación siempre:** `yggdrasil-dew/docs/diarios/` — nunca en WIKI ni en otro repo.
- Si hay varias sesiones en el día → secciones separadas dentro del **mismo archivo**.
- Si el agente crea un fragmento durante la sesión → lo integra en el diario del día antes de cerrar.
- Ver plantilla: [`docs/canon/PLANTILLA-DIARIO.md`](./docs/canon/PLANTILLA-DIARIO.md)

---

## WIKI---PERSONAL — qué va aquí

**Sí:**
- Islas temáticas: descripción conceptual de cada dominio
- Relaciones entre islas (qué depende de qué)
- MODELO-MENTAL: cómo piensas el sistema
- Mapa de repos (qué repo sirve a qué isla)
- Decisiones de diseño de alto nivel (por qué existe X)
- Links a los repos canónicos para cada tema

**No:**
- Comandos bash, scripts, shebangs
- IPs, tokens, contraseñas, secretos
- Procedimientos operativos (cómo hacer X paso a paso)
- Configuraciones de servicios
- Diarios de sesión o hallazgos técnicos
- Duplicados de docs que ya existen en otro repo

**Frontmatter obligatorio:**
```yaml
---
tipo: isla | mapa | modelo | redirect
nombre: Nombre legible
descripcion: Una línea
repo_principal: URL del repo operativo correspondiente
estado: estable | borrador | deprecado
creado: YYYY-MM-DD
actualizado: YYYY-MM-DD
tags: [lista, de, tags]
---
```

---

## yggdrasil-dew — qué va aquí

**Sí:**
- `docs/canon/` — DICCIONARIO, ARBOL-AGENTES, MAPA-SYNC, NORMAS
- `docs/diarios/` — diario de cada sesión (decisiones, contexto, aprendizajes)
- `docs/hallazgos/` — hallazgos técnicos con evidencia y resolución
- Arquitectura técnica del ecosistema
- ADRs (Architecture Decision Records): por qué se eligió X tecnología
- Documentación transversal que afecta a varios repos

**No:**
- Scripts ejecutables (van en el repo del servicio o en madre-config)
- Tokens ni secretos
- Mapas conceptuales o relaciones entre islas (eso es WIKI)
- Configuraciones de servicios

**Frontmatter obligatorio:**
```yaml
---
tipo: canon | diario | hallazgo | arquitectura | adr
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: YYYY-MM-DD
actualizado: YYYY-MM-DD
ruta: docs/ruta/archivo.md
tags: [lista, de, tags]
status: vigente | borrador | deprecado
---
```

---

## madre-config — qué va aquí

**Sí:**
- Configuraciones de servicios Docker (docker-compose, Dockerfiles)
- Scripts de mantenimiento, backup, monitoreo
- Playbooks de instalación y configuración de Madre
- Configuración SSH, UFW, fail2ban
- Documentación operativa: cómo instalar, configurar y mantener
- Estado actual de servicios (qué corre, en qué puerto)

**No:**
- Tokens ni secretos en texto plano (usar .env fuera de git)
- Conceptos o explicaciones de alto nivel (eso es WIKI o Dew)

---

## yggdrasil-secops — qué va aquí

**Sí:**
- Issues HAL-XXX (hallazgos de seguridad con evidencia, impacto, remediación)
- Plan de seguridad del ecosistema
- Scripts de auditoría y monitoreo de seguridad
- Dockerfiles de contenedores de seguridad
- Resultados de auditorías

**No:**
- Tokens ni secretos reales
- Configuración operativa general (eso es madre-config)

---

## Regla de duplicados

1. Cada concepto/documento existe en **un único repo canónico**.
2. Si otro repo necesita referenciar ese doc → **stub de redirect** con frontmatter `tipo: redirect` y link al canónico.
3. Nunca dos archivos con el mismo contenido en repos distintos sin que uno sea redirect.

---

## Regla de secretos

- Ningún token, contraseña, clave privada o API key en ningún repo, nunca.
- Secretos → Vaultwarden o `.env` con `.gitignore`.
- Si se commitió un secreto → rotar inmediatamente + `git filter-repo` para purgar historial.

---

_Última actualización: 2026-07-06 · Fase 3 Plan de Alineación · Perplexity-MCP_
