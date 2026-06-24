# Reglas del Ecosistema Yggdrasil

> Documento maestro. Aplica a TODAS las repos del ecosistema sin excepción.  
> Versión: 1.0 — 2026-06-24

---

## 1. Filosofía base

- **Una cosa, un sitio.** Cada pieza de información o código vive en la repo que le corresponde. No se duplica.
- **Primero captura, luego clasifica.** Todo entra por el inbox. Nada va directo a `docs/` sin pasar por inbox primero.
- **Si no está documentado, no existe.** Una decisión sin ADR es una deuda.
- **El inbox no es un almacén.** Todo lo que entra tiene que salir. La auditoría semanal lo garantiza.

---

## 2. Estructura obligatoria de cada repo

Toda repo del ecosistema DEBE tener esta estructura mínima:

```
<repo>/
├── inbox/              ← entradas sin procesar, ideas, notas rápidas
│   └── README.md       ← explica qué es el inbox y cómo funciona
├── docs/
│   ├── adr/            ← decisiones de arquitectura (Architecture Decision Records)
│   └── REGLAS.md       ← enlace o copia de este documento
├── docker/             ← docker-compose y configs (si aplica)
├── scripts/            ← scripts de utilidad
└── README.md           ← qué es, qué no es, qué expone, quién la consume
```

La estructura interna de cada repo puede añadir carpetas propias encima de esta base.

---

## 3. Reglas del inbox

- Los archivos del inbox siguen el formato: `YYYY-MM-DD-titulo-descriptivo.md`
- Nunca se editan archivos viejos del inbox — si hay una actualización, se crea un archivo nuevo
- El inbox se revisa en la auditoría semanal. Los archivos procesados se mueven a `docs/` con un commit limpio
- Un archivo en inbox puede tener estado: `🔧 pendiente`, `⏳ en progreso`, `✅ procesado`, `🔍 en revisión`

---

## 4. Reglas de commits

Formato obligatorio: `tipo: descripción corta en imperativo`

| Tipo | Cuándo usarlo |
|------|---------------|
| `init:` | Primera estructura de la repo |
| `feat:` | Nueva funcionalidad o servicio |
| `fix:` | Corrección de algo roto |
| `docs:` | Solo documentación |
| `inbox:` | Añadir archivos al inbox |
| `migrate:` | Mover contenido de un sitio a otro |
| `refactor:` | Reorganizar sin cambiar funcionalidad |
| `chore:` | Mantenimiento, limpieza |
| `config:` | Cambios de configuración |

Ejemplos correctos:
```
docs: añadir ADR-003 decisión Flowise vs n8n
inbox: investigación inicial pgvector schemas
migrate: mover ollama desde ygg a local-brain
feat: docker-compose Spiderfoot con healthcheck
```

---

## 5. Reglas de ADR (Architecture Decision Records)

Cada decisión importante de arquitectura se documenta con un ADR en `docs/adr/`.

Formato: `ADR-NNN-titulo.md`

```markdown
# ADR-001: Título de la decisión

**Fecha:** YYYY-MM-DD  
**Estado:** Propuesto | Aceptado | Rechazado | Obsoleto

## Contexto
¿Qué situación llevó a esta decisión?

## Decisión
¿Qué decidimos hacer?

## Consecuencias
¿Qué implica esta decisión? (positivo y negativo)
```

De cuándo hacer un ADR: cambio de tecnología, nueva repo, cambio de arquitectura, decisión de seguridad.

---

## 6. Reglas de Docker

- Cada servicio tiene su `docker-compose.yml` en la repo que le corresponde, NO en ygg
- `yggdrasil-dew` mantiene el compose **maestro** que orquesta todo con `include:`
- Todo servicio Docker debe tener: `healthcheck`, `restart: unless-stopped`, `labels` de Nginx si tiene UI
- Los volúmenes con datos importantes van en `./data/` de la repo correspondiente
- Las redes Docker están definidas en ygg y referenciadas como `external: true` en las demás repos

---

## 7. Reglas de seguridad

- Ningún secreto, token, clave o contraseña en el repositorio. Siempre `.env` + `.gitignore`
- El `.env.example` documenta TODAS las variables necesarias con valores de ejemplo seguros
- Los puertos internos nunca se exponen al exterior directamente — siempre a través de Nginx Proxy Manager
- Secret scanning activo. Ante cualquier duda, rotar la credencial antes de hacer push

---

## 8. Reglas del README

Cada README DEBE responder estas preguntas:

1. ¿Qué es esta repo? (2-3 líneas)
2. ¿Qué NO es? (evitar confusión con otras repos)
3. ¿Qué expone? (servicios, puertos, APIs)
4. ¿Quién la consume? (otras repos del ecosistema)
5. ¿Cómo arrancar? (comandos mínimos)
6. Estructura de carpetas

---

## 9. Ciclo de vida de una idea

```
Tienes una idea o encuentras algo interesante
        ↓
   inbox/ de la repo que corresponda
   (si no sabes cuál, va a ygg/inbox/)
        ↓
   Auditoría semanal — decides:
   ├─ Es documentación → docs/
   ├─ Es una decisión → docs/adr/
   ├─ Es código → carpeta propia de la repo
   ├─ Corresponde a otra repo → se migra a su inbox
   └─ No sirve → se elimina con commit `chore: limpiar inbox`
```

---

## 10. Auditoría semanal

Cada semana (idealmente lunes):

- [ ] Revisar todos los inbox de todas las repos
- [ ] Procesar o migrar cada archivo
- [ ] Actualizar ADRs con decisiones tomadas durante la semana
- [ ] Revisar que ningún servicio Docker esté caído
- [ ] Commit de auditoría: `chore: auditoría semanal YYYY-MM-DD`

---

## Repos del ecosistema

| Repo | Responsabilidad |
|------|-----------------|
| `yggdrasil-dew` | Infra, servidor, orquestación Docker maestro |
| `thdora` | Bots, agentes, integraciones, n8n |
| `local-brain` | Modelos IA, RAG, pgvector, embeddings |
| `osint-stack` | Herramientas OSINT, pipelines de investigación |
| `huginn` (personal) | Diario, notas personales, reflexiones |
