# Perplexity — Ficha de herramienta

> **Última actualización:** 2026-06-25  
> **Estado en ecosistema:** ACTIVO — ejecutor principal vía GitHub MCP

---

## Descripción

Perplexity AI con acceso a herramientas MCP (Model Context Protocol).  
En el ecosistema Yggdrasil actúa como **ejecutor de tareas reales en GitHub**.

## Capacidades verificadas

- ✅ Lectura de ficheros y estructura del repo (GitHub MCP)
- ✅ Creación de ficheros y commits reales (`push_files`)
- ✅ Creación de ramas (`create_branch`)
- ✅ Búsqueda en código (`search_code`)
- ✅ Gestión de issues y PRs
- ✅ Búsqueda web en tiempo real
- ✅ Ejecución de Python (`execute_code`)

## Limitaciones

- ❌ No puede ejecutar comandos en terminal local
- ❌ No puede hacer `git mv` (renombrar = crear + borrar)
- ❌ Contexto de conversación limitado (no persiste entre sesiones)

## Rol en el ecosistema

```
Perplexity → GitHub MCP → yggdrasil-dew (repo)
                       → commits reales
                       → ramas de trabajo
                       → documentación estructurada
```

## Cuándo usarlo

| Caso de uso | Recomendado |
|---|---|
| Migrar/crear ficheros en repo | ✅ Principal |
| Documentar decisiones técnicas | ✅ Sí |
| Buscar información externa | ✅ Con search_web |
| Análisis de código del repo | ✅ Sí |
| Ejecutar Python/scripts | ✅ Sí (sandbox) |
| Trabajo en terminal local | ❌ Usar Madre directamente |

---

*Creado: 2026-06-25 | Autor: Perplexity MCP*
