# NORMAS DEL ECOSISTEMA — Separacion canonica

> Fuente de verdad centralizada en `yggdrasil-dew`.
> Los demas repos la referencian — no se duplica.
> Si hay duda sobre donde poner algo, aqui esta la respuesta.

---

## Repos del ecosistema

| Repo | Capa | Visibilidad | Proposito |
|---|---|---|---|
| [yggdrasil-dew](https://github.com/alvarofernandezmota-tech/yggdrasil-dew) | Cerebro | Publico | Constitucion tecnica, ADRs, diarios, roadmap |
| [alvarofernandezmota-tech](https://github.com/alvarofernandezmota-tech/alvarofernandezmota-tech) | Cerebro | Publico | Profile README |
| [WIKI---PERSONAL](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL) | Conocimiento | Privado | Mapa conceptual personal, islas |
| [VIDAPERSONAL](https://github.com/alvarofernandezmota-tech/VIDAPERSONAL) | Conocimiento | Privado | Vida personal |
| [formacion-tech](https://github.com/alvarofernandezmota-tech/formacion-tech) | Formacion | Publico | Apuntes tecnicos por area |
| [investigacion-ia](https://github.com/alvarofernandezmota-tech/investigacion-ia) | Formacion | Publico | Investigacion y experimentos IA |
| [madre-config](https://github.com/alvarofernandezmota-tech/madre-config) | Infra | Privado | Config y scripts de Madre (servidor) |
| [acer-config](https://github.com/alvarofernandezmota-tech/acer-config) | Infra | Privado | Config del portatil Acer |
| [ollama-stack](https://github.com/alvarofernandezmota-tech/ollama-stack) | IA Local | Privado | Stack Ollama + modelos locales |
| [local-brain](https://github.com/alvarofernandezmota-tech/local-brain) | IA Local | Privado | RAG y agentes locales |
| [THDORA-PERSONAL](https://github.com/alvarofernandezmota-tech/THDORA-PERSONAL) | Thdora | Privado | Bot Telegram personal |
| [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) | Seguridad | Privado | Hallazgos, auditorias, herramientas defensivas |
| [osint-stack](https://github.com/alvarofernandezmota-tech/osint-stack) | Seguridad | Privado | Herramientas OSINT |
| [dev-labs](https://github.com/alvarofernandezmota-tech/dev-labs) | Labs | Privado | Prototipos sin repo propio aun |

---

## Regla fundamental

```
WIKI = QUE existe y POR QUE
DEW  = COMO funciona y QUE se decidio
REPOS OPERATIVOS = COMO se ejecuta
```

Si un archivo tiene comandos, scripts, IPs, tokens o pasos para ejecutar -> NO es WIKI.
Si un archivo explica conceptos, relaciones y decisiones -> NO es un repo operativo.

---

## Regla de diarios

- **Un diario = un dia.** Maximo un archivo por fecha.
- **Nombre siempre:** `YYYY-MM-DD.md` — sin sufijos, sin `noche`, sin numeros.
- **Ubicacion siempre:** `yggdrasil-dew/docs/diarios/` — nunca en WIKI ni en otro repo.
- Si hay varias sesiones en el dia -> secciones separadas dentro del **mismo archivo**.
- Si el agente crea un fragmento durante la sesion -> lo integra en el diario del dia antes de cerrar.
- Ver plantilla: [`docs/canon/PLANTILLA-DIARIO.md`](./docs/canon/PLANTILLA-DIARIO.md)

---

## WIKI---PERSONAL — que va aqui

**Si:**
- Islas tematicas: descripcion conceptual de cada dominio
- Relaciones entre islas (que depende de que)
- MODELO-MENTAL: como piensas el sistema
- Mapa de repos (que repo sirve a que isla)
- Decisiones de diseno de alto nivel (por que existe X)
- Links a los repos canonicos para cada tema

**No:**
- Comandos bash, scripts, shebangs
- IPs, tokens, contrasenas, secretos
- Procedimientos operativos (como hacer X paso a paso)
- Configuraciones de servicios
- Diarios de sesion o hallazgos tecnicos
- Duplicados de docs que ya existen en otro repo

**Frontmatter obligatorio:**
```yaml
---
tipo: isla | mapa | modelo | redirect
nombre: Nombre legible
descripcion: Una linea
repo_principal: URL del repo operativo correspondiente
estado: estable | borrador | deprecado
creado: YYYY-MM-DD
actualizado: YYYY-MM-DD
tags: [lista, de, tags]
---
```

---

## yggdrasil-dew — que va aqui

**Si:**
- `docs/canon/` — DICCIONARIO, ARBOL-AGENTES, MAPA-SYNC, NORMAS
- `docs/diarios/` — diario de cada sesion (decisiones, contexto, aprendizajes)
- `docs/hallazgos/` — hallazgos tecnicos con evidencia y resolucion
- Arquitectura tecnica del ecosistema
- ADRs (Architecture Decision Records)
- Documentacion transversal que afecta a varios repos

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

## madre-config — que va aqui

**Si:**
- Configuraciones de servicios Docker
- Scripts de mantenimiento, backup, monitoreo
- Playbooks de instalacion y configuracion de Madre
- Configuracion SSH, UFW, fail2ban
- Documentacion operativa
- Estado actual de servicios

**No:**
- Tokens ni secretos en texto plano
- Conceptos o explicaciones de alto nivel (eso es WIKI o Dew)

---

## yggdrasil-secops — que va aqui

**Si:**
- Issues HAL-XXX con evidencia, impacto, remediacion
- Plan de seguridad del ecosistema
- Scripts de auditoria y monitoreo
- Resultados de auditorias

**No:**
- Tokens ni secretos reales
- Configuracion operativa general (eso es madre-config)

---

## Regla de duplicados

1. Cada concepto existe en **un unico repo canonico**.
2. Otro repo que necesite referenciarlo -> **stub de redirect** con `tipo: redirect` y link al canonico.
3. Nunca dos archivos con el mismo contenido en repos distintos.

---

## Regla de secretos

- Ningun token, contrasena, clave privada o API key en ningun repo, nunca.
- Secretos -> Vaultwarden o `.env` con `.gitignore`.
- Si se commitio un secreto -> rotar inmediatamente + `git filter-repo` para purgar historial.

---

_Ultima actualizacion: 2026-07-06 · Fase 4 Plan de Alineacion · Perplexity-MCP_
