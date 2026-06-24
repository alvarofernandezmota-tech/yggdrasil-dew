---
tipo: estado
fecha: 2026-06-25
hora: "01:55"
status: activo
tags: [inbox, estado, limpieza, pendiente, sesion-noche, gemini, perplexity]
priority: ALTA
---

# 📬 Estado Inbox + Próximos Pasos — 2026-06-25 01:55

> Resumen de la sesión completa de esta noche con Gemini + Perplexity.
> Este fichero se migra a `diarios/` cuando se ejecute el script de limpieza.

---

## ✅ Lo que SE HA HECHO esta noche (commits en main)

| Commit | Qué se creó | Path en repo |
|---|---|---|
| `aec2fde` | Pendientes maestro de madre (8 fases) | `docs/madre/MADRE-PENDIENTES-MAESTRO.md` |
| `aec2fde` | Índice carpeta madre | `docs/madre/README.md` |
| `6847f53` | Script limpieza inbox v1 (obsoleto) | `scripts/inbox-cleanup-jun2024.sh` |
| `6847f53` | Índice carpeta scripts | `scripts/README.md` |
| `5a1e079` | Script limpieza inbox v2 ✅ USAR ESTE | `scripts/inbox-cleanup-jun2026.sh` |

---

## 🔴 Lo que NO SE HA HECHO — Pendiente de madre

### La inbox AUN TIENE ~85 ficheros

El script `inbox-cleanup-jun2026.sh` está listo pero NO se ha ejecutado.
Requiere terminal en la máquina madre (no se puede hacer vía API de GitHub).

```
inbox/ — estado actual
├── ~35 ficheros del 2026-06-23   ← pendientes migrar
├── ~50 ficheros del 2026-06-24   ← pendientes migrar
├── 2026-06-25-estado-inbox...md  ← este fichero (nueva sesión)
└── .gitkeep
```

### Destinos cuando se ejecute el script

| Etiqueta fichero | Destino | Ejemplos |
|---|---|---|
| `sesion-*`, `cierre-*`, `estado-*`, `auditoria-*` | `diarios/` | logs de actividad |
| `ollama-*`, `langchain-*`, `bge-*` | `ollama/` | modelos y configs |
| `script-*` | `setup/` | scripts bash |
| `fase*`, `docker-*`, `ecosistema-*` | `proyectos/` | arquitectura |
| `osint-*` | `osint/` | investigación OSINT |
| `formacion-*` | `formacion/` | Python, roadmaps |
| `PROMPT-*`, `prompt-*` | `templates/` | prompts reutilizables |
| `adr-*` | `docs/adr/` | decisiones formalizadas |
| `proyecto-*`, `decision-*` | `proyectos/` | fichas de proyectos |
| Clave 24-jun (5 ficheros) | `docs/ias/`, `diarios/`, `proyectos/`, `docs/adr/historico/` | clasificación Gemini |

---

## 📜 Script a ejecutar en madre

```bash
cd ~/repos/yggdrasil-dew    # o donde tengas el repo clonado
git pull origin main
chmod +x scripts/inbox-cleanup-jun2026.sh
bash scripts/inbox-cleanup-jun2026.sh
# → Crea rama chore/inbox-cleanup-jun2026
# → Hace push
# → Te imprime la URL del PR al terminar
# → Revisa el PR en GitHub antes de mergear a main
```

> ⚠️ IMPORTANTE: El script v2 (`jun2026`) es el bueno.
> El v1 (`jun2024`) tiene el bug de nullglob, ignorarlo.

---

## 🎯 Orden de lo siguiente

```
□ 1. Tener madre encendida y con git pull
□ 2. Ejecutar inbox-cleanup-jun2026.sh → PR → merge → INBOX ZERO
□ 3. SOPS (antes de tocar secretos / API keys)
   → sudo pacman -S sops age
   → age-keygen -o ~/.config/sops/key.txt
   → Crear .sops.yaml en raíz del repo
□ 4. Stack Docker: docker compose up -d
   → Ver docs/madre/MADRE-PENDIENTES-MAESTRO.md Fase 2
□ 5. Conectar THDORA al stack
□ 6. LiteLLM como proxy
□ 7. Workflows n8n
```

---

## 💬 Resumen de lo que Gemini auditó esta noche

- **Contexto asimilado**: ADR-003 (Ollama ganó), ADR-004 (ramas), ecosistema Docker
- **Bug encontrado**: `set -e` + glob sin matches = script roto a medias
- **Fix aplicado**: `shopt -s nullglob` + `shopt -u nullglob` al final
- **Nombre rama corregido**: `jun2024` → `jun2026` (alineación SSOT)
- **Próxima iteración recomendada por Gemini**: SOPS o n8n+LiteLLM

---

*Generado: 2026-06-25 01:55 CEST — Sesión Gemini + Perplexity*
