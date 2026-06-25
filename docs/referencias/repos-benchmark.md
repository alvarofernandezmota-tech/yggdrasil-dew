---
tags: [referencias, benchmark, ciberseguridad, gitops]
fecha: 2026-06-25
---

# Repositorios de Referencia — Benchmark Batcueva

> Repos que definen el estándar de la industria. Estudiarlos, no copiarlos.

---

## Arsenal de Ciberseguridad

| Repo | Uso en Batcueva |
|------|----------------|
| [SecLists](https://github.com/danielmiessler/SecLists) | Wordlists para fuzzing, fuerza bruta cámaras, credenciales. Clonar en `pentest/wordlists/` |
| [HackTricks](https://github.com/carlospolop/hacktricks) | Metodologías de auditoría. Referencia para `docs/adr/` |
| [PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings) | Payloads y bypass por tecnología |
| [TheHarvester](https://github.com/laramies/theHarvester) | OSINT: dominios, emails, nombres. Integrar en `scripts/` |
| [Nmap NSE Scripts](https://github.com/nmap/nmap/tree/master/scripts) | Leer código .nse para entender qué hace cada scan |

### Cómo integrar SecLists (recomendado)
```bash
# Como submodule (no ocupa espacio en el repo principal)
git submodule add https://github.com/danielmiessler/SecLists.git pentest/wordlists/SecLists
# Usar luego:
hydra -l admin -P pentest/wordlists/SecLists/Passwords/Default-Credentials/default-passwords.txt rtsp://IP
```

---

## Infraestructura y GitOps

| Repo | Lección clave |
|------|---------------|
| [Dockge](https://github.com/louislam/dockge) | UI visual para docker-compose. Ultra ligero. Puerto 5001 — ⚠️ cambiar a 5010 (conflicto con SpiderFoot) |
| [Coolify](https://github.com/coollabsio/coolify) | Deploy automático desde repo. Alternativa a Portainer |
| [ansible-collections](https://github.com/ansible-collections) | Cómo estructurar roles de Ansible |
| [awesome-selfhosted](https://github.com/awesome-selfhosted/awesome-selfhosted) | Mapa de todo el software open source para homelab |

---

## Documentación de Ingeniería

| Repo | Lección clave |
|------|---------------|
| [ADR templates](https://github.com/joelparkerhenderson/architecture-decision-record) | Formato estándar para ADRs (ya implementado en `docs/adr/`) |
| [OWASP Juice Shop](https://github.com/juice-shop/juice-shop) | Documentation-as-code, Dockerfiles limpios |

---

## Checklist de madurez del repo

- [ ] ¿Todo parametrizado con `.env`? (sin hardcode)
- [ ] ¿Un solo comando reconstruye todo? (`bc up` o `ansible-playbook bootstrap`)
- [ ] ¿YMLs validados en CI antes de hacer push? (GitHub Actions yamllint)
- [ ] ¿Hay ADR para cada decisión mayor? (`docs/adr/`)
- [ ] ¿Los volúmenes críticos están documentados? (nunca `down -v`)
- [ ] ¿Hay runbook de recuperación ante desastre?

---
_Compilado: Gemini + Perplexity — 2026-06-25_
