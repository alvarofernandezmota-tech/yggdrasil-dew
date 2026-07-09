---
tipo: seguridad
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/seguridad/STRIDE-risk-register.md
tags: [seguridad, stride, threat-model, risk-register, devsecops]
status: activo
---

# STRIDE Risk Register — Ecosistema Yggdrasil

> Modelado de amenazas usando el framework STRIDE (Microsoft).
> STRIDE categoriza amenazas en 6 tipos:
> **S**poofing · **T**ampering · **R**epudiation · **I**nformation Disclosure · **D**enial of Service · **E**levation of Privilege
>
> Revisado: 2026-07-06. Revisar trimestralmente o tras incidente.

---

## Componentes analizados

1. Madre (servidor físico)
2. SSH / Tailscale (acceso remoto)
3. Thdora Bot (Telegram)
4. GitHub repos (yggdrasil-dew, secops, WIKI)
5. Ollama / LLM local
6. Stack Docker (Wazuh, Suricata, Pihole)
7. Agente IA externo (Perplexity MCP)

---

## Registro de amenazas

| ID | Componente | Tipo STRIDE | Amenaza | Probabilidad | Impacto | Mitigación | Estado |
|---|---|---|---|---|---|---|---|
| T-001 | SSH | Spoofing | Acceso SSH con credenciales robadas o brute-force | Media | Crítico | Tailscale como único punto de entrada · SSH solo en red Tailscale · `fail2ban` activo | ✅ Mitigado |
| T-002 | Thdora Bot | Spoofing | Suplantación de Alvaro en Telegram para ejecutar comandos | Baja | Alto | Whitelist de `chat_id` en Thdora · Solo responde a IDs autorizados | ✅ Mitigado |
| T-003 | GitHub repos | Tampering | Force-push a `main` borrando historial | Baja | Crítico | Branch protection activo en 3 repos (Fase 4) · `allow_force_pushes: false` | ✅ Mitigado |
| T-004 | GitHub repos | Tampering | Commit de secretos (tokens, IPs, emails) | Media | Alto | CI `validate-canon.yml` · Gitleaks en todos los repos activos | ✅ Mitigado |
| T-005 | Agente IA (Perplexity) | Tampering | Agente modifica archivos críticos sin autorización | Media | Alto | CODEOWNERS requiere review en rutas críticas · Plan de alineación define qué puede hacer el agente | ⚠️ Parcial |
| T-006 | Madre | Information Disclosure | Exposición de IPs, tokens o datos personales en repos públicos | Media | Alto | CI de secretos+IP+email · WIKI y VIDAPERSONAL en privado | ✅ Mitigado |
| T-007 | Ollama | Information Disclosure | Modelo LLM local expuesto a internet (:11434 sin auth) | Alta | Alto | UFW bloquea :11434 excepto Tailscale · Verificar con `nmap -p 11434 <IP-publica>` | ⚠️ Verificar |
| T-008 | Red local | Information Disclosure | Puerto 21 FTP abierto en router | Alta | Alto | HAL-006 abierto · Pendiente cierre en router | 🔴 Abierto |
| T-009 | Thdora Bot | Repudiation | Sin logs de comandos ejecutados por Thdora | Media | Medio | Añadir logging estructurado a Thdora con timestamp y chat_id | ⚠️ Pendiente |
| T-010 | GitHub CI | Denial of Service | Workflows maliciosos que consumen minutos de CI | Baja | Bajo | Workflows solo en `push` a `main` y PRs · Sin triggers externos | ✅ Mitigado |
| T-011 | Madre | Denial of Service | Disco lleno por logs o modelos Ollama | Media | Alto | Cron de limpieza `clean-root-artifacts` · `df -h` en health check | ⚠️ Parcial |
| T-012 | SSH | Elevation of Privilege | Escalada de privilegios desde usuario no-root a root en Madre | Baja | Crítico | `sudo` configurado con comandos específicos · ADR-006 (privilege management) | ⚠️ Verificar |
| T-013 | Docker | Elevation of Privilege | Escape de contenedor Docker hacia el host | Muy Baja | Crítico | Sin `--privileged` en contenedores · Sin socket Docker expuesto | ✅ Mitigado |
| T-014 | Tokens GitHub/Telegram | Information Disclosure | Token MCP o bot Telegram expuesto en historial git | Media | Crítico | HAL-001 y HAL-003 · Rotación de tokens documentada | ⚠️ Verificar rotación |

---

## Amenazas prioritarias (action required)

| ID | Amenaza | Acción inmediata |
|---|---|---|
| T-008 | Puerto 21 FTP abierto | Cerrar en router — ver [issue #15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) |
| T-007 | Ollama :11434 expuesto | `nmap -p 11434 <IP-publica>` — verificar que UFW bloquea |
| T-014 | Tokens sin rotación verificada | Verificar fecha de creación de tokens GitHub y Telegram |
| T-009 | Sin logging en Thdora | Añadir `logging.basicConfig` en Thdora con nivel INFO |

---

## Matriz de riesgo residual

```
             IMPACTO
             Bajo    Medio   Alto    Critico
Muy Baja  |        |        |        | T-013  |
Baja      | T-010  |        | T-002  | T-001* |
           |        |        | T-012* |        |
Media     |        | T-009  | T-005  | T-004  |
           |        |        | T-006* | T-014* |
           |        |        | T-011  |        |
Alta      |        |        | T-007* |        |
           |        |        | T-008  |        |

* = mitigado o en progreso
```

---

## Proceso de revisión

- **Frecuencia:** trimestral o tras cualquier incidente (HAL nuevo)
- **Responsable:** Alvaro Fernandez Mota
- **Trigger adicional:** nuevo servicio en Madre, nuevo repo público, nuevo agente con acceso MCP
- **Formato:** añadir fila a la tabla con ID correlativo, actualizar `actualizado:` en frontmatter

---

_Creado: 2026-07-06 · Fase 5 Plan de Alineación · Framework: [STRIDE](https://learn.microsoft.com/en-us/azure/security/develop/threat-modeling-tool-threats)_
