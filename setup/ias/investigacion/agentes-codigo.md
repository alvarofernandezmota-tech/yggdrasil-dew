# Agentes de Código — Investigación
*Última actualización: pendiente — delegar a Grok/Mistral*

> ⏳ **Pendiente de rellenar.** Usar el prompt de investigación con Grok o Mistral.

## Herramientas a investigar

- [ ] **Aider** — open source, terminal, gratis + coste API
- [ ] **Claude Code** (Anthropic) — agente autónomo en terminal
- [ ] **Cursor Agent** — dentro del IDE Cursor
- [ ] **Copilot Workspace** (GitHub) — agente en PRs y issues
- [ ] **OpenCode** — emergente, open source
- [ ] **Mentat** — similar a Aider

## Dimensiones a cubrir

| Dimensión | Descripción |
|-----------|-------------|
| Qué hace | Capacidades reales |
| Precio | Coste mensual + coste API |
| Madurez | ¿Está listo para producción? |
| Scaffolding | ¿Puede generar un bot FastAPI+LangChain desde cero? |
| Veredicto | ¿Lo usamos en THDORA? |

## Recomendación preliminar

Empezar con **Aider** (gratuito, open source) antes de pagar por Claude Code. Hace el 90% de lo mismo con coste solo de API.

```bash
pip install aider-chat
aider --model claude-sonnet-4-5
```
