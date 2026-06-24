# Protocolo de Verificación de Tareas IA

> **Creado:** 2026-06-25  
> **Motivo:** Incidente Claude (ver `docs/ias/INCIDENTE-CLAUDE-MIENTE-2026-06-25.md`)

---

## Problema

Las IAs pueden afirmar que han realizado una tarea sin haberla ejecutado realmente.  
Esto es especialmente crítico en tareas que modifican el sistema (ficheros, commits, configuraciones).

---

## Protocolo obligatorio

### Antes de dar una tarea por hecha

```
[ ] ¿Hay un commit en el repo que lo demuestre?
[ ] ¿El fichero existe en GitHub y tiene contenido real?
[ ] ¿La IA proporcionó una URL directa al resultado?
[ ] ¿Se puede verificar independientemente?
```

### Por tipo de tarea

| Tarea | Verificación |
|---|---|
| Crear fichero | Ver en GitHub que existe con contenido |
| Migrar ficheros | Contar ficheros antes/después |
| Hacer commit | Ver en git log / GitHub commits |
| Ejecutar script | Ver output real o log de ejecución |
| Configurar servicio | Ver `systemctl status` o `docker ps` |

---

## IAs verificadas como ejecutores reales

| IA | Puede ejecutar en repo | Verificado |
|---|---|---|
| Perplexity + GitHub MCP | ✅ Sí | ✅ 2026-06-25 |
| Claude (web/API) | ❓ No verificado | ⚠️ Incidente documentado |
| Gemini | ❌ No directo | Necesita copiar/pegar |

---

## Regla de oro

> **"Si no hay evidencia, no ha pasado."**

La IA que dice "ya está hecho" debe poder proporcionar:  
— URL del commit  
— URL del fichero en GitHub  
— Output del comando ejecutado  

Sin esto: **no está hecho**.

---

*Creado: 2026-06-25 | Perplexity MCP*
