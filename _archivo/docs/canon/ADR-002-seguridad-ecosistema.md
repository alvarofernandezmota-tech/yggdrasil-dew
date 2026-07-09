---
title: ADR-002 — Modelo de Seguridad del Ecosistema
tipo: adr
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/canon/ADR-002-seguridad-ecosistema.md
tags: [adr, canon, seguridad, gitleaks, ci, privacidad]
status: vigente
---

# ADR-002 — Modelo de Seguridad del Ecosistema

> Índice de ADRs → [`INDICE-ADR.md`](./INDICE-ADR.md)

---

## Contexto

El ecosistema Yggdrasil tiene repos públicos (yggdrasil-dew) y repos privados (WIKI---PERSONAL, VIDAPERSONAL, THDORA-PERSONAL). Durante la auditoría del 2026-07-05 se detectaron:

- Tokens de Telegram en historial git (HAL-001, HAL-003)
- Repos con datos personales (vida, salud, finanzas) configurados como públicos por defecto
- Ausencia de CI que detecte secretos antes de que lleguen a GitHub
- Emails, IPs y rutas de sistema filtradas en documentos de configuración

Hacía falta una decisión explícita sobre el modelo de seguridad, no parches sueltos.

---

## Decisión

**Modelo de defensa en profundidad con 3 capas:**

### Capa 1 — Visibilidad por defecto
- Todo repo **privado por defecto** al crear
- Excepción explícita: repos de portafolio técnico (`yggdrasil-dew`) → público con revisión previa de que no contiene datos personales
- `WIKI---PERSONAL`, `VIDAPERSONAL`, `THDORA-PERSONAL`, `madre-config` → **siempre privados**

### Capa 2 — CI automático en cada push
- `validate-canon.yml`: detecta patrones de IPs privadas, emails, tokens, rutas del sistema, MACs, SSH keys antes de que el commit llegue a la rama principal
- `gitleaks.yml`: escaneo del historial git completo con Gitleaks — detecta secretos ya commiteados
- Ambos CIs desplegados en: yggdrasil-dew, yggdrasil-secops, WIKI---PERSONAL

### Capa 3 — Rotación activa de credenciales
- Cualquier secreto detectado en git → HAL en secops + rotación inmediata
- Tokens de Telegram (HAL-001/003) → rotar antes de siguiente commit a repos públicos
- Regla permanente: si un secreto llegó a git, se considera comprometido aunque el repo sea privado

---

## Alternativas descartadas

| Alternativa | Por qué se descartó |
|-------------|---------------------|
| Solo repos privados sin CI | Un error humano puntual expone datos; el CI es la red de seguridad |
| Git-crypt para cifrar archivos sensibles | Complejidad operativa alta, dificulta colaboración con agentes IA |
| GitHub Advanced Security (GHAS) | Requiere plan de pago; Gitleaks + validate-canon cubre el caso de uso sin coste |
| pre-commit hooks locales | Solo protegen la máquina donde están instalados; el CI protege siempre |

---

## Consecuencias

- ✅ Cualquier push con secreto falla en CI antes de mergearse
- ✅ El portafolio público (dew) es seguro de compartir con reclutadores
- ⚠️ HAL-001 y HAL-003 siguen abiertos — tokens de Telegram a rotar
- ⚠️ El CI no cubre todos los repos del ecosistema (17 total) — pendiente expandir a formacion-tech y madre-config

---

## Referencias

- Hallazgos activos → [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops)
- CI validate-canon → `.github/workflows/validate-canon.yml` en cada repo
- Isla seguridad → [`wiki/islas/seguridad.md`](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL/blob/main/wiki/islas/seguridad.md)
- ADR anterior → [ADR-001](./ADR-001-platform-stack.md)

---

_Creado: 2026-07-06 · Perplexity-MCP_
