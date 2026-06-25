---
tags: [inbox, seguridad, analisis-codigo, trivy, semgrep, clamav, pentest]
fecha: 2026-06-25
destino: osint/herramientas.md + setup/servidor/batcueva-seguridad.yml
estado: documentado
---

# Analizador de código malicioso — investigación 25 jun

## Qué se pidió
Analizador de archivos que busque código malicioso, integrado con el stack Batcueva.

## Decisión
Tres herramientas complementarias, cada una con un rol diferente:

| Herramienta | Qué detecta | Cómo corre |
|---|---|---|
| **Trivy** | CVEs en imágenes Docker + secretos expuestos en código | Servidor persistente :4954 |
| **Semgrep** | Patrones peligrosos en código Python/JS/bash (SQLi, backdoors, hardcoded creds) | On-demand (run-once) |
| **ClamAV** | Malware/virus en archivos binarios y scripts | Daemon persistente :3310 |

## Archivos creados
- `setup/servidor/batcueva-seguridad.yml` — YML listo para levantar
- `osint/herramientas.md` — guía completa + comandos

## Pendiente ejecutar
```bash
# Levantar stack seguridad
ssh madre "cd ~/yggdrasil-dew && docker compose -f setup/servidor/batcueva-seguridad.yml up -d trivy-server clamav"

# Primer scan del repo con Trivy (sin levantar nada, directo)
ssh madre "docker run --rm -v /home/varopc/yggdrasil-dew:/repo aquasec/trivy fs --scanners secret /repo"
```

## Prioridad
Despus de Fase 3+4. Trivy primero — detecta secretos en el repo en 2 minutos.

---
_Mover a: osint/ una vez ejecutado el primer scan_
_Actualizado: 25 jun 2026 13:25 CEST_
