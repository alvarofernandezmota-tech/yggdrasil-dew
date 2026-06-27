---
tags: [tipo/adr, estado/activo, infra/docker, infra/sops, estado/pendiente]
fecha: 2026-06-25
---

# ADR-004 — Seguridad: Privilege Explosion y Secrets Management

> Origen: Auditoría Engineering Excellence 2026-06-25

## Contexto

Contenedores corriendo como root con acceso al socket Docker. Secrets en `.env` sin cifrar. Red pentest sin aislar.

## Decisión

- **Rootless Docker** — eliminar acceso root en contenedores
- **Mozilla SOPS** — cifrar secrets en repo, nunca `.env` en git en texto plano
- **VLANs** — separar red pentest de red doméstica y cámaras

## Estado

🔴 Sin implementar — prioridad alta

## Consecuencias

Hasta implementar: no levantar stack pentest (Kali, Bettercap) en la misma red que el resto de servicios.

---
_Ver: [[MASTER-PENDIENTES]] · [[docs/infra/red-madre-ap]]_
