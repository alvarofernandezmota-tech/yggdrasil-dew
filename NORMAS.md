---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-16
ruta: NORMAS.md
tags: [normas, canon, tridente, ecosistema]
status: vigente
---

# NORMAS DEL ECOSISTEMA — Separacion canonica

> Fuente de verdad centralizada en `yggdrasil-dew`.
> Los demas repos la referencian — no se duplica.
> Si hay duda sobre donde poner algo, aqui esta la respuesta.

---

## Repos del ecosistema

| Repo | Capa | Visibilidad | Proposito |
|---|---|---|
| [yggdrasil-dew](https://github.com/alvarofernandezmota-tech/yggdrasil-dew) | Cerebro | Publico | Constitucion tecnica, ADRs, diarios, roadmap |
| [yggdrasil-wiki](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki) | Conocimiento | Privado | Base de conocimiento, mapas, islas |
| [yggdrasil-tracking](https://github.com/alvarofernandezmota-tech/yggdrasil-tracking) | Vida personal | Privado | Diarios, metas, filosofía, reflexiones |
| [yggdrasil-formacion](https://github.com/alvarofernandezmota-tech/yggdrasil-formacion) | Formacion | Privado | Aprendizaje tecnico, cursos, recursos |
| [yggdrasil-scripts](https://github.com/alvarofernandezmota-tech/yggdrasil-scripts) | Orquestacion | Privado | Scripts transversales, GitHub Actions |
| [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) | Seguridad | Privado | Hallazgos, auditorias, herramientas defensivas |
| [madre-config](https://github.com/alvarofernandezmota-tech/madre-config) | Infra | Privado | Config y scripts de Madre (servidor) |
| [acer-config](https://github.com/alvarofernandezmota-tech/acer-config) | Infra | Privado | Config del portatil Acer |
| [ollama-stack](https://github.com/alvarofernandezmota-tech/ollama-stack) | IA Local | Privado | Stack Ollama + modelos locales |
| [THDORA-PERSONAL](https://github.com/alvarofernandezmota-tech/THDORA-PERSONAL) | Thdora | Privado | Bot Telegram personal |
| [osint-stack](https://github.com/alvarofernandezmota-tech/osint-stack) | Seguridad | Privado | Herramientas OSINT |
| [dev-labs](https://github.com/alvarofernandezmota-tech/dev-labs) | Labs | Privado | Prototipos sin repo propio aun |
| [alvarofernandezmota-tech](https://github.com/alvarofernandezmota-tech/alvarofernandezmota-tech) | Perfil | Publico | Profile README |

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

## Regla de zombis

- **Ningun archivo vacio o stub sin contenido real** puede existir en un repo del ecosistema.
- Si se crea un archivo placeholder -> debe tener al menos frontmatter + proposito en una linea.
- Revision de zombis: en cada sesion de cierre, verificar raiz del repo y purgar.
- Un archivo con 0 bytes o solo titulo es un zombi -> borrar o completar en la misma sesion.

---

## Regla de nueva isla

- **Ningun repo nuevo entra al ecosistema sin completar el checklist de NORMA-ENTRADA-NUEVA-ISLA.md**
- Ver: [`docs/canon/NORMA-ENTRADA-NUEVA-ISLA.md`](./docs/canon/NORMA-ENTRADA-NUEVA-ISLA.md)
- Checklist minimo: ESTADO-ISLA en dew + fila en MAPA + README del repo con enlace a dew.
- Sin ese checklist la isla **no existe** para el ecosistema — puede existir el repo pero no esta integrado.

---

## Regla de sesion

- **Toda sesion de trabajo con MCP genera diario** en `docs/diarios/YYYY-MM-DD.md`.
- El diario recoge: decisiones tomadas, issues cerrados, estado al cierre, proxima sesion.
- Si la sesion no tiene diario, las decisiones se pierden — el agente **siempre** cierra con diario.
- **Nunca cerrar sesion sin:** diario actualizado + MASTER-PENDIENTES al dia.

---

## Regla de fronteras personales/tecnicas

- **Vida personal, diarios personales, filosofía, metas** -> `yggdrasil-tracking` (privado).
- **Formacion tecnica, cursos, apuntes** -> `yggdrasil-formacion` (privado).
- **Nunca mezclar contenido personal con tecnico en el mismo repo.**
- Si un repo contiene mezcla -> separar en migracion dedicada antes de continuar trabajando en el.

---

## WIKI (yggdrasil-wiki) — que va aqui

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
- `docs/islas/` — ESTADO-ISLA-*.md y MAPA-ISLAS-DEPENDENCIAS.md
- Arquitectura tecnica del ecosistema
- ADRs (Architecture Decision Records)
- Documentacion transversal que afecta a varios repos

**No:**
- Scripts ejecutables (van en yggdrasil-scripts o repo del servicio)
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

_Ultima actualizacion: 2026-07-16 · fix #65 consistencia nombres · yggdrasil-formacion sin guion · Perplexity MCP_
