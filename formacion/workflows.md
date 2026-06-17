# ⚙️ Workflows / GitHub Actions

> Área de formación abierta: 17 junio 2026
> Estado: ⏳ Próximo — empezar tras Obsidian

---

## Por qué esto es prioritario

El problema real de hoy: el repo siempre está desactualizado porque actualizar a mano tiene fricción.

La solución no es solo Obsidian — es **automatización**:

| Herramienta | Qué automatiza |
|---|---|
| **Obsidian + plugin Git** | Sync diario del vault sin tocar terminal |
| **GitHub Actions** | Commits automáticos, CI/CD, notificaciones |
| **n8n** | Flujos complejos: diario nocturno, resúmenes |
| **Scripts bash** | `audit-repo.sh`, `daily-sync.sh` (ya creados) |

---

## Qué estoy aprendiendo

- GitHub Actions: sintaxis YAML, triggers, secrets, jobs
- Git avanzado: hooks, rebase, cherry-pick
- CI/CD con thdora: deploy automático en Madre
- Workflow diario: cómo mantener yggdrasil-dew vivo sin fricción

---

## Recursos

- [GitHub Actions docs](https://docs.github.com/en/actions)
- [thdora/.github/workflows/deploy.yml](https://github.com/alvarofernandezmota-tech/thdora/blob/main/.github/workflows/deploy.yml) ← ya tenemos uno real
- [setup/scripts/](../setup/scripts/) ← scripts ya creados

---

## Workflow objetivo (diario nocturno automático)

```yaml
# .github/workflows/diario-nocturno.yml
name: Diario nocturno
on:
  schedule:
    - cron: '0 23 * * *'   # 23:00 cada día
jobs:
  diario:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Crear entrada diario si no existe
        run: |
          TODAY=$(date '+%Y-%m-%d')
          FILE="diarios/${TODAY}.md"
          if [ ! -f "$FILE" ]; then
            cp diarios/_plantilla.md "$FILE"
            sed -i "s/FECHA/${TODAY}/g" "$FILE"
            git config user.email "bot@ygg"
            git config user.name "ygg-bot"
            git add "$FILE"
            git commit -m "diario: auto-create ${TODAY}"
            git push
          fi
```

---

## Dudas abiertas

- [ ] ¿Mejor n8n o GitHub Actions para el diario nocturno?
- [ ] ¿Cómo pasar context de thdora al diario automáticamente?
- [ ] ¿Plugin Git de Obsidian reemplaza daily-sync.sh o los dos conviven?
