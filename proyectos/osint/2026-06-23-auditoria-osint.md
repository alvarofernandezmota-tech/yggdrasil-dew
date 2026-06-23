---
tags: [osint, auditoria, pentest, spiderfoot, reconocimiento]
fecha: 2026-06-23
estado: pendiente-ejecutar
tipo: auditoria
ruta-obsidian: proyectos/osint/2026-06-23-auditoria-osint.md
fuente: inbox/2026-06-23-auditoria-osint.md
---

# Auditoría `osint/` — plan de mejora

> Sesión 2026-06-23

## Stack OSINT Batcueva (decidido)

| Herramienta | Puerto | Función |
|---|---|---|
| SpiderFoot | 5001 | OSINT automatizado |
| IVRE | — | Reconocimiento de red |
| Kismet | — | WiFi recon |
| nmap | CLI | Port scanning |

> Maltego eliminado (requiere licencia cara). SpiderFoot es el reemplazo.

## Estructura objetivo

```
osint/
  README.md           ← índice herramientas + casos uso
  herramientas.md     ← fichas técnicas
  metodologia.md      ← flujo de trabajo
  practicas/          ← ejercicios documentados
  docker/             ← docker-compose osint-stack
```

## Pasos

- [ ] Crear `osint/README.md` con stack definitivo
- [ ] Crear `osint/herramientas.md` — fichas SpiderFoot, IVRE, nmap
- [ ] Repo `alvarofernandezmota-tech/osint-stack` — docker-compose
- [ ] Primer scan real: `nmap -sV 10.134.31.0/24`
- [ ] Documentar resultado en `osint/practicas/`

## Referencias
- [[setup/servidor/docker-stack]]
- [[setup/servidor/red]]
